;============================================================
;  hspmidi.as — winmm ベース MIDI in/out プラグイン宣言 (新形式 typed #func)
;============================================================

#ifndef __hspmidi_as__
#define __hspmidi_as__

#uselib "hspmidi.dll"

; --- MIDI out ---
#func global midi_out_count          "hspmidi_out_count"          var
; midi_out_name var_buf, buf_size, devid
#func global midi_out_name           "hspmidi_out_name"           var, int, int
#func global midi_out_open           "hspmidi_out_open"           int
#func global midi_out_close          "hspmidi_out_close"
#func global midi_out_short          "hspmidi_out_short"          int, int, int
#func global midi_out_note_on        "hspmidi_out_note_on"        int, int, int
#func global midi_out_note_off       "hspmidi_out_note_off"       int, int, int
#func global midi_out_program_change "hspmidi_out_program_change" int, int
#func global midi_out_reset          "hspmidi_out_reset"

; --- MIDI in (ポーリング式) ---
#func global midi_in_count           "hspmidi_in_count"           var
#func global midi_in_name            "hspmidi_in_name"            var, int, int
#func global midi_in_open            "hspmidi_in_open"            int
#func global midi_in_start           "hspmidi_in_start"
#func global midi_in_stop            "hspmidi_in_stop"
#func global midi_in_close           "hspmidi_in_close"
#func global midi_in_poll            "hspmidi_in_poll"            var, var, var, var

; --- MIDI ステータスバイト定数 ---
#define global MIDI_NOTE_OFF        $80
#define global MIDI_NOTE_ON         $90
#define global MIDI_POLY_AFTERTOUCH $A0
#define global MIDI_CONTROL_CHANGE  $B0
#define global MIDI_PROGRAM_CHANGE  $C0
#define global MIDI_CH_AFTERTOUCH   $D0
#define global MIDI_PITCH_BEND      $E0

; --- GM 音色番号 (よく使うもの) ---
#define global GM_ACOUSTIC_GRAND    0
#define global GM_ELECTRIC_PIANO    4
#define global GM_HARPSICHORD       6
#define global GM_VIBRAPHONE       11
#define global GM_NYLON_GUITAR     24
#define global GM_STEEL_GUITAR     25
#define global GM_ELECTRIC_BASS    33
#define global GM_VIOLIN           40
#define global GM_STRING_ENSEMBLE  48
#define global GM_CHOIR_AAHS       52
#define global GM_TRUMPET          56
#define global GM_ALTO_SAX         65
#define global GM_FLUTE            73

; --- MIDI ノート番号 (C4 = 60) ---
#define global NOTE_C4  60
#define global NOTE_D4  62
#define global NOTE_E4  64
#define global NOTE_F4  65
#define global NOTE_G4  67
#define global NOTE_A4  69
#define global NOTE_B4  71
#define global NOTE_C5  72

#endif
