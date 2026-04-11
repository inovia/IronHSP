const vscode = require('vscode');

// ========== NHSP Language Specification (for LLM context) ==========

const NHSP_SPEC = `
# NHSP (Net HSP) Language Specification

NHSP is a programming language with HSP-like syntax that compiles to .NET Framework 4.8 assemblies (DLL/EXE).
It uses System.Reflection.Emit to generate IL code. The compiler is nhspc.exe.

## Basic Rules
- One statement per line (no semicolons needed)
- Colon separator: \`a = 1 : b = 2\` (multiple statements on one line, like HSP)
- Line continuation: \`\\\` at end of line continues to next line (like HSP)
- Comments: \`; comment\` (HSP style) or \`// comment\` (C style)
- Hex literals: \`$FF\` (HSP style) or \`0xFF\` (C style)
- \`dim\` is optional: \`int x = 42\` and \`dim int x = 42\` are equivalent

## Directives (# prefixed)
| NHSP | C# |
|------|-----|
| \`#assembly "Name" [, exe]\` | Assembly name and output type |
| \`#reference "Lib.dll"\` | Add reference |
| \`#include "file.nhsp"\` | Include file |
| \`#namespace "NS" ... #endnamespace\` | namespace NS { } |
| \`#class [mods] Name [: Base, IFace] ... #endclass\` | class Name : Base, IFace { } |
| \`#struct [mods] Name [, Sequential] [, Pack=N] ... #endstruct\` | [StructLayout] struct Name { } |
| \`#interface Name ... #endinterface\` | interface Name { } |
| \`#enum Name ... #endenum\` | enum Name { } |
| \`#delegate [mods] RetType Name [, params]\` | delegate RetType Name(params); |
| \`#func [mods] [RetType] Name [, params] ... #endfunc\` | RetType Name(params) { } |
| \`#init [params] ... #endinit\` | Constructor |
| \`#init static ... #endinit\` | Static constructor |
| \`#destructor ... #enddestructor\` | ~ClassName() / Finalize() |
| \`#field [mods] Type Name [= value]\` | Field declaration |
| \`#property Name as Type ... #endproperty\` | Property with get/set |
| \`#event [mods] DelegateType Name\` | Event declaration |
| \`#indexer [mods] Type [, params] ... #endindexer\` | this[params] indexer |
| \`#operator RetType Op, params ... #endoperator\` | operator overload |
| \`#dllimport "dll" [, CharSet=X] [, SetLastError=true]\` | [DllImport("dll")] |
| \`#dllfunc [mods] RetType Name ["EntryPoint"] [, params]\` | P/Invoke declaration |
| \`#attribute Name, "value"\` | [Attribute("value")] |
| \`#main ... #endmain\` | static void Main() entry point |

## Types
| NHSP | .NET |
|------|------|
| int | System.Int32 |
| int64, long | System.Int64 |
| double | System.Double |
| float | System.Single |
| string | System.String |
| bool | System.Boolean |
| byte, sbyte | System.Byte, System.SByte |
| short, ushort | System.Int16, System.UInt16 |
| uint, ulong | System.UInt32, System.UInt64 |
| char | System.Char |
| IntPtr, UIntPtr | System.IntPtr, System.UIntPtr |
| var, object | System.Object |
| int? | Nullable<int> |
| int[] | Array |
| List<int> | System.Collections.Generic.List<int> |

## Control Flow
| NHSP | C# |
|------|-----|
| \`if cond ... elseif ... else ... endif\` | if/else if/else |
| \`if cond { } else { }\` | Brace style also supported |
| \`repeat N ... loop\` | for(int cnt=0; cnt<N; cnt++) { } — cnt is auto counter |
| \`for i = start to end [step N] ... next\` | for loop |
| \`while cond ... wend\` | while loop |
| \`foreach [type] var in collection ... next\` | foreach loop |
| \`switch expr ... case val ... default ... endswitch\` | switch (auto-break) |
| \`break / continue\` | break / continue |
| \`try ... catch Type var ... finally ... #endtry\` | try/catch/finally (multiple catch supported) |
| \`throw new Exception("msg")\` | throw |
| \`lock obj ... endlock\` | lock(obj) { } |
| \`using var = expr ... endusing\` | using(var = expr) { } |

## Modifiers
public, private, protected, static, virtual, override, abstract, sealed, const, readonly, ref, out, params

## Operators (by precedence, highest first)
1. Unary: \`-\`, \`!\`, \`~\` (bitwise NOT)
2. Multiplicative: \`*\`, \`/\`, \`%\`
3. Additive: \`+\`, \`-\`
4. Shift: \`<<\`, \`>>\`
5. Comparison: \`<\`, \`>\`, \`<=\`, \`>=\`, \`is\`, \`as\`
6. Equality: \`==\`, \`!=\` (\`=\` in conditions is treated as \`==\`)
7. Bitwise AND: \`&\`
8. Bitwise XOR: \`^\`
9. Bitwise OR: \`|\`
10. Logical AND: \`&&\` / \`and\`
11. Logical OR: \`||\` / \`or\`
12. Null coalescing: \`??\`
13. Ternary: \`? :\`

Assignment: \`=\`, \`+=\`, \`-=\`, \`*=\`, \`/=\`, \`&=\`, \`|=\`, \`^=\`
Increment: \`++\`, \`--\`

## Built-in
- \`print expr\` → Console.WriteLine(expr)
- \`sleep ms\` → Thread.Sleep(ms)
- \`str(x)\` → x.ToString()
- \`int(s)\` → int.Parse(s)
- \`double(s)\` → double.Parse(s)
- \`typeof(Type)\` → typeof(Type)
- \`$"Hello {name}"\` → string interpolation
- \`null\` / \`nullptr\` → null literal
- \`true\` / \`false\` → boolean literals
- \`cnt\` → repeat loop counter

## Limitations
- No lambda/closure (delegate types can be defined)
- No async/await (use Thread/Task.Run)
- No LINQ query syntax (use method chain)
- No generic type definition (generic type usage like List<int> is supported)
- No yield return
- Method names cannot be HSP reserved words (repeat, double, etc.)
`;

// ========== C# to NHSP Conversion Examples ==========

const CONVERSION_EXAMPLES = `
## C# to NHSP Conversion Examples

### Class with constructor
C#:
\`\`\`csharp
public class Person {
    public string Name;
    private int _age;
    public Person(string name, int age) { Name = name; _age = age; }
    public string GetInfo() { return Name + " (" + _age + ")"; }
}
\`\`\`
NHSP:
\`\`\`
#class public Person
  #field public string Name
  #field private int _age
  #init string name, int age
    Name = name
    _age = age
  #endinit
  #func public string GetInfo
    return Name + " (" + str(_age) + ")"
  #endfunc
#endclass
\`\`\`

### Inheritance and interface
C#:
\`\`\`csharp
public interface IShape { int Area(); }
public class Square : IShape {
    public int Side;
    public Square(int s) { Side = s; }
    public int Area() { return Side * Side; }
}
\`\`\`
NHSP:
\`\`\`
#interface IShape
  #func int Area
#endinterface
#class public Square : IShape
  #field public int Side
  #init int s
    Side = s
  #endinit
  #func public int Area
    return Side * Side
  #endfunc
#endclass
\`\`\`

### P/Invoke
C#:
\`\`\`csharp
[DllImport("user32.dll", CharSet = CharSet.Unicode)]
public static extern int MessageBoxW(IntPtr hWnd, string text, string caption, int type);
\`\`\`
NHSP:
\`\`\`
#dllimport "user32.dll", CharSet = Unicode
#dllfunc public static int MessageBoxW, IntPtr hWnd, string text, string caption, int type
\`\`\`

### Struct with StructLayout
C#:
\`\`\`csharp
[StructLayout(LayoutKind.Sequential, Pack = 2)]
public struct POINT { public int X; public int Y; }
\`\`\`
NHSP:
\`\`\`
#struct public POINT, Sequential, Pack = 2
  #field public int X
  #field public int Y
#endstruct
\`\`\`

### EXE with Main
C#:
\`\`\`csharp
class Program {
    static void Main() {
        Console.WriteLine("Hello!");
    }
}
\`\`\`
NHSP:
\`\`\`
#assembly "Hello", exe
#main
  print "Hello!"
#endmain
\`\`\`

### Enum, Switch, Foreach
C#:
\`\`\`csharp
enum Color { Red, Green, Blue }
// switch
switch(x) { case 1: return "one"; default: return "other"; }
// foreach
foreach(var item in list) { Console.WriteLine(item); }
\`\`\`
NHSP:
\`\`\`
#enum Color
  Red
  Green
  Blue
#endenum
; switch
switch x
  case 1
    return "one"
  default
    return "other"
endswitch
; foreach
foreach item in list
  print item
next
\`\`\`
`;

// ========== Chat Participant Handler ==========

function registerChatParticipant(context) {
    // Check if chat API is available (VS Code 1.93+)
    if (!vscode.chat || !vscode.chat.createChatParticipant) {
        console.log('Chat Participants API not available (requires VS Code 1.93+)');
        return;
    }

    const participant = vscode.chat.createChatParticipant('nhsp.chat', handleChatRequest);
    participant.iconPath = vscode.Uri.joinPath(context.extensionUri, 'icon.png');

    context.subscriptions.push(participant);
}

async function handleChatRequest(request, context, stream, token) {
    const command = request.command;

    // Build system prompt with NHSP spec
    let systemPrompt = `You are an expert assistant for the NHSP programming language.
NHSP is a custom language with HSP-like syntax that compiles to .NET assemblies.
Always respond in the same language as the user's message (Japanese if they write in Japanese).
When showing code, always show both NHSP and C# versions for comparison.
Here is the complete language specification:\n\n${NHSP_SPEC}\n\n${CONVERSION_EXAMPLES}`;

    if (command === 'convert') {
        systemPrompt += `\n\nThe user wants to convert C# code to NHSP.
Convert the code accurately following the NHSP syntax rules.
Show the original C# and the converted NHSP side by side.`;
    } else if (command === 'explain') {
        systemPrompt += `\n\nThe user wants an explanation of NHSP code.
Explain what the code does, and show the equivalent C# code for comparison.`;
    } else if (command === 'spec') {
        stream.markdown('## NHSP 言語仕様\n\n');
        stream.markdown(NHSP_SPEC);
        stream.markdown('\n\n## C# との変換例\n\n');
        stream.markdown(CONVERSION_EXAMPLES);
        return;
    }

    // Get the current editor content as additional context
    const editor = vscode.window.activeTextEditor;
    let editorContext = '';
    if (editor && editor.document.languageId === 'nhsp') {
        const selection = editor.document.getText(editor.selection.isEmpty ? undefined : editor.selection);
        if (selection && selection.length > 0 && selection.length < 5000) {
            editorContext = `\n\nCurrent NHSP code in editor:\n\`\`\`nhsp\n${selection}\n\`\`\``;
        }
    }

    // Select a language model
    const models = await vscode.lm.selectChatModels({ family: 'gpt-4o' });
    let model = models[0];
    if (!model) {
        // Try any available model
        const allModels = await vscode.lm.selectChatModels();
        model = allModels[0];
    }

    if (!model) {
        stream.markdown('Language Model が利用できません。GitHub Copilot がインストールされているか確認してください。');
        return;
    }

    // Build messages
    const messages = [
        vscode.LanguageModelChatMessage.User(systemPrompt + editorContext),
        vscode.LanguageModelChatMessage.User(request.prompt)
    ];

    // Stream the response
    try {
        const response = await model.sendRequest(messages, {}, token);
        for await (const chunk of response.text) {
            stream.markdown(chunk);
        }
    } catch (e) {
        if (e.code === 'NoPermissions') {
            stream.markdown('Language Model へのアクセス権限がありません。GitHub Copilot のサブスクリプションを確認してください。');
        } else {
            throw e;
        }
    }
}

module.exports = { registerChatParticipant };
