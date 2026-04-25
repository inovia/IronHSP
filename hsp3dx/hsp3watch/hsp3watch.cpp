// hsp3watch.cpp — Apple Watch 用 mini HSP ランタイムの Windows 移植
//                 (hsp3watch_64.exe)
//
// 目的:
//   ../ios/template/Watch/Sources/HSPRuntime.swift と「同じ .ax で同じ動作」を
//   実現する Win32 GDI ベースの単体 .exe。 Watch sim を回さずに .hsp を
//   日常デバッグできるようにする。
//
// 仕様一致範囲 (HSPRuntime.swift Phase 3 と同等):
//   - HSPHED parser, 16/32bit code stream, EXFLG_0/1/2/3 セマンティクス
//   - 値型: int / double / string / label
//   - 計算: CALCCODE_0..15 (ADD/SUB/MUL/DIV/MOD/AND/OR/XOR/EQ/NE/GT/LT/GTEQ/LTEQ/RR/LR)
//   - 代入: var = expr / += / -= / *= / /=
//   - 制御: if/else (CMPCMD), goto/gosub/return, repeat/loop/break/continue, wait/await/end/stop
//   - sysvar: cnt
//   - 描画 EXTCMD: cls=$13 / color=$18 / boxf=$31 / mes=$0f / pos=$11 / line=$2f / pset=$0c / font=$14
//   - frame 境界: wait/await で 1 frame 分実行を中断、Win32 timer で次 tick 再開
//
// ビルド: ./build.bat (cl.exe 一発、 user32 / gdi32 link)
//
// 使い方: hsp3watch_64.exe <path/to/file.ax>
//   引数省略時は ../ios/template/Watch/Resources/demo.ax を試行。
//
#define WIN32_LEAN_AND_MEAN
#define UNICODE
#define _UNICODE
#include <windows.h>
#include <windowsx.h>
#include <stdio.h>
#include <stdint.h>
#include <vector>
#include <string>
#include <variant>
#include <unordered_map>
#include <fstream>
#include <sstream>

// ---------------------------------------------------------------- 型定数

enum HSPType {
    T_MARK = 0, T_VAR = 1, T_STRING = 2, T_DNUM = 3, T_INUM = 4,
    T_STRUCT = 5, T_XLABEL = 6, T_LABEL = 7,
    T_INTCMD = 8, T_EXTCMD = 9, T_EXTSYSVAR = 10, T_CMPCMD = 11,
    T_MODCMD = 12, T_INTFUNC = 13, T_SYSVAR = 14, T_PROGCMD = 15,
    T_DLLFUNC = 16, T_DLLCTRL = 17, T_USERDEF = 18,
    T_INUM64 = 19, T_WSTR = 20
};

static const uint16_t CSTYPE_MASK = 0x0fff;
static const uint16_t EXFLG_0 = 0x1000;   // 式最終 token
static const uint16_t EXFLG_1 = 0x2000;   // 文先頭
static const uint16_t EXFLG_2 = 0x4000;   // 引数区切り
static const uint16_t EXFLG_3 = 0x8000;   // 32bit val 拡張

// ---------------------------------------------------------------- 値型

struct Value {
    enum Kind { INT, DOUBLE, STRING, LABEL };
    Kind kind = INT;
    int32_t  iv = 0;
    double   dv = 0;
    std::string sv;

    static Value Int(int32_t v)    { Value r; r.kind = INT;    r.iv = v; return r; }
    static Value Dbl(double v)     { Value r; r.kind = DOUBLE; r.dv = v; return r; }
    static Value Str(std::string s){ Value r; r.kind = STRING; r.sv = std::move(s); return r; }
    static Value Lbl(int32_t v)    { Value r; r.kind = LABEL;  r.iv = v; return r; }

    int32_t asInt() const {
        switch (kind) {
        case INT:    return iv;
        case DOUBLE: return (int32_t)dv;
        case STRING: try { return (int32_t)std::stol(sv); } catch (...) { return 0; }
        case LABEL:  return iv;
        }
        return 0;
    }
    double asDouble() const {
        switch (kind) {
        case INT:    return (double)iv;
        case DOUBLE: return dv;
        case STRING: try { return std::stod(sv); } catch (...) { return 0; }
        case LABEL:  return (double)iv;
        }
        return 0;
    }
    std::string asString() const {
        char buf[64];
        switch (kind) {
        case INT:    snprintf(buf, sizeof(buf), "%d", iv); return buf;
        case DOUBLE: snprintf(buf, sizeof(buf), "%g", dv); return buf;
        case STRING: return sv;
        case LABEL:  snprintf(buf, sizeof(buf), "%d", iv); return buf;
        }
        return "";
    }
    bool isTrue() const {
        switch (kind) {
        case INT:    return iv != 0;
        case DOUBLE: return dv != 0;
        case STRING: return !sv.empty();
        case LABEL:  return true;
        }
        return false;
    }
};

// ---------------------------------------------------------------- 描画 op

struct DrawOp {
    enum Kind { CLEAR, SETCOLOR, BOXF, LINE, PSET, TEXT, SETPOS };
    Kind kind = CLEAR;
    double r = 0, g = 0, b = 0;
    double x = 0, y = 0, w = 0, h = 0;
    double size = 14;
    std::string s;
};

// ---------------------------------------------------------------- ループ frame

struct LoopFrame {
    size_t  startPC = 0;
    int32_t cnt     = 0;
    int32_t limit   = 0;   // 0 = 無限
    size_t  endPC   = 0;
};

// ---------------------------------------------------------------- HSPRuntime

class HSPRuntime {
public:
    std::vector<DrawOp> drawOps;
    int step = 0;

    bool load(const std::vector<uint8_t>& bs) {
        bytes = bs;
        if (bytes.size() < 96) return false;
        if (bytes[0] != 'H' || bytes[1] != 'S' || bytes[2] != 'P' || bytes[3] != '3') return false;
        ptCS  = i32at(16);  maxCS  = i32at(20);
        ptDS  = i32at(24);  maxDS  = i32at(28);
        ptOT  = i32at(32);  maxOT  = i32at(36);
        if ((size_t)(ptCS + maxCS) > bytes.size()) return false;
        if ((size_t)(ptDS + maxDS) > bytes.size()) return false;
        if ((size_t)(ptOT + maxOT) > bytes.size()) return false;
        csWords = maxCS / 2;
        otCount = maxOT / 4;
        reset();
        return true;
    }

    void reset() {
        pc = 0;
        vars.clear();
        loops.clear();
        callStack.clear();
        drawOps.clear();
        curX = 8; curY = 8;
        colR = 1; colG = 1; colB = 1;
        fontSize = 14;
        step = 0;
        halted = false;
        yielded = false;
    }

    // 1 frame 分実行 (wait/await まで、または maxSteps)
    void runFrame(int maxSteps = 200000) {
        yielded = false;
        int n = 0;
        while (!halted && !yielded && pc < csWords && n < maxSteps) {
            if (!execStatement()) break;
            n++;
        }
    }

    bool isHalted() const { return halted || pc >= csWords; }

private:
    std::vector<uint8_t> bytes;
    int32_t ptCS = 0, maxCS = 0, ptDS = 0, maxDS = 0, ptOT = 0, maxOT = 0;
    size_t  csWords = 0, otCount = 0;

    size_t pc = 0;
    std::unordered_map<int32_t, Value> vars;
    std::vector<LoopFrame> loops;
    std::vector<size_t> callStack;
    bool halted = false, yielded = false;

    double curX = 8, curY = 8;
    double colR = 1, colG = 1, colB = 1;
    double fontSize = 14;

    // ---- low-level read

    int32_t i32at(size_t off) const {
        uint32_t u = (uint32_t)bytes[off]
                   | ((uint32_t)bytes[off+1] << 8)
                   | ((uint32_t)bytes[off+2] << 16)
                   | ((uint32_t)bytes[off+3] << 24);
        return (int32_t)u;
    }
    uint16_t csU16(size_t word) const {
        size_t off = (size_t)ptCS + word * 2;
        return (uint16_t)bytes[off] | ((uint16_t)bytes[off+1] << 8);
    }
    uint32_t csU32(size_t word) const {
        return (uint32_t)csU16(word) | ((uint32_t)csU16(word+1) << 16);
    }
    std::string dsString(int32_t off) const {
        size_t s = (size_t)ptDS + (size_t)off;
        if (s < (size_t)ptDS || s >= (size_t)(ptDS + maxDS)) return "";
        size_t e = s;
        while (e < (size_t)(ptDS + maxDS) && bytes[e] != 0) e++;
        return std::string((const char*)&bytes[s], e - s);
    }
    double dsDouble(int32_t off) const {
        size_t s = (size_t)ptDS + (size_t)off;
        uint64_t bits = 0;
        for (int i = 0; i < 8; i++) bits |= (uint64_t)bytes[s + i] << (8 * i);
        double d;
        memcpy(&d, &bits, 8);
        return d;
    }
    size_t otLookup(int32_t idx) const {
        if (idx < 0 || (size_t)idx >= otCount) return csWords;
        return (size_t)i32at((size_t)ptOT + (size_t)idx * 4);
    }

    // ---- token fetch (returns advance words)

    struct Token { HSPType t; int32_t v; uint16_t exflg; int adv; };

    Token fetchToken(size_t p) const {
        uint16_t w = csU16(p);
        uint16_t typeRaw = w & CSTYPE_MASK;
        uint16_t exflg = w & (EXFLG_0 | EXFLG_1 | EXFLG_2 | EXFLG_3);
        HSPType t = (HSPType)typeRaw;
        if (exflg & EXFLG_3) {
            int32_t v32 = (int32_t)csU32(p + 1);
            return { t, v32, exflg, 3 };
        } else {
            uint16_t raw = csU16(p + 1);
            int32_t v;
            if (t == T_INUM || t == T_MARK) v = (int32_t)(int16_t)raw;  // signed
            else                            v = (int32_t)raw;            // unsigned
            return { t, v, exflg, 2 };
        }
    }

    // ---- 式評価

    Value evalExpression() {
        std::vector<Value> work;
        while (pc < csWords) {
            uint16_t w = csU16(pc);
            uint16_t exflg = w & (EXFLG_0 | EXFLG_1 | EXFLG_2 | EXFLG_3);
            if (exflg & EXFLG_1) break;
            if (!work.empty() && (exflg & EXFLG_2)) break;
            Token tk = fetchToken(pc);
            pc += tk.adv;
            switch (tk.t) {
            case T_INUM:    work.push_back(Value::Int(tk.v));        break;
            case T_DNUM:    work.push_back(Value::Dbl(dsDouble(tk.v))); break;
            case T_STRING:  work.push_back(Value::Str(dsString(tk.v))); break;
            case T_LABEL:   work.push_back(Value::Lbl((int32_t)otLookup(tk.v))); break;
            case T_VAR: {
                auto it = vars.find(tk.v);
                work.push_back(it != vars.end() ? it->second : Value::Int(0));
                break;
            }
            case T_MARK: {
                if (work.size() >= 2) {
                    Value r = work.back(); work.pop_back();
                    Value l = work.back(); work.pop_back();
                    work.push_back(applyCalc(tk.v, l, r));
                }
                break;
            }
            case T_SYSVAR: work.push_back(readSysvar(tk.v));         break;
            case T_INTFUNC:
            case T_EXTSYSVAR:
                work.push_back(Value::Int(0));
                break;
            default:
                work.push_back(Value::Int(tk.v));
                break;
            }
            if (exflg & EXFLG_0) break;
        }
        return work.empty() ? Value::Int(0) : work.back();
    }

    bool nextArgValid() {
        if (pc >= csWords) return false;
        uint16_t exflg = csU16(pc) & (EXFLG_0 | EXFLG_1 | EXFLG_2 | EXFLG_3);
        return (exflg & EXFLG_1) == 0;
    }

    std::vector<Value> collectArgs() {
        std::vector<Value> args;
        while (nextArgValid()) args.push_back(evalExpression());
        return args;
    }

    Value readSysvar(int32_t id) const {
        switch (id) {
        case 0x004:  // cnt
            return Value::Int(loops.empty() ? 0 : loops.back().cnt);
        case 0x002:  // hspver
            return Value::Int(0x3600);
        }
        return Value::Int(0);
    }

    Value applyCalc(int32_t op, const Value& l, const Value& r) {
        bool bothInt = (l.kind == Value::INT && r.kind == Value::INT);
        if (bothInt) {
            int32_t a = l.asInt(), b = r.asInt();
            switch (op) {
            case 0:  return Value::Int(a + b);
            case 1:  return Value::Int(a - b);
            case 2:  return Value::Int(a * b);
            case 3:  return Value::Int(b == 0 ? 0 : a / b);
            case 4:  return Value::Int(b == 0 ? 0 : a % b);
            case 5:  return Value::Int(a & b);
            case 6:  return Value::Int(a | b);
            case 7:  return Value::Int(a ^ b);
            case 8:  return Value::Int(a == b);
            case 9:  return Value::Int(a != b);
            case 10: return Value::Int(a >  b);
            case 11: return Value::Int(a <  b);
            case 12: return Value::Int(a >= b);
            case 13: return Value::Int(a <= b);
            case 14: return Value::Int(a >> b);
            case 15: return Value::Int(a << b);
            }
            return Value::Int(0);
        }
        // 文字列連結 (+ のみ)
        if (op == 0) {
            if (l.kind == Value::STRING || r.kind == Value::STRING) {
                return Value::Str(l.asString() + r.asString());
            }
        }
        double a = l.asDouble(), b = r.asDouble();
        switch (op) {
        case 0:  return Value::Dbl(a + b);
        case 1:  return Value::Dbl(a - b);
        case 2:  return Value::Dbl(a * b);
        case 3:  return Value::Dbl(b == 0 ? 0 : a / b);
        case 8:  return Value::Int(a == b);
        case 9:  return Value::Int(a != b);
        case 10: return Value::Int(a >  b);
        case 11: return Value::Int(a <  b);
        case 12: return Value::Int(a >= b);
        case 13: return Value::Int(a <= b);
        }
        return Value::Dbl(0);
    }

    // ---- 1 文を実行

    bool execStatement() {
        if (pc >= csWords) { halted = true; return false; }
        Token tk = fetchToken(pc);
        if ((tk.exflg & EXFLG_1) == 0) {
            pc += tk.adv;
            return true;
        }
        pc += tk.adv;
        step++;
        switch (tk.t) {
        case T_VAR:    execAssignment(tk.v);          break;
        case T_PROGCMD:execProgCmd(tk.v);             break;
        case T_INTCMD:
        case T_EXTCMD: execExtCmd(tk.v);              break;
        case T_CMPCMD: execCmpCmd(tk.v);              break;
        default:       collectArgs();                 break;
        }
        return !yielded;
    }

    void execAssignment(int32_t varIdx) {
        if (pc >= csWords) return;
        Token tk = fetchToken(pc);
        pc += tk.adv;
        Value v = evalExpression();
        if (tk.t != T_MARK) { vars[varIdx] = v; return; }
        Value cur = vars.count(varIdx) ? vars[varIdx] : Value::Int(0);
        switch (tk.v) {
        case 8: vars[varIdx] = v; break;
        case 0: vars[varIdx] = applyCalc(0, cur, v); break;
        case 1: vars[varIdx] = applyCalc(1, cur, v); break;
        case 2: vars[varIdx] = applyCalc(2, cur, v); break;
        case 3: vars[varIdx] = applyCalc(3, cur, v); break;
        default: vars[varIdx] = v; break;
        }
    }

    Value peekArgIfLabel() {
        if (pc >= csWords) return Value::Int(-1);
        Token tk = fetchToken(pc);
        if (tk.t == T_LABEL) {
            pc += tk.adv;
            return Value::Lbl((int32_t)otLookup(tk.v));
        }
        return Value::Int(-1);
    }

    void execProgCmd(int32_t id) {
        switch (id) {
        case 0x00: {  // goto
            std::vector<Value> args = collectArgs();
            if (!args.empty() && args[0].kind == Value::LABEL) pc = (size_t)args[0].iv;
            break;
        }
        case 0x01: {  // gosub
            std::vector<Value> args = collectArgs();
            if (!args.empty() && args[0].kind == Value::LABEL) {
                callStack.push_back(pc);
                pc = (size_t)args[0].iv;
            }
            break;
        }
        case 0x02:    // return
            collectArgs();
            if (!callStack.empty()) { pc = callStack.back(); callStack.pop_back(); }
            else halted = true;
            break;
        case 0x03:    // break
            collectArgs();
            if (!loops.empty()) { pc = loops.back().endPC; loops.pop_back(); }
            break;
        case 0x04: {  // repeat
            size_t breakTarget = csWords;
            Value lab = peekArgIfLabel();
            if (lab.kind == Value::LABEL) breakTarget = (size_t)lab.iv;
            int32_t countArg = nextArgValid() ? evalExpression().asInt() : -1;
            int32_t limit = (countArg < 0) ? 0 : countArg;
            collectArgs();  // start cnt 引数 (使用しない)
            if (countArg == 0) { pc = breakTarget; return; }
            LoopFrame f;
            f.startPC = pc; f.cnt = 0; f.limit = limit; f.endPC = breakTarget;
            loops.push_back(f);
            break;
        }
        case 0x05: {  // loop
            collectArgs();
            if (!loops.empty()) {
                LoopFrame f = loops.back(); loops.pop_back();
                f.cnt++;
                if (f.limit > 0 && f.cnt >= f.limit) {
                    // ループ終了
                } else {
                    pc = f.startPC;
                    loops.push_back(f);
                }
            }
            break;
        }
        case 0x06:    // continue
            collectArgs();
            if (!loops.empty()) pc = loops.back().startPC;
            break;
        case 0x07:    // wait
        case 0x08:    // await
            collectArgs();
            yielded = true;
            break;
        case 0x10:    // end
        case 0x11:    // stop
            collectArgs();
            halted = true;
            break;
        default:
            collectArgs();
            break;
        }
    }

    void execCmpCmd(int32_t id) {
        if (pc >= csWords) return;
        size_t skipOffset = (size_t)csU16(pc);
        pc += 1;
        size_t jumpTarget = pc + skipOffset;
        if (id == 0) {
            Value cond = evalExpression();
            if (!cond.isTrue()) pc = jumpTarget;
        } else {
            pc = jumpTarget;
        }
    }

    void execExtCmd(int32_t id) {
        std::vector<Value> args = collectArgs();
        switch (id) {
        case 0x00f: {  // mes / print
            DrawOp op; op.kind = DrawOp::TEXT;
            op.x = curX; op.y = curY;
            op.s = args.empty() ? "" : args[0].asString();
            op.size = fontSize;
            op.r = colR; op.g = colG; op.b = colB;
            drawOps.push_back(op);
            curY += fontSize + 4;
            break;
        }
        case 0x011: {  // pos
            curX = args.size() > 0 ? args[0].asDouble() : 0;
            curY = args.size() > 1 ? args[1].asDouble() : 0;
            DrawOp op; op.kind = DrawOp::SETPOS; op.x = curX; op.y = curY;
            drawOps.push_back(op);
            break;
        }
        case 0x013: {  // cls
            drawOps.clear();
            DrawOp op; op.kind = DrawOp::CLEAR; op.r = 0; op.g = 0; op.b = 0;
            drawOps.push_back(op);
            curX = 8; curY = 8; colR = 1; colG = 1; colB = 1;
            break;
        }
        case 0x014:  // font name, size, style
            if (args.size() > 1) fontSize = args[1].asDouble();
            break;
        case 0x018: {  // color R, G, B
            colR = (args.size() > 0 ? args[0].asDouble() : 255) / 255.0;
            colG = (args.size() > 1 ? args[1].asDouble() : 255) / 255.0;
            colB = (args.size() > 2 ? args[2].asDouble() : 255) / 255.0;
            DrawOp op; op.kind = DrawOp::SETCOLOR; op.r = colR; op.g = colG; op.b = colB;
            drawOps.push_back(op);
            break;
        }
        case 0x031: {  // boxf x1, y1, x2, y2
            double x1 = args.size() > 0 ? args[0].asDouble() : 0;
            double y1 = args.size() > 1 ? args[1].asDouble() : 0;
            double x2 = args.size() > 2 ? args[2].asDouble() : 0;
            double y2 = args.size() > 3 ? args[3].asDouble() : 0;
            DrawOp op; op.kind = DrawOp::BOXF;
            op.x = (x1 < x2) ? x1 : x2;
            op.y = (y1 < y2) ? y1 : y2;
            op.w = (x2 > x1) ? (x2 - x1) : (x1 - x2);
            op.h = (y2 > y1) ? (y2 - y1) : (y1 - y2);
            op.r = colR; op.g = colG; op.b = colB;
            drawOps.push_back(op);
            break;
        }
        case 0x02f: {  // line
            DrawOp op; op.kind = DrawOp::LINE;
            op.r = colR; op.g = colG; op.b = colB;
            if (args.size() >= 4) {
                op.x = args[0].asDouble(); op.y = args[1].asDouble();
                op.w = args[2].asDouble(); op.h = args[3].asDouble();   // x2/y2 を w/h slot に流用
            } else if (args.size() >= 2) {
                op.x = curX; op.y = curY;
                op.w = args[0].asDouble(); op.h = args[1].asDouble();
                curX = op.w; curY = op.h;
            } else break;
            drawOps.push_back(op);
            break;
        }
        case 0x00c: {  // pset x, y
            DrawOp op; op.kind = DrawOp::PSET;
            op.x = args.size() > 0 ? args[0].asDouble() : 0;
            op.y = args.size() > 1 ? args[1].asDouble() : 0;
            op.r = colR; op.g = colG; op.b = colB;
            drawOps.push_back(op);
            break;
        }
        case 0x01b:  // redraw — no-op (frame 末で表示)
            break;
        }
    }
};

// ---------------------------------------------------------------- Win32 viewer

static const int CANVAS_W = 200;        // Apple Watch S11 46mm 相当 (pt)
static const int CANVAS_H = 250;
static const int SCALE = 2;             // pixel scale (2x で見やすく)
static const int WIN_W = CANVAS_W * SCALE;
static const int WIN_H = CANVAS_H * SCALE;

static HSPRuntime g_rt;
static std::wstring g_axPath;

static std::vector<uint8_t> loadFile(const std::wstring& path) {
    std::ifstream f(path, std::ios::binary);
    if (!f) return {};
    f.seekg(0, std::ios::end);
    size_t n = (size_t)f.tellg();
    f.seekg(0, std::ios::beg);
    std::vector<uint8_t> buf(n);
    f.read((char*)buf.data(), n);
    return buf;
}

static void renderToDC(HDC hdc, int width, int height) {
    // 背景塗り (ops の最初が CLEAR でなければ黒で塗る)
    bool hasClear = !g_rt.drawOps.empty() && g_rt.drawOps[0].kind == DrawOp::CLEAR;
    if (!hasClear) {
        HBRUSH bg = CreateSolidBrush(RGB(0, 0, 0));
        RECT r{0, 0, width, height};
        FillRect(hdc, &r, bg);
        DeleteObject(bg);
    }
    SetBkMode(hdc, TRANSPARENT);

    COLORREF curCol = RGB(255, 255, 255);

    for (const DrawOp& op : g_rt.drawOps) {
        switch (op.kind) {
        case DrawOp::CLEAR: {
            HBRUSH br = CreateSolidBrush(
                RGB((BYTE)(op.r * 255), (BYTE)(op.g * 255), (BYTE)(op.b * 255)));
            RECT r{0, 0, width, height};
            FillRect(hdc, &r, br);
            DeleteObject(br);
            break;
        }
        case DrawOp::SETCOLOR:
            curCol = RGB((BYTE)(op.r * 255), (BYTE)(op.g * 255), (BYTE)(op.b * 255));
            break;
        case DrawOp::BOXF: {
            HBRUSH br = CreateSolidBrush(curCol);
            RECT r{
                (int)(op.x * SCALE), (int)(op.y * SCALE),
                (int)((op.x + op.w) * SCALE), (int)((op.y + op.h) * SCALE)};
            FillRect(hdc, &r, br);
            DeleteObject(br);
            break;
        }
        case DrawOp::LINE: {
            HPEN pen = CreatePen(PS_SOLID, 1, curCol);
            HPEN old = (HPEN)SelectObject(hdc, pen);
            MoveToEx(hdc, (int)(op.x * SCALE), (int)(op.y * SCALE), nullptr);
            LineTo  (hdc, (int)(op.w * SCALE), (int)(op.h * SCALE));
            SelectObject(hdc, old);
            DeleteObject(pen);
            break;
        }
        case DrawOp::PSET:
            SetPixel(hdc, (int)(op.x * SCALE), (int)(op.y * SCALE), curCol);
            break;
        case DrawOp::TEXT: {
            int sz = (int)(op.size * SCALE);
            HFONT font = CreateFontA(
                -sz, 0, 0, 0, FW_NORMAL, FALSE, FALSE, FALSE,
                DEFAULT_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
                DEFAULT_QUALITY, DEFAULT_PITCH | FF_DONTCARE, "Yu Gothic UI");
            HFONT old = (HFONT)SelectObject(hdc, font);
            SetTextColor(hdc, curCol);
            // op.s は UTF-8。MultiByteToWideChar で変換。
            int wlen = MultiByteToWideChar(CP_UTF8, 0, op.s.c_str(), -1, nullptr, 0);
            std::wstring ws(wlen, 0);
            MultiByteToWideChar(CP_UTF8, 0, op.s.c_str(), -1, &ws[0], wlen);
            if (!ws.empty() && ws.back() == 0) ws.pop_back();
            TextOutW(hdc, (int)(op.x * SCALE), (int)(op.y * SCALE),
                     ws.c_str(), (int)ws.size());
            SelectObject(hdc, old);
            DeleteObject(font);
            break;
        }
        case DrawOp::SETPOS:
            break;
        }
    }

    // status overlay
    {
        char buf[128];
        snprintf(buf, sizeof(buf), "step=%d ops=%zu pc=%s",
                 g_rt.step, g_rt.drawOps.size(),
                 g_rt.isHalted() ? "halted" : "running");
        SetTextColor(hdc, RGB(128, 128, 128));
        HFONT font = CreateFontA(
            -10 * SCALE, 0, 0, 0, FW_NORMAL, FALSE, FALSE, FALSE,
            DEFAULT_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
            DEFAULT_QUALITY, DEFAULT_PITCH | FF_DONTCARE, "Consolas");
        HFONT old = (HFONT)SelectObject(hdc, font);
        TextOutA(hdc, 4, height - 16 * SCALE, buf, (int)strlen(buf));
        SelectObject(hdc, old);
        DeleteObject(font);
    }
}

LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {
    static HBITMAP backbuf = nullptr;
    static HDC     bbdc    = nullptr;

    switch (msg) {
    case WM_CREATE: {
        SetTimer(hwnd, 1, 33, nullptr);   // 30Hz
        HDC hdc = GetDC(hwnd);
        backbuf = CreateCompatibleBitmap(hdc, WIN_W, WIN_H);
        bbdc    = CreateCompatibleDC(hdc);
        SelectObject(bbdc, backbuf);
        ReleaseDC(hwnd, hdc);
        return 0;
    }
    case WM_TIMER:
        if (!g_rt.isHalted()) {
            g_rt.runFrame();
            InvalidateRect(hwnd, nullptr, FALSE);
        }
        return 0;
    case WM_KEYDOWN:
        if (wp == VK_F5) {
            // Reload .ax
            std::vector<uint8_t> data = loadFile(g_axPath);
            if (g_rt.load(data)) InvalidateRect(hwnd, nullptr, TRUE);
        } else if (wp == VK_ESCAPE) {
            DestroyWindow(hwnd);
        }
        return 0;
    case WM_PAINT: {
        PAINTSTRUCT ps;
        HDC hdc = BeginPaint(hwnd, &ps);
        renderToDC(bbdc, WIN_W, WIN_H);
        BitBlt(hdc, 0, 0, WIN_W, WIN_H, bbdc, 0, 0, SRCCOPY);
        EndPaint(hwnd, &ps);
        return 0;
    }
    case WM_DESTROY:
        if (bbdc) DeleteDC(bbdc);
        if (backbuf) DeleteObject(backbuf);
        PostQuitMessage(0);
        return 0;
    }
    return DefWindowProc(hwnd, msg, wp, lp);
}

int wmain(int argc, wchar_t** argv) {
    g_axPath = (argc >= 2) ? std::wstring(argv[1])
                           : L"../ios/template/Watch/Resources/demo.ax";
    std::vector<uint8_t> data = loadFile(g_axPath);
    if (data.empty()) {
        wprintf(L"failed to open: %ls\n", g_axPath.c_str());
        return 1;
    }
    if (!g_rt.load(data)) {
        wprintf(L"invalid .ax (HSPHED magic mismatch?): %ls\n", g_axPath.c_str());
        return 2;
    }
    wprintf(L"loaded: %ls (%zu bytes)\n", g_axPath.c_str(), data.size());

    HINSTANCE hInst = GetModuleHandle(nullptr);
    WNDCLASSEXW wc{};
    wc.cbSize        = sizeof(wc);
    wc.lpfnWndProc   = WndProc;
    wc.hInstance     = hInst;
    wc.hCursor       = LoadCursor(nullptr, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)GetStockObject(BLACK_BRUSH);
    wc.lpszClassName = L"HSP3WatchWnd";
    // hsp3watch.rc の IDI_MAIN (= 1) を埋め込み済アイコンから読む
    wc.hIcon         = LoadIconW(hInst, MAKEINTRESOURCEW(1));
    wc.hIconSm       = (HICON)LoadImageW(hInst, MAKEINTRESOURCEW(1),
                                         IMAGE_ICON, 16, 16, LR_DEFAULTCOLOR);
    RegisterClassExW(&wc);

    RECT rc{0, 0, WIN_W, WIN_H};
    AdjustWindowRect(&rc, WS_OVERLAPPEDWINDOW, FALSE);
    HWND hwnd = CreateWindowW(
        L"HSP3WatchWnd", L"hsp3watch",
        WS_OVERLAPPEDWINDOW,
        CW_USEDEFAULT, CW_USEDEFAULT,
        rc.right - rc.left, rc.bottom - rc.top,
        nullptr, nullptr, hInst, nullptr);
    ShowWindow(hwnd, SW_SHOW);
    UpdateWindow(hwnd);

    MSG msg;
    while (GetMessage(&msg, nullptr, 0, 0) > 0) {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }
    return (int)msg.wParam;
}
