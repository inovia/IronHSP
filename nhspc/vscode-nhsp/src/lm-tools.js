const vscode = require('vscode');

// ========== NHSP Language Spec (compact version for tool responses) ==========

const NHSP_SYNTAX_REFERENCE = {
    directives: {
        '#assembly "Name" [, exe]': 'Assembly name. Add ", exe" for executable output.',
        '#class [public|private] [sealed|abstract] Name [: Base, IFace]': 'Class definition. End with #endclass.',
        '#struct [public] Name [, Sequential|Explicit] [, Pack=N]': 'Value type (struct). End with #endstruct.',
        '#interface Name': 'Interface. End with #endinterface.',
        '#enum Name': 'Enum type. Members one per line. End with #endenum.',
        '#delegate [public] RetType Name [, params]': 'Delegate type definition.',
        '#func [mods] [RetType] Name [, Type param, ...]': 'Method. End with #endfunc. Abstract methods have no body.',
        '#init [params]': 'Constructor. End with #endinit. "#init static" for static constructor.',
        '#destructor': 'Finalizer. End with #enddestructor.',
        '#field [mods] Type Name [= value]': 'Field. Mods: public/private/static/const/readonly.',
        '#property Name as Type': 'Property with #get/#set blocks. End with #endproperty.',
        '#event [mods] DelegateType Name': 'Event declaration.',
        '#indexer [mods] Type [, params]': 'Indexer (this[]). End with #endindexer.',
        '#operator RetType Op, params': 'Operator overload (+,-,*,/,==,implicit,explicit). End with #endoperator.',
        '#dllimport "dll" [, CharSet=X, SetLastError=true, CallingConvention=Y]': 'P/Invoke DLL declaration.',
        '#dllfunc [mods] RetType Name ["EntryPoint"] [, params]': 'P/Invoke function. No body needed.',
        '#main': 'Entry point (EXE). End with #endmain.',
        '#include "file.nhsp"': 'Include another source file.',
        '#reference "lib.dll"': 'Reference external assembly.',
        '#namespace "NS"': 'Namespace. End with #endnamespace.',
        '#attribute Name, "value"': 'Custom attribute (COM: Guid, ComVisible, ClassInterface, etc.).',
    },
    types: {
        'int': 'System.Int32 (4 bytes)',
        'long/int64': 'System.Int64 (8 bytes)',
        'double': 'System.Double (8 bytes)',
        'float': 'System.Single (4 bytes)',
        'string': 'System.String',
        'bool': 'System.Boolean',
        'byte/sbyte': 'System.Byte/SByte (1 byte)',
        'short/ushort': 'System.Int16/UInt16 (2 bytes)',
        'uint/ulong': 'System.UInt32/UInt64',
        'char': 'System.Char (2 bytes)',
        'IntPtr/UIntPtr': 'Pointer-sized integer',
        'var/object': 'System.Object',
        'Type?': 'Nullable<Type>',
        'Type[]': 'Array of Type',
        'List<T>': 'Generic list (and other System.Collections.Generic types)',
    },
    controlFlow: {
        'if cond ... [elseif ...] [else ...] endif': 'Conditional. Brace style {  } also supported. = is == in conditions.',
        'repeat [N] ... loop': 'HSP-style loop. cnt is auto counter (0, 1, 2, ...).',
        'for i = start to end [step N] ... next': 'For loop.',
        'while cond ... wend': 'While loop.',
        'foreach [Type] var in collection ... next': 'Foreach over IEnumerable.',
        'switch expr ... case val ... default ... endswitch': 'Switch with auto-break.',
        'try ... catch [Type var] [when cond] ... finally ... #endtry': 'Exception handling. Multiple catch supported.',
        'lock obj ... endlock': 'Monitor.Enter/Exit.',
        'using var = expr ... endusing': 'IDisposable auto-Dispose.',
    },
    operators: [
        'Unary: - ! ~ (bitwise NOT)',
        'Arithmetic: + - * / %',
        'Shift: << >>',
        'Comparison: < > <= >= is as',
        'Equality: == != (= is == in conditions)',
        'Bitwise: & ^ |',
        'Logical: && || (and or not)',
        'Null coalescing: ??',
        'Ternary: cond ? a : b',
        'Assignment: = += -= *= /= &= |= ^=',
        'Increment: ++ --',
    ],
    builtins: {
        'print expr': 'Console.WriteLine(expr)',
        'sleep ms': 'Thread.Sleep(ms)',
        'str(x)': 'x.ToString()',
        'int(s)': 'int.Parse(s)',
        'double(s)': 'double.Parse(s)',
        'typeof(Type)': 'Type object',
        '$"Hello {name}"': 'String interpolation',
        'null / nullptr': 'Null literal',
        'a = 1 : b = 2': 'Colon separator (HSP style)',
        'long line \\': 'Line continuation (HSP style)',
    },
};

// ========== C# → NHSP Conversion Knowledge ==========

const CSHARP_TO_NHSP_RULES = `
Key C# to NHSP conversion rules:
- class Foo { } → #class public Foo ... #endclass
- struct Foo { } → #struct public Foo, Sequential ... #endstruct
- interface IFoo { } → #interface IFoo ... #endinterface
- enum Foo { A, B } → #enum Foo / A / B / #endenum
- delegate void D(int x) → #delegate public void D, int x
- public int Method(int a) { } → #func public int Method, int a ... #endfunc
- Foo(int x) { } → #init int x ... #endinit
- ~Foo() { } → #destructor ... #enddestructor
- public int Prop { get; set; } → #property Prop as int / #get ... #endget / #set ... #endset / #endproperty
- public event EventHandler E; → #event public EventHandler E
- [DllImport("x.dll")] static extern → #dllimport "x.dll" / #dllfunc ...
- [StructLayout(LayoutKind.Sequential, Pack=2)] → #struct Name, Sequential, Pack = 2
- [MarshalAs(UnmanagedType.LPWStr)] → [MarshalAs LPWStr] or [LPWStr]
- int x = 42; → int x = 42  or  dim int x = 42 (dim is optional)
- No semicolons needed (newline = statement end)
- No parentheses on if/while conditions: if x > 0 (not if (x > 0))
- = in conditions means == (HSP compatibility)
- for(int i=0; i<10; i++) → for i = 0 to 9 / next
- foreach(var x in list) → foreach x in list / next
- switch with auto-break (no fall-through)
`;

// ========== Tool Implementations ==========

class NhspSpecTool {
    async invoke(options, token) {
        const topic = options.input?.topic || 'all';
        let result = '';

        if (topic === 'all' || topic === 'overview') {
            result += '# NHSP Language Overview\n\n';
            result += 'NHSP (Net HSP) compiles HSP-like syntax to .NET Framework 4.8 assemblies.\n\n';
        }

        if (topic === 'all' || topic === 'directives') {
            result += '## Directives\n';
            for (const [syntax, desc] of Object.entries(NHSP_SYNTAX_REFERENCE.directives)) {
                result += `- \`${syntax}\` — ${desc}\n`;
            }
            result += '\n';
        }

        if (topic === 'all' || topic === 'types') {
            result += '## Types\n';
            for (const [type, desc] of Object.entries(NHSP_SYNTAX_REFERENCE.types)) {
                result += `- \`${type}\` — ${desc}\n`;
            }
            result += '\n';
        }

        if (topic === 'all' || topic === 'control') {
            result += '## Control Flow\n';
            for (const [syntax, desc] of Object.entries(NHSP_SYNTAX_REFERENCE.controlFlow)) {
                result += `- \`${syntax}\` — ${desc}\n`;
            }
            result += '\n';
        }

        if (topic === 'all' || topic === 'operators') {
            result += '## Operators (by precedence)\n';
            NHSP_SYNTAX_REFERENCE.operators.forEach(op => { result += `- ${op}\n`; });
            result += '\n';
        }

        if (topic === 'all' || topic === 'builtins') {
            result += '## Built-in Functions\n';
            for (const [syntax, desc] of Object.entries(NHSP_SYNTAX_REFERENCE.builtins)) {
                result += `- \`${syntax}\` → ${desc}\n`;
            }
            result += '\n';
        }

        return new vscode.LanguageModelToolResult([
            new vscode.LanguageModelTextPart(result)
        ]);
    }
}

class NhspConvertTool {
    async invoke(options, token) {
        const result = CSHARP_TO_NHSP_RULES;
        return new vscode.LanguageModelToolResult([
            new vscode.LanguageModelTextPart(result)
        ]);
    }
}

class NhspCurrentFileTool {
    async invoke(options, token) {
        const editor = vscode.window.activeTextEditor;
        if (!editor || editor.document.languageId !== 'nhsp') {
            return new vscode.LanguageModelToolResult([
                new vscode.LanguageModelTextPart('No NHSP file is currently open.')
            ]);
        }

        const text = editor.document.getText();
        const fileName = editor.document.fileName;
        const lineCount = editor.document.lineCount;

        // Extract class/method/field names for context
        const classes = [...text.matchAll(/#class\s+(?:\w+\s+)*(\w+)/g)].map(m => m[1]);
        const methods = [...text.matchAll(/#func\s+(?:\w+\s+)*(?:\w+\s+)?(\w+)/g)].map(m => m[1]);
        const fields = [...text.matchAll(/#field\s+(?:\w+\s+)*(?:\w+\s+)?(\w+)/g)].map(m => m[1]);

        let result = `Current NHSP file: ${fileName} (${lineCount} lines)\n`;
        result += `Classes: ${classes.join(', ') || 'none'}\n`;
        result += `Methods: ${methods.join(', ') || 'none'}\n`;
        result += `Fields: ${fields.join(', ') || 'none'}\n\n`;
        result += `Source code:\n\`\`\`nhsp\n${text.substring(0, 8000)}\n\`\`\``;

        return new vscode.LanguageModelToolResult([
            new vscode.LanguageModelTextPart(result)
        ]);
    }
}

// ========== Registration ==========

function registerLanguageModelTools(context) {
    if (!vscode.lm || !vscode.lm.registerTool) {
        console.log('Language Model Tools API not available (requires VS Code 1.93+)');
        return;
    }

    // Tool 1: NHSP language specification lookup
    context.subscriptions.push(
        vscode.lm.registerTool('nhsp-spec', new NhspSpecTool())
    );

    // Tool 2: C# to NHSP conversion rules
    context.subscriptions.push(
        vscode.lm.registerTool('nhsp-convert', new NhspConvertTool())
    );

    // Tool 3: Current NHSP file context
    context.subscriptions.push(
        vscode.lm.registerTool('nhsp-current-file', new NhspCurrentFileTool())
    );
}

module.exports = { registerLanguageModelTools };
