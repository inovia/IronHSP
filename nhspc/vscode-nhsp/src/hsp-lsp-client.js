// Minimal LSP client for hspls.exe (HSP3 .hsp files).
// Mirrors lsp-client.js but targets the 'hsp' language id + hspls.exe binary.
// Kept as a separate class so either server can be swapped independently.

const { spawn } = require('child_process');
const path = require('path');
const fs = require('fs');
const vscode = require('vscode');

class HspLanguageClient {
    constructor(outputChannel, diagnosticCollection, extensionPath) {
        this.output = outputChannel;
        this.diagnostics = diagnosticCollection;
        this.extensionPath = extensionPath;
        this.proc = null;
        this.buffer = Buffer.alloc(0);
        this.nextId = 1;
        this.openDocs = new Set();
        this.pending = new Map();
    }

    start() {
        const exe = this._findServer();
        if (!exe) {
            this.output.appendLine('[hspls] hspls.exe not found — HSP language server disabled.');
            return false;
        }
        this.output.appendLine('[hspls] starting: ' + exe);
        try {
            this.proc = spawn(exe, [], { stdio: ['pipe', 'pipe', 'pipe'] });
        } catch (e) {
            this.output.appendLine('[hspls] spawn failed: ' + e.message);
            return false;
        }
        this.proc.stdout.on('data', (chunk) => this._onData(chunk));
        this.proc.stderr.on('data', (chunk) => this.output.appendLine('[hspls stderr] ' + chunk.toString()));
        this.proc.on('exit', (code) => {
            this.output.appendLine('[hspls] server exited (code=' + code + ')');
            this.proc = null;
            for (const [, entry] of this.pending) {
                clearTimeout(entry.timer);
                entry.reject(new Error('hspls exited'));
            }
            this.pending.clear();
        });

        const folders = (vscode.workspace.workspaceFolders || []).map((f) => ({
            uri: f.uri.toString(),
            name: f.name
        }));
        const rootUri = folders.length > 0 ? folders[0].uri : null;

        this._sendRequest('initialize', {
            processId: process.pid,
            rootUri,
            workspaceFolders: folders,
            capabilities: {}
        }).catch(() => { /* initialize failures surface via stderr */ });
        this._sendNotification('initialized', {});
        return true;
    }

    stop() {
        if (!this.proc) return;
        try {
            this._sendRequest('shutdown', null);
            this._sendNotification('exit', null);
        } catch (e) { /* ignore */ }
        try { this.proc.kill(); } catch (e) { /* ignore */ }
        this.proc = null;
    }

    didOpen(document) {
        if (!this.proc) return;
        // Support both .hsp main files and .as include files — VS Code
        // maps both to languageId="hsp" via contributes.languages.
        if (document.languageId !== 'hsp') return;
        const uri = document.uri.toString();
        this.openDocs.add(uri);
        this._sendNotification('textDocument/didOpen', {
            textDocument: {
                uri,
                languageId: 'hsp',
                version: document.version,
                text: document.getText()
            }
        });
    }

    didChange(document) {
        if (!this.proc || document.languageId !== 'hsp') return;
        const uri = document.uri.toString();
        if (!this.openDocs.has(uri)) { this.didOpen(document); return; }
        this._sendNotification('textDocument/didChange', {
            textDocument: { uri, version: document.version },
            contentChanges: [{ text: document.getText() }]
        });
    }

    didSave(document) {
        if (!this.proc || document.languageId !== 'hsp') return;
        const uri = document.uri.toString();
        this._sendNotification('textDocument/didSave', {
            textDocument: { uri }
        });
    }

    didClose(document) {
        if (!this.proc || document.languageId !== 'hsp') return;
        const uri = document.uri.toString();
        this.openDocs.delete(uri);
        this._sendNotification('textDocument/didClose', {
            textDocument: { uri }
        });
    }

    _lspPos(position) { return { line: position.line, character: position.character }; }

    async hover(document, position) {
        try {
            return await this._sendRequest('textDocument/hover', {
                textDocument: { uri: document.uri.toString() },
                position: this._lspPos(position)
            });
        } catch (e) { return null; }
    }

    async completion(document, position, triggerCharacter) {
        try {
            return await this._sendRequest('textDocument/completion', {
                textDocument: { uri: document.uri.toString() },
                position: this._lspPos(position),
                context: triggerCharacter
                    ? { triggerKind: 2, triggerCharacter }
                    : { triggerKind: 1 }
            });
        } catch (e) { return null; }
    }

    async definition(document, position) {
        try {
            return await this._sendRequest('textDocument/definition', {
                textDocument: { uri: document.uri.toString() },
                position: this._lspPos(position)
            });
        } catch (e) { return null; }
    }

    async documentSymbol(document) {
        try {
            return await this._sendRequest('textDocument/documentSymbol', {
                textDocument: { uri: document.uri.toString() }
            });
        } catch (e) { return null; }
    }

    async semanticTokens(document) {
        try {
            return await this._sendRequest('textDocument/semanticTokens/full', {
                textDocument: { uri: document.uri.toString() }
            });
        } catch (e) { return null; }
    }

    _findServer() {
        // 1. User override
        const cfg = vscode.workspace.getConfiguration('hsp3net');
        const cfgPath = cfg.get('languageServerPath');
        if (cfgPath && fs.existsSync(cfgPath)) return cfgPath;

        // 2. Bundled with the extension
        const extDir = this.extensionPath || path.join(__dirname, '..');
        const bundled = path.join(extDir, 'compiler', 'hspls.exe');
        if (fs.existsSync(bundled)) return bundled;

        // 3. Dev layout: <repo>/nhspc/vscode-nhsp/ + <repo>/nhspc/HspLanguageServer/
        //    The extension lives under nhspc/, so `../HspLanguageServer/...`
        //    from the extension dir points straight at the sibling server.
        const siblingCandidates = [
            path.join(extDir, '..', 'HspLanguageServer', 'bin', 'Release', 'net48', 'hspls.exe'),
            path.join(extDir, '..', 'HspLanguageServer', 'bin', 'Debug',   'net48', 'hspls.exe'),
        ];
        for (const c of siblingCandidates) if (fs.existsSync(c)) return c;

        // 4. Workspace dev paths (user opened the repo root as workspace)
        const folders = vscode.workspace.workspaceFolders;
        if (folders) {
            for (const f of folders) {
                const candidates = [
                    path.join(f.uri.fsPath, 'hspls.exe'),
                    path.join(f.uri.fsPath, 'nhspc', 'HspLanguageServer', 'bin', 'Release', 'net48', 'hspls.exe'),
                    path.join(f.uri.fsPath, 'nhspc', 'HspLanguageServer', 'bin', 'Debug',   'net48', 'hspls.exe'),
                    path.join(f.uri.fsPath, '..', 'nhspc', 'HspLanguageServer', 'bin', 'Release', 'net48', 'hspls.exe'),
                    path.join(f.uri.fsPath, '..', '..', 'nhspc', 'HspLanguageServer', 'bin', 'Release', 'net48', 'hspls.exe'),
                ];
                for (const c of candidates) if (fs.existsSync(c)) return c;
            }
        }
        return null;
    }

    _sendRequest(method, params) {
        const id = this.nextId++;
        return new Promise((resolve, reject) => {
            if (!this.proc || !this.proc.stdin.writable) {
                reject(new Error('hspls not running'));
                return;
            }
            const timer = setTimeout(() => {
                this.pending.delete(id);
                reject(new Error('hspls request timed out: ' + method));
            }, 5000);
            this.pending.set(id, { resolve, reject, timer });
            this._writeMessage({ jsonrpc: '2.0', id, method, params });
        });
    }

    _sendNotification(method, params) {
        this._writeMessage({ jsonrpc: '2.0', method, params });
    }

    _writeMessage(obj) {
        if (!this.proc || !this.proc.stdin.writable) return;
        const body = Buffer.from(JSON.stringify(obj), 'utf8');
        const header = Buffer.from('Content-Length: ' + body.length + '\r\n\r\n', 'ascii');
        this.proc.stdin.write(header);
        this.proc.stdin.write(body);
    }

    _onData(chunk) {
        this.buffer = Buffer.concat([this.buffer, chunk]);
        while (true) {
            const headerEnd = this.buffer.indexOf('\r\n\r\n');
            if (headerEnd < 0) return;
            const header = this.buffer.slice(0, headerEnd).toString('ascii');
            let contentLength = -1;
            for (const line of header.split('\r\n')) {
                const m = /^Content-Length:\s*(\d+)/i.exec(line);
                if (m) contentLength = parseInt(m[1], 10);
            }
            if (contentLength < 0) {
                this.buffer = this.buffer.slice(headerEnd + 4);
                continue;
            }
            const total = headerEnd + 4 + contentLength;
            if (this.buffer.length < total) return;
            const body = this.buffer.slice(headerEnd + 4, total).toString('utf8');
            this.buffer = this.buffer.slice(total);
            try {
                const msg = JSON.parse(body);
                this._handleMessage(msg);
            } catch (e) {
                this.output.appendLine('[hspls] parse error: ' + e.message);
            }
        }
    }

    _handleMessage(msg) {
        if (msg.id !== undefined && (msg.result !== undefined || msg.error !== undefined)) {
            const entry = this.pending.get(msg.id);
            if (entry) {
                clearTimeout(entry.timer);
                this.pending.delete(msg.id);
                if (msg.error) entry.reject(new Error(msg.error.message || 'LSP error'));
                else entry.resolve(msg.result);
            }
            return;
        }

        if (msg.method === 'textDocument/publishDiagnostics') {
            const p = msg.params;
            const diags = (p.diagnostics || []).map((d) => {
                const r = d.range;
                const range = new vscode.Range(
                    r.start.line, r.start.character,
                    r.end.line, r.end.character
                );
                const sev = d.severity === 1 ? vscode.DiagnosticSeverity.Error
                          : d.severity === 2 ? vscode.DiagnosticSeverity.Warning
                          : d.severity === 3 ? vscode.DiagnosticSeverity.Information
                          : vscode.DiagnosticSeverity.Hint;
                const dd = new vscode.Diagnostic(range, d.message || '', sev);
                dd.source = d.source || 'hspls';
                return dd;
            });
            this.diagnostics.set(vscode.Uri.parse(p.uri), diags);
        }
    }
}

module.exports = { HspLanguageClient };
