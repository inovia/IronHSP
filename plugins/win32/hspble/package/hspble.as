;============================================================
;  hspble.as — BLE GATT クライアント (Windows.Devices.Bluetooth)
;============================================================

#ifndef __hspble_as__
#define __hspble_as__

#uselib "hspble.dll"
#func global ble_init             ble_init             $202
#func global ble_shutdown         ble_shutdown         $202
#func global ble_scan_start       ble_scan_start       $202
#func global ble_scan_stop        ble_scan_stop        $202
#func global ble_scan_poll        ble_scan_poll        $202
#func global ble_connect          ble_connect          $202
#func global ble_disconnect       ble_disconnect       $202
#func global ble_services         ble_services         $202
#func global ble_characteristics  ble_characteristics  $202
#func global ble_read             ble_read             $202
#func global ble_write            ble_write            $202
#func global ble_notify_enable    ble_notify_enable    $202
#func global ble_notify_poll      ble_notify_poll      $202

#endif
