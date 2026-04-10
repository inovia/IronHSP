#include "HspForms.h"
#include <windows.h>

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
		// WM_DESTROY/WM_CLOSE 時に .NET コントロールを先に安全に破棄
		if (m.Msg == 0x0010 || m.Msg == 0x0002) {	// WM_CLOSE, WM_DESTROY
			try {
				while (this->Controls->Count > 0) {
					auto ctrl = this->Controls[0];
					this->Controls->RemoveAt(0);
					try { delete ctrl; } catch (...) {}
				}
			} catch (...) {}
		}
		try {
			System::Windows::Forms::Form::WndProc(m);
		} catch (System::NullReferenceException^) {
			// ListBox等の破棄時の例外を無視
		}
	}

	void HspForms2::AddControl(Control ^ctrl)
	{
		this->Controls->Add(ctrl);
	}

	//
	// HspControlHelper
	//
	// .NET コントロールを生成して Form.Controls に追加する
	// WM_COMMAND 通知は WinForms が自動的に送信する（FlatStyle.System使用時）
	// そのため手動の PostMessage は不要
	//

	// Win32 コントロールIDをコントロールに設定するヘルパー
	static void SetControlId(Control ^ctrl, int controlId)
	{
		// Win32 の Control ID を直接設定
		// HSP の WM_COMMAND ハンドラがこのIDでコントロールを識別する
		::SetWindowLongPtr(
			reinterpret_cast<HWND>(ctrl->Handle.ToPointer()),
			GWLP_ID,
			(LONG_PTR)controlId
		);
	}

	IntPtr HspControlHelper::CreateButton(
		HspForms2 ^form, String ^text,
		int x, int y, int w, int h,
		int style, int controlId)
	{
		Button ^btn = gcnew Button();
		btn->Text = text;
		btn->SetBounds(x, y, w, h);
		btn->Tag = controlId;
		btn->FlatStyle = FlatStyle::System;		// Win32 ネイティブ外観 → WM_COMMAND を自動送信

		form->Controls->Add(btn);
		SetControlId(btn, controlId);
		return btn->Handle;
	}

	IntPtr HspControlHelper::CreateCheckBox(
		HspForms2 ^form, String ^text,
		int x, int y, int w, int h,
		int style, int controlId)
	{
		CheckBox ^chk = gcnew CheckBox();
		chk->Text = text;
		chk->SetBounds(x, y, w, h);
		chk->Tag = controlId;
		chk->FlatStyle = FlatStyle::System;

		form->Controls->Add(chk);
		SetControlId(chk, controlId);
		return chk->Handle;
	}

	IntPtr HspControlHelper::CreateTextBox(
		HspForms2 ^form, String ^text,
		int x, int y, int w, int h,
		bool multiline, bool readonly_flag, int controlId)
	{
		TextBox ^tb = gcnew TextBox();
		tb->Text = text;
		tb->SetBounds(x, y, w, h);
		tb->Tag = controlId;
		tb->Multiline = multiline;
		tb->ReadOnly = readonly_flag;
		if (multiline) {
			tb->ScrollBars = ScrollBars::Vertical;
			tb->AcceptsReturn = true;
			tb->WordWrap = true;
		}

		form->Controls->Add(tb);
		SetControlId(tb, controlId);
		return tb->Handle;
	}

	IntPtr HspControlHelper::CreateComboBox(
		HspForms2 ^form,
		int x, int y, int w, int h,
		int controlId)
	{
		ComboBox ^cb = gcnew ComboBox();
		cb->SetBounds(x, y, w, h);
		cb->Tag = controlId;
		cb->DropDownStyle = ComboBoxStyle::DropDownList;
		cb->FlatStyle = FlatStyle::System;

		form->Controls->Add(cb);
		SetControlId(cb, controlId);
		return cb->Handle;
	}

	// ListBox のハンドル破棄時例外を抑制するサブクラス
	ref class SafeListBox : public ListBox
	{
	protected:
		virtual void OnHandleDestroyed(EventArgs ^e) override
		{
			try { ListBox::OnHandleDestroyed(e); }
			catch (System::NullReferenceException^) {}
		}
	};

	IntPtr HspControlHelper::CreateListBox(
		HspForms2 ^form,
		int x, int y, int w, int h,
		int controlId)
	{
		SafeListBox ^lb = gcnew SafeListBox();
		lb->SetBounds(x, y, w, h);
		lb->Tag = controlId;

		form->Controls->Add(lb);
		SetControlId(lb, controlId);
		return lb->Handle;
	}

	Control ^HspControlHelper::FindControlById(HspForms2 ^form, int controlId)
	{
		for each (Control ^c in form->Controls)
		{
			if (c->Tag != nullptr && (int)c->Tag == controlId)
				return c;
		}
		return nullptr;
	}

}
