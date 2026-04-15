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

#endif
