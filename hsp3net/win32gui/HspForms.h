#pragma once

#include <msclr\marshal.h>
#include <msclr\marshal_cppstd.h>

using namespace msclr::interop;
using namespace System;
using namespace System::Windows::Forms;

namespace tv::hsp::net
{
	ref class NativeWindowHsp;

	public ref class HspForms : Control
	{
	private:
		NativeWindowHsp ^_native;

	public:
		HspForms(IntPtr hWnd);

	protected:
		virtual void CreateHandle() override;

		virtual void DefWndProc(Message %m) override;

		virtual void DestroyHandle() override;

		virtual void WndProc(Message %m) override;
	};

	public ref class NativeWindowHsp : NativeWindow
	{
	public:
		virtual void WndProcEx(Message %m);
	};

	public ref class HspForms2 : System::Windows::Forms::Form
	{
	public:
		delegate void _WndProcEx(Message %m);
		_WndProcEx ^ex;

		static System::Windows::Forms::CreateParams ^CP;

	public:
		void AddControl(Control ^ctrl);

	protected:
		property System::Windows::Forms::CreateParams ^CreateParams
		{
			virtual System::Windows::Forms::CreateParams ^get() override;
		}

		virtual void WndProc(Message %m) override;
	};

	//
	// .NET コントロール生成ヘルパー
	// HSP の CreateWindow の代わりに .NET コントロールを生成し、
	// Form.Controls に追加して HWND を返す
	//
	public ref class HspControlHelper
	{
	public:
		// Button を生成して Form に追加し、HWND を返す
		static IntPtr CreateButton(
			HspForms2 ^form, String ^text,
			int x, int y, int w, int h,
			int style, int controlId);

		// CheckBox を生成して Form に追加し、HWND を返す
		static IntPtr CreateCheckBox(
			HspForms2 ^form, String ^text,
			int x, int y, int w, int h,
			int style, int controlId);

		// TextBox (single/multi) を生成して Form に追加し、HWND を返す
		static IntPtr CreateTextBox(
			HspForms2 ^form, String ^text,
			int x, int y, int w, int h,
			bool multiline, bool readonly_flag, int controlId);

		// ComboBox を生成して Form に追加し、HWND を返す
		static IntPtr CreateComboBox(
			HspForms2 ^form,
			int x, int y, int w, int h,
			int controlId);

		// ListBox を生成して Form に追加し、HWND を返す
		static IntPtr CreateListBox(
			HspForms2 ^form,
			int x, int y, int w, int h,
			int controlId);

		// controlId から Control を検索
		static Control ^FindControlById(HspForms2 ^form, int controlId);
	};
}
