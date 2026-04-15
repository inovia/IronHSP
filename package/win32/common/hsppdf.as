;============================================================
;  hsppdf.as — PDFium PDF 読み取りプラグイン宣言 (新形式 typed #func)
;============================================================

#ifndef __hsppdf_as__
#define __hsppdf_as__

#uselib "hsppdf.dll"
#func global pdf_init             "pdf_init"
#func global pdf_shutdown         "pdf_shutdown"
#func global pdf_load             "pdf_load"             str, str, var
#func global pdf_close            "pdf_close"            int
#func global pdf_page_count       "pdf_page_count"       int, var
#func global pdf_page_size        "pdf_page_size"        int, int, var, var
#func global pdf_render_bitmap    "pdf_render_bitmap"    int, int, double, var, var, var
#func global pdf_render_to_hspwnd "pdf_render_to_hspwnd" int, int, double
#func global pdf_get_text         "pdf_get_text"         int, int, var, int
#func global pdf_doc_title        "pdf_doc_title"        int, var, int
#func global pdf_doc_author       "pdf_doc_author"       int, var, int

#endif
