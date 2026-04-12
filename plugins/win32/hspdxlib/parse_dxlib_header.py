#!/usr/bin/env python3
"""
Parse DxLib.h to extract function name + comment descriptions.
Merge with existing dxlib_help.json, filling in missing entries.
"""
import re
import sys
import os
import json


def parse_dxlib_h(filepath):
    """Extract function descriptions from DxLib.h comments."""
    with open(filepath, 'r', encoding='cp932', errors='replace') as f:
        lines = f.readlines()

    functions = {}
    current_section = ''

    for line in lines:
        line = line.rstrip()

        # Track section comments (e.g. "// 図形描画関数")
        section_m = re.match(r'^//\s*(.+関数.*)', line)
        if section_m:
            current_section = section_m.group(1).strip()
            continue

        # Also track section from lines like "// 画像情報関係関数"
        section_m2 = re.match(r'^\s*//\s*(.+関[数係].*)$', line)
        if section_m2:
            current_section = section_m2.group(1).strip()

        # Parse extern function declaration with comment
        # Pattern: extern [return_type] FuncName( params ) ; // comment
        m = re.match(
            r'^\s*extern\s+.*?\s+(\w+)\s*\(([^)]*)\)\s*;'
            r'(?:\s*//\s*(.+))?',
            line
        )
        if m:
            func_name = m.group(1)
            params_raw = m.group(2).strip()
            comment = m.group(3).strip() if m.group(3) else ''

            if comment:
                functions[func_name] = {
                    'header_comment': comment,
                    'section': current_section,
                    'params_raw': params_raw,
                }

        # Also try multi-line patterns where comment is on same line but params span
        # extern int Func( long param line ) ;  // comment
        m2 = re.match(
            r'^\s*extern\s+.*?\s+(\w+)\s*\(.*\)\s*;\s*//\s*(.+)',
            line
        )
        if m2 and m2.group(1) not in functions:
            func_name = m2.group(1)
            comment = m2.group(2).strip()
            functions[func_name] = {
                'header_comment': comment,
                'section': current_section,
                'params_raw': '',
            }

    return functions


def parse_params_from_header(params_raw):
    """Parse C parameter list into structured form."""
    if not params_raw or params_raw.strip() == 'void':
        return ''

    result = []
    # Split by comma, respecting parentheses
    depth = 0
    parts = []
    current = []
    for c in params_raw:
        if c == '(':
            depth += 1
        elif c == ')':
            depth -= 1
        elif c == ',' and depth == 0:
            parts.append(''.join(current).strip())
            current = []
            continue
        current.append(c)
    if current:
        parts.append(''.join(current).strip())

    for p in parts:
        # Remove DEFAULTPARAM(...)
        p = re.sub(r'\s*DEFAULTPARAM\s*\([^)]*\)', '', p)
        p = p.strip()
        if not p:
            continue
        result.append(p)

    return '\n'.join(result)


def main():
    if len(sys.argv) < 3:
        print(f'Usage: {sys.argv[0]} <DxLib.h> <existing.json> [output.json]')
        sys.exit(1)

    header_path = sys.argv[1]
    existing_json = sys.argv[2]
    output_json = sys.argv[3] if len(sys.argv) > 3 else existing_json

    print(f'Parsing {header_path}...')
    header_funcs = parse_dxlib_h(header_path)
    print(f'  Found {len(header_funcs)} functions with comments')

    print(f'Loading {existing_json}...')
    with open(existing_json, 'r', encoding='utf-8') as f:
        existing = json.load(f)
    print(f'  Existing: {len(existing)} functions')

    # Merge: for functions NOT in existing, add from header
    # For functions IN existing but missing description, supplement
    added = 0
    supplemented = 0

    for func_name, hinfo in header_funcs.items():
        comment = hinfo['header_comment']
        section = hinfo['section']

        if func_name not in existing:
            # New function - add from header
            existing[func_name] = {
                'summary': comment,
                'description': comment,
                'params': parse_params_from_header(hinfo['params_raw']),
                'returns': '',
                'source': 'DxLib.h',
                'section': section,
            }
            added += 1
        else:
            # Existing - check if summary is missing or generic
            entry = existing[func_name]
            if not entry.get('summary') or entry['summary'] == f'{func_name} を実行する':
                entry['summary'] = comment
                supplemented += 1
            # Add section info if missing
            if not entry.get('section'):
                entry['section'] = section

    print(f'  Added from header: {added}')
    print(f'  Supplemented: {supplemented}')
    print(f'  Total: {len(existing)}')

    with open(output_json, 'w', encoding='utf-8') as f:
        json.dump(existing, f, ensure_ascii=False, indent=2)
    print(f'Saved to {output_json}')


if __name__ == '__main__':
    main()
