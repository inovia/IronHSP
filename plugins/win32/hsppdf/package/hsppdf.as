;============================================================
;  hsppdf.as — PDFium PDF 読み取りプラグイン宣言
;============================================================

#ifndef __hsppdf_as__
#define __hsppdf_as__

#uselib "hsppdf.dll"
#func global pdf_init             pdf_init             $202
#func global pdf_shutdown         pdf_shutdown         $202
#func global pdf_load             pdf_load             $202
#func global pdf_close            pdf_close            $202
#func global pdf_page_count       pdf_page_count       $202
#func global pdf_page_size        pdf_page_size        $202
#func global pdf_render_bitmap    pdf_render_bitmap    $202
#func global pdf_render_to_hspwnd pdf_render_to_hspwnd $202
#func global pdf_get_text         pdf_get_text         $202
#func global pdf_doc_title        pdf_doc_title        $202
#func global pdf_doc_author       pdf_doc_author       $202

#endif
