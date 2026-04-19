# hsppdf.dll — PDFium plugin for HSP

Google PDFium (bblanchon prebuilt) を使って PDF を読み込み、ページを
HSP ウィンドウにレンダリング or テキスト抽出できるプラグイン。

## API

```
pdf_init                                  ; FPDF_InitLibrary
pdf_shutdown                              ; FPDF_DestroyLibrary
pdf_load        "path", "password", var_doc_handle
pdf_close       doc
pdf_page_count  doc, var_n
pdf_page_size   doc, page_idx, var_w, var_h      ; double (pt)
pdf_render_bitmap doc, page_idx, dpi, var_bmp, var_w, var_h
pdf_page_text   doc, page_idx, var_str, len      ; テキスト抽出
```

## ビルド手順

### 1. PDFium prebuilt を DL

https://github.com/bblanchon/pdfium-binaries/releases から最新の:

```powershell
# x64
curl -L -o pdfium-x64.tgz https://github.com/bblanchon/pdfium-binaries/releases/download/chromium/7789/pdfium-win-x64.tgz
7z x pdfium-x64.tgz -so | 7z x -si -ttar -othird_party/pdfium/x64
# x86
curl -L -o pdfium-x86.tgz https://github.com/bblanchon/pdfium-binaries/releases/download/chromium/7789/pdfium-win-x86.tgz
7z x pdfium-x86.tgz -so | 7z x -si -ttar -othird_party/pdfium/x86
# include を統合
cp -r third_party/pdfium/x64/include third_party/pdfium/
```

期待する layout:
```
third_party/pdfium/
├── include/*.h
├── x64/lib/pdfium.dll.lib + x64/bin/pdfium.dll
└── x86/lib/pdfium.dll.lib + x86/bin/pdfium.dll
```

### 2. ビルド

```powershell
msbuild hsppdf.vcxproj /p:Configuration=Release /p:Platform=x64    # → hsppdf_64.dll
msbuild hsppdf.vcxproj /p:Configuration=Release /p:Platform=Win32  # → hsppdf.dll
```

### 3. 配置

```powershell
cp Release/hsppdf_64.dll ../../../package/win32/
cp Release/hsppdf.dll    ../../../package/win32/
# ランタイム依存 pdfium.dll (x64) も配布
cp third_party/pdfium/x64/bin/pdfium.dll ../../../package/win32/
```

x86 環境で使う場合は `package/win32/pdfium.dll` を x86 版に差し替え。

## テスト

```
cd package/win32/sample/iron
../../iron_test_runner.exe --compiler=../../hspcmp64.exe \
    --runtime=../../hsp3cl_net_test_64.exe --compath=../../common/ \
    test_pdf.hsp
```

実 PDF レンダリングのフルサンプルは `sample_pdf.hsp` (既存)。

## 制限

- `pdfium.dll` の配布ライセンス (Apache-2.0 / BSD-3-Clause) を継承
- PDFium 本体 ~7MB (DLL)

## 参考

- PDFium: https://pdfium.googlesource.com/pdfium/
- bblanchon prebuilt: https://github.com/bblanchon/pdfium-binaries
