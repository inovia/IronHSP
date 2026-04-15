#!/usr/bin/env python3
# shared.wasm ジェネレータ
#
# WebAssembly バイナリフォーマットを手書きで生成する。wat2wasm や
# clang-wasm を用意しなくても Python だけで動く。
# 出力: shared.wasm (131 byte)

def uleb128(n: int) -> bytes:
    out = bytearray()
    while True:
        b = n & 0x7f
        n >>= 7
        if n:
            out.append(b | 0x80)
        else:
            out.append(b)
            return bytes(out)


def section(sid: int, content: bytes) -> bytes:
    return bytes([sid]) + uleb128(len(content)) + content


def vec(items):
    return uleb128(len(items)) + b"".join(items)


def body(instrs: bytes) -> bytes:
    inner = uleb128(0) + instrs + bytes([0x0b])  # 0 locals + instrs + end
    return uleb128(len(inner)) + inner


def export(name: str, kind: int, idx: int) -> bytes:
    nm = name.encode("utf-8")
    return uleb128(len(nm)) + nm + bytes([kind]) + uleb128(idx)


def main() -> None:
    i32 = 0x7f

    # Type section (1): 2 function signatures
    #   type 0: (i32,i32) -> i32   for add, mul
    #   type 1: (i32)    -> i32    for fib, sum_to
    t0 = bytes([0x60, 2, i32, i32, 1, i32])
    t1 = bytes([0x60, 1, i32, 1, i32])
    type_sec = section(1, vec([t0, t1]))

    # Function section (3): 4 functions with type indices [0, 0, 1, 1]
    func_sec = section(3, vec([uleb128(0), uleb128(0), uleb128(1), uleb128(1)]))

    # Export section (7)
    exports = [
        export("add", 0, 0),
        export("mul", 0, 1),
        export("fib", 0, 2),
        export("sum_to", 0, 3),
    ]
    export_sec = section(7, vec(exports))

    # Code section (10): 4 function bodies
    add_body = body(bytes([0x20, 0, 0x20, 1, 0x6a]))           # get, get, i32.add
    mul_body = body(bytes([0x20, 0, 0x20, 1, 0x6c]))           # get, get, i32.mul

    fib_instrs = bytes([
        0x20, 0,           # local.get 0
        0x41, 2,           # i32.const 2
        0x48,              # i32.lt_s
        0x04, 0x7f,        # if (result i32)
        0x20, 0,           #   local.get 0  -- then branch: return n
        0x05,              # else
        0x20, 0,           #   local.get 0
        0x41, 1,           #   i32.const 1
        0x6b,              #   i32.sub
        0x10, 2,           #   call fib (func idx 2)
        0x20, 0,           #   local.get 0
        0x41, 2,           #   i32.const 2
        0x6b,              #   i32.sub
        0x10, 2,           #   call fib
        0x6a,              #   i32.add
        0x0b,              # end if
    ])
    fib_body = body(fib_instrs)

    sum_instrs = bytes([
        0x20, 0,           # local.get 0
        0x41, 1,           # i32.const 1
        0x48,              # i32.lt_s
        0x04, 0x7f,        # if (result i32)
        0x41, 0,           #   i32.const 0  -- then branch
        0x05,              # else
        0x20, 0,           #   local.get 0
        0x20, 0,           #   local.get 0
        0x41, 1,           #   i32.const 1
        0x6b,              #   i32.sub
        0x10, 3,           #   call sum_to (func idx 3)
        0x6a,              #   i32.add
        0x0b,              # end if
    ])
    sum_body = body(sum_instrs)

    code_sec = section(10, vec([add_body, mul_body, fib_body, sum_body]))

    wasm = (
        b"\x00asm\x01\x00\x00\x00"
        + type_sec
        + func_sec
        + export_sec
        + code_sec
    )

    out_path = "shared.wasm"
    with open(out_path, "wb") as f:
        f.write(wasm)
    print(f"wrote {out_path}: {len(wasm)} bytes")


if __name__ == "__main__":
    main()
