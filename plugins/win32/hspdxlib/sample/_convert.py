#!/usr/bin/env python3
"""Convert DrawFormatString (variadic, not supported by HSP #func) to
DrawString + strf().

Pattern:
    DrawFormatString X, Y, COLOR, "fmt", arg1, arg2, ...
becomes:
    DrawString X, Y, strf("fmt", arg1, arg2, ...), COLOR
"""
import re
from pathlib import Path

HERE = Path(__file__).parent

# Match the call. The format string is "..." with optional escaped quotes inside.
PAT = re.compile(
    r'^(\s*)DrawFormatString\s+([^,]+),\s*([^,]+),\s*([^,]+),\s*("[^"]*")(.*)$',
    re.M,
)


def replace(m: re.Match) -> str:
    indent, x, y, color, fmt, rest = m.groups()
    rest = rest.rstrip()
    comment = ''
    code = rest
    if ';' in rest:
        i = rest.index(';')
        code = rest[:i].rstrip()
        comment = '  ' + rest[i:]
    code = code.lstrip()
    if code.startswith(','):
        return f'{indent}DrawString {x.strip()}, {y.strip()}, strf({fmt}{code}), {color.strip()}{comment}'
    return f'{indent}DrawString {x.strip()}, {y.strip()}, {fmt}, {color.strip()}{comment}'


def main():
    total = 0
    for f in sorted(HERE.glob('*.hsp')):
        try:
            text = f.read_text(encoding='cp932', errors='replace')
        except Exception:
            continue
        new_text, n = PAT.subn(replace, text)
        if n:
            f.write_bytes(
                new_text.replace('\r\n', '\n').replace('\n', '\r\n').encode('cp932', errors='replace')
            )
            total += n
            print(f'{f.name}: {n} replacements')
    print(f'total: {total}')


if __name__ == '__main__':
    main()
