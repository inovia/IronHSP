//
//  HSPRuntime.swift — minimal HSP3 .ax interpreter (Phase 2)
//
//  目的:
//    watchOS 上で .ax (HSP3 bytecode) を解釈し、簡易な 2D 描画を行う。
//    DxLib / hsp3dx 本体ランタイムは Watch では使えないため、
//    別実装の専用ランタイムとして最小限の機能を Swift で再実装する。
//
//  Phase 2 範囲:
//    - HSPHED 解析、code segment / data segment 取り出し
//    - ICODE 16bit + 可変長 val (EXFLG_3 で 32bit) 復号
//    - 値スタック (Int / Double / String) と単純変数表
//    - 計算: + - * / %, == != < <= > >=
//    - 制御: goto, end, stop, wait
//    - 描画 (DrawList 構築): cls, color, boxf, mes, pos
//
//  非対応 (Phase 3+):
//    - if / repeat / loop / gosub / return
//    - 配列 / 構造体 / モジュール
//    - 拡張プラグイン
//

import Foundation

// MARK: - HSP3 ヘッダ / 型定数

enum HSPType: Int {
    case mark      = 0
    case variable  = 1
    case string    = 2
    case dnum      = 3
    case inum      = 4
    case stRuct    = 5
    case xlabel    = 6
    case label     = 7
    case intcmd    = 8
    case extcmd    = 9
    case extsysvar = 10
    case cmpcmd    = 11
    case modcmd    = 12
    case intfunc   = 13
    case sysvar    = 14
    case progcmd   = 15
    case dllfunc   = 16
    case dllctrl   = 17
    case userdef   = 18
    case inum64    = 19
    case wstr      = 20
    case plugin    = 100
}

private let CSTYPE_MASK: UInt16  = 0x0fff
private let EXFLG_0:    UInt16   = 0x1000   // 引数式の終端 (push argument)
private let EXFLG_1:    UInt16   = 0x2000   // 新しい文の開始
private let EXFLG_2:    UInt16   = 0x4000
private let EXFLG_3:    UInt16   = 0x8000   // 32bit val 拡張

// MARK: - .ax ヘッダ (HSPHED, 32bit int フィールド主体)

struct HSPHeader {
    var magic: String        // "HSP3"
    var version: Int32
    var maxVal: Int32
    var allSize: Int32
    var ptCS: Int32; var maxCS: Int32       // Code Segment
    var ptDS: Int32; var maxDS: Int32       // Data Segment
    var ptOT: Int32; var maxOT: Int32       // Object Temp (label table)
    var ptDInfo: Int32; var maxDInfo: Int32 // Debug Info
    // 以降の linfo/finfo/minfo/finfo2/hpidat 等は Watch 版では未使用
}

// MARK: - HSP 値型

enum HSPValue {
    case int(Int32)
    case int64(Int64)
    case double(Double)
    case string(String)
    case label(Int32)   // CS オフセット
    case mark(Int32)    // 演算子マーク (CALCCODE_*)

    var asInt: Int32 {
        switch self {
        case .int(let v): return v
        case .int64(let v): return Int32(truncatingIfNeeded: v)
        case .double(let v): return Int32(v)
        case .string(let s): return Int32(s) ?? 0
        case .label(let v): return v
        case .mark(let v): return v
        }
    }

    var asDouble: Double {
        switch self {
        case .int(let v): return Double(v)
        case .int64(let v): return Double(v)
        case .double(let v): return v
        case .string(let s): return Double(s) ?? 0
        case .label(let v): return Double(v)
        case .mark(let v): return Double(v)
        }
    }

    var asString: String {
        switch self {
        case .int(let v): return String(v)
        case .int64(let v): return String(v)
        case .double(let v): return String(v)
        case .string(let s): return s
        case .label(let v): return String(v)
        case .mark(let v): return String(v)
        }
    }
}

// MARK: - 描画コマンド (SwiftUI Canvas に投げる中間表現)

enum HSPDrawOp {
    case clear(r: Double, g: Double, b: Double)
    case setColor(r: Double, g: Double, b: Double)
    case boxF(x: Double, y: Double, w: Double, h: Double)
    case text(x: Double, y: Double, s: String)
    case setPos(x: Double, y: Double)
}

// MARK: - エラー

enum HSPRuntimeError: Error {
    case headerInvalid(String)
    case unsupported(String)
    case oob(String)
}

// MARK: - インタプリタ本体

final class HSPRuntime {
    // バイトコード本体
    private let bytes: [UInt8]
    private(set) var header: HSPHeader

    // セグメントへの絶対オフセット
    private let csOffset: Int
    private let csSize:   Int
    private let dsOffset: Int
    private let dsSize:   Int

    // 実行状態
    private var pc: Int = 0           // CS 内の word index (16bit 単位)
    private var stack: [HSPValue] = []
    private var vars: [Int32: HSPValue] = [:]   // var index → value
    private var running: Bool = false

    // 描画状態
    var drawOps: [HSPDrawOp] = []
    private var cur = (x: 8.0, y: 8.0)
    private var col = (r: 1.0, g: 1.0, b: 1.0)

    // 統計
    private(set) var step: Int = 0

    init(_ data: Data) throws {
        self.bytes = Array(data)
        self.header = try Self.parseHeader(bytes)
        self.csOffset = Int(header.ptCS)
        self.csSize   = Int(header.maxCS)
        self.dsOffset = Int(header.ptDS)
        self.dsSize   = Int(header.maxDS)
        guard csOffset + csSize <= bytes.count else {
            throw HSPRuntimeError.headerInvalid("CS out of range")
        }
        guard dsOffset + dsSize <= bytes.count else {
            throw HSPRuntimeError.headerInvalid("DS out of range")
        }
    }

    // MARK: ヘッダ解析

    static func parseHeader(_ b: [UInt8]) throws -> HSPHeader {
        guard b.count >= 96 else { throw HSPRuntimeError.headerInvalid("file too small") }
        guard b[0] == 0x48, b[1] == 0x53, b[2] == 0x50, b[3] == 0x33 else {
            throw HSPRuntimeError.headerInvalid("magic != HSP3")
        }
        func i32(_ off: Int) -> Int32 {
            let v = UInt32(b[off]) | (UInt32(b[off+1]) << 8) |
                    (UInt32(b[off+2]) << 16) | (UInt32(b[off+3]) << 24)
            return Int32(bitPattern: v)
        }
        return HSPHeader(
            magic: "HSP3",
            version: i32(4),
            maxVal:  i32(8),
            allSize: i32(12),
            ptCS:    i32(16), maxCS:    i32(20),
            ptDS:    i32(24), maxDS:    i32(28),
            ptOT:    i32(32), maxOT:    i32(36),
            ptDInfo: i32(40), maxDInfo: i32(44)
        )
    }

    // MARK: CS 読み出し helper

    private func csU16(_ wordIndex: Int) -> UInt16 {
        let off = csOffset + wordIndex * 2
        return UInt16(bytes[off]) | (UInt16(bytes[off+1]) << 8)
    }
    private func csU32(_ wordIndex: Int) -> UInt32 {
        let lo = UInt32(csU16(wordIndex))
        let hi = UInt32(csU16(wordIndex + 1))
        return lo | (hi << 16)
    }
    private func dsString(_ off: Int32) -> String {
        let start = dsOffset + Int(off)
        var end = start
        while end < dsOffset + dsSize, bytes[end] != 0 { end += 1 }
        let slice = Array(bytes[start..<end])
        return String(bytes: slice, encoding: .utf8)
            ?? String(bytes: slice, encoding: .shiftJIS) ?? ""
    }
    private func dsInt32(_ off: Int32) -> Int32 {
        let s = dsOffset + Int(off)
        let v = UInt32(bytes[s]) | (UInt32(bytes[s+1]) << 8) |
                (UInt32(bytes[s+2]) << 16) | (UInt32(bytes[s+3]) << 24)
        return Int32(bitPattern: v)
    }
    private func dsDouble(_ off: Int32) -> Double {
        let s = dsOffset + Int(off)
        var bits: UInt64 = 0
        for i in 0..<8 { bits |= UInt64(bytes[s+i]) << (8 * i) }
        return Double(bitPattern: bits)
    }

    // MARK: 1 トークン取り出し

    /// (type, val, exflg, advance words)
    private func fetchToken(at p: Int) -> (HSPType, Int32, UInt16, Int) {
        let w = csU16(p)
        let typeRaw = w & CSTYPE_MASK
        let exflg   = w & (EXFLG_0 | EXFLG_1 | EXFLG_2 | EXFLG_3)
        let t = HSPType(rawValue: Int(typeRaw)) ?? .mark
        if (exflg & EXFLG_3) != 0 {
            let v32 = csU32(p + 1)
            return (t, Int32(bitPattern: v32), exflg, 3)
        } else {
            let v = csU16(p + 1)
            return (t, Int32(Int16(bitPattern: v)), exflg, 2)
        }
    }

    // MARK: パラメータ収集 (1 文の中の引数列を式評価して値スタックに乗せる)

    /// 文の先頭 (EXFLG_1) は呼び出し前に既に消費済の前提。
    /// 次の EXFLG_1 が立ったトークン直前まで読み、引数式を順に評価して args に積む。
    /// 各引数式の終端には EXFLG_0 が立っている。
    private func collectArgs() -> [HSPValue] {
        var args: [HSPValue] = []
        var work: [HSPValue] = []   // 計算用スタック
        while pc < csSize / 2 {
            let w = csU16(pc)
            let exflg = w & (EXFLG_0 | EXFLG_1 | EXFLG_2 | EXFLG_3)
            if (exflg & EXFLG_1) != 0 { break }   // 次の文 — 消費せず抜ける
            let (t, v, _, adv) = fetchToken(at: pc)
            pc += adv
            switch t {
            case .inum:
                work.append(.int(v))
            case .dnum:
                work.append(.double(dsDouble(v)))
            case .string:
                work.append(.string(dsString(v)))
            case .label:
                work.append(.label(v))
            case .variable:
                work.append(vars[v] ?? .int(0))
            case .mark:
                // 二項演算子: pop 2 → push 1
                if work.count >= 2 {
                    let r = work.removeLast()
                    let l = work.removeLast()
                    work.append(applyCalc(op: v, l: l, r: r))
                }
            case .intcmd, .extcmd, .progcmd, .sysvar, .intfunc, .extsysvar:
                // Phase 2 では関数式は未対応 — 0 として扱う
                work.append(.int(0))
            default:
                work.append(.int(v))
            }
            // 引数式の終端 (EXFLG_0) で work 末尾を 1 引数として確定
            if (exflg & EXFLG_0) != 0 {
                if let top = work.last { args.append(top) }
                work.removeAll()
            }
        }
        if !work.isEmpty { args.append(work.removeLast()) }
        return args
    }

    private func applyCalc(op: Int32, l: HSPValue, r: HSPValue) -> HSPValue {
        // CALCCODE_*: 0=ADD 1=SUB 2=MUL 3=DIV 4=MOD 5=AND 6=OR 7=XOR
        // 8=EQ 9=NE 10=GT 11=LT 12=GTEQ 13=LTEQ 14=RR 15=LR
        let bothInt: Bool = {
            if case .int = l, case .int = r { return true }
            return false
        }()
        if bothInt {
            let a = l.asInt, b = r.asInt
            switch op {
            case 0: return .int(a &+ b)
            case 1: return .int(a &- b)
            case 2: return .int(a &* b)
            case 3: return .int(b == 0 ? 0 : a / b)
            case 4: return .int(b == 0 ? 0 : a % b)
            case 5: return .int(a & b)
            case 6: return .int(a | b)
            case 7: return .int(a ^ b)
            case 8: return .int(a == b ? 1 : 0)
            case 9: return .int(a != b ? 1 : 0)
            case 10: return .int(a >  b ? 1 : 0)
            case 11: return .int(a <  b ? 1 : 0)
            case 12: return .int(a >= b ? 1 : 0)
            case 13: return .int(a <= b ? 1 : 0)
            case 14: return .int(a >> b)
            case 15: return .int(a << b)
            default: return .int(0)
            }
        }
        let a = l.asDouble, b = r.asDouble
        switch op {
        case 0: return .double(a + b)
        case 1: return .double(a - b)
        case 2: return .double(a * b)
        case 3: return .double(b == 0 ? 0 : a / b)
        case 8: return .int(a == b ? 1 : 0)
        case 9: return .int(a != b ? 1 : 0)
        case 10: return .int(a >  b ? 1 : 0)
        case 11: return .int(a <  b ? 1 : 0)
        case 12: return .int(a >= b ? 1 : 0)
        case 13: return .int(a <= b ? 1 : 0)
        default: return .double(0)
        }
    }

    // MARK: 1 文を実行

    /// EXFLG_1 が立ったトークンを 1 つ読み、その文を実行する。
    /// 戻り値: 継続するなら true、end/stop で false。
    private func execStatement() -> Bool {
        guard pc < csSize / 2 else { return false }
        let (t, v, exflg, adv) = fetchToken(at: pc)
        if (exflg & EXFLG_1) == 0 {
            // 文先頭でないトークンを誤検知 — 読み飛ばす
            pc += adv
            return true
        }
        pc += adv
        step += 1

        switch t {
        case .variable:
            // 代入: 残りのトークンに代入元の値が並ぶ ('=' は MARK CALCCODE_EQ にはならず TYPE_MARK の特殊扱い)
            // Phase 2 簡易実装: collectArgs() の最後の値を変数に格納
            let args = collectArgs()
            if let val = args.last { vars[v] = val }
            return true

        case .progcmd:
            return execProgCmd(Int(v))

        case .intcmd:
            // 標準 HSP3 では cls/color/boxf/mes/pos は EXTCMD 側に居るが、
            // 念のため intcmd でも同じ opcode を叩いておく
            return execExtCmd(Int(v))

        case .extcmd:
            return execExtCmd(Int(v))

        case .modcmd, .userdef:
            _ = collectArgs()
            return true

        default:
            // 未知の文先頭 — スキップ
            _ = collectArgs()
            return true
        }
    }

    // MARK: progcmd (0x00=goto 0x10=end 0x11=stop 0x07=wait …)

    private func execProgCmd(_ id: Int) -> Bool {
        let args = collectArgs()
        switch id {
        case 0x00:  // goto
            if let lab = args.first {
                pc = Int(lab.asInt)   // OT 経由ではなく label 値が CS word offset で入っている前提
            }
            return true
        case 0x07:  // wait — Phase 2 では即時継続
            return true
        case 0x08:  // await
            return true
        case 0x10:  // end
            running = false
            return false
        case 0x11:  // stop
            running = false
            return false
        default:
            return true
        }
    }

    // MARK: extcmd (TYPE_EXTCMD = 9)
    //
    // hspcmp/hspcmd.cpp 抜粋:
    //   $00f mes / $011 pos / $013 cls / $018 color / $031 boxf
    //   $00c pset / $02f line / $014 font / $016 objsize / $01b redraw / $00d pget
    //
    // Watch ランタイムでは描画系 + a を最小サポート。

    private func execExtCmd(_ id: Int) -> Bool {
        let args = collectArgs()
        switch id {
        case 0x00f:  // mes / print
            let s = args.first?.asString ?? ""
            drawOps.append(.text(x: cur.x, y: cur.y, s: s))
            cur.y += 18
        case 0x011:  // pos
            let x = args.indices.contains(0) ? args[0].asDouble : 0
            let y = args.indices.contains(1) ? args[1].asDouble : 0
            cur = (x, y)
            drawOps.append(.setPos(x: x, y: y))
        case 0x013:  // cls
            drawOps.removeAll()
            drawOps.append(.clear(r: 0, g: 0, b: 0))
            cur = (8, 8)
            col = (1, 1, 1)
        case 0x018:  // color (R, G, B 各 0..255)
            let r = (args.indices.contains(0) ? args[0].asDouble : 255) / 255.0
            let g = (args.indices.contains(1) ? args[1].asDouble : 255) / 255.0
            let b = (args.indices.contains(2) ? args[2].asDouble : 255) / 255.0
            col = (r, g, b)
            drawOps.append(.setColor(r: r, g: g, b: b))
        case 0x031:  // boxf x1, y1, x2, y2
            let x  = args.indices.contains(0) ? args[0].asDouble : 0
            let y  = args.indices.contains(1) ? args[1].asDouble : 0
            let x2 = args.indices.contains(2) ? args[2].asDouble : 0
            let y2 = args.indices.contains(3) ? args[3].asDouble : 0
            drawOps.append(.boxF(x: min(x, x2), y: min(y, y2),
                                 w: abs(x2 - x), h: abs(y2 - y)))
        default:
            break
        }
        return true
    }

    // MARK: 公開 API

    /// 1 frame 分実行 (ざっくり最大 step 数で打ち切る)。
    /// .ax を逐次実行しつつ drawOps を構築する。
    func run(maxSteps: Int = 100_000) {
        running = true
        var n = 0
        while running, pc < csSize / 2, n < maxSteps {
            if !execStatement() { break }
            n += 1
        }
    }

    func reset() {
        pc = 0
        stack.removeAll()
        vars.removeAll()
        drawOps.removeAll()
        cur = (8, 8)
        col = (1, 1, 1)
        step = 0
    }
}
