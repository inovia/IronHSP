// Minimal LSP client for nhspls.exe.
// Avoids the vscode-languageclient npm dependency by hand-rolling the
// JSON-RPC framing we need (initialize / didOpen / didChange / didClose +
// publishDiagnostics handler).

const { spawn } = require('child_process');
const path = require('path');
const fs = require('fs');
const vscode = require('vscode');

class NhspLanguageClient {
    constructor(outputChannel, diagnosticCollection, extensionPath) {
        this.output = outputChannel;
        this.diagnostics = diagnosticCollection;
        this.extensionPath = extensionPath;
        this.proc = null;
        this.buffer = Buffer.alloc(0);
        this.nextId = 1;
        this.openDocs = new Set();
        // Pending request tracking: id → { resolve, reject, timer }.
        // Responses from the server are matched by id; unresolved requests are
        // timed out so UI commands don't hang if the server crashes mid-reply.
        this.pending = new Map();
    }

    start() {
        const exe = this._findServer();
        if (!exe) {
            this.output.appendLine('[lsp] nhspls.exe not found — language server disabled.');
            return false;
        }
        this.output.appendLine('[lsp] starting: ' + exe);
        try {
            this.proc = spawn(exe, [], { stdio: ['pipe', 'pipe', 'pipe'] });
        } catch (e) {
            this.output.appendLine('[lsp] spawn failed: ' + e.message);
            return false;
        }
        this.proc.stdout.on('data', (chunk) => this._onData(chunk));
        this.proc.stderr.on('data', (chunk) => this.output.appendLine('[lsp stderr] ' + chunk.toString()));
        this.proc.on('exit', (code) => {
            this.output.appendLine('[lsp] server exited (code=' + code + ')');
            this.proc = null;
            // Reject any in-flight requests so callers don't hang forever.
            for (const [, entry] of this.pending) {
                clearTimeout(entry.timer);
                entry.reject(new Error('language server exited'));
            }
            this.pending.clear();
        });

        // Pass workspace folders so nhspls can scan the project for Phase B.
        // VSCode exposes them via vscode.workspace.workspaceFolders; if empty
        // (unsaved document opened directly), Phase B is inactive but Phase A/C
        // still work because they rely on the document's own resolved path.
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
        }).catch(() => { /* initialize failures are logged via stderr */ });
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
        if (!this.proc || document.languageId !== 'nhsp') return;
        const uri = document.uri.toString();
        this.openDocs.add(uri);
        this._sendNotification('textDocument/didOpen', {
            textDocument: {
                uri,
                languageId: 'nhsp',
                version: document.version,
                text: document.getText()
            }
        });
    }

    didChange(document) {
        if (!this.proc || document.languageId !== 'nhsp') return;
        const uri = document.uri.toString();
        if (!this.openDocs.has(uri)) { this.didOpen(document); return; }
        this._sendNotification('textDocument/didChange', {
            textDocument: { uri, version: document.version },
            contentChanges: [{ text: document.getText() }]
        });
    }

    didClose(document) {
        if (!this.proc || document.languageId !== 'nhsp') return;
        const uri = document.uri.toString();
        this.openDocs.delete(uri);
        this._sendNotification('textDocument/didClose', {
            textDocument: { uri }
        });
    }

    // ---------- internals ----------

    _findServer() {
        // Allow override via setting first.
        const cfg = vscode.workspace.getConfiguration('nhsp');
        const cfgPath = cfg.get('languageServerPath');
        if (cfgPath && fs.existsSync(cfgPath)) return cfgPath;

        // Bundled with the extension.
        const extDir = this.extensionPath || path.join(__dirname, '..');
        const bundled = path.join(extDir, 'compiler', 'nhspls.exe');
        if (fs.existsSync(bundled)) return bundled;

        // Dev layout: vscode-nhsp sits next to NhspLanguageServer under nhspc/.
        const sibling = [
            path.join(extDir, '..', 'NhspLanguageServer', 'bin', 'Release', 'net48', 'nhspls.exe'),
            path.join(extDir, '..', 'NhspLanguageServer', 'bin', 'Debug',   'net48', 'nhspls.exe'),
        ];
        for (const c of sibling) if (fs.existsSync(c)) return c;

        // Workspace dev paths.
        const folders = vscode.workspace.workspaceFolders;
        if (folders) {
            for (const f of folders) {
                const candidates = [
                    path.join(f.uri.fsPath, 'nhspls.exe'),
                    path.join(f.uri.fsPath, 'nhspc', 'NhspLanguageServer', 'bin', 'Release', 'net48', 'nhspls.exe'),
                    path.join(f.uri.fsPath, 'nhspc', 'NhspLanguageServer', 'bin', 'Debug', 'net48', 'nhspls.exe'),
                    path.join(f.uri.fsPath, '..', 'nhspc', 'NhspLanguageServer', 'bin', 'Release', 'net48', 'nhspls.exe'),
                    path.join(f.uri.fsPath, '..', '..', 'nhspc', 'NhspLanguageServer', 'bin', 'Release', 'net48', 'nhspls.exe'),
                ];
                for (const c of candidates) if (fs.existsSync(c)) return c;
            }
        }
        return null;
    }

    // Promise-returning request. Used by hover / completion / definition
    // providers in extension.js. Rejects on a 5-second timeout so the UI
    // doesn't hang if the server is unresponsive.
    _sendRequest(method, params) {
        const id = this.nextId++;
        return new Promise((resolve, reject) => {
            if (!this.proc || !this.proc.stdin.writable) {
                reject(new Error('language server not running'));
                return;
            }
            const timer = setTimeout(() => {
                this.pending.delete(id);
                reject(new Error('language server request timed out: ' + method));
            }, 5000);
            this.pending.set(id, { resolve, reject, timer });
            this._writeMessage({ jsonrpc: '2.0', id, method, params });
        });
    }

    // ---------- Typed LSP helpers ----------

    // Convert a vscode.Position into an LSP position (LSP is 0-based on both
    // axes; vscode is also 0-based, so this is a pass-through but explicit for
    // clarity / future platform differences).
    _lspPos(position) {
        return { line: position.line, character: position.character };
    }

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
        // Drain as many complete messages as we have.
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
                // Malformed header; drop it.
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
                this.output.appendLine('[lsp] parse error: ' + e.message);
            }
        }
    }

    _handleMessage(msg) {
        // Responses: match to the pending request by id.
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

        // Server-sent notifications.
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
                dd.source = d.source || 'nhspls';
                return dd;
            });
            this.diagnostics.set(vscode.Uri.parse(p.uri), diags);
        }
    }
}

module.exports = { NhspLanguageClient };
