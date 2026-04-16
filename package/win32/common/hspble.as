;============================================================
;  hspble.as — BLE GATT クライアント (Windows.Devices.Bluetooth) 新形式 typed #func
;============================================================

#ifndef __hspble_as__
#define global __hspble_as__

#uselib "hspble.dll"
#func global ble_init             "ble_init"
#func global ble_shutdown         "ble_shutdown"
#func global ble_scan_start       "ble_scan_start"
#func global ble_scan_stop        "ble_scan_stop"
#func global ble_scan_poll        "ble_scan_poll"        var, int, var, int, var
#func global ble_connect          "ble_connect"          str, var
#func global ble_disconnect       "ble_disconnect"       int
#func global ble_services         "ble_services"         int, var, int
#func global ble_characteristics  "ble_characteristics"  int, str, var, int
#func global ble_read             "ble_read"             int, str, str, var, int, var
#func global ble_write            "ble_write"            int, str, str, var, int
#func global ble_notify_enable    "ble_notify_enable"    int, str, str
#func global ble_notify_poll      "ble_notify_poll"      int, str, var, int, var

#endif
