
//
//	HSP3 External DLL manager
//	onion software/onitama 2004/6
//
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <tchar.h>
#include <direct.h>
#include <shlobj.h>

#include <io.h>
#include <fcntl.h>

#include <ocidl.h>
#include <locale.h>

//	Atlのヘッダ
//#include <atlbase.h>
//#include <atlwin.h>
//#include <atlhost.h>

//	AtlをDLLからリンクする場合
#if 0
#pragma comment(lib, "atl.lib")
#include <atldef.h>
#define _ATL_DLL_IMPL
#include <atliface.h>
#endif

#include "../supio.h"
#include "../hsp3ext.h"
#include "hsp3extlib.h"
#include "../hspwnd.h"

#ifdef HSPDISH
#include "../../hsp3/strbuf.h"
#else
#include "../strbuf.h"
#include "hsp3win.h"
#endif


static HSPCTX *hspctx;		// Current Context
static HSPEXINFO *exinfo;	// Info for Plugins
static int *type;
static int *val;
static int *exflg;
static int reffunc_intfunc_ivalue;
static int64_t reffunc_intfunc_i64value;
static double reffunc_intfunc_dvalue;
static void* reffunc_ptrfunc_ptrvalue[2];
//static PVal **pmpval;


#ifndef HSP_COM_UNSUPPORTED

#include "hspvar_comobj.h"
#include "hspvar_variant.h"
#include "comobj_event.h"

static PVal *comres_pval;
static APTR comres_aptr;
#include "hspvar_netobj.h"
#ifndef HSPCL_WIN
#include "HspFormsInterop.h"
#endif
#include "Hsp3Net.h"
using namespace tv::hsp::net;
// .NET
static PVal *netres_pval;
static APTR netres_aptr;
int neterror_mode = 0;				// 0=stat only, 1=throw HSPERR_DOTNET_EXCEPTION

/*------------------------------------------------------------*/
/*		callback thunk (setcallback / callbackarg)            */
/*------------------------------------------------------------*/

#define HSP_CALLBACK_ARG_MAX 16

struct HspCallbackThunk {
	void *code;
	int codeSize;
	unsigned short *label;
	int argCount;
	INT_PTR args[HSP_CALLBACK_ARG_MAX];
};

static HspCallbackThunk **hsp_callback_thunks = NULL;
static int hsp_callback_thunk_count = 0;
static int hsp_callback_thunk_capacity = 0;
static HspCallbackThunk *hsp_callback_current = NULL;

static HspCallbackThunk *hsp_callback_alloc()
{
	if (hsp_callback_thunk_count >= hsp_callback_thunk_capacity) {
		int newCap = (hsp_callback_thunk_capacity == 0) ? 16 : hsp_callback_thunk_capacity * 2;
		HspCallbackThunk **newArr = (HspCallbackThunk **)realloc(
			hsp_callback_thunks, sizeof(HspCallbackThunk*) * newCap);
		if (newArr == NULL) return NULL;
		hsp_callback_thunks = newArr;
		hsp_callback_thunk_capacity = newCap;
	}
	HspCallbackThunk *thunk = (HspCallbackThunk *)malloc(sizeof(HspCallbackThunk));
	if (thunk == NULL) return NULL;
	memset(thunk, 0, sizeof(HspCallbackThunk));
	hsp_callback_thunks[hsp_callback_thunk_count++] = thunk;
	return thunk;
}

static void __cdecl hsp_thunk_bridge(HspCallbackThunk *thunk)
{
	hsp_callback_current = thunk;
	code_callback((const unsigned short *)thunk->label);
}

static INT_PTR __cdecl hsp_thunk_getstat(void)
{
	return (INT_PTR)hspctx->stat;
}

#ifndef HSP64
static void *create_callback_thunk_x86(HspCallbackThunk *thunk)
{
	int nargs = thunk->argCount;
	unsigned char buf[256];
	int pos = 0;
	buf[pos++] = 0x55;
	buf[pos++] = 0x89; buf[pos++] = 0xE5;
	for (int i = 0; i < nargs && i < HSP_CALLBACK_ARG_MAX; i++) {
		int offset = 8 + i * 4;
		buf[pos++] = 0x8B; buf[pos++] = 0x45; buf[pos++] = (unsigned char)offset;
		buf[pos++] = 0xA3;
		*(void**)(buf + pos) = &thunk->args[i];
		pos += 4;
	}
	buf[pos++] = 0x68;
	*(void**)(buf + pos) = thunk;
	pos += 4;
	buf[pos++] = 0xE8;
	int callRelPos = pos;
	*(int*)(buf + pos) = 0;
	pos += 4;
	buf[pos++] = 0x83; buf[pos++] = 0xC4; buf[pos++] = 0x04;
	buf[pos++] = 0xE8;
	int statRelPos = pos;
	*(int*)(buf + pos) = 0;
	pos += 4;
	buf[pos++] = 0x5D;
	if (nargs > 0) {
		buf[pos++] = 0xC2;
		*(unsigned short*)(buf + pos) = (unsigned short)(nargs * 4);
		pos += 2;
	} else {
		buf[pos++] = 0xC3;
	}
	void *execMem = VirtualAlloc(NULL, pos, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);
	if (execMem == NULL) return NULL;
	memcpy(execMem, buf, pos);
	INT_PTR execBase = (INT_PTR)execMem;
	*(int*)((unsigned char*)execMem + callRelPos) =
		(int)((INT_PTR)&hsp_thunk_bridge - (execBase + callRelPos + 4));
	*(int*)((unsigned char*)execMem + statRelPos) =
		(int)((INT_PTR)&hsp_thunk_getstat - (execBase + statRelPos + 4));
	thunk->code = execMem;
	thunk->codeSize = pos;
	return execMem;
}
#else
static void *create_callback_thunk_x64(HspCallbackThunk *thunk)
{
	int nargs = thunk->argCount;
	unsigned char buf[512];
	int pos = 0;
	buf[pos++] = 0x48; buf[pos++] = 0x83; buf[pos++] = 0xEC; buf[pos++] = 0x28;
	INT_PTR argsAddr = (INT_PTR)&thunk->args[0];
	for (int i = 0; i < nargs && i < 4; i++) {
		buf[pos++] = 0x48; buf[pos++] = 0xB8;
		*(INT_PTR*)(buf + pos) = argsAddr + i * sizeof(INT_PTR);
		pos += 8;
		switch (i) {
		case 0: buf[pos++] = 0x48; buf[pos++] = 0x89; buf[pos++] = 0x08; break;
		case 1: buf[pos++] = 0x48; buf[pos++] = 0x89; buf[pos++] = 0x10; break;
		case 2: buf[pos++] = 0x4C; buf[pos++] = 0x89; buf[pos++] = 0x00; break;
		case 3: buf[pos++] = 0x4C; buf[pos++] = 0x89; buf[pos++] = 0x08; break;
		}
	}
	for (int i = 4; i < nargs && i < HSP_CALLBACK_ARG_MAX; i++) {
		int stackOff = 0x50 + (i - 4) * 8;
		buf[pos++] = 0x48; buf[pos++] = 0x8B; buf[pos++] = 0x84; buf[pos++] = 0x24;
		*(int*)(buf + pos) = stackOff;
		pos += 4;
		buf[pos++] = 0x49; buf[pos++] = 0xBA;
		*(INT_PTR*)(buf + pos) = argsAddr + i * sizeof(INT_PTR);
		pos += 8;
		buf[pos++] = 0x49; buf[pos++] = 0x89; buf[pos++] = 0x02;
	}
	buf[pos++] = 0x48; buf[pos++] = 0xB9;
	*(INT_PTR*)(buf + pos) = (INT_PTR)thunk;
	pos += 8;
	buf[pos++] = 0x48; buf[pos++] = 0xB8;
	*(INT_PTR*)(buf + pos) = (INT_PTR)&hsp_thunk_bridge;
	pos += 8;
	buf[pos++] = 0xFF; buf[pos++] = 0xD0;
	buf[pos++] = 0x48; buf[pos++] = 0xB8;
	*(INT_PTR*)(buf + pos) = (INT_PTR)&hsp_thunk_getstat;
	pos += 8;
	buf[pos++] = 0xFF; buf[pos++] = 0xD0;
	buf[pos++] = 0x48; buf[pos++] = 0x83; buf[pos++] = 0xC4; buf[pos++] = 0x28;
	buf[pos++] = 0xC3;
	void *execMem = VirtualAlloc(NULL, pos, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);
	if (execMem == NULL) return NULL;
	memcpy(execMem, buf, pos);
	thunk->code = execMem;
	thunk->codeSize = pos;
	return execMem;
}
#endif

/*------------------------------------------------------------*/
/*		COM callback interface (#defcbcom)                    */
/*------------------------------------------------------------*/

#define HSP_CBCOM_ARG_MAX 16
#define HSP_CBCOM_METHOD_MAX 64

struct HspCbComMethodInfo {
	int vtable_idx;                         // 3..N
	int return_type;                        // MPTYPE_INUM (HRESULT) 等
	int arg_count;                          // user 引数 count (this 含まず)
	short arg_types[HSP_CBCOM_ARG_MAX];     // MPTYPE_*
	const unsigned short *label_ptr;        // HSP label code ptr
	void *thunk_code;                       // 動的生成された C 関数 (vtable 用)
	struct HspCbComMethodThunk *thunk;      // bridge 用 metadata
};

struct HspCbComClass {
	char *name;
	IID iid;
	int max_vtable_idx;                     // vtable_count = max+1
	HspCbComMethodInfo *methods;            // [max_vtable_idx+1] (slot 0..max)
	void **vtable;                          // [max_vtable_idx+1] 完成済み vtable (全インスタンス共有)
	int finalized;
};

struct HspCbComInstance {
	void **vtable;                          // ★ COM レイアウト先頭。caller は this 経由で呼ぶ
	LONG refcount;
	HspCbComClass *klass;
	int instance_id;
	int tag_int;
	char *tag_str;                          // strdup 済み (なければ NULL)
};

struct HspCbComMethodThunk {
	void *code;
	int codeSize;
	HspCbComClass *klass;
	int method_idx;
	int slot_count;                         // this + user 引数の slot 数 (thunk arg copy 用)
	INT_PTR args[HSP_CBCOM_ARG_MAX];        // [0]=this, [1..]=user 引数
};

// 現在実行中の callback コンテキスト
static HspCbComMethodThunk *hsp_cbcom_current_thunk = NULL;
static INT_PTR hsp_cbcom_return_value = 0;

// Class registry
static HspCbComClass **hsp_cbcom_classes = NULL;
static int hsp_cbcom_class_count = 0;
static int hsp_cbcom_class_capacity = 0;

// Instance auto-incremented ID
static int hsp_cbcom_next_instance_id = 1;

// ----- 自動実装 IUnknown ------------------------------------

static HRESULT STDMETHODCALLTYPE hsp_cbcom_QueryInterface(IUnknown *self, REFIID riid, void **ppv)
{
	HspCbComInstance *inst = (HspCbComInstance *)self;
	if (ppv == NULL) return E_POINTER;
	if (IsEqualIID(riid, IID_IUnknown) || IsEqualIID(riid, inst->klass->iid)) {
		*ppv = self;
		InterlockedIncrement(&inst->refcount);
		return S_OK;
	}
	*ppv = NULL;
	return E_NOINTERFACE;
}

static ULONG STDMETHODCALLTYPE hsp_cbcom_AddRef(IUnknown *self)
{
	HspCbComInstance *inst = (HspCbComInstance *)self;
	return (ULONG)InterlockedIncrement(&inst->refcount);
}

static ULONG STDMETHODCALLTYPE hsp_cbcom_Release(IUnknown *self)
{
	HspCbComInstance *inst = (HspCbComInstance *)self;
	LONG r = InterlockedDecrement(&inst->refcount);
	if (r == 0) {
		if (inst->tag_str) free(inst->tag_str);
		free(inst);
	}
	return (ULONG)r;
}

// ----- thunk → HSP dispatcher bridge ------------------------

static INT_PTR __cdecl hsp_cbcom_bridge(HspCbComMethodThunk *thunk)
{
	HspCbComMethodThunk *prev = hsp_cbcom_current_thunk;
	INT_PTR prev_ret = hsp_cbcom_return_value;
	hsp_cbcom_current_thunk = thunk;
	hsp_cbcom_return_value = 0;     // default S_OK

	HspCbComMethodInfo *info = &thunk->klass->methods[thunk->method_idx];
	if (info->label_ptr != NULL) {
		try {
			code_callback(info->label_ptr);
		} catch (...) {
			hsp_cbcom_return_value = E_FAIL;
		}
	}

	INT_PTR ret = hsp_cbcom_return_value;
	hsp_cbcom_current_thunk = prev;
	hsp_cbcom_return_value = prev_ret;
	return ret;
}

// ----- thunk asm 生成 ---------------------------------------

#ifdef HSP64
static void *hsp_cbcom_create_thunk_x64(HspCbComMethodThunk *thunk)
{
	int nargs = thunk->slot_count;
	unsigned char buf[512];
	int pos = 0;

	// sub rsp, 0x28
	buf[pos++] = 0x48; buf[pos++] = 0x83; buf[pos++] = 0xEC; buf[pos++] = 0x28;

	INT_PTR argsAddr = (INT_PTR)&thunk->args[0];

	// rcx/rdx/r8/r9 → args[0..3]
	for (int i = 0; i < nargs && i < 4; i++) {
		buf[pos++] = 0x48; buf[pos++] = 0xB8;
		*(INT_PTR*)(buf + pos) = argsAddr + i * sizeof(INT_PTR);
		pos += 8;
		switch (i) {
		case 0: buf[pos++] = 0x48; buf[pos++] = 0x89; buf[pos++] = 0x08; break; // mov [rax], rcx
		case 1: buf[pos++] = 0x48; buf[pos++] = 0x89; buf[pos++] = 0x10; break; // mov [rax], rdx
		case 2: buf[pos++] = 0x4C; buf[pos++] = 0x89; buf[pos++] = 0x00; break; // mov [rax], r8
		case 3: buf[pos++] = 0x4C; buf[pos++] = 0x89; buf[pos++] = 0x08; break; // mov [rax], r9
		}
	}

	// stack args 4+
	for (int i = 4; i < nargs && i < HSP_CBCOM_ARG_MAX; i++) {
		int stackOff = 0x50 + (i - 4) * 8;
		buf[pos++] = 0x48; buf[pos++] = 0x8B; buf[pos++] = 0x84; buf[pos++] = 0x24;
		*(int*)(buf + pos) = stackOff;
		pos += 4;
		buf[pos++] = 0x49; buf[pos++] = 0xBA;
		*(INT_PTR*)(buf + pos) = argsAddr + i * sizeof(INT_PTR);
		pos += 8;
		buf[pos++] = 0x49; buf[pos++] = 0x89; buf[pos++] = 0x02;
	}

	// mov rcx, IMM64 (thunk addr)
	buf[pos++] = 0x48; buf[pos++] = 0xB9;
	*(INT_PTR*)(buf + pos) = (INT_PTR)thunk;
	pos += 8;

	// mov rax, IMM64 (bridge addr)
	buf[pos++] = 0x48; buf[pos++] = 0xB8;
	*(INT_PTR*)(buf + pos) = (INT_PTR)&hsp_cbcom_bridge;
	pos += 8;

	// call rax
	buf[pos++] = 0xFF; buf[pos++] = 0xD0;

	// rax = bridge return value (HRESULT) — そのまま返す

	// add rsp, 0x28
	buf[pos++] = 0x48; buf[pos++] = 0x83; buf[pos++] = 0xC4; buf[pos++] = 0x28;
	// ret
	buf[pos++] = 0xC3;

	void *execMem = VirtualAlloc(NULL, pos, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);
	if (execMem == NULL) return NULL;
	memcpy(execMem, buf, pos);
	thunk->code = execMem;
	thunk->codeSize = pos;
	return execMem;
}
#else
static void *hsp_cbcom_create_thunk_x86(HspCbComMethodThunk *thunk)
{
	int nargs = thunk->slot_count;
	unsigned char buf[256];
	int pos = 0;
	// push ebp; mov ebp, esp
	buf[pos++] = 0x55;
	buf[pos++] = 0x89; buf[pos++] = 0xE5;
	// args[i] = [ebp + 8 + i*4]
	for (int i = 0; i < nargs && i < HSP_CBCOM_ARG_MAX; i++) {
		int offset = 8 + i * 4;
		buf[pos++] = 0x8B; buf[pos++] = 0x45; buf[pos++] = (unsigned char)offset; // mov eax, [ebp+off]
		buf[pos++] = 0xA3;
		*(void**)(buf + pos) = &thunk->args[i];
		pos += 4;
	}
	// push thunk
	buf[pos++] = 0x68;
	*(void**)(buf + pos) = thunk;
	pos += 4;
	// call hsp_cbcom_bridge
	buf[pos++] = 0xE8;
	int callRelPos = pos;
	*(int*)(buf + pos) = 0;
	pos += 4;
	// add esp, 4
	buf[pos++] = 0x83; buf[pos++] = 0xC4; buf[pos++] = 0x04;
	// pop ebp
	buf[pos++] = 0x5D;
	// ret nargs*4 (stdcall)
	if (nargs > 0) {
		buf[pos++] = 0xC2;
		*(unsigned short*)(buf + pos) = (unsigned short)(nargs * 4);
		pos += 2;
	} else {
		buf[pos++] = 0xC3;
	}

	void *execMem = VirtualAlloc(NULL, pos, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);
	if (execMem == NULL) return NULL;
	memcpy(execMem, buf, pos);
	INT_PTR execBase = (INT_PTR)execMem;
	*(int*)((unsigned char*)execMem + callRelPos) =
		(int)((INT_PTR)&hsp_cbcom_bridge - (execBase + callRelPos + 4));
	thunk->code = execMem;
	thunk->codeSize = pos;
	return execMem;
}
#endif

// ----- Class registry --------------------------------------

static HspCbComClass *hsp_cbcom_find_class(const char *name)
{
	for (int i = 0; i < hsp_cbcom_class_count; i++) {
		if (strcmp(hsp_cbcom_classes[i]->name, name) == 0) {
			return hsp_cbcom_classes[i];
		}
	}
	return NULL;
}

static HspCbComClass *hsp_cbcom_register_class(const char *name, REFIID iid, int max_vtable_idx)
{
	if (max_vtable_idx < 2) max_vtable_idx = 2;       // 最低 IUnknown 3 個分
	if (max_vtable_idx >= HSP_CBCOM_METHOD_MAX) return NULL;

	HspCbComClass *klass = (HspCbComClass *)calloc(1, sizeof(HspCbComClass));
	if (!klass) return NULL;
	klass->name = _strdup(name);
	klass->iid = iid;
	klass->max_vtable_idx = max_vtable_idx;
	int slots = max_vtable_idx + 1;
	klass->methods = (HspCbComMethodInfo *)calloc(slots, sizeof(HspCbComMethodInfo));
	if (!klass->methods) { free(klass->name); free(klass); return NULL; }

	if (hsp_cbcom_class_count >= hsp_cbcom_class_capacity) {
		int newCap = (hsp_cbcom_class_capacity == 0) ? 8 : hsp_cbcom_class_capacity * 2;
		HspCbComClass **newArr = (HspCbComClass **)realloc(
			hsp_cbcom_classes, sizeof(HspCbComClass *) * newCap);
		if (!newArr) { free(klass->methods); free(klass->name); free(klass); return NULL; }
		hsp_cbcom_classes = newArr;
		hsp_cbcom_class_capacity = newCap;
	}
	hsp_cbcom_classes[hsp_cbcom_class_count++] = klass;
	return klass;
}

static int hsp_cbcom_add_method(HspCbComClass *klass, int vtable_idx,
	int return_type, int arg_count, const short *arg_types,
	const unsigned short *label_ptr)
{
	if (klass->finalized) return -1;
	if (vtable_idx < 3 || vtable_idx > klass->max_vtable_idx) return -1;
	if (arg_count > HSP_CBCOM_ARG_MAX - 1) return -1;

	HspCbComMethodInfo *info = &klass->methods[vtable_idx];
	info->vtable_idx = vtable_idx;
	info->return_type = return_type;
	info->arg_count = arg_count;
	for (int i = 0; i < arg_count; i++) info->arg_types[i] = arg_types[i];
	info->label_ptr = label_ptr;
	return 0;
}

static int hsp_cbcom_finalize_class(HspCbComClass *klass)
{
	if (klass->finalized) return 0;
	int slots = klass->max_vtable_idx + 1;
	klass->vtable = (void **)calloc(slots, sizeof(void *));
	if (!klass->vtable) return -1;

	// IUnknown
	klass->vtable[0] = (void *)&hsp_cbcom_QueryInterface;
	klass->vtable[1] = (void *)&hsp_cbcom_AddRef;
	klass->vtable[2] = (void *)&hsp_cbcom_Release;

	// User methods
	for (int i = 3; i < slots; i++) {
		HspCbComMethodInfo *info = &klass->methods[i];
		if (info->label_ptr == NULL) {
			// 未登録 slot → NULL のままだと caller が呼んだ瞬間に AV するので
			// 「未実装メソッド = E_NOTIMPL を返す stub」 を埋めたいが、簡単のため
			// thunk を作って bridge で空 callback (= return 0) させる。
			// (実際の COM では 8 メソッド全部実装する想定なので、この pass は念のため)
			klass->vtable[i] = NULL;
			continue;
		}
		HspCbComMethodThunk *thunk = (HspCbComMethodThunk *)calloc(1, sizeof(HspCbComMethodThunk));
		if (!thunk) return -1;
		thunk->klass = klass;
		thunk->method_idx = i;
		thunk->slot_count = 1 + info->arg_count;   // this + user
#ifdef HSP64
		void *code = hsp_cbcom_create_thunk_x64(thunk);
#else
		void *code = hsp_cbcom_create_thunk_x86(thunk);
#endif
		if (!code) { free(thunk); return -1; }
		info->thunk = thunk;
		info->thunk_code = code;
		klass->vtable[i] = code;
	}

	klass->finalized = 1;
	return 0;
}

// ----- インスタンス生成 ------------------------------------

static IUnknown *hsp_cbcom_create_instance(HspCbComClass *klass, int tag_int, const char *tag_str)
{
	if (!klass->finalized) {
		if (hsp_cbcom_finalize_class(klass) != 0) return NULL;
	}
	HspCbComInstance *inst = (HspCbComInstance *)calloc(1, sizeof(HspCbComInstance));
	if (!inst) return NULL;
	inst->vtable = klass->vtable;
	inst->refcount = 1;
	inst->klass = klass;
	inst->instance_id = hsp_cbcom_next_instance_id++;
	inst->tag_int = (tag_str == NULL) ? (tag_int ? tag_int : inst->instance_id) : tag_int;
	inst->tag_str = (tag_str && *tag_str) ? _strdup(tag_str) : NULL;
	return (IUnknown *)inst;
}

// (Phase B0 までで定義した C API は B1/B2 から呼び出される)

/*------------------------------------------------------------*/

// netdelegate 用: HSP ラベルを .NET コールバックから呼び出すヘルパー
static void hsp_callback_invoke(void *label_ptr)
{
	code_callback((const unsigned short *)label_ptr);
}

static int hsp_callback_getstat()
{
	auto ctx = code_getctx();
	return (int)ctx->stat;
}

static bool hsp_callback_initialized = false;
static void hsp_callback_init()
{
	if (!hsp_callback_initialized)
	{
		HspCallbackProxy::_CallbackFunc = IntPtr((void*)&hsp_callback_invoke);
		HspCallbackProxy::_GetStatFunc = IntPtr((void*)&hsp_callback_getstat);
		hsp_callback_initialized = true;
	}
}

// .NET操作の結果をstatに設定し、失敗時はneterror_modeに応じてthrowする
static void net_setstat(bool success)
{
	auto ctx = code_getctx();
	if (success) {
		ctx->stat = 0;
	} else {
		ctx->stat = -1;
		if (neterror_mode >= 1) {
			throw HSPERR_DOTNET_EXCEPTION;
		}
	}
}
typedef void (CALLBACK *_ATXDLL_INIT)(void);
typedef HRESULT (CALLBACK *_ATXDLL_GETCTRL)( HWND, void **res );
static _ATXDLL_INIT fn_atxinit = NULL;
static _ATXDLL_GETCTRL fn_atxgetctrl = NULL;
static HINSTANCE hinst_atxdll = NULL;
static LPTSTR atxwndclass = NULL;

#endif	// !defined(HSP_COM_UNSUPPORTED)

#define GetPRM(id) (&hspctx->mem_finfo[id])
#define strp(dsptr) &hspctx->mem_mds[dsptr]


/*------------------------------------------------------------*/
/*
		System Information initialization
*/
/*------------------------------------------------------------*/

static void InitSystemInformation(void)
{
	//		コマンドライン & システムフォルダ関連
	char *resp8;
	LPTSTR cl;
	HSPCTX* ctx = code_getctx();
	cl = GetCommandLine();
	cl = strsp_cmdsW(cl);
#ifdef HSPDEBUG
	cl = strsp_cmdsW(cl);
#endif
	apichartohspchar(cl, &resp8);
	sbStrCopy(&(ctx->cmdline), resp8);
	freehc(&resp8);

	TCHAR pw[HSPCTX_REFSTR_MAX];
	TCHAR fname[HSPCTX_REFSTR_MAX];
	GetModuleFileName(NULL, fname, _MAX_PATH);
	getpathW(fname, pw, 32);
	apichartohspchar(pw, &resp8);
	sbStrCopy(&(ctx->stmp), resp8);
	CutLastChr(ctx->stmp, '\\');
	sbStrCopy(&(ctx->modfilename), ctx->stmp);
	strcat(ctx->stmp, "\\hsptv\\");
	freehc(&resp8);
	sbStrCopy(&(ctx->tvfoldername), ctx->stmp);
}

#ifdef UNICODE
UINT WinExec(LPCTSTR lpCmdLine, UINT uCmdShow)
{
	STARTUPINFO sui = {
		sizeof(STARTUPINFO),
		NULL,
		NULL,
		NULL,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		STARTF_USESHOWWINDOW,
		uCmdShow,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL
	};
	PROCESS_INFORMATION pi = {
		NULL, NULL, 0, 0
	};
	CreateProcess(NULL, (LPTSTR)lpCmdLine, NULL, NULL, FALSE, NORMAL_PRIORITY_CLASS, NULL, NULL, &sui, &pi);
	return 32;
}
#endif


/*------------------------------------------------------------*/
/*
		Language initialization
*/
/*------------------------------------------------------------*/

typedef int(CALLBACK* _Kernel_GetUserDefaultUILanguage)(void);
static _Kernel_GetUserDefaultUILanguage fn_GetUserDefaultUILanguage = NULL;
static HINSTANCE hinst_kerneldll = NULL;

static void InitLanguage(void)
{
	hinst_kerneldll = LoadLibrary(TEXT("kernel32"));
	if (hinst_kerneldll == NULL) return;
	fn_GetUserDefaultUILanguage = (_Kernel_GetUserDefaultUILanguage)GetProcAddress(hinst_kerneldll, "GetUserDefaultUILanguage");
	if (fn_GetUserDefaultUILanguage == NULL) return;

	int lang = fn_GetUserDefaultUILanguage();
	if (lang == 0x411) {
		//	Set Japanese language
		HSPCTX* ctx = code_getctx();
		ctx->language = HSPCTX_LANGUAGE_JP;
		ctx->langcode[0] = 'j';
		ctx->langcode[1] = 'a';
		setlocale(LC_ALL, "Japanese");
	}
}

static void TermLanguage(void)
{
	if (hinst_kerneldll) {
		FreeLibrary(hinst_kerneldll);
		hinst_kerneldll = NULL;
	}
}

/*------------------------------------------------------------*/
/*
		ATL initialization / unitialization routines
*/
/*------------------------------------------------------------*/

#ifndef HSP_COM_UNSUPPORTED


static void InitAtxDll( void )
{
	if ( hinst_atxdll != NULL ) return;

	struct {
		TCHAR *pszDllName;			// DLLの名前
		TCHAR *pszWindowClassName;	// ウインドウクラスの名前

	} dllInfo[] = {
	  { TEXT("atl110.dll"), TEXT("AtlAxWin110") }
	, { TEXT("atl100.dll"), TEXT("AtlAxWin100") }
	, { TEXT("atl90.dll") , TEXT("AtlAxWin90")  }
	, { TEXT("atl80.dll") , TEXT("AtlAxWin80")  }
	, { TEXT("atl71.dll") , TEXT("AtlAxWin71")  }
	, { TEXT("atl.dll")   , TEXT("AtlAxWin")    }
	};

	for (int i = 0; i < _countof(dllInfo); i++) {
		hinst_atxdll = LoadLibrary(dllInfo[i].pszDllName);
		if (hinst_atxdll) {
			atxwndclass = dllInfo[i].pszWindowClassName;
			break;
		}
	}

	if (hinst_atxdll == NULL) return;

	fn_atxinit = (_ATXDLL_INIT)GetProcAddress( hinst_atxdll, "AtlAxWinInit" );
	fn_atxgetctrl = (_ATXDLL_GETCTRL)GetProcAddress( hinst_atxdll, "AtlAxGetControl" );
	if ( fn_atxinit != NULL) fn_atxinit();
}

static void TermAtxDll( void )
{
	// Atl.dll の解放
	//
	// ここで解放すると強制終了する場合があるかも
	// (変数のクリーンアップより先に実行されるのが原因？)
	//
	if ( hinst_atxdll == NULL ) return;
	FreeLibrary( hinst_atxdll );
	hinst_atxdll = NULL;
}

#endif	// !defined(HSP_COM_UNSUPPORTED)


/*------------------------------------------------------------*/
/*
		window object support
*/
/*------------------------------------------------------------*/

#ifndef HSPDISH

static BMSCR *GetBMSCR( void )
{
	HSPEXINFO *exinfo;
	exinfo = hspctx->exinfo2;
	return (BMSCR *)exinfo->HspFunc_getbmscr( *(exinfo->actscr) );
}


static void Object_WindowDelete( HSPOBJINFO *info )
{
	DestroyWindow( info->hCld );
	info->hCld = NULL;
}


// static int AddHSPObject( HWND handle, int mode, int addy, PVal *pv, APTR aptr )
static int AddHSPObject( HWND handle, int mode, int addy )
{
	//		ウインドゥオブジェクトを追加する
	//
	HSPEXINFO *exinfo;
	HSPOBJINFO obj;
	BMSCR *bm;
	int wid, entry, ppy;

	entry = -1;

	if ( handle != NULL ) {

		exinfo = hspctx->exinfo2;
		wid = *(exinfo->actscr);				// アクティブなウインドゥID
		entry = exinfo->HspFunc_addobj( wid );	// エントリーIDを得る
		bm = GetBMSCR();

		obj.hCld = handle;
		obj.owmode = mode;
		obj.option = 0;
		obj.bm = bm;
		obj.func_notice = NULL;
		obj.func_objprm = NULL;
		obj.func_delete = Object_WindowDelete;
		obj.hspctx = NULL;

		exinfo->HspFunc_setobj( wid, entry, &obj );

		ppy = addy; if ( ppy < bm->py ) ppy = bm->py;
		bm->cy += ppy;
	}

	hspctx->stat = entry;					// システム変数statにIDを入れる
	return entry;
}

#endif

/*------------------------------------------------------------*/
/*
		COM Object interface
*/
/*------------------------------------------------------------*/

#ifndef HSP_COM_UNSUPPORTED

// 一時領域として使用する VARIANT
static VARIANT comconv_var;

void *comget_variant( VARIANT *var, int *restype, BOOL fvariantret /* = FALSE*/ )
{
	//	VARIANT型→HSPの型に変換する
	//
	int size;
	BSTR bstr;
/*
	rev 43
	mingw : warning : 定数へのポインタを非定数へのポインタに代入
	に対処
*/
	void const *ptr;
	if ( fvariantret ) {
		VariantCopy( &comconv_var, var );
		*restype = HSPVAR_FLAG_VARIANT;
		return &comconv_var;
	}

	VariantCopyInd( &comconv_var, var );
	switch ( comconv_var.vt ) {

	case VT_R4:
		VariantChangeType( &comconv_var, &comconv_var, VARIANT_NOVALUEPROP, VT_R8 );
	case VT_R8:
		*restype = HSPVAR_FLAG_DOUBLE;
		return &comconv_var.dblVal;

	case VT_BSTR:
		// 文字列全体を返すため、ANSI文字列をバイナリデータBSTRとして格納
		ptr = comconv_var.bstrVal;
		if ( ptr == NULL ) ptr = L"";
#ifndef HSPUTF8
		size = cnvsjis( NULL, (char *)ptr, 0 );
#else
		size = cnvu8( NULL, (HSPAPICHAR *)ptr, 0);
#endif
		bstr = SysAllocStringByteLen( NULL, size );
		if ( bstr == NULL ) throw HSPERR_OUT_OF_MEMORY;
#ifndef HSPUTF8
		cnvsjis( (char *)bstr, (char *)ptr, size );
#else
		cnvu8( (char *)bstr, (HSPAPICHAR *)ptr, size);
#endif
		SysFreeString( comconv_var.bstrVal );
		comconv_var.bstrVal = bstr;
		*restype = HSPVAR_FLAG_STR;
		return comconv_var.bstrVal;

	case VT_DISPATCH:
	case VT_UNKNOWN:
		*restype = HSPVAR_FLAG_COMSTRUCT;
		return &comconv_var.punkVal;

	case VT_I2:
	case VT_UI2:
	case VT_I1:
	case VT_UI1:
	case VT_I8:
	case VT_UI8:
	case VT_BOOL:
		VariantChangeType( &comconv_var, &comconv_var, VARIANT_NOVALUEPROP, VT_I4 );
	case VT_I4:
	case VT_UI4:
	case VT_ERROR:
	case VT_INT:
	case VT_UINT:
		*restype = HSPVAR_FLAG_INT;
		return &comconv_var.lVal;

	default:
		if ( comconv_var.vt & VT_ARRAY ) {
			*restype = HSPVAR_FLAG_VARIANT;		// SafeArray は Variant 型変数で扱う
			return &comconv_var;
		}
		throw HSPERR_INVALID_TYPE;
	}
}

void comset_variant( VARIANT *var, void *data, int vtype )
{
	//		HSPの型→VARIANT 型に変換する
	//
	IUnknown *punk;

	VariantClear( var );
	switch( vtype ) {
	case HSPVAR_FLAG_INT:
		var->vt = VT_I4;
		var->lVal = *(int *)data;
		break;
	case HSPVAR_FLAG_DOUBLE:
		var->vt = VT_R8;
		var->dblVal = *(double *)data;
		break;
	case HSPVAR_FLAG_STR:
		var->vt = VT_BSTR;
		var->bstrVal = comget_bstr( (char *)data );
		break;
	case HSPVAR_FLAG_COMSTRUCT:
		var->vt = VT_UNKNOWN;
		var->punkVal = NULL;
		punk = *(IUnknown **)data;
		if ( punk == NULL ) break;
		punk->QueryInterface( IID_IDispatch, (void**)&var->pdispVal );
		if ( var->pdispVal != NULL ) {
			var->vt = VT_DISPATCH;
		} else {
			var->punkVal = punk;
			punk->AddRef();
		}
		break;
	case HSPVAR_FLAG_VARIANT:
		VariantCopy( var, (VARIANT *)data );
		break;
	default:
		throw HSPERR_INVALID_TYPE;
	}
}

void comget_variantres( VARIANT *var, HRESULT hr, BOOL noconv )
{
	//		返値のVARIANTを変数に反映させる
	//
	void *ptr;
	int restype;
	hspctx->stat = (int)hr;
	if ( comres_pval == NULL ) return;
	if ( noconv ) {
		// Variant のまま返す
		code_setva( comres_pval, comres_aptr, HSPVAR_FLAG_VARIANT, var );
	} else {
		// 変数を対応する型に変換
		if ( var->vt != VT_EMPTY ) {
			ptr = comget_variant( var, &restype );
			code_setva( comres_pval, comres_aptr, restype, ptr );
		}
	}
}

void netget_variantres(NativePointer* ptr)
{
	if (netres_pval == nullptr) return;
	code_setva(netres_pval, netres_aptr, TYPE_NETOBJ, &ptr);
}

DISPID get_dispid( IUnknown* punk, char *propname, BOOL *bVariant )
{
	//		IDispatch の DISPID を取得する
	//
	HRESULT hr;
	IDispatch *disp;
	DISPID dispid;
	char *name = propname;
	LPOLESTR list[]={ (LPOLESTR)(hspctx->stmp) };

	if ( name[0] == '\0' ) return DISPID_VALUE;

	if ( bVariant != NULL ) *bVariant = ( name[0] == '.' );
	if ( name[0] == '.' ) name++;

	disp = (IDispatch *)punk;
	cnvwstr( hspctx->stmp, name, HSPCTX_REFSTR_MAX/sizeof(WCHAR)-1 );
	hr = disp->GetIDsOfNames( IID_NULL, list, 1, LOCALE_SYSTEM_DEFAULT, &dispid );

	if ( FAILED(hr) || dispid == DISPID_UNKNOWN ) throw HSPERR_INVALID_PARAMETER;
	return dispid;
}

BSTR comget_bstr( char *ps )
{
	int size;
	BSTR bstr;
	void *temp;
	size = cnvwstr( NULL, ps, 0 ) + 1;
	if ( size * sizeof(WCHAR) > HSPCTX_REFSTR_MAX ) {
		temp = sbAlloc( size * sizeof(WCHAR) );
		cnvwstr( temp, ps, size );
		bstr = SysAllocString( (LPOLESTR)temp );
		sbFree( temp );
	} else {
		cnvwstr( hspctx->stmp, ps, size );
		bstr = SysAllocString( (LPOLESTR)hspctx->stmp );
	}
	return bstr;
}


int call_method( void *iptr, int index, int *prm, int count )
{
#ifdef HSP64
	// x64: vtable entries are 8 bytes (function pointers), not 4.
	// Read the vtable pointer as void**, advance by index * sizeof(void*),
	// then dispatch via CallFunc64 which handles XMM register loading too.
	void **proc;
	proc = *(void ***)iptr;
	proc += index;
	return (int32_t)call_extfunc( (void*)*proc, (int *)prm, count );
#else
	int *proc;
	proc = (*(int **)iptr);
	proc += index;
	//Alertf( "%x:%x:%d",proc,*proc,index );
	return call_extfunc( (void*)*proc, prm, count );
#endif
}

int call_method2( char *prmbuf, const STRUCTDAT *st )
{
	// 指定 IID を取得してメソッド呼び出し
	// (code_expand_next() から呼ばれる)
	//
	const LIBDAT *lib;
	const IID *piid;
	IUnknown *punk, *punk2;
	int result;
	HRESULT hr;
	// IID 情報を取ってくる
	lib = &hspctx->mem_linfo[ st->index ];
	piid = (IID *)strp( lib->nameidx );
	punk = *(IUnknown **)prmbuf;
	if ( st->otindex < 0 || punk == NULL ) throw ( HSPERR_COMDLL_ERROR );
	hr = punk->QueryInterface( *piid, (void**)&punk2 );
	if ( FAILED(hr) || punk2 == NULL ) throw ( HSPERR_COMDLL_ERROR );
	*(IUnknown **)prmbuf = punk2;
#ifdef HSP64
	// x64: prmbuf スロットは 8 バイト単位。st->size は 4 バイト単位の総バイト数で
	// 表現されているので、引数本数 = size / sizeof(int) を 8 バイトスロット数として
	// そのまま使えばよい (各引数は INT_PTR 1 個ずつ占有する)。
	result = call_method( punk2, st->otindex, (int*)prmbuf, st->size / sizeof(int) );
#else
	result = call_method( punk2, st->otindex, (int*)prmbuf, st->size / 4 );
#endif
	punk2->Release();
	return result;
}

static BOOL GetIIDFromString( IID *iid, char *ps, bool fClsid = false )
{
	//		SJIS文字列 IID から IID 構造体を得る
	//
	//		fClsid が真のとき、ProgID からの CLSID 取得を試みる
	//		ProgID の変換に失敗した場合は FALSE を返す
	//		(それ以外のエラーはエラーを throw)
	//
	HRESULT hr;
	cnvwstr( hspctx->stmp, ps, HSPCTX_REFSTR_MAX/sizeof(WCHAR)-1 );
	if ( *ps == '{' ) {
		// GUID 文字列 → GUID 構造体
		hr = IIDFromString( (LPOLESTR)hspctx->stmp, iid );
		if ( SUCCEEDED(hr) ) return TRUE;
	}
	if ( fClsid ) {
		// ProgID 文字列 → GUID 構造体
		hr = CLSIDFromProgID( (LPOLESTR)hspctx->stmp, iid );
		if ( SUCCEEDED(hr) ) return TRUE;
		return FALSE;
	}
	throw ( HSPERR_ILLEGAL_FUNCTION );
	return FALSE;
}

#endif	// !defined(HSP_COM_UNSUPPORTED)


/*------------------------------------------------------------*/
/*
		type function
*/
/*------------------------------------------------------------*/

static int cmdfunc_ctrlcmd( int cmd )
{
	//		cmdfunc : TYPE_DLLCTRL
	//		(拡張DLLコントロールコマンド)
	//
	code_next();							// 次のコードを取得(最初に必ず必要です)

	if ( cmd >= TYPE_OFFSET_COMOBJ ) {
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		// COM インターフェースメソッドの呼び出し
		STRUCTDAT *st;
		st = GetPRM( cmd - TYPE_OFFSET_COMOBJ );
		hspctx->stat = code_expand_and_call( st );
		return RUNMODE_RUN;
#endif
	}

	switch( cmd ) {							// サブコマンドごとの分岐


	case 0x00:								// newcom
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval;
		APTR aptr;
		IUnknown **ppunkNew, *punkDef;
		CLSID clsid;
		char *clsid_name;
		const IID *piid, *piid2;
		void *iptr;
		LIBDAT *lib;
		STRUCTDAT *st;
		int inimode;

		// 第１パラメータ：新しいインターフェースポインタを格納する変数
		// (変数にNULLポインタを格納)
		aptr = code_getva( &pval );
		iptr = NULL;
		code_setva( pval, aptr, TYPE_COMOBJ, &iptr );
		ppunkNew = (IUnknown **)HspVarCorePtrAPTR( pval, aptr );

		// CLSID / IID 情報を取得
		if ( !code_getexflg() && *type == TYPE_DLLCTRL ) {
			// 第２パラメータ：#usecom 登録情報
			st = code_getcomst();
			if ( st->otindex != -1 ) throw HSPERR_TYPE_MISMATCH;
			lib = &hspctx->mem_linfo[ st->index ];
			if ( lib->clsid == -1 ) throw HSPERR_INVALID_PARAMETER;
			clsid_name = strp(lib->clsid);
			piid  = (IID *)strp( lib->nameidx );
			piid2 = NULL;
		} else {
			// 第２パラメータ：文字列 CLSID
			// (IID はデフォルトで IID_IDispatch, サポートされていなければ IID_IUnknown )
			clsid_name = code_getds("");
			piid  = &IID_IDispatch;
			piid2 = &IID_IUnknown;
		}
		inimode = code_getdi(0);				// 初期化モード
#ifdef HSP64
		// x64 では COM ポインタが 64bit。code_getdi だと上位 32bit が
		// 切り詰められて壊れるので int64 経路で取得する。
		punkDef = (IUnknown *)(intptr_t)code_getdi64(0);
#else
		punkDef = (IUnknown *)code_getdi(0);	// デフォルトオブジェクト
#endif

		// 新規CLSIDからインスタンスを作成
		hspctx->stat = 0;
		switch ( inimode ) {
		 case 0:
			// 新規にロード
			if ( clsid_name[0]!='\0' ) {
				if ( GetIIDFromString(&clsid,clsid_name,true) != FALSE &&
					 SUCCEEDED( CoCreateInstance( clsid, NULL, CLSCTX_SERVER, *piid, (void**)ppunkNew )) &&
					 *ppunkNew != NULL )
				{
					break;
				}
				if ( piid2 != NULL &&
					 SUCCEEDED( CoCreateInstance( clsid, NULL, CLSCTX_SERVER, *piid2, (void**)ppunkNew )) &&
					 *ppunkNew != NULL )
				{
					break;
				}
				hspctx->stat = 1;
			}
			break;
		 case -2:
			// オブジェクトを明示的に指定する場合 ( AddRef() あり)
			if ( punkDef != NULL ) punkDef->AddRef();
		 case -1:
			// オブジェクトを明示的に指定する場合 ( AddRef() なし)
			*ppunkNew = punkDef;
			break;
		 default:
			throw HSPERR_UNSUPPORTED_FUNCTION;
		}
	#ifdef HSP_COMOBJ_DEBUG
		COM_DBG_MSG( "newcom : pObj=%p : &pObj=%p\n", *ppunkNew, ppunkNew);
	#endif
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x01:								// querycom
#ifdef HSP_COM_UNSUPPORTED
		throw HSPERR_UNSUPPORTED_FUNCTION;
#else
		{
		PVal *pval, *pvalNew;
		APTR aptr, aptrNew;
		IUnknown **ppunkDst, **ppunkSrc;
		IID iid;
		const IID *piid;
		void *iptr;
		STRUCTDAT *st;
		LIBDAT *lib;

		// 第１パラメータ：新しいインターフェースポインタを格納する変数
		aptrNew = code_getva( &pvalNew );

		// 第２パラメータ：既存のCOMオブジェクト
		aptr = code_getva( &pval );
		if ( pval->flag != TYPE_COMOBJ ) throw ( HSPERR_TYPE_MISMATCH );
		ppunkSrc = (IUnknown **)HspVarCorePtrAPTR( pval, aptr );
		if ( ! IsVaridComPtr(ppunkSrc) ) throw ( HSPERR_COMDLL_ERROR );

		// IID 情報を取得
		if ( *type == TYPE_DLLCTRL ) {
			// 第３パラメータ：#usecom 登録情報
			st = code_getcomst();
			if ( st->otindex != -1 ) throw ( HSPERR_TYPE_MISMATCH );
			lib = &hspctx->mem_linfo[ st->index ];
			piid = (IID *)strp( lib->nameidx );
		} else {
			// 第３パラメータ：文字列 IID
			GetIIDFromString( &iid, code_gets() );
			piid = &iid;
		}

		if ( pvalNew->flag != TYPE_COMOBJ ) {
			// 代入により型変換
			iptr = NULL;
			code_setva( pvalNew, aptrNew, TYPE_COMOBJ, &iptr );
		}
		ppunkDst = (IUnknown **)HspVarCorePtrAPTR( pvalNew, aptrNew );

		// query によりインスタンスを得る
		QueryComPtr( ppunkDst, *ppunkSrc, piid );
		if ( IsVaridComPtr(ppunkSrc) )
			hspctx->stat = 0;
		else
			hspctx->stat = 1;
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x02:								// delcom
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval;
		APTR aptr;
		IUnknown **ppunk;
		VARIANT *var;
		void *ptr;

		// 第１パラメータ：解放するCOMオブジェクト変数
		aptr = code_getva( &pval );
		ptr = HspVarCorePtrAPTR( pval, aptr );
		switch ( pval->flag ) {
		case TYPE_COMOBJ:
			ppunk = (IUnknown **)ptr;
			ReleaseComPtr( ppunk );
			break;
		case TYPE_VARIANT:
			var = (VARIANT *)ptr;
			VariantClear( var );
			break;
		default:
			throw HSPERR_TYPE_MISMATCH;
		}

		// このタイミングで一時オブジェクトも削除しちゃう
		if ( comconv_var.vt != VT_EMPTY ) VariantClear( &comconv_var );
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x03:								// 	cnvstow
		{
#ifndef HSPUTF8
		PVal *pval;
		char *ptr;
		char *ps;
		int size;
		ptr = code_getvptr( &pval, &size );
		ps = code_gets();
		cnvwstr( ptr, ps, size/2 );
		break;
#else
        PVal *pval;
        char *ptr;
        char *ps;
        int size;
        int sizew;
		HSPAPICHAR *hactmp1 = 0;
        ptr = code_getvptr(&pval, &size);
        ps = code_gets();
        chartoapichar(ps, &hactmp1);
        sizew = wcslen(hactmp1) + 1;
        if (size < sizew*(int)sizeof(HSPAPICHAR)){
            memcpy(ptr, hactmp1, size);
			*(HSPAPICHAR*)(ptr + (size - 1) / sizeof(HSPAPICHAR)) = TEXT('\0');
            hspctx->stat = -sizew*sizeof(HSPAPICHAR);
		}
        else{
            memcpy(ptr, hactmp1, (sizew - 1)*sizeof(HSPAPICHAR));
			((HSPAPICHAR*)ptr)[sizew - 1] = TEXT('\0');
            hspctx->stat = sizew*sizeof(HSPAPICHAR);
		}
        freehac(&hactmp1);
        break;
#endif
		}

	case 0x04:								// 	comres
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		if ( code_getexflg() ) {
			comres_pval = NULL;
			comres_aptr = 0;
		} else {
			comres_aptr = code_getva( &comres_pval );
		}
		break;
#endif	// HSP_COM_UNSUPPORTED

	case 0x05:								// 	axobj
#if defined( HSP_COM_UNSUPPORTED )||defined( HSPDISH )
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval;
		APTR aptr;
		const IID *piid;
		void *iptr;
		BMSCR *bm;
		HWND hwnd;
		int id,sx,sy;
		char clsid_name8[1024];
		HSPAPICHAR *clsid_name = 0;
		IUnknown **ppunk, *punkObj, *punkObj2;
		STRUCTDAT *st;
		LIBDAT *lib;
		HRESULT hr;

		bm = GetBMSCR();

		// 第１パラメータ：新しいインターフェースポインタを格納する変数
		// (あらかじめ変数にNULLを格納)
		aptr = code_getva( &pval );
		iptr = NULL;
		code_setva( pval, aptr, TYPE_COMOBJ, &iptr );
		ppunk = (IUnknown **)HspVarCorePtrAPTR( pval, aptr );

		// オブジェクトの CLSID, ProgID, etc.
		if ( *type == TYPE_DLLCTRL ) {
			// 第２パラメータ：#usecom 登録情報から取得
			st = code_getcomst();
			if ( st->otindex != -1 ) throw ( HSPERR_TYPE_MISMATCH );
			lib = &hspctx->mem_linfo[ st->index ];
			piid = (IID *)strp( lib->nameidx );
			if ( lib->clsid == -1 ) throw ( HSPERR_INVALID_PARAMETER );
			strncpy( clsid_name8, strp(lib->clsid), sizeof(clsid_name8)-1 );
		} else {
			// 第２パラメータ：文字列 CLSID or ProgID を取得 (IID は IDispatch)
			piid = &IID_IDispatch;
			strncpy( clsid_name8, code_gets(), sizeof(clsid_name8)-1 );
		}

		// コントロールのサイズ
		sx = code_getdi( bm->sx );
		sy = code_getdi( bm->sy );

		//		ActiveXとしてロード
		//
		if ( fn_atxinit == NULL ) throw ( HSPERR_UNSUPPORTED_FUNCTION );
		hwnd = CreateWindow( atxwndclass, chartoapichar(clsid_name8,&clsid_name),
				WS_CHILD, 			// 最初は WS_VISIBLE なし (後で ShowWindow() )
				bm->cx, bm->cy, sx, sy,
				bm->hwnd, (HMENU)0, (HINSTANCE)hspctx->instance, NULL );
		freehac(&clsid_name);

		punkObj2 = NULL;
		if ( hwnd ) {
			punkObj = NULL;
			fn_atxgetctrl( hwnd, (void**)&punkObj );
			if ( punkObj ) {
				// 指定 IID が存在するかどうか
				hr = punkObj->QueryInterface( *piid, (void**)&punkObj2 );
				punkObj->Release();
			}
		}
		if ( punkObj2 == NULL ) {
			// 目的オブジェクトではないときコントロールを削除
			if (hwnd) { DestroyWindow( hwnd ); }
			hspctx->stat = -1;
			break;
		}
		// COM 型変数に格納
		*ppunk = punkObj2;

		// HSPのウインドゥオブジェクトとして登録する
		ShowWindow( hwnd, SW_SHOW );
		id = AddHSPObject( hwnd, HSPOBJ_TAB_SKIP, sy );
#ifdef HSP_COMOBJ_DEBUG
		Alertf( "axobj : pObj=%p : &pObj=%p\n", *ppunk, ppunk);
	#endif
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x06:								// 	winobj
		{
#ifdef HSPDISH
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		char clsname8[1024];
		HSPAPICHAR *clsname = 0;
		char winname8[1024];
		HSPAPICHAR *winname = 0;
		HWND hwnd;
		char *ps;
		BMSCR *bm;
		int i;
		int prm[6];

		ps = code_gets(); strncpy( clsname8, ps, 1023 );
		ps = code_gets(); strncpy( winname8, ps, 1023 );

		bm = GetBMSCR();
		for(i=0;i<6;i++) {
			prm[i] = code_getdi(0);
		}
		if ( prm[2] <= 0 ) prm[2] = bm->ox;
		if ( prm[3] <= 0 ) prm[3] = bm->oy;

		hwnd = CreateWindowEx(
		    (DWORD) prm[0],			// 拡張ウィンドウスタイル
		    chartoapichar(clsname8,&clsname),	// ウィンドウクラス名
		    chartoapichar(winname8,&winname),	// ウィンドウ名
		    (DWORD) prm[1],			// ウィンドウスタイル
			bm->cx, bm->cy, prm[2], prm[3],		// X,Y,SIZEX,SIZEY
			bm->hwnd,				// 親ウィンドウのハンドル
		    (HMENU) prm[4],			// メニューハンドルまたは子ウィンドウID
			bm->hInst,				// インスタンスハンドル
		    (PVOID) prm[5]			// ウィンドウ作成データ
			);
			freehac(&clsname);
			freehac(&winname);

		// AddHSPObject( hwnd, HSPOBJ_TAB_SKIP, prm[3], NULL, 0 );			// HSPのウインドゥオブジェクトとして登録する
		AddHSPObject( hwnd, HSPOBJ_TAB_SKIP, prm[3] );
		break;
#endif	// HSPDISH
		}

	case 0x07:								// 	sendmsg
		{
		int p1;
		WPARAM p2;
		LPARAM p3;
		HWND hw;
		int fl;
		char *vptr;
		HSPAPICHAR *hactmp1 = 0;
		HSPAPICHAR *hactmp2 = 0;
		hw = (HWND)code_getdi(0);
		p1 = code_getdi(0);

		vptr = code_getsptr( &fl );
		if ( fl == TYPE_STRING ) {
			p2 = (WPARAM)chartoapichar(vptr,&hactmp1);
		} else {
			p2 = *(WPARAM *)vptr;
		}

		vptr = code_getsptr( &fl );
		if ( fl == TYPE_STRING ) {
			p3 = (LPARAM)chartoapichar(vptr,&hactmp2);
		} else {
			p3 = *(LPARAM *)vptr;
		}

		//Alertf( "SEND[%x][%x][%x]",p1,p2,p3 );
		hspctx->stat = (int)SendMessage( hw, p1, p2, p3 );
		freehac(&hactmp1);
		freehac(&hactmp2);
		break;
		}

	case 0x08:								// 	comevent
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval;
		APTR aptr;
		void* iptr;
		char *ps;
		IID iid, *piid;
		unsigned short *subr;
		IUnknown **ppunk, **ppunkEvent;

		// 第１パラメータ：イベントハンドラオブジェクト (IEventHandler) を格納する変数
		// (あらかじめ NULL で初期化)
		aptr = code_getva( &pval );
		iptr = NULL;
		code_setva( pval, aptr, TYPE_COMOBJ, &iptr );
		ppunkEvent = (IUnknown **)HspVarCorePtrAPTR( pval, aptr );

		// 第２パラメータ：COMオブジェクトを格納した変数
		aptr = code_getva( &pval );
		if ( pval->flag != TYPE_COMOBJ ) throw ( HSPERR_TYPE_MISMATCH );
		ppunk = (IUnknown **)HspVarCorePtrAPTR( pval, aptr );
		if ( ! IsVaridComPtr(ppunk) ) throw ( HSPERR_COMDLL_ERROR );

		// 第３パラメータ：コネクションポイントIID (文字列形式)
		ps = code_getds("");
		if ( ps[0] != '\0' ) {
			piid = &iid;
			GetIIDFromString( piid, ps );
		} else {
			piid = NULL;	// NULL のときデフォルトIID が自動的に取得される
		}

		// 第４パラメータ：コールバック用のサブルーチンラベル
		subr = code_getlb2();

		// イベントハンドラ作成・接続
		SetComEvent( ppunkEvent, ppunk, piid, subr );
	#ifdef HSP_COMOBJ_DEBUG
		COM_DBG_MSG( "comevent : pEvent=%p : pObj=%p\n", *ppunkEvent, *ppunk);
	#endif
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x09:								// 	comevarg
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval, *pval2;
		APTR aptr, aptr2;
		VARIANT *v;
		void *ptr;
		int p1,p2;
		int res;
		IUnknown **ppunk;
		VARIANT varTemp;

		// 第１パラメータ：イベントのパラメータを格納する変数
		aptr = code_getva( &pval );

		// 第２パラメータ：イベントハンドラオブジェクト変数
		aptr2 = code_getva( &pval2 );
		if ( pval2->flag != TYPE_COMOBJ ) throw ( HSPERR_TYPE_MISMATCH );
		ppunk = (IUnknown **)HspVarCorePtrAPTR( pval2, aptr2 );
		if ( ! IsVaridComPtr(ppunk) ) throw ( HSPERR_COMDLL_ERROR );

		// 第３パラメータ：パラメータインデックス
		p1 = code_getdi(0);

		// 第４パラメータ：文字列変換フラグ
		p2 = code_getdi(0);

		// イベントのパラメータ取得
		v = GetEventArg( *ppunk, p1 );
		if ( v == NULL ) throw ( HSPERR_ILLEGAL_FUNCTION );
		switch ( p2 ) {
		case 0:
			VariantInit( &varTemp );
			VariantCopyInd( &varTemp, v );
			ptr = comget_variant( &varTemp, &res );
			VariantClear( &varTemp );
			break;
		case 1:
			VariantInit( &varTemp );
			if FAILED( VariantChangeType( &varTemp, v, VARIANT_ALPHABOOL, VT_BSTR ) )
				throw ( HSPERR_TYPE_INITALIZATION_FAILED );
			ptr = comget_variant( &varTemp, &res );
			VariantClear( &varTemp );
			break;
		case 2:
			ptr = v;
			res = HSPVAR_FLAG_VARIANT;
			break;
		default:
			throw ( HSPERR_ILLEGAL_FUNCTION );
		}
		code_setva( pval, aptr, res, ptr );
		hspctx->stat = res;
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x0a:								// 	sarrayconv
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval1, *pval2;
		APTR aptr1, aptr2;
		int convdir, size;
		VARIANT *variant, varTemp;
		VARTYPE vt;
		SAFEARRAY *psa;
		long lbound, ubound;
		HRESULT hr;

		aptr1 = code_getva( &pval1 );
		aptr2 = code_getva( &pval2 );
		convdir = code_getdi(0);
		size = code_getdi(0);

		switch ( convdir ) {
		case 0:
		case 2:
		case 4:
			// 配列変数から SafeArray に変換
			VariantInit( &varTemp );
			code_setva( pval1, aptr1, HSPVAR_FLAG_VARIANT, &varTemp );
			variant = (VARIANT *)HspVarCorePtrAPTR( pval1, aptr1 );
			VariantClear( variant );		// 一応
			if ( convdir == 2 ) {
				// バイナリデータ（一次元のみ）
				void *ptr = HspVarCorePtrAPTR( pval2, aptr2 );
				psa = CreateBinarySafeArray( ptr, size, &vt );
			} else {
				BOOL bVariant = ( convdir == 4 );
				psa = ConvVar2SafeArray( pval2, bVariant, &vt );
			}
			variant->vt = vt | VT_ARRAY;
			variant->parray = psa;
			break;
		case 1:
		case 3:
			// SafeArray から配列変数に変換
			if ( pval2->flag != HSPVAR_FLAG_VARIANT ) throw HSPERR_INVALID_TYPE;
			variant = (VARIANT *)HspVarCorePtrAPTR( pval2, aptr2 );
			if ( (variant->vt & VT_ARRAY) == 0 ) throw HSPERR_INVALID_TYPE;
			psa = variant->parray;
			if ( psa == NULL ) throw HSPERR_ARRAY_OVERFLOW;
			vt = variant->vt & VT_TYPEMASK;
			if ( vt == VT_EMPTY ) {
				hr = SafeArrayGetVartype( psa, &vt );
				if ( FAILED(hr) || vt == VT_EMPTY ) throw HSPERR_INVALID_ARRAYSTORE;
			}
			if ( convdir == 1 ) {
				ConvSafeArray2Var( pval1, psa, vt );
			} else {
				// バイナリデータ（一次元のみ）
				int varsize;
				void *ptr = HspVarCorePtrAPTR( pval1, aptr1 );				if ( vt != VT_UI1 && vt != VT_I1 ) throw HSPERR_INVALID_TYPE;
				SafeArrayGetLBound( psa, 1, &lbound );
				hr = SafeArrayGetUBound( psa, 1, &ubound );
				if ( FAILED(hr) ) throw HSPERR_ARRAY_OVERFLOW;
				size = ubound - lbound + 1;
				HspVarCoreGetBlockSize( pval1, (PDAT*)ptr, &varsize );
				if ( varsize < size ) throw HSPERR_BUFFER_OVERFLOW;
				GetBinarySafeArray( ptr, size, psa );
			}
			break;
		default:
			throw ( HSPERR_UNSUPPORTED_FUNCTION );
		}
		break;
		}
#endif	// HSP_COM_UNSUPPORTED
	case 0x0c:								//  cnvstoa
#ifndef HSPUTF8
		throw (HSPERR_UNSUPPORTED_FUNCTION);
#else
		{
		PVal *pval;
		char *ptr;
		char *ps;
		int size;
		int sizea;
		HSPAPICHAR *hactmp1 = 0;
		char *actmp1 = 0;
		ptr = code_getvptr(&pval, &size);
		ps = code_gets();
		chartoapichar(ps, &hactmp1);
		apichartoansichar(hactmp1, &actmp1);
		sizea = strlen(actmp1) + 1;
		if (size <= sizea){
			memcpy(ptr, actmp1, size - 1);
			((char*)ptr)[size - 1] = '\0';
			hspctx->stat = -sizea;
		}
		else{
			memcpy(ptr, actmp1, sizea - 1);
			((char*)ptr)[sizea - 1] = '\0';
			hspctx->stat = sizea;
		}
		freeac(&actmp1);
		freehac(&hactmp1);
		break;
		}
#endif
	case 0x0d:								// loadnet
	{
		// loadnet "System.Windows.Forms", opt, "Dummy", "System.dll"...
		PVal *pval;
		char *ps;
		int opt;
		int prm;
		Assembly^ ret;

		// 引数:1（アセンブリ名/ファイル名/C#ソースコード）
		ps = code_gets();
		auto p1 = marshal_as<System::String^>(ps);

		// 引数:2（動作フラグ）
		opt = code_getdi(0);

		if ( opt == 0) {		// GAC上の短い形式のアセンブリ名のアセンブリを読み込む
			ret = GlobalAccess::g_Hsp3Net->LoadAssemblyByGAC_ShortName(p1);
		}
		else if ( opt == 1) {	// GAC上の長い形式のアセンブリ名のアセンブリを読み込む
			ret = GlobalAccess::g_Hsp3Net->LoadAssemblyByGAC_FullName(p1);
		}
		else if ( opt == 2) {	// ファイル名からアセンブリを読み込む
			ret = GlobalAccess::g_Hsp3Net->LoadAssemblyByFile(p1);
		}
		else if ( opt == 3 || opt == 4) {	// C#/VB ソースコードをコンパイルしてアセンブリを読み込む
			// p1 が .cs/.vb ファイルの場合はファイルから読み込む
			String ^sourceCode = p1;
			if (p1->EndsWith(".cs", StringComparison::OrdinalIgnoreCase) ||
				p1->EndsWith(".vb", StringComparison::OrdinalIgnoreCase))
			{
				if (System::IO::File::Exists(p1)) {
					sourceCode = System::IO::File::ReadAllText(p1);
				} else {
					// カレントディレクトリからも検索
					auto curDir = System::IO::Directory::GetCurrentDirectory();
					auto fullPath = System::IO::Path::Combine(curDir, p1);
					if (System::IO::File::Exists(fullPath)) {
						sourceCode = System::IO::File::ReadAllText(fullPath);
					}
					// 見つからない場合はそのまま文字列として扱う
				}
			}

			// 引数:3（命名するアセンブリ名）
			ps = code_gets();
			auto p3 = marshal_as<System::String^>(ps);

			// 引数:4 以降は可変長（参照するアセンブリがあるDLLファイル名/パス）
			List<String^>^ listParams = gcnew List<String^>();

			do
			{
				prm = code_get();

				if ( prm == PARAM_OK || prm == PARAM_SPLIT)
				{
					switch ( mpval->flag)
					{
						case HSPVAR_FLAG_STR:
						{
							listParams->Add( marshal_as<System::String^>(mpval->pt));
							break;
						}
						default:
							throw HSPERR_INVALID_TYPE;
					}
				}
			}
			while (PARAM_END < prm);

			if (opt == 3) {
				ret = GlobalAccess::g_Hsp3Net->LoadAssemblyByCsSource(sourceCode, p3, listParams->ToArray());
			}
			else {
				ret = GlobalAccess::g_Hsp3Net->LoadAssemblyByVbSource(sourceCode, p3, listParams->ToArray());
			}
		}
		else {
			throw HSPERR_INVALID_PARAMETER;
		}

		// 戻り値
		net_setstat(ret != nullptr);

		break;
	}
	case 0x0e:								// newnet
	{
		// newnet outvar, "assembly", "ClassName", opt, params...
		// opt: 0 = instance, 1 = static
		// ジェネリクス: クラス名に `N が含まれる場合、最初のN個のnetobj引数を型パラメータとして使用
		// 例: newnet v, "", "System.Collections.Generic.List`1", 0, pTypeStr
		//     newnet v, "", "System.Collections.Generic.Dictionary`2", 0, pTypeStr, pTypeInt
		PVal *pval;
		APTR aptr;
		char *ps;
		int opt;
		int prm;
		void *iptr = nullptr;
		NativePointer* pNativePtr;
		NetClass^ ret;

		// 引数:1（戻り値）
		aptr = code_getva(&pval);
		code_setva(pval, aptr, TYPE_NETOBJ, &iptr);
		pNativePtr = (NativePointer *)HspVarCorePtrAPTR(pval, aptr);

		// 引数:2（アセンブリ名）
		ps = code_gets();
		auto p2 = marshal_as<System::String^>(ps);

		// 引数:3（クラス名）
		ps = code_gets();
		auto p3 = marshal_as<System::String^>(ps);

		// 引数:4（0 = 通常クラス, 1 = 静的クラス）
		opt = code_getdi(0);
		auto p4 = (opt == 0) ? false : true;

		// クラス名から `N を検出してジェネリック型パラメータ数を取得
		int genericCount = 0;
		{
			int backtickPos = p3->LastIndexOf('`');
			if (backtickPos >= 0 && backtickPos + 1 < p3->Length)
			{
				System::String ^numStr = p3->Substring(backtickPos + 1);
				int parsedCount;
				if (System::Int32::TryParse(numStr, parsedCount) && parsedCount > 0)
				{
					genericCount = parsedCount;
				}
			}
		}

		// 引数:5 以降は可変長
		// ジェネリクスの場合: 最初のgenericCount個がジェネリック型パラメータ (netobj)
		// それ以降がコンストラクタ引数
		List<NetClass^>^ listGenericTypes = (genericCount > 0) ? gcnew List<NetClass^>() : nullptr;
		List<NetClass^>^ listParams = gcnew List<NetClass^>();
		int argIndex = 0;

		do
		{
			prm = code_get();

			if ( prm == PARAM_OK || prm == PARAM_SPLIT)
			{
				// ジェネリック型パラメータ領域
				if (argIndex < genericCount)
				{
					if (mpval->flag == TYPE_NETOBJ)
					{
						NativePointer native_ptr = *((NativePointer*)mpval->pt);
						auto managed_ptr = GlobalAccess::GetNativePtrToNetClass(native_ptr);
						if (managed_ptr == nullptr)
							throw HSPERR_TYPE_MISMATCH;
						listGenericTypes->Add(managed_ptr);
					}
					else if (mpval->flag == HSPVAR_FLAG_STR)
					{
						// 文字列で型名を指定可能 ("System.String" 等)
						auto typeName = marshal_as<System::String^>((char*)mpval->pt);
						// まず Type::GetType で解決
						Type ^resolvedType = Type::GetType(typeName);
						if (resolvedType == nullptr)
						{
							// ロード済みアセンブリから検索
							for each (Assembly ^a in AppDomain::CurrentDomain->GetAssemblies())
							{
								resolvedType = a->GetType(typeName, false);
								if (resolvedType != nullptr) break;
							}
						}
						if (resolvedType == nullptr)
							throw HSPERR_INVALID_PARAMETER;
						NetClass ^typeNC = gcnew NetClass();
						typeNC->Class = resolvedType;
						listGenericTypes->Add(typeNC);
					}
					else
					{
						throw HSPERR_INVALID_TYPE;
					}
					argIndex++;
					continue;
				}

				// コンストラクタ引数
				switch (mpval->flag)
				{
					case HSPVAR_FLAG_STR:
					{
						listParams->Add(
							GlobalAccess::g_Hsp3Net->CreateString(
								marshal_as<System::String^>(mpval->pt)));
						break;
					}
					case HSPVAR_FLAG_INT:
					{
						listParams->Add(
							GlobalAccess::g_Hsp3Net->CreateInt32(*(int*)mpval->pt));
						break;
					}
					case HSPVAR_FLAG_DOUBLE:
					{
						listParams->Add(
							GlobalAccess::g_Hsp3Net->CreateDouble(*(double*)mpval->pt));
						break;
					}
					case TYPE_NETOBJ:
					{
						NativePointer native_ptr = *((NativePointer*)mpval->pt);
						auto managed_ptr = GlobalAccess::GetNativePtrToNetClass(native_ptr);
						if ( managed_ptr == nullptr)
							throw HSPERR_TYPE_MISMATCH;
						listParams->Add(managed_ptr);
						break;
					}
					default:
						throw HSPERR_INVALID_TYPE;
				}
				argIndex++;
			}
		} while (PARAM_END < prm);

		// 実行
		array<NetClass^>^ genericArray = (listGenericTypes != nullptr && listGenericTypes->Count > 0)
			? listGenericTypes->ToArray() : nullptr;
		ret = GlobalAccess::g_Hsp3Net->CreateInstance(
			p2, p3, genericArray, p4, listParams->ToArray());

		if (ret != nullptr)
		{
			*pNativePtr = GlobalAccess::CreateNativePtr(ret);
		}
		
		// 戻り値
		net_setstat(ret != nullptr);

		break;
	}
	case 0x0f:								// delnet
	{
		PVal *pval;
		APTR aptr;
		void *ptr;
		NativePointer native_ptr;
		bool ret;

		// 引数:1（解放する変数）
		aptr = code_getva(&pval);
		ptr = HspVarCorePtrAPTR(pval, aptr);
		switch (pval->flag) 
		{
			case TYPE_NETOBJ:
			{
				native_ptr = *((NativePointer*)ptr);
				ret = GlobalAccess::Free(native_ptr);
				break;
			}
			default:
				throw HSPERR_TYPE_MISMATCH;
		}

		// 戻り値
		net_setstat(ret);

		break;
	}
	case 0x10:								// netres
	{
		// 引数:1（返り値を格納する変数）
		if (code_getexflg()) {
			netres_pval = nullptr;
			netres_aptr = 0;
		}
		else {
			netres_aptr = code_getva(&netres_pval);
		}

		// 戻り値
		hspctx->stat = 0;

		break;
	}
	case 0x11:								// tonet
	{
		// tonet outvar, value
		// HSP の値を .NET オブジェクト (netobj) に変換する
		PVal *pval;
		APTR aptr;
		void *iptr = nullptr;
		NativePointer* pNativePtrOut;
		NetClass^ ret = nullptr;

		// 引数:1（出力先 netobj 変数）
		aptr = code_getva(&pval);
		code_setva(pval, aptr, TYPE_NETOBJ, &iptr);
		pNativePtrOut = (NativePointer *)HspVarCorePtrAPTR(pval, aptr);

		// 引数:2（変換元の値）
		int prm = code_get();
		if (prm <= PARAM_END) throw HSPERR_NO_DEFAULT;

		switch (mpval->flag)
		{
		case HSPVAR_FLAG_STR:
			ret = GlobalAccess::g_Hsp3Net->CreateString(
				marshal_as<System::String^>((char*)mpval->pt));
			break;
		case HSPVAR_FLAG_INT:
			ret = GlobalAccess::g_Hsp3Net->CreateInt32(*(int*)mpval->pt);
			break;
		case HSPVAR_FLAG_DOUBLE:
			ret = GlobalAccess::g_Hsp3Net->CreateDouble(*(double*)mpval->pt);
			break;
		case HSPVAR_FLAG_INT64:
			ret = GlobalAccess::g_Hsp3Net->CreateInt64(*(int64_t*)mpval->pt);
			break;
		case TYPE_NETOBJ:
		{
			// netobj → netobj はそのままコピー
			NativePointer native_ptr = *((NativePointer*)mpval->pt);
			auto nc = GlobalAccess::GetNativePtrToNetClass(native_ptr);
			if (nc != nullptr) ret = nc;
			break;
		}
		default:
			throw HSPERR_TYPE_MISMATCH;
		}

		if (ret != nullptr)
		{
			*pNativePtrOut = GlobalAccess::CreateNativePtr(ret);
		}

		net_setstat(ret != nullptr);
		break;
	}
	case 0x12:								// enumnet
	{
		// enumnet outvar, innet_or_asm_name, "EnumType", "Member"
		// 第2引数: netobj変数 または アセンブリ名文字列
		PVal *pval;
		APTR aptr;
		char *ps;
		int opt;
		int prm;
		void *iptr = nullptr;
		void *ptr;
		NativePointer* pNativePtrOut;
		NetClass^ Input;
		NetClass^ ret;

		// 引数:1（戻り値）
		aptr = code_getva(&pval);
		code_setva(pval, aptr, TYPE_NETOBJ, &iptr);
		pNativePtrOut = (NativePointer *)HspVarCorePtrAPTR(pval, aptr);

		// 引数:2（netobj変数 or アセンブリ名文字列）
		{
			int prm2 = code_get();
			if (prm2 <= PARAM_END) throw HSPERR_NO_DEFAULT;

			if (mpval->flag == TYPE_NETOBJ)
			{
				NativePointer pNativePtrIn = *((NativePointer*)mpval->pt);
				Input = GlobalAccess::GetNativePtrToNetClass(pNativePtrIn);
				if (Input == nullptr)
					throw HSPERR_INVALID_PARAMETER;
			}
			else if (mpval->flag == HSPVAR_FLAG_STR)
			{
				// アセンブリ名文字列からダミーのNetClassを作成
				auto assyName = marshal_as<System::String^>((char*)mpval->pt);
				Assembly ^assy = nullptr;

				// 空文字列の場合は全ロード済みアセンブリから検索
				if (System::String::IsNullOrEmpty(assyName))
				{
					// ダミーのNetClass（mscorlib等のデフォルト）
					Input = gcnew NetClass();
					Input->Assembly = System::Int32::typeid->Assembly; // mscorlib
				}
				else
				{
					// アセンブリ名で検索
					for each (Assembly ^a in AppDomain::CurrentDomain->GetAssemblies())
					{
						if (a->GetName()->Name == assyName)
						{
							assy = a;
							break;
						}
					}
					if (assy == nullptr)
					{
						// 部分名で再検索
						for each (Assembly ^a in AppDomain::CurrentDomain->GetAssemblies())
						{
							if (a->GetName()->Name->Contains(assyName))
							{
								assy = a;
								break;
							}
						}
					}
					if (assy == nullptr) throw HSPERR_INVALID_PARAMETER;
					Input = gcnew NetClass();
					Input->Assembly = assy;
				}
			}
			else
			{
				throw HSPERR_TYPE_MISMATCH;
			}
		}

		// 引数:3（列挙型名）
		ps = code_gets();
		auto p3 = marshal_as<System::String^>(ps);

		// 引数:4（メンバ名）
		ps = code_gets();
		auto p4 = marshal_as<System::String^>(ps);

		// 実行
		// 空文字列アセンブリの場合、全アセンブリから検索
		if (Input->Assembly != nullptr)
		{
			ret = GlobalAccess::g_Hsp3Net->GetEnumMember(Input, p3, p4);
		}
		else
		{
			ret = nullptr;
		}

		// Inputのアセンブリで見つか���なかった場合、全アセンブリを検索
		if (ret == nullptr)
		{
			for each (Assembly ^a in AppDomain::CurrentDomain->GetAssemblies())
			{
				Type ^t = a->GetType(p3, false);
				if (t != nullptr && t->IsEnum)
				{
					NetClass ^tempInput = gcnew NetClass();
					tempInput->Assembly = a;
					ret = GlobalAccess::g_Hsp3Net->GetEnumMember(tempInput, p3, p4);
					if (ret != nullptr) break;
				}
			}
		}

		if (ret != nullptr)
		{
			*pNativePtrOut = GlobalAccess::CreateNativePtr(ret);
		}

		// 戻り値
		net_setstat(ret != nullptr);

		break;
	}
	case 0x13:									// getforms
	{
		PVal *pval;
		APTR aptr;
		int wid;
		int prm;
		void *iptr = nullptr;
		NativePointer* pNativePtrOut;
		NetClass^ ret;

		// 引数:1（戻り値）
		aptr = code_getva(&pval);
		code_setva(pval, aptr, TYPE_NETOBJ, &iptr);
		pNativePtrOut = (NativePointer *)HspVarCorePtrAPTR(pval, aptr);

		// 引数:2（ウィンドウID）
		wid = code_getdi(0);

		// ウィンドウID -> BMSCR
		auto pBmscr = (BMSCR *)hspctx->exinfo2->HspFunc_getbmscr(wid);
		if ( pBmscr == nullptr)
		{
			throw HSPERR_INVALID_PARAMETER;
		}

		auto managed_ptr = 
			System::Windows::Forms::Form::FromHandle((IntPtr)pBmscr->hwnd);
		if ( managed_ptr == nullptr)
		{
			throw HSPERR_INVALID_PARAMETER;
		}

		ret = GlobalAccess::g_Hsp3Net->CreateObject(managed_ptr);

		if (ret != nullptr)
		{
			*pNativePtrOut = GlobalAccess::CreateNativePtr(ret);
		}

		// 戻り値
		net_setstat(ret != nullptr);
		break;
	}
	case 0x14:									// formsaddctrl
	{
#ifdef HSPCL_WIN
		throw HSPERR_UNSUPPORTED_FUNCTION;
#else
		// formsaddctrl outvar, type, "text", x, y, w, h [, wid]
		// type: 0=Button, 1=CheckBox, 2=TextBox, 3=ComboBox, 4=ListBox
		PVal *pval;
		APTR aptr;
		void *iptr = nullptr;
		NativePointer* pNativePtrOut;
		char *text;
		int ctrl_type, x, y, w, h, wid;
		void *hwndCtrl = nullptr;

		// 引数:1（戻り値 netobj変数）
		aptr = code_getva(&pval);
		code_setva(pval, aptr, TYPE_NETOBJ, &iptr);
		pNativePtrOut = (NativePointer *)HspVarCorePtrAPTR(pval, aptr);

		// 引数:2（コントロールタイプ）
		ctrl_type = code_getdi(0);

		// 引数:3（テキスト）
		text = code_gets();

		// 引数:4-7（位置とサイズ）
		x = code_getdi(0);
		y = code_getdi(0);
		w = code_getdi(100);
		h = code_getdi(24);

		// 引数:8（ウィンドウID, 省略時0）
		wid = code_getdi(0);

		// ウィンドウID -> HWND
		auto pBmscr = (BMSCR *)hspctx->exinfo2->HspFunc_getbmscr(wid);
		if (pBmscr == nullptr) throw HSPERR_INVALID_PARAMETER;
		void *formHwnd = (void *)pBmscr->hwnd;

		// コントロール生成
		switch (ctrl_type)
		{
		case 0: // Button
			hwndCtrl = HspInterop_CreateButton(formHwnd, text, x, y, w, h, 0, 0);
			break;
		case 1: // CheckBox
			hwndCtrl = HspInterop_CreateCheckBox(formHwnd, text, x, y, w, h, 0, 0);
			break;
		case 2: // TextBox
			hwndCtrl = HspInterop_CreateTextBox(formHwnd, text, x, y, w, h, 0, 0, 0);
			break;
		case 3: // ComboBox
			hwndCtrl = HspInterop_CreateComboBox(formHwnd, x, y, w, h, 0);
			break;
		case 4: // ListBox
			hwndCtrl = HspInterop_CreateListBox(formHwnd, x, y, w, h, 0);
			break;
		default:
			throw HSPERR_INVALID_PARAMETER;
		}

		// コントロールの.NETオブジェクトをnetobjとして返す
		if (hwndCtrl != nullptr)
		{
			auto managed_ctrl =
				System::Windows::Forms::Control::FromHandle((IntPtr)hwndCtrl);
			if (managed_ctrl != nullptr)
			{
				auto ret = GlobalAccess::g_Hsp3Net->CreateObject(managed_ctrl);
				if (ret != nullptr)
				{
					*pNativePtrOut = GlobalAccess::CreateNativePtr(ret);
				}
			}
		}

		net_setstat(hwndCtrl != nullptr);
#endif
		break;
	}
	case 0x15:									// pushnet
	{
		GlobalAccess::PushNativePtrCurrentStack();
		break;
	}
	case 0x16:									// popnet
	{
		int prm;
		bool bRet;
		List<IntPtr>^ listParams = gcnew List<IntPtr>();

		do
		{
			prm = code_get();

			if ( prm == PARAM_OK || prm == PARAM_SPLIT)
			{
				switch ( mpval->flag)
				{
					case TYPE_NETOBJ:
					{
						NativePointer native_ptr = *((NativePointer*)mpval->pt);
						listParams->Add( IntPtr(native_ptr));
						break;
					}
					default:
						break;	// すっ飛ばすだけでよい
				}
			}
		} while (PARAM_END < prm);

		bRet = GlobalAccess::PopNativePtrCurrentStack( listParams->ToArray());

		// 戻り値
		net_setstat(bRet);
		break;
	}
	case 0x17:									// enablewpf
	{
		bool ok = true;
		if (GlobalAccess::g_Hsp3Net->LoadAssemblyByGAC_ShortName("PresentationCore") == nullptr) ok = false;
		if (GlobalAccess::g_Hsp3Net->LoadAssemblyByGAC_ShortName("PresentationFramework") == nullptr) ok = false;
		if (GlobalAccess::g_Hsp3Net->LoadAssemblyByGAC_ShortName("WindowsBase") == nullptr) ok = false;
		if (GlobalAccess::g_Hsp3Net->LoadAssemblyByGAC_ShortName("WindowsFormsIntegration") == nullptr) ok = false;
		net_setstat(ok);
		break;
	}

	case 0x18:									// neterror
	{
		neterror_mode = code_getdi(0);
		break;
	}
	// ----- COM コールバックインターフェース -----
	case 0x40:									// _cb_class_begin name, iface_lib_idx, max_vidx
	{
		// hspcmp が #endcbcom 時に発行する内部命令。User からは直接呼ばない。
		char *cls_name = code_getds("");
		int iface_lib_idx = code_getdi(0);
		int max_vidx = code_getdi(0);

		LIBDAT *lib = &hspctx->mem_linfo[iface_lib_idx];
		IID *piid = (IID *)strp(lib->nameidx);

		HspCbComClass *klass = hsp_cbcom_register_class(cls_name, *piid, max_vidx);
		if (klass == NULL) throw HSPERR_OUT_OF_MEMORY;
		break;
	}
	case 0x41:									// _cb_class_method cls_name, vidx, ret_type, argc, [argtypes...], *label
	{
		char *cls_name = code_getds("");
		int vidx = code_getdi(0);
		int rt = code_getdi(0);
		int argc = code_getdi(0);
		if (argc < 0 || argc >= HSP_CBCOM_ARG_MAX) throw HSPERR_INVALID_PARAMETER;

		short arg_types[HSP_CBCOM_ARG_MAX] = {0};
		for (int i = 0; i < argc; i++) {
			arg_types[i] = (short)code_getdi(0);
		}

		// label
		unsigned short *label;
		{
			int prm = code_get();
			if (prm <= PARAM_END) throw HSPERR_NO_DEFAULT;
			if (mpval->flag != HSPVAR_FLAG_LABEL) throw HSPERR_LABEL_REQUIRED;
			label = *(unsigned short **)mpval->pt;
		}

		HspCbComClass *klass = hsp_cbcom_find_class(cls_name);
		if (klass == NULL) throw HSPERR_INVALID_PARAMETER;
		if (hsp_cbcom_add_method(klass, vidx, rt, argc, arg_types, label) != 0) {
			throw HSPERR_INVALID_PARAMETER;
		}
		break;
	}
	case 0x42:									// _cb_class_end cls_name
	{
		char *cls_name = code_getds("");
		HspCbComClass *klass = hsp_cbcom_find_class(cls_name);
		if (klass == NULL) throw HSPERR_INVALID_PARAMETER;
		if (hsp_cbcom_finalize_class(klass) != 0) {
			throw HSPERR_OUT_OF_MEMORY;
		}
		break;
	}
	case 0x43:									// newcomcb var, cls_name [, tag_int_or_str]
	{
		PVal *pval;
		APTR aptr;
		void *iptr = NULL;

		// 引数1: 出力先 comobj 変数
		aptr = code_getva(&pval);
		code_setva(pval, aptr, TYPE_COMOBJ, &iptr);
		IUnknown **ppunkNew = (IUnknown **)HspVarCorePtrAPTR(pval, aptr);

		// 引数2: クラス名
		char *cls_name = code_getds("");
		HspCbComClass *klass = hsp_cbcom_find_class(cls_name);
		if (klass == NULL) throw HSPERR_INVALID_PARAMETER;

		// 引数3: tag (省略可)
		int tag_int = 0;
		const char *tag_str = NULL;
		int prm = code_get();
		if (prm > PARAM_END) {
			if (mpval->flag == HSPVAR_FLAG_STR) {
				tag_str = (const char *)mpval->pt;
			} else if (mpval->flag == HSPVAR_FLAG_INT) {
				tag_int = *(int *)mpval->pt;
			} else if (mpval->flag == HSPVAR_FLAG_INT64) {
				tag_int = (int)*(int64_t *)mpval->pt;
			}
		}

		IUnknown *punk = hsp_cbcom_create_instance(klass, tag_int, tag_str);
		if (punk == NULL) throw HSPERR_OUT_OF_MEMORY;
		*ppunkNew = punk;
		hspctx->stat = 0;
		break;
	}
	case 0x44:									// comret val
	{
		// 現在 callback 中の戻り値を設定 (HRESULT)
		hsp_cbcom_return_value = (INT_PTR)code_geti64();
		break;
	}

	case 0x1b:									// setcallback
	{
		PVal *pval;
		APTR aptr;
		unsigned short *label;
		int nargs;
		void *funcptr;

		aptr = code_getva(&pval);
		{
			int prm = code_get();
			if (prm <= PARAM_END) throw HSPERR_NO_DEFAULT;
			if (mpval->flag != HSPVAR_FLAG_LABEL) throw HSPERR_LABEL_REQUIRED;
			label = *(unsigned short **)mpval->pt;
		}
		nargs = code_getdi(2);
		if (nargs < 0 || nargs > HSP_CALLBACK_ARG_MAX) throw HSPERR_INVALID_PARAMETER;

		HspCallbackThunk *thunk = hsp_callback_alloc();
		if (thunk == NULL) throw HSPERR_INVALID_PARAMETER;
		thunk->label = label;
		thunk->argCount = nargs;
#ifndef HSP64
		funcptr = create_callback_thunk_x86(thunk);
#else
		funcptr = create_callback_thunk_x64(thunk);
#endif
		if (funcptr == NULL) throw HSPERR_INVALID_PARAMETER;

#ifndef HSP64
		{ int iptr = (int)(INT_PTR)funcptr; code_setva(pval, aptr, HSPVAR_FLAG_INT, &iptr); }
#else
		{ int64_t i64ptr = (int64_t)(INT_PTR)funcptr; code_setva(pval, aptr, HSPVAR_FLAG_INT64, &i64ptr); }
#endif
		hspctx->stat = 0;
		break;
	}
	case 0x19:									// netdelegate
	{
		// netdelegate outvar, "DelegateType", *label
		// HSP ラベルを .NET デリゲートに変換
		PVal *pval;
		APTR aptr;
		void *iptr = nullptr;
		NativePointer* pNativePtrOut;

		hsp_callback_init();

		// 引数:1（出力先 netobj）
		aptr = code_getva(&pval);
		code_setva(pval, aptr, TYPE_NETOBJ, &iptr);
		pNativePtrOut = (NativePointer *)HspVarCorePtrAPTR(pval, aptr);

		// 引数:2（デリゲート型名）
		char *ps = code_gets();
		auto delegateTypeName = marshal_as<System::String^>(ps);

		// 引数:3（HSP ラベル）
		unsigned short *label;
		{
			int prm3 = code_get();
			if (prm3 <= PARAM_END) throw HSPERR_NO_DEFAULT;
			if (mpval->flag != HSPVAR_FLAG_LABEL) throw HSPERR_LABEL_REQUIRED;
			label = *(unsigned short **)mpval->pt;
		}

		auto proxy = gcnew HspCallbackProxy(
			IntPtr(label), IntPtr(hspctx));

		// デリゲート型を解決
		Type ^delegateType = nullptr;
		if (delegateTypeName == "EventHandler" || delegateTypeName == "System.EventHandler")
			delegateType = System::EventHandler::typeid;
		else if (delegateTypeName == "Action" || delegateTypeName == "System.Action")
			delegateType = System::Action::typeid;
		else
		{
			delegateType = Type::GetType(delegateTypeName);
			if (delegateType == nullptr)
			{
				for each (Assembly ^a in AppDomain::CurrentDomain->GetAssemblies())
				{
					delegateType = a->GetType(delegateTypeName, false);
					if (delegateType != nullptr) break;
				}
			}
		}
		if (delegateType == nullptr) throw HSPERR_INVALID_PARAMETER;

		// シグネチャに応じたデリゲート生成
		Delegate ^del = nullptr;
		try
		{
			auto invokeMethod = delegateType->GetMethod("Invoke");
			auto invokeParams = invokeMethod->GetParameters();

			if (delegateType == System::EventHandler::typeid)
			{
				del = gcnew System::EventHandler(proxy, &HspCallbackProxy::HandleEvent);
			}
			else if (delegateType == System::Action::typeid)
			{
				del = gcnew System::Action(proxy, &HspCallbackProxy::HandleAction);
			}
			else if (invokeParams->Length == 0 && invokeMethod->ReturnType == void::typeid)
			{
				del = Delegate::CreateDelegate(delegateType, proxy,
					proxy->GetType()->GetMethod("HandleAction"));
			}
			else if (invokeParams->Length == 2 && invokeMethod->ReturnType == void::typeid)
			{
				del = Delegate::CreateDelegate(delegateType, proxy,
					proxy->GetType()->GetMethod("HandleEvent"));
			}
			else if (invokeParams->Length == 1 && invokeMethod->ReturnType == bool::typeid)
			{
				del = Delegate::CreateDelegate(delegateType, proxy,
					proxy->GetType()->GetMethod("HandlePredicate"));
			}
			else
			{
				// フォールバック: HandleEvent を試行
				del = Delegate::CreateDelegate(delegateType, proxy,
					proxy->GetType()->GetMethod("HandleEvent"));
			}
		}
		catch (HSPERROR) { throw; }
		catch (Exception ^ex)
		{
			GlobalAccess::g_Hsp3Net->_ExceptionStack->Push(ex);
			net_setstat(false);
			break;
		}

		auto nc = gcnew tv::hsp::net::NetClass();
		nc->Class = del->GetType();
		nc->Instance = del;
		*pNativePtrOut = GlobalAccess::CreateNativePtr(nc);

		// プロキシの GC 回収防止
		auto proxyNC = gcnew tv::hsp::net::NetClass();
		proxyNC->Class = proxy->GetType();
		proxyNC->Instance = proxy;
		GlobalAccess::CreateNativePtr(proxyNC);

		net_setstat(true);
		break;
	}
	case 0x1a:									// netlinq
	{
		// netlinq outvar, collection, "Operation", "lambda"
		// 内部 C# コンパイルで LINQ 実行
		PVal *pval;
		APTR aptr;
		void *iptr = nullptr;
		NativePointer* pNativePtrOut;
		char *ps;

		// 引数:1（出力先）
		aptr = code_getva(&pval);
		code_setva(pval, aptr, TYPE_NETOBJ, &iptr);
		pNativePtrOut = (NativePointer *)HspVarCorePtrAPTR(pval, aptr);

		// 引数:2（コレクション）
		{
			int prm2 = code_get();
			if (prm2 <= PARAM_END) throw HSPERR_NO_DEFAULT;
			if (mpval->flag != TYPE_NETOBJ) throw HSPERR_TYPE_MISMATCH;
		}
		NativePointer collNP = *((NativePointer*)mpval->pt);
		auto collection = GlobalAccess::GetNativePtrToNetClass(collNP);
		if (collection == nullptr) throw HSPERR_INVALID_PARAMETER;

		// 引数:3（操作名）
		ps = code_gets();
		auto operation = marshal_as<System::String^>(ps);

		// 引数:4（ラムダ式文字列）
		ps = code_gets();
		auto lambda = marshal_as<System::String^>(ps);

		// コレクションの要素型を検出
		Type ^elemType = nullptr;
		auto collType = collection->Instance->GetType();
		for each (auto iface in collType->GetInterfaces())
		{
			if (iface->IsGenericType &&
				iface->GetGenericTypeDefinition() ==
					System::Collections::Generic::IEnumerable<int>::typeid->GetGenericTypeDefinition())
			{
				elemType = iface->GetGenericArguments()[0];
				break;
			}
		}
		if (elemType == nullptr) elemType = Object::typeid;

		// C# コードを生成・コンパイル・実行
		auto csCode = String::Format(
			"using System;\nusing System.Linq;\nusing System.Collections.Generic;\n"
			"public static class LQ {{ public static object Run(System.Collections.IEnumerable s) {{\n"
			"  var t = s.Cast<{0}>();\n"
			"  var r = t.{1}({2});\n"
			"  return r;\n}} }}\n",
			elemType->FullName, operation, lambda);

		auto assy = GlobalAccess::g_Hsp3Net->LoadAssemblyByCsSource(
			csCode, nullptr, gcnew array<String^>{ "System.Core.dll" });

		if (assy == nullptr) { net_setstat(false); break; }

		try
		{
			auto helperType = assy->GetType("LQ");
			auto method = helperType->GetMethod("Run");
			auto result = method->Invoke(nullptr,
				gcnew array<Object^>{ collection->Instance });

			if (result != nullptr)
			{
				auto nc = GlobalAccess::g_Hsp3Net->CreateObject(result);
				if (nc != nullptr)
					*pNativePtrOut = GlobalAccess::CreateNativePtr(nc);
			}
			net_setstat(result != nullptr);
		}
		catch (Exception ^ex)
		{
			GlobalAccess::g_Hsp3Net->_ExceptionStack->Push(ex);
			net_setstat(false);
		}
		break;
	}

	default:
		throw ( HSPERR_SYNTAX );
	}
	return RUNMODE_RUN;
}

// 一時変数のバッファのポインタを返します
static void* StringToHspStrA(String^ str)
{
	const char* outBuffer;
	{
		marshal_context ctx;	// スコープ内のみ有効
		outBuffer = ctx.marshal_as<const char*>(str);
		auto size_bytes = strlen(outBuffer) + 1;
		hspctx->stmp = sbExpand(hspctx->stmp, size_bytes);
		::strcpy_s( hspctx->stmp, size_bytes, outBuffer);
	}
	return hspctx->stmp;
}

static void* StringToHspStrW(String^ str)
{
	const wchar_t* outBuffer;
	{
		marshal_context ctx;	// スコープ内のみ有効
		outBuffer = ctx.marshal_as<const wchar_t*>(str);
		auto size_counts = ::wcslen(outBuffer) + 1;
		hspctx->stmp = sbExpand( hspctx->stmp, size_counts * sizeof(wchar_t));
		::wcscpy_s((wchar_t*)hspctx->stmp, size_counts, outBuffer);
	}
	return hspctx->stmp;
}

static void *reffunc_ctrlfunc( int *type_res, int arg )
{
	//		reffunc : TYPE_DLLCTRL
	//		(拡張DLLコントロール関数)
	//
	void *ptr;
	int p1,p2;

	//			'('で始まるかを調べる
	//
	if ( *type != TYPE_MARK ) throw ( HSPERR_INVALID_FUNCPARAM );
	if ( *val != '(' ) throw ( HSPERR_INVALID_FUNCPARAM );
	code_next();

	ptr = &reffunc_intfunc_ivalue;
	*type_res = HSPVAR_FLAG_INT;

	switch( arg ) {							// サブコマンドごとの分岐
	case 0x100:								// callfunc
		{
		PVal *pval;
		PDAT *p;
		pval = code_getpval();
		p = HspVarCorePtrAPTR( pval, 0 );
		p1 = code_geti();
		p2 = code_geti();
		reffunc_intfunc_ivalue = call_extfunc( (void *)p1, (int *)p, p2 );
		break;
		}
	case 0x101:								// cnvwtos
		{
#ifndef HSPUTF8
		PVal *pval;
		char *sptr;
		int size;
		sptr = code_getvptr( &pval, &size );
		hspctx->stmp = sbExpand( hspctx->stmp, size );
		ptr = hspctx->stmp;
		cnvsjis( ptr, sptr, size  );
		*type_res = HSPVAR_FLAG_STR;
		break;
#else
        PVal *pval;
        wchar_t *sptr;
        int size;
		int len;
        sptr = (wchar_t*)code_getvptr(&pval, &size);
		len = lstrlen(sptr) * 6 + 1;
        hspctx->stmp = sbExpand(hspctx->stmp, len);
        ptr = hspctx->stmp;
        cnvu8(ptr, sptr, len);
        *type_res = HSPVAR_FLAG_STR;
        break;
#endif
		}

	case 0x102:								// 	comevdisp
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval;
		APTR aptr;
		IUnknown **ppunk;
		// 第１パラメータ：COMオブジェクト変数
		aptr = code_getva( &pval );
		if ( pval->flag != TYPE_COMOBJ ) throw ( HSPERR_TYPE_MISMATCH );
		ppunk = (IUnknown **)HspVarCorePtrAPTR( pval, aptr );
		if ( !IsVaridComPtr(ppunk) ) throw ( HSPERR_COMDLL_ERROR );

		// イベントの DISPID 取得
		reffunc_intfunc_ivalue = GetEventDispID( *ppunk );
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x103:								// 	libptr
		{
		//LIBDAT *lib;
		STRUCTDAT *st;
		switch( *type ) {
		case TYPE_DLLFUNC:
		case TYPE_MODCMD:
			p1 = *val;
			break;
		case TYPE_DLLCTRL:
			p1 = *val;
			if ( p1 >= TYPE_OFFSET_COMOBJ ) {
				p1 -= TYPE_OFFSET_COMOBJ;
				break;
			}
		default:
			throw ( HSPERR_TYPE_MISMATCH );
		}
		code_next();
		st = GetPRM( p1 );
		//lib = &hspctx->mem_linfo[ st->index ];
		reffunc_intfunc_ivalue = (int)((INT_PTR)st);
		break;
		}

	case 0x104:								//  cnvatos
#ifndef HSPUTF8
		throw (HSPERR_UNSUPPORTED_FUNCTION);
#else
		{
			PVal *pval;
			char *sptr;
			int size;
			HSPAPICHAR *hactmp1 = 0;
			int len;
			sptr = code_getvptr(&pval, &size);
			ansichartoapichar(sptr, &hactmp1);
			len = lstrlen(hactmp1) * 6 + 1;
			hspctx->stmp = sbExpand(hspctx->stmp, len);
			ptr = hspctx->stmp;
			cnvu8(ptr, hactmp1, len);
			freehac(&hactmp1);
			*type_res = HSPVAR_FLAG_STR;
			break;
		}
#endif

	case 0x105:								// nettoval
	{
		NativePointer native_ptr;

		// 引数:1（変換元 - 変数または式 obj("$field") に対応）
		{
			int prm = code_get();
			if (prm <= PARAM_END) throw HSPERR_NO_DEFAULT;
			if (mpval->flag != TYPE_NETOBJ) throw HSPERR_TYPE_MISMATCH;
			native_ptr = *((NativePointer*)mpval->pt);
		}

		// マネージド型に変換
		auto managed_ptr =
			GlobalAccess::GetNativePtrToNetClass(native_ptr);

		if ( managed_ptr == nullptr)
			throw HSPERR_TYPE_MISMATCH;

		if ( managed_ptr->Instance == nullptr)
			throw HSPERR_TYPE_MISMATCH;

		// 引数:2（変換後のHSP型typeid）
		p2 = code_getdi(HSPVAR_FLAG_INT);
		switch (p2)
		{
			case HSPVAR_FLAG_INT:
			case HSPVAR_FLAG_DOUBLE:
			case HSPVAR_FLAG_STR:
				break;
			default:
				throw HSPERR_TYPE_MISMATCH;
		}

		// 戻り値
		ptr = &reffunc_ptrfunc_ptrvalue[0];
		*type_res = p2;

		// ------------------------------
		//  .NET   -> HSP
		// ------------------------------
		// String  -> str
		// Boolean -> str, int
		// Char    -> str, int
		// Decimal -> double, int, str
		// double  -> double, int, str
		// float   -> double, int, sti
		// Int32   -> double, int, str
		// UInt32  -> double, int, str
		// Int8    -> double, int, str
		// UInt8   -> double, int, str
		// Int16   -> double, int, str
		// UInt16  -> double, int, str
		// Int64   -> double, int, str
		// UInt64  -> double, int, str
		// IntPtr  -> double, int, str
		// UIntPtr -> double, int, str
		// ------------------------------

		auto before_type = managed_ptr->Class;
		if ( before_type->Equals(String::typeid))
		{
			switch (p2)
			{
				case HSPVAR_FLAG_STR:
				{
					ptr =
						StringToHspStrA( (String^)managed_ptr->Instance);
					break;
				}
				default:
					throw HSPERR_TYPE_MISMATCH;
			}
		}
		else if ( before_type->Equals(Boolean::typeid))
		{
			switch (p2)
			{
			case HSPVAR_FLAG_INT:
			{
				auto val = ((bool)managed_ptr->Instance) ? 1 : 0;
				*(int*)&reffunc_ptrfunc_ptrvalue = val;
				break;
			}
			case HSPVAR_FLAG_STR:
			{
				ptr =
					StringToHspStrA(managed_ptr->Instance->ToString());
				break;
			}
			default:
				throw HSPERR_TYPE_MISMATCH;
			}
		}
		else if ( before_type->Equals(Char::typeid))
		{
			switch (p2)
			{
				case HSPVAR_FLAG_INT:
				{
					auto val = ((int)managed_ptr->Instance);
					*(int*)&reffunc_ptrfunc_ptrvalue = val;
					break;
				}
				case HSPVAR_FLAG_STR:
				{
					ptr =
						StringToHspStrA( managed_ptr->Instance->ToString());
					break;
				}
				default:
					throw HSPERR_TYPE_MISMATCH;
			}
		}
		else if ( before_type->IsEnum)
		{
			// Enum型: int/double/str に変換可能
			switch (p2)
			{
				case HSPVAR_FLAG_INT:
				{
					auto val = System::Convert::ToInt32(managed_ptr->Instance);
					*(int*)&reffunc_ptrfunc_ptrvalue = val;
					break;
				}
				case HSPVAR_FLAG_DOUBLE:
				{
					auto val = System::Convert::ToDouble(managed_ptr->Instance);
					*(double*)&reffunc_ptrfunc_ptrvalue = val;
					break;
				}
				case HSPVAR_FLAG_STR:
				{
					ptr = StringToHspStrA(managed_ptr->Instance->ToString());
					break;
				}
				default:
					throw HSPERR_TYPE_MISMATCH;
			}
		}
		else if ( before_type->Equals(Decimal::typeid)
			|| before_type->Equals(Double::typeid)
			|| before_type->Equals(Single::typeid)
			|| before_type->Equals(Int32::typeid)
			|| before_type->Equals(UInt32::typeid)
			|| before_type->Equals(Byte::typeid)
			|| before_type->Equals(SByte::typeid)
			|| before_type->Equals(Int16::typeid)
			|| before_type->Equals(UInt16::typeid)
			|| before_type->Equals(Int64::typeid)
			|| before_type->Equals(UInt64::typeid)
			|| before_type->Equals(IntPtr::typeid)
			|| before_type->Equals(UIntPtr::typeid)
			)
		{
			switch (p2)
			{
				case HSPVAR_FLAG_INT:
				{
					auto val = ((int)managed_ptr->Instance);
					*(int*)&reffunc_ptrfunc_ptrvalue = val;
					break;
				}
				case HSPVAR_FLAG_DOUBLE:
				{
					auto val = ((double)managed_ptr->Instance);
					*(double*)&reffunc_ptrfunc_ptrvalue = val;
					break;
				}
				case HSPVAR_FLAG_STR:
				{
					ptr =
						StringToHspStrA(managed_ptr->Instance->ToString());
					break;
				}
				default:
					throw HSPERR_TYPE_MISMATCH;
			}
		}
		else {
			// ToString実行
			switch (p2)
			{
				case HSPVAR_FLAG_STR:
				{
					/*
					*(char*)&reffunc_ptrfunc_ptrvalue =
						*(char*)StringToHspStrA( managed_ptr->Instance->ToString());
					*/
					ptr = StringToHspStrA(managed_ptr->Instance->ToString());
					break;
				}
				default:
					throw HSPERR_TYPE_MISMATCH;
			}
		}

		break;
	}

	case 0x107:								// callfuncd
	{
		// callfuncd(prmbuf, proc, nargs) - double戻り値のDLL関数呼び出し
		PVal *pval;
		PDAT *p;
		pval = code_getpval();
		p = HspVarCorePtrAPTR( pval, 0 );
		p1 = code_geti();
		p2 = code_geti();
#ifdef HSP64
		int64_t bits = call_extfunc_double( (void *)p1, (INT_PTR *)p, p2 );
#else
		double d = call_extfunc_double_x86( (void *)p1, (int *)p, p2 );
		int64_t bits;
		memcpy(&bits, &d, sizeof(double));
#endif
		*type_res = HSPVAR_FLAG_DOUBLE;
		memcpy(&reffunc_intfunc_dvalue, &bits, sizeof(double));
		ptr = &reffunc_intfunc_dvalue;
		break;
	}

	case 0x10A:								// callfuncst
		{
		// callfuncst(prmbuf, proc, nargs, struct_size)
		//   構造体戻り値DLL関数の直接呼び出し。
		//   prmbuf[0] には構造体戻り値用バッファのポインタ (隠し第1引数) を呼び出し側で
		//   セットしておく必要がある。返り値は HSPVAR_FLAG_NSTRUCT として返る。
		PVal *pval;
		PDAT *p;
		pval = code_getpval();
		p = HspVarCorePtrAPTR( pval, 0 );
		p1 = code_geti();					// 関数アドレス
		p2 = code_geti();					// 引数の総数 (隠しポインタを含む)
		int ssize = code_geti();			// 構造体サイズ (バイト)
#ifdef HSP64
		int64_t result_ptr = (int64_t)call_extfunc( (void *)p1, (int *)p, p2 );
#else
		int64_t result_ptr = (int64_t)(uint32_t)call_extfunc( (void *)p1, (int *)p, p2 );
#endif
		extern int hsp_nstruct_pending_size;
		hsp_nstruct_pending_size = ssize;
		*type_res = HSPVAR_FLAG_NSTRUCT;
		ptr = (void *)(intptr_t)result_ptr;
		break;
		}

	case 0x108:								// callfuncf
	{
		// callfuncf(prmbuf, proc, nargs) - float戻り値のDLL関数呼び出し
		PVal *pval;
		PDAT *p;
		pval = code_getpval();
		p = HspVarCorePtrAPTR( pval, 0 );
		p1 = code_geti();
		p2 = code_geti();
#ifdef HSP64
		int64_t bits = call_extfunc_float( (void *)p1, (INT_PTR *)p, p2 );
		float f;
		memcpy(&f, &bits, sizeof(float));
#else
		float f = call_extfunc_float_x86( (void *)p1, (int *)p, p2 );
#endif
		*type_res = HSPVAR_FLAG_DOUBLE;
		reffunc_intfunc_dvalue = (double)f;
		ptr = &reffunc_intfunc_dvalue;
		break;
	}

	case 0x106:								// netexerr
	{
		// netexerr() : 最後の.NET例外メッセージを文字列で返す
		// netexerr(0) : 例外メッセージ (Message)
		// netexerr(1) : 例外の型名 (GetType().FullName)
		// netexerr(2) : 詳細情報 (ToString() = メッセージ+スタックトレース)
		int mode = code_getdi(0);

		*type_res = HSPVAR_FLAG_STR;
		auto expStr = GlobalAccess::g_Hsp3Net->PopLastExceptionInfo(mode);
		if (expStr == nullptr || expStr->Length == 0) {
			ptr = StringToHspStrA(gcnew System::String(""));
		} else {
			ptr = StringToHspStrA(expStr);
		}
		break;
	}

	case 0x109:								// callbackarg
	{
		p1 = code_geti();
		if (hsp_callback_current == NULL) {
			reffunc_intfunc_ivalue = 0;
		} else if (p1 < 0 || p1 >= HSP_CALLBACK_ARG_MAX) {
			reffunc_intfunc_ivalue = 0;
		} else {
#ifndef HSP64
			reffunc_intfunc_ivalue = (int)hsp_callback_current->args[p1];
#else
			*type_res = HSPVAR_FLAG_INT64;
			reffunc_intfunc_i64value = (int64_t)hsp_callback_current->args[p1];
			ptr = &reffunc_intfunc_i64value;
#endif
		}
		break;
	}

	// ----- COM コールバック関連 関数群 -----
	case 0x150:								// comprm(N) — 現在 callback の N 番目引数 (0=user 引数 0)
	{
		p1 = code_geti();
		HspCbComMethodThunk *t = hsp_cbcom_current_thunk;
		if (t == NULL) {
			*type_res = HSPVAR_FLAG_INT;
			reffunc_intfunc_ivalue = 0;
			break;
		}
		// args[0] は this。user 引数は args[1..]
		int idx = p1 + 1;
		if (idx < 0 || idx >= t->slot_count || idx >= HSP_CBCOM_ARG_MAX) {
			*type_res = HSPVAR_FLAG_INT;
			reffunc_intfunc_ivalue = 0;
			break;
		}
		// 宣言された型に応じて返す
		HspCbComMethodInfo *info = &t->klass->methods[t->method_idx];
		short at = (idx - 1 < info->arg_count) ? info->arg_types[idx - 1] : (short)MPTYPE_INUM;
		switch (at) {
		case MPTYPE_INUM:
			*type_res = HSPVAR_FLAG_INT;
			reffunc_intfunc_ivalue = (int)t->args[idx];
			break;
		case MPTYPE_INUM64:
		case MPTYPE_INTPTR:
			*type_res = HSPVAR_FLAG_INT64;
			reffunc_intfunc_i64value = (int64_t)t->args[idx];
			ptr = &reffunc_intfunc_i64value;
			break;
		case MPTYPE_DNUM:
			*type_res = HSPVAR_FLAG_DOUBLE;
			memcpy(&reffunc_intfunc_dvalue, &t->args[idx], sizeof(double));
			ptr = &reffunc_intfunc_dvalue;
			break;
		case MPTYPE_LOCALWSTR:
			{
				// LPCWSTR を SJIS に変換して返す
				wchar_t *wp = (wchar_t *)t->args[idx];
				if (wp == NULL) {
					*type_res = HSPVAR_FLAG_STR;
					hspctx->stmp[0] = 0;
					ptr = hspctx->stmp;
				} else {
					int len = WideCharToMultiByte(CP_ACP, 0, wp, -1, NULL, 0, NULL, NULL);
					hspctx->stmp = sbExpand(hspctx->stmp, len + 1);
					WideCharToMultiByte(CP_ACP, 0, wp, -1, hspctx->stmp, len + 1, NULL, NULL);
					*type_res = HSPVAR_FLAG_STR;
					ptr = hspctx->stmp;
				}
			}
			break;
		case MPTYPE_LOCALSTRING:
			{
				char *sp = (char *)t->args[idx];
				*type_res = HSPVAR_FLAG_STR;
				ptr = (sp == NULL) ? (char *)"" : sp;
			}
			break;
		default:
			// その他 (comobj 等) は raw int64 で返す
			*type_res = HSPVAR_FLAG_INT64;
			reffunc_intfunc_i64value = (int64_t)t->args[idx];
			ptr = &reffunc_intfunc_i64value;
			break;
		}
		break;
	}
	case 0x151:								// comcbidx() — 現在 callback の vtable index
		*type_res = HSPVAR_FLAG_INT;
		reffunc_intfunc_ivalue = (hsp_cbcom_current_thunk == NULL) ? 0 : hsp_cbcom_current_thunk->method_idx;
		break;
	case 0x152:								// comcbtag() — int tag
		*type_res = HSPVAR_FLAG_INT;
		if (hsp_cbcom_current_thunk == NULL) {
			reffunc_intfunc_ivalue = 0;
		} else {
			HspCbComInstance *inst = (HspCbComInstance *)hsp_cbcom_current_thunk->args[0];
			reffunc_intfunc_ivalue = (inst != NULL) ? inst->tag_int : 0;
		}
		break;
	case 0x153:								// comcbtags() — str tag
	{
		// hspctx->stmp (= sb-managed expandable temp buffer) を使う。
		// HSP の他の str 戻り関数 (cnvwtos / cnvatos など) と同じ canonical pattern。
		// raw inst->tag_str を直接返すと HSP 側の文字列マネージャと相性が悪く
		// 不可解な動作になる。
		*type_res = HSPVAR_FLAG_STR;
		const char *src = "";
		if (hsp_cbcom_current_thunk != NULL) {
			HspCbComInstance *inst = (HspCbComInstance *)hsp_cbcom_current_thunk->args[0];
			if (inst && inst->tag_str) src = inst->tag_str;
		}
		int slen = (int)strlen(src) + 1;
		hspctx->stmp = sbExpand(hspctx->stmp, slen);
		memcpy(hspctx->stmp, src, slen);
		ptr = hspctx->stmp;
		break;
	}
	case 0x154:								// comcbis(comobj_var) — 現 callback の this と一致なら 1
	{
		PVal *pval;
		APTR aptr;
		aptr = code_getva(&pval);
		*type_res = HSPVAR_FLAG_INT;
		reffunc_intfunc_ivalue = 0;
		if (hsp_cbcom_current_thunk != NULL && pval->flag == TYPE_COMOBJ) {
			IUnknown **ppunk = (IUnknown **)HspVarCorePtrAPTR(pval, aptr);
			if (ppunk != NULL && *ppunk == (IUnknown *)hsp_cbcom_current_thunk->args[0]) {
				reffunc_intfunc_ivalue = 1;
			}
		}
		break;
	}
	case 0x155:								// comcbthis() — raw IUnknown* (intptr)
		*type_res = HSPVAR_FLAG_INT64;
		reffunc_intfunc_i64value = (hsp_cbcom_current_thunk == NULL)
			? 0 : (int64_t)hsp_cbcom_current_thunk->args[0];
		ptr = &reffunc_intfunc_i64value;
		break;

	default:
		throw ( HSPERR_SYNTAX );
	}

	//			')'で終わるかを調べる
	//
	if ( *type != TYPE_MARK ) throw ( HSPERR_INVALID_FUNCPARAM );
	if ( *val != ')' ) throw ( HSPERR_INVALID_FUNCPARAM );
	code_next();

	return ptr;
}


static void *reffunc_dllcmd( int *type_res, int arg )
{
	//		reffunc : TYPE_DLLFUNC
	//		(拡張DLL関数)
	//

	//			'('で始まるかを調べる
	//
	if ( *type != TYPE_MARK ) throw ( HSPERR_INVALID_FUNCPARAM );
	if ( *val != '(' ) throw ( HSPERR_INVALID_FUNCPARAM );

	exec_dllcmd( arg, STRUCTDAT_OT_FUNCTION );

	//			')'で終わるかを調べる
	//
	if ( *type != TYPE_MARK ) throw ( HSPERR_INVALID_FUNCPARAM );
	if ( *val != ')' ) throw ( HSPERR_INVALID_FUNCPARAM );
	code_next();

	// STRUCTDAT のリターン型フラグを確認
	const STRUCTDAT *st = GetPRM(arg);
	int rettype = st->otindex & STRUCTDAT_OT_RETMASK;

	if (rettype == STRUCTDAT_OT_RETDOUBLE || rettype == STRUCTDAT_OT_RETFLOAT) {
		// double/float 戻り値: stat に格納されたビットパターンを double として返す
		*type_res = HSPVAR_FLAG_DOUBLE;
		memcpy(&reffunc_intfunc_dvalue, &hspctx->stat, sizeof(double));
		return &reffunc_intfunc_dvalue;
	}

	// stat の値に応じて int または int64 で返す
	if ( hspctx->stat > 0x7FFFFFFFLL || hspctx->stat < -0x80000000LL ) {
		*type_res = HSPVAR_FLAG_INT64;
		reffunc_intfunc_i64value = hspctx->stat;
		return &reffunc_intfunc_i64value;
	}
	*type_res = HSPVAR_FLAG_INT;
	reffunc_intfunc_ivalue = (int)hspctx->stat;
	return &reffunc_intfunc_ivalue;
}


static int termfunc_dllcmd( int option )
{
	//		termfunc : TYPE_DLLCMD
	//
#ifndef HSP_COM_UNSUPPORTED
	VariantClear( &comconv_var );
	//TermAtxDll();
#endif

	Hsp3ExtLibTerm();
	TermLanguage();
	return 0;
}

void hsp3typeinit_dllcmd( HSP3TYPEINFO *info )
{
#ifndef HSP_COM_UNSUPPORTED
#ifdef HSP_COMOBJ_DEBUG
	if (fpComDbg == NULL) fpComDbg = fopen( "comobj_dbg.txt", "w");
#endif
	InitAtxDll();
	VariantInit( &comconv_var );
	comres_pval = NULL;
#endif	// !defined( HSP_COM_UNSUPPORTED )


	InitSystemInformation();
	InitLanguage();

	hspctx = info->hspctx;
	exinfo = info->hspexinfo;
	type = exinfo->nptype;
	val = exinfo->npval;
	exflg = exinfo->npexflg;

	info->cmdfunc = cmdfunc_dllcmd;
	info->reffunc = reffunc_dllcmd;
	info->termfunc = termfunc_dllcmd;

	Hsp3ExtLibInit( info );
}

void hsp3typeinit_dllctrl( HSP3TYPEINFO *info )
{
	info->cmdfunc = cmdfunc_ctrlcmd;
	info->reffunc = reffunc_ctrlfunc;
}

/*------------------------------------------------------------*/
/*
		Sysinfo, getdir service
*/
/*------------------------------------------------------------*/

char *hsp3ext_sysinfo(int p2, int* res, char* outbuf)
{
	//		System strings get
	//
	int fl;
	TCHAR pp[128];
	char* p1;
	BOOL success;
	DWORD version;
	DWORD size;
	DWORD* mss;
	SYSTEM_INFO si;
	MEMORYSTATUS ms;
	int plen;
	char *p;

	fl = HSPVAR_FLAG_INT;
	p1 = outbuf;
	size = HSP_MAX_PATH;

	if (p2 & 16) {
		GetSystemInfo(&si);
	}
	if (p2 & 32) {
		GlobalMemoryStatus(&ms);
		mss = (DWORD*)&ms;
		*(int*)p1 = (int)mss[p2 & 15];
		*res = fl;
		return p1;
	}

	switch (p2) {
	case 0:
		_tcscpy((TCHAR*)p1, TEXT("Windows"));
		version = GetVersion();
		if ((version & 0x80000000) == 0) _tcscat((TCHAR*)p1, TEXT("NT"));
		else _tcscat((TCHAR*)p1, TEXT("9X"));
		/*
			rev 43
			mingw : warning : 仮引数int 実引数long unsigned
			に対処
		*/
		_stprintf(pp, TEXT(" ver%d.%d"), static_cast<int>(version & 0xff), static_cast<int>((version & 0xff00) >> 8));
		_tcscat((TCHAR*)p1, pp);
		apichartohspchar((TCHAR*)p1, &p);
		plen = strlen(p);
		if (p1 != p) {
			memcpy(p1, p, plen);
			p1[plen] = '\0';
		}
		freehc(&p);
		fl = HSPVAR_FLAG_STR;
		break;
	case 1:
		success = GetUserName((TCHAR*)p1, &size);
		apichartohspchar((TCHAR*)p1, &p);
		plen = strlen(p);
		if (p1 != p) {
			memcpy(p1, p, plen);
			p1[plen] = '\0';
		}
		freehc(&p);
		fl = HSPVAR_FLAG_STR;
		break;
	case 2:
		success = GetComputerName((TCHAR*)p1, &size);
		apichartohspchar((TCHAR*)p1, &p);
		plen = strlen(p);
		if (p1 != p) {
			memcpy(p1, p, plen);
			p1[plen] = '\0';
		}
		freehc(&p);
		fl = HSPVAR_FLAG_STR;
		break;
	case 3:
		*(int*)p1 = hspctx->language;
		break;
	case 16:
		*(int*)p1 = (int)si.dwProcessorType;
		break;
	case 17:
		*(int*)p1 = (int)si.dwNumberOfProcessors;
		break;
	default:
		return NULL;
	}
	*res = fl;
	return p1;
}


/*
#define CSIDL_DESKTOP                   0x0000
#define CSIDL_INTERNET                  0x0001
#define CSIDL_PROGRAMS                  0x0002
#define CSIDL_CONTROLS                  0x0003
#define CSIDL_PRINTERS                  0x0004
#define CSIDL_PERSONAL                  0x0005
#define CSIDL_FAVORITES                 0x0006
#define CSIDL_STARTUP                   0x0007
#define CSIDL_RECENT                    0x0008
#define CSIDL_SENDTO                    0x0009
#define CSIDL_BITBUCKET                 0x000a
#define CSIDL_STARTMENU                 0x000b
#define CSIDL_DESKTOPDIRECTORY          0x0010
#define CSIDL_DRIVES                    0x0011
#define CSIDL_NETWORK                   0x0012
#define CSIDL_NETHOOD                   0x0013
#define CSIDL_FONTS                     0x0014
#define CSIDL_TEMPLATES                 0x0015
#define CSIDL_COMMON_STARTMENU          0x0016
#define CSIDL_COMMON_PROGRAMS           0X0017
#define CSIDL_COMMON_STARTUP            0x0018
#define CSIDL_COMMON_DESKTOPDIRECTORY   0x0019
#define CSIDL_APPDATA                   0x001a
#define CSIDL_PRINTHOOD                 0x001b
#define CSIDL_ALTSTARTUP                0x001d         // DBCS
#define CSIDL_COMMON_ALTSTARTUP         0x001e         // DBCS
#define CSIDL_COMMON_FAVORITES          0x001f
#define CSIDL_INTERNET_CACHE            0x0020
#define CSIDL_COOKIES                   0x0021
#define CSIDL_HISTORY                   0x0022
*/
char* hsp3ext_getdir(int id)
{
	//		dirinfo命令の内容をstmpに設定する
	//
	char *p;
	TCHAR pw[HSPCTX_REFSTR_MAX];
	char *resp8;
	p = hspctx->stmp;
	HSPCHAR *hctmp1 = 0;
	int cutlast = 1;
	int apiconv = 1;

	*pw = 0;
	switch (id) {
	case 0:				//    カレント(現在の)ディレクトリ
		_tgetcwd(pw, HSPCTX_REFSTR_MAX);
		break;
	case 1:				//    HSPの実行ファイルがあるディレクトリ
		p = hspctx->modfilename;
		cutlast = 0; apiconv = 0;
		break;
	case 2:				//    Windowsディレクトリ
		GetWindowsDirectory(pw, HSPCTX_REFSTR_MAX);
		break;
	case 3:				//    Windowsのシステムディレクトリ
		GetSystemDirectory(pw, HSPCTX_REFSTR_MAX);
		break;
	case 4:				//    コマンドライン文字列
		p = hspctx->cmdline;
		cutlast = 0; apiconv = 0;
		break;
	case 5:				//    HSPTV素材があるディレクトリ
#if defined(HSPDEBUG)||defined(HSP3IMP)
		p = hspctx->tvfoldername;
#else
		p = "";
#endif
		cutlast = 0; apiconv = 0;
		break;
	case 6:				//    ランゲージコード
		p = hspctx->langcode;
		cutlast = 0; apiconv = 0;
		break;
	default:
		if (id & 0x10000) {
			SHGetSpecialFolderPath(NULL, pw, id & 0xffff, FALSE);
			break;
		}
		throw HSPERR_ILLEGAL_FUNCTION;
	}

	if (apiconv) {
		apichartohspchar(pw, &resp8);
		sbStrCopy(&(hspctx->stmp), resp8);
		freehc(&resp8);
		p = hspctx->stmp;
	}
	//		最後の'\\'を取り除く
	//
	if (cutlast) {
		CutLastChr(p, '\\');
	}
	return p;
}


void hsp3ext_execfile(char* stmp, char* ps, int mode)
{
	int i, j;
	HSPAPICHAR *hactmp1 = 0;
	HSPAPICHAR *hactmp2 = 0;
	j = SW_SHOWDEFAULT; if (mode & 2) j = SW_SHOWMINIMIZED;

	if (*ps != 0) {
		SHELLEXECUTEINFO exinfo;
		memset(&exinfo, 0, sizeof(SHELLEXECUTEINFO));
		exinfo.cbSize = sizeof(SHELLEXECUTEINFO);
		exinfo.fMask = SEE_MASK_INVOKEIDLIST;
		exinfo.hwnd = NULL;
		exinfo.lpVerb = chartoapichar(ps, &hactmp1);
		exinfo.lpFile = chartoapichar(stmp, &hactmp2);
		exinfo.nShow = SW_SHOWNORMAL;
		if (ShellExecuteEx(&exinfo) == false) {
			freehac(&hactmp1);
			freehac(&hactmp2);
			throw HSPERR_EXTERNAL_EXECUTE;
		}
		freehac(&hactmp1);
		freehac(&hactmp2);
		return;
	}

	if (mode & 16) {
		i = (int)(INT_PTR)ShellExecute(NULL, NULL, chartoapichar(stmp, &hactmp1), TEXT(""), TEXT(""), j);
		freehac(&hactmp1);
	}
	else if (mode & 32) {
		i = (int)(INT_PTR)ShellExecute(NULL, TEXT("print"), chartoapichar(stmp, &hactmp1), TEXT(""), TEXT(""), j);
		freehac(&hactmp1);
	}
	else {
		i = WinExec(chartoapichar(stmp, &hactmp1), j);
		freehac(&hactmp1);
	}
	if (i < 32) throw HSPERR_EXTERNAL_EXECUTE;
}


