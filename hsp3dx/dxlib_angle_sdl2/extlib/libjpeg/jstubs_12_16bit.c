/*
 * jstubs_12_16bit.c — hsp3dx dxlib_angle_sdl2 bundle minimal build
 *
 * libjpeg-turbo 3.x は 8/12/16-bit の混在 dispatch のため、jdmaster.c 等から
 * j12init_*, j16init_* が条件分岐で呼ばれる (実行時に cinfo->data_precision で
 * 8 以外を選ばない限り実際には到達しない)。
 *
 * 本バンドルは 8-bit 専用のため、これらを link 時に埋めるだけの stub を定義する。
 * 仮に 12/16-bit JPEG が渡されても ERREXIT で「unsupported precision」として
 * 落ちる (= 既存 8-bit 用途には影響無し)。
 */

#define JPEG_INTERNALS
#include "jinclude.h"
#include "jpeglib.h"
#include "jerror.h"

#define DX_JSTUB_FN(name) \
    void name(j_decompress_ptr cinfo); \
    void name(j_decompress_ptr cinfo) { \
        ERREXIT1(cinfo, JERR_BAD_PRECISION, cinfo->data_precision); \
    }

#define DX_JSTUB_FN_COMP(name) \
    void name(j_compress_ptr cinfo); \
    void name(j_compress_ptr cinfo) { \
        ERREXIT1(cinfo, JERR_BAD_PRECISION, cinfo->data_precision); \
    }

#define DX_JSTUB_FN_DECOMP_B(name) \
    void name(j_decompress_ptr cinfo, boolean b); \
    void name(j_decompress_ptr cinfo, boolean b) { \
        (void)b; \
        ERREXIT1(cinfo, JERR_BAD_PRECISION, cinfo->data_precision); \
    }

#define DX_JSTUB_FN_COMP_B(name) \
    void name(j_compress_ptr cinfo, boolean b); \
    void name(j_compress_ptr cinfo, boolean b) { \
        (void)b; \
        ERREXIT1(cinfo, JERR_BAD_PRECISION, cinfo->data_precision); \
    }

/* decompression 側 j12/j16 stubs */
DX_JSTUB_FN(j12init_1pass_quantizer)
DX_JSTUB_FN(j12init_2pass_quantizer)
DX_JSTUB_FN(j12init_color_deconverter)
DX_JSTUB_FN(j12init_merged_upsampler)
DX_JSTUB_FN(j12init_upsampler)
DX_JSTUB_FN(j12init_inverse_dct)
DX_JSTUB_FN(j16init_color_deconverter)
DX_JSTUB_FN(j16init_upsampler)

DX_JSTUB_FN_DECOMP_B(j12init_d_post_controller)
DX_JSTUB_FN_DECOMP_B(j12init_d_coef_controller)
DX_JSTUB_FN_DECOMP_B(j12init_d_diff_controller)
DX_JSTUB_FN_DECOMP_B(j16init_d_post_controller)
DX_JSTUB_FN_DECOMP_B(j16init_d_diff_controller)

DX_JSTUB_FN(j12init_lossless_decompressor)
DX_JSTUB_FN(j16init_lossless_decompressor)

/* j12/j16init_d_main_controller(cinfo, need_full_buffer) */
void j12init_d_main_controller(j_decompress_ptr cinfo, boolean need_full_buffer);
void j12init_d_main_controller(j_decompress_ptr cinfo, boolean need_full_buffer) {
    (void)need_full_buffer;
    ERREXIT1(cinfo, JERR_BAD_PRECISION, cinfo->data_precision);
}
void j16init_d_main_controller(j_decompress_ptr cinfo, boolean need_full_buffer);
void j16init_d_main_controller(j_decompress_ptr cinfo, boolean need_full_buffer) {
    (void)need_full_buffer;
    ERREXIT1(cinfo, JERR_BAD_PRECISION, cinfo->data_precision);
}

/* compression 側 j12/j16 stubs */
DX_JSTUB_FN_COMP(j12init_color_converter)
DX_JSTUB_FN_COMP(j12init_downsampler)
DX_JSTUB_FN_COMP(j12init_forward_dct)
DX_JSTUB_FN_COMP(j16init_color_converter)
DX_JSTUB_FN_COMP(j16init_downsampler)

DX_JSTUB_FN_COMP_B(j12init_c_coef_controller)
DX_JSTUB_FN_COMP_B(j12init_c_diff_controller)
DX_JSTUB_FN_COMP_B(j12init_c_main_controller)
DX_JSTUB_FN_COMP_B(j12init_c_prep_controller)
DX_JSTUB_FN_COMP_B(j16init_c_diff_controller)
DX_JSTUB_FN_COMP_B(j16init_c_main_controller)
DX_JSTUB_FN_COMP_B(j16init_c_prep_controller)

DX_JSTUB_FN_COMP(j12init_lossless_compressor)
DX_JSTUB_FN_COMP(j16init_lossless_compressor)
