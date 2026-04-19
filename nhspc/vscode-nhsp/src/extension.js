const vscode = require('vscode');
const path = require('path');
const { execFile } = require('child_process');
const fs = require('fs');
const { NhspLanguageClient } = require('./lsp-client');

let diagnosticCollection;
let outputChannel;
let lspClient;

// Providers are registered before the LSP client starts; fetch the live client
// on every call so it can lazily attach once the server has spun up.
function getLspClient() { return lspClient; }

// ========== Activation ==========

function activate(context) {
    diagnosticCollection = vscode.languages.createDiagnosticCollection('nhsp');
    outputChannel = vscode.window.createOutputChannel('NHSP');
    context.subscriptions.push(diagnosticCollection, outputChannel);

    // Chat Participant & Language Model Tools
    try {
        const { registerChatParticipant } = require('./chat-participant');
        registerChatParticipant(context);
        const { registerLanguageModelTools } = require('./lm-tools');
        registerLanguageModelTools(context);
    } catch (e) {
        console.log('Chat/LM Tools API not available:', e.message);
    }

    // Commands
    context.subscriptions.push(
        vscode.commands.registerCommand('nhsp.compile', () => compile(false, false)),
        vscode.commands.registerCommand('nhsp.compileDll', () => compile(false, true)),
        vscode.commands.registerCommand('nhsp.compileDebug', () => compile(true, false)),
        vscode.commands.registerCommand('nhsp.compileDebugDll', () => compile(true, true)),
        vscode.commands.registerCommand('nhsp.run', () => compileAndRun())
    );

    // Auto-compile on save
    context.subscriptions.push(
        vscode.workspace.onDidSaveTextDocument((doc) => {
            if (doc.languageId === 'nhsp') compile(false, false, true);
        })
    );

    // Debug configuration provider
    context.subscriptions.push(
        vscode.debug.registerDebugConfigurationProvider('nhsp', new NhspDebugConfigProvider())
    );
    context.subscriptions.push(
        vscode.debug.registerDebugConfigurationProvider('clr', new NhspDebugConfigProvider())
    );

    // Debug command: compile with debug info then launch
    context.subscriptions.push(
        vscode.commands.registerCommand('nhsp.debug', () => compileAndDebug())
    );

    // Block auto-close: #func → Enter → auto-insert #endfunc
    context.subscriptions.push(
        vscode.workspace.onDidChangeTextDocument((e) => {
            if (e.document.languageId !== 'nhsp') return;
            for (const change of e.contentChanges) {
                if (change.text === '\n' || change.text === '\r\n') {
                    autoCloseBlock(e.document, change);
                }
            }
        })
    );

    // Completion / Hover / Definition providers.
    // Registered BEFORE the LSP client starts so their `lspClient` reference
    // is updated by reference once the server is up; `getLspClient()` fetches
    // the live instance each call.
    context.subscriptions.push(
        vscode.languages.registerCompletionItemProvider('nhsp', new NhspCompletionProvider(getLspClient), '.', '#')
    );
    context.subscriptions.push(
        vscode.languages.registerHoverProvider('nhsp', new NhspHoverProvider(getLspClient))
    );
    context.subscriptions.push(
        vscode.languages.registerDefinitionProvider('nhsp', new NhspDefinitionProvider(getLspClient))
    );

    // Language server (nhspls.exe) for real-time diagnostics.
    // Uses a separate diagnostic collection so it doesn't fight with the
    // compile-on-save pass.
    const cfg = vscode.workspace.getConfiguration('nhsp');
    if (cfg.get('languageServer.enabled') !== false) {
        const lspDiagnostics = vscode.languages.createDiagnosticCollection('nhspls');
        context.subscriptions.push(lspDiagnostics);
        lspClient = new NhspLanguageClient(outputChannel, lspDiagnostics);
        if (lspClient.start()) {
            // Push every already-open .nhsp document to the server.
            for (const doc of vscode.workspace.textDocuments)
                if (doc.languageId === 'nhsp') lspClient.didOpen(doc);

            context.subscriptions.push(
                vscode.workspace.onDidOpenTextDocument((doc) => lspClient.didOpen(doc)),
                vscode.workspace.onDidChangeTextDocument((e) => lspClient.didChange(e.document)),
                vscode.workspace.onDidCloseTextDocument((doc) => lspClient.didClose(doc))
            );
        }
    }
}

// ========== Block Auto-Close ==========

const BLOCK_PAIRS = {
    '#class': '#endclass',
    '#struct': '#endstruct',
    '#interface': '#endinterface',
    '#func': '#endfunc',
    '#init': '#endinit',
    '#property': '#endproperty',
    '#indexer': '#endindexer',
    '#operator': '#endoperator',
    '#destructor': '#enddestructor',
    '#enum': '#endenum',
    '#main': '#endmain',
};

function autoCloseBlock(document, change) {
    const lineNum = change.range.start.line;
    const lineText = document.lineAt(lineNum).text.trim();

    for (const [open, close] of Object.entries(BLOCK_PAIRS)) {
        if (lineText.startsWith(open) && !lineText.includes(close)) {
            // Check if close already exists below
            let hasClose = false;
            let depth = 0;
            for (let i = lineNum + 1; i < Math.min(lineNum + 50, document.lineCount); i++) {
                const t = document.lineAt(i).text.trim();
                if (t.startsWith(open)) depth++;
                if (t === close || t === close.substring(1)) { // with or without #
                    if (depth === 0) { hasClose = true; break; }
                    depth--;
                }
            }
            if (!hasClose) {
                const indent = document.lineAt(lineNum).text.match(/^(\s*)/)[1];
                const editor = vscode.window.activeTextEditor;
                if (editor) {
                    const insertPos = new vscode.Position(lineNum + 1, 0);
                    editor.edit(editBuilder => {
                        editBuilder.insert(insertPos, indent + '  \n' + indent + close + '\n');
                    }).then(() => {
                        // Move cursor to indented line
                        const newPos = new vscode.Position(lineNum + 1, indent.length + 2);
                        editor.selection = new vscode.Selection(newPos, newPos);
                    });
                }
            }
            break;
        }
    }
}

// ========== Completion Provider ==========

const NHSP_TYPES = [
    'int', 'int64', 'long', 'short', 'ushort', 'uint', 'ulong',
    'double', 'float', 'string', 'bool', 'byte', 'sbyte', 'char',
    'void', 'var', 'object', 'IntPtr', 'UIntPtr',
];

const NHSP_DOTNET_TYPES = [
    'List', 'Dictionary', 'HashSet', 'Queue', 'Stack',
    'StringBuilder', 'StreamReader', 'StreamWriter', 'MemoryStream',
    'DateTime', 'TimeSpan', 'Guid', 'Random', 'Stopwatch',
    'File', 'Path', 'Directory', 'Console', 'Environment', 'Process',
    'Math', 'Convert', 'Encoding', 'Regex',
    'Thread', 'Task', 'Timer', 'Mutex', 'Monitor',
    'Exception', 'ArgumentException', 'InvalidOperationException',
    'EventHandler', 'Action', 'Func', 'Nullable',
    'Type', 'Array', 'Enum', 'Delegate',
];

const NHSP_KEYWORDS = [
    'if', 'else', 'elseif', 'endif', 'repeat', 'loop', 'while', 'wend',
    'for', 'to', 'step', 'next', 'foreach', 'in', 'switch', 'case', 'default', 'endswitch',
    'break', 'continue', 'return', 'throw', 'try', 'catch', 'finally', 'endtry', 'when',
    'lock', 'endlock', 'using', 'endusing',
    'public', 'private', 'protected', 'static', 'virtual', 'override', 'abstract', 'sealed',
    'const', 'readonly', 'ref', 'out', 'params', 'new', 'dim', 'print', 'sleep',
    'null', 'nullptr', 'true', 'false', 'this', 'cnt', 'typeof',
    'is', 'as', 'and', 'or', 'not',
];

const NHSP_DIRECTIVES = [
    '#assembly', '#reference', '#using', '#namespace', '#endnamespace', '#include',
    '#class', '#endclass', '#struct', '#endstruct', '#interface', '#endinterface',
    '#enum', '#endenum', '#delegate',
    '#func', '#endfunc', '#init', '#endinit', '#field',
    '#property', '#endproperty', '#get', '#endget', '#set', '#endset',
    '#event', '#indexer', '#endindexer', '#operator', '#endoperator',
    '#destructor', '#enddestructor', '#main', '#endmain',
    '#dllimport', '#dllfunc', '#attribute', '#access',
];

// Member info for common .NET types (method/property name → description)
const MEMBER_DB = {
    'string': {
        'Length': { kind: 'property', type: 'int', doc: '文字列の長さ' },
        'ToUpper': { kind: 'method', type: 'string', doc: '大文字に変換', params: '' },
        'ToLower': { kind: 'method', type: 'string', doc: '小文字に変換', params: '' },
        'Contains': { kind: 'method', type: 'bool', doc: '文字列を含むか', params: 'string value' },
        'StartsWith': { kind: 'method', type: 'bool', doc: '指定文字列で始まるか', params: 'string value' },
        'EndsWith': { kind: 'method', type: 'bool', doc: '指定文字列で終わるか', params: 'string value' },
        'Substring': { kind: 'method', type: 'string', doc: '部分文字列', params: 'int startIndex[, int length]' },
        'Replace': { kind: 'method', type: 'string', doc: '文字列置換', params: 'string old, string new' },
        'Split': { kind: 'method', type: 'string[]', doc: '文字列分割', params: 'string separator' },
        'Trim': { kind: 'method', type: 'string', doc: '前後の空白を除去', params: '' },
        'IndexOf': { kind: 'method', type: 'int', doc: '文字列検索', params: 'string value' },
        'ToString': { kind: 'method', type: 'string', doc: '文字列表現', params: '' },
    },
    'List': {
        'Count': { kind: 'property', type: 'int', doc: '要素数' },
        'Add': { kind: 'method', type: 'void', doc: '要素を追加', params: 'T item' },
        'Remove': { kind: 'method', type: 'bool', doc: '要素を削除', params: 'T item' },
        'RemoveAt': { kind: 'method', type: 'void', doc: 'インデックスで削除', params: 'int index' },
        'Clear': { kind: 'method', type: 'void', doc: '全要素を削除', params: '' },
        'Contains': { kind: 'method', type: 'bool', doc: '要素を含むか', params: 'T item' },
        'IndexOf': { kind: 'method', type: 'int', doc: '要素の位置', params: 'T item' },
        'Sort': { kind: 'method', type: 'void', doc: 'ソート', params: '' },
        'ToArray': { kind: 'method', type: 'T[]', doc: '配列に変換', params: '' },
    },
    'Dictionary': {
        'Count': { kind: 'property', type: 'int', doc: '要素数' },
        'Add': { kind: 'method', type: 'void', doc: 'キーと値を追加', params: 'TKey key, TValue value' },
        'Remove': { kind: 'method', type: 'bool', doc: 'キーで削除', params: 'TKey key' },
        'ContainsKey': { kind: 'method', type: 'bool', doc: 'キーを含むか', params: 'TKey key' },
        'ContainsValue': { kind: 'method', type: 'bool', doc: '値を含むか', params: 'TValue value' },
        'TryGetValue': { kind: 'method', type: 'bool', doc: 'キーで値を取得', params: 'TKey key, out TValue value' },
        'Clear': { kind: 'method', type: 'void', doc: '全要素を削除', params: '' },
        'Keys': { kind: 'property', type: 'ICollection<TKey>', doc: 'キーのコレクション' },
        'Values': { kind: 'property', type: 'ICollection<TValue>', doc: '値のコレクション' },
    },
    'StringBuilder': {
        'Length': { kind: 'property', type: 'int', doc: '文字数' },
        'Append': { kind: 'method', type: 'StringBuilder', doc: '末尾に追加', params: 'string value' },
        'AppendLine': { kind: 'method', type: 'StringBuilder', doc: '末尾に改行付きで追加', params: 'string value' },
        'Insert': { kind: 'method', type: 'StringBuilder', doc: '位置を指定して挿入', params: 'int index, string value' },
        'Remove': { kind: 'method', type: 'StringBuilder', doc: '範囲を削除', params: 'int startIndex, int length' },
        'Replace': { kind: 'method', type: 'StringBuilder', doc: '文字列置換', params: 'string old, string new' },
        'Clear': { kind: 'method', type: 'StringBuilder', doc: '全消去', params: '' },
        'ToString': { kind: 'method', type: 'string', doc: '文字列に変換', params: '' },
    },
    'Math': {
        'Max': { kind: 'method', type: 'int/double', doc: '大きい方を返す', params: 'a, b' },
        'Min': { kind: 'method', type: 'int/double', doc: '小さい方を返す', params: 'a, b' },
        'Abs': { kind: 'method', type: 'int/double', doc: '絶対値', params: 'value' },
        'Sqrt': { kind: 'method', type: 'double', doc: '平方根', params: 'double d' },
        'Pow': { kind: 'method', type: 'double', doc: '累乗', params: 'double x, double y' },
        'PI': { kind: 'property', type: 'double', doc: '円周率 3.14159...' },
        'E': { kind: 'property', type: 'double', doc: 'ネイピア数 2.71828...' },
        'Floor': { kind: 'method', type: 'double', doc: '切り捨て', params: 'double d' },
        'Ceiling': { kind: 'method', type: 'double', doc: '切り上げ', params: 'double d' },
        'Round': { kind: 'method', type: 'double', doc: '四捨五入', params: 'double d' },
    },
    'Console': {
        'WriteLine': { kind: 'method', type: 'void', doc: '改行付き出力', params: 'string value' },
        'Write': { kind: 'method', type: 'void', doc: '出力 (改行なし)', params: 'string value' },
        'ReadLine': { kind: 'method', type: 'string', doc: '1行入力', params: '' },
        'Read': { kind: 'method', type: 'int', doc: '1文字入力', params: '' },
        'ReadKey': { kind: 'method', type: 'ConsoleKeyInfo', doc: 'キー入力', params: '' },
    },
    'File': {
        'ReadAllText': { kind: 'method', type: 'string', doc: 'ファイル全体を読む', params: 'string path' },
        'WriteAllText': { kind: 'method', type: 'void', doc: 'ファイルに書き込む', params: 'string path, string contents' },
        'Exists': { kind: 'method', type: 'bool', doc: 'ファイルが存在するか', params: 'string path' },
        'Delete': { kind: 'method', type: 'void', doc: 'ファイルを削除', params: 'string path' },
        'Copy': { kind: 'method', type: 'void', doc: 'ファイルをコピー', params: 'string src, string dest' },
        'ReadAllLines': { kind: 'method', type: 'string[]', doc: '全行を読む', params: 'string path' },
    },
    'DateTime': {
        'Now': { kind: 'property', type: 'DateTime', doc: '現在の日時' },
        'Today': { kind: 'property', type: 'DateTime', doc: '今日の日付' },
        'Year': { kind: 'property', type: 'int', doc: '年' },
        'Month': { kind: 'property', type: 'int', doc: '月' },
        'Day': { kind: 'property', type: 'int', doc: '日' },
        'Hour': { kind: 'property', type: 'int', doc: '時' },
        'Minute': { kind: 'property', type: 'int', doc: '分' },
        'Second': { kind: 'property', type: 'int', doc: '秒' },
        'ToString': { kind: 'method', type: 'string', doc: '書式指定で文字列化', params: 'string format' },
        'AddDays': { kind: 'method', type: 'DateTime', doc: '日数を加算', params: 'double days' },
    },
    'Thread': {
        'Start': { kind: 'method', type: 'void', doc: 'スレッド開始', params: '' },
        'Join': { kind: 'method', type: 'void', doc: 'スレッド完了待ち', params: '' },
        'Sleep': { kind: 'method', type: 'void', doc: 'スレッド停止 (static)', params: 'int ms' },
        'Name': { kind: 'property', type: 'string', doc: 'スレッド名' },
        'IsBackground': { kind: 'property', type: 'bool', doc: 'バックグラウンドスレッドか' },
        'IsAlive': { kind: 'property', type: 'bool', doc: '実行中か' },
        'ManagedThreadId': { kind: 'property', type: 'int', doc: 'スレッドID' },
        'CurrentThread': { kind: 'property', type: 'Thread', doc: '現在のスレッド (static)' },
    },
};

class NhspCompletionProvider {
    constructor(getClient) { this.getClient = getClient || (() => null); }

    async provideCompletionItems(document, position, token, context) {
        const items = [];
        const lineText = document.lineAt(position).text;
        const textBefore = lineText.substring(0, position.character);

        // Pull user-defined classes/interfaces (with doc comments) from LSP.
        // We merge these with the hardcoded type/keyword list rather than
        // returning LSP-only, because the server doesn't know about built-in
        // .NET types or language keywords. Skipped for the `#` trigger since
        // the local NHSP_DIRECTIVES list is authoritative and deduplicating
        // there is cheaper than asking nhspls for the same list.
        const trigger = context && context.triggerCharacter;
        const client = this.getClient();
        if (client && trigger !== '#' && !textBefore.endsWith('#')) {
            const lspResult = await client.completion(document, position, trigger);
            const lspItems = Array.isArray(lspResult) ? lspResult : (lspResult && lspResult.items) || [];
            const seen = new Set();
            for (const li of lspItems) {
                if (seen.has(li.label)) continue;
                seen.add(li.label);
                const kind = lspKindToVscode(li.kind);
                const ci = new vscode.CompletionItem(li.label, kind);
                if (li.detail) ci.detail = li.detail;
                if (li.documentation) {
                    const doc = typeof li.documentation === 'string'
                        ? li.documentation
                        : li.documentation.value || '';
                    if (doc) ci.documentation = new vscode.MarkdownString(doc);
                }
                items.push(ci);
            }
        }

        // After '#' → directive completion
        if (context.triggerCharacter === '#' || textBefore.endsWith('#')) {
            for (const d of NHSP_DIRECTIVES) {
                const item = new vscode.CompletionItem(d, vscode.CompletionItemKind.Keyword);
                item.insertText = d.substring(1); // remove # since it's already typed
                item.detail = 'NHSP directive';
                items.push(item);
            }
            return items;
        }

        // After '.' → member completion
        if (context.triggerCharacter === '.') {
            const varMatch = textBefore.match(/(\w+)\.$/);
            if (varMatch) {
                const varName = varMatch[1];
                const typeName = inferTypeFromDocument(document, position, varName);
                if (typeName && MEMBER_DB[typeName]) {
                    for (const [name, info] of Object.entries(MEMBER_DB[typeName])) {
                        const kind = info.kind === 'property'
                            ? vscode.CompletionItemKind.Property
                            : vscode.CompletionItemKind.Method;
                        const item = new vscode.CompletionItem(name, kind);
                        item.detail = `${info.type} (${typeName})`;
                        item.documentation = info.doc;
                        if (info.kind === 'method') {
                            item.insertText = new vscode.SnippetString(name + '($0)');
                        }
                        items.push(item);
                    }
                    return items;
                }
            }
        }

        // General completion: types + keywords
        for (const t of NHSP_TYPES) {
            const item = new vscode.CompletionItem(t, vscode.CompletionItemKind.TypeParameter);
            item.detail = 'NHSP type';
            items.push(item);
        }
        for (const t of NHSP_DOTNET_TYPES) {
            const item = new vscode.CompletionItem(t, vscode.CompletionItemKind.Class);
            item.detail = '.NET type';
            items.push(item);
        }
        for (const k of NHSP_KEYWORDS) {
            const item = new vscode.CompletionItem(k, vscode.CompletionItemKind.Keyword);
            items.push(item);
        }

        // Local variables and methods from current document
        const text = document.getText();
        const varPattern = /\b(dim\s+)?(\w+)\s+(\w+)\s*=/g;
        let m;
        while ((m = varPattern.exec(text)) !== null) {
            const name = m[3];
            if (!items.find(i => i.label === name)) {
                items.push(new vscode.CompletionItem(name, vscode.CompletionItemKind.Variable));
            }
        }
        const funcPattern = /#func\s+(?:public|private|static|virtual|override|abstract|\s)*(?:\w+\s+)?(\w+)/g;
        while ((m = funcPattern.exec(text)) !== null) {
            const name = m[1];
            if (!items.find(i => i.label === name)) {
                const item = new vscode.CompletionItem(name, vscode.CompletionItemKind.Function);
                item.insertText = new vscode.SnippetString(name + '($0)');
                items.push(item);
            }
        }

        return items;
    }
}

// Map LSP CompletionItemKind → vscode.CompletionItemKind.
// Only the kinds our server emits are listed; anything else falls back to Text.
function lspKindToVscode(kind) {
    switch (kind) {
        case 1:  return vscode.CompletionItemKind.Text;
        case 2:  return vscode.CompletionItemKind.Method;
        case 3:  return vscode.CompletionItemKind.Function;
        case 4:  return vscode.CompletionItemKind.Constructor;
        case 5:  return vscode.CompletionItemKind.Field;
        case 6:  return vscode.CompletionItemKind.Variable;
        case 7:  return vscode.CompletionItemKind.Class;
        case 8:  return vscode.CompletionItemKind.Interface;
        case 10: return vscode.CompletionItemKind.Property;
        case 13: return vscode.CompletionItemKind.Enum;
        case 14: return vscode.CompletionItemKind.Keyword;
        case 22: return vscode.CompletionItemKind.Struct;
        default: return vscode.CompletionItemKind.Text;
    }
}

function inferTypeFromDocument(document, position, varName) {
    const text = document.getText();
    // Look for dim Type varName or Type varName = ...
    const patterns = [
        new RegExp(`\\b(?:dim\\s+)?(\\w+)\\s+${varName}\\s*=`),
        new RegExp(`\\b(?:dim\\s+)?(\\w+)\\s+${varName}\\s*$`, 'm'),
        new RegExp(`\\b(?:dim\\s+)?(\\w+)\\s+${varName}\\s*,`),
    ];
    for (const p of patterns) {
        const m = p.exec(text);
        if (m) return m[1];
    }
    // Check for well-known static types
    if (MEMBER_DB[varName]) return varName;
    return null;
}

// ========== Hover Provider ==========

const TYPE_DOCS = {};
for (const t of NHSP_TYPES) TYPE_DOCS[t] = `NHSP プリミティブ型`;
for (const t of NHSP_DOTNET_TYPES) TYPE_DOCS[t] = `.NET Framework 型`;

class NhspHoverProvider {
    constructor(getClient) { this.getClient = getClient || (() => null); }

    async provideHover(document, position) {
        // LSP-backed hover takes precedence: it knows user-defined classes,
        // methods, fields, and doc comments (including cross-file via
        // #include / workspace scan / #reference XML).
        const client = this.getClient();
        if (client) {
            const result = await client.hover(document, position);
            if (result && result.contents) {
                const md = new vscode.MarkdownString(
                    typeof result.contents === 'string'
                        ? result.contents
                        : result.contents.value || ''
                );
                md.isTrusted = false;
                return new vscode.Hover(md);
            }
        }

        // Fallback: local type/keyword docs (no LSP or server has no answer).
        const range = document.getWordRangeAtPosition(position);
        if (!range) return null;
        const word = document.getText(range);

        // Directive hover
        if (word.startsWith('#') || (position.character > 0 && document.getText(new vscode.Range(position.line, position.character - 1, position.line, position.character)) === '#')) {
            const directive = '#' + word;
            const close = BLOCK_PAIRS[directive];
            if (close) {
                return new vscode.Hover(`**${directive}** — ブロック開始 (${close} で終了)`);
            }
        }

        // Type hover
        if (TYPE_DOCS[word]) {
            return new vscode.Hover(`**${word}** — ${TYPE_DOCS[word]}`);
        }

        // Member hover: check line for pattern like expr.member
        const lineText = document.lineAt(position).text;
        const beforeWord = lineText.substring(0, range.start.character);
        const dotMatch = beforeWord.match(/(\w+)\.$/);
        if (dotMatch) {
            const typeName = inferTypeFromDocument(document, position, dotMatch[1]) || dotMatch[1];
            if (MEMBER_DB[typeName] && MEMBER_DB[typeName][word]) {
                const info = MEMBER_DB[typeName][word];
                const sig = info.kind === 'method' ? `${info.type} ${word}(${info.params})` : `${info.type} ${word}`;
                return new vscode.Hover(`**${typeName}.${word}** — ${info.doc}\n\n\`${sig}\``);
            }
        }

        // Keyword hover
        const kwDocs = {
            'dim': '変数宣言 (省略可能)',
            'print': 'コンソール出力 (Console.WriteLine)',
            'sleep': 'スレッド停止 (Thread.Sleep)',
            'repeat': 'HSP形式ループ (cnt が自動カウンタ)',
            'foreach': 'コレクション反復 (IEnumerable)',
            'switch': '値による分岐 (自動break)',
            'lock': '排他制御 (Monitor.Enter/Exit)',
            'typeof': '型の Type オブジェクトを取得',
            'null': 'null リテラル',
            'nullptr': 'null リテラル (C++形式)',
        };
        if (kwDocs[word]) {
            return new vscode.Hover(`**${word}** — ${kwDocs[word]}`);
        }

        return null;
    }
}

// ========== Definition Provider ==========

class NhspDefinitionProvider {
    constructor(getClient) { this.getClient = getClient || (() => null); }

    async provideDefinition(document, position) {
        // LSP first — it knows cross-file resolution via #include / workspace.
        const client = this.getClient();
        if (client) {
            const result = await client.definition(document, position);
            if (result) {
                const locs = Array.isArray(result) ? result : [result];
                const out = [];
                for (const loc of locs) {
                    if (!loc || !loc.uri || !loc.range) continue;
                    const r = loc.range;
                    out.push(new vscode.Location(
                        vscode.Uri.parse(loc.uri),
                        new vscode.Range(r.start.line, r.start.character, r.end.line, r.end.character)
                    ));
                }
                if (out.length > 0) return out;
            }
        }

        const range = document.getWordRangeAtPosition(position);
        if (!range) return null;
        const word = document.getText(range);

        const text = document.getText();
        // Search for #class ClassName, #func MethodName, #field Name, etc.
        const patterns = [
            new RegExp(`#class\\s+(?:public\\s+|private\\s+|sealed\\s+|abstract\\s+)*${word}\\b`),
            new RegExp(`#func\\s+(?:public\\s+|private\\s+|static\\s+|virtual\\s+|override\\s+|abstract\\s+)*(?:\\w+\\s+)?${word}\\b`),
            new RegExp(`#field\\s+(?:public\\s+|private\\s+|static\\s+|const\\s+|readonly\\s+)*(?:\\w+\\s+)?${word}\\b`),
            new RegExp(`#init\\b`),
            new RegExp(`#struct\\s+(?:public\\s+)?${word}\\b`),
            new RegExp(`#interface\\s+${word}\\b`),
            new RegExp(`#enum\\s+${word}\\b`),
            new RegExp(`#delegate\\s+(?:public\\s+)?(?:\\w+\\s+)?${word}\\b`),
        ];

        for (const p of patterns) {
            const m = p.exec(text);
            if (m) {
                const pos = document.positionAt(m.index);
                return new vscode.Location(document.uri, pos);
            }
        }

        // Search in all .nhsp files in workspace
        const files = vscode.workspace.findFiles('**/*.nhsp', null, 50);
        return files.then(uris => {
            for (const uri of uris) {
                if (uri.fsPath === document.uri.fsPath) continue;
                try {
                    const content = fs.readFileSync(uri.fsPath, 'utf8');
                    for (const p of patterns) {
                        const m = p.exec(content);
                        if (m) {
                            const lines = content.substring(0, m.index).split('\n');
                            const line = lines.length - 1;
                            const col = lines[lines.length - 1].length;
                            return new vscode.Location(uri, new vscode.Position(line, col));
                        }
                    }
                } catch (e) { }
            }
            return null;
        });
    }
}

// ========== Helpers ==========

// Push -target / -subsystem / -r / -win32icon onto an argv list based on
// current workspace configuration. Call this for every compile path (compile,
// compileAndRun, compileAndDebug, NhspDebugConfigProvider) so the options stay
// in sync across all entry points.
function appendCommonOptions(args, cfg, outExt) {
    const target = (cfg.get('target') || 'auto').toLowerCase();
    if (target === 'exe' || target === 'dll') args.push('-target', target);

    if (outExt === '.exe') {
        const subsystem = (cfg.get('subsystem') || 'console').toLowerCase();
        if (subsystem === 'windows') args.push('-subsystem', 'windows');
    }

    const refs = cfg.get('references') || [];
    if (Array.isArray(refs)) for (const r of refs) if (r) args.push('-r', r);

    const icon = cfg.get('win32icon');
    if (icon) args.push('-win32icon', icon);
}

function splitArgs(s) {
    if (!s) return [];
    const out = [];
    let cur = '';
    let inQ = false;
    for (let i = 0; i < s.length; i++) {
        const ch = s[i];
        if (ch === '"') { inQ = !inQ; continue; }
        if (!inQ && (ch === ' ' || ch === '\t')) {
            if (cur.length > 0) { out.push(cur); cur = ''; }
            continue;
        }
        cur += ch;
    }
    if (cur.length > 0) out.push(cur);
    return out;
}

// ========== Debug ==========

class NhspDebugConfigProvider {
    async resolveDebugConfiguration(folder, config, token) {
        const editor = vscode.window.activeTextEditor;
        if (!editor || editor.document.languageId !== 'nhsp') return config;

        const sourceFile = editor.document.uri.fsPath;
        const sourceDir = path.dirname(sourceFile);
        const baseName = path.basename(sourceFile, '.nhsp');
        const exePath = path.join(sourceDir, baseName + '.exe');

        // Auto-compile with debug info before launching
        const compilerPath = findCompiler();
        if (compilerPath) {
            await editor.document.save();
            outputChannel.clear();
            outputChannel.appendLine(`[Debug] Compiling ${baseName}.nhsp with debug info...`);
            outputChannel.show(true);

            const cfg = vscode.workspace.getConfiguration('nhsp');
            const platform = (cfg.get('platform') || 'anycpu').toLowerCase();
            const provArgs = [sourceFile, '-o', exePath, '-debug', '-platform', platform];
            appendCommonOptions(provArgs, cfg, '.exe');
            const ok = await new Promise((resolve) => {
                execFile(compilerPath, provArgs,
                    { cwd: sourceDir, timeout: 30000 }, (error, stdout, stderr) => {
                    const output = (stdout || '') + (stderr || '');
                    outputChannel.appendLine(output);
                    diagnosticCollection.clear();
                    const diags = parseDiagnostics(output, sourceFile);
                    if (diags.length > 0) diagnosticCollection.set(vscode.Uri.file(sourceFile), diags);
                    const errors = diags.filter(d => d.severity === vscode.DiagnosticSeverity.Error).length;
                    if (error || errors > 0) {
                        outputChannel.appendLine('\n[Debug] Compile FAILED');
                        vscode.window.showErrorMessage('NHSP: Compile failed.');
                        resolve(false);
                    } else {
                        outputChannel.appendLine(`[Debug] Compile OK: ${exePath}`);
                        resolve(true);
                    }
                });
            });

            if (!ok) return undefined; // Cancel debug

            // Convert Windows PDB to Portable PDB for VS Code debugging
            const pdbConverter = findPdbConverter();
            const pdbPath = exePath.replace(/\.exe$/i, '.pdb');
            if (pdbConverter && fs.existsSync(pdbPath)) {
                outputChannel.appendLine(`[Debug] Converting PDB to Portable format...`);
                // Wait a moment for nhspc to release the file
                await new Promise(r => setTimeout(r, 500));
                const portablePdb = pdbPath + '.portable';
                await new Promise((resolve) => {
                    execFile(pdbConverter, [exePath, '-o', portablePdb], { cwd: sourceDir, timeout: 15000 }, (err2, out2, err2b) => {
                        if (err2) {
                            outputChannel.appendLine(`[Debug] PDB conversion failed (breakpoints may not work): ${(out2||'')+(err2b||'')}`);
                        } else {
                            // Replace original PDB with portable version
                            try {
                                if (fs.existsSync(pdbPath)) fs.unlinkSync(pdbPath);
                                fs.renameSync(portablePdb, pdbPath);
                                outputChannel.appendLine(`[Debug] PDB converted to Portable format`);
                            } catch (e3) {
                                // If rename fails, copy instead
                                try {
                                    fs.copyFileSync(portablePdb, pdbPath);
                                    fs.unlinkSync(portablePdb);
                                    outputChannel.appendLine(`[Debug] PDB converted to Portable format`);
                                } catch (e4) {
                                    outputChannel.appendLine(`[Debug] PDB replace failed: ${e4.message}`);
                                }
                            }
                        }
                        resolve();
                    });
                });
            }
        }

        // Set up debug config
        if (!config.type || config.type === 'nhsp') {
            config.type = 'clr';
        }
        if (!config.request) config.request = 'launch';
        if (!config.name) config.name = 'NHSP Debug';
        if (!config.program) config.program = exePath;
        if (!config.cwd) config.cwd = sourceDir;
        if (config.args === undefined) {
            const cfg = vscode.workspace.getConfiguration('nhsp');
            const debugArgsStr = cfg.get('debugArguments') || '';
            config.args = splitArgs(debugArgsStr);
        }

        return config;
    }

    provideDebugConfigurations(folder, token) {
        return [
            {
                type: 'clr',
                request: 'launch',
                name: 'NHSP Debug',
                program: '${workspaceFolder}/${fileBasenameNoExtension}.exe',
                cwd: '${workspaceFolder}'
            }
        ];
    }
}

async function compileAndDebug() {
    const editor = vscode.window.activeTextEditor;
    if (!editor || editor.document.languageId !== 'nhsp') return;

    const sourceText = editor.document.getText();
    if (!sourceText.includes('#main') && !sourceText.match(/#assembly\s+"[^"]+"\s*,\s*exe/)) {
        vscode.window.showWarningMessage('NHSP: デバッグには #main ブロック (EXE) が必要です。');
        return;
    }

    await editor.document.save();

    const compilerPath = findCompiler();
    if (!compilerPath) return;

    const sourceFile = editor.document.uri.fsPath;
    const sourceDir = path.dirname(sourceFile);
    const baseName = path.basename(sourceFile, '.nhsp');
    const exePath = path.join(sourceDir, baseName + '.exe');

    // Compile with debug info
    const cfg = vscode.workspace.getConfiguration('nhsp');
    const platform = (cfg.get('platform') || 'anycpu').toLowerCase();
    const debugArgsStr = cfg.get('debugArguments') || '';
    const args = [sourceFile, '-o', exePath, '-debug', '-platform', platform];
    appendCommonOptions(args, cfg, '.exe');
    outputChannel.clear();
    outputChannel.appendLine(`> nhspc ${args.join(' ')}`);
    outputChannel.show(true);

    return new Promise((resolve) => {
        execFile(compilerPath, args, { cwd: sourceDir, timeout: 30000 }, (error, stdout, stderr) => {
            const output = (stdout || '') + (stderr || '');
            outputChannel.appendLine(output);

            diagnosticCollection.clear();
            const diagnostics = parseDiagnostics(output, sourceFile);
            if (diagnostics.length > 0) diagnosticCollection.set(vscode.Uri.file(sourceFile), diagnostics);

            const errorCount = diagnostics.filter(d => d.severity === vscode.DiagnosticSeverity.Error).length;

            if (!error && errorCount === 0) {
                outputChannel.appendLine(`\nCompile OK (Debug): ${exePath}\nStarting debugger...`);

                // Launch the debugger
                vscode.debug.startDebugging(undefined, {
                    type: 'clr',
                    request: 'launch',
                    name: 'NHSP Debug',
                    program: exePath,
                    cwd: sourceDir,
                    args: splitArgs(debugArgsStr)
                });
            } else {
                vscode.window.showErrorMessage('NHSP: Compile failed, cannot debug.');
                outputChannel.appendLine('\nCompile FAILED');
            }
            resolve();
        });
    });
}

// ========== Compiler ==========

function findCompiler() {
    const config = vscode.workspace.getConfiguration('nhsp');
    const configPath = config.get('compilerPath');
    if (configPath && fs.existsSync(configPath)) return configPath;

    // Check extension's bundled compiler first
    const extDir = path.join(__dirname, '..');
    const bundled = path.join(extDir, 'compiler', 'nhspc.exe');
    if (fs.existsSync(bundled)) return bundled;

    // Search workspace
    const workspaceFolders = vscode.workspace.workspaceFolders;
    if (workspaceFolders) {
        for (const folder of workspaceFolders) {
            const candidates = [
                path.join(folder.uri.fsPath, 'nhspc.exe'),
                path.join(folder.uri.fsPath, 'nhspc', 'nhspc', 'bin', 'Debug', 'nhspc.exe'),
                path.join(folder.uri.fsPath, 'nhspc', 'nhspc', 'bin', 'Release', 'nhspc.exe'),
                path.join(folder.uri.fsPath, '..', 'nhspc', 'nhspc', 'bin', 'Debug', 'nhspc.exe'),
            ];
            for (const c of candidates) {
                if (fs.existsSync(c)) return c;
            }
        }
    }

    vscode.window.showErrorMessage('nhspc.exe not found. Set nhsp.compilerPath in settings, or re-run install.bat.');
    return null;
}

function findPdbConverter() {
    // Check extension's bundled converter
    const extDir = path.join(__dirname, '..');
    const bundled = path.join(extDir, 'compiler', 'Pdb2PortablePdb.exe');
    if (fs.existsSync(bundled)) return bundled;

    // Search workspace
    const workspaceFolders = vscode.workspace.workspaceFolders;
    if (workspaceFolders) {
        for (const folder of workspaceFolders) {
            const candidates = [
                path.join(folder.uri.fsPath, 'Pdb2PortablePdb.exe'),
                path.join(folder.uri.fsPath, 'nhspc', 'Pdb2PortablePdb', 'bin', 'Debug', 'net48', 'Pdb2PortablePdb.exe'),
            ];
            for (const c of candidates) {
                if (fs.existsSync(c)) return c;
            }
        }
    }
    return null;
}

function compile(debug = false, forceDll = false, silent = false) {
    const editor = vscode.window.activeTextEditor;
    if (!editor || editor.document.languageId !== 'nhsp') {
        if (!silent) vscode.window.showWarningMessage('No NHSP file is open.');
        return;
    }

    editor.document.save().then(() => {
        const compilerPath = findCompiler();
        if (!compilerPath) return;

        const sourceFile = editor.document.uri.fsPath;
        const sourceDir = path.dirname(sourceFile);
        const baseName = path.basename(sourceFile, '.nhsp');

        const config = vscode.workspace.getConfiguration('nhsp');
        const outDir = config.get('outputDirectory') || sourceDir;

        // Determine output: DLL or EXE
        let ext = '.dll';
        const sourceText = editor.document.getText();
        if (!forceDll && (sourceText.includes('#main') || sourceText.match(/#assembly\s+"[^"]+"\s*,\s*exe/))) {
            ext = '.exe';
        }

        const outputFile = path.join(outDir, baseName + ext);
        const args = [sourceFile, '-o', outputFile];
        if (debug) args.push('-debug');
        const platform = (config.get('platform') || 'anycpu').toLowerCase();
        args.push('-platform', platform);
        appendCommonOptions(args, config, ext);

        if (!silent) {
            outputChannel.clear();
            outputChannel.appendLine(`> nhspc ${args.join(' ')}`);
            outputChannel.show(true);
        }

        execFile(compilerPath, args, { cwd: sourceDir, timeout: 30000 }, (error, stdout, stderr) => {
            const output = (stdout || '') + (stderr || '');
            if (!silent) outputChannel.appendLine(output);

            diagnosticCollection.clear();
            const diagnostics = parseDiagnostics(output, sourceFile);
            if (diagnostics.length > 0) {
                diagnosticCollection.set(vscode.Uri.file(sourceFile), diagnostics);
            }

            const errorCount = diagnostics.filter(d => d.severity === vscode.DiagnosticSeverity.Error).length;
            const warnCount = diagnostics.filter(d => d.severity === vscode.DiagnosticSeverity.Warning).length;

            if (error || errorCount > 0) {
                if (!silent) {
                    vscode.window.showErrorMessage(`NHSP: Compile failed (${errorCount} error${errorCount !== 1 ? 's' : ''})`);
                    outputChannel.appendLine('\nCompile FAILED');
                }
            } else {
                if (!silent) {
                    const typeStr = ext === '.dll' ? 'DLL' : 'EXE';
                    vscode.window.showInformationMessage(
                        `NHSP: ${typeStr} compiled → ${path.basename(outputFile)}` +
                        (warnCount > 0 ? ` (${warnCount} warning${warnCount !== 1 ? 's' : ''})` : '')
                    );
                    outputChannel.appendLine(`\nCompile OK (${typeStr}): ${outputFile}`);
                }
            }
        });
    });
}

function compileAndRun() {
    const editor = vscode.window.activeTextEditor;
    if (!editor || editor.document.languageId !== 'nhsp') return;

    const sourceText = editor.document.getText();
    if (!sourceText.includes('#main') && !sourceText.match(/#assembly\s+"[^"]+"\s*,\s*exe/)) {
        vscode.window.showWarningMessage('NHSP: #main ブロックがないため実行できません。DLL をビルドするには F5 を使用してください。');
        return;
    }

    editor.document.save().then(() => {
        const compilerPath = findCompiler();
        if (!compilerPath) return;

        const sourceFile = editor.document.uri.fsPath;
        const sourceDir = path.dirname(sourceFile);
        const baseName = path.basename(sourceFile, '.nhsp');
        const outputFile = path.join(sourceDir, baseName + '.exe');
        const config = vscode.workspace.getConfiguration('nhsp');
        const platform = (config.get('platform') || 'anycpu').toLowerCase();
        const runArgs = config.get('runArguments') || '';
        const args = [sourceFile, '-o', outputFile, '-platform', platform];
        appendCommonOptions(args, config, '.exe');

        outputChannel.clear();
        outputChannel.appendLine(`> nhspc ${args.join(' ')}`);
        outputChannel.show(true);

        execFile(compilerPath, args, { cwd: sourceDir, timeout: 30000 }, (error, stdout, stderr) => {
            outputChannel.appendLine((stdout || '') + (stderr || ''));
            diagnosticCollection.clear();
            const diagnostics = parseDiagnostics((stdout || '') + (stderr || ''), sourceFile);
            if (diagnostics.length > 0) diagnosticCollection.set(vscode.Uri.file(sourceFile), diagnostics);

            if (!error && diagnostics.filter(d => d.severity === vscode.DiagnosticSeverity.Error).length === 0) {
                outputChannel.appendLine(`\nRunning: ${outputFile} ${runArgs}\n${'='.repeat(50)}`);
                const terminal = vscode.window.createTerminal('NHSP Run');
                terminal.show();
                terminal.sendText(runArgs ? `"${outputFile}" ${runArgs}` : `"${outputFile}"`);
            } else {
                vscode.window.showErrorMessage('NHSP: Compile failed.');
            }
        });
    });
}

function parseDiagnostics(output, sourceFile) {
    const diagnostics = [];
    const pattern = /\((\d+),(\d+)\): (error|warning|info): (.*)/g;
    let match;
    while ((match = pattern.exec(output)) !== null) {
        const line = Math.max(0, parseInt(match[1]) - 1);
        const col = Math.max(0, parseInt(match[2]));
        const severity = match[3] === 'error' ? vscode.DiagnosticSeverity.Error
            : match[3] === 'warning' ? vscode.DiagnosticSeverity.Warning
            : vscode.DiagnosticSeverity.Information;
        const range = new vscode.Range(line, col, line, col + 1);
        const diag = new vscode.Diagnostic(range, match[4], severity);
        diag.source = 'nhspc';
        diagnostics.push(diag);
    }
    return diagnostics;
}

function deactivate() {
    if (lspClient) {
        try { lspClient.stop(); } catch (e) { /* ignore */ }
        lspClient = null;
    }
    if (diagnosticCollection) diagnosticCollection.dispose();
    if (outputChannel) outputChannel.dispose();
}

module.exports = { activate, deactivate };
