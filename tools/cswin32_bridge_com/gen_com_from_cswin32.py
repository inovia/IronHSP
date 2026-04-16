#!/usr/bin/env python3
"""Parse CsWin32 COM-interface output (allowMarshaling=true) and emit
IronHSP `.as` files with #usecom / #comfunc declarations.

Reads  : tools/cswin32_bridge_com/obj/generated/.../*.g.cs
Writes : package/win32/common/com_<category>_gen2.as   (Shift-JIS, CRLF)
         package/hsphelp/win32_com_<category>_gen2.hs  (Shift-JIS, CRLF)
         tools/cswin32_bridge_com/docs_en.json          (English doc cache)

Design notes
------------
With `allowMarshaling=true`, CsWin32 emits each COM interface as a C# block
like this:

    [Guid("xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"),
     InterfaceType(ComInterfaceType.InterfaceIsIUnknown),ComImport()]
    public interface IFoo : IBar, IBaz
    {
        new void Method1(int arg);
        unsafe new void Method2(Bar* outBar);
        void Method3();
    }

CsWin32 FLATTENS the vtable: inherited methods from parents are re-emitted
with `new` in slot order, so method N in the interface body = vtable slot
`base + N` where `base` is:
  - 3  for InterfaceIsIUnknown   (QueryInterface / AddRef / Release)
  - 7  for InterfaceIsIDispatch  (adds GetTypeInfoCount / GetTypeInfo /
                                   GetIDsOfNames / Invoke)
  - 7  for InterfaceIsDual       (behaves like IDispatch vtable)

So we can parse each interface independently without tracking inheritance.

Type mapping (CsWin32 C# type → HSP #comfunc type):
- interface types (IFoo)              → comobj (or intptr for raw)
- handles (HWND/HDC/...)              → intptr
- PCWSTR / PWSTR                      → wstr
- PCSTR / PSTR                        → str
- BOOL / int / uint / short / ushort  → int
- long / ulong                        → int64
- float / double                      → float / double
- struct pointer (TYPE*)              → var   (HSP passes NSTRUCT address)
- void*                               → intptr
- HRESULT return                      → (void / ignored in #comfunc)
"""

from __future__ import annotations
import json
import os
import re
import sys
from pathlib import Path
from typing import Dict, List, Tuple, Optional
from html import unescape

ROOT = Path(__file__).resolve().parents[2]
GEN_DIR = ROOT / "tools" / "cswin32_bridge_com" / "obj" / "generated" / \
    "Microsoft.Windows.CsWin32" / \
    "Microsoft.Windows.CsWin32.SourceGenerator"
OUT_AS_DIR = ROOT / "package" / "win32" / "common"
OUT_HS_DIR = ROOT / "package" / "hsphelp"
DOCS_EN_PATH = ROOT / "tools" / "cswin32_bridge_com" / "docs_en.json"
DOCS_JA_PATH = ROOT / "tools" / "cswin32_bridge_com" / "docs_ja.json"

_DOCS_JA: Dict[str, str] = {}

def ja(key: str, en: str) -> str:
    return _DOCS_JA.get(key) or en


# ----------------------------------------------------------------------------
# XML doc stripping
# ----------------------------------------------------------------------------

XML_TAG = re.compile(r"<[^>]+>")
PARA_OPEN = re.compile(r"<para[^>]*>", re.I)
PARA_CLOSE = re.compile(r"</para>", re.I)


def strip_xml(text: str) -> str:
    t = PARA_CLOSE.sub("\n", text)
    t = PARA_OPEN.sub("", t)
    t = XML_TAG.sub("", t)
    t = unescape(t)
    lines = [ln.strip() for ln in t.splitlines()]
    lines = [ln for ln in lines if ln]
    lines = [ln for ln in lines
             if "Read more on docs.microsoft.com" not in ln
             and "Learn more about this API" not in ln]
    return "\n".join(lines).strip()


def parse_doc(buf: List[str]) -> Dict[str, str]:
    """Given a list of lines collected from `///` comments, return a dict
    with keys: summary, returns, remarks, and param:<name>."""
    blob = "\n".join(buf)
    out: Dict[str, str] = {}
    m = re.search(r"<summary>(.*?)</summary>", blob, re.S | re.I)
    if m: out["summary"] = strip_xml(m.group(1))
    m = re.search(r"<returns>(.*?)</returns>", blob, re.S | re.I)
    if m: out["returns"] = strip_xml(m.group(1))
    m = re.search(r"<remarks>(.*?)</remarks>", blob, re.S | re.I)
    if m: out["remarks"] = strip_xml(m.group(1))
    for pm in re.finditer(
        r'<param\s+name="([^"]+)"[^>]*>(.*?)</param>', blob, re.S | re.I):
        out[f"param:{pm.group(1)}"] = strip_xml(pm.group(2))
    return out


# ----------------------------------------------------------------------------
# Type mapping
# ----------------------------------------------------------------------------

TYPE_CLEAN = re.compile(r"winmdroot\.[A-Za-z0-9_.]*\.|global::System\.[A-Za-z0-9_.]*\.")
_INTERFACE_NAMES: set = set()   # populated during scan_interfaces()


def short_type(cs: str) -> str:
    cs = cs.strip()
    cs = TYPE_CLEAN.sub("", cs)
    cs = re.sub(r"\s+", " ", cs).strip()
    return cs


HANDLE_LIKE = {
    "HWND", "HDC", "HBITMAP", "HBRUSH", "HCURSOR", "HFONT", "HGDIOBJ",
    "HICON", "HINSTANCE", "HMENU", "HMODULE", "HPEN", "HRGN", "HDROP",
    "HGLOBAL", "HENHMETAFILE", "LPARAM", "WPARAM", "LRESULT", "HRESULT",
    "NTSTATUS", "HANDLE",
}
WSTR_LIKE = {"PCWSTR", "PWSTR"}
STR_LIKE = {"PCSTR", "PSTR"}
INT_PRIMS = {"BOOL", "int", "uint", "short", "ushort", "byte", "sbyte",
             "char", "bool", "BOOLEAN", "BYTE", "WORD", "DWORD", "UINT",
             "INT", "SHORT", "USHORT", "CHAR", "UCHAR", "ATOM"}
INT64_PRIMS = {"long", "ulong", "LONG64", "ULONG64", "DWORDLONG",
               "LARGE_INTEGER", "ULARGE_INTEGER", "INT64", "UINT64"}


def cs_type_to_hsp(cs: str) -> str:
    # Strip [Optional], [In], [Out], [MarshalAs(...)], ref/out/in modifiers
    t = re.sub(r"\[[^\]]*\]\s*", "", cs)
    t = re.sub(r"^\s*(?:ref|out|in)\s+", "", t)
    t = short_type(t).strip()

    if t.endswith("*"):
        inner = t[:-1].strip()
        if inner in ("void",):
            return "intptr"
        if inner in ("char",):
            return "intptr"  # raw wchar buffer
        if inner in _INTERFACE_NAMES:
            return "comobj"
        if inner.startswith("I") and len(inner) > 1 and inner[1:2].isupper():
            # Likely an unknown COM interface
            return "comobj"
        # Struct / enum pointer → var (caller passes NSTRUCT address)
        return "var"

    # Non-pointer interface type = directly passed comobj
    if t in _INTERFACE_NAMES:
        return "comobj"
    if t.startswith("I") and len(t) > 1 and t[1:2].isupper() and t != "INT":
        return "comobj"

    if t in HANDLE_LIKE:
        return "intptr"
    if t in WSTR_LIKE:
        return "wstr"
    if t in STR_LIKE:
        return "str"
    if t in INT_PRIMS:
        return "int"
    if t in INT64_PRIMS:
        return "int64"
    if t in ("float",): return "float"
    if t in ("double",): return "double"
    # Unknown → int
    return "int"


# ----------------------------------------------------------------------------
# Interface scanning
# ----------------------------------------------------------------------------

GUID_RE = re.compile(r'Guid\("([0-9a-fA-F\-]+)"\)')
ITYPE_RE = re.compile(r"InterfaceType\(ComInterfaceType\.(\w+)\)")
INTERFACE_HEADER_RE = re.compile(
    r"public\s+interface\s+(\w+)\s*(?::\s*([^{]+))?\s*\{"
)


class ComMethod:
    def __init__(self, slot: int, name: str, ret_cs: str,
                 args_cs: str, doc: Dict[str, str]):
        self.slot = slot
        self.name = name
        self.ret_cs = ret_cs
        self.args_cs = args_cs
        self.doc = doc

    def hsp_args(self) -> List[Tuple[str, str]]:
        """Return list of (hsp_type, arg_name)."""
        out: List[Tuple[str, str]] = []
        parts = split_top_commas(self.args_cs)
        for p in parts:
            p = p.strip()
            if not p: continue
            # "TYPE name" — split on last word
            m = re.match(r"^(.*?)(\b\w+)\s*$", p)
            if not m: continue
            cs_ty = m.group(1).strip()
            aname = m.group(2)
            hsp_ty = cs_type_to_hsp(cs_ty)
            out.append((hsp_ty, aname))
        return out


class ComInterface:
    def __init__(self, name: str, iid: str, base: int,
                 methods: List[ComMethod], summary: str, category: str):
        self.name = name
        self.iid = iid            # canonical "xxxxxxxx-xxxx-..." (lower/upper)
        self.base = base          # starting vtable slot (3 or 7)
        self.methods = methods
        self.summary = summary
        self.category = category  # e.g. "ole", "shell", "dialog"


def split_top_commas(s: str) -> List[str]:
    out, depth, buf = [], 0, []
    for ch in s:
        if ch in "<([":
            depth += 1
        elif ch in ">)]":
            depth -= 1
        if ch == "," and depth == 0:
            out.append("".join(buf)); buf = []
        else:
            buf.append(ch)
    if buf: out.append("".join(buf))
    return out


METHOD_DECL_RE = re.compile(
    r"^\s*(?:\[[^\]]*\]\s*)*(?:unsafe\s+)?(?:new\s+)?([\w\.\*]+)\s+(\w+)\s*\((.*?)\)\s*;",
    re.S,
)


def scan_interfaces(sources: Dict[Path, str]) -> List[ComInterface]:
    ifaces: List[ComInterface] = []
    for path, text in sources.items():
        if "ComImport" not in text:
            continue
        # Categorize by namespace path in the file
        ns_match = re.search(r"namespace\s+([\w\.]+)\s*\{", text)
        category = "misc"
        if ns_match:
            p = ns_match.group(1).lower()
            if "shell" in p: category = "shell"
            elif "ole" in p or "com" in p: category = "ole"
            elif "dialog" in p: category = "dialog"

        # Find the Guid, InterfaceType, and interface declaration
        gm = GUID_RE.search(text)
        if not gm: continue
        iid = gm.group(1)
        it_m = ITYPE_RE.search(text)
        base = 3  # default IUnknown
        if it_m:
            kind = it_m.group(1)
            if "IDispatch" in kind or "Dual" in kind:
                base = 7

        hm = INTERFACE_HEADER_RE.search(text)
        if not hm: continue
        name = hm.group(1)

        # Grab the interface body: everything between `{` and matching `}`
        start = hm.end()  # right after `{`
        depth = 1
        i = start
        while i < len(text) and depth > 0:
            c = text[i]
            if c == "{": depth += 1
            elif c == "}": depth -= 1
            i += 1
        body = text[start:i-1]

        # Extract methods in order, each with preceding doc
        lines = body.splitlines()
        methods: List[ComMethod] = []
        doc_buf: List[str] = []
        slot = base
        j = 0
        while j < len(lines):
            ln = lines[j]
            sl = ln.lstrip()
            if sl.startswith("///"):
                doc_buf.append(sl[3:].lstrip())
                j += 1
                continue
            if sl.startswith("[") or sl == "":
                j += 1
                continue
            # Try to match a method decl, possibly spanning lines
            # Join lines until we see `);`
            chunk_lines = [ln]
            while ";" not in chunk_lines[-1] and j + len(chunk_lines) < len(lines):
                chunk_lines.append(lines[j + len(chunk_lines)])
            chunk = "\n".join(chunk_lines)
            m = METHOD_DECL_RE.match(chunk)
            if m:
                ret = m.group(1)
                mname = m.group(2)
                args = m.group(3)
                doc = parse_doc(doc_buf) if doc_buf else {}
                methods.append(ComMethod(slot, mname, ret, args, doc))
                slot += 1
                doc_buf = []
                j += len(chunk_lines)
                continue
            j += 1
            doc_buf = []

        # Try to grab summary from above the interface header (walk back)
        summary = ""
        lines_all = text.splitlines()
        header_line = text[:hm.start()].count("\n")
        k = header_line - 1
        backbuf: List[str] = []
        while k >= 0:
            sl = lines_all[k].lstrip()
            if sl.startswith("[") or sl.startswith("///"):
                if sl.startswith("///"):
                    backbuf.insert(0, sl[3:].lstrip())
                k -= 1
                continue
            break
        if backbuf:
            doc = parse_doc(backbuf)
            summary = doc.get("summary", "")

        if methods:
            ifaces.append(ComInterface(name, iid, base, methods, summary, category))
            _INTERFACE_NAMES.add(name)

    return ifaces


# ----------------------------------------------------------------------------
# Emitters
# ----------------------------------------------------------------------------

def emit_as(ifaces: List[ComInterface], category: str) -> str:
    L: List[str] = []
    ap = L.append
    ap(";============================================================")
    ap(f";  COM interfaces ({category}) — auto-generated from CsWin32")
    ap(";  allowMarshaling=true sandbox")
    ap(";  tool: tools/cswin32_bridge_com/gen_com_from_cswin32.py")
    ap(";  hsp3net 専用 (#usecom / #comfunc + intptr / comobj)")
    ap(";============================================================")
    ap("")
    ap(f"#ifndef __com_{category}_gen2_as__")
    ap(f"#define __com_{category}_gen2_as__")
    ap("")
    for iface in ifaces:
        ap(f";--- {iface.name}")
        if iface.summary:
            for ln in iface.summary.splitlines()[:3]:
                ap(f"; {ln}")
        ap(f'#define global IID_{iface.name} "{{{iface.iid}}}"')
        ap(f'#usecom {iface.name} IID_{iface.name} "{{}}"')
        for m in iface.methods:
            args = m.hsp_args()
            types_txt = ", ".join(t for (t, _n) in args)
            sig = f"{iface.name}_{m.name}"
            if types_txt:
                ap(f"#comfunc {sig} {m.slot} {types_txt}")
            else:
                ap(f"#comfunc {sig} {m.slot}")
        ap("")
    ap("#endif")
    ap("")
    return "\n".join(L)


def wrap_jp(text: str, width: int = 70) -> str:
    if not text: return ""
    out = []
    for para in text.splitlines():
        if not para.strip():
            out.append(""); continue
        words = para.split()
        line = ""
        for w in words:
            if len(line) + len(w) + 1 > width:
                out.append(line.rstrip()); line = ""
            line += w + " "
        if line.strip():
            out.append(line.rstrip())
    return "\n".join(out)


def emit_hs(ifaces: List[ComInterface], category: str) -> str:
    L: List[str] = []
    ap = L.append
    ap(";============================================================")
    ap(f";  COM ({category}) ヘルプ — CsWin32 / win32metadata から自動抽出")
    ap(";  docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。")
    ap(";============================================================")
    ap("")
    for iface in ifaces:
        for m in iface.methods:
            key_base = f"com::{iface.name}::{m.name}"
            summary = ja(f"{key_base}::summary", m.doc.get("summary", ""))
            ret_doc = ja(f"{key_base}::returns", m.doc.get("returns", ""))
            remarks = ja(f"{key_base}::remarks", m.doc.get("remarks", ""))
            ap("%index")
            ap(f"{iface.name}_{m.name}")
            if summary:
                ap(summary.splitlines()[0])
            else:
                ap(f"{iface.name}::{m.name} (vtable slot {m.slot})")
            ap("%group")
            ap(f"COM {category} / {iface.name}")
            ap("%prm")
            args = m.hsp_args()
            prm_names = ", ".join(["this"] + [a[1] for a in args])
            ap(prm_names)
            ap(f"this : [comobj] {iface.name} インターフェースの COM オブジェクト変数")
            for (hsp_ty, aname) in args:
                doc_ja = ja(f"{key_base}::param::{aname}",
                            m.doc.get(f"param:{aname}", ""))
                first = doc_ja.splitlines()[0] if doc_ja else ""
                ap(f"{aname} : [{hsp_ty}] {first}")
            ap("%inst")
            if summary:
                ap(wrap_jp(summary))
            if ret_doc:
                ap("")
                ap("[戻り値]")
                ap(wrap_jp(ret_doc))
            if remarks:
                ap("")
                ap("[備考]")
                ap(wrap_jp(remarks))
            ap("")
            ap("")
    return "\n".join(L)


def dump_docs_en(ifaces: List[ComInterface]) -> None:
    out: Dict[str, str] = {}
    for iface in ifaces:
        for m in iface.methods:
            key_base = f"com::{iface.name}::{m.name}"
            if m.doc.get("summary"):
                out[f"{key_base}::summary"] = m.doc["summary"]
            if m.doc.get("returns"):
                out[f"{key_base}::returns"] = m.doc["returns"]
            if m.doc.get("remarks"):
                out[f"{key_base}::remarks"] = m.doc["remarks"]
            for key, val in m.doc.items():
                if key.startswith("param:") and val:
                    aname = key.split(":", 1)[1]
                    out[f"{key_base}::param::{aname}"] = val
    DOCS_EN_PATH.parent.mkdir(parents=True, exist_ok=True)
    DOCS_EN_PATH.write_text(
        json.dumps(out, indent=2, ensure_ascii=False), encoding="utf-8")
    print(f"[write] {DOCS_EN_PATH.relative_to(ROOT)} ({len(out)} entries)")


# ----------------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------------

def write_sjis_crlf(path: Path, text: str) -> int:
    b = text.replace("\r\n", "\n").replace("\n", "\r\n").encode(
        "cp932", errors="replace")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(b)
    return len(b)


def main() -> int:
    if not GEN_DIR.exists():
        print(f"[error] generated dir not found: {GEN_DIR}")
        print("        run `dotnet build` in tools/cswin32_bridge_com first")
        return 1

    sources: Dict[Path, str] = {}
    for p in sorted(GEN_DIR.glob("Windows.Win32.I*.g.cs")):
        try:
            sources[p] = p.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            sources[p] = p.read_text(encoding="utf-8-sig")

    print(f"[scan] {len(sources)} I*.g.cs files")

    global _DOCS_JA
    if DOCS_JA_PATH.exists():
        _DOCS_JA = json.loads(DOCS_JA_PATH.read_text(encoding="utf-8"))
        print(f"[load] docs_ja.json: {len(_DOCS_JA)} translations")
    else:
        print(f"[load] docs_ja.json: not found (emit will use English)")

    ifaces = scan_interfaces(sources)
    print(f"[scan] interfaces: {len(ifaces)}")

    dump_docs_en(ifaces)

    # Group by category
    by_cat: Dict[str, List[ComInterface]] = {}
    for iface in ifaces:
        by_cat.setdefault(iface.category, []).append(iface)

    for cat, lst in sorted(by_cat.items()):
        as_text = emit_as(lst, cat)
        hs_text = emit_hs(lst, cat)
        as_path = OUT_AS_DIR / f"com_{cat}_gen2.as"
        hs_path = OUT_HS_DIR / f"win32_com_{cat}_gen2.hs"
        nb1 = write_sjis_crlf(as_path, as_text)
        nb2 = write_sjis_crlf(hs_path, hs_text)
        print(f"[write] {as_path.relative_to(ROOT)} "
              f"({nb1} bytes, {len(lst)} interfaces, "
              f"{sum(len(i.methods) for i in lst)} methods)")
        print(f"[write] {hs_path.relative_to(ROOT)} ({nb2} bytes)")

    return 0


if __name__ == "__main__":
    sys.exit(main())
