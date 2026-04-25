//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Web (emscripten) 用 Live2D Cubism Core C API bridge
//
//      Cubism Core の Web SDK (live2dcubismcore.min.js) は OOP API
//      (Live2DCubismCore.Moc / Model / Version など) のみで C API を直接
//      露出しない。本ファイルは EM_JS で OOP API を C API として包み直す。
//
//      実装方針:
//        - JS 側に Map<int, jsModel> を持ち、moc/model "ハンドル" として整数を発行
//        - 我々の wasm 側のポインタ引数 (moc_ptr, model_ptr 等) は JS 側で整数
//          ハンドルとして再解釈
//        - 配列データは EM_JS 内でアロケート + 値書き込み + ポインタ返却
//
//      このファイルは EMSCRIPTEN ビルドでのみ含まれる。Mac/Linux は元の
//      Cubism Native SDK の libLive2DCubismCore.a を直接 link する。
//
//      対応状況:
//        - 主要 csm 関数 (Version / Moc / Model / 30+ Get*) を実装
//        - 部分的に未実装 (戻り値 0 / nullptr) 関数あり、TODO 参照
//        - DxLive2DCubism4.cpp が呼ぶパスを優先して埋める
//
//-----------------------------------------------------------------------------

#ifdef __EMSCRIPTEN__

#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <emscripten.h>

extern "C" {

// EM_JS 内で window.Live2DCubismCore を利用するためのヘルパは不要、直接呼ぶ。

// バージョン関連 -----------------------------------------------------------

EM_JS( unsigned int, csmGetVersion, (void), {
    return Live2DCubismCore.Version.csmGetVersion();
} )

EM_JS( unsigned int, csmGetLatestMocVersion, (void), {
    return Live2DCubismCore.Version.csmGetLatestMocVersion();
} )

EM_JS( unsigned int, csmGetMocVersion, (const void *moc, unsigned int mocSize), {
    // moc bytes を ArrayBuffer に切り出して getMocVersion を呼ぶ
    var bytes = HEAPU8.subarray( moc, moc + mocSize );
    var buf = bytes.slice().buffer;
    var jsMoc = Live2DCubismCore.Moc.fromArrayBuffer( buf );
    if ( !jsMoc ) return 0;
    return jsMoc.MocVersion || 0;
} )

EM_JS( int, csmHasMocConsistency, (const void *memory, unsigned int mocSize), {
    var bytes = HEAPU8.subarray( memory, memory + mocSize );
    var buf = bytes.slice().buffer;
    var v = Live2DCubismCore.Moc.prototype.hasMocConsistency
        ? Live2DCubismCore.Moc.prototype.hasMocConsistency( buf )
        : 1;
    return v ? 1 : 0;
} )

// Log function. 実装なくても DxLib は動く。
extern void *csmGetLogFunction(void) { return nullptr; }
extern void  csmSetLogFunction(void *fn) { (void)fn; }

// Moc / Model のハンドル管理 -------------------------------------------------
//   wasm 側ポインタを JS Map のキーとして使う。csmReviveMocInPlace で moc 領域に
//   JS の jsMoc を関連付け、csmInitializeModelInPlace で model 領域に jsModel を関連付ける。

EM_JS( int, csmAlignofMoc_get, (), { return 64; } )
EM_JS( int, csmAlignofModel_get, (), { return 16; } )
extern unsigned int csmAlignofMoc   = 64;
extern unsigned int csmAlignofModel = 16;

EM_JS( void *, csmReviveMocInPlace, (void *memory, unsigned int mocSize), {
    if ( !window.__hsp3dxL2D ) window.__hsp3dxL2D = { mocs: {}, models: {} };
    var bytes = HEAPU8.subarray( memory, memory + mocSize );
    var buf = bytes.slice().buffer;
    var jsMoc = Live2DCubismCore.Moc.fromArrayBuffer( buf );
    if ( window.__l2d_log ) window.__l2d_log('[L2D bridge] csmReviveMocInPlace size=' + mocSize + ' moc=' + (jsMoc?'ok':'fail'));
    if ( !jsMoc ) return 0;
    // memory のアドレスをキーに jsMoc を保存
    window.__hsp3dxL2D.mocs[memory] = jsMoc;
    return memory;
} )

EM_JS( unsigned int, csmGetSizeofModel, (void *moc), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsMoc = window.__hsp3dxL2D.mocs[moc];
    if ( !jsMoc ) return 0;
    // 仮: 4MB (実際の Model サイズは Moc に依る、JS API は直接公開しない)
    return 4 * 1024 * 1024;
} )

EM_JS( void *, csmInitializeModelInPlace, (void *moc, void *memory, unsigned int modelSize), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsMoc = window.__hsp3dxL2D.mocs[moc];
    if ( !jsMoc ) { if ( window.__l2d_log ) window.__l2d_log('[L2D bridge] csmInitModel: no jsMoc for ' + moc); return 0; }
    var jsModel = Live2DCubismCore.Model.fromMoc( jsMoc );
    if ( window.__l2d_log ) window.__l2d_log('[L2D bridge] csmInitModel parts=' + (jsModel?jsModel.parts.count:'?') + ' drawables=' + (jsModel?jsModel.drawables.count:'?'));
    if ( !jsModel ) return 0;
    window.__hsp3dxL2D.models[memory] = jsModel;
    return memory;
} )

EM_JS( void, csmUpdateModel, (void *model), {
    if ( !window.__hsp3dxL2D ) return;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( jsModel ) jsModel.update();
} )

EM_JS( void, csmReadCanvasInfo, (void *model, float *outSizeInPixels, float *outOriginInPixels, float *outPixelsPerUnit), {
    if ( !window.__hsp3dxL2D ) return;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel || !jsModel.canvasinfo ) return;
    HEAPF32[outSizeInPixels >> 2]       = jsModel.canvasinfo.CanvasWidth;
    HEAPF32[(outSizeInPixels >> 2) + 1] = jsModel.canvasinfo.CanvasHeight;
    HEAPF32[outOriginInPixels >> 2]       = jsModel.canvasinfo.CanvasOriginX;
    HEAPF32[(outOriginInPixels >> 2) + 1] = jsModel.canvasinfo.CanvasOriginY;
    HEAPF32[outPixelsPerUnit >> 2]      = jsModel.canvasinfo.PixelsPerUnit;
} )

// Parameters -----------------------------------------------------------------

EM_JS( int, csmGetParameterCount, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    return jsModel ? jsModel.parameters.count : 0;
} )

EM_JS( const char **, csmGetParameterIds, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    // ids を C 文字列の char* 配列として確保 (キャッシュ)
    if ( !jsModel.__cIds ) {
        var n = jsModel.parameters.count;
        var arr = jsModel.parameters.ids;
        var base = _malloc( n * 4 );  // n 個の char* (4 バイトポインタ、wasm32)
        for ( var i = 0; i < n; i++ ) {
            var s = arr[i];
            var len = lengthBytesUTF8(s) + 1;
            var p = _malloc( len );
            stringToUTF8( s, p, len );
            HEAP32[(base >> 2) + i] = p;
        }
        jsModel.__cIds = base;
    }
    return jsModel.__cIds;
} )

EM_JS( const int *, csmGetParameterTypes, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cTypes ) {
        var n = jsModel.parameters.count;
        var p = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) HEAP32[(p >> 2) + i] = jsModel.parameters.types[i];
        jsModel.__cTypes = p;
    }
    return jsModel.__cTypes;
} )

EM_JS( const float *, csmGetParameterMinimumValues, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cMin ) {
        var arr = jsModel.parameters.minimumValues;
        var n = arr.length;
        var p = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) HEAPF32[(p >> 2) + i] = arr[i];
        jsModel.__cMin = p;
    }
    return jsModel.__cMin;
} )

EM_JS( const float *, csmGetParameterMaximumValues, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cMax ) {
        var arr = jsModel.parameters.maximumValues;
        var n = arr.length;
        var p = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) HEAPF32[(p >> 2) + i] = arr[i];
        jsModel.__cMax = p;
    }
    return jsModel.__cMax;
} )

EM_JS( const float *, csmGetParameterDefaultValues, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDef ) {
        var arr = jsModel.parameters.defaultValues;
        var n = arr.length;
        var p = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) HEAPF32[(p >> 2) + i] = arr[i];
        jsModel.__cDef = p;
    }
    return jsModel.__cDef;
} )

EM_JS( float *, csmGetParameterValues, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    // values は per-frame で wasm 側からも書き込めるように mutable バッファを確保
    if ( !jsModel.__cVal ) {
        var arr = jsModel.parameters.values;
        var n = arr.length;
        var p = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) HEAPF32[(p >> 2) + i] = arr[i];
        jsModel.__cVal = p;
        jsModel.__cValN = n;
    }
    // wasm → JS の現在値を毎回反映
    var n = jsModel.__cValN;
    for ( var i = 0; i < n; i++ ) jsModel.parameters.values[i] = HEAPF32[(jsModel.__cVal >> 2) + i];
    return jsModel.__cVal;
} )

extern "C" int csmGetParameterRepeats( void *model ) { (void)model; return 0; }
extern "C" int csmGetParameterKeyCounts( void *model ) { (void)model; return 0; }
extern "C" const float *csmGetParameterKeyValues( void *model ) { (void)model; return nullptr; }

// Parts ----------------------------------------------------------------------

EM_JS( int, csmGetPartCount, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    return jsModel ? jsModel.parts.count : 0;
} )

EM_JS( const char **, csmGetPartIds, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cPartIds ) {
        var n = jsModel.parts.count;
        var arr = jsModel.parts.ids;
        var base = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) {
            var s = arr[i];
            var len = lengthBytesUTF8(s) + 1;
            var p = _malloc( len );
            stringToUTF8( s, p, len );
            HEAP32[(base >> 2) + i] = p;
        }
        jsModel.__cPartIds = base;
    }
    return jsModel.__cPartIds;
} )

EM_JS( float *, csmGetPartOpacities, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cPartOpa ) {
        var arr = jsModel.parts.opacities;
        var n = arr.length;
        var p = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) HEAPF32[(p >> 2) + i] = arr[i];
        jsModel.__cPartOpa = p;
        jsModel.__cPartOpaN = n;
    }
    var n = jsModel.__cPartOpaN;
    for ( var i = 0; i < n; i++ ) jsModel.parts.opacities[i] = HEAPF32[(jsModel.__cPartOpa >> 2) + i];
    return jsModel.__cPartOpa;
} )

EM_JS( const int *, csmGetPartParentPartIndices, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cPartPar ) {
        var arr = jsModel.parts.parentIndices;
        var n = arr.length;
        var p = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) HEAP32[(p >> 2) + i] = arr[i];
        jsModel.__cPartPar = p;
    }
    return jsModel.__cPartPar;
} )

extern "C" const int *csmGetPartOffscreenIndices( void *model ) { (void)model; return nullptr; }

// Drawables (描画対象) ------------------------------------------------------

EM_JS( int, csmGetDrawableCount, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    return jsModel ? jsModel.drawables.count : 0;
} )

#define DEF_DRAWABLE_INT_ARRAY( fn, prop ) \
    EM_JS( const int *, fn, (void *model), { \
        if ( !window.__hsp3dxL2D ) return 0; \
        var jsModel = window.__hsp3dxL2D.models[model]; \
        if ( !jsModel ) return 0; \
        var key = "__c_" + #prop; \
        if ( !jsModel[key] ) { \
            var arr = jsModel.drawables[#prop]; \
            var n = arr.length; \
            var p = _malloc( n * 4 ); \
            for ( var i = 0; i < n; i++ ) HEAP32[(p >> 2) + i] = arr[i]; \
            jsModel[key] = p; \
        } \
        return jsModel[key]; \
    } )
// マクロは EM_JS 内で文字列化が複雑なので展開せず直接書く
#undef DEF_DRAWABLE_INT_ARRAY

// 個別実装 (drawable プロパティ毎)
EM_JS( const int *, csmGetDrawableConstantFlags, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwCFlag ) {
        var arr = jsModel.drawables.constantFlags;
        var n = arr.length;
        var p = _malloc( n );
        for ( var i = 0; i < n; i++ ) HEAPU8[p + i] = arr[i];
        jsModel.__cDrwCFlag = p;
    }
    return jsModel.__cDrwCFlag;
} )

EM_JS( const int *, csmGetDrawableDynamicFlags, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwDFlag ) {
        var arr = jsModel.drawables.dynamicFlags;
        var n = arr.length;
        var p = _malloc( n );
        jsModel.__cDrwDFlag = p;
        jsModel.__cDrwDFlagN = n;
    }
    var n = jsModel.__cDrwDFlagN;
    for ( var i = 0; i < n; i++ ) HEAPU8[jsModel.__cDrwDFlag + i] = jsModel.drawables.dynamicFlags[i];
    return jsModel.__cDrwDFlag;
} )

EM_JS( const char **, csmGetDrawableIds, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwIds ) {
        var n = jsModel.drawables.count;
        var arr = jsModel.drawables.ids;
        var base = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) {
            var s = arr[i];
            var len = lengthBytesUTF8(s) + 1;
            var p = _malloc( len );
            stringToUTF8( s, p, len );
            HEAP32[(base >> 2) + i] = p;
        }
        jsModel.__cDrwIds = base;
    }
    return jsModel.__cDrwIds;
} )

EM_JS( const int *, csmGetDrawableTextureIndices, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwTex ) {
        var arr = jsModel.drawables.textureIndices;
        var n = arr.length;
        var p = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) HEAP32[(p >> 2) + i] = arr[i];
        jsModel.__cDrwTex = p;
    }
    return jsModel.__cDrwTex;
} )

EM_JS( const int *, csmGetDrawableDrawOrders, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwOrd ) {
        jsModel.__cDrwOrd = _malloc( jsModel.drawables.drawOrders.length * 4 );
        jsModel.__cDrwOrdN = jsModel.drawables.drawOrders.length;
    }
    var n = jsModel.__cDrwOrdN;
    for ( var i = 0; i < n; i++ ) HEAP32[(jsModel.__cDrwOrd >> 2) + i] = jsModel.drawables.drawOrders[i];
    return jsModel.__cDrwOrd;
} )

EM_JS( const int *, csmGetDrawableRenderOrders, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwRnd ) {
        jsModel.__cDrwRnd = _malloc( jsModel.drawables.renderOrders.length * 4 );
        jsModel.__cDrwRndN = jsModel.drawables.renderOrders.length;
    }
    var n = jsModel.__cDrwRndN;
    for ( var i = 0; i < n; i++ ) HEAP32[(jsModel.__cDrwRnd >> 2) + i] = jsModel.drawables.renderOrders[i];
    return jsModel.__cDrwRnd;
} )

EM_JS( const float *, csmGetDrawableOpacities, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwOpa ) {
        jsModel.__cDrwOpa = _malloc( jsModel.drawables.opacities.length * 4 );
        jsModel.__cDrwOpaN = jsModel.drawables.opacities.length;
    }
    var n = jsModel.__cDrwOpaN;
    for ( var i = 0; i < n; i++ ) HEAPF32[(jsModel.__cDrwOpa >> 2) + i] = jsModel.drawables.opacities[i];
    return jsModel.__cDrwOpa;
} )

EM_JS( const int *, csmGetDrawableMaskCounts, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwMC ) {
        var arr = jsModel.drawables.maskCounts;
        var n = arr.length;
        var p = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) HEAP32[(p >> 2) + i] = arr[i];
        jsModel.__cDrwMC = p;
    }
    return jsModel.__cDrwMC;
} )

EM_JS( const int *const *, csmGetDrawableMasks, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwMasks ) {
        var arrs = jsModel.drawables.masks;
        var n = arrs.length;
        var base = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) {
            var sub = arrs[i];
            var subN = sub.length;
            var p = _malloc( subN * 4 );
            for ( var j = 0; j < subN; j++ ) HEAP32[(p >> 2) + j] = sub[j];
            HEAP32[(base >> 2) + i] = p;
        }
        jsModel.__cDrwMasks = base;
    }
    return jsModel.__cDrwMasks;
} )

EM_JS( const int *, csmGetDrawableVertexCounts, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwVC ) {
        var arr = jsModel.drawables.vertexCounts;
        var n = arr.length;
        var p = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) HEAP32[(p >> 2) + i] = arr[i];
        jsModel.__cDrwVC = p;
    }
    return jsModel.__cDrwVC;
} )

EM_JS( const float *const *, csmGetDrawableVertexPositions, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwVPos ) {
        var arrs = jsModel.drawables.vertexPositions;
        var n = arrs.length;
        var base = _malloc( n * 4 );
        var subPtrs = [];
        for ( var i = 0; i < n; i++ ) {
            var sub = arrs[i];
            var subN = sub.length;
            var p = _malloc( subN * 4 );
            HEAP32[(base >> 2) + i] = p;
            subPtrs.push( { p: p, n: subN, src: sub } );
        }
        jsModel.__cDrwVPos = base;
        jsModel.__cDrwVPosSub = subPtrs;
    }
    // 毎回 update (頂点位置は per-frame に変わる)
    for ( var i = 0; i < jsModel.__cDrwVPosSub.length; i++ ) {
        var s = jsModel.__cDrwVPosSub[i];
        for ( var j = 0; j < s.n; j++ ) HEAPF32[(s.p >> 2) + j] = s.src[j];
    }
    return jsModel.__cDrwVPos;
} )

EM_JS( const float *const *, csmGetDrawableVertexUvs, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwVUv ) {
        var arrs = jsModel.drawables.vertexUvs;
        var n = arrs.length;
        var base = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) {
            var sub = arrs[i];
            var subN = sub.length;
            var p = _malloc( subN * 4 );
            for ( var j = 0; j < subN; j++ ) HEAPF32[(p >> 2) + j] = sub[j];
            HEAP32[(base >> 2) + i] = p;
        }
        jsModel.__cDrwVUv = base;
    }
    return jsModel.__cDrwVUv;
} )

EM_JS( const int *, csmGetDrawableIndexCounts, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwIC ) {
        var arr = jsModel.drawables.indexCounts;
        var n = arr.length;
        var p = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) HEAP32[(p >> 2) + i] = arr[i];
        jsModel.__cDrwIC = p;
    }
    return jsModel.__cDrwIC;
} )

EM_JS( const unsigned short *const *, csmGetDrawableIndices, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwIdx ) {
        var arrs = jsModel.drawables.indices;
        var n = arrs.length;
        var base = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) {
            var sub = arrs[i];
            var subN = sub.length;
            var p = _malloc( subN * 2 );
            for ( var j = 0; j < subN; j++ ) HEAPU16[(p >> 1) + j] = sub[j];
            HEAP32[(base >> 2) + i] = p;
        }
        jsModel.__cDrwIdx = base;
    }
    return jsModel.__cDrwIdx;
} )

EM_JS( const float *, csmGetDrawableMultiplyColors, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwMul ) {
        jsModel.__cDrwMul = _malloc( jsModel.drawables.multiplyColors.length * 4 );
        jsModel.__cDrwMulN = jsModel.drawables.multiplyColors.length;
    }
    var n = jsModel.__cDrwMulN;
    for ( var i = 0; i < n; i++ ) HEAPF32[(jsModel.__cDrwMul >> 2) + i] = jsModel.drawables.multiplyColors[i];
    return jsModel.__cDrwMul;
} )

EM_JS( const float *, csmGetDrawableScreenColors, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwScr ) {
        jsModel.__cDrwScr = _malloc( jsModel.drawables.screenColors.length * 4 );
        jsModel.__cDrwScrN = jsModel.drawables.screenColors.length;
    }
    var n = jsModel.__cDrwScrN;
    for ( var i = 0; i < n; i++ ) HEAPF32[(jsModel.__cDrwScr >> 2) + i] = jsModel.drawables.screenColors[i];
    return jsModel.__cDrwScr;
} )

EM_JS( const int *, csmGetDrawableParentPartIndices, (void *model), {
    if ( !window.__hsp3dxL2D ) return 0;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( !jsModel ) return 0;
    if ( !jsModel.__cDrwPPI ) {
        var arr = jsModel.drawables.parentPartIndices;
        var n = arr.length;
        var p = _malloc( n * 4 );
        for ( var i = 0; i < n; i++ ) HEAP32[(p >> 2) + i] = arr[i];
        jsModel.__cDrwPPI = p;
    }
    return jsModel.__cDrwPPI;
} )

// Web SDK は blendModes をプロパティに公開していない、constantFlags 経由で
// 推定する形になるため stub。Framework 側では descend して使うので
// nullptr 返しても致命傷ではない。
extern "C" const int *csmGetDrawableBlendModes( void *model ) { (void)model; return nullptr; }

EM_JS( void, csmResetDrawableDynamicFlags, (void *model), {
    if ( !window.__hsp3dxL2D ) return;
    var jsModel = window.__hsp3dxL2D.models[model];
    if ( jsModel ) jsModel.drawables.resetDynamicFlags();
} )

// Offscreen --------------------------------------------------------------
extern "C" int csmGetOffscreenCount( void *model ) { (void)model; return 0; }
extern "C" const char **csmGetOffscreenIds( void *model ) { (void)model; return nullptr; }
extern "C" const int *csmGetOffscreenConstantFlags( void *model ) { (void)model; return nullptr; }
extern "C" const int *csmGetOffscreenOwnerIndices( void *model ) { (void)model; return nullptr; }
extern "C" const int *csmGetOffscreenMaskCounts( void *model ) { (void)model; return nullptr; }
extern "C" const int *const *csmGetOffscreenMasks( void *model ) { (void)model; return nullptr; }
extern "C" const float *csmGetOffscreenOpacities( void *model ) { (void)model; return nullptr; }
extern "C" const int *csmGetOffscreenBlendModes( void *model ) { (void)model; return nullptr; }
extern "C" const float *csmGetOffscreenMultiplyColors( void *model ) { (void)model; return nullptr; }
extern "C" const float *csmGetOffscreenScreenColors( void *model ) { (void)model; return nullptr; }

} // extern "C"

#endif // __EMSCRIPTEN__
