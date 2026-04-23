//-----------------------------------------------------------------------------
//
//  DxDxbcTranslator.cpp — DXBC → GLSL 最小翻訳実装
//
//  参考資料:
//    - https://github.com/James-Jones/HLSLCrossCompiler (MIT, SM 4/5)
//    - DirectX Shader Compiler (MIT, DXIL documentation)
//    - Microsoft DirectX Graphics Infrastructure doc
//
//  実装範囲 (Phase 1 + 最小 Phase 2):
//    [OK]    container (magic/checksum/chunks walk)
//    [OK]    ISGN / OSGN (input/output signatures)
//    [OK]    RDEF (constant buffer 宣言の外殻)
//    [OK]    SHDR (version token) + 命令トークンの長さベース walk
//    [OK]    declaration tokens:
//               dcl_globalFlags / dcl_constantBuffer / dcl_sampler /
//               dcl_resource / dcl_input[_ps][_siv/_sgv] /
//               dcl_output[_siv/_sgv] / dcl_temps
//    [OK]    命令翻訳: mov, add, sub, mul, mad, div, min, max,
//               dp2/dp3/dp4, sqrt, rsq, rcp, log, exp, sin, cos,
//               ftoi, ftou, itof, utof, sample, sample_l, ret
//    [TODO]  制御フロー (if/else/loop/break/switch) — 出現したら -2 + TODO コメント
//    [TODO]  immediate constant buffer (literal 配列) — 全 literal を並べて初期化
//    [TODO]  geometry / hull / domain / compute shader — 未対応
//
//-----------------------------------------------------------------------------

#include "DxDxbcTranslator.h"

#include <cstdio>
#include <cstdint>
#include <cstring>
#include <cstdlib>
#include <vector>
#include <string>
#include <sstream>

// ===========================================================================
//  DXBC container parser
// ===========================================================================

namespace {

constexpr uint32_t fourcc( const char *s )
{
    return ( uint32_t )( uint8_t )s[0]
         | ( ( uint32_t )( uint8_t )s[1] <<  8 )
         | ( ( uint32_t )( uint8_t )s[2] << 16 )
         | ( ( uint32_t )( uint8_t )s[3] << 24 ) ;
}
const uint32_t FOUR_DXBC = fourcc( "DXBC" ) ;
const uint32_t FOUR_ISGN = fourcc( "ISGN" ) ;
const uint32_t FOUR_OSGN = fourcc( "OSGN" ) ;
const uint32_t FOUR_RDEF = fourcc( "RDEF" ) ;
const uint32_t FOUR_SHDR = fourcc( "SHDR" ) ;
const uint32_t FOUR_SHEX = fourcc( "SHEX" ) ;
const uint32_t FOUR_ISG1 = fourcc( "ISG1" ) ;
const uint32_t FOUR_OSG1 = fourcc( "OSG1" ) ;

struct Chunk {
    uint32_t fourcc ;
    const uint8_t *data ;
    uint32_t       size ;
} ;

struct Signature {
    std::string semantic_name ;
    uint32_t    semantic_index ;
    uint32_t    system_value ;  // 1 = SV_POSITION, 0 = Undefined, etc.
    uint32_t    component_type ; // 1 = uint, 2 = int, 3 = float
    uint32_t    reg_index ;
    uint8_t     mask ;
    uint8_t     rw_mask ;
} ;

struct DxbcData {
    // Container
    std::vector<Chunk> chunks ;
    // SHDR / SHEX
    const uint8_t *shdr_data = nullptr ;
    uint32_t       shdr_size = 0 ;
    uint32_t       sm_major  = 0 ;
    uint32_t       sm_minor  = 0 ;
    uint32_t       program_type = 0 ; // 0=PS, 1=VS, 2=GS, 3=HS, 4=DS, 5=CS
    // Signatures
    std::vector<Signature> inputs  ;
    std::vector<Signature> outputs ;
} ;

static uint32_t read_u32( const uint8_t *p ) {
    return ( uint32_t )p[0] | ( ( uint32_t )p[1] << 8 )
         | ( ( uint32_t )p[2] << 16 ) | ( ( uint32_t )p[3] << 24 ) ;
}

// Parse container: DXBC magic + 16B digest + u32 version + u32 total_size +
// u32 chunk_count + u32[chunk_count] chunk_offsets
static int parse_container( const void *data, int size, DxbcData &out )
{
    if ( size < 32 ) return -1 ;
    const uint8_t *p = ( const uint8_t * )data ;
    if ( read_u32( p ) != FOUR_DXBC ) return -1 ;
    uint32_t total = read_u32( p + 24 ) ;
    if ( ( int )total != size ) {
        // total size が合わない (truncated / 拡張 chunk) — 警告のみで continue
    }
    uint32_t nchunks = read_u32( p + 28 ) ;
    if ( nchunks > 64 ) return -1 ;  // sanity
    if ( ( int )( 32 + nchunks * 4 ) > size ) return -1 ;
    for ( uint32_t i = 0 ; i < nchunks ; i++ ) {
        uint32_t ofs = read_u32( p + 32 + i * 4 ) ;
        if ( ( int )( ofs + 8 ) > size ) return -1 ;
        const uint8_t *cp = p + ofs ;
        Chunk c ;
        c.fourcc = read_u32( cp ) ;
        c.size   = read_u32( cp + 4 ) ;
        c.data   = cp + 8 ;
        if ( ( int )( ofs + 8 + c.size ) > size ) return -1 ;
        out.chunks.push_back( c ) ;
    }
    return 0 ;
}

// Parse signature chunk (ISGN / OSGN). Element = 6 u32 (24 bytes) + shared
// string pool pointed to by u32 offsets (relative to chunk data start).
static int parse_signature( const Chunk &c, std::vector<Signature> &out )
{
    if ( c.size < 8 ) return -1 ;
    uint32_t n     = read_u32( c.data ) ;
    uint32_t reserved = read_u32( c.data + 4 ) ; (void)reserved ;
    if ( n > 32 ) return -1 ;
    const uint8_t *el = c.data + 8 ;
    if ( el + n * 24 > c.data + c.size ) return -1 ;
    for ( uint32_t i = 0 ; i < n ; i++ ) {
        Signature s ;
        uint32_t name_ofs = read_u32( el + 0 ) ;
        s.semantic_index  = read_u32( el + 4 ) ;
        s.system_value    = read_u32( el + 8 ) ;
        s.component_type  = read_u32( el + 12 ) ;
        s.reg_index       = read_u32( el + 16 ) ;
        s.mask            = ( uint8_t )( el[ 20 ] ) ;
        s.rw_mask         = ( uint8_t )( el[ 21 ] ) ;
        // Resolve semantic name (NUL-terminated string at c.data + name_ofs)
        if ( name_ofs < c.size ) {
            const char *name = ( const char * )( c.data + name_ofs ) ;
            // Safe until end of chunk
            size_t maxlen = c.size - name_ofs ;
            size_t nl = 0 ;
            while ( nl < maxlen && name[ nl ] ) nl++ ;
            s.semantic_name.assign( name, nl ) ;
        }
        out.push_back( s ) ;
        el += 24 ;
    }
    return 0 ;
}

// Parse SHDR / SHEX header: u32 version, u32 length
static int parse_shdr_header( const Chunk &c, DxbcData &out )
{
    if ( c.size < 8 ) return -1 ;
    uint32_t ver = read_u32( c.data ) ;
    uint32_t len_dwords = read_u32( c.data + 4 ) ;
    out.sm_minor    = ( ver >>  0 ) & 0xf ;
    out.sm_major    = ( ver >>  4 ) & 0xf ;
    out.program_type = ( ver >> 16 ) & 0xffff ;
    // token stream starts at c.data + 8 and lasts (len_dwords - 2) DWORDs
    out.shdr_data = c.data + 8 ;
    if ( len_dwords < 2 ) return -1 ;
    out.shdr_size = ( len_dwords - 2 ) * 4 ;
    if ( out.shdr_size + 8 > c.size ) return -1 ;
    return 0 ;
}

// ===========================================================================
//  Token walker + disassembler
// ===========================================================================

// Opcode types (instruction token opcode field, 11 bits)
enum OpcodeType {
    OP_ADD = 0x00, OP_AND = 0x01, OP_BREAK = 0x02, OP_BREAKC = 0x03,
    OP_CALL = 0x04, OP_CALLC = 0x05, OP_CASE = 0x06, OP_CONTINUE = 0x07,
    OP_CONTINUEC = 0x08, OP_CUT = 0x09, OP_DEFAULT = 0x0A,
    OP_DERIV_RTX = 0x0B, OP_DERIV_RTY = 0x0C, OP_DISCARD = 0x0D,
    OP_DIV = 0x0E, OP_DP2 = 0x0F, OP_DP3 = 0x10, OP_DP4 = 0x11,
    OP_ELSE = 0x12, OP_EMIT = 0x13, OP_EMITTHENCUT = 0x14,
    OP_ENDIF = 0x15, OP_ENDLOOP = 0x16, OP_ENDSWITCH = 0x17,
    OP_EQ = 0x18, OP_EXP = 0x19, OP_FRC = 0x1A, OP_FTOI = 0x1B,
    OP_FTOU = 0x1C, OP_GE = 0x1D, OP_IADD = 0x1E, OP_IF = 0x1F,
    OP_IEQ = 0x20, OP_IGE = 0x21, OP_ILT = 0x22, OP_IMAD = 0x23,
    OP_IMAX = 0x24, OP_IMIN = 0x25, OP_IMUL = 0x26, OP_INE = 0x27,
    OP_INEG = 0x28, OP_ISHL = 0x29, OP_ISHR = 0x2A, OP_ITOF = 0x2B,
    OP_LABEL = 0x2C, OP_LD = 0x2D, OP_LD_MS = 0x2E, OP_LOG = 0x2F,
    OP_LOOP = 0x30, OP_LT = 0x31, OP_MAD = 0x32, OP_MIN = 0x33,
    OP_MAX = 0x34, OP_CUSTOMDATA = 0x35, OP_MOV = 0x36, OP_MOVC = 0x37,
    OP_MUL = 0x38, OP_NE = 0x39, OP_NOP = 0x3A, OP_NOT = 0x3B,
    OP_OR = 0x3C, OP_RESINFO = 0x3D, OP_RET = 0x3E, OP_RETC = 0x3F,
    OP_ROUND_NE = 0x40, OP_ROUND_NI = 0x41, OP_ROUND_PI = 0x42,
    OP_ROUND_Z = 0x43, OP_RSQ = 0x44, OP_SAMPLE = 0x45, OP_SAMPLE_C = 0x46,
    OP_SAMPLE_C_LZ = 0x47, OP_SAMPLE_L = 0x48, OP_SAMPLE_D = 0x49,
    OP_SAMPLE_B = 0x4A, OP_SQRT = 0x4B, OP_SWITCH = 0x4C, OP_SINCOS = 0x4D,
    OP_UDIV = 0x4E, OP_ULT = 0x4F, OP_UGE = 0x50, OP_UMUL = 0x51,
    OP_UMAD = 0x52, OP_UMAX = 0x53, OP_UMIN = 0x54, OP_USHR = 0x55,
    OP_UTOF = 0x56, OP_XOR = 0x57,
    OP_DCL_RESOURCE         = 0x58, OP_DCL_CONSTANT_BUFFER = 0x59,
    OP_DCL_SAMPLER          = 0x5A, OP_DCL_INDEX_RANGE     = 0x5B,
    OP_DCL_GS_OUTPUT_PRIMITIVE_TOPOLOGY = 0x5C,
    OP_DCL_GS_INPUT_PRIMITIVE = 0x5D,
    OP_DCL_MAX_OUTPUT_VERTEX_COUNT = 0x5E,
    OP_DCL_INPUT            = 0x5F, OP_DCL_INPUT_SGV       = 0x60,
    OP_DCL_INPUT_SIV        = 0x61, OP_DCL_INPUT_PS        = 0x62,
    OP_DCL_INPUT_PS_SGV     = 0x63, OP_DCL_INPUT_PS_SIV    = 0x64,
    OP_DCL_OUTPUT           = 0x65, OP_DCL_OUTPUT_SGV      = 0x66,
    OP_DCL_OUTPUT_SIV       = 0x67, OP_DCL_TEMPS           = 0x68,
    OP_DCL_INDEXABLE_TEMP   = 0x69, OP_DCL_GLOBAL_FLAGS    = 0x6A
} ;

// Operand types (8 bits)
enum OperandType {
    OPT_TEMP = 0x00, OPT_INPUT = 0x01, OPT_OUTPUT = 0x02,
    OPT_INDEXABLE_TEMP = 0x03, OPT_IMMEDIATE32 = 0x04,
    OPT_IMMEDIATE64 = 0x05, OPT_SAMPLER = 0x06, OPT_RESOURCE = 0x07,
    OPT_CONSTANT_BUFFER = 0x08, OPT_IMMEDIATE_CONSTANT_BUFFER = 0x09,
    OPT_LABEL = 0x0A, OPT_INPUT_PRIMITIVEID = 0x0B,
    OPT_OUTPUT_DEPTH = 0x0C, OPT_NULL = 0x0D, OPT_RASTERIZER = 0x0E,
    OPT_OUTPUT_COVERAGE_MASK = 0x0F
} ;

struct Operand {
    int      num_components ;  // 0, 1, or 2 (2 = 4D)
    int      selection_mode ;  // 0 = mask, 1 = swizzle, 2 = select_1
    uint8_t  mask ;            // bit0=x, bit1=y, bit2=z, bit3=w
    uint8_t  swiz[4] ;         // for swizzle: component indices (0..3)
    uint8_t  select_1 ;        // for select_1 mode: 0..3
    int      operand_type ;
    int      index_dim ;       // 0..3
    int      index_repr[3] ;   // for each dim: 0=immediate32, 1=imm64, 2=relative...
    uint32_t imm_index[3] ;    // immediate index values
    uint32_t imm32[4] ;        // for OPT_IMMEDIATE32: raw 32-bit words
    int      extended_present ;
    uint32_t ext_token ;       // extended modifier token (abs/neg etc.)
} ;

struct Instruction {
    int           opcode ;
    int           length_in_tokens ;  // incl. opcode token
    int           saturate ;          // instruction-specific
    // Declaration-specific payloads
    uint32_t      dcl_u0, dcl_u1, dcl_u2 ;
    // Operand list (up to 6)
    std::vector<Operand> operands ;
} ;

// Parse a single operand (variable-length token). Returns number of 32-bit
// tokens consumed, or -1 on error.
static int parse_operand( const uint32_t *toks, int max_toks, Operand &op )
{
    if ( max_toks < 1 ) return -1 ;
    uint32_t t0 = toks[ 0 ] ;
    op.num_components = ( t0 >> 0 ) & 0x3 ;
    op.selection_mode = ( t0 >> 2 ) & 0x3 ;
    if ( op.num_components == 2 ) {  // 4-component
        if ( op.selection_mode == 0 ) {
            op.mask = ( t0 >> 4 ) & 0xf ;
        } else if ( op.selection_mode == 1 ) {
            for ( int i = 0 ; i < 4 ; i++ ) {
                op.swiz[ i ] = ( uint8_t )( ( t0 >> ( 4 + i * 2 ) ) & 0x3 ) ;
            }
            op.mask = 0xf ;  // swizzle uses all comps
        } else if ( op.selection_mode == 2 ) {
            op.select_1 = ( uint8_t )( ( t0 >> 4 ) & 0x3 ) ;
            op.mask = ( uint8_t )( 1 << op.select_1 ) ;
        }
    } else {
        op.mask = 0x1 ;
        op.swiz[0] = op.swiz[1] = op.swiz[2] = op.swiz[3] = 0 ;
    }
    op.operand_type = ( t0 >> 12 ) & 0xff ;
    op.index_dim    = ( t0 >> 20 ) & 0x3 ;
    op.index_repr[0] = ( t0 >> 22 ) & 0x7 ;
    op.index_repr[1] = ( t0 >> 25 ) & 0x7 ;
    op.index_repr[2] = ( t0 >> 28 ) & 0x7 ;
    op.extended_present = ( t0 >> 31 ) & 0x1 ;

    int cur = 1 ;
    op.ext_token = 0 ;
    if ( op.extended_present ) {
        if ( cur >= max_toks ) return -1 ;
        op.ext_token = toks[ cur++ ] ;
    }

    // Read indices
    for ( int i = 0 ; i < op.index_dim ; i++ ) {
        int repr = op.index_repr[ i ] ;
        if ( repr == 0 ) {      // immediate32
            if ( cur >= max_toks ) return -1 ;
            op.imm_index[ i ] = toks[ cur++ ] ;
        } else if ( repr == 1 ) { // immediate64
            if ( cur + 2 > max_toks ) return -1 ;
            op.imm_index[ i ] = toks[ cur++ ] ;  // low 32 bits
            cur++ ;  // skip high
        } else if ( repr == 2 ) { // relative (r0.x + ...)
            // Read nested relative operand — for simplicity, advance past it
            Operand nest ;
            int consumed = parse_operand( toks + cur, max_toks - cur, nest ) ;
            if ( consumed < 0 ) return -1 ;
            cur += consumed ;
            op.imm_index[ i ] = 0 ;
        } else if ( repr == 3 ) { // immediate + relative
            if ( cur >= max_toks ) return -1 ;
            op.imm_index[ i ] = toks[ cur++ ] ;
            Operand nest ;
            int consumed = parse_operand( toks + cur, max_toks - cur, nest ) ;
            if ( consumed < 0 ) return -1 ;
            cur += consumed ;
        }
    }

    // If operand is IMMEDIATE32, read 4 u32s (component data)
    if ( op.operand_type == OPT_IMMEDIATE32 ) {
        int nc = ( op.num_components == 2 ) ? 4 : 1 ;
        if ( cur + nc > max_toks ) return -1 ;
        for ( int i = 0 ; i < nc ; i++ ) op.imm32[ i ] = toks[ cur++ ] ;
        for ( int i = nc ; i < 4 ; i++ ) op.imm32[ i ] = 0 ;
    }
    return cur ;
}

// Parse one instruction. Returns number of 32-bit tokens consumed (>= length),
// or -1 on error.
static int parse_instruction( const uint32_t *toks, int max_toks, Instruction &ins )
{
    if ( max_toks < 1 ) return -1 ;
    uint32_t t0 = toks[ 0 ] ;
    ins.opcode           = ( t0 >> 0 ) & 0x7ff ;
    ins.length_in_tokens = ( t0 >> 24 ) & 0x7f ;
    ins.saturate         = ( t0 >> 13 ) & 0x1 ;
    if ( ins.length_in_tokens == 0 ) {
        // Custom data blob — length is in next DWORD (for dcl_immediateConstantBuffer)
        if ( max_toks < 2 ) return -1 ;
        return ( int )toks[ 1 ] ;  // skip whole blob
    }
    if ( ins.length_in_tokens > max_toks ) return -1 ;

    // declaration-specific fields are stored in opcode_specific bits of t0
    // + possible extra tokens. We save them as dcl_u0/u1/u2 from the next
    // raw tokens for simplicity (caller can inspect later).
    ins.dcl_u0 = ins.dcl_u1 = ins.dcl_u2 = 0 ;
    if ( ins.length_in_tokens >= 2 ) ins.dcl_u0 = toks[ 1 ] ;
    if ( ins.length_in_tokens >= 3 ) ins.dcl_u1 = toks[ 2 ] ;
    if ( ins.length_in_tokens >= 4 ) ins.dcl_u2 = toks[ 3 ] ;

    // Parse operands for non-declaration instructions.
    // Declarations have operand layouts that vary wildly; we parse the first
    // operand only (which is common: it's the register being declared).
    int is_decl = ins.opcode >= OP_DCL_RESOURCE && ins.opcode <= OP_DCL_GLOBAL_FLAGS ;
    int cur = 1 ;
    // skip extended tokens (bit 31 of token is "extended")
    while ( cur < ins.length_in_tokens && ( toks[ cur - 1 ] & 0x80000000u ) && cur < max_toks ) {
        // advance through extended instruction tokens
        // NOTE: extended present bit is on operand, not instruction. We relax.
        break ;
    }
    // For declarations, stop at first operand (or skip entirely for some like dcl_globalFlags)
    int max_operands = is_decl ? 2 : 6 ;
    while ( cur < ins.length_in_tokens && ( int )ins.operands.size() < max_operands ) {
        Operand op ;
        int consumed = parse_operand( toks + cur, ins.length_in_tokens - cur, op ) ;
        if ( consumed <= 0 ) break ;
        ins.operands.push_back( op ) ;
        cur += consumed ;
    }
    return ins.length_in_tokens ;
}

// ===========================================================================
//  Operand → GLSL string
// ===========================================================================

static const char kSwizChars[] = "xyzw" ;

// Operand register naming is context-sensitive:
//  VS: input v_N → attribute a_inN ; output o_N → varying v_varyN (or gl_Position)
//  PS: input v_N → varying v_varyN ; output o0 → gl_FragColor
static bool g_is_pixel_shader = false ;

// register name helper — produce GLSL-compatible ident for operand
static std::string operand_reg( const Operand &op )
{
    char buf[ 64 ] ;
    switch ( op.operand_type ) {
        case OPT_TEMP:
            std::snprintf( buf, sizeof buf, "r%u", op.imm_index[ 0 ] ) ;
            break ;
        case OPT_INPUT:
            if ( g_is_pixel_shader ) {
                std::snprintf( buf, sizeof buf, "v_vary%u", op.imm_index[ 0 ] ) ;
            } else {
                std::snprintf( buf, sizeof buf, "a_in%u", op.imm_index[ 0 ] ) ;
            }
            break ;
        case OPT_OUTPUT:
            // PS の OPT_OUTPUT は set_dst で gl_FragColor に置換されるので通らないはず。
            // VS の OPT_OUTPUT は set_dst 側で SV_POSITION/varying に分岐。
            std::snprintf( buf, sizeof buf, "v_vary%u", op.imm_index[ 0 ] ) ;
            break ;
        case OPT_CONSTANT_BUFFER:
            // cb[slot][index]. index_dim should be 2.
            std::snprintf( buf, sizeof buf, "cb%u[%u]",
                           op.imm_index[ 0 ], op.imm_index[ 1 ] ) ;
            break ;
        case OPT_SAMPLER:
            std::snprintf( buf, sizeof buf, "s%u", op.imm_index[ 0 ] ) ;
            break ;
        case OPT_RESOURCE:
            std::snprintf( buf, sizeof buf, "t%u", op.imm_index[ 0 ] ) ;
            break ;
        case OPT_IMMEDIATE32: {
            // write as vec4() or float depending on num_components
            // "%g" で 1.0 が "1" になると GLSL 厳格コンパイラで int 扱いになる
            // ことがあるため、小数点が無ければ ".0" を強制付加する小さい helper
            auto fmt_f = []( char *dst, size_t cap, float f ) {
                char tmp[ 32 ] ;
                std::snprintf( tmp, sizeof tmp, "%g", f ) ;
                bool has_dot = false ;
                for ( const char *p = tmp ; *p ; p++ ) {
                    if ( *p == '.' || *p == 'e' || *p == 'n' /*inf/nan*/ ) { has_dot = true ; break ; }
                }
                if ( has_dot ) std::snprintf( dst, cap, "%s",   tmp ) ;
                else           std::snprintf( dst, cap, "%s.0", tmp ) ;
            } ;
            if ( op.num_components == 2 ) {
                float v[ 4 ] ;
                std::memcpy( v, op.imm32, 16 ) ;
                char a[32], b2[32], c2[32], d2[32] ;
                fmt_f( a,  sizeof a,  v[0] ) ;
                fmt_f( b2, sizeof b2, v[1] ) ;
                fmt_f( c2, sizeof c2, v[2] ) ;
                fmt_f( d2, sizeof d2, v[3] ) ;
                std::snprintf( buf, sizeof buf, "vec4(%s,%s,%s,%s)", a, b2, c2, d2 ) ;
            } else {
                float f ;
                std::memcpy( &f, &op.imm32[ 0 ], 4 ) ;
                fmt_f( buf, sizeof buf, f ) ;
            }
            break ;
        }
        case OPT_NULL:
            std::snprintf( buf, sizeof buf, "/*null*/" ) ;
            break ;
        default:
            std::snprintf( buf, sizeof buf, "/*opt0x%x*/", op.operand_type ) ;
            break ;
    }
    return buf ;
}

// produce operand with swizzle (for source operands)
static std::string operand_src( const Operand &op )
{
    std::string s = operand_reg( op ) ;
    if ( op.operand_type == OPT_IMMEDIATE32 ) return s ;
    if ( op.num_components != 2 )             return s ;

    if ( op.selection_mode == 1 ) { // swizzle
        s += "." ;
        s += kSwizChars[ op.swiz[ 0 ] ] ;
        s += kSwizChars[ op.swiz[ 1 ] ] ;
        s += kSwizChars[ op.swiz[ 2 ] ] ;
        s += kSwizChars[ op.swiz[ 3 ] ] ;
    } else if ( op.selection_mode == 2 ) {
        // select_1 mode: DXBC intent は「選択した成分を 4 成分に broadcast」。
        // GLSL の vec4 context で使えるように .cccc (4 回繰り返し) で出す。
        // scalar 専用 context (比較や if の条件) では caller が (..).x で extract する
        s += "." ;
        for ( int i = 0 ; i < 4 ; i++ ) s += kSwizChars[ op.select_1 ] ;
    } else if ( op.selection_mode == 0 ) {
        // mask mode on source is rare; take mask bits as .xyzw subset
        std::string sw ;
        for ( int i = 0 ; i < 4 ; i++ )
            if ( op.mask & ( 1 << i ) ) sw += kSwizChars[ i ] ;
        if ( !sw.empty() && sw.size() < 4 ) { s += "." ; s += sw ; }
    }
    // Apply extended modifiers (abs/neg)
    //  extended token layout (type=1: operand modifier):
    //    bits 0-5:  ext_type (1 = operand modifier)
    //    bits 6-13: modifier (0 = none, 1 = neg, 2 = abs, 3 = abs+neg)
    //    bit  31:   another extension present
    if ( op.extended_present ) {
        uint32_t ext_type = ( op.ext_token >> 0 ) & 0x3f ;
        if ( ext_type == 1 ) {
            uint32_t mod = ( op.ext_token >> 6 ) & 0xff ;
            bool neg = ( mod == 1 ) || ( mod == 3 ) ;
            bool abs = ( mod == 2 ) || ( mod == 3 ) ;
            if ( abs ) s = "abs(" + s + ")" ;
            if ( neg ) s = "(-" + s + ")" ;
        }
    }
    return s ;
}

// produce destination operand with mask
static std::string operand_dst( const Operand &op, const std::string & /*assign_val*/ )
{
    std::string s = operand_reg( op ) ;
    if ( op.num_components == 2 && op.selection_mode == 0 && op.mask != 0xf ) {
        s += "." ;
        for ( int i = 0 ; i < 4 ; i++ )
            if ( op.mask & ( 1 << i ) ) s += kSwizChars[ i ] ;
    }
    return s ;
}

// count bits in mask (used for making RHS match destination arity)
static int mask_popcount( uint8_t m )
{
    int n = 0 ;
    for ( int i = 0 ; i < 4 ; i++ ) if ( m & ( 1 << i ) ) n++ ;
    return n ;
}

// wrap expression in vecN conversion if dst mask < 4
static std::string fit_to_dst( const std::string &expr, const Operand &dst )
{
    if ( dst.num_components != 2 ) return expr ;
    int n = mask_popcount( dst.mask ) ;
    if ( n == 4 ) return expr ;
    if ( n == 1 ) return expr + ".x" ;   // scalar broadcast selection
    // multi-comp partial mask (e.g. .xy) — GLSL assignment mask handles it
    return expr ;
}

// ===========================================================================
//  DXBC → GLSL translator (main)
// ===========================================================================

static const char *program_type_name( uint32_t t )
{
    switch ( t ) {
        case 0: return "PS" ;
        case 1: return "VS" ;
        case 2: return "GS" ;
        case 3: return "HS" ;
        case 4: return "DS" ;
        case 5: return "CS" ;
        default: return "??" ;
    }
}

static std::string opcode_name( int op )
{
    switch ( op ) {
#define X(N) case OP_##N: return #N ;
        X(ADD) X(AND) X(BREAK) X(BREAKC) X(CALL) X(CALLC) X(CASE)
        X(CONTINUE) X(CONTINUEC) X(CUT) X(DEFAULT) X(DERIV_RTX) X(DERIV_RTY)
        X(DISCARD) X(DIV) X(DP2) X(DP3) X(DP4) X(ELSE) X(EMIT)
        X(EMITTHENCUT) X(ENDIF) X(ENDLOOP) X(ENDSWITCH) X(EQ) X(EXP) X(FRC)
        X(FTOI) X(FTOU) X(GE) X(IADD) X(IF) X(IEQ) X(IGE) X(ILT)
        X(IMAD) X(IMAX) X(IMIN) X(IMUL) X(INE) X(INEG) X(ISHL) X(ISHR)
        X(ITOF) X(LABEL) X(LD) X(LD_MS) X(LOG) X(LOOP) X(LT) X(MAD)
        X(MIN) X(MAX) X(MOV) X(MOVC) X(MUL) X(NE) X(NOP) X(NOT) X(OR)
        X(RESINFO) X(RET) X(RETC) X(ROUND_NE) X(ROUND_NI) X(ROUND_PI)
        X(ROUND_Z) X(RSQ) X(SAMPLE) X(SAMPLE_C) X(SAMPLE_C_LZ) X(SAMPLE_L)
        X(SAMPLE_D) X(SAMPLE_B) X(SQRT) X(SWITCH) X(SINCOS) X(UDIV) X(UTOF)
        X(XOR) X(DCL_RESOURCE) X(DCL_CONSTANT_BUFFER) X(DCL_SAMPLER)
        X(DCL_INPUT) X(DCL_INPUT_SGV) X(DCL_INPUT_SIV) X(DCL_INPUT_PS)
        X(DCL_INPUT_PS_SGV) X(DCL_INPUT_PS_SIV) X(DCL_OUTPUT)
        X(DCL_OUTPUT_SGV) X(DCL_OUTPUT_SIV) X(DCL_TEMPS) X(DCL_GLOBAL_FLAGS)
#undef X
    }
    char buf[ 16 ] ;
    std::snprintf( buf, sizeof buf, "OP_%02X", op ) ;
    return buf ;
}

struct TranslatorState {
    std::ostringstream header ;
    std::ostringstream body   ;
    int     max_temps = 0 ;
    bool    seen_sv_position = false ;
    bool    use_texture = false ;
    bool    translation_ok = true ;
    int     unsupported_count = 0 ;
} ;

// Emit GLSL for a declaration
static void emit_decl( TranslatorState &st, const Instruction &ins,
                       const DxbcData &data )
{
    (void)data ;
    switch ( ins.opcode ) {
        case OP_DCL_GLOBAL_FLAGS:
            // ignore
            break ;
        case OP_DCL_TEMPS:
            st.max_temps = ( int )ins.dcl_u0 ;
            break ;
        case OP_DCL_CONSTANT_BUFFER:
            if ( !ins.operands.empty() ) {
                const Operand &o = ins.operands[ 0 ] ;
                uint32_t slot    = o.imm_index[ 0 ] ;
                uint32_t nvec    = o.imm_index[ 1 ] ;
                st.header << "uniform vec4 cb" << slot << "[" << nvec << "] ;\n" ;
            }
            break ;
        case OP_DCL_SAMPLER:
            // GLSL では sampler は texture と組合せ。ここでは宣言だけ記録
            break ;
        case OP_DCL_RESOURCE:
            if ( !ins.operands.empty() ) {
                uint32_t slot = ins.operands[ 0 ].imm_index[ 0 ] ;
                st.header << "uniform sampler2D t" << slot << " ;\n" ;
                st.use_texture = true ;
            }
            break ;
        case OP_DCL_INPUT:
        case OP_DCL_INPUT_SIV:
        case OP_DCL_INPUT_SGV:
        case OP_DCL_INPUT_PS:
        case OP_DCL_INPUT_PS_SIV:
        case OP_DCL_INPUT_PS_SGV:
        case OP_DCL_OUTPUT:
        case OP_DCL_OUTPUT_SIV:
        case OP_DCL_OUTPUT_SGV:
            // 入出力の attribute/varying 宣言は ISGN/OSGN で一括発行する
            // (重複防止)。命令 dcl は無視。
            break ;
        default:
            break ;
    }
}

// RHS 式を dst mask に合わせて component 切り出し ( r0.yz = (...).yz のように)。
// scalar_rhs が true のときは swizzle を付けない (RHS がスカラー式の場合)。
static std::string apply_dst_mask_to_rhs( const std::string &val, const Operand &d,
                                          bool scalar_rhs = false )
{
    if ( d.num_components != 2 ) return val ;
    if ( d.selection_mode != 0 )  return val ;
    if ( d.mask == 0xf )          return val ;
    if ( scalar_rhs )             return val ;   // scalar → そのまま代入
    std::string s = "(" + val + ")." ;
    for ( int i = 0 ; i < 4 ; i++ )
        if ( d.mask & ( 1 << i ) ) s += kSwizChars[ i ] ;
    return s ;
}

// Emit GLSL for an instruction. Returns true if successful.
static bool emit_instruction( TranslatorState &st, const Instruction &ins,
                              const DxbcData &data, bool is_pixel_shader )
{
    (void)data ;
    auto &b = st.body ;
    auto set_dst_ex = [&]( const std::string &val, bool scalar_rhs ) {
        if ( ins.operands.empty() ) return ;
        const Operand &d = ins.operands[ 0 ] ;
        std::string rhs = apply_dst_mask_to_rhs( val, d, scalar_rhs ) ;
        // Pixel shader output o0 → gl_FragColor
        if ( is_pixel_shader && d.operand_type == OPT_OUTPUT && d.imm_index[ 0 ] == 0 ) {
            // gl_FragColor は常に vec4 なので mask があっても partial write は不可
            // DXBC の psmain が一部書き換える場合は vec4 自体を渡すのが安全
            b << "    gl_FragColor = " << val << " ;\n" ;
            return ;
        }
        // Vertex shader: OSGN で SV_POSITION が o_N に該当する場合は gl_Position、
        // それ以外の o_N は varying v_N に rename (PS 側と名前を合わせる)
        if ( !is_pixel_shader && d.operand_type == OPT_OUTPUT ) {
            bool is_pos = false ;
            for ( const auto &s : data.outputs ) {
                if ( s.reg_index == d.imm_index[ 0 ] && s.system_value == 1 /*SV_POSITION*/ ) {
                    is_pos = true ;
                    break ;
                }
            }
            std::string lhs ;
            if ( is_pos ) {
                lhs = "gl_Position" ;
            } else {
                char buf[ 32 ] ;
                std::snprintf( buf, sizeof buf, "v_vary%u", d.imm_index[ 0 ] ) ;
                lhs = buf ;
            }
            if ( d.selection_mode == 0 && d.mask != 0xf ) {
                lhs += "." ;
                for ( int i = 0 ; i < 4 ; i++ )
                    if ( d.mask & ( 1 << i ) ) lhs += kSwizChars[ i ] ;
            }
            b << "    " << lhs << " = " << rhs << " ;\n" ;
            return ;
        }
        b << "    " << operand_dst( d, val ) << " = " << rhs << " ;\n" ;
    } ;
    // 既存 call-site はすべて vec4 RHS を想定
    auto set_dst = [&]( const std::string &val ) { set_dst_ex( val, false ) ; } ;

    switch ( ins.opcode ) {
        case OP_MOV:
            if ( ins.operands.size() >= 2 ) {
                const Operand &src = ins.operands[ 1 ] ;
                bool scalar = ( src.num_components == 1 ) ;
                set_dst_ex( operand_src( src ), scalar ) ;
                return true ;
            }
            break ;
        case OP_ADD:
            if ( ins.operands.size() >= 3 ) {
                set_dst( "(" + operand_src( ins.operands[ 1 ] ) + " + " +
                         operand_src( ins.operands[ 2 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_MUL:
            if ( ins.operands.size() >= 3 ) {
                set_dst( "(" + operand_src( ins.operands[ 1 ] ) + " * " +
                         operand_src( ins.operands[ 2 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_MAD:
            if ( ins.operands.size() >= 4 ) {
                set_dst( "((" + operand_src( ins.operands[ 1 ] ) + " * " +
                         operand_src( ins.operands[ 2 ] ) + ") + " +
                         operand_src( ins.operands[ 3 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_DIV:
            if ( ins.operands.size() >= 3 ) {
                set_dst( "(" + operand_src( ins.operands[ 1 ] ) + " / " +
                         operand_src( ins.operands[ 2 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_MIN:
            if ( ins.operands.size() >= 3 ) {
                set_dst( "min(" + operand_src( ins.operands[ 1 ] ) + ", " +
                         operand_src( ins.operands[ 2 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_MAX:
            if ( ins.operands.size() >= 3 ) {
                set_dst( "max(" + operand_src( ins.operands[ 1 ] ) + ", " +
                         operand_src( ins.operands[ 2 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_DP2:
        case OP_DP3:
        case OP_DP4:
            if ( ins.operands.size() >= 3 ) {
                set_dst( "dot(" + operand_src( ins.operands[ 1 ] ) + ", " +
                         operand_src( ins.operands[ 2 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_SQRT:
            if ( ins.operands.size() >= 2 ) {
                set_dst( "sqrt(" + operand_src( ins.operands[ 1 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_RSQ:
            if ( ins.operands.size() >= 2 ) {
                set_dst( "inversesqrt(" + operand_src( ins.operands[ 1 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_LOG:
            if ( ins.operands.size() >= 2 ) {
                set_dst( "log2(" + operand_src( ins.operands[ 1 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_EXP:
            if ( ins.operands.size() >= 2 ) {
                set_dst( "exp2(" + operand_src( ins.operands[ 1 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_ROUND_Z:
        case OP_ROUND_NE:
        case OP_ROUND_NI:
        case OP_ROUND_PI:
            if ( ins.operands.size() >= 2 ) {
                // Approximate: z=trunc, ne=round, ni=floor, pi=ceil
                const char *fn = ( ins.opcode == OP_ROUND_Z  ) ? "trunc"
                               : ( ins.opcode == OP_ROUND_NE ) ? "floor" // GLSL ES lacks round()
                               : ( ins.opcode == OP_ROUND_NI ) ? "floor"
                               : "ceil" ;
                set_dst( std::string( fn ) + "(" + operand_src( ins.operands[ 1 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_FRC:
            if ( ins.operands.size() >= 2 ) {
                set_dst( "fract(" + operand_src( ins.operands[ 1 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_SAMPLE:
        case OP_SAMPLE_L:
            // sample dst, uv, tN, sM [, lod for sample_l]
            if ( ins.operands.size() >= 3 ) {
                std::string tex ;
                for ( const auto &o : ins.operands ) {
                    if ( o.operand_type == OPT_RESOURCE ) {
                        char b0[ 32 ] ;
                        std::snprintf( b0, sizeof b0, "t%u", o.imm_index[ 0 ] ) ;
                        tex = b0 ;
                        break ;
                    }
                }
                if ( tex.empty() ) tex = "t0" ;
                // 2D: uv.xy
                std::string uv = operand_src( ins.operands[ 1 ] ) ;
                if ( ins.opcode == OP_SAMPLE_L && ins.operands.size() >= 5 ) {
                    std::string lod = operand_src( ins.operands[ 4 ] ) ;
                    set_dst( "texture2DLod(" + tex + ", " + uv + ".xy, " + lod + ")" ) ;
                } else {
                    set_dst( "texture2D(" + tex + ", " + uv + ".xy)" ) ;
                }
                return true ;
            }
            break ;
        case OP_RET:
            // Fragment shader end-of-main / vertex shader same — implicit in GLSL
            return true ;
        case OP_FTOI:
        case OP_FTOU:
        case OP_ITOF:
        case OP_UTOF:
            if ( ins.operands.size() >= 2 ) {
                // In GLSL 120 int/float conversion is often identity for basic usage;
                // just pass through with float cast (imprecise but works for many cases)
                set_dst( operand_src( ins.operands[ 1 ] ) ) ;
                return true ;
            }
            break ;

        // --- 制御フロー ---
        case OP_IF:
            if ( ins.operands.size() >= 1 ) {
                bool not_zero = ( ins.saturate == 0 ) ; // 実は別フィールド、近似
                const Operand &src = ins.operands[ 0 ] ;
                std::string cond = operand_src( src ) ;
                // vec4 形式の場合は .x で最初の成分を取って scalar 化
                bool already_scalar = ( src.num_components == 1 ) ;
                if ( !already_scalar ) cond = "(" + cond + ").x" ;
                b << "    if (" << cond << ( not_zero ? " != 0.0" : " == 0.0" ) << ") {\n" ;
                return true ;
            }
            break ;
        case OP_ELSE:
            b << "    } else {\n" ;
            return true ;
        case OP_ENDIF:
            b << "    }\n" ;
            return true ;
        case OP_DISCARD:
            if ( ins.operands.size() >= 1 ) {
                const Operand &src = ins.operands[ 0 ] ;
                std::string cond = operand_src( src ) ;
                bool already_scalar = ( src.num_components == 1 ) ;
                if ( !already_scalar ) cond = "(" + cond + ").x" ;
                b << "    if (" << cond << " != 0.0) discard ;\n" ;
            } else {
                b << "    discard ;\n" ;
            }
            return true ;
        case OP_BREAK:
            b << "    break ;\n" ;
            return true ;
        case OP_LOOP:
            // DXBC の loop は回数制限無しの while(true) に相当、break で抜ける
            b << "    for (int _i = 0 ; _i < 1024 ; _i++) {\n" ;
            return true ;
        case OP_ENDLOOP:
            b << "    }\n" ;
            return true ;

        // --- 比較 → float 0.0 / 1.0 (DXBC は 0 / 0xFFFFFFFF で返すが float 近似) ---
        //  scalar operand (num_components==1 or select_1) のときは GLSL lessThan()
        //  等は使えず、スカラー式 `(a < b) ? 1.0 : 0.0` を使う。
        //  両オペランドとも vec4 のとき lessThan() を使う。
        case OP_EQ: case OP_IEQ: case OP_NE: case OP_INE:
        case OP_LT: case OP_ILT: case OP_ULT:
        case OP_GE: case OP_IGE: case OP_UGE:
            if ( ins.operands.size() >= 3 ) {
                const char *scalar_op =
                      ( ins.opcode == OP_EQ || ins.opcode == OP_IEQ ) ? "=="
                    : ( ins.opcode == OP_NE || ins.opcode == OP_INE ) ? "!="
                    : ( ins.opcode == OP_LT || ins.opcode == OP_ILT || ins.opcode == OP_ULT ) ? "<"
                    : ">=" ;
                const char *vec_fn =
                      ( ins.opcode == OP_EQ || ins.opcode == OP_IEQ ) ? "equal"
                    : ( ins.opcode == OP_NE || ins.opcode == OP_INE ) ? "notEqual"
                    : ( ins.opcode == OP_LT || ins.opcode == OP_ILT || ins.opcode == OP_ULT ) ? "lessThan"
                    : "greaterThanEqual" ;
                const Operand &a = ins.operands[ 1 ] ;
                const Operand &c = ins.operands[ 2 ] ;
                // operand_src は num_components==2 なら常に vec4 形式 (select_1 も
                // broadcast で .cccc) を返す。scalar 判定は num_components==1 のみ
                bool a_scalar = ( a.num_components == 1 ) ;
                bool c_scalar = ( c.num_components == 1 ) ;
                std::string rhs ;
                if ( a_scalar && c_scalar ) {
                    // Wrap in vec4() so apply_dst_mask_to_rhs can extract .x / .xy 等
                    rhs = "vec4((" + operand_src( a ) + " " + scalar_op + " " + operand_src( c ) + ") ? 1.0 : 0.0)" ;
                } else {
                    // 片方が scalar literal (immediate, num_components=1) の場合は vec4() broadcast
                    std::string sa = operand_src( a ) ;
                    std::string sc = operand_src( c ) ;
                    if ( a_scalar ) sa = "vec4(" + sa + ")" ;
                    if ( c_scalar ) sc = "vec4(" + sc + ")" ;
                    rhs = std::string( "vec4(" ) + vec_fn + "(" + sa + ", " + sc + "))" ;
                }
                set_dst( rhs ) ;
                return true ;
            }
            break ;

        // --- 三項選択 movc (cond ? src0 : src1) ---
        case OP_MOVC:
            if ( ins.operands.size() >= 4 ) {
                // DXBC: movc dst, cond, iftrue, iffalse  (cond != 0 → iftrue)
                set_dst( "mix(" + operand_src( ins.operands[ 3 ] ) + ", " +
                         operand_src( ins.operands[ 2 ] ) + ", vec4(notEqual(" +
                         operand_src( ins.operands[ 1 ] ) + ", vec4(0.0))))" ) ;
                return true ;
            }
            break ;

        // --- 整数 ALU (float で代替) ---
        case OP_IADD:
        case OP_UMUL:  // dst_lo_hi, result — 簡易に積のみ
            if ( ins.opcode == OP_IADD && ins.operands.size() >= 3 ) {
                set_dst( "(" + operand_src( ins.operands[ 1 ] ) + " + " +
                         operand_src( ins.operands[ 2 ] ) + ")" ) ;
                return true ;
            }
            if ( ins.opcode == OP_UMUL && ins.operands.size() >= 4 ) {
                // dst_hi, dst_lo, a, b — dst_lo = a * b (近似)
                const Operand &dst_lo = ins.operands[ 1 ] ;
                if ( dst_lo.operand_type != OPT_NULL ) {
                    b << "    " << operand_dst( dst_lo, "" ) << " = (" <<
                         operand_src( ins.operands[ 2 ] ) << " * " <<
                         operand_src( ins.operands[ 3 ] ) << ") ;\n" ;
                }
                return true ;
            }
            break ;
        case OP_IMUL:
            if ( ins.operands.size() >= 4 ) {
                const Operand &dst_lo = ins.operands[ 1 ] ;
                if ( dst_lo.operand_type != OPT_NULL ) {
                    b << "    " << operand_dst( dst_lo, "" ) << " = (" <<
                         operand_src( ins.operands[ 2 ] ) << " * " <<
                         operand_src( ins.operands[ 3 ] ) << ") ;\n" ;
                }
                return true ;
            }
            break ;
        case OP_IMAD:
            if ( ins.operands.size() >= 4 ) {
                set_dst( "((" + operand_src( ins.operands[ 1 ] ) + " * " +
                         operand_src( ins.operands[ 2 ] ) + ") + " +
                         operand_src( ins.operands[ 3 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_INEG:
            if ( ins.operands.size() >= 2 ) {
                set_dst( "(-" + operand_src( ins.operands[ 1 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_IMAX:
        case OP_UMAX:
            if ( ins.operands.size() >= 3 ) {
                set_dst( "max(" + operand_src( ins.operands[ 1 ] ) + ", " +
                         operand_src( ins.operands[ 2 ] ) + ")" ) ;
                return true ;
            }
            break ;
        case OP_IMIN:
        case OP_UMIN:
            if ( ins.operands.size() >= 3 ) {
                set_dst( "min(" + operand_src( ins.operands[ 1 ] ) + ", " +
                         operand_src( ins.operands[ 2 ] ) + ")" ) ;
                return true ;
            }
            break ;

        // --- sincos: dst_sin, dst_cos, src ---
        case OP_SINCOS:
            if ( ins.operands.size() >= 3 ) {
                const Operand &dst_sin = ins.operands[ 0 ] ;
                const Operand &dst_cos = ins.operands[ 1 ] ;
                std::string src = operand_src( ins.operands[ 2 ] ) ;
                if ( dst_sin.operand_type != OPT_NULL ) {
                    b << "    " << operand_dst( dst_sin, "" ) << " = sin(" << src << ") ;\n" ;
                }
                if ( dst_cos.operand_type != OPT_NULL ) {
                    b << "    " << operand_dst( dst_cos, "" ) << " = cos(" << src << ") ;\n" ;
                }
                return true ;
            }
            break ;

        case OP_NOP:
            return true ;

        default:
            break ;
    }
    // Unsupported: emit comment
    b << "    // TODO: unsupported " << opcode_name( ins.opcode ) << "\n" ;
    st.unsupported_count++ ;
    return false ;
}

} // anonymous namespace

// ===========================================================================
//  Public API
// ===========================================================================

int DxDxbc_Disassemble( const void *data, int size )
{
    DxbcData d ;
    if ( parse_container( data, size, d ) < 0 ) {
        std::fprintf( stderr, "[DxDxbc] not a valid DXBC binary\n" ) ;
        return -1 ;
    }
    for ( auto &c : d.chunks ) {
        char fcc[ 5 ] = { 0 } ;
        std::memcpy( fcc, &c.fourcc, 4 ) ;
        if ( c.fourcc == FOUR_ISGN || c.fourcc == FOUR_ISG1 ) {
            parse_signature( c, d.inputs ) ;
        } else if ( c.fourcc == FOUR_OSGN || c.fourcc == FOUR_OSG1 ) {
            parse_signature( c, d.outputs ) ;
        } else if ( c.fourcc == FOUR_SHDR || c.fourcc == FOUR_SHEX ) {
            parse_shdr_header( c, d ) ;
        }
    }

    std::fprintf( stderr, "[DxDxbc] === DXBC dump ===\n" ) ;
    std::fprintf( stderr, "  Program: %s  SM %u.%u\n",
                  program_type_name( d.program_type ), d.sm_major, d.sm_minor ) ;
    std::fprintf( stderr, "  Chunks (%zu):\n", d.chunks.size() ) ;
    for ( auto &c : d.chunks ) {
        char fcc[ 5 ] = { 0 } ;
        std::memcpy( fcc, &c.fourcc, 4 ) ;
        std::fprintf( stderr, "    %s  size=%u\n", fcc, c.size ) ;
    }
    std::fprintf( stderr, "  Inputs (%zu):\n", d.inputs.size() ) ;
    for ( auto &s : d.inputs ) {
        std::fprintf( stderr, "    %s%u  reg=v%u  mask=0x%x  sv=%u\n",
                      s.semantic_name.c_str(), s.semantic_index,
                      s.reg_index, s.mask, s.system_value ) ;
    }
    std::fprintf( stderr, "  Outputs (%zu):\n", d.outputs.size() ) ;
    for ( auto &s : d.outputs ) {
        std::fprintf( stderr, "    %s%u  reg=o%u  mask=0x%x  sv=%u\n",
                      s.semantic_name.c_str(), s.semantic_index,
                      s.reg_index, s.mask, s.system_value ) ;
    }
    if ( d.shdr_data && d.shdr_size > 0 ) {
        const uint32_t *toks = ( const uint32_t * )d.shdr_data ;
        int max_tok = ( int )( d.shdr_size / 4 ) ;
        int cur = 0 ;
        int instr_count = 0 ;
        while ( cur < max_tok ) {
            Instruction ins ;
            int consumed = parse_instruction( toks + cur, max_tok - cur, ins ) ;
            if ( consumed <= 0 ) break ;
            cur += consumed ;
            instr_count++ ;
        }
        std::fprintf( stderr, "  SHDR instructions: %d\n", instr_count ) ;
    }
    return 0 ;
}

int DxDxbc_Translate( const void *data, int size,
                      std::string *out_glsl, int *program_type )
{
    DxbcData d ;
    if ( parse_container( data, size, d ) < 0 ) return -1 ;
    for ( auto &c : d.chunks ) {
        if ( c.fourcc == FOUR_ISGN || c.fourcc == FOUR_ISG1 ) {
            parse_signature( c, d.inputs ) ;
        } else if ( c.fourcc == FOUR_OSGN || c.fourcc == FOUR_OSG1 ) {
            parse_signature( c, d.outputs ) ;
        } else if ( c.fourcc == FOUR_SHDR || c.fourcc == FOUR_SHEX ) {
            parse_shdr_header( c, d ) ;
        }
    }
    if ( !d.shdr_data || d.shdr_size == 0 ) return -1 ;
    if ( program_type ) *program_type = ( int )d.program_type ;

    bool is_ps = ( d.program_type == 0 ) ;
    g_is_pixel_shader = is_ps ;

    TranslatorState st ;
    st.header << "// Translated from DXBC by DxDxbcTranslator (minimal Phase 1)\n" ;
    st.header << "#version 120\n" ;
    if ( is_ps ) st.header << "#ifdef GL_FRAGMENT_PRECISION_HIGH\n"
                              "precision highp float;\n#else\n"
                              "precision mediump float;\n#endif\n" ;

    // Emit declarations based on instruction stream
    const uint32_t *toks = ( const uint32_t * )d.shdr_data ;
    int max_tok = ( int )( d.shdr_size / 4 ) ;
    int cur = 0 ;
    // First pass: declarations
    std::vector<Instruction> insns ;
    while ( cur < max_tok ) {
        Instruction ins ;
        int consumed = parse_instruction( toks + cur, max_tok - cur, ins ) ;
        if ( consumed <= 0 ) break ;
        cur += consumed ;
        if ( ins.opcode >= OP_DCL_RESOURCE && ins.opcode <= OP_DCL_GLOBAL_FLAGS ) {
            emit_decl( st, ins, d ) ;
        } else {
            insns.push_back( ins ) ;
        }
    }

    // ISGN / OSGN から attribute / varying を一括宣言
    if ( is_ps ) {
        for ( const auto &s : d.inputs ) {
            if ( s.system_value == 1 /*SV_POSITION*/ ) continue ;
            st.header << "varying vec4 v_vary" << s.reg_index << " ;\n" ;
        }
    } else {
        for ( const auto &s : d.inputs ) {
            st.header << "attribute vec4 a_in" << s.reg_index << " ;\n" ;
        }
        for ( const auto &s : d.outputs ) {
            if ( s.system_value == 1 /*SV_POSITION*/ ) continue ;
            st.header << "varying vec4 v_vary" << s.reg_index << " ;\n" ;
        }
    }

    // body
    st.body << "void main()\n{\n" ;
    for ( int i = 0 ; i < st.max_temps ; i++ ) {
        st.body << "    vec4 r" << i << " ;\n" ;
    }
    for ( const auto &ins : insns ) {
        if ( !emit_instruction( st, ins, d, is_ps ) ) {
            st.translation_ok = false ;
        }
    }
    st.body << "}\n" ;

    if ( out_glsl ) *out_glsl = st.header.str() + st.body.str() ;

    if ( !st.translation_ok ) {
        std::fprintf( stderr,
                      "[DxDxbc] partial translation (%d unsupported instruction%s)\n",
                      st.unsupported_count, st.unsupported_count == 1 ? "" : "s" ) ;
        return -2 ;
    }
    return 0 ;
}
