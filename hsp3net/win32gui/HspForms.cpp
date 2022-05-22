#include "HspForms.h"

namespace tv::hsp::net
{

	HspForms::HspForms(IntPtr hWnd)
	{
		_native = gcnew NativeWindowHsp();
		_native->AssignHandle(hWnd);
	}

	void HspForms::CreateHandle()
	{
		_native->CreateHandle(this->CreateParams);
	}

	void HspForms::DefWndProc(Message %m)
	{
		_native->DefWndProc(m);
	}

	void HspForms::DestroyHandle()
	{
		_native->DestroyHandle();
	}

	void HspForms::WndProc(Message %m)
	{
		_native->WndProcEx(m);
	}

	void NativeWindowHsp::WndProcEx(Message %m)
	{
		this->WndProc(m);
	}

	System::Windows::Forms::CreateParams ^HspForms2::CreateParams::get()
	{
		System::Windows::Forms::Form::CreateParams->ExStyle = CP->ExStyle;
		System::Windows::Forms::Form::CreateParams->ClassStyle = CP->Style;
		return System::Windows::Forms::Form::CreateParams;
	}

	void HspForms2::WndProc(Message %m)
	{
		//if (ex == nullptr)
		//{
			//ex == nullptr ? nullptr : ex->Invoke(m);
			//if (m.Result == (IntPtr)12345)
			//{
				System::Windows::Forms::Form::WndProc(m);
			//}
		//}
		//else {
		//	
		//}
	}

}