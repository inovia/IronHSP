#pragma once

//
// HspForms の C リンケージラッパー
// ネイティブ C++ コード (hspwnd_obj.cpp 等) から呼び出す
//

#ifdef __cplusplus
extern "C" {
#endif

// .NET Button を生成して HWND を返す (text は Shift-JIS/MBCS)
void* HspInterop_CreateButton(void* formHwnd, const char* text,
    int x, int y, int w, int h, int style, int controlId);

// .NET CheckBox を生成して HWND を返す
void* HspInterop_CreateCheckBox(void* formHwnd, const char* text,
    int x, int y, int w, int h, int style, int controlId);

// .NET TextBox を生成して HWND を返す
void* HspInterop_CreateTextBox(void* formHwnd, const char* text,
    int x, int y, int w, int h, int multiline, int readonly_flag, int controlId);

// .NET ComboBox を生成して HWND を返す
void* HspInterop_CreateComboBox(void* formHwnd,
    int x, int y, int w, int h, int controlId);

// .NET ListBox を生成して HWND を返す
void* HspInterop_CreateListBox(void* formHwnd,
    int x, int y, int w, int h, int controlId);

// formHwnd から HspForms2 インスタンスを取得できるか
int HspInterop_IsFormAvailable(void* formHwnd);

// controlHwnd が .NET コントロールか判定 (1=.NET, 0=Win32)
int HspInterop_IsManagedControl(void* controlHwnd);

// .NET コントロールを安全に破棄（Controls.Remove + Dispose）
void HspInterop_DestroyControl(void* controlHwnd);

// controlHwnd が .NET CheckBox なら Checked 状態を取得 (0/1, -1=非対応)
int HspInterop_GetCheckBoxState(void* controlHwnd);

// controlHwnd が .NET CheckBox なら Checked 状態をトグル
void HspInterop_ToggleCheckBox(void* controlHwnd);

// .NET ComboBox/ListBox の Items をリセットして文字列リストを設定
// items は改行区切りの文字列 (Shift-JIS)
void HspInterop_SetMultiBoxItems(void* controlHwnd, const char* items, int isComboBox);

// .NET ComboBox/ListBox の選択インデックスを設定
void HspInterop_SetMultiBoxIndex(void* controlHwnd, int index, int isComboBox);

// .NET TextBox/ComboBox/ListBox の Text プロパティを設定
void HspInterop_SetControlText(void* controlHwnd, const char* text);

#ifdef __cplusplus
}
#endif
