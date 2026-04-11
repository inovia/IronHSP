# NHSP Language Support for VS Code

HSP風 .NET アセンブリコンパイラ「NHSP」の VS Code 拡張機能です。

## 機能

### シンタックスハイライト
- ディレクティブ (`#class`, `#func`, `#struct` 等)
- キーワード (制御構文、修飾子、演算子)
- 型名 (プリミティブ型、.NET 型、ジェネリクス)
- 文字列・補間文字列 (`$"Hello {name}"`)
- 数値リテラル (10進数、16進数 `0xFF` / `$FF`)
- コメント (`;` / `//`)

### コンパイル
- **F5**: コンパイル
- **Ctrl+F5**: デバッグ情報付きコンパイル
- コマンドパレット: `NHSP: Compile`, `NHSP: Compile & Run`
- 保存時の自動コンパイル (エラーチェック)

### エラー表示
- コンパイルエラー/警告を「問題」パネルに表示
- エラー箇所に赤い波線を表示

### スニペット
- `#class`, `#func`, `#init`, `for`, `repeat`, `while`, `if`, `try` 等

## セットアップ

1. この拡張をインストール
2. `nhspc.exe` のパスを設定 (自動検出も可能)

```json
{
  "nhsp.compilerPath": "C:\\path\\to\\nhspc.exe"
}
```

## インストール (開発用)

```bash
cd vscode-nhsp
code --install-extension .
```

または `.vsix` パッケージを作成:

```bash
npm install -g vsce
vsce package
code --install-extension nhsp-language-0.1.0.vsix
```
