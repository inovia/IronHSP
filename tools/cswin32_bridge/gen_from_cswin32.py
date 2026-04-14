#!/usr/bin/env python3
"""Parse CsWin32-generated C# source files and emit IronHSP .as/.hs pairs.

Reads  : tools/cswin32_bridge/obj/generated/Microsoft.Windows.CsWin32/
         Microsoft.Windows.CsWin32.SourceGenerator/*.g.cs
Writes : package/win32/common/<dll>_gen2.as          (Shift-JIS, CRLF)
         package/hsphelp/win32_<dll>_gen2.hs         (Shift-JIS, CRLF)

Design notes
------------
CsWin32 is the source of truth (it reads win32metadata). The generated
C# is *very* regular: one block per enum / struct / DllImport with XML
doc comments above. We parse with a few small regex scanners rather than
a full C# parser — the format is stable enough that this is practical.

Type mapping (CsWin32 C# type → HSP)
    H* handles (HWND/HMENU/HINSTANCE/HDC/HBRUSH/...)  → intptr
    LPARAM / WPARAM / LRESULT / HRESULT / NTSTATUS    → intptr
    PCWSTR / PWSTR                                    → wstr
    PCSTR / PSTR                                      → str
    BOOL / int / uint / short / ushort / byte         → int
    long / ulong (C# long = 64-bit)                   → int64
    float / double                                    → float / double
    void*                                             → intptr
    struct pointer (MSG* / RECT* / POINT*)            → var
    enum type (WINDOW_STYLE / SHOW_WINDOW_CMD / ...)  → int
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
GEN_DIR = ROOT / "tools" / "cswin32_bridge" / "obj" / "generated" / \
    "Microsoft.Windows.CsWin32" / \
    "Microsoft.Windows.CsWin32.SourceGenerator"
OUT_AS_DIR = ROOT / "package" / "win32" / "common"
OUT_HS_DIR = ROOT / "package" / "hsphelp"
DOCS_EN_PATH = ROOT / "tools" / "cswin32_bridge" / "docs_en.json"
DOCS_JA_PATH = ROOT / "tools" / "cswin32_bridge" / "docs_ja.json"

# Loaded at main() time; dict of key → translated string. Keys use the scheme
#   "func::<entry>::summary"
#   "func::<entry>::param::<name>"
#   "func::<entry>::returns"
#   "func::<entry>::remarks"
#   "struct::<name>::summary"
#   "struct::<name>::field::<fname>"
#   "enum::<name>::member::<mname>"
_DOCS_JA: Dict[str, str] = {}


def ja(key: str, en: str) -> str:
    """Return Japanese translation if available, else the English string."""
    t = _DOCS_JA.get(key)
    return t if t else en

# Types that CsWin32 declares as readonly partial struct { IntPtr Value; } — handles
HANDLE_TYPES = set()
ENUM_TYPES: Dict[str, int] = {}        # name -> backing size (always treat as int)
STRUCT_TYPES: Dict[str, "Struct"] = {}
POINTER_TO_VAR = True  # treat `RECT*` / `MSG*` as HSP `var`

HANDLE_LIKE = {
    "LPARAM", "WPARAM", "LRESULT", "HRESULT", "NTSTATUS",
}
WSTR_LIKE = {"PCWSTR", "PWSTR"}
STR_LIKE = {"PCSTR", "PSTR"}
INT_PRIMS = {"BOOL", "int", "uint", "short", "ushort", "byte", "sbyte", "char",
             "bool", "BOOLEAN", "BYTE", "WORD", "DWORD", "UINT", "INT", "SHORT",
             "USHORT", "CHAR", "UCHAR", "ATOM"}
INT64_PRIMS = {"long", "ulong", "LONG64", "ULONG64", "DWORDLONG", "LARGE_INTEGER",
               "ULARGE_INTEGER", "INT64", "UINT64"}


# ----------------------------------------------------------------------------
# Data classes
# ----------------------------------------------------------------------------

class Struct:
    def __init__(self, name: str, fields: List[Tuple[str, str, str]],
                 summary: str = ""):
        # fields: list of (hsp_type, name, doc)
        self.name = name
        self.fields = fields
        self.summary = summary


class Func:
    def __init__(self, dll: str, entry: str, ret_hsp: str,
                 args: List[Tuple[str, str, str]],  # (hsp_type, name, doc)
                 summary: str, ret_doc: str, remarks: str,
                 raw_cs_sig: str):
        self.dll = dll
        self.entry = entry
        self.ret_hsp = ret_hsp
        self.args = args
        self.summary = summary
        self.ret_doc = ret_doc
        self.remarks = remarks
        self.raw_cs_sig = raw_cs_sig


# ----------------------------------------------------------------------------
# Doc comment parsing — pull text out of <summary>...</summary> etc.
# ----------------------------------------------------------------------------

XML_TAG = re.compile(r"<[^>]+>")
PARA_OPEN = re.compile(r"<para[^>]*>", re.I)
PARA_CLOSE = re.compile(r"</para>", re.I)


def strip_xml(text: str) -> str:
    """Remove all XML tags and unescape entities. Collapse whitespace."""
    t = PARA_CLOSE.sub("\n", text)
    t = PARA_OPEN.sub("", t)
    t = XML_TAG.sub("", t)
    t = unescape(t)
    lines = [ln.strip() for ln in t.splitlines()]
    lines = [ln for ln in lines if ln]
    # Drop the boilerplate "Read more on docs.microsoft.com" line
    lines = [ln for ln in lines if "Read more on docs.microsoft.com" not in ln
             and "Learn more about this API" not in ln]
    return "\n".join(lines).strip()


def collect_doc_block(lines: List[str], i: int) -> Tuple[Dict[str, str], int]:
    """Starting at lines[i], walk upward-gathered /// XML comments.
    Actually we collect DOWNWARD: given that lines[i] starts with ///, read
    consecutive /// lines and parse their XML into a dict with keys:
    'summary', 'remarks', 'returns', and per-param keyed 'param:<name>'.
    Returns (doc_dict, next_index_after_block).
    """
    buf: List[str] = []
    j = i
    while j < len(lines) and lines[j].lstrip().startswith("///"):
        buf.append(lines[j].lstrip()[3:].lstrip())
        j += 1
    blob = "\n".join(buf)
    doc: Dict[str, str] = {}
    # <summary> ... </summary>
    m = re.search(r"<summary>(.*?)</summary>", blob, re.S | re.I)
    if m:
        doc["summary"] = strip_xml(m.group(1))
    m = re.search(r"<returns>(.*?)</returns>", blob, re.S | re.I)
    if m:
        doc["returns"] = strip_xml(m.group(1))
    m = re.search(r"<remarks>(.*?)</remarks>", blob, re.S | re.I)
    if m:
        doc["remarks"] = strip_xml(m.group(1))
    for pm in re.finditer(
        r'<param\s+name="([^"]+)"[^>]*>(.*?)</param>', blob, re.S | re.I
    ):
        doc[f"param:{pm.group(1)}"] = strip_xml(pm.group(2))
    return doc, j


# ----------------------------------------------------------------------------
# Type mapping
# ----------------------------------------------------------------------------

TYPE_CLEAN = re.compile(r"winmdroot\.[A-Za-z0-9_.]*\.")
ATTR_PREFIX = re.compile(r"^\s*\[[^\]]*\]\s*")


def short_type(cs: str) -> str:
    """Strip winmdroot.Foundation. prefix etc. to get the short name."""
    cs = cs.strip()
    cs = ATTR_PREFIX.sub("", cs)
    cs = TYPE_CLEAN.sub("", cs)
    cs = re.sub(r"\s+", " ", cs).strip()
    return cs


def cs_type_to_hsp(cs: str) -> str:
    """Map one C# parameter type (as it appears in the DllImport signature)
    to an HSP parameter type."""
    t = short_type(cs)

    # Strip trailing [Optional] attribute markers
    t = re.sub(r"\s*\[Optional\]\s*", "", t)

    # Pointer cases
    if t.endswith("*"):
        inner = t[:-1].strip()
        if inner in ("char",):           # char* → wstr? In CsWin32 chars come as PCWSTR
            return "intptr"
        if inner in ("void",):
            return "intptr"
        # struct pointer
        if inner in STRUCT_TYPES or inner in HANDLE_TYPES:
            return "var" if inner in STRUCT_TYPES else "intptr"
        # Unknown struct pointer → var (safest for OUT params; caller passes NSTRUCT)
        return "var"

    if t in HANDLE_TYPES or t in HANDLE_LIKE:
        return "intptr"
    if t in WSTR_LIKE:
        return "wstr"
    if t in STR_LIKE:
        return "str"
    if t in ENUM_TYPES:
        return "int"
    if t in STRUCT_TYPES:
        # By-value struct: rare in user32 APIs; treat as var (caller passes addr)
        return "var"
    if t in INT_PRIMS:
        return "int"
    if t in INT64_PRIMS:
        return "int64"
    if t in ("float",):
        return "float"
    if t in ("double",):
        return "double"
    # Fallback
    return "int"


def cs_ret_to_hsp(cs: str) -> str:
    """Return type mapping for #cfunc. Same as arg mapping but note that
    struct-by-value returns aren't really representable in HSP — we coerce."""
    t = short_type(cs)
    if t in ("void",):
        return ""   # #func (statement) rather than #cfunc
    return cs_type_to_hsp(cs)


# ----------------------------------------------------------------------------
# Scanners
# ----------------------------------------------------------------------------

HANDLE_RE = re.compile(
    r"public\s+readonly\s+partial\s+struct\s+(\w+)\b"
    r"[^{]*?\{[^}]*?readonly\s+(?:IntPtr|nint)\s+Value",
    re.S,
)

ENUM_RE = re.compile(
    r"public\s+enum\s+(\w+)(?:\s*:\s*\w+)?\s*\{([^}]*)\}",
    re.S,
)

STRUCT_RE = re.compile(
    r"public\s+partial\s+struct\s+(\w+)\s*\{(.*?)\n\s*\}\s*\n",
    re.S,
)

STRUCT_FIELD_RE = re.compile(
    r"public\s+([\w\.<>\*\s]+?)\s+(\w+)\s*;",
)


def scan_handles(sources: Dict[Path, str]) -> None:
    for path, text in sources.items():
        for m in HANDLE_RE.finditer(text):
            HANDLE_TYPES.add(m.group(1))


def scan_enums(sources: Dict[Path, str]) -> Dict[str, List[Tuple[str, int, str]]]:
    """Returns dict: enum_name → list of (member_name, value, doc)."""
    result: Dict[str, List[Tuple[str, int, str]]] = {}
    for path, text in sources.items():
        for m in ENUM_RE.finditer(text):
            name = m.group(1)
            body = m.group(2)
            members: List[Tuple[str, int, str]] = []
            prev_val = -1
            for line in body.splitlines():
                s = line.strip().rstrip(",").strip()
                if not s or s.startswith("//") or s.startswith("/*"):
                    continue
                mm = re.match(r"(\w+)\s*=\s*([^,]+)$", s)
                if mm:
                    vname = mm.group(1)
                    vraw = mm.group(2).strip()
                    try:
                        if vraw.lower().startswith("0x"):
                            val = int(vraw, 16)
                        elif vraw.lower().endswith("u"):
                            val = int(vraw[:-1])
                        elif vraw.lower().endswith("l"):
                            val = int(vraw[:-1])
                        else:
                            val = int(vraw)
                    except ValueError:
                        val = prev_val + 1
                    members.append((vname, val, ""))
                    prev_val = val
                else:
                    mm2 = re.match(r"(\w+)$", s)
                    if mm2:
                        members.append((mm2.group(1), prev_val + 1, ""))
                        prev_val += 1
            ENUM_TYPES[name] = 0
            result[name] = members
    return result


def scan_structs(sources: Dict[Path, str]) -> None:
    for path, text in sources.items():
        # Look line-by-line so we can capture the leading doc comments.
        lines = text.splitlines()
        for i, ln in enumerate(lines):
            m = re.match(r"\s*public\s+partial\s+struct\s+(\w+)\s*$", ln)
            if not m:
                m = re.match(r"\s*public\s+partial\s+struct\s+(\w+)\s*\{", ln)
            if m:
                name = m.group(1)
                # Gather doc above (walk backwards)
                summary = ""
                k = i - 1
                doc_lines: List[str] = []
                while k >= 0 and lines[k].lstrip().startswith("///"):
                    doc_lines.insert(0, lines[k].lstrip()[3:].lstrip())
                    k -= 1
                if doc_lines:
                    blob = "\n".join(doc_lines)
                    sm = re.search(r"<summary>(.*?)</summary>", blob, re.S | re.I)
                    if sm:
                        summary = strip_xml(sm.group(1))
                # Collect body until the matching close brace
                depth = 0
                started = False
                body_lines: List[str] = []
                j = i
                while j < len(lines):
                    for ch in lines[j]:
                        if ch == "{":
                            depth += 1
                            started = True
                        elif ch == "}":
                            depth -= 1
                    if started:
                        body_lines.append(lines[j])
                    j += 1
                    if started and depth == 0:
                        break
                body = "\n".join(body_lines)
                # Extract fields along with per-field doc comment
                fields: List[Tuple[str, str, str]] = []
                flines = body.splitlines()
                pending_doc: List[str] = []
                for fl in flines:
                    sl = fl.strip()
                    if sl.startswith("///"):
                        pending_doc.append(sl[3:].lstrip())
                        continue
                    fm = re.match(
                        r"public\s+([\w\.\*<>\s]+?)\s+(\w+)\s*;", sl
                    )
                    if fm:
                        cs_ty = fm.group(1)
                        fname = fm.group(2)
                        doc = ""
                        if pending_doc:
                            blob = "\n".join(pending_doc)
                            sm2 = re.search(
                                r"<summary>(.*?)</summary>", blob, re.S | re.I
                            )
                            if sm2:
                                doc = strip_xml(sm2.group(1))
                        pending_doc = []
                        hsp_ty = cs_type_to_hsp(cs_ty)
                        fields.append((hsp_ty, fname, doc))
                    else:
                        if sl and not sl.startswith("//"):
                            pending_doc = []
                if fields:
                    STRUCT_TYPES[name] = Struct(name, fields, summary)


# DllImport scanner — trickier because we need the C# function's doc,
# which is on the *outer wrapper method* (public static ... FuncName(...)),
# and the canonical signature, which is on the *inner* LocalExternFunction
# with [DllImport("...", EntryPoint = "...")].

DLLIMPORT_RE = re.compile(
    r'\[DllImport\("([^"]+)"[^\]]*EntryPoint\s*=\s*"([^"]+)"[^\]]*\)\]'
)
# DllImport without explicit EntryPoint (CsWin32 uses this when the managed
# name matches the export name, e.g. advapi32 RegCloseKey). The EntryPoint
# then defaults to the method name, so we resolve it at the call site.
DLLIMPORT_NOENTRY_RE = re.compile(
    r'\[DllImport\("([^"]+)"[^\]]*\)\]'
)
# "public static [unsafe] extern RET NAME(ARGS);"
# Direct extern form (no wrapper body). The DllImport attribute is immediately
# above this line. We match the whole statement up to the trailing `;`.
DIRECT_EXTERN_RE = re.compile(
    r'^\s*public\s+static\s+(?:unsafe\s+)?extern\s+(?:unsafe\s+)?([\w\.\*]+)\s+(\w+)\s*\((.*?)\)\s*;',
    re.S,
)

# Anchor the outer wrapper by its position; we then look backwards for doc
# lines and forward for the matching inner DllImport.


def _build_func(dll: str, entry: str, ret_raw: str, args_raw: str,
                doc_lines: List[str]) -> "Func":
    """Build a Func object from a parsed extern signature + doc lines."""
    arg_list: List[Tuple[str, str, str]] = []
    parts = split_top_commas(args_raw)
    for p in parts:
        p = p.strip()
        if not p:
            continue
        p = re.sub(r"\[[^\]]*\]\s*", "", p)
        am = re.match(r"^(.*?)(\b\w+)\s*$", p, re.S)
        if not am:
            continue
        cs_ty = am.group(1).strip()
        aname = am.group(2)
        hsp_ty = cs_type_to_hsp(cs_ty)
        arg_list.append((hsp_ty, aname, ""))

    blob = "\n".join(doc_lines)
    summary = ""
    returns_doc = ""
    remarks = ""
    param_docs: Dict[str, str] = {}
    sm = re.search(r"<summary>(.*?)</summary>", blob, re.S | re.I)
    if sm:
        summary = strip_xml(sm.group(1))
    rm = re.search(r"<returns>(.*?)</returns>", blob, re.S | re.I)
    if rm:
        returns_doc = strip_xml(rm.group(1))
    rem = re.search(r"<remarks>(.*?)</remarks>", blob, re.S | re.I)
    if rem:
        remarks = strip_xml(rem.group(1))
    for pm in re.finditer(
        r'<param\s+name="([^"]+)"[^>]*>(.*?)</param>', blob, re.S | re.I
    ):
        param_docs[pm.group(1)] = strip_xml(pm.group(2))

    arg_list = [(t, a, param_docs.get(a, "")) for (t, a, _d) in arg_list]
    ret_hsp = cs_ret_to_hsp(ret_raw)
    func_sig_raw = f"{ret_raw} {entry}({args_raw.strip()})"
    return Func(
        dll=dll, entry=entry, ret_hsp=ret_hsp, args=arg_list,
        summary=summary, ret_doc=returns_doc, remarks=remarks,
        raw_cs_sig=func_sig_raw,
    )


def scan_functions(sources: Dict[Path, str]) -> List[Func]:
    out: List[Func] = []
    seen_entries: set = set()
    for path, text in sources.items():
        if ".PInvoke." not in path.name or ".dll.g.cs" not in path.name:
            continue
        lines = text.splitlines()
        i = 0
        n = len(lines)
        while i < n:
            ln = lines[i]

            # Case B: direct "public static extern RET NAME(...);" form,
            # used when the managed name matches the export name (no wrapper
            # body, no LocalExternFunction). The [DllImport] sits in the
            # attribute block above.
            mb = re.match(
                r"\s*public\s+static\s+(?:unsafe\s+)?extern\s+(?:unsafe\s+)?([\w\.\*]+)\s+(\w+)\s*\(",
                ln,
            )
            if mb:
                # Collect the full statement until the terminating `;`
                stmt_lines: List[str] = []
                j2 = i
                while j2 < n:
                    stmt_lines.append(lines[j2])
                    if ";" in lines[j2]:
                        j2 += 1
                        break
                    j2 += 1
                stmt = "\n".join(stmt_lines)
                sm = DIRECT_EXTERN_RE.match(stmt)
                if sm:
                    ret_raw = sm.group(1)
                    fname = sm.group(2)
                    args_raw = sm.group(3)
                    # Walk back for doc + attributes, grab DllImport attribute.
                    k = i - 1
                    doc_lines: List[str] = []
                    dll = None
                    entry = None
                    while k >= 0:
                        ls = lines[k].lstrip()
                        if ls.startswith("///"):
                            doc_lines.insert(0, ls[3:].lstrip())
                            k -= 1
                            continue
                        if ls.startswith("["):
                            # Try to parse DllImport from this attribute line
                            dm_e = DLLIMPORT_RE.search(ls)
                            if dm_e:
                                dll = dm_e.group(1)
                                entry = dm_e.group(2)
                            else:
                                dm_ne = DLLIMPORT_NOENTRY_RE.search(ls)
                                if dm_ne:
                                    dll = dm_ne.group(1)
                                    entry = fname
                            k -= 1
                            continue
                        break
                    if dll is None:
                        i = j2
                        continue
                    if entry in seen_entries:
                        i = j2
                        continue
                    seen_entries.add(entry)
                    out.append(_build_func(
                        dll, entry, ret_raw, args_raw, doc_lines,
                    ))
                    i = j2
                    continue

            # Case A: wrapper form — "public static ... NAME(...)" with a body
            # containing a LocalExternFunction extern.
            m = re.match(
                r"\s*public\s+static\s+(unsafe\s+)?([\w\.\*]+)\s+(\w+)\s*\(",
                ln,
            )
            if not m:
                i += 1
                continue
            # Skip if this is actually "public static extern" — already handled
            if re.match(r"\s*public\s+static\s+(?:unsafe\s+)?extern\s+(?:unsafe\s+)?", ln):
                i += 1
                continue
            ret_cs = m.group(2)
            fname = m.group(3)
            # Skip the C# string/fixed overload — we want the PCWSTR overload,
            # which is easily identified by the inner [DllImport] having the
            # same EntryPoint. We'll capture info from whichever wrapper has
            # an inner DllImport within the same block.

            # Walk back to gather doc comments
            k = i - 1
            doc_lines: List[str] = []
            while k >= 0 and (lines[k].lstrip().startswith("///") or
                              lines[k].lstrip().startswith("[")):
                if lines[k].lstrip().startswith("///"):
                    doc_lines.insert(0, lines[k].lstrip()[3:].lstrip())
                k -= 1

            # Gather the full wrapper block (brace-balanced)
            depth = 0
            started = False
            j = i
            block: List[str] = []
            while j < n:
                line = lines[j]
                for ch in line:
                    if ch == "{":
                        depth += 1
                        started = True
                    elif ch == "}":
                        depth -= 1
                block.append(line)
                j += 1
                if started and depth == 0:
                    break
            body = "\n".join(block)

            dm = DLLIMPORT_RE.search(body)
            if not dm:
                # Probably the string-overload wrapper (no DllImport inside),
                # skip and advance by 1 so we find the PCWSTR sibling next.
                i += 1
                continue
            dll = dm.group(1)
            entry = dm.group(2)

            # The inner extern is on the line after the DllImport attribute.
            dm_start = body.find(dm.group(0))
            after = body[dm_start + len(dm.group(0)):]
            # find 'static extern ... (...)'
            sig_m = re.search(
                r"static\s+extern\s+(unsafe\s+)?([\w\.\*]+)\s+LocalExternFunction\s*\((.*?)\)\s*;",
                after, re.S,
            )
            if not sig_m:
                i = j
                continue
            ret_raw = sig_m.group(2)
            args_raw = sig_m.group(3)

            # Parse args: split at top level commas
            arg_list: List[Tuple[str, str, str]] = []
            parts = split_top_commas(args_raw)
            for p in parts:
                p = p.strip()
                if not p:
                    continue
                # drop attributes like [Optional], [In], [Out]
                p = re.sub(r"\[[^\]]*\]\s*", "", p)
                # split "TYPE NAME"
                am = re.match(r"^(.*?)(\b\w+)\s*$", p)
                if not am:
                    continue
                cs_ty = am.group(1).strip()
                aname = am.group(2)
                hsp_ty = cs_type_to_hsp(cs_ty)
                arg_list.append((hsp_ty, aname, ""))

            # Parse doc
            blob = "\n".join(doc_lines)
            summary = ""
            returns_doc = ""
            remarks = ""
            param_docs: Dict[str, str] = {}
            sm = re.search(r"<summary>(.*?)</summary>", blob, re.S | re.I)
            if sm:
                summary = strip_xml(sm.group(1))
            rm = re.search(r"<returns>(.*?)</returns>", blob, re.S | re.I)
            if rm:
                returns_doc = strip_xml(rm.group(1))
            rem = re.search(r"<remarks>(.*?)</remarks>", blob, re.S | re.I)
            if rem:
                remarks = strip_xml(rem.group(1))
            for pm in re.finditer(
                r'<param\s+name="([^"]+)"[^>]*>(.*?)</param>', blob, re.S | re.I
            ):
                param_docs[pm.group(1)] = strip_xml(pm.group(2))

            # Attach doc to args
            arg_list = [(t, a, param_docs.get(a, "")) for (t, a, _d) in arg_list]

            ret_hsp = cs_ret_to_hsp(ret_raw)

            if entry in seen_entries:
                i = j
                continue
            seen_entries.add(entry)

            func_sig_raw = f"{ret_raw} {fname}({args_raw})"
            out.append(Func(
                dll=dll, entry=entry, ret_hsp=ret_hsp, args=arg_list,
                summary=summary, ret_doc=returns_doc, remarks=remarks,
                raw_cs_sig=func_sig_raw,
            ))

            i = j
    return out


def split_top_commas(s: str) -> List[str]:
    out, depth, buf = [], 0, []
    for ch in s:
        if ch in "<([":
            depth += 1
        elif ch in ">)]":
            depth -= 1
        if ch == "," and depth == 0:
            out.append("".join(buf))
            buf = []
        else:
            buf.append(ch)
    if buf:
        out.append("".join(buf))
    return out


# ----------------------------------------------------------------------------
# Emitters
# ----------------------------------------------------------------------------

def emit_types(structs: List[Struct],
               enums: Dict[str, List[Tuple[str, int, str]]]) -> str:
    """Emit the shared types file (structs + enums) referenced by all DLL .as
    files. This avoids duplicating ~200KB of struct/enum definitions in every
    individual DLL .as.
    """
    L: List[str] = []
    ap = L.append
    ap("; ============================================================")
    ap(";   Auto-generated from CsWin32 / win32metadata")
    ap(";   shared types: NSTRUCT / enum constants")
    ap(";   tool: tools/cswin32_bridge/gen_from_cswin32.py")
    ap(";")
    ap(";   This file is included automatically by every <dll>_gen2.as.")
    ap(";   Do not edit by hand — regenerate via the python script.")
    ap("; ============================================================")
    ap("")
    ap("#ifndef __win32_types_gen2_as__")
    ap("#define __win32_types_gen2_as__")
    ap("")
    if structs:
        ap(";--- structs ---")
        for st in structs:
            ap(f"#defstruct {st.name}")
            for (hsp_ty, fname, _doc) in st.fields:
                ap(f"    #field {hsp_ty} {fname}")
            ap("#endstruct")
            ap("")
    if enums:
        ap(";--- enums / constants ---")
        for ename, members in enums.items():
            ap(f"; {ename}")
            for (mname, val, _doc) in members:
                if val >= 0:
                    ap(f"#define {mname}  {hex(val)}")
                else:
                    ap(f"#define {mname}  {val}")
            ap("")
    ap("#endif")
    ap("")
    return "\n".join(L)


def emit_as(dll_short: str, funcs: List[Func]) -> str:
    """Per-DLL .as containing only function declarations. Shared structs and
    enum constants live in win32_types_gen2.as which we #include at the top.
    """
    L: List[str] = []
    ap = L.append
    ap("; ============================================================")
    ap(f";   Auto-generated from CsWin32 / win32metadata")
    ap(f";   dll:    {dll_short}.dll")
    ap(f";   tool:   tools/cswin32_bridge/gen_from_cswin32.py")
    ap(";   Do not edit by hand — regenerate via the python script.")
    ap(";   Needs hsp3net (intptr / NSTRUCT / wstr).")
    ap("; ============================================================")
    ap("")
    ap(f"#ifndef __{dll_short}_gen2_as__")
    ap(f"#define __{dll_short}_gen2_as__")
    ap("")
    ap("; Shared NSTRUCT + #define constants for all win32 *_gen2.as")
    ap('#include "win32_types_gen2.as"')
    ap("")
    if funcs:
        ap(";--- functions ---")
        ap(f'#uselib "{dll_short}.dll"')
        for fn in funcs:
            ap(f"; {fn.raw_cs_sig}")
            args_txt = ", ".join(t for (t, _n, _d) in fn.args)
            if fn.ret_hsp and fn.ret_hsp != "":
                if args_txt:
                    ap(f'#cfunc {fn.entry} "{fn.entry}" {args_txt}')
                else:
                    ap(f'#cfunc {fn.entry} "{fn.entry}"')
            else:
                if args_txt:
                    ap(f'#func {fn.entry} "{fn.entry}" {args_txt}')
                else:
                    ap(f'#func {fn.entry} "{fn.entry}"')
            ap("")
    ap("#endif")
    ap("")
    return "\n".join(L)


def wrap_jp(text: str, width: int = 70) -> str:
    """Naively wrap long English docs for .hs readability."""
    if not text:
        return ""
    out = []
    for para in text.splitlines():
        if not para.strip():
            out.append("")
            continue
        words = para.split()
        line = ""
        for w in words:
            if len(line) + len(w) + 1 > width:
                out.append(line.rstrip())
                line = ""
            line += w + " "
        if line.strip():
            out.append(line.rstrip())
    return "\n".join(out)


def emit_hs(dll_short: str, funcs: List[Func]) -> str:
    L: List[str] = []
    ap = L.append
    ap("; ============================================================")
    ap(f";   {dll_short}.dll ヘルプ (CsWin32 / win32metadata から自動抽出)")
    ap(";   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。")
    ap(";   翻訳を追加するときは docs_ja.json を編集して再生成。")
    ap("; ============================================================")
    ap("")
    for fn in funcs:
        ekey = f"func::{fn.entry}"
        summary = ja(f"{ekey}::summary", fn.summary)
        ret_doc = ja(f"{ekey}::returns", fn.ret_doc)
        remarks = ja(f"{ekey}::remarks", fn.remarks)
        ap("%index")
        ap(fn.entry)
        ap(summary.splitlines()[0] if summary else "(no summary)")
        ap("%group")
        ap(f"Win32 {dll_short}")
        ap("%prm")
        prm_names = ", ".join(a[1] for a in fn.args) if fn.args else ""
        ap(prm_names)
        for (hsp_ty, aname, doc) in fn.args:
            doc_ja = ja(f"{ekey}::param::{aname}", doc)
            first = (doc_ja.splitlines()[0] if doc_ja else "").strip()
            ap(f"{aname} : [{hsp_ty}] {first}")
        ap("%inst")
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


def dump_docs_en(funcs: List[Func]) -> None:
    """Write intermediate docs_en.json so the translator can work offline.
    Only writes keys that have non-empty English text.
    """
    out: Dict[str, str] = {}
    for fn in funcs:
        ekey = f"func::{fn.entry}"
        if fn.summary:
            out[f"{ekey}::summary"] = fn.summary
        if fn.ret_doc:
            out[f"{ekey}::returns"] = fn.ret_doc
        if fn.remarks:
            out[f"{ekey}::remarks"] = fn.remarks
        for (_ty, aname, doc) in fn.args:
            if doc:
                out[f"{ekey}::param::{aname}"] = doc
    for st in STRUCT_TYPES.values():
        skey = f"struct::{st.name}"
        if st.summary:
            out[f"{skey}::summary"] = st.summary
        for (_ty, fname, doc) in st.fields:
            if doc:
                out[f"{skey}::field::{fname}"] = doc
    DOCS_EN_PATH.parent.mkdir(parents=True, exist_ok=True)
    DOCS_EN_PATH.write_text(
        json.dumps(out, indent=2, ensure_ascii=False), encoding="utf-8"
    )
    print(f"[write] {DOCS_EN_PATH.relative_to(ROOT)} ({len(out)} entries)")


# ----------------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------------

def write_sjis_crlf(path: Path, text: str) -> int:
    b = text.replace("\r\n", "\n").replace("\n", "\r\n").encode("cp932", errors="replace")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(b)
    return len(b)


def main() -> int:
    if not GEN_DIR.exists():
        print(f"[error] generated dir not found: {GEN_DIR}")
        print("        run `dotnet build` in tools/cswin32_bridge first")
        return 1

    sources: Dict[Path, str] = {}
    for p in sorted(GEN_DIR.glob("*.g.cs")):
        try:
            sources[p] = p.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            sources[p] = p.read_text(encoding="utf-8-sig")

    print(f"[scan] {len(sources)} generated C# files")

    scan_handles(sources)
    print(f"[scan] handles: {len(HANDLE_TYPES)} ({', '.join(sorted(HANDLE_TYPES))})")

    enum_data = scan_enums(sources)
    print(f"[scan] enums:   {len(enum_data)}")

    scan_structs(sources)
    print(f"[scan] structs: {len(STRUCT_TYPES)}")

    funcs = scan_functions(sources)
    print(f"[scan] funcs:   {len(funcs)}")

    # Load translation cache if present
    global _DOCS_JA
    if DOCS_JA_PATH.exists():
        _DOCS_JA = json.loads(DOCS_JA_PATH.read_text(encoding="utf-8"))
        print(f"[load] docs_ja.json: {len(_DOCS_JA)} translations")
    else:
        print(f"[load] docs_ja.json: not found (emit will use English)")

    # Dump English docs for the translator to consume
    dump_docs_en(funcs)

    # Emit the shared types file (structs + enums) once. Every DLL .as will
    # `#include "win32_types_gen2.as"` to access these.
    types_text = emit_types(list(STRUCT_TYPES.values()), enum_data)
    types_path = OUT_AS_DIR / "win32_types_gen2.as"
    nb_types = write_sjis_crlf(types_path, types_text)
    print(f"[write] {types_path.relative_to(ROOT)} ({nb_types} bytes, "
          f"{len(STRUCT_TYPES)} structs + {len(enum_data)} enums) [shared]")

    # Group by dll
    by_dll: Dict[str, List[Func]] = {}
    for fn in funcs:
        key = fn.dll.split(".")[0].lower()
        by_dll.setdefault(key, []).append(fn)

    for dll, fs in sorted(by_dll.items()):
        as_text = emit_as(dll, fs)
        hs_text = emit_hs(dll, fs)
        as_path = OUT_AS_DIR / f"{dll}_gen2.as"
        hs_path = OUT_HS_DIR / f"win32_{dll}_gen2.hs"
        nb1 = write_sjis_crlf(as_path, as_text)
        nb2 = write_sjis_crlf(hs_path, hs_text)
        print(f"[write] {as_path.relative_to(ROOT)} ({nb1} bytes, {len(fs)} funcs)")
        print(f"[write] {hs_path.relative_to(ROOT)} ({nb2} bytes)")

    return 0


if __name__ == "__main__":
    sys.exit(main())
