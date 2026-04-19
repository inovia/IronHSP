// Standalone smoke test for `../src/lsp-client.js`.
// Mocks just enough of the vscode module API to construct a client,
// then drives hover/completion/definition against the real nhspls.exe.
//
// Run: node test/test-lsp-client.js

const Module = require('module');
const path = require('path');
const fs = require('fs');

// ---- Mock vscode module ----
const mockUri = {
    parse: (s) => ({ toString: () => s, fsPath: s.replace(/^file:\/+/, '').replace(/\//g, path.sep) })
};

const mockVscode = {
    Uri: mockUri,
    Range: class { constructor(a, b, c, d) { this.startLine = a; this.startCh = b; this.endLine = c; this.endCh = d; } },
    Diagnostic: class { constructor(r, m, s) { this.range = r; this.message = m; this.severity = s; } },
    DiagnosticSeverity: { Error: 1, Warning: 2, Information: 3, Hint: 4 },
    workspace: { workspaceFolders: null },
};

const origResolve = Module._resolveFilename;
Module._resolveFilename = function (req, parent) {
    if (req === 'vscode') return require.resolve('./_vscode-stub.js');
    return origResolve.apply(this, arguments);
};

// Write the stub to a real file so Node's require cache can find it.
fs.writeFileSync(
    path.join(__dirname, '_vscode-stub.js'),
    `module.exports = ${JSON.stringify(null)};` // placeholder; we override via cache below
);

// Prime the require cache with the mock so any `require('vscode')` returns it.
require.cache[require.resolve('./_vscode-stub.js')] = {
    id: require.resolve('./_vscode-stub.js'),
    filename: require.resolve('./_vscode-stub.js'),
    loaded: true,
    exports: mockVscode,
    children: [],
    paths: []
};

// ---- Load the real client ----
const { NhspLanguageClient } = require('../src/lsp-client');

const outputChannel = { appendLine: (s) => console.log('[out]', s) };
const diagnostics = { set: () => {} };

const HERE = path.resolve(__dirname, '..', '..', 'samples', 'include_demo');
const NHSPLS = path.resolve(__dirname, '..', '..', 'NhspLanguageServer', 'bin', 'Release', 'net48', 'nhspls.exe');
const APP = path.join(HERE, 'app.nhsp');

if (!fs.existsSync(NHSPLS)) { console.error('nhspls.exe not found:', NHSPLS); process.exit(2); }
if (!fs.existsSync(APP))    { console.error('app.nhsp not found:',   APP);    process.exit(2); }

// Monkeypatch workspaceFolders to enable Phase B.
mockVscode.workspace.workspaceFolders = [{
    uri: { toString: () => 'file:///' + HERE.replace(/\\/g, '/') },
    name: 'include_demo'
}];

// Override server discovery to point at our real build.
const proto = NhspLanguageClient.prototype;
const origFind = proto._findServer;
proto._findServer = function () { return NHSPLS; };

function openDoc(client, absPath) {
    const text = fs.readFileSync(absPath, 'utf8');
    const uri = 'file:///' + absPath.replace(/\\/g, '/');
    const fakeDoc = {
        uri: { toString: () => uri },
        languageId: 'nhsp',
        version: 1,
        getText: () => text
    };
    client.didOpen(fakeDoc);
    return { text, fakeDoc };
}

// Find first non-comment occurrence of `sym` as a whole word.
function locate(text, sym) {
    const lines = text.split('\n');
    for (let i = 0; i < lines.length; i++) {
        const stripped = lines[i].replace(/^\s+/, '');
        if (stripped.startsWith(';') || stripped.startsWith('//')) continue;
        const re = new RegExp('\\b' + sym + '\\b');
        const m = re.exec(lines[i]);
        if (m) return { line: i, character: m.index + 1 };
    }
    return null;
}

async function expectHover(client, fakeDoc, text, sym, keyword) {
    const pos = locate(text, sym);
    if (!pos) return `  [FAIL] ${sym}: not found in source`;
    const result = await client.hover(fakeDoc, pos);
    const md = result && result.contents
        ? (typeof result.contents === 'string' ? result.contents : result.contents.value || '')
        : '';
    if (md.includes(keyword))
        return `  [OK]   hover ${sym.padEnd(10)}: contains '${keyword}'`;
    return `  [FAIL] hover ${sym.padEnd(10)}: expected '${keyword}' in:\n${md}`;
}

async function main() {
    const client = new NhspLanguageClient(outputChannel, diagnostics);
    if (!client.start()) { console.error('failed to start'); process.exit(3); }

    // Open all probe files (matches the Python E2E).
    const appDoc = openDoc(client, APP);
    const bDoc = openDoc(client, path.join(HERE, 'app_b_probe.nhsp'));
    const cDoc = openDoc(client, path.join(HERE, 'c_test', 'app_c_probe.nhsp'));

    // Small delay so the initialized → ScanWorkspace path has time to complete.
    await new Promise(r => setTimeout(r, 500));

    const checks = [
        // Phase A — #include
        ['Vec2',     '2D vector',         appDoc],
        ['Mag2',     'Euclidean-ish',     appDoc],
        ['Clamp',    'Clamps an integer', appDoc],
        // Phase B — workspace scan (no #include)
        ['Extras',   'workspace scan',    bDoc],
        // Phase C — #reference + XML
        ['Currency', 'Currency helpers',  cDoc],
        ['Dollars',  'cents to major',    cDoc],
    ];

    let fails = 0;
    for (const [sym, kw, doc] of checks) {
        const line = await expectHover(client, doc.fakeDoc, doc.text, sym, kw);
        console.log(line);
        if (line.startsWith('  [FAIL]')) fails++;
    }

    client.stop();
    process.exit(fails === 0 ? 0 : 1);
}

main().catch(e => { console.error(e); process.exit(99); });
