//
//  HSPRuntime.swift — minimal HSP3 .ax interpreter (Phase 3)
//
//  目的:
//    watchOS 上で .ax (HSP3 bytecode) を解釈し、簡易な 2D 描画を行う。
//
//  Phase 3 範囲:
//    - HSPHED 解析、CS / DS / OT 取り出し
//    - ICODE 16bit + EXFLG_3 で 32bit val 復号
//    - 値スタック (Int / Double / String) と整数変数表
//    - 計算: + - * / % & | ^ == != < <= > >=
//    - 代入: var = expr (CALCCODE_EQ) + var += / -= 経由 mark val
//    - 制御: if / else (CMPCMD), goto / gosub / return, repeat / loop / continue / break
//    - frame: wait / await で 1 frame 終了 (run() リターン、 pc は保存)
//    - 描画: cls / color / boxf / mes / pos / line / pset / font (size only)
//    - sysvar: cnt
//
//  非対応 (Phase 4+):
//    - 配列、構造体、モジュール、文字列演算
//    - foreach / dim / sdim
//    - 拡張プラグイン
//

import Foundation

// MARK: - HSP3 型定数

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

private let CSTYPE_MASK: UInt16 = 0x0fff
private let EXFLG_0: UInt16 = 0x1000   // 単一値ファストパス (このトークンが式そのもの)
private let EXFLG_1: UInt16 = 0x2000   // 文の終端 (= 次の文の先頭にも立つ)
private let EXFLG_2: UInt16 = 0x4000   // パラメータ省略 (default)
private let EXFLG_3: UInt16 = 0x8000   // 32bit val 拡張

// MARK: - .ax ヘッダ

struct HSPHeader {
    var ptCS: Int32; var maxCS: Int32
    var ptDS: Int32; var maxDS: Int32
    var ptOT: Int32; var maxOT: Int32
}

// MARK: - 値型

enum HSPValue {
    case int(Int32)
    case double(Double)
    case string(String)
    case label(Int32)

    var asInt: Int32 {
        switch self {
        case .int(let v): return v
        case .double(let v): return Int32(v)
        case .string(let s): return Int32(s) ?? 0
        case .label(let v): return v
        }
    }
    var asDouble: Double {
        switch self {
        case .int(let v): return Double(v)
        case .double(let v): return v
        case .string(let s): return Double(s) ?? 0
        case .label(let v): return Double(v)
        }
    }
    var asString: String {
        switch self {
        case .int(let v): return String(v)
        case .double(let v): return String(v)
        case .string(let s): return s
        case .label(let v): return String(v)
        }
    }
    var isTrue: Bool {
        switch self {
        case .int(let v): return v != 0
        case .double(let v): return v != 0
        case .string(let s): return !s.isEmpty
        case .label: return true
        }
    }
}

// MARK: - 描画コマンド

enum HSPDrawOp {
    case clear(r: Double, g: Double, b: Double)
    case setColor(r: Double, g: Double, b: Double)
    case boxF(x: Double, y: Double, w: Double, h: Double)
    case line(x1: Double, y1: Double, x2: Double, y2: Double)
    case pset(x: Double, y: Double)
    case text(x: Double, y: Double, s: String, size: Double)
    case setPos(x: Double, y: Double)
}

// MARK: - エラー

enum HSPRuntimeError: Error {
    case headerInvalid(String)
}

// MARK: - ループ frame

private struct LoopFrame {
    var startPC: Int    // repeat の直後の word index
    var cnt: Int32      // 現在の cnt 値
    var limit: Int32    // 0 = 無限、>0 で limit 回
    var endPC: Int      // loop 命令の直後 (= break の jump 先)
}

// MARK: - インタプリタ本体

final class HSPRuntime {
    private let bytes: [UInt8]
    let header: HSPHeader

    private let csOffset: Int
    private let csSize:   Int      // bytes
    private let csWords:  Int      // = csSize / 2
    private let dsOffset: Int
    private let dsSize:   Int
    private let otOffset: Int
    private let otCount:  Int      // OT は Int32 配列、CS word offset を保持

    // 実行状態
    private(set) var pc: Int = 0   // CS word index
    private var vars: [Int32: HSPValue] = [:]
    /// dim/sdim で確保した配列。 scalar 変数は vars 側に置く。
    private var arrays: [Int32: [HSPValue]] = [:]
    private var loops: [LoopFrame] = []
    private var callStack: [Int] = []   // gosub return PC
    private var halted: Bool = false
    private var yielded: Bool = false   // wait/await で frame 終了

    // 描画状態
    var drawOps: [HSPDrawOp] = []
    private var cur = (x: 8.0, y: 8.0)
    private var col = (r: 1.0, g: 1.0, b: 1.0)
    private var fontSize: Double = 14

    // 統計
    private(set) var step: Int = 0

    init(_ data: Data) throws {
        let bs = Array(data)
        self.bytes = bs
        guard bs.count >= 96 else { throw HSPRuntimeError.headerInvalid("file too small") }
        guard bs[0] == 0x48, bs[1] == 0x53, bs[2] == 0x50, bs[3] == 0x33 else {
            throw HSPRuntimeError.headerInvalid("magic != HSP3")
        }
        func i32at(_ off: Int) -> Int32 {
            let v = UInt32(bs[off]) | (UInt32(bs[off+1]) << 8) |
                    (UInt32(bs[off+2]) << 16) | (UInt32(bs[off+3]) << 24)
            return Int32(bitPattern: v)
        }
        self.header = HSPHeader(
            ptCS: i32at(16), maxCS: i32at(20),
            ptDS: i32at(24), maxDS: i32at(28),
            ptOT: i32at(32), maxOT: i32at(36)
        )
        self.csOffset = Int(header.ptCS)
        self.csSize   = Int(header.maxCS)
        self.csWords  = csSize / 2
        self.dsOffset = Int(header.ptDS)
        self.dsSize   = Int(header.maxDS)
        self.otOffset = Int(header.ptOT)
        self.otCount  = Int(header.maxOT) / 4
        guard csOffset + csSize <= bytes.count,
              dsOffset + dsSize <= bytes.count,
              otOffset + Int(header.maxOT) <= bytes.count
        else { throw HSPRuntimeError.headerInvalid("segment OOB") }
    }

    // MARK: 低レベル read

    private func u16(_ byteOff: Int) -> UInt16 {
        UInt16(bytes[byteOff]) | (UInt16(bytes[byteOff+1]) << 8)
    }
    private func i32(_ byteOff: Int) -> Int32 {
        let u = UInt32(bytes[byteOff]) | (UInt32(bytes[byteOff+1]) << 8) |
                (UInt32(bytes[byteOff+2]) << 16) | (UInt32(bytes[byteOff+3]) << 24)
        return Int32(bitPattern: u)
    }
    private func csU16(_ word: Int) -> UInt16 { u16(csOffset + word * 2) }
    private func csI16(_ word: Int) -> Int16  { Int16(bitPattern: csU16(word)) }
    private func csU32(_ word: Int) -> UInt32 {
        UInt32(csU16(word)) | (UInt32(csU16(word + 1)) << 16)
    }
    private func dsString(_ off: Int32) -> String {
        let start = dsOffset + Int(off)
        guard start >= dsOffset, start < dsOffset + dsSize else { return "" }
        var end = start
        while end < dsOffset + dsSize, bytes[end] != 0 { end += 1 }
        let slice = Array(bytes[start..<end])
        return String(bytes: slice, encoding: .utf8)
            ?? String(bytes: slice, encoding: .shiftJIS) ?? ""
    }
    private func dsDouble(_ off: Int32) -> Double {
        let s = dsOffset + Int(off)
        var bits: UInt64 = 0
        for i in 0..<8 { bits |= UInt64(bytes[s + i]) << (8 * i) }
        return Double(bitPattern: bits)
    }
    /// OT[i] = CS word offset
    private func otLookup(_ idx: Int32) -> Int {
        let i = Int(idx)
        guard i >= 0, i < otCount else { return csWords }
        return Int(i32(otOffset + i * 4))
    }

    // MARK: token fetch

    /// (type, val, exflg, advance words). advance は 2 (16bit val) または 3 (32bit val)
    private func fetchToken(at p: Int) -> (t: HSPType, v: Int32, exflg: UInt16, adv: Int) {
        let w = csU16(p)
        let typeRaw = w & CSTYPE_MASK
        let exflg = w & (EXFLG_0 | EXFLG_1 | EXFLG_2 | EXFLG_3)
        let t = HSPType(rawValue: Int(typeRaw)) ?? .mark
        if (exflg & EXFLG_3) != 0 {
            return (t, Int32(bitPattern: csU32(p + 1)), exflg, 3)
        } else {
            let raw = csU16(p + 1)
            switch t {
            case .inum, .mark:
                return (t, Int32(Int16(bitPattern: raw)), exflg, 2)
            default:
                return (t, Int32(raw), exflg, 2)
            }
        }
    }

    // MARK: 式評価
    //
    // HSP3 の式は RPN 風: var/inum/dnum/string/sysvar を push、TYPE_MARK で pop2/push1。
    // 終端: トークンに EXFLG_0 が立っていれば「この式の最終トークン」。
    // EXFLG_1 (次の文) または、 work が非空の状態で EXFLG_2 (引数区切り) が
    // 立った次トークンを見たら、そのトークンを消費せず break する。
    // EXFLG_2 はこの引数自身のトークン (1 つ目) には付く可能性があるので無視する。
    private func evalExpression() -> HSPValue {
        var work: [HSPValue] = []
        while pc < csWords {
            let w = csU16(pc)
            let exflg = w & (EXFLG_0 | EXFLG_1 | EXFLG_2 | EXFLG_3)
            if (exflg & EXFLG_1) != 0 { break }
            if !work.isEmpty, (exflg & EXFLG_2) != 0 { break }
            // MARK '(' ')' ',' は式の境界 — 消費せず caller に戻す
            let peekRaw = w & CSTYPE_MASK
            if peekRaw == 0 {  // TYPE_MARK
                let valWord = csU16(pc + 1)
                if valWord == 40 || valWord == 41 || valWord == 44 { break }
            }
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
                work.append(.label(Int32(otLookup(v))))
            case .variable:
                work.append(readVarMaybeArray(v))
            case .mark:
                if work.count >= 2 {
                    let r = work.removeLast()
                    let l = work.removeLast()
                    work.append(applyCalc(op: v, l: l, r: r))
                }
            case .sysvar:
                work.append(readSysvar(Int(v)))
            case .intfunc:
                // sin/cos/sqrt/abs/rnd/int 等。 後続の MARK '(' arg ')' を読む
                work.append(callIntFunc(Int(v)))
            case .extsysvar:
                work.append(readExtSysvar(Int(v)))
            default:
                work.append(.int(v))
            }
            if (exflg & EXFLG_0) != 0 { break }
        }
        return work.last ?? .int(0)
    }

    /// 1 つの引数 (式) を読む。EXFLG_1 で「もう引数なし」を返す。
    private func nextArg() -> HSPValue? {
        guard pc < csWords else { return nil }
        let exflg = csU16(pc) & (EXFLG_0 | EXFLG_1 | EXFLG_2 | EXFLG_3)
        if (exflg & EXFLG_1) != 0 { return nil }
        return evalExpression()
    }

    private func collectArgs() -> [HSPValue] {
        var args: [HSPValue] = []
        while let a = nextArg() { args.append(a) }
        return args
    }

    private func readSysvar(_ id: Int) -> HSPValue {
        switch id {
        case 0x004:  // cnt
            return .int(loops.last?.cnt ?? 0)
        case 0x002:  // hspver
            return .int(0x3600)
        default:
            return .int(0)
        }
    }

    /// extsysvar (mousex/mousey/ginfo 等) — Watch では大半は 0 固定
    private func readExtSysvar(_ id: Int) -> HSPValue {
        switch id {
        case 0x000: return .int(0)  // mousex (Watch には無い)
        case 0x001: return .int(0)  // mousey
        case 0x300: return .int(wcReadyFlag ? 1 : 0)  // wcready (watch_api.as)
        default:    return .int(0)
        }
    }

    // ---- WC API state (Phase 4d, watch_api.as 連携)
    /// wcrecv で読み出すと false に戻す。 SwiftUI 側 (Bridge) から外部 set。
    var wcReadyFlag: Bool = false
    /// 最後の受信メッセージ。 wcrecv var で var に書き出される。
    var wcLastMessage: String = ""

    // MARK: 配列アクセス
    //
    // VAR の直後に MARK '(' が来たら配列インデックス読み出し。
    // varIdx で参照される変数が arrays に登録済なら arrays[varIdx][i] を返す。
    // 未登録なら scalar として vars[varIdx] を返す (idx 無視)。

    /// VAR トークン消費後に呼ぶ。 直後が '(' なら index を読み、 末尾の ')' まで消費。
    /// 配列でない場合は scalar 値を返す。
    private func readVarMaybeArray(_ varIdx: Int32) -> HSPValue {
        // 次トークンが MARK '(' か peek
        if pc < csWords {
            let w = csU16(pc)
            if (w & CSTYPE_MASK) == 0 && csU16(pc + 1) == 40 {
                // '(' を消費
                pc += 2
                let idx = evalExpression().asInt
                // ')' を消費
                if pc < csWords {
                    let w2 = csU16(pc)
                    if (w2 & CSTYPE_MASK) == 0 && csU16(pc + 1) == 41 {
                        pc += 2
                    }
                }
                if let arr = arrays[varIdx], (0..<arr.count).contains(Int(idx)) {
                    return arr[Int(idx)]
                }
                return .int(0)
            }
        }
        // scalar
        if let arr = arrays[varIdx], !arr.isEmpty { return arr[0] }
        return vars[varIdx] ?? .int(0)
    }

    /// VAR (statement-start) 直後に '(' があるなら配列代入と判定。 添字を返し pc を ')' の後まで進める。
    /// 配列代入でなければ nil を返す (pc 不変)。
    private func tryReadArrayIndex() -> Int? {
        guard pc < csWords else { return nil }
        let w = csU16(pc)
        if (w & CSTYPE_MASK) != 0 || csU16(pc + 1) != 40 { return nil }
        pc += 2  // '('
        let idx = Int(evalExpression().asInt)
        if pc < csWords {
            let w2 = csU16(pc)
            if (w2 & CSTYPE_MASK) == 0 && csU16(pc + 1) == 41 { pc += 2 }
        }
        return idx
    }

    /// 関数呼び出しの引数群を読む。
    ///   bytecode: MARK '(' arg [, arg ...] MARK ')'
    /// '(' は呼び出し時に既に消費済の前提ではなく、 ここで読む。
    private func collectFuncArgs() -> [HSPValue] {
        var args: [HSPValue] = []
        // '(' を消費
        guard pc < csWords else { return args }
        let openTok = fetchToken(at: pc)
        if openTok.t == .mark && openTok.v == 40 {
            pc += openTok.adv
        }
        // ')' まで args を集める
        while pc < csWords {
            // 次のトークンが ')' なら終了
            let peek = fetchToken(at: pc)
            if peek.t == .mark && peek.v == 41 {
                pc += peek.adv
                break
            }
            // 1 つの式を評価
            let v = evalExpression()
            args.append(v)
            // 区切り (MARK ',' または EXFLG_2 / EXFLG_0 既に消費) は evalExpression 内で
            // 適切に止まる。 ここで MARK ',' (val=44) なら明示消費。
            if pc < csWords {
                let nxt = fetchToken(at: pc)
                if nxt.t == .mark && nxt.v == 44 {
                    pc += nxt.adv
                }
            }
        }
        return args
    }

    /// TYPE_INTFUNC (id=13) の呼び出し処理。
    /// hspcmd.cpp の opcode 表より:
    ///   $000 int / $001 rnd / $002 strlen / $008 gettime / $009 peek /
    ///   $00a wpeek / $00b lpeek / $00f instr / $010 abs / $011 limit /
    ///   $180 sin / $181 cos / $182 tan / $183 atan / $184 sqrt /
    ///   $185 double / $186 absf / $187 expf / $188 logf / $189 limitf
    private func callIntFunc(_ id: Int) -> HSPValue {
        let args = collectFuncArgs()
        let a0 = args.first ?? .int(0)
        let a1 = args.count > 1 ? args[1] : .int(0)
        switch id {
        case 0x000: return .int(a0.asInt)                          // int
        case 0x001:                                                 // rnd(N)
            let n = max(1, a0.asInt)
            return .int(Int32.random(in: 0..<n))
        case 0x002: return .int(Int32(a0.asString.count))          // strlen
        case 0x008: return .int(Int32(Date().timeIntervalSince1970)) // gettime (簡易)
        case 0x010: return .int(abs(a0.asInt))                     // abs
        case 0x011:                                                 // limit(v, lo, hi)
            let a2 = args.count > 2 ? args[2] : .int(0)
            return .int(min(max(a0.asInt, a1.asInt), a2.asInt))
        case 0x180: return .double(sin(a0.asDouble))               // sin
        case 0x181: return .double(cos(a0.asDouble))               // cos
        case 0x182: return .double(tan(a0.asDouble))               // tan
        case 0x183: return .double(atan(a0.asDouble))              // atan
        case 0x184: return .double(sqrt(a0.asDouble))              // sqrt
        case 0x185: return .double(a0.asDouble)                    // double
        case 0x186: return .double(abs(a0.asDouble))               // absf
        case 0x187: return .double(exp(a0.asDouble))               // expf
        case 0x188: return .double(log(a0.asDouble))               // logf
        case 0x189:                                                 // limitf(v, lo, hi)
            let a2 = args.count > 2 ? args[2] : .int(0)
            return .double(min(max(a0.asDouble, a1.asDouble), a2.asDouble))
        case 0x18a:                                                 // powf(b, e)
            return .double(pow(a0.asDouble, a1.asDouble))
        default:
            return .int(0)
        }
    }

    private func applyCalc(op: Int32, l: HSPValue, r: HSPValue) -> HSPValue {
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
        // 文字列 + 文字列 / 文字列 + 数値 → 文字列連結
        if case .string(let ls) = l {
            if op == 0 { return .string(ls + r.asString) }
        }
        if case .string(let rs) = r, op == 0 {
            return .string(l.asString + rs)
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

    // MARK: 文の実行

    /// EXFLG_1 が立った文先頭トークンを 1 つ実行。 yield (wait/await) で false。
    private func execStatement() -> Bool {
        guard pc < csWords else { halted = true; return false }
        let (t, v, exflg, adv) = fetchToken(at: pc)
        if (exflg & EXFLG_1) == 0 {
            // 文先頭でない → スキップ
            pc += adv
            return true
        }
        pc += adv
        step += 1

        switch t {
        case .variable:
            execAssignment(varIdx: v)
        case .progcmd:
            execProgCmd(Int(v))
        case .intcmd:
            execExtCmd(Int(v))
        case .extcmd:
            // stick は var 第一引数を取るので特別扱い
            if v == 0x034 {
                execStick()
            } else if v == 0x201 {
                execWcRecv()
            } else {
                execExtCmd(Int(v))
            }
        case .cmpcmd:
            execCmpCmd(Int(v))
        case .modcmd, .userdef:
            _ = collectArgs()
        default:
            _ = collectArgs()
        }
        return !yielded
    }

    // MARK: 代入文
    //
    //   var (EXFLG_1) + MARK CALCCODE_xx + 値式
    //   CALCCODE: 8=EQ (=), 0=ADD (+=), 1=SUB (-=), 2=MUL (*=), 3=DIV (/=)
    private func execAssignment(varIdx: Int32) {
        // 配列代入か検出: VAR 直後が '(' なら array idx を読む
        let arrIdx = tryReadArrayIndex()
        // 次トークンは MARK (CALCCODE_EQ 等)
        guard pc < csWords else { return }
        let (t, op, _, adv) = fetchToken(at: pc)
        pc += adv
        let value = evalExpression()
        if t != .mark {
            writeVar(varIdx, idx: arrIdx, value: value)
            return
        }
        let cur = (arrIdx != nil ? readArrayCell(varIdx, arrIdx!) : (vars[varIdx] ?? .int(0)))
        switch op {
        case 8: writeVar(varIdx, idx: arrIdx, value: value)
        case 0: writeVar(varIdx, idx: arrIdx, value: applyCalc(op: 0, l: cur, r: value))
        case 1: writeVar(varIdx, idx: arrIdx, value: applyCalc(op: 1, l: cur, r: value))
        case 2: writeVar(varIdx, idx: arrIdx, value: applyCalc(op: 2, l: cur, r: value))
        case 3: writeVar(varIdx, idx: arrIdx, value: applyCalc(op: 3, l: cur, r: value))
        default: writeVar(varIdx, idx: arrIdx, value: value)
        }
    }

    private func readArrayCell(_ v: Int32, _ idx: Int) -> HSPValue {
        if let a = arrays[v], (0..<a.count).contains(idx) { return a[idx] }
        return .int(0)
    }

    private func writeVar(_ v: Int32, idx: Int?, value: HSPValue) {
        if let i = idx {
            // 配列書き込み (未確保なら自動拡張)
            var arr = arrays[v] ?? []
            if i >= arr.count {
                arr.append(contentsOf: Array(repeating: HSPValue.int(0), count: i + 1 - arr.count))
            }
            if i >= 0 { arr[i] = value }
            arrays[v] = arr
        } else {
            // 配列が既に確保されていれば arrays[0] に書き、 そうでなければ scalar
            if arrays[v] != nil {
                arrays[v]![0] = value
            } else {
                vars[v] = value
            }
        }
    }

    // MARK: progcmd
    //
    //   $00=goto $01=gosub $02=return $03=break $04=repeat $05=loop
    //   $06=continue $07=wait $08=await $10=end $11=stop
    private func execProgCmd(_ id: Int) {
        switch id {
        case 0x00:  // goto label
            if case .label(let target) = nextArg() ?? .int(0) {
                pc = Int(target)
            }
        case 0x01:  // gosub label
            // gosub は label 引数 1 つ。 retunr 用に「label 後」の pc を保存。
            // ただし HSP の gosub は 引数を読んだ後の位置を return 先にする。
            // 簡易: 引数評価後の pc を push。
            if case .label(let target) = nextArg() ?? .int(0) {
                callStack.append(pc)
                pc = Int(target)
            }
        case 0x02:  // return
            _ = collectArgs()  // 戻り値は無視
            if let ret = callStack.popLast() {
                pc = ret
            } else {
                halted = true
            }
        case 0x03:  // break — repeat ブロックを抜ける
            _ = collectArgs()
            if let frame = loops.popLast() {
                pc = frame.endPC
            }
        case 0x04:  // repeat <count>
            // 標準 HSP: code_getlb() で loop の直後の label を読む → break ターゲット
            // 引き続き count を読む。
            // バイトコード列: PROGCMD repeat (EXFLG_1) | label-token | count expr
            // label-token は TYPE_LABEL で、val が OT idx。
            let breakTarget: Int
            if pc < csWords, case .label(let l) = peekArgIfLabel() {
                breakTarget = Int(l)
            } else {
                breakTarget = csWords
            }
            let countArg = nextArg()?.asInt ?? -1
            let limit: Int32 = (countArg < 0) ? 0 : countArg
            if countArg == 0 {
                // 0 回 = 即 break
                pc = breakTarget
                return
            }
            loops.append(LoopFrame(
                startPC: pc, cnt: 0, limit: limit, endPC: breakTarget))
        case 0x05:  // loop
            _ = collectArgs()
            if var frame = loops.popLast() {
                frame.cnt += 1
                if frame.limit > 0, frame.cnt >= frame.limit {
                    // ループ終了
                } else {
                    pc = frame.startPC
                    loops.append(frame)
                }
            }
        case 0x06:  // continue
            _ = collectArgs()
            if let frame = loops.last {
                pc = frame.startPC
            }
        case 0x07, 0x08:  // wait / await
            _ = collectArgs()
            yielded = true
        case 0x09:  // dim var, n
            // bytecode: VAR token + size INUM
            if pc < csWords {
                let v0 = fetchToken(at: pc)
                if v0.t == .variable {
                    pc += v0.adv
                    let n = Int(evalExpression().asInt)
                    arrays[v0.v] = Array(repeating: .int(0), count: max(1, n))
                    _ = collectArgs()
                }
            }
        case 0x0a:  // sdim var, sz, n
            if pc < csWords {
                let v0 = fetchToken(at: pc)
                if v0.t == .variable {
                    pc += v0.adv
                    _ = evalExpression()  // sz は無視 (Watch では文字列長制限なし)
                    let n = Int(nextArg()?.asInt ?? 1)
                    arrays[v0.v] = Array(repeating: .string(""), count: max(1, n))
                    _ = collectArgs()
                }
            }
        case 0x10, 0x11:  // end / stop
            _ = collectArgs()
            halted = true
        default:
            _ = collectArgs()
        }
    }

    /// repeat の最初の引数が label の時のみ取り出す (label-token は 4 bytes)
    private func peekArgIfLabel() -> HSPValue {
        guard pc < csWords else { return .int(-1) }
        let (t, v, _, adv) = fetchToken(at: pc)
        if t == .label {
            pc += adv
            return .label(Int32(otLookup(v)))
        }
        return .int(-1)
    }

    // MARK: cmpcmd (if / else)
    //
    //   CMPCMD val=0 (if):
    //     - 直後 16bit word = skip offset (false 時に進める word 数)
    //     - 続いて condition expr
    //   CMPCMD val=1 (else):
    //     - 直後 16bit word = skip offset (無条件に進める word 数)
    private func execCmpCmd(_ id: Int) {
        guard pc < csWords else { return }
        let skipOffset = Int(csU16(pc))
        pc += 1
        // jump target は skipOffset 直後の位置を anchor にして +skipOffset words
        let jumpTarget = pc + skipOffset
        if id == 0 {
            // if
            let cond = evalExpression()
            if !cond.isTrue {
                pc = jumpTarget
            }
            // 真の場合は condition 評価後の pc (= body 先頭) からそのまま続行
        } else {
            // else は無条件 jump
            pc = jumpTarget
        }
    }

    // MARK: extcmd
    private func execExtCmd(_ id: Int) {
        let args = collectArgs()
        switch id {
        case 0x00f:  // mes / print
            let s = args.first?.asString ?? ""
            drawOps.append(.text(x: cur.x, y: cur.y, s: s, size: fontSize))
            cur.y += fontSize + 4
        case 0x011:  // pos
            cur.x = args.indices.contains(0) ? args[0].asDouble : 0
            cur.y = args.indices.contains(1) ? args[1].asDouble : 0
            drawOps.append(.setPos(x: cur.x, y: cur.y))
        case 0x013:  // cls
            drawOps.removeAll()
            drawOps.append(.clear(r: 0, g: 0, b: 0))
            cur = (8, 8); col = (1, 1, 1)
        case 0x014:  // font name, size, style
            if args.indices.contains(1) { fontSize = args[1].asDouble }
        case 0x018:  // color R, G, B
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
        case 0x02f:  // line x1, y1, x2, y2 — HSP の line は 2 引数版もあるが Watch では 4 引数固定
            if args.count >= 4 {
                drawOps.append(.line(x1: args[0].asDouble, y1: args[1].asDouble,
                                     x2: args[2].asDouble, y2: args[3].asDouble))
            } else if args.count >= 2 {
                drawOps.append(.line(x1: cur.x, y1: cur.y,
                                     x2: args[0].asDouble, y2: args[1].asDouble))
                cur = (args[0].asDouble, args[1].asDouble)
            }
        case 0x00c:  // pset x, y
            let x = args.indices.contains(0) ? args[0].asDouble : 0
            let y = args.indices.contains(1) ? args[1].asDouble : 0
            drawOps.append(.pset(x: x, y: y))
        case 0x01b:  // redraw — Watch では no-op (フレーム終端で表示)
            break
        case 0x200:  // wcsend "string" (watch_api.as)
            if let s = args.first {
                wcSendCallback?(s.asString)
            }
        default:
            break
        }
    }

    /// wcrecv var (watch_api.as) — 第一引数の var に最新メッセージを書く
    private func execWcRecv() {
        guard pc < csWords else { return }
        let v0 = fetchToken(at: pc)
        if v0.t != .variable { return }
        pc += v0.adv
        _ = collectArgs()
        writeVar(v0.v, idx: nil, value: .string(wcLastMessage))
        wcReadyFlag = false
    }

    /// SwiftUI / Win 側から set する送信ハンドラ
    var wcSendCallback: ((String) -> Void)?

    /// stick var [, mask]
    /// 第一引数 = 書き込み先変数、 第二引数 = 抑制マスク (Watch では未使用)
    /// 戻り値: 押下されているキーのビットマスク (Watch では keyState を返す)
    /// 簡易: WC bridge.lastMessage が空でなければ bit 0、 Crown delta があれば bit 4..5。
    private func execStick() {
        // 第一引数は VAR トークン
        guard pc < csWords else { return }
        let var0 = fetchToken(at: pc)
        if var0.t != .variable { return }
        pc += var0.adv
        // 第二引数 (mask) は読み捨て
        _ = nextArg()
        // 残りの引数も消費
        _ = collectArgs()
        // Watch では keyState は外部から注入される (Crown / tap)。 Phase 5 では 0 固定。
        vars[var0.v] = .int(keyState)
    }

    /// 外部 (SwiftUI / Win32) から注入する擬似キー入力
    var keyState: Int32 = 0

    // MARK: 公開 API

    /// 1 frame 分実行 (wait/await まで、または最大 step 数)。
    /// run() を再度呼ぶと続きから再開。
    func runFrame(maxSteps: Int = 200_000) {
        yielded = false
        var n = 0
        while !halted, !yielded, pc < csWords, n < maxSteps {
            if !execStatement() { break }
            n += 1
        }
    }

    var isHalted: Bool { halted || pc >= csWords }

    func reset() {
        pc = 0
        vars.removeAll()
        arrays.removeAll()
        loops.removeAll()
        callStack.removeAll()
        drawOps.removeAll()
        cur = (8, 8); col = (1, 1, 1)
        fontSize = 14
        step = 0
        halted = false
        yielded = false
    }
}
