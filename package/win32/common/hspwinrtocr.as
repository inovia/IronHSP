;============================================================
;  hspwinrtocr.as — WinRT OCR プラグイン宣言 (新形式 typed #func)
;   Windows.Media.Ocr.OcrEngine (Win10+) ラッパ
;============================================================

#ifndef __hspwinrtocr_as__
#define __hspwinrtocr_as__

#uselib "hspwinrtocr.dll"
#func global ocr_init     "ocr_init"     str
#func global ocr_free     "ocr_free"
#func global ocr_langs    "ocr_langs"    var, int
#func global ocr_run_file "ocr_run_file" var, int, str
#func global ocr_run_hwnd "ocr_run_hwnd" var, int

#endif
