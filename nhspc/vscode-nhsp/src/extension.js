const vscode = require('vscode');
const path = require('path');
const { execFile } = require('child_process');
const fs = require('fs');

let diagnosticCollection;
let outputChannel;

function activate(context) {
    diagnosticCollection = vscode.languages.createDiagnosticCollection('nhsp');
    outputChannel = vscode.window.createOutputChannel('NHSP');

    context.subscriptions.push(diagnosticCollection);
    context.subscriptions.push(outputChannel);

    // Register commands
    context.subscriptions.push(
        vscode.commands.registerCommand('nhsp.compile', () => compile(false, false)),
        vscode.commands.registerCommand('nhsp.compileDll', () => compile(false, true)),
        vscode.commands.registerCommand('nhsp.compileDebug', () => compile(true, false)),
        vscode.commands.registerCommand('nhsp.run', () => compileAndRun())
    );

    // Auto-compile on save (optional)
    context.subscriptions.push(
        vscode.workspace.onDidSaveTextDocument((doc) => {
            if (doc.languageId === 'nhsp') {
                compile(false, false, true); // silent mode
            }
        })
    );
}

function findCompiler() {
    const config = vscode.workspace.getConfiguration('nhsp');
    const configPath = config.get('compilerPath');
    if (configPath && fs.existsSync(configPath)) return configPath;

    // Auto-detect: look in workspace and common locations
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

    vscode.window.showErrorMessage('nhspc.exe not found. Set nhsp.compilerPath in settings.');
    return null;
}

function compile(debug = false, forceDll = false, silent = false) {
    const editor = vscode.window.activeTextEditor;
    if (!editor || editor.document.languageId !== 'nhsp') {
        if (!silent) vscode.window.showWarningMessage('No NHSP file is open.');
        return;
    }

    // Save before compile
    editor.document.save().then(() => {
        const compilerPath = findCompiler();
        if (!compilerPath) return;

        const sourceFile = editor.document.uri.fsPath;
        const sourceDir = path.dirname(sourceFile);
        const baseName = path.basename(sourceFile, '.nhsp');

        const config = vscode.workspace.getConfiguration('nhsp');
        const outDir = config.get('outputDirectory') || sourceDir;

        // Determine output file
        let ext = '.dll';
        const sourceText = editor.document.getText();
        if (sourceText.includes('#main') || sourceText.match(/#assembly\s+"[^"]+"\s*,\s*exe/)) {
            ext = '.exe';
        }
        if (forceDll) ext = '.dll';

        const outputFile = path.join(outDir, baseName + ext);

        // Build args
        const args = [sourceFile, '-o', outputFile];
        if (debug) args.push('-debug');

        outputChannel.clear();
        outputChannel.appendLine(`> nhspc ${args.join(' ')}`);
        outputChannel.show(true);

        execFile(compilerPath, args, { cwd: sourceDir, timeout: 30000 }, (error, stdout, stderr) => {
            const output = (stdout || '') + (stderr || '');
            outputChannel.appendLine(output);

            // Parse diagnostics
            diagnosticCollection.clear();
            const diagnostics = parseDiagnostics(output, sourceFile);

            if (diagnostics.length > 0) {
                diagnosticCollection.set(vscode.Uri.file(sourceFile), diagnostics);
            }

            const errorCount = diagnostics.filter(d => d.severity === vscode.DiagnosticSeverity.Error).length;
            const warnCount = diagnostics.filter(d => d.severity === vscode.DiagnosticSeverity.Warning).length;

            if (error || errorCount > 0) {
                if (!silent) {
                    vscode.window.showErrorMessage(
                        `NHSP: Compile failed (${errorCount} error${errorCount !== 1 ? 's' : ''}, ${warnCount} warning${warnCount !== 1 ? 's' : ''})`
                    );
                }
                outputChannel.appendLine(`\nCompile FAILED`);
            } else {
                if (!silent) {
                    vscode.window.showInformationMessage(
                        `NHSP: Compiled successfully → ${path.basename(outputFile)}` +
                        (warnCount > 0 ? ` (${warnCount} warning${warnCount !== 1 ? 's' : ''})` : '')
                    );
                }
                outputChannel.appendLine(`\nCompile OK: ${outputFile}`);
            }
        });
    });
}

function compileAndRun() {
    const editor = vscode.window.activeTextEditor;
    if (!editor || editor.document.languageId !== 'nhsp') return;

    const sourceText = editor.document.getText();
    const isExe = sourceText.includes('#main') || sourceText.match(/#assembly\s+"[^"]+"\s*,\s*exe/);

    if (!isExe) {
        vscode.window.showWarningMessage('NHSP: Cannot run a DLL. Add #main block for an executable.');
        return;
    }

    editor.document.save().then(() => {
        const compilerPath = findCompiler();
        if (!compilerPath) return;

        const sourceFile = editor.document.uri.fsPath;
        const sourceDir = path.dirname(sourceFile);
        const baseName = path.basename(sourceFile, '.nhsp');
        const outputFile = path.join(sourceDir, baseName + '.exe');

        const args = [sourceFile, '-o', outputFile];
        outputChannel.clear();
        outputChannel.appendLine(`> nhspc ${args.join(' ')}`);
        outputChannel.show(true);

        execFile(compilerPath, args, { cwd: sourceDir, timeout: 30000 }, (error, stdout, stderr) => {
            const output = (stdout || '') + (stderr || '');
            outputChannel.appendLine(output);

            diagnosticCollection.clear();
            const diagnostics = parseDiagnostics(output, sourceFile);
            if (diagnostics.length > 0) {
                diagnosticCollection.set(vscode.Uri.file(sourceFile), diagnostics);
            }

            if (!error && diagnostics.filter(d => d.severity === vscode.DiagnosticSeverity.Error).length === 0) {
                outputChannel.appendLine(`\nRunning: ${outputFile}\n${'='.repeat(50)}`);

                // Run the compiled exe
                const terminal = vscode.window.createTerminal('NHSP Run');
                terminal.show();
                terminal.sendText(`"${outputFile}"`);
            } else {
                vscode.window.showErrorMessage('NHSP: Compile failed, cannot run.');
            }
        });
    });
}

function parseDiagnostics(output, sourceFile) {
    const diagnostics = [];
    // Format: (line,col): error: message  or  (line,col): warning: message
    const pattern = /\((\d+),(\d+)\): (error|warning|info): (.*)/g;
    let match;

    while ((match = pattern.exec(output)) !== null) {
        const line = Math.max(0, parseInt(match[1]) - 1);
        const col = Math.max(0, parseInt(match[2]));
        const severity = match[3] === 'error'
            ? vscode.DiagnosticSeverity.Error
            : match[3] === 'warning'
                ? vscode.DiagnosticSeverity.Warning
                : vscode.DiagnosticSeverity.Information;
        const message = match[4];

        const range = new vscode.Range(line, col, line, col + 1);
        const diag = new vscode.Diagnostic(range, message, severity);
        diag.source = 'nhspc';
        diagnostics.push(diag);
    }

    // Also check for "Compiled successfully" or "Compile failed"
    if (output.includes('Compiled successfully')) {
        // no error
    }

    return diagnostics;
}

function deactivate() {
    if (diagnosticCollection) diagnosticCollection.dispose();
    if (outputChannel) outputChannel.dispose();
}

module.exports = { activate, deactivate };
