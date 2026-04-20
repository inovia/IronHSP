# hsp3dx_sjis2utf8

`.hsp` / `.as` ソースファイルを Shift-JIS → UTF-8 (BOM なし) に変換するコンソールツール。

hsp3dx ランタイムは UTF-8 固定 (3 プラットフォーム共通化のため) なので、
既存の Shift-JIS 資産を移行するために使う。

## ビルド

```
dotnet build tools\hsp3dx_sjis2utf8\hsp3dx_sjis2utf8.csproj -c Release
```

## 使い方

```
hsp3dx_sjis2utf8 --in src.hsp [--out dst.hsp]
hsp3dx_sjis2utf8 --dir path\to\project [--recursive]
hsp3dx_sjis2utf8 --dir path\to\project --dry-run
```

## 安全装置

- BOM 付き / 正規 UTF-8 バイトシーケンスで成立するファイルは変換スキップ
- ASCII のみのファイルも変換スキップ
- `--dry-run` で事前チェック可能

## 既知の制限

- コメント内の `\` を含む Shift-JIS 文字 (`表` `ソ` など) は自動的に解消される
  (UTF-8 化すれば 0x5C がバイト列中に出ないため)
- `sdim` のバッファサイズは手動で見直し必要 (UTF-8 では 1 文字 3 バイトになる)
- `poke` / `peek` でバイト操作している既存コードは非互換になる

詳細は [docs/hsp3dx_spec.md](../../docs/hsp3dx_spec.md) の「文字コード規則」を参照。
