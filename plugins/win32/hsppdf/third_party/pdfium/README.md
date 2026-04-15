# PDFium prebuilt vendoring

`hsppdf.dll` は [bblanchon/pdfium-binaries](https://github.com/bblanchon/pdfium-binaries)
の Windows prebuilt (~7 MB) をリンクしてビルドします。ライセンスは Apache-2.0 / BSD-3-Clause
(Google PDFium 由来)。

本リポジトリには PDFium バイナリはコミットしていません (サイズおよび
ライセンス分離のため)。以下の手順で手動 DL してから vcxproj をビルドしてください。

## 手順

1. bblanchon/pdfium-binaries の [Releases](https://github.com/bblanchon/pdfium-binaries/releases)
   ページから最新の以下 2 アーカイブを DL:

   - `pdfium-windows-x64.tgz`
   - `pdfium-windows-x86.tgz`

2. それぞれを一時ディレクトリに展開する。各アーカイブは次のような構成:

   ```
   include/
     fpdfview.h
     fpdf_text.h
     fpdf_doc.h
     ...
   lib/
     pdfium.dll.lib
   bin/
     pdfium.dll
   ```

3. 次のように `plugins/win32/hsppdf/third_party/pdfium/` 配下にリネーム配置:

   ```
   plugins/win32/hsppdf/third_party/pdfium/
   ├── include/              ← x64 / x86 で共通 (x64 側を使えば OK)
   │   ├── fpdfview.h
   │   ├── fpdf_text.h
   │   ├── fpdf_doc.h
   │   └── ...
   ├── x86/
   │   ├── lib/pdfium.dll.lib
   │   └── bin/pdfium.dll
   ├── x64/
   │   ├── lib/pdfium.dll.lib
   │   └── bin/pdfium.dll
   └── README.md             (このファイル)
   ```

4. ランタイムで `hsppdf.dll` と `pdfium.dll` が同じディレクトリに並ぶよう、
   ビルド後に `x86/bin/pdfium.dll` を Win32 ランタイムに、
   `x64/bin/pdfium.dll` を x64 ランタイムに配布してください。

## 動作確認済みバージョン

初回ビルド後にここにコミット SHA / リリースタグを記載予定。

## stub (vendor 未配置) ビルド

PDFium を DL せずに `hsppdf.cpp` だけで試しにビルドする場合、
`__has_include("fpdfview.h")` が false になり、stub 実装としてコンパイル
できます。全ての PDF 関数は `-100` (PDFium 未リンク) を返し、
`pdf_get_text` / `pdf_doc_*` は空文字を返し、`pdf_render_*` は何もしません。

vcxproj の `AdditionalLibraryDirectories` / `pdfium.dll.lib` 依存はリンク時に
解決できなくなるので、stub ビルドを行う場合は vcxproj の
`ItemDefinitionGroup Condition="'$(Platform)'==...` 内の PDFium 行を一時的に
コメントアウトしてください。

## ライセンス

PDFium 本体は Apache-2.0 / BSD-3-Clause (Google)。bblanchon/pdfium-binaries
の配布パッケージに同梱される `LICENSE` をそのまま同梱配布する必要があります。
