//-----------------------------------------------------------------------------
//
//      DX ライブラリ   Desktop (SDL2+GL) 用 モデル 実装 (最小版 v1)
//
//      DxModel.cpp (34113 行) / DxModelLoader*.cpp / DxModelRead.cpp の CPU
//      側コードをコンパイル・リンク可能にするため、MV1_*_PF (14 個) の
//      エントリを提供する。このコミットでは VBO/シェーダ連動はまだ入れず、
//      PF は no-op に近い (handle 管理や Common バッファの確保のみ)。
//
//      次段で VBO 作成 + glDrawElements で実描画を動かす予定。
//
//-----------------------------------------------------------------------------

#define DX_MAKE

#ifdef _WIN32
#include <windows.h>
#endif

#include "../DxCompileConfig.h"

#ifndef DX_NON_MODEL

#include "DxModelDesktop.h"
#include "../DxModel.h"
#include "../DxMemory.h"
#include "../DxGraphics.h"

#include <SDL.h>
#include <SDL_opengl.h>

#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <cmath>

#ifndef DX_NON_NAMESPACE
namespace DxLib
{
#endif

MV1_MODEL_MANAGE_DESKTOP MV1Man_Desktop = {} ;

// --- 汎用バッファ関数 ----------------------------------------------------

extern int MV1_Desktop_CommonBuffer_Setup( int Size )
{
    if ( Size <= MV1Man_Desktop.CommonBufferSize ) return 0 ;
    if ( MV1Man_Desktop.CommonBuffer ) std::free( MV1Man_Desktop.CommonBuffer ) ;
    MV1Man_Desktop.CommonBuffer = std::malloc( Size ) ;
    MV1Man_Desktop.CommonBufferSize = MV1Man_Desktop.CommonBuffer ? Size : 0 ;
    return MV1Man_Desktop.CommonBuffer ? 0 : -1 ;
}

extern int MV1_Desktop_CommonBuffer_Terminate( void )
{
    if ( MV1Man_Desktop.CommonBuffer ) std::free( MV1Man_Desktop.CommonBuffer ) ;
    MV1Man_Desktop.CommonBuffer = nullptr ;
    MV1Man_Desktop.CommonBufferSize = 0 ;
    return 0 ;
}

// --- PF 関数 (最小実装: handle 管理のみ、描画は未実装) -----------------

extern int  MV1_Terminate_PF( void )
{
    return MV1_Desktop_CommonBuffer_Terminate() ;
}

extern int  MV1_TerminateModelBaseHandle_PF( MV1_MODEL_BASE *ModelBase )
{
    (void)ModelBase;
    return 0 ;
}

extern int  MV1_TerminateTriangleListBaseTempBuffer_PF( MV1_TRIANGLE_LIST_BASE *MBTList )
{
    if ( !MBTList ) return 0 ;
    // DxModel.h は PF 情報を PFBuffer[] に詰めるデザイン (iOS 版と同じ)
    MV1_TRIANGLE_LIST_BASE_PF *pf = ( MV1_TRIANGLE_LIST_BASE_PF * )MBTList->PFBuffer ;
    if ( pf->SkinFreeBoneVertexBuffer ) {
        std::free( pf->SkinFreeBoneVertexBuffer ) ;
        pf->SkinFreeBoneVertexBuffer = nullptr ;
    }
    pf->SkinFreeBoneVertexBufferUpdate = 0 ;
    return 0 ;
}

extern void MV1_SetupPackDrawInfo_PF( MV1_MODEL_BASE *ModelBase )
{
    (void)ModelBase;
    // pack draw info は VBO/シェーダ実装まで no-op
}

extern int  MV1_SetupVertexBufferBase_PF( int MV1ModelBaseHandle, int DuplicateNum, int ASyncThread )
{
    (void)MV1ModelBaseHandle; (void)DuplicateNum; (void)ASyncThread;
    return 0 ;
}

extern int  MV1_SetupVertexBuffer_PF( int MHandle, int ASyncThread )
{
    (void)MHandle; (void)ASyncThread;
    return 0 ;
}

extern int  MV1_TerminateVertexBufferBase_PF( int MV1ModelBaseHandle )
{
    (void)MV1ModelBaseHandle;
    return 0 ;
}

extern int  MV1_TerminateVertexBuffer_PF( int MV1ModelHandle )
{
    (void)MV1ModelHandle;
    return 0 ;
}

extern int  MV1_SetupShapeVertex_PF( int MHandle )
{
    (void)MHandle;
    return 0 ;
}

static bool s_MV1_LightWasOn = false ;

extern int  MV1_BeginRender_PF( MV1_MODEL *Model )
{
    (void)Model;
    // DxLib 側で既に SetTransformToView/Projection/World は呼ばれている。
    glEnable( GL_DEPTH_TEST ) ;
    // ライティング: DxLib::GetLightEnable() が TRUE なら GL_LIGHTING を有効化
    // ColorMaterial を使って glColor が diffuse/ambient を駆動するようにする
    s_MV1_LightWasOn = ( NS_GetLightEnable() != 0 ) ;
    if ( s_MV1_LightWasOn ) {
        glEnable( GL_LIGHTING ) ;
        glEnable( GL_COLOR_MATERIAL ) ;
        glColorMaterial( GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE ) ;
        // 法線の自動正規化 (スキニング後の normal は非単位ベクトルになる可能性)
        glEnable( GL_NORMALIZE ) ;
    }
    return 0 ;
}

extern int  MV1_EndRender_PF( void )
{
    if ( s_MV1_LightWasOn ) {
        glDisable( GL_NORMALIZE ) ;
        glDisable( GL_COLOR_MATERIAL ) ;
        glDisable( GL_LIGHTING ) ;
        s_MV1_LightWasOn = false ;
    }
    glDisable( GL_TEXTURE_2D ) ;
    glColor4ub( 255, 255, 255, 255 ) ;
    return 0 ;
}

// ワールド行列を Frame の LocalWorldMatrix から取得して glLoadMatrixf に流す
static void desktop_mv1_apply_frame_world( MV1_FRAME *frame )
{
    if ( !frame ) return ;
    // MATRIX_4X4CT は row-major 4x4。glLoadMatrixf に渡すと自動転置扱い。
    // NOTE: MATRIX_4X4CT はカラムメジャー実装の DirectX 派生なので、
    //   GL の column-major と合致する。そのまま glLoadMatrixf で OK のはず。
    //   (DxLib 本体の行列計算と GL の解釈が一致するよう DxLib 側で構築される)
    MATRIX m ;
    // FRAME の LocalWorldMatrix は行列化済。ここでは「現在の ModelView 行列に
    // 乗じる」の代わりに、GL 現在 MODELVIEW は View * World_prev。新しい World
    // に切り替えるため、View を再ロードして World を multiply しなおす。
    // 単純化: ここでは identity を重ねるだけ (frame の LocalWorld は既に
    // DxLib 内部で SetTransformToWorld にセットされていることを期待)。
    (void)m ; (void)frame ;
}

// 指定 DxLib GraphHandle から GL テクスチャ ID を取得 (0 なら失敗)
static GLuint desktop_mv1_tex_from_graph( int graphHandle )
{
    if ( graphHandle <= 0 ) return 0 ;
    IMAGEDATA *img = nullptr ;
    if ( GRAPHCHK( graphHandle, img ) ) return 0 ;
    if ( !img || !img->Orig || img->Orig->Hard.TexNum == 0 ) return 0 ;
    IMAGEDATA_ORIG_HARD_TEX *tex = &img->Orig->Hard.Tex[ 0 ] ;
    if ( !tex->PF ) return 0 ;
    return ( GLuint )tex->PF->Texture.TextureBuffer ;
}

// MATRIX_4X4CT は m[row][col] (row 0..2, col 0..3)、row 3 は暗黙の (0,0,0,1)。
// out = M * (p.x, p.y, p.z, 1)
static inline void desktop_mv1_mul_mat4x4ct(
    const MATRIX_4X4CT *M, const FLOAT4 &p, float &ox, float &oy, float &oz )
{
    ox = M->mf.m[ 0 ][ 0 ] * p.x + M->mf.m[ 0 ][ 1 ] * p.y + M->mf.m[ 0 ][ 2 ] * p.z + M->mf.m[ 0 ][ 3 ] ;
    oy = M->mf.m[ 1 ][ 0 ] * p.x + M->mf.m[ 1 ][ 1 ] * p.y + M->mf.m[ 1 ][ 2 ] * p.z + M->mf.m[ 1 ][ 3 ] ;
    oz = M->mf.m[ 2 ][ 0 ] * p.x + M->mf.m[ 2 ][ 1 ] * p.y + M->mf.m[ 2 ][ 2 ] * p.z + M->mf.m[ 2 ][ 3 ] ;
}

// 法線変換用 (平行移動は除外、3x3 回転/スケール成分のみ)
static inline void desktop_mv1_mul_mat4x4ct_dir(
    const MATRIX_4X4CT *M, const VECTOR &n, float &ox, float &oy, float &oz )
{
    ox = M->mf.m[ 0 ][ 0 ] * n.x + M->mf.m[ 0 ][ 1 ] * n.y + M->mf.m[ 0 ][ 2 ] * n.z ;
    oy = M->mf.m[ 1 ][ 0 ] * n.x + M->mf.m[ 1 ][ 1 ] * n.y + M->mf.m[ 1 ][ 2 ] * n.z ;
    oz = M->mf.m[ 2 ][ 0 ] * n.x + M->mf.m[ 2 ][ 1 ] * n.y + M->mf.m[ 2 ][ 2 ] * n.z ;
}

// CPU スキニング。各頂点タイプごとに MatrixWeight × BoneMatrix を合成し、
// world 空間の位置 + 法線を返す (法線は呼び側で正規化または GL_NORMALIZE に任せる)。
static void desktop_mv1_skin_vertex(
    MV1_FRAME *Frame, MV1_TRIANGLE_LIST_BASE *bd,
    const MV1_TLIST_SKIN_POS_4B *v4,
    const MV1_TLIST_SKIN_POS_8B *v8,
    int vertexType, float outPos[ 3 ], float outNrm[ 3 ] )
{
    outPos[ 0 ] = outPos[ 1 ] = outPos[ 2 ] = 0.0f ;
    outNrm[ 0 ] = outNrm[ 1 ] = outNrm[ 2 ] = 0.0f ;
    if ( !Frame || !Frame->UseSkinBoneMatrix || !bd ) return ;

    if ( vertexType == MV1_VERTEX_TYPE_SKIN_4BONE && v4 ) {
        for ( int k = 0 ; k < 4 ; ++k ) {
            float w = v4->MatrixWeight[ k ] ;
            if ( w <= 0.0f ) continue ;
            BYTE idx = v4->MatrixIndex[ k ] ;
            if ( idx >= bd->UseBoneNum ) continue ;
            int boneIdx = bd->UseBone[ idx ] ;
            if ( boneIdx < 0 ) continue ;
            MATRIX_4X4CT *M = Frame->UseSkinBoneMatrix[ boneIdx ] ;
            if ( !M ) continue ;
            float tx, ty, tz ;
            desktop_mv1_mul_mat4x4ct( M, v4->Position, tx, ty, tz ) ;
            outPos[ 0 ] += tx * w ;
            outPos[ 1 ] += ty * w ;
            outPos[ 2 ] += tz * w ;
            float nx, ny, nz ;
            desktop_mv1_mul_mat4x4ct_dir( M, v4->Normal, nx, ny, nz ) ;
            outNrm[ 0 ] += nx * w ;
            outNrm[ 1 ] += ny * w ;
            outNrm[ 2 ] += nz * w ;
        }
    } else if ( vertexType == MV1_VERTEX_TYPE_SKIN_8BONE && v8 ) {
        BYTE idx_all[ 8 ] ;
        for ( int k = 0 ; k < 4 ; ++k ) idx_all[ k ] = v8->MatrixIndex1[ k ] ;
        for ( int k = 0 ; k < 4 ; ++k ) idx_all[ 4 + k ] = v8->MatrixIndex2[ k ] ;
        for ( int k = 0 ; k < 8 ; ++k ) {
            float w = v8->MatrixWeight[ k ] ;
            if ( w <= 0.0f ) continue ;
            if ( idx_all[ k ] >= bd->UseBoneNum ) continue ;
            int boneIdx = bd->UseBone[ idx_all[ k ] ] ;
            if ( boneIdx < 0 ) continue ;
            MATRIX_4X4CT *M = Frame->UseSkinBoneMatrix[ boneIdx ] ;
            if ( !M ) continue ;
            FLOAT4 p = { v8->Position.x, v8->Position.y, v8->Position.z, 1.0f } ;
            float tx, ty, tz ;
            desktop_mv1_mul_mat4x4ct( M, p, tx, ty, tz ) ;
            outPos[ 0 ] += tx * w ;
            outPos[ 1 ] += ty * w ;
            outPos[ 2 ] += tz * w ;
            float nx, ny, nz ;
            desktop_mv1_mul_mat4x4ct_dir( M, v8->Normal, nx, ny, nz ) ;
            outNrm[ 0 ] += nx * w ;
            outNrm[ 1 ] += ny * w ;
            outNrm[ 2 ] += nz * w ;
        }
    }
}

// 頂点 index vi における world 空間位置を取得する (vertex type 毎に分岐)。
// スキニング付きは CPU 計算で bone アニメーションを反映 (v5)。
// FREEBONE (9 bone 以上) は可変長構造体 + MV1_MODEL.SkinBone 経由なので
// 未対応 (base position のまま、T ポーズ)。
static void desktop_mv1_get_vertex_pos(
    MV1_MESH *Mesh, MV1_TRIANGLE_LIST *TList, unsigned short vi,
    float outPos[ 3 ], float outNrm[ 3 ] )
{
    MV1_TRIANGLE_LIST_BASE *bd = TList->BaseData ;
    MV1_FRAME *Frame = Mesh ? Mesh->Container : nullptr ;
    outNrm[ 0 ] = 0 ; outNrm[ 1 ] = 1 ; outNrm[ 2 ] = 0 ;  // デフォルト上向き

    switch ( bd->VertexType ) {
    case MV1_VERTEX_TYPE_NORMAL: {
        const MV1_TLIST_NORMAL_POS &v = TList->NormalPosition[ vi ] ;
        outPos[ 0 ] = v.Position.x ; outPos[ 1 ] = v.Position.y ; outPos[ 2 ] = v.Position.z ;
        outNrm[ 0 ] = v.Normal.x   ; outNrm[ 1 ] = v.Normal.y   ; outNrm[ 2 ] = v.Normal.z ;
        return ;
    }
    case MV1_VERTEX_TYPE_SKIN_4BONE:
        desktop_mv1_skin_vertex( Frame, bd,
            &TList->SkinPosition4B[ vi ], nullptr,
            MV1_VERTEX_TYPE_SKIN_4BONE, outPos, outNrm ) ;
        return ;
    case MV1_VERTEX_TYPE_SKIN_8BONE:
        desktop_mv1_skin_vertex( Frame, bd,
            nullptr, &TList->SkinPosition8B[ vi ],
            MV1_VERTEX_TYPE_SKIN_8BONE, outPos, outNrm ) ;
        return ;
    case MV1_VERTEX_TYPE_SKIN_FREEBONE: {
        const unsigned char *base = ( const unsigned char * )TList->SkinPositionFREEB ;
        int unitSize = bd->PosUnitSize ;
        const MV1_TLIST_SKIN_POS_FREEB *v =
            ( const MV1_TLIST_SKIN_POS_FREEB * )( base + ( size_t )vi * unitSize ) ;
        outPos[ 0 ] = outPos[ 1 ] = outPos[ 2 ] = 0.0f ;
        outNrm[ 0 ] = outNrm[ 1 ] = outNrm[ 2 ] = 0.0f ;
        if ( !Frame || !Frame->UseSkinBoneMatrix ) {
            outPos[ 0 ] = v->Position.x ; outPos[ 1 ] = v->Position.y ; outPos[ 2 ] = v->Position.z ;
            outNrm[ 0 ] = v->Normal.x   ; outNrm[ 1 ] = v->Normal.y   ; outNrm[ 2 ] = v->Normal.z ;
            return ;
        }
        const MV1_SKINBONE_BLEND *b = v->MatrixWeight ;
        int maxBones = bd->MaxBoneNum > 0 ? bd->MaxBoneNum : 256 ;
        VECTOR n3 = { v->Normal.x, v->Normal.y, v->Normal.z } ;
        for ( int k = 0 ; k < maxBones && b[ k ].Index != -1 ; ++k ) {
            float w = b[ k ].W ;
            if ( w <= 0.0f ) continue ;
            int idx = b[ k ].Index ;
            MATRIX_4X4CT *M = Frame->UseSkinBoneMatrix[ idx ] ;
            if ( !M ) continue ;
            float tx, ty, tz ;
            desktop_mv1_mul_mat4x4ct( M, v->Position, tx, ty, tz ) ;
            outPos[ 0 ] += tx * w ;
            outPos[ 1 ] += ty * w ;
            outPos[ 2 ] += tz * w ;
            float nx, ny, nz ;
            desktop_mv1_mul_mat4x4ct_dir( M, n3, nx, ny, nz ) ;
            outNrm[ 0 ] += nx * w ;
            outNrm[ 1 ] += ny * w ;
            outNrm[ 2 ] += nz * w ;
        }
        return ;
    }
    default:
        outPos[ 0 ] = outPos[ 1 ] = outPos[ 2 ] = 0.0f ;
        return ;
    }
}

// Toon outline (inverted-hull 法): 頂点を法線方向に押し出した「反転殻」を
// 前面カリングで描画して輪郭線を作る。drawModel の 1 回目のパスとして呼ぶ。
static void desktop_mv1_draw_outline_pass( MV1_MESH *Mesh, MV1_TRIANGLE_LIST *TList )
{
    if ( !TList || !TList->BaseData ) return ;
    if ( !Mesh || !Mesh->BaseData || !Mesh->Material || !Mesh->Material->BaseData ) return ;
    MV1_MATERIAL_BASE *mb = Mesh->Material->BaseData ;
    float width = mb->OutLineWidth ;
    if ( width <= 0.0f ) return ;  // outline 無効なマテリアル
    MV1_TRIANGLE_LIST_BASE *bd = TList->BaseData ;
    if ( !bd->Index || bd->IndexNum < 3 ) return ;

    // 前面カリング (inverted-hull)
    glEnable( GL_CULL_FACE ) ;
    glCullFace( GL_FRONT ) ;
    glDisable( GL_TEXTURE_2D ) ;

    COLOR_F &oc = mb->OutLineColor ;
    glColor4f( oc.r, oc.g, oc.b, oc.a > 0 ? oc.a : 1.0f ) ;

    // Vertex-scale 係数: 頂点の ToonOutLineScale を material width に掛ける
    MV1_MESH_BASE *mbase = Mesh->BaseData ;
    unsigned char *vraw = ( unsigned char * )mbase->Vertex ;
    int vsize = mbase->VertUnitSize ;

    glBegin( GL_TRIANGLES ) ;
    for ( int i = 0 ; i + 2 < bd->IndexNum ; i += 3 ) {
        for ( int k = 0 ; k < 3 ; ++k ) {
            unsigned short vi = bd->Index[ i + k ] ;
            if ( vi >= bd->VertexNum ) continue ;
            float p[ 3 ], n[ 3 ] ;
            desktop_mv1_get_vertex_pos( Mesh, TList, vi, p, n ) ;

            // 頂点毎 scale
            DWORD meshVi = bd->MeshVertexIndex ? bd->MeshVertexIndex[ vi ] : ( DWORD )vi ;
            float vscale = 1.0f ;
            if ( vraw && vsize > 0 ) {
                MV1_MESH_VERTEX *mv = ( MV1_MESH_VERTEX * )( vraw + meshVi * vsize ) ;
                if ( mv->ToonOutLineScale > 0 ) vscale = mv->ToonOutLineScale ;
            }
            float w = width * vscale ;
            glVertex3f( p[ 0 ] + n[ 0 ] * w,
                        p[ 1 ] + n[ 1 ] * w,
                        p[ 2 ] + n[ 2 ] * w ) ;
        }
    }
    glEnd() ;

    // 元のカリング設定に戻す (呼び側が CullFace(GL_BACK) を改めて指定する想定)
    glCullFace( GL_BACK ) ;
}

// 単一トライアングルリストを描画。全 VertexType 対応。
static void desktop_mv1_draw_triangle_list( MV1_MESH *Mesh, MV1_TRIANGLE_LIST *TList )
{
    if ( !TList || !TList->BaseData ) return ;
    MV1_TRIANGLE_LIST_BASE *bd = TList->BaseData ;
    if ( !bd->Index || bd->IndexNum < 3 ) return ;
    if ( !Mesh || !Mesh->BaseData ) return ;
    // NormalPosition (union) ポインタが無効なら描画不可
    if ( !TList->NormalPosition ) return ;
    if ( !Mesh || !Mesh->BaseData ) return ;

    // マテリアルから Diffuse と DiffuseLayer[0..N-1] (multi-texture) を取得
    GLubyte mR = 200, mG = 200, mB = 200, mA = 255 ;
    GLuint texId  = 0 ;        // layer 0 (メイン texture、multi-tex 無し経路と互換)
    int    layerN = 0 ;        // 有効 DiffuseLayer 数 (最大 4 までに制限)
    GLuint layerTex [ 8 ] = { 0 } ;
    int    layerBlend[ 8 ] = { 0 } ;
    bool useVertexColor = Mesh->BaseData->UseVertexDiffuseColor != 0 ;
    if ( Mesh->Material && Mesh->Material->BaseData ) {
        MV1_MATERIAL_BASE *mb = Mesh->Material->BaseData ;
        COLOR_F &d = mb->Diffuse ;
        float ds = Mesh->DrawMaterial.UseColorScale ? Mesh->DrawMaterial.DiffuseScale.r : 1.0f ;
        float dg = Mesh->DrawMaterial.UseColorScale ? Mesh->DrawMaterial.DiffuseScale.g : 1.0f ;
        float db = Mesh->DrawMaterial.UseColorScale ? Mesh->DrawMaterial.DiffuseScale.b : 1.0f ;
        float op = Mesh->DrawMaterial.OpacityRate ;
        if ( op <= 0 ) op = 1.0f ;
        mR = ( GLubyte )( fminf( d.r * ds, 1.0f ) * 255 ) ;
        mG = ( GLubyte )( fminf( d.g * dg, 1.0f ) * 255 ) ;
        mB = ( GLubyte )( fminf( d.b * db, 1.0f ) * 255 ) ;
        mA = ( GLubyte )( fminf( d.a * op, 1.0f ) * 255 ) ;
        int maxLayers = mb->DiffuseLayerNum ;
        if ( maxLayers > 4 ) maxLayers = 4 ;  // fixed-function は 4 TMU 程度まで安全
        for ( int li = 0 ; li < maxLayers ; ++li ) {
            GLuint t = desktop_mv1_tex_from_graph( mb->DiffuseLayer[ li ].GraphHandle ) ;
            if ( t == 0 ) continue ;
            layerTex  [ layerN ] = t ;
            layerBlend[ layerN ] = mb->DiffuseLayer[ li ].BlendType ;
            if ( layerN == 0 ) texId = t ;
            layerN++ ;
        }
        // スペキュラ・エミッシブ (glMaterialfv で設定、ColorMaterial は
        // diffuse/ambient のみカバー)
        if ( s_MV1_LightWasOn ) {
            float sclS = Mesh->DrawMaterial.UseColorScale ? Mesh->DrawMaterial.SpecularScale.r : 1.0f ;
            float sclE = Mesh->DrawMaterial.UseColorScale ? Mesh->DrawMaterial.EmissiveScale.r : 1.0f ;
            float spc[ 4 ] = {
                mb->Specular.r * sclS, mb->Specular.g * sclS, mb->Specular.b * sclS, 1.0f
            } ;
            float emi[ 4 ] = {
                mb->Emissive.r * sclE, mb->Emissive.g * sclE, mb->Emissive.b * sclE, 1.0f
            } ;
            glMaterialfv( GL_FRONT_AND_BACK, GL_SPECULAR, spc ) ;
            glMaterialfv( GL_FRONT_AND_BACK, GL_EMISSION, emi ) ;
            float power = mb->Power ;
            if ( power < 0.0f ) power = 0.0f ;
            if ( power > 128.0f ) power = 128.0f ;
            glMaterialf( GL_FRONT_AND_BACK, GL_SHININESS, power ) ;
        }
    }

    // BackCulling
    int bc = Mesh->BaseData->BackCulling ;
    if ( bc ) { glEnable( GL_CULL_FACE ) ; glCullFace( GL_BACK ) ; }
    else     { glDisable( GL_CULL_FACE ) ; }

    // テクスチャバインド (multi-texture 対応、最大 4 unit)
    //   Layer 0 : GL_MODULATE (glColor × tex)
    //   Layer 1+ : BlendType に応じて GL_ADD / GL_MODULATE / GL_DECAL
    //     DX_MATERIAL_BLENDTYPE_TRANSLUCENT(0) → GL_DECAL (tex alpha で混合)
    //     DX_MATERIAL_BLENDTYPE_ADDITIVE   (1) → GL_ADD
    //     DX_MATERIAL_BLENDTYPE_MODULATE   (2) → GL_MODULATE
    //     DX_MATERIAL_BLENDTYPE_NONE       (3) → GL_REPLACE
#ifdef GL_TEXTURE0
    auto to_tex_env = []( int bt ) -> GLenum {
        switch ( bt ) {
        case 1 /*ADDITIVE*/:   return GL_ADD ;
        case 2 /*MODULATE*/:   return GL_MODULATE ;
        case 3 /*NONE*/:       return GL_REPLACE ;
        default /*TRANSLUCENT*/: return GL_DECAL ;
        }
    } ;
    for ( int li = 0 ; li < layerN ; ++li ) {
        glActiveTexture( GL_TEXTURE0 + li ) ;
        glEnable( GL_TEXTURE_2D ) ;
        glBindTexture( GL_TEXTURE_2D, layerTex[ li ] ) ;
        GLenum mode = ( li == 0 ) ? GL_MODULATE : to_tex_env( layerBlend[ li ] ) ;
        glTexEnvi( GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, mode ) ;
    }
    glActiveTexture( GL_TEXTURE0 ) ;  // 頂点属性送信は TMU 0 を主とする
    if ( layerN == 0 ) glDisable( GL_TEXTURE_2D ) ;
#else
    if ( texId ) {
        glEnable( GL_TEXTURE_2D ) ;
        glBindTexture( GL_TEXTURE_2D, texId ) ;
        glTexEnvi( GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE ) ;
    } else {
        glDisable( GL_TEXTURE_2D ) ;
    }
#endif

    // 頂点データ配列 (UV / DiffuseColor を引くのに使う)。VertUnitSize 可変なので
    // ポインタ算術で要素取得する
    MV1_MESH_BASE *mb = Mesh->BaseData ;
    unsigned char *vraw = ( unsigned char * )mb->Vertex ;
    int vsize = mb->VertUnitSize ;
    bool hasUV = ( mb->UVUnitNum > 0 ) ;

    glBegin( GL_TRIANGLES ) ;
    for ( int i = 0 ; i + 2 < bd->IndexNum ; i += 3 ) {
        for ( int k = 0 ; k < 3 ; ++k ) {
            unsigned short vi = bd->Index[ i + k ] ;
            if ( vi >= bd->VertexNum ) { glEnd() ; glBegin( GL_TRIANGLES ) ; continue ; }

            // トライアングルリスト vi → メッシュ vertex メタ index
            DWORD meshVi = bd->MeshVertexIndex ? bd->MeshVertexIndex[ vi ] : ( DWORD )vi ;
            MV1_MESH_VERTEX *mv = ( vraw && vsize > 0 )
                ? ( MV1_MESH_VERTEX * )( vraw + meshVi * vsize )
                : nullptr ;

            if ( mv && hasUV && texId ) {
                glTexCoord2f( mv->UVs[ 0 ][ 0 ], mv->UVs[ 0 ][ 1 ] ) ;
#ifdef GL_TEXTURE0
                // multi-texture layer 1+ にも同じ UV を供給 (UV1 が別にあれば UVs[1] を使用)
                for ( int ti = 1 ; ti < layerN ; ++ti ) {
                    float u = mv->UVs[ 0 ][ 0 ] ;
                    float v = mv->UVs[ 0 ][ 1 ] ;
                    // UV unit が複数あれば対応する UV をバインド (2 段以上の tex UV)
                    if ( mb->UVUnitNum > ti ) {
                        u = mv->UVs[ ti ][ 0 ] ; v = mv->UVs[ ti ][ 1 ] ;
                    }
                    glMultiTexCoord2f( GL_TEXTURE0 + ti, u, v ) ;
                }
#endif
            }
            if ( useVertexColor && mv ) {
                // COLOR_U8 は b,g,r,a 順 (DxLib 内部)
                glColor4ub( mv->DiffuseColor.r, mv->DiffuseColor.g,
                            mv->DiffuseColor.b, mv->DiffuseColor.a ) ;
            } else {
                glColor4ub( mR, mG, mB, mA ) ;
            }

            float p[ 3 ], n[ 3 ] ;
            desktop_mv1_get_vertex_pos( Mesh, TList, vi, p, n ) ;
            glNormal3f( n[ 0 ], n[ 1 ], n[ 2 ] ) ;
            glVertex3f( p[ 0 ], p[ 1 ], p[ 2 ] ) ;
        }
    }
    glEnd() ;

    // テクスチャアンバインド (multi-texture 対応)
#ifdef GL_TEXTURE0
    for ( int li = 0 ; li < layerN ; ++li ) {
        glActiveTexture( GL_TEXTURE0 + li ) ;
        glBindTexture( GL_TEXTURE_2D, 0 ) ;
        glDisable( GL_TEXTURE_2D ) ;
    }
    glActiveTexture( GL_TEXTURE0 ) ;
#else
    if ( texId ) {
        glBindTexture( GL_TEXTURE_2D, 0 ) ;
        glDisable( GL_TEXTURE_2D ) ;
    }
#endif
}

extern void MV1_DrawMesh_PF( MV1_MESH *Mesh, int TriangleListIndex )
{
    if ( !Mesh || !Mesh->BaseData ) return ;
    if ( !Mesh->BaseData->Visible ) return ;

    MV1_MESH_BASE *mb = Mesh->BaseData ;
    // マテリアルに OutLineWidth > 0 があれば Toon 輪郭パス (inverted-hull) を先に
    bool hasOutline = ( Mesh->Material && Mesh->Material->BaseData &&
                         Mesh->Material->BaseData->OutLineWidth > 0.0f ) ;
    if ( hasOutline ) {
        // ライティング無しで単色塗り (outline 色)
        GLboolean wasLit = glIsEnabled( GL_LIGHTING ) ;
        if ( wasLit ) glDisable( GL_LIGHTING ) ;
        if ( TriangleListIndex < 0 ) {
            for ( int k = 0 ; k < mb->TriangleListNum ; ++k ) {
                desktop_mv1_draw_outline_pass( Mesh, &Mesh->TriangleList[ k ] ) ;
            }
        } else if ( TriangleListIndex < mb->TriangleListNum ) {
            desktop_mv1_draw_outline_pass( Mesh, &Mesh->TriangleList[ TriangleListIndex ] ) ;
        }
        if ( wasLit ) glEnable( GL_LIGHTING ) ;
    }

    if ( TriangleListIndex < 0 ) {
        // 全トライアングルリスト描画
        for ( int k = 0 ; k < mb->TriangleListNum ; ++k ) {
            desktop_mv1_draw_triangle_list( Mesh, &Mesh->TriangleList[ k ] ) ;
        }
    } else if ( TriangleListIndex < mb->TriangleListNum ) {
        desktop_mv1_draw_triangle_list( Mesh, &Mesh->TriangleList[ TriangleListIndex ] ) ;
    }
}

#ifndef DX_NON_NAMESPACE
} // end namespace DxLib
#endif

#endif // DX_NON_MODEL
