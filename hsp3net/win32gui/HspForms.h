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

	protected:
		property System::Windows::Forms::CreateParams ^CreateParams
		{
			virtual System::Windows::Forms::CreateParams ^get() override;
		}

		virtual void WndProc(Message %m) override;
	};
}