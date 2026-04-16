#!/usr/bin/env python3
"""
gen_winapi_as.py — Windows SDK ヘッダから IronHSP の .as 拡張ヘッダを自動生成する

特徴:
- libclang Python binding を使って C ヘッダを正確に parse
- intptr / NSTRUCT / wstr 対応の現代的な .as フォーマットを emit
- 関数 (BOOL/HWND/LRESULT/etc.) と struct (RECT/POINT/MSG/etc.) を扱う
- A/W 関数は W 版を優先

使い方 (例):
  python tools/gen_winapi_as.py \
      --header winuser.h \
      --dll user32.dll \
      --out package/win32/common/user32_gen.as \
      --include "user32_includes.txt" \
      --func "CreateWindowExW,DestroyWindow,ShowWindow,..." \
      --struct "tagRECT,tagPOINT,tagMSG"

  → package/win32/common/user32_gen.as を生成

将来の拡張案:
- --func のリストを *.txt から読む
- 全 export 関数を自動列挙 (libclang の TranslationUnit cursor walk)
- COM interface (#usecom) の自動生成
- WinRT 系 (winmd parsing) サポート

設計参考: project_win32_api_modernization.md
"""

import argparse
import os
import sys
from clang.cindex import Index, CursorKind, TypeKind, TranslationUnit, Config


# --- 型マッピング表 ---------------------------------------------------------
# C 型名 (typedef chain を辿った結果) → IronHSP の引数型
TYPE_MAP = {
    # 32bit 整数 (HSP int)
    "BOOL":     "int",
    "INT":      "int",
    "UINT":     "int",
    "DWORD":    "int",
    "WORD":     "int",
    "BYTE":     "int",
    "LONG":     "int",
    "ULONG":    "int",
    "SHORT":    "int",
    "USHORT":   "int",
    "ATOM":     "int",
    "WCHAR":    "int",
    "char":     "int",
    "int":      "int",
    "long":     "int",
    "short":    "int",
    "unsigned int":   "int",
    "unsigned long":  "int",
    "unsigned short": "int",
    "unsigned char":  "int",
    "signed char":    "int",
    # 64bit 整数 (明示的)
    "LONGLONG":  "int64",
    "ULONGLONG": "int64",
    "INT64":     "int64",
    "UINT64":    "int64",
    "__int64":   "int64",
    # platform-sized (intptr) — HANDLE 系
    "HANDLE":     "intptr",
    "HWND":       "intptr",
    "HMODULE":    "intptr",
    "HINSTANCE":  "intptr",
    "HMENU":      "intptr",
    "HICON":      "intptr",
    "HCURSOR":    "intptr",
    "HBRUSH":     "intptr",
    "HFONT":     "intptr",
    "HPEN":      "intptr",
    "HDC":        "intptr",
    "HBITMAP":    "intptr",
    "HRGN":       "intptr",
    "HACCEL":    "intptr",
    "HHOOK":      "intptr",
    "HPALETTE":   "intptr",
    "HMONITOR":   "intptr",
    "HKEY":       "intptr",
    "HGLOBAL":    "intptr",
    "HLOCAL":     "intptr",
    "WPARAM":     "intptr",
    "LPARAM":     "intptr",
    "LRESULT":    "intptr",
    "LONG_PTR":   "intptr",
    "ULONG_PTR":  "intptr",
    "INT_PTR":    "intptr",
    "UINT_PTR":   "intptr",
    "DWORD_PTR":  "intptr",
    "SIZE_T":     "intptr",
    "SSIZE_T":    "intptr",
    "PVOID":      "intptr",
    "LPVOID":     "intptr",
    "LPCVOID":    "intptr",
    # 浮動小数
    "float":  "float",
    "double": "double",
    "FLOAT":  "float",
    "DOUBLE": "double",
    # 文字列
    "LPSTR":   "str",
    "LPCSTR":  "str",
    "PCSTR":   "str",
    "PSTR":    "str",
    "LPWSTR":  "wstr",
    "LPCWSTR": "wstr",
    "PCWSTR":  "wstr",
    "PWSTR":   "wstr",
    # 構造体ポインタ — NSTRUCT を渡せるように var にマップ
    "LPRECT":  "var",
    "LPCRECT": "var",
    "PRECT":   "var",
    "LPPOINT": "var",
    "PPOINT":  "var",
    "LPSIZE":  "var",
    "LPMSG":   "var",
    "PMSG":    "var",
    "LPWNDCLASSEXW": "var",
    "LPWNDCLASSW":   "var",
    "LPCREATESTRUCTW": "var",
    "LPNMHDR": "var",
    # void
    "void": "",
}


def get_type_name(t) -> str:
    """libclang Type から typedef 名を保ちつつ型名を取得する。
    HWND が int に desugar されないようにする。"""
    if t.kind == TypeKind.TYPEDEF:
        return t.get_declaration().spelling
    if t.kind == TypeKind.POINTER:
        pointee = t.get_pointee()
        return get_type_name(pointee) + "*"
    if t.kind == TypeKind.LVALUEREFERENCE:
        return get_type_name(t.get_pointee()) + "&"
    if t.kind == TypeKind.CONSTANTARRAY or t.kind == TypeKind.INCOMPLETEARRAY:
        return get_type_name(t.element_type) + "[]"
    if t.kind == TypeKind.RECORD:
        decl = t.get_declaration()
        return decl.spelling or "anon"
    if t.kind in (TypeKind.UNEXPOSED, TypeKind.ELABORATED):
        # ELABORATED type: e.g. "struct tagMSG", drill into named decl
        d = t.get_declaration()
        if d and d.spelling:
            return d.spelling
    return t.spelling


def map_type(ctype: str) -> str:
    """C 型名を IronHSP .as 引数型に変換。pointer / 修飾子 を取り除く。"""
    t = ctype.strip()
    # const, volatile, __unaligned 等を除去
    for kw in ("const ", "volatile ", "__unaligned ", "__restrict ", "__restrict__ ",
               "_In_ ", "_Out_ ", "_Inout_ ", "_In_opt_ ", "_Out_opt_ ", "_Inout_opt_ "):
        t = t.replace(kw, "")
    t = t.strip()

    # 直接ヒット
    if t in TYPE_MAP:
        return TYPE_MAP[t]

    # ポインタ系
    if t.endswith("*") or t.endswith("&"):
        base = t[:-1].strip()
        # よくあるパターン
        if base in ("WCHAR", "wchar_t"):
            return "wstr"
        if base == "char":
            return "str"
        if base in ("RECT", "tagRECT", "POINT", "tagPOINT", "SIZE", "tagSIZE",
                    "MSG", "tagMSG"):
            return "var"   # NSTRUCT で扱うべき構造体ポインタ
        # それ以外のポインタは intptr (生 ptr)
        return "intptr"

    # 配列 → ポインタ扱い
    if "[" in t:
        return "intptr"

    # struct/union 値渡し → intptr で fallback (8 byte 以下の値型は将来対応)
    if t.startswith("struct ") or t.startswith("union "):
        return "intptr"

    # 不明 → intptr で fallback
    return "intptr"


def map_return_type(ctype: str) -> str:
    """戻り値の C 型 → HSP の #func/#cfunc 系の指定."""
    t = ctype.strip()
    # void 戻り値 → #func, それ以外 → #cfunc
    if t == "void" or t == "VOID":
        return None  # void
    return map_type(ctype) or "int"


def parse_header(header_path: str, include_dirs: list[str]) -> TranslationUnit:
    """libclang で C ヘッダを parse する."""
    args = ["-x", "c", "-fms-extensions", "-fms-compatibility",
            "-DUNICODE", "-D_UNICODE", "-DSTRICT",
            "-D_M_X64", "-D_AMD64_", "-DWIN32", "-D_WIN32"]
    for d in include_dirs:
        args.extend(["-I", d])
    index = Index.create()
    # PARSE_SKIP_FUNCTION_BODIES を使うと cursor.get_tokens() が空になる場合が
    # あるので、トークン取得のために省く
    return index.parse(header_path, args=args)


def get_arg_type_from_tokens(arg_cursor) -> str:
    """関数引数の cursor から original token を取り出して C 型名を復元する。
    libclang の type.spelling は HWND を int に desugar してしまうため、
    原始トークンを直接読み取って HWND / LPCWSTR 等の typedef 名を保つ。"""
    toks = [t.spelling for t in arg_cursor.get_tokens()]
    if not toks:
        return arg_cursor.type.spelling
    # 末尾が引数名 (= cursor.spelling) の場合は除去
    name = arg_cursor.spelling
    if name and toks[-1] == name:
        toks = toks[:-1]
    # 修飾子と _In_ 系を除去
    skip = {"const", "volatile", "_In_", "_Out_", "_Inout_", "_In_opt_",
            "_Out_opt_", "_Inout_opt_", "_Reserved_", "_In_z_", "_Out_z_",
            "__inout", "__in", "__out", "__in_opt", "__out_opt",
            "_In_reads_", "_Out_writes_"}
    toks = [t for t in toks if t not in skip]
    return " ".join(toks).strip() or arg_cursor.type.spelling


def get_ret_type_from_tokens(func_cursor) -> str:
    """関数宣言全体のトークンから戻り値の C 型を抽出する。"""
    toks = [t.spelling for t in func_cursor.get_tokens()]
    if not toks:
        return func_cursor.result_type.spelling
    name = func_cursor.spelling
    if name not in toks:
        return func_cursor.result_type.spelling
    idx = toks.index(name)
    pre = toks[:idx]
    # WINUSERAPI / WINAPI / __cdecl / __stdcall / DECLSPEC_* 等を除去
    skip_tokens = {"WINUSERAPI", "WINAPI", "WINBASEAPI", "WINGDIAPI", "WINOLEAPI",
                   "WINOLEAUTAPI", "STDAPI", "SHSTDAPI", "__cdecl", "__stdcall",
                   "__fastcall", "DECLSPEC_NORETURN", "DECLSPEC_DEPRECATED",
                   "EXTERN_C", "extern", '"C"',
                   "_Must_inspect_result_", "_Check_return_",
                   "const", "volatile"}
    pre = [t for t in pre if t not in skip_tokens]
    return " ".join(pre).strip() or func_cursor.result_type.spelling


def collect_functions(tu, name_set: set[str]) -> list[dict]:
    """指定名の関数宣言を集める. typedef 名を保つために生 token を使う."""
    found = {}

    def walk(cursor):
        if cursor.kind == CursorKind.FUNCTION_DECL:
            n = cursor.spelling
            if n in name_set and n not in found:
                ret = get_ret_type_from_tokens(cursor)
                params = []
                for arg in cursor.get_arguments():
                    params.append({
                        "name": arg.spelling or "_",
                        "type": get_arg_type_from_tokens(arg),
                    })
                found[n] = {"name": n, "ret": ret, "params": params}
        for child in cursor.get_children():
            walk(child)

    walk(tu.cursor)
    return [found[n] for n in name_set if n in found]


def get_field_type_from_tokens(field_cursor) -> str:
    toks = [t.spelling for t in field_cursor.get_tokens()]
    if not toks:
        return field_cursor.type.spelling
    name = field_cursor.spelling
    # 末尾の name と ; を除去
    while toks and toks[-1] in (";", name):
        toks.pop()
    return " ".join(toks).strip() or field_cursor.type.spelling


def collect_structs(tu, name_set: set[str]) -> list[dict]:
    """指定名の struct を集める."""
    found = {}

    def walk(cursor):
        if cursor.kind == CursorKind.STRUCT_DECL and cursor.is_definition():
            n = cursor.spelling
            if n in name_set and n not in found:
                fields = []
                for f in cursor.get_children():
                    if f.kind == CursorKind.FIELD_DECL:
                        fields.append({
                            "name": f.spelling,
                            "type": get_field_type_from_tokens(f),
                        })
                if fields:
                    found[n] = {"name": n, "fields": fields}
        for child in cursor.get_children():
            walk(child)

    walk(tu.cursor)
    return [found[n] for n in name_set if n in found]


def emit_struct(s: dict) -> str:
    """NSTRUCT (#defstruct) として emit. C struct のフィールドを HSP 型に変換."""
    lines = [f"#defstruct global {s['name']}"]
    for f in s["fields"]:
        t = map_type(f["type"])
        if t == "":
            t = "int"
        # NSTRUCT が #field でサポートする型に丸める
        if t in ("var", "wstr", "str"):
            t = "intptr"  # ポインタ系は intptr
        if t == "double":
            t = "double"  # NSTRUCT は double をサポート
        if t == "float":
            t = "float"
        lines.append(f"    #field {t} {f['name']}")
    lines.append("#endstruct")
    return "\n".join(lines)


def emit_function(f: dict, dll_uselib: str) -> str:
    """#func または #cfunc として emit."""
    ret_type = f["ret"]
    is_void = (ret_type.strip() in ("void", "VOID"))
    directive = "#func " if is_void else "#cfunc"

    # 引数列
    arg_types = []
    for p in f["params"]:
        t = map_type(p["type"])
        if t == "":
            continue  # void 引数 (= 引数なし)
        arg_types.append(t)

    # コメント
    proto = f"; {ret_type} {f['name']}({', '.join(p['type'] + ' ' + p['name'] for p in f['params'])})"

    if arg_types:
        body = f'{directive} {f["name"]} "{f["name"]}" {", ".join(arg_types)}'
    else:
        body = f'{directive} {f["name"]} "{f["name"]}"'
    return f"{proto}\n{body}"


def emit_as_file(args, structs: list[dict], functions: list[dict]) -> str:
    """完全な .as ファイルを文字列で返す."""
    out = []
    out.append("; ============================================================")
    out.append(f";   Auto-generated by tools/gen_winapi_as.py")
    out.append(f";   header: {args.header}")
    out.append(f";   dll:    {args.dll}")
    out.append(";   注意: 自動生成のため手で編集しても上書きされる可能性あり。")
    out.append(";          intptr / NSTRUCT / wstr 対応 (hsp3net 専用)")
    out.append("; ============================================================")
    out.append("")
    sentinel = os.path.basename(args.out).replace(".", "_").lower()
    out.append(f"#ifndef __{sentinel}__")
    out.append(f"#define __{sentinel}__")
    out.append("")

    if structs:
        out.append(";--- structs ---")
        for s in structs:
            out.append(emit_struct(s))
            out.append("")

    if functions:
        out.append(";--- functions ---")
        out.append(f'#uselib "{args.dll}"')
        for f in functions:
            out.append(emit_function(f, args.dll))
            out.append("")

    out.append("#endif")
    return "\n".join(out) + "\n"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--header", required=True, help="parse する C ヘッダ (.h) フルパス")
    ap.add_argument("--dll", required=True, help='ターゲット DLL 名 (例 "user32.dll")')
    ap.add_argument("--out", required=True, help="出力 .as ファイルパス")
    ap.add_argument("--include", action="append", default=[],
                    help="追加の include path (複数可)")
    ap.add_argument("--func", default="",
                    help="生成対象の関数名カンマ区切り (例 CreateWindowExW,DestroyWindow)")
    ap.add_argument("--struct", default="",
                    help="生成対象の struct 名カンマ区切り (例 tagRECT,tagPOINT)")
    args = ap.parse_args()

    func_set = set(s.strip() for s in args.func.split(",") if s.strip())
    struct_set = set(s.strip() for s in args.__dict__["struct"].split(",") if s.strip())

    # Windows SDK のデフォルト include path を追加
    sdk_root = r"C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0"
    default_includes = [
        os.path.join(sdk_root, "um"),
        os.path.join(sdk_root, "shared"),
        os.path.join(sdk_root, "ucrt"),
    ]
    include_dirs = args.include + default_includes

    print(f"[parse] {args.header}")
    tu = parse_header(args.header, include_dirs)
    diag_count = sum(1 for d in tu.diagnostics if d.severity >= 3)
    if diag_count:
        print(f"[warn] {diag_count} parse errors (proceeding)")

    structs = collect_structs(tu, struct_set) if struct_set else []
    functions = collect_functions(tu, func_set) if func_set else []

    print(f"[found] {len(structs)} structs, {len(functions)} functions")
    for s in structs:
        print(f"        struct {s['name']} ({len(s['fields'])} fields)")
    for f in functions:
        print(f"        func   {f['name']} ({len(f['params'])} params)")

    text = emit_as_file(args, structs, functions)
    os.makedirs(os.path.dirname(args.out) or ".", exist_ok=True)
    with open(args.out, "wb") as fp:
        # CRLF
        fp.write(text.replace("\n", "\r\n").encode("utf-8"))
    print(f"[wrote] {args.out} ({len(text)} chars)")


if __name__ == "__main__":
    main()
