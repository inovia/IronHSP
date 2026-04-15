;============================================================
;  hsptflite.as — Tensorflow Lite C API プラグイン宣言
;============================================================

#ifndef __hsptflite_as__
#define __hsptflite_as__

#uselib "hsptflite.dll"
#func global tflite_init          tflite_init          $202
#func global tflite_shutdown      tflite_shutdown      $202
#func global tflite_load          tflite_load          $202
#func global tflite_close         tflite_close         $202
#func global tflite_num_threads   tflite_num_threads   $202
#func global tflite_input_count   tflite_input_count   $202
#func global tflite_output_count  tflite_output_count  $202
#func global tflite_input_shape   tflite_input_shape   $202
#func global tflite_output_shape  tflite_output_shape  $202
#func global tflite_input_type    tflite_input_type    $202
#func global tflite_output_type   tflite_output_type   $202
#func global tflite_input_resize  tflite_input_resize  $202
#func global tflite_set_input     tflite_set_input     $202
#func global tflite_get_output    tflite_get_output    $202
#func global tflite_invoke        tflite_invoke        $202

; -- MediaPipe 高レベルヘルパ (C++ 側実装) --
#func global mp_palm_detect       mp_palm_detect       $202
#func global mp_hand_landmark     mp_hand_landmark     $202
#func global mp_bgr_to_rgb        mp_bgr_to_rgb        $202
#func global mp_letterbox_resize  mp_letterbox_resize  $202

#endif
