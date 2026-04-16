;============================================================
;  hsptflite.as — Tensorflow Lite C API プラグイン宣言 (新形式 typed #func)
;============================================================

#ifndef __hsptflite_as__
#define global __hsptflite_as__

#uselib "hsptflite.dll"
#func global tflite_init          "tflite_init"
#func global tflite_shutdown      "tflite_shutdown"
#func global tflite_load          "tflite_load"          str, var
#func global tflite_close         "tflite_close"         int
#func global tflite_num_threads   "tflite_num_threads"   int, int
#func global tflite_input_count   "tflite_input_count"   int, var
#func global tflite_output_count  "tflite_output_count"  int, var
#func global tflite_input_shape   "tflite_input_shape"   int, int, var, var
#func global tflite_output_shape  "tflite_output_shape"  int, int, var, var
#func global tflite_input_type    "tflite_input_type"    int, int, var
#func global tflite_output_type   "tflite_output_type"   int, int, var
#func global tflite_input_resize  "tflite_input_resize"  int, int, var, int
#func global tflite_set_input     "tflite_set_input"     int, int, var, int
#func global tflite_get_output    "tflite_get_output"    int, int, var, int
#func global tflite_invoke        "tflite_invoke"        int

; -- MediaPipe 高レベルヘルパ (C++ 側実装) --
#func global mp_palm_detect       "mp_palm_detect"       int, var, int, int, int, var, var
#func global mp_hand_landmark     "mp_hand_landmark"     int, var, int, int, int, int, int, int, var, var
#func global mp_bgr_to_rgb        "mp_bgr_to_rgb"        var, int, int, var
#func global mp_letterbox_resize  "mp_letterbox_resize"  var, int, int, int, var, int, int, var

#endif
