;============================================================
;  hspmidi.as — winmm ベース MIDI in/out プラグイン宣言
;============================================================

#ifndef __hspmidi_as__
#define __hspmidi_as__

#uselib "hspmidi.dll"

; --- MIDI out ---
#func global midi_out_count          midi_out_count          $202
#func global midi_out_name           midi_out_name           $202
#func global midi_out_open           midi_out_open           $202
#func global midi_out_close          midi_out_close          $202
#func global midi_out_short          midi_out_short          $202
#func global midi_out_note_on        midi_out_note_on        $202
#func global midi_out_note_off       midi_out_note_off       $202
#func global midi_out_program_change midi_out_program_change $202
#func global midi_out_reset          midi_out_reset          $202

; --- MIDI in (ポーリング式) ---
#func global midi_in_count           midi_in_count           $202
#func global midi_in_name            midi_in_name            $202
#func global midi_in_open            midi_in_open            $202
#func global midi_in_start           midi_in_start           $202
#func global midi_in_stop            midi_in_stop            $202
#func global midi_in_close           midi_in_close           $202
#func global midi_in_poll            midi_in_poll            $202

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
