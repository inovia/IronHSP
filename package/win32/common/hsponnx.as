;============================================================
;  hsponnx.as — ONNX Runtime プラグイン宣言 (新形式 typed #func)
;============================================================

#ifndef __hsponnx_as__
#define __hsponnx_as__

#uselib "hsponnx.dll"
#func global onnx_init             "onnx_init"
#func global onnx_shutdown         "onnx_shutdown"
#func global onnx_load_model       "onnx_load_model"       str, var
#func global onnx_close            "onnx_close"            int
#func global onnx_input_count      "onnx_input_count"      int, var
#func global onnx_input_name       "onnx_input_name"       int, int, var, int
#func global onnx_input_shape      "onnx_input_shape"      int, int, var, var
#func global onnx_output_count     "onnx_output_count"     int, var
#func global onnx_output_name      "onnx_output_name"      int, int, var, int
#func global onnx_output_shape     "onnx_output_shape"     int, int, var, var
#func global onnx_set_backend_dml  "onnx_set_backend_dml"  int
#func global onnx_set_backend_cpu  "onnx_set_backend_cpu"  int
#func global onnx_run              "onnx_run"              int, var, var, int, var, var, var

#endif
