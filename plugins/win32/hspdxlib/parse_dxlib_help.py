#!/usr/bin/env python3
"""
Parse DxLib C++ help HTML files and extract function documentation.
Output: JSON dict { "FuncName": { "summary": ..., "params": ..., "returns": ..., "description": ... }, ... }
"""
import re
import os
import sys
import json
from html.parser import HTMLParser


class DxLibHelpParser(HTMLParser):
    """Extract function docs from DxLib help HTML tables."""

    def __init__(self):
        super().__init__()
        self.functions = {}
        self._in_td = False
        self._in_b = False
        self._in_font = False
        self._current_text = []
        self._rows = []  # list of (label, content) for current function
        self._current_label = None
        self._current_content = []
        self._state = None  # 'label' or 'content'
        self._td_count = 0
        self._all_cells = []  # collect all cells in a table row set

    def handle_starttag(self, tag, attrs):
        if tag == 'td':
            self._in_td = True
            self._current_text = []
        if tag == 'b':
            self._in_b = True
        if tag == 'font':
            self._in_font = True
            self._current_text = []
        if tag == 'br' and self._in_td:
            self._current_text.append('\n')
        if tag == 'a':
            pass  # ignore links

    def handle_endtag(self, tag):
        if tag == 'td':
            self._in_td = False
            text = ''.join(self._current_text).strip()
            self._all_cells.append(text)
            self._current_text = []
        if tag == 'b':
            self._in_b = False
        if tag == 'font':
            self._in_font = False
        if tag == 'table':
            self._process_table_cells()

    def handle_data(self, data):
        if self._in_td:
            self._current_text.append(data)

    def _process_table_cells(self):
        """Process collected cells to extract function info."""
        cells = self._all_cells
        self._all_cells = []

        if len(cells) < 4:
            return

        func_info = {}
        func_name = None

        i = 0
        while i < len(cells):
            label = cells[i].strip()
            if i + 1 < len(cells):
                content = cells[i + 1].strip()
            else:
                content = ''

            if label == '宣言':
                # Extract function name from declaration
                # e.g., "int    WaitTimer( int WaitTime ) ;"
                m = re.search(r'(\w+)\s*\(', content)
                if m:
                    func_name = m.group(1)
                func_info['declaration'] = content
            elif label == '概略':
                func_info['summary'] = content.replace('\n', ' ').strip()
            elif label == '引数':
                func_info['params'] = content.strip()
            elif label == '戻り値':
                ret_text = content.strip()
                # Collect continuation cells for return value
                if i + 2 < len(cells) and cells[i + 2].strip() in ('', '　'):
                    ret_text += '\n' + cells[i + 3].strip() if i + 3 < len(cells) else ''
                    i += 2
                func_info['returns'] = ret_text.strip()
            elif label == '解説':
                func_info['description'] = content.replace('\n', '\n').strip()

            i += 2

        if func_name and func_info.get('summary'):
            self.functions[func_name] = func_info


def parse_help_file(filepath):
    """Parse a single DxLib help HTML file."""
    with open(filepath, 'r', encoding='utf-8-sig', errors='replace') as f:
        content = f.read()

    # Use regex-based parsing for more reliable extraction
    functions = {}

    # Pattern: find function blocks between 宣言 markers
    # Split by <a name="...">宣言</a>
    blocks = re.split(r'<a\s+name="[^"]*">\s*宣言\s*</a>', content)

    for block in blocks[1:]:  # skip first (before any 宣言)
        func_info = {}
        func_name = None

        # Extract declaration (in <font color="#000088"><b>...</b></font> or plain text after 宣言)
        decl_m = re.search(r'<font\s+color="#000088"><b>(.*?)</b></font>', block, re.DOTALL)
        if not decl_m:
            # Fallback: declaration is plain text between </td><td> and <br>
            decl_m = re.search(r'</td>\s*<td>(.*?)(?:<br|</td>)', block[:600], re.DOTALL)
        if decl_m:
            decl = re.sub(r'<[^>]+>', '', decl_m.group(1)).strip()
            func_info['declaration'] = decl
            # Extract function name
            name_m = re.search(r'(\w+)\s*\(', decl)
            if name_m:
                func_name = name_m.group(1)

        # Extract 概略 (summary)
        summary_m = re.search(r'<b>概略</b>\s*</td>\s*<td>(.*?)<br>', block, re.DOTALL)
        if summary_m:
            summary = re.sub(r'<[^>]+>', '', summary_m.group(1)).strip()
            func_info['summary'] = summary

        # Extract 引数 (parameters)
        params_m = re.search(r'<b>引数</b>\s*</td>\s*<td>(.*?)</td>', block, re.DOTALL)
        if params_m:
            params_html = params_m.group(1)
            params = re.sub(r'<[^>]+>', '', params_html).strip()
            # Also collect continuation parameter cells
            # Look for additional param lines after the first
            extra_params = re.findall(r'</td>\s*</tr>\s*<tr>\s*<td[^>]*>\s*</td>\s*<td>(.*?)</td>',
                                       block[params_m.end():params_m.end()+2000], re.DOTALL)
            for ep in extra_params:
                ep_text = re.sub(r'<[^>]+>', '', ep).strip()
                if ep_text and not ep_text.startswith('０') and not ep_text.startswith('－') and ':' in ep_text:
                    params += '\n' + ep_text
                else:
                    break
            func_info['params'] = params

        # Extract 戻り値 (return value)
        ret_m = re.search(r'<b>戻り値</b>\s*</td>\s*<td>(.*?)</td>', block, re.DOTALL)
        if ret_m:
            ret = re.sub(r'<[^>]+>', '', ret_m.group(1)).strip()
            func_info['returns'] = ret

        # Extract 解説 (description)
        desc_m = re.search(r'<b>解説</b>\s*</td>\s*<td>(.*?)</td>\s*</tr>', block, re.DOTALL)
        if desc_m:
            desc_html = desc_m.group(1)
            desc = re.sub(r'<br\s*/?>', '\n', desc_html)
            desc = re.sub(r'<a[^>]*>(.*?)</a>', r'\1', desc)
            desc = re.sub(r'<[^>]+>', '', desc)
            desc = re.sub(r'\n{3,}', '\n\n', desc).strip()
            # Clean up leading whitespace characters
            desc = re.sub(r'　', ' ', desc)
            func_info['description'] = desc

        if func_name and (func_info.get('summary') or func_info.get('description')):
            functions[func_name] = func_info

    return functions


def parse_all_help_files(helpdir):
    """Parse all DxLib help HTML files in a directory."""
    all_functions = {}
    for fname in sorted(os.listdir(helpdir)):
        if fname.endswith('.html'):
            filepath = os.path.join(helpdir, fname)
            funcs = parse_help_file(filepath)
            print(f'  {fname}: {len(funcs)} functions')
            all_functions.update(funcs)
    return all_functions


def main():
    if len(sys.argv) < 3:
        print(f'Usage: {sys.argv[0]} <help_dir> <output.json>')
        sys.exit(1)

    helpdir = sys.argv[1]
    output = sys.argv[2]

    # Also parse the main function reference pages
    main_help = os.path.join(os.path.dirname(helpdir), 'dxfunc.html')
    main_help2 = os.path.join(os.path.dirname(helpdir), 'dxfunc2.html')

    print(f'Parsing help files from {helpdir}...')
    all_funcs = parse_all_help_files(helpdir)

    for extra in [main_help, main_help2]:
        if os.path.exists(extra):
            print(f'  {os.path.basename(extra)}...')
            funcs = parse_help_file(extra)
            print(f'    {len(funcs)} functions')
            # Don't overwrite detailed descriptions from function/ files
            for k, v in funcs.items():
                if k not in all_funcs:
                    all_funcs[k] = v

    print(f'\nTotal: {len(all_funcs)} functions documented')

    # Save as JSON
    with open(output, 'w', encoding='utf-8') as f:
        json.dump(all_funcs, f, ensure_ascii=False, indent=2)
    print(f'Saved to {output}')

    # Print some stats
    has_desc = sum(1 for v in all_funcs.values() if v.get('description'))
    has_params = sum(1 for v in all_funcs.values() if v.get('params'))
    print(f'  With description: {has_desc}')
    print(f'  With params: {has_params}')


if __name__ == '__main__':
    main()
