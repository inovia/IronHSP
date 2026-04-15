;============================================================
;  hsponnx.as — ONNX Runtime プラグイン宣言
;============================================================

#ifndef __hsponnx_as__
#define __hsponnx_as__

#uselib "hsponnx.dll"
#func global onnx_init             onnx_init             $202
#func global onnx_shutdown         onnx_shutdown         $202
#func global onnx_load_model       onnx_load_model       $202
#func global onnx_close            onnx_close            $202
#func global onnx_input_count      onnx_input_count      $202
#func global onnx_input_name       onnx_input_name       $202
#func global onnx_input_shape      onnx_input_shape      $202
#func global onnx_output_count     onnx_output_count     $202
#func global onnx_output_name      onnx_output_name      $202
#func global onnx_output_shape     onnx_output_shape     $202
#func global onnx_set_backend_dml  onnx_set_backend_dml  $202
#func global onnx_set_backend_cpu  onnx_set_backend_cpu  $202
#func global onnx_run              onnx_run              $202

#endif
