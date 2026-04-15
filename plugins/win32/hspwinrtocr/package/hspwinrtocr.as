;============================================================
;  hspwinrtocr.as — WinRT OCR プラグイン宣言
;   Windows.Media.Ocr.OcrEngine (Win10+) ラッパ
;============================================================

#ifndef __hspwinrtocr_as__
#define __hspwinrtocr_as__

#uselib "hspwinrtocr.dll"
#func global ocr_init     ocr_init     $202
#func global ocr_free     ocr_free     $202
#func global ocr_langs    ocr_langs    $202
#func global ocr_run_file ocr_run_file $202
#func global ocr_run_hwnd ocr_run_hwnd $202

#endif
