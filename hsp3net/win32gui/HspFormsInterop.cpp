#include "HspForms.h"
#include "HspFormsInterop.h"
#include <windows.h>

using namespace tv::hsp::net;

//
// Form の HWND から HspForms2 インスタンスを取得
//
static HspForms2^ GetFormFromHwnd(void* formHwnd)
{
	try
	{
		auto ctrl = System::Windows::Forms::Control::FromHandle(System::IntPtr(formHwnd));
		if (ctrl == nullptr) return nullptr;
		return dynamic_cast<HspForms2^>(ctrl);
	}
	catch (...)
	{
		return nullptr;
	}
}

// char* (Shift-JIS) → System::String^ 変換
static System::String^ CharToManagedString(const char* text)
{
	if (text == nullptr) return System::String::Empty;
	// Shift-JIS (code page 932) → Unicode
	int len = MultiByteToWideChar(CP_ACP, 0, text, -1, nullptr, 0);
	if (len <= 0) return System::String::Empty;
	wchar_t* wbuf = new wchar_t[len];
	MultiByteToWideChar(CP_ACP, 0, text, -1, wbuf, len);
	System::String^ result = gcnew System::String(wbuf);
	delete[] wbuf;
	return result;
}


extern "C" {

int HspInterop_IsFormAvailable(void* formHwnd)
{
	return (GetFormFromHwnd(formHwnd) != nullptr) ? 1 : 0;
}

int HspInterop_IsManagedControl(void* controlHwnd)
{
	try
	{
		auto ctrl = System::Windows::Forms::Control::FromHandle(System::IntPtr(controlHwnd));
		return (ctrl != nullptr) ? 1 : 0;
	}
	catch (...) { return 0; }
}

void HspInterop_DestroyControl(void* controlHwnd)
{
	try
	{
		auto ctrl = System::Windows::Forms::Control::FromHandle(System::IntPtr(controlHwnd));
		if (ctrl != nullptr) {
			auto parent = ctrl->Parent;
			if (parent != nullptr) {
				parent->Controls->Remove(ctrl);
			}
			delete ctrl;	// C++/CLI: Dispose() 相当
		}
	}
	catch (...) {}
}

void* HspInterop_CreateButton(void* formHwnd, const char* text,
	int x, int y, int w, int h, int style, int controlId)
{
	auto form = GetFormFromHwnd(formHwnd);
	if (form == nullptr) return nullptr;
	auto result = HspControlHelper::CreateButton(
		form, CharToManagedString(text), x, y, w, h, style, controlId);
	return result.ToPointer();
}

void* HspInterop_CreateCheckBox(void* formHwnd, const char* text,
	int x, int y, int w, int h, int style, int controlId)
{
	auto form = GetFormFromHwnd(formHwnd);
	if (form == nullptr) return nullptr;
	auto result = HspControlHelper::CreateCheckBox(
		form, CharToManagedString(text), x, y, w, h, style, controlId);
	return result.ToPointer();
}

void* HspInterop_CreateTextBox(void* formHwnd, const char* text,
	int x, int y, int w, int h, int multiline, int readonly_flag, int controlId)
{
	auto form = GetFormFromHwnd(formHwnd);
	if (form == nullptr) return nullptr;
	auto result = HspControlHelper::CreateTextBox(
		form, CharToManagedString(text), x, y, w, h,
		multiline != 0, readonly_flag != 0, controlId);
	return result.ToPointer();
}

void* HspInterop_CreateComboBox(void* formHwnd,
	int x, int y, int w, int h, int controlId)
{
	auto form = GetFormFromHwnd(formHwnd);
	if (form == nullptr) return nullptr;
	auto result = HspControlHelper::CreateComboBox(form, x, y, w, h, controlId);
	return result.ToPointer();
}

void* HspInterop_CreateListBox(void* formHwnd,
	int x, int y, int w, int h, int controlId)
{
	auto form = GetFormFromHwnd(formHwnd);
	if (form == nullptr) return nullptr;
	auto result = HspControlHelper::CreateListBox(form, x, y, w, h, controlId);
	return result.ToPointer();
}

int HspInterop_GetCheckBoxState(void* controlHwnd)
{
	try
	{
		auto ctrl = System::Windows::Forms::Control::FromHandle(System::IntPtr(controlHwnd));
		auto chk = dynamic_cast<System::Windows::Forms::CheckBox^>(ctrl);
		if (chk == nullptr) return -1;
		return chk->Checked ? 1 : 0;
	}
	catch (...) { return -1; }
}

void HspInterop_ToggleCheckBox(void* controlHwnd)
{
	try
	{
		auto ctrl = System::Windows::Forms::Control::FromHandle(System::IntPtr(controlHwnd));
		auto chk = dynamic_cast<System::Windows::Forms::CheckBox^>(ctrl);
		if (chk != nullptr) {
			chk->Checked = !chk->Checked;
		}
	}
	catch (...) {}
}

} // extern "C"
