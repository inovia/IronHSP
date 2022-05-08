//
//		Draw lib (iOS/android/opengl/ndk)
//			onion software/onitama 2011/11
//


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <string.h>

#include "stb_image.h"

#ifdef HSPEMSCRIPTEN
#include "../../hsp3/hsp3config.h"
#else
#include "../hsp3config.h"
#endif

#ifdef HSPNDK
#define USE_JAVA_FONT
#define FONT_TEX_SX 512
#define FONT_TEX_SY 128
#include "../../appengine.h"
#include "../../javafunc.h"
#include "font_data.h"
#endif

#ifdef HSPIOS
//#include <OpenGLES/EAGL.h>
#include <OpenGLES/ES1/gl.h>
#include <OpenGLES/ES1/glext.h>
#include <CoreFoundation/CoreFoundation.h>
#include "iOSBridge.h"
#include "appengine.h"
#endif

#ifdef HSPEMSCRIPTEN
#define USE_JAVA_FONT
#define FONT_TEX_SX 512
#define FONT_TEX_SY 128
//#include <GLES2/gl2.h>
//#include <EGL/egl.h>
#define GL_GLEXT_PROTOTYPES
#include <GL/gl.h>
#include <GL/glext.h>
//#include <GL/glut.h>

#include "SDL/SDL.h"
#include "SDL/SDL_image.h"
#include "SDL/SDL_opengl.h"

#include "appengine.h"
extern bool get_key_state(int sym);
#endif

#include "../supio.h"
#include "../sysreq.h"
#include "../hgio.h"

static		HSPREAL infoval[GINFO_EXINFO_MAX];

/*-------------------------------------------------------------------------------*/

#define CIRCLE_DIV 20
#define DEFAULT_FONT_NAME ""
#define DEFAULT_FONT_SIZE 14
#define DEFAULT_FONT_STYLE 0

//色
typedef struct{
    unsigned char r;
    unsigned char g;
    unsigned char b;
    unsigned char a;
} Color;

static float linebasex, linebasey;


//テクスチャ頂点情報
static GLfloat panelVertices[]={
     0,  0, //左上
     0, -1, //左下
     1,  0, //右上
     1, -1, //右下
};

//テクスチャUV情報
static const GLfloat panelUVs[]={
    0.0f, 0.0f, //左上
    0.0f, 1.0f, //左下
    1.0f, 0.0f, //右上
    1.0f, 1.0f, //右下
};

static GLbyte panelColors[]={
    (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff,
    (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff,
    (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff,
    (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff,
};

static GLbyte panelColorsTex[]={
    (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff,
    (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff,
    (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff,
    (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff, (GLbyte)0xff,
};

#define FVAL_BYTE1 (1.0f/256.0f)

//	グラフィックス設定
static int _bgsx, _bgsy;	//背景サイズ
static int _sizex, _sizey;	//初期サイズ
static Color _color;   	//色
static int   _flipMode;	//フリップ
static int   _originX; 	//原点X
static int   _originY; 	//原点Y
static GLint  _filter;	//フィルタ
static float center_x, center_y;
static float _scaleX;	// スケールX
static float _scaleY;	// スケールY
static float _rateX;	// 1/スケールX
static float _rateY;	// 1/スケールY
static int _uvfix;		// UVFix

static int		drawflag;
static engine	*appengine;
static BMSCR    *mainbm = NULL;

static		BMSCR *backbm;		// 背景消去用のBMSCR(null=NC)

static int		mouse_x;
static int		mouse_y;
static int		mouse_btn;

static	int  font_texid;
static	int  font_sx, font_sy;
static	int  mes_sx, mes_sy;
static	int  font_size;
static	int  font_style;

static	GLfloat _line_vertexs[16*3];
static	GLbyte  _line_colors[16*4];

#ifdef HSPIOS
static	double  total_tick;
static	CFAbsoluteTime  lastTime;
#endif

/*------------------------------------------------------------*/
/*
		Polygon Draw Routines
*/
/*------------------------------------------------------------*/

//テクスチャ頂点情報
static GLfloat vert2D[]={
    0,  0, //左上
    0, -1, //左下
    1,  0, //右上
    1, -1, //右下
};

static GLfloat vertf2D[]={
    0,  0, //左上
    0, -1, //左下
    1,  0, //右上
    1, -1, //右下
};

//テクスチャUV情報
static GLfloat uv2D[]={
    0.0f, 0.0f, //左上
    0.0f, 1.0f, //左下
    1.0f, 0.0f, //右上
    1.0f, 1.0f, //右下
};

static GLfloat uvf2D[]={
    0.0f, 0.0f, //左上
    0.0f, 1.0f, //左下
    1.0f, 0.0f, //右上
    1.0f, 1.0f, //右下
};

#ifndef HSPEMSCRIPTEN
static void gluPerspective(double fovy, double aspect, double zNear, double zFar) {
    GLfloat xmin, xmax, ymin, ymax;
    ymax = zNear * tan(fovy * M_PI / 360.0);
    ymin = -ymax;
    xmin = ymin * aspect;
    xmax = ymax * aspect;
    glFrustumf(xmin, xmax, ymin, ymax, zNear, zFar);
}
#endif

/*-------------------------------------------------------------------------------*/
/*
		Draw Service
*/
/*-------------------------------------------------------------------------------*/

void hgio_init( int mode, int sx, int sy, void *hwnd )
{
#ifdef HSPIOS
	gb_init();	//		IOS グラフィック初期化
    gb_reset( sx, sy );
#endif
    
	//テクスチャ初期化
	TexInit();

	//背景サイズ
	_bgsx = sx;
	_bgsy = sy;
	_sizex = sx;
	_sizey = sy;
	_scaleX = 1.0f;
	_scaleY = 1.0f;
	_rateX = 1.0f;
	_rateY = 1.0f;
	_uvfix = 0;

    //色
    hgio_setColor( 0 );

	//グラフィックス設定
	_flipMode = GRAPHICS_FLIP_NONE;
	_originX = 0;
	_originY = 0;
	_filter = GL_NEAREST;
	drawflag = 0;
	mainbm = NULL;
	backbm = NULL;
	appengine = (engine *)hwnd;
	hgio_touch( 0,0,0 );

	//		設定の初期化
	//
	SetSysReq( SYSREQ_RESULT, 0 );
	SetSysReq( SYSREQ_RESVMODE, 0 );
	SetSysReq( SYSREQ_CLSMODE, CLSMODE_SOLID );
	SetSysReq( SYSREQ_CLSCOLOR, 0 );
//	SetSysReq( SYSREQ_CLSCOLOR, 0xffffff );

    //クリア色の設定
	//hgio_reset();
	Alertf( "Init:HGIOScreen(%d,%d)",sx,sy );

	//フォント準備
#if defined(HSPNDK) || defined(HSPEMSCRIPTEN)
	#ifdef USE_JAVA_FONT
	//font_texid = MakeEmptyTex( FONT_TEX_SX, FONT_TEX_SY );
	#else
	font_texid = RegistTexMem( font_data, font_data_size );
	#endif
#endif
	font_sx = 16;
	font_sy = 16;

	//		infovalをリセット
	//
	int i;
	for(i=0;i<GINFO_EXINFO_MAX;i++) {
		infoval[i] = 0.0;
	}

    //  timer initalize
#ifdef HSPIOS
    total_tick = 0.0;
    lastTime = CFAbsoluteTimeGetCurrent();
#endif

}


void hgio_size( int sx, int sy )
{
	_sizex = sx;
	_sizey = sy;
}


void hgio_view( int sx, int sy )
{
	_bgsx = sx;
	_bgsy = sy;
    //Alertf( "Size(%d,%d)",_bgsx,_bgsy );
}


void hgio_scale( float xx, float yy )
{
	_scaleX = xx;
	_scaleY = yy;
    //Alertf( "Scale(%f,%f)",_scaleX,_scaleY );
}


void hgio_autoscale( int mode )
{
	int m_mode;
	float x,y;
	float adjx,adjy;
	adjx = (float)_sizex/(float)_bgsx;
	adjy = (float)_sizey/(float)_bgsy;

	m_mode = mode;
	if ( mode == 0 ) {
		x = (float)_bgsx * adjy;
		y = (float)_bgsy * adjx;
		if ( adjx > adjy ) {
			m_mode=1;
			if ( y > (float)_sizey ) { m_mode=2; }
		} else {
			m_mode=2;
			if ( x > (float)_sizex ) { m_mode=1; }
		}
	}

	switch( m_mode ) {
	case 1:
		_scaleX = adjx;
		_scaleY = adjx;
		break;
	case 2:
		_scaleX = adjy;
		_scaleY = adjy;
		break;
	default:
		_scaleX = adjx;
		_scaleY = adjy;
		break;
	}
    Alertf( "Scale(%f,%f)",_scaleX,_scaleY );
}


void hgio_uvfix( int mode )
{
	_uvfix = mode;

}


void hgio_reset( void )
{
    //投影変換
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();

	float ox,oy;
	_rateX = 1.0f / _scaleX;
	_rateY = 1.0f / _scaleY;
	ox = (float)_bgsx;
	oy = (float)_bgsy;

#ifndef HSPEMSCRIPTEN
	glOrthof( 0, ox, -oy, 0,-100,100);
#else
	glOrtho( 0, ox, -oy, 0,-100,100);
#endif

//    glOrthof( 0, 320.0f, -480.0f, 0,-100,100);
//    glOrthof( 0, _bgsx * _scaleX, -_bgsy * _scaleY, 0,-100,100);
    //glTranslatef(engine->width/2,engine->height/2,0);

    //ビューポート変換
	_originX = ( _sizex - (ox * _scaleX) ) / 2;
	_originY = ( _sizey - (oy * _scaleY) ) / 2;
//    Alertf( "(%f,%f)(%d,%d)(%f,%f)",ox,oy,_originX, _originY, _scaleX,_scaleY );

    glViewport((float)_originX,(float)_originY,ox * _scaleX,oy * _scaleY);
//	glViewport(_originX,_originY, ox, oy );
//	glViewport(_originX,-_originY, _sizex, _sizey );
    
    //モデリング変換
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glDisable(GL_LIGHTING);
    glDisable(GL_CULL_FACE);
    glDisable(GL_DEPTH_BUFFER_BIT);
    glDisable(GL_DEPTH_TEST);
    //glClearColor(.7f, .7f, .9f, 1.f);
    //glShadeModel(GL_SMOOTH);

    
    //頂点配列の設定
    glVertexPointer(2,GL_FLOAT,0,panelVertices);
    glEnableClientState(GL_VERTEX_ARRAY);
    
    //UVの設定
    glTexCoordPointer(2,GL_FLOAT,0,panelUVs);
        
    //テクスチャの設定
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
#if defined(HSPEMSCRIPTEN)
	glDisable(GL_TEXTURE_2D);
#else
    glEnable(GL_TEXTURE_2D);
#endif

        
    //ブレンドの設定
    glEnable(GL_BLEND);
#ifdef HSPIOS
    glBlendEquationOES(GL_FUNC_ADD_OES);
#endif
    glBlendFunc(GL_ONE,GL_ONE_MINUS_SRC_ALPHA);

    //ポイントの設定
    glEnable(GL_POINT_SMOOTH);

    //前処理
//    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_LINEAR); 
//    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR); 
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_NEAREST); 
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST); 

	//テクスチャ設定リセット
	TexReset();

	//フォント描画リセット
#if defined(HSPNDK) || defined(HSPEMSCRIPTEN)
#ifdef USE_JAVA_FONT
	TexProc();
#endif
#endif

}

void hgio_term( void )
{
	hgio_render_end();
	TexTerm();
}


void hgio_resume( void )
{
	//	画面リソースの再構築
	//

	//テクスチャ初期化
	TexInit();

#if defined(HSPNDK) || defined(HSPEMSCRIPTEN)
	#ifdef USE_JAVA_FONT
	//font_texid = MakeEmptyTex( FONT_TEX_SX, FONT_TEX_SY );
	#else
	font_texid = RegistTexMem( font_data, font_data_size );
	#endif
#endif
}


void hgio_setback( BMSCR *bm )
{
	//		背景画像の設定
	//		(NULL=なし)
	//
	backbm = bm;
}


/*-------------------------------------------------------------------------------*/

void hgio_clear( void )
{
	glClear(GL_COLOR_BUFFER_BIT); 
}


void hgio_setClear( int rval, int gval ,int bval )
{
	glClearColor((GLclampf)(FVAL_BYTE1 * (float)rval), (GLclampf)(FVAL_BYTE1 * (float)gval), (GLclampf)(FVAL_BYTE1 * (float)bval), 1 );
}


void hgio_setFilterMode( int mode )
{
    switch( mode ) {
        case 0:
            _filter = GL_NEAREST;
            break;
        default:
            _filter = GL_LINEAR;
            break;
    }
}

void hgio_setBlendMode( int mode, int aval )
{
    //ブレンドモード設定
    switch( mode ) {
        case 0:                     //no blend
        case 1:                     //no blend
            glDisable(GL_BLEND);
            break;
        case 5:                     //add
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_ADD_OES);
#endif
            glBlendFunc(GL_SRC_ALPHA,GL_ONE);
            break;
        case 6:                     //sub
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_REVERSE_SUBTRACT_OES);
#endif
            glBlendFunc(GL_SRC_ALPHA,GL_ONE);
            break;
        default:                    //normal blend
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_ADD_OES);
#endif
            glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
            //glBlendFunc(GL_ONE,GL_ONE_MINUS_SRC_ALPHA);
            break;
    }
    if ( mode >= 3 ) {
        panelColorsTex[3] = panelColorsTex[4+3] = panelColorsTex[8+3] = panelColorsTex[12+3] = aval;
        glEnableClientState(GL_COLOR_ARRAY);
        glColorPointer(4,GL_UNSIGNED_BYTE,0,panelColorsTex);
    } else {
        glDisableClientState(GL_COLOR_ARRAY);
    }
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,_filter); 
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,_filter); 
}

void hgio_setBlendModeFlat( int mode )
{
    //ブレンドモード設定(単色)
    switch( mode ) {
        case 0:                     //no blend
            glDisable(GL_BLEND);
            break;
        case 5:                     //add
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_ADD_OES);
#endif
            glBlendFunc(GL_SRC_ALPHA,GL_ONE);
            break;
        case 6:                     //sub
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_REVERSE_SUBTRACT_OES);
#endif
            glBlendFunc(GL_SRC_ALPHA,GL_ONE);
            break;
        default:                    //normal blend
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_ADD_OES);
#endif
            glBlendFunc(GL_ONE,GL_ONE_MINUS_SRC_ALPHA);
            break;
    }
}

void hgio_setBlendModeFlatAlpha( int mode )
{
    //ブレンドモード設定(単色+Alpha)
    switch( mode ) {
        case 0:                     //no blend
            glDisable(GL_BLEND);
            break;
        case 3:                     //blend
        case 4:                     //blend
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_ADD_OES);
#endif
            glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
            break;
        case 5:                     //add
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_ADD_OES);
#endif
            glBlendFunc(GL_SRC_ALPHA,GL_ONE);
            break;
        case 6:                     //sub
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_REVERSE_SUBTRACT_OES);
#endif
            glBlendFunc(GL_SRC_ALPHA,GL_ONE);
            break;
        default:                    //normal blend
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_ADD_OES);
#endif
            glBlendFunc(GL_ONE,GL_ONE_MINUS_SRC_ALPHA);
            break;
    }
}

//色の指定
void hgio_setColor( int color )
{
    _color.r = (color>>16)&0xff;
    _color.g = (color>>8)&0xff;
    _color.b = (color)&0xff;
    _color.a = 0xff;
}

//ライン幅の指定
void hgio_setLineWidth( int lineWidth )
{
    glLineWidth(lineWidth);
    glPointSize(lineWidth*0.6f);
}

//フリップモードの指定
void hgio_setFlipMode( int flipMode )
{
    _flipMode=flipMode;
}

//原点の指定
void hgio_setOrigin( int x, int y )
{
    _originX=x;
    _originY=y;
}

void hgio_scale_point( int xx, int yy, int *x, int *y )
{
	*x = ( xx - _originX ) * _rateX;

	*y = ( yy - _originY ) * _rateY;
}

/*-------------------------------------------------------------------------------*/

void hgio_clsmode( int mode, int color, int tex )
{
	SetSysReq( SYSREQ_CLSMODE, mode );
	SetSysReq( SYSREQ_CLSCOLOR, color );
	SetSysReq( SYSREQ_CLSTEX, tex );
}


int hgio_getWidth( void )
{
	return _bgsx;
}


int hgio_getHeight( void )
{
	return _bgsy;
}


void hgio_setfilter( int type, int opt )
{
	hgio_setFilterMode( type );
}


int hgio_title( char *str1 )
{
	return 0;
}


int hgio_stick( int actsw )
{
	int ckey = 0;
	if ( mouse_btn ) ckey|=256;	// mouse_l
#ifdef HSPEMSCRIPTEN
	if ( get_key_state(SDLK_LEFT) )  ckey|=1;		// [left]
	if ( get_key_state(SDLK_UP) )    ckey|=2;		// [up]
	if ( get_key_state(SDLK_RIGHT) ) ckey|=4;		// [right]
	if ( get_key_state(SDLK_DOWN) )  ckey|=8;		// [down]
	if ( get_key_state(SDLK_SPACE) ) ckey|=16;		// [spc]
	if ( get_key_state(SDLK_RETURN) )ckey|=32;		// [ent]
	if ( get_key_state(SDLK_LCTRL) ) ckey|=64;		// [ctrl]
	if ( get_key_state(SDLK_ESCAPE) )ckey|=128;	// [esc]
	if ( get_key_state(SDLK_TAB) )   ckey|=1024;	// [tab]
#endif
	return ckey;
}


int hgio_font( char *fontname, int size, int style )
{
	font_size = size;
	font_style = style;
#ifdef HSPIOS
    gb_font( size, style, fontname );
#endif
	return 0;
}


int hgio_mes( BMSCR *bm, char *str1 )
{
#if defined(HSPNDK) || defined(HSPEMSCRIPTEN)
	hgio_putTexFont( bm->cx, bm->cy, str1, bm->color );
	bm->printsizex = mes_sx;
	bm->printsizey = mes_sy;
	//LOGI( str1 );
#endif
#ifdef HSPIOS
    gb_mes( bm, str1 );
#endif
	return 0;
}


int hgio_texload( BMSCR *bm, char *fname )
{
	TEXINF *t;
	int texid;

	hgio_delscreen( bm );

	texid = RegistTex( fname );
	if ( texid < 0 ) return -1;

	t = GetTex( texid );
	if ( t->mode == TEXMODE_NONE ) return -1;

	bm->sx = t->width;
	bm->sy = t->height;
	bm->texid = texid;

	return texid;
}

/*-------------------------------------------------------------------------------*/

//ポイントカラー設定
void hgio_panelcolor( int color, int aval )
{
    int rval,gval,bval;
    rval = (color>>16)&0xff;
    gval = (color>>8)&0xff;
    bval = (color)&0xff;
    
    for (int i=0;i<4;i++) {
        panelColors[i*4  ]=rval;
        panelColors[i*4+1]=gval;
        panelColors[i*4+2]=bval;
        panelColors[i*4+3]=aval;
    }
    glEnableClientState(GL_COLOR_ARRAY);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,panelColors);
}

//ポイントカラー設定
void hgio_panelcolor_direct( int id, int color, int aval )
{
    int rval,gval,bval;
    rval = (color>>16)&0xff;
    gval = (color>>8)&0xff;
    bval = (color)&0xff;

    panelColors[id*4  ]=rval;
    panelColors[id*4+1]=gval;
    panelColors[id*4+2]=bval;
    panelColors[id*4+3]=aval;

	if ( id == 3 ) {
	    glEnableClientState(GL_COLOR_ARRAY);
	    glColorPointer(4,GL_UNSIGNED_BYTE,0,panelColors);
	}
}

//ポイント描画
void hgio_pset( float x, float y )
{
    GLfloat _vertexs[16*3];
    GLbyte  _colors[16*4];

     //頂点配列情報
     _vertexs[0]= x;_vertexs[1]=-y;_vertexs[2]=0;
     
     //カラー配列情報
     _colors[0]=_color.r;
     _colors[1]=_color.g;
     _colors[2]=_color.b;
     _colors[3]=_color.a;

    hgio_setBlendModeFlat(0);
    //glBindTexture(GL_TEXTURE_2D,0);
    glEnableClientState(GL_COLOR_ARRAY);
    glVertexPointer(3,GL_FLOAT,0,_vertexs);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,_colors);
    glDrawArrays(GL_POINTS,0,1);
}


//矩形の描画
void hgio_rect( float x, float y, float w, float h )
{
    GLfloat _vertexs[16*3];
    GLbyte  _colors[16*4];

    //頂点配列情報
    _vertexs[0]= x;  _vertexs[1] =-y;  _vertexs[2] =0;
    _vertexs[3]= x;  _vertexs[4] =-y-h;_vertexs[5] =0;  
    _vertexs[6]= x+w;_vertexs[7] =-y-h;_vertexs[8] =0;
    _vertexs[9]= x+w;_vertexs[10]=-y;  _vertexs[11]=0;  
    
    //カラー配列情報
    for (int i=0;i<4;i++) {
        _colors[i*4  ]=_color.r;
        _colors[i*4+1]=_color.g;
        _colors[i*4+2]=_color.b;
        _colors[i*4+3]=_color.a;
    }

    //ラインの描画
    hgio_setBlendModeFlat(0);
    //glBindTexture(GL_TEXTURE_2D,0);
    glEnableClientState(GL_COLOR_ARRAY);
    glVertexPointer(3,GL_FLOAT,0,_vertexs);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,_colors);
    glDrawArrays(GL_LINE_LOOP,0,4);
}

//矩形の塗り潰し
void hgio_boxfill( float x, float y, float w, float h )
{
    GLfloat _vertexs[16*3];
    GLbyte  _colors[16*4];

     //頂点配列情報
     _vertexs[0]= x;  _vertexs[1] =-y;  _vertexs[2] =0;
     _vertexs[3]= x;  _vertexs[4] =-y-h;_vertexs[5] =0;  
     _vertexs[6]= x+w;_vertexs[7] =-y;  _vertexs[8] =0;
     _vertexs[9]= x+w;_vertexs[10]=-y-h;_vertexs[11]=0;  
     
     //カラー配列情報
     for (int i=0;i<4;i++) {
         _colors[i*4  ]=_color.r;
         _colors[i*4+1]=_color.g;
         _colors[i*4+2]=_color.b;
         _colors[i*4+3]=_color.a;
     }

    //三角形の描画
    hgio_setBlendModeFlat(0);
    //glBindTexture(GL_TEXTURE_2D,0);
    glEnableClientState(GL_COLOR_ARRAY);
    glVertexPointer(3,GL_FLOAT,0,_vertexs);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,_colors);
    glDrawArrays(GL_TRIANGLE_STRIP,0,4);
}

//円の描画
void hgio_circleLine( float x, float y, float rx, float ry )
{
    GLfloat _vertexs[256*3];
    GLbyte  _colors[256*4];
    int length=20;
    
     //頂点配列情報
     for (int i=0;i<length;i++) {
         float angle=2*M_PI*i/length;
         _vertexs[i*3+0]= x+cos(angle)*rx;
         _vertexs[i*3+1]=-y+sin(angle)*ry;
         _vertexs[i*3+2]=0;
     }
     
     //カラー配列情報
     for (int i=0;i<length;i++) {
         _colors[i*4  ]=_color.r;
         _colors[i*4+1]=_color.g;
         _colors[i*4+2]=_color.b;
         _colors[i*4+3]=_color.a;
     }

    //ラインの描画
    hgio_setBlendModeFlat(0);
    //glBindTexture(GL_TEXTURE_2D,0);
    glEnableClientState(GL_COLOR_ARRAY);
    glVertexPointer(3,GL_FLOAT,0,_vertexs);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,_colors);
    glDrawArrays(GL_LINE_LOOP,0,length);
    glDrawArrays(GL_POINTS,0,length);
}

//円の塗り潰し
void hgio_circleFill( float x, float y, float rx, float ry )
{
    GLfloat _vertexs[256*3];
    GLbyte  _colors[256*4];
    int length=20+2;
    
     //頂点配列情報
     _vertexs[0]= x;
     _vertexs[1]=-y;
     _vertexs[2]=0;
     for (int i=1;i<length;i++) {
         float angle=2*M_PI*i/(length-2);
         _vertexs[i*3+0]= x+cos(angle)*rx;
         _vertexs[i*3+1]=-y+sin(angle)*ry;
         _vertexs[i*3+2]=0;
     }
     
     //カラー配列情報
     for (int i=0;i<length;i++) {
         _colors[i*4  ]=_color.r;
         _colors[i*4+1]=_color.g;
         _colors[i*4+2]=_color.b;
         _colors[i*4+3]=_color.a;
     }

    //ラインの描画
    hgio_setBlendModeFlat(0);
    //glBindTexture(GL_TEXTURE_2D,0);
    glEnableClientState(GL_COLOR_ARRAY);
    glVertexPointer(3,GL_FLOAT,0,_vertexs);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,_colors);
    glDrawArrays(GL_TRIANGLE_FAN,0,length);
}


/*-------------------------------------------------------------------------------*/

void hgio_line( BMSCR *bm, float x, float y )
{
	//		ライン描画
	//		(bm!=NULL の場合、ライン描画開始)
	//		(bm==NULL の場合、ライン描画完了)
	//		(ラインの座標は必要な数だけhgio_line2を呼び出す)
	//
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;
	if (drawflag == 0) hgio_render_start();

	hgio_setColor( bm->color );

     //カラー配列情報
     for (int i=0;i<2;i++) {
         _line_colors[i*4  ]=_color.r;
         _line_colors[i*4+1]=_color.g;
         _line_colors[i*4+2]=_color.b;
         _line_colors[i*4+3]=_color.a;
     }

	linebasex = x + 0.375f;
	linebasey = y + 0.375f;

    hgio_setBlendModeFlat(0);
	ChangeTex( -1 );
    //glBindTexture(GL_TEXTURE_2D,0);
}


//ラインの描画
void hgio_line2( float x, float y )
{
	//		ライン描画
	//		(hgio_lineで開始後に必要な回数呼ぶ、hgio_line(NULL)で終了すること)
	//

     //頂点配列情報
     _line_vertexs[0]= linebasex;_line_vertexs[1]=-linebasey;_line_vertexs[2]=0;
	linebasex = x + 0.375f;
	linebasey = y + 0.375f;
    _line_vertexs[3]= linebasex;_line_vertexs[4]=-linebasey;_line_vertexs[5]=0;
    

    //ラインの描画
    glEnableClientState(GL_COLOR_ARRAY);
    glVertexPointer(3,GL_FLOAT,0,_line_vertexs);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,_line_colors);
    glDrawArrays(GL_LINE_STRIP,0,2);
}


void hgio_boxf( BMSCR *bm, float x1, float y1, float x2, float y2 )
{
	//		矩形描画
	//
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;
	if (drawflag == 0) hgio_render_start();

	ChangeTex( -1 );
	hgio_setColor( bm->color );
	hgio_boxfill( x1, y1, (x2-x1), (y2-y1) );
}


void hgio_circle( BMSCR *bm, float x1, float y1, float x2, float y2, int mode )
{
	//		円描画
	//
	float xx,yy,rx,ry;
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;
	if (drawflag == 0) hgio_render_start();

	rx = ((float)abs(x2-x1))*0.5f;
	ry = ((float)abs(y2-y1))*0.5f;
	xx = ((float)x1) + rx;
	yy = ((float)y1) + ry;

	ChangeTex( -1 );
	hgio_setColor( bm->color );
	if ( mode ) {
		hgio_circleFill( xx, yy, rx, ry );
	} else {
		hgio_circleLine( xx, yy, rx, ry );
	}
}


//		矩形(回転)描画
//
void hgio_fillrot( BMSCR *bm, float x, float y, float sx, float sy, float ang )
{
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;
	if (drawflag == 0) hgio_render_start();
    
    GLfloat *flp;
	GLfloat x0,y0,x1,y1,ofsx,ofsy;
    int arate;
    
	ofsx = sx;
	ofsy = sy;
	x0 = -(float)sin( ang );
	y0 = (float)cos( ang );
	x1 = -y0;
	y1 = x0;
    
	ofsx *= -0.5f;
	ofsy *= -0.5f;
	x0 *= ofsy;
	y0 *= ofsy;
	x1 *= ofsx;
	y1 *= ofsx;
    
    flp = vertf2D;
    
	*flp++ = (-x0-x1) + x;
	*flp++ = -((-y0-y1) + y);

	*flp++ = (-x0+x1) + x;
	*flp++ = -((-y0+y1) + y);
    
	*flp++ = (x0-x1) + x;
	*flp++ = -((y0-y1) + y);
    
	*flp++ = (x0+x1) + x;
	*flp++ = -((y0+y1) + y);

	ChangeTex( -1 );

    glVertexPointer(2,GL_FLOAT,0,vertf2D);
	hgio_panelcolor( bm->color, bm->gfrate );
	hgio_setBlendModeFlatAlpha( bm->gmode );

    glDrawArrays(GL_TRIANGLE_STRIP,0,4);
}


void hgio_fcopy( float distx, float disty, short xx, short yy, short srcsx, short srcsy, int texid, int color )
{
	//		画像コピー(フォント用)
	//		texid内の(xx,yy)-(xx+srcsx,yy+srcsy)を現在の画面に等倍でコピー
	//		描画モードは3,100%、転送先はdistx,disty
	//
	TEXINF *tex = GetTex( texid );
	if ( tex->mode == TEXMODE_NONE ) return;

    GLfloat *flp;
    GLfloat x1,y1,x2,y2;
    float ratex,ratey;

    flp = vertf2D;
    x1 = (GLfloat)distx;
    y1 = (GLfloat)-disty;
    x2 = x1+srcsx;
    y2 = y1-srcsy;

    *flp++ = x1;
    *flp++ = y1;
    *flp++ = x1;
    *flp++ = y2;
    *flp++ = x2;
    *flp++ = y1;
    *flp++ = x2;
    *flp++ = y2;

    //ratex = 1.0f / image.width;
    //ratey = 1.0f / image.height;
    ratex = tex->ratex;
    ratey = tex->ratey;

    flp = uvf2D;
	if ( _uvfix ) {
	    x1 = (((GLfloat)xx) + 0.5f) * ratex;
	    y1 = (((GLfloat)yy) + 0.5f) * ratey;
	    x2 = ((GLfloat)(xx+srcsx) - 0.5f) * ratex;
	    y2 = ((GLfloat)(yy+srcsy) - 0.5f) * ratey;
	} else {
	    x1 = ((GLfloat)xx) * ratex;
	    y1 = ((GLfloat)yy) * ratey;
	    x2 = ((GLfloat)(xx+srcsx)) * ratex;
	    y2 = ((GLfloat)(yy+srcsy)) * ratey;
	}

    *flp++ = x1;
    *flp++ = y1;
    *flp++ = x1;
    *flp++ = y2;
    *flp++ = x2;
    *flp++ = y1;
    *flp++ = x2;
    *flp++ = y2;

#if defined(HSPEMSCRIPTEN)
	glEnable(GL_TEXTURE_2D);
#endif

	ChangeTex( tex->texid );
//    glBindTexture( GL_TEXTURE_2D, tex->texid );
    glVertexPointer( 2, GL_FLOAT,0,vertf2D );
    glTexCoordPointer( 2,GL_FLOAT,0,uvf2D );

	hgio_setBlendMode( 3, 255 );
	hgio_panelcolor( color, 255 );
	
//    glDisableClientState(GL_COLOR_ARRAY);
    glDrawArrays(GL_TRIANGLE_STRIP,0,4);

#if defined(HSPEMSCRIPTEN)
	glDisable(GL_TEXTURE_2D);
#endif
}


void hgio_copy( BMSCR *bm, short xx, short yy, short srcsx, short srcsy, BMSCR *bmsrc, float s_psx, float s_psy )
{
	//		画像コピー
	//		texid内の(xx,yy)-(xx+srcsx,yy+srcsy)を現在の画面に(psx,psy)サイズでコピー
	//		カレントポジション、描画モードはBMSCRから取得
	//
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;
	if (drawflag == 0) hgio_render_start();

	TEXINF *tex = GetTex( bmsrc->texid );
	if ( tex->mode == TEXMODE_NONE ) return;

    GLfloat *flp;
    GLfloat x1,y1,x2,y2,tx0,tx1,ty0,ty1;
    float psx,psy,ratex,ratey;

    if ( s_psx < 0.0f ) {
        psx = -s_psx;
        tx1 = ((GLfloat)xx);
        tx0 = ((GLfloat)(xx+srcsx));
    } else {
        psx = s_psx;
        tx0 = ((GLfloat)xx);
        tx1 = ((GLfloat)(xx+srcsx));
    }
    if ( s_psy < 0.0f ) {
        psy = -s_psy;
        ty1 = ((GLfloat)yy);
        ty0 = ((GLfloat)(yy+srcsy));
    } else {
        psy = s_psy;
        ty0 = ((GLfloat)yy);
        ty1 = ((GLfloat)(yy+srcsy));
    }
    
    flp = vertf2D;
    x1 = (GLfloat)bm->cx;
    y1 = (GLfloat)-bm->cy;
    x2 = x1+psx;
    y2 = y1-psy;
    
    *flp++ = x1;
    *flp++ = y1;
    *flp++ = x1;
    *flp++ = y2;
    *flp++ = x2;
    *flp++ = y1;
    *flp++ = x2;
    *flp++ = y2;

	if ( _uvfix ) {
        tx0 += 0.5f;
        ty0 += 0.5f;
        tx1 -= 0.5f;
        ty1 -= 0.5f;
	}
    ratex = tex->ratex;
    ratey = tex->ratey;

    flp = uvf2D;

    tx0 *= ratex;
    ty0 *= ratey;
    tx1 *= ratex;
    ty1 *= ratey;
    
    *flp++ = tx0;
    *flp++ = ty0;
    *flp++ = tx0;
    *flp++ = ty1;
    *flp++ = tx1;
    *flp++ = ty0;
    *flp++ = tx1;
    *flp++ = ty1;

	ChangeTex( tex->texid );
//    glBindTexture( GL_TEXTURE_2D, tex->texid );
    glVertexPointer( 2, GL_FLOAT,0,vertf2D );
    glTexCoordPointer( 2,GL_FLOAT,0,uvf2D );

	hgio_setBlendMode( bm->gmode, bm->gfrate );
//    glDisableClientState(GL_COLOR_ARRAY);
    glDrawArrays(GL_TRIANGLE_STRIP,0,4);
}


void hgio_copyrot( BMSCR *bm, short xx, short yy, short srcsx, short srcsy, float s_ofsx, float s_ofsy, BMSCR *bmsrc, float psx, float psy, float ang )
{
	//		画像コピー
	//		texid内の(xx,yy)-(xx+srcsx,yy+srcsy)を現在の画面に(psx,psy)サイズでコピー
	//		カレントポジション、描画モードはBMSCRから取得
	//
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;
	if (drawflag == 0) hgio_render_start();

	TEXINF *tex = GetTex( bmsrc->texid );
	if ( tex->mode == TEXMODE_NONE ) return;

    GLfloat *flp;
    float ratex,ratey;

	int texpx,texpy,texid;
	GLfloat x,y,x0,y0,x1,y1,ofsx,ofsy,mx0,mx1,my0,my1;
	GLfloat tx0,ty0,tx1,ty1,sx,sy;

    //Alertf( "(%d,%d)(%d,%d)(%f,%f)",xx,yy,srcsx,srcsy,psx,psy );
    
	mx0=-(float)sin( ang );
	my0=(float)cos( ang );
	mx1 = -my0;
	my1 = mx0;
    
	ofsx = -s_ofsx;
	ofsy = -s_ofsy;
	x0 = mx0 * ofsy;
	y0 = my0 * ofsy;
	x1 = mx1 * ofsx;
	y1 = my1 * ofsx;
    
	//		基点の算出
	x = ( (float)bm->cx - (-x0+x1) );
	y = ( (float)bm->cy - (-y0+y1) );
    
	/*-------------------------------*/
    
	//		回転座標の算出
	ofsx = -psx;
	ofsy = -psy;
	x0 = mx0 * ofsy;
	y0 = my0 * ofsy;
	x1 = mx1 * ofsx;
	y1 = my1 * ofsx;
    
	/*-------------------------------*/
    
	sx = tex->ratex;
	sy = tex->ratey;
    //sx = 1.0f / image.width;
    //sy = 1.0f / image.height;
	texpx = xx + srcsx;
	texpy = yy + srcsy;
    
	tx0 = ((float)xx) * sx;
	ty0 = ((float)yy) * sy;
	tx1 = ((float)(texpx)) * sx;
	ty1 = ((float)(texpy)) * sy;

    flp = uvf2D;
    *flp++ = tx0;
    *flp++ = ty0;
    *flp++ = tx0;
    *flp++ = ty1;
    *flp++ = tx1;
    *flp++ = ty0;
    *flp++ = tx1;
    *flp++ = ty1;

	/*-------------------------------*/

    flp = vertf2D;
    
	*flp++ = (x);
	*flp++ = -(y);
    
	/*-------------------------------*/

	*flp++ = ((-x0) + x);
	*flp++ = -((-y0) + y);
    
	/*-------------------------------*/
    
	*flp++ = ((x1) + x);
	*flp++ = -((y1) + y);
    
	/*-------------------------------*/

	*flp++ = ((-x0+x1) + x);
	*flp++ = -((-y0+y1) + y);
    
	/*-------------------------------*/
    
	ChangeTex( tex->texid );
    //glBindTexture(GL_TEXTURE_2D,image.name);

    glVertexPointer(2,GL_FLOAT,0,vertf2D);
    glTexCoordPointer(2,GL_FLOAT,0,uvf2D);

	hgio_setBlendMode( bm->gmode, bm->gfrate );
    //glDisableClientState(GL_COLOR_ARRAY);
    glDrawArrays(GL_TRIANGLE_STRIP,0,4);
}


void hgio_square_tex( BMSCR *bm, int *posx, int *posy, BMSCR *bmsrc, int *uvx, int *uvy )
{
	//		四角形(square)テクスチャ描画
	//
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;
	if (drawflag == 0) hgio_render_start();

	TEXINF *tex = GetTex( bmsrc->texid );
	if ( tex->mode == TEXMODE_NONE ) return;

    GLfloat *flp;
    float sx,sy;

	sx = tex->ratex;
	sy = tex->ratey;

    flp = uvf2D;
    *flp++ = ((float)uvx[0]) * sx;
    *flp++ = ((float)uvy[0]) * sy;
    *flp++ = ((float)uvx[3]) * sx;
    *flp++ = ((float)uvy[3]) * sy;
    *flp++ = ((float)uvx[1]) * sx;
    *flp++ = ((float)uvy[1]) * sy;
    *flp++ = ((float)uvx[2]) * sx;
    *flp++ = ((float)uvy[2]) * sy;

    flp = vertf2D;
	*flp++ = (float)posx[0];
	*flp++ = (float)-posy[0];
	*flp++ = (float)posx[3];
	*flp++ = (float)-posy[3];
	*flp++ = (float)posx[1];
	*flp++ = (float)-posy[1];
	*flp++ = (float)posx[2];
	*flp++ = (float)-posy[2];

	ChangeTex( tex->texid );
    //glBindTexture(GL_TEXTURE_2D,image.name);

    glVertexPointer(2,GL_FLOAT,0,vertf2D);
    glTexCoordPointer(2,GL_FLOAT,0,uvf2D);

	hgio_setBlendMode( bm->gmode, bm->gfrate );
    //glDisableClientState(GL_COLOR_ARRAY);
    glDrawArrays(GL_TRIANGLE_STRIP,0,4);
}


void hgio_square( BMSCR *bm, int *posx, int *posy, int *color )
{
	//		四角形(square)単色描画
	//
    GLfloat *flp;
    int arate;

	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;
	if (drawflag == 0) hgio_render_start();

    flp = vertf2D;

	*flp++ = (float)posx[0];
	*flp++ = (float)-posy[0];
	*flp++ = (float)posx[3];
	*flp++ = (float)-posy[3];
	*flp++ = (float)posx[1];
	*flp++ = (float)-posy[1];
	*flp++ = (float)posx[2];
	*flp++ = (float)-posy[2];

	ChangeTex( -1 );

    glVertexPointer(2,GL_FLOAT,0,vertf2D);
    arate = bm->gfrate;
    if ( bm->gmode < 3 ) arate = 255;

	hgio_panelcolor_direct( 0, color[0], arate );
	hgio_panelcolor_direct( 1, color[3], arate );
	hgio_panelcolor_direct( 2, color[1], arate );
	hgio_panelcolor_direct( 3, color[2], arate );

	hgio_setBlendModeFlatAlpha( bm->gmode );

    glDrawArrays(GL_TRIANGLE_STRIP,0,4);
}


int hgio_celputmulti( BMSCR *bm, int *xpos, int *ypos, int *cel, int count, BMSCR *bmsrc )
{
	//		マルチ画像コピー
	//		int配列内のX,Y,CelIDを元に等倍コピーを行なう(count=個数)
	//		カレントポジション、描画モードはBMSCRから取得
	//
	int psx,psy;
	float f_psx,f_psy;
	int i;
	int id;
	int *p_xpos;
	int *p_ypos;
	int *p_cel;
	int xx,yy;
	int total;

	if ( bm == NULL ) return 0;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;
	if (drawflag == 0) hgio_render_start();

	total =0;

	p_xpos = xpos;
	p_ypos = ypos;
	p_cel = cel;

	psx = bmsrc->divsx;
	psy = bmsrc->divsy;
	f_psx = (float)psx;
	f_psy = (float)psy;

	for(i=0;i<count;i++) {

		id = *p_cel;

		if ( id >= 0 ) {

			xx = ( id % bmsrc->divx ) * psx;
			yy = ( id / bmsrc->divx ) * psy;

			bm->cx = *p_xpos;
			bm->cy = *p_ypos;

			hgio_copy( bm, xx, yy, psx, psy, bmsrc, f_psx, f_psy );

			total++;
		}

		p_xpos++;
		p_ypos++;
		p_cel++;

	}

	return total;
}

/*-------------------------------------------------------------------------------*/


int hgio_gettick( void )
{
#ifdef HSPNDK
	int i;
	timespec ts;
	double nsec;
    clock_gettime(CLOCK_REALTIME,&ts);
    nsec = (double)(ts.tv_nsec) * 0.001 * 0.001;
    i = (int)ts.tv_sec * 1000 + (int)nsec;
    //return ((double)(ts.tv_sec) + (double)(ts.tv_nsec) * 0.001 * 0.001 * 0.001);
	return i;
#endif

    // 経過時間の計測
#ifdef HSPIOS
    CFAbsoluteTime now;
    now = CFAbsoluteTimeGetCurrent();
    total_tick += now - lastTime;
    lastTime = now;
#endif

#ifdef HSPIOS
    return (int)(total_tick * 1000.0 );
    //return (int)( CFAbsoluteTimeGetCurrent() * 1000.0 );
#endif

#ifdef HSPEMSCRIPTEN
	int i;
	timespec ts;
	double nsec;
	static bool init = false;
	static int initTime = 0;
	clock_gettime(CLOCK_REALTIME,&ts);
	nsec = (double)(ts.tv_nsec) * 0.001 * 0.001;
	i = (int)ts.tv_sec * 1000 + (int)nsec;
	if (!init) {
		init = true;
		initTime = i;
	}

	return i - initTime;
#endif
}

int hgio_exec( char *msg, char *option, int mode )
{
#ifdef HSPNDK
	j_callActivity( msg, option, mode );
#endif
#ifdef HSPIOS
    gb_exec( mode, msg );
#endif
    return 0;
}

int hgio_dialog( int mode, char *str1, char *str2 )
{
#ifdef HSPNDK
	j_dispDialog( str1, str2, mode );
#endif
#ifdef HSPIOS
    gb_dialog( mode, str1, str2 );
    //Alertf( str1 );
#endif
	return 0;
}

char *hgio_sysinfo( int p2, int *res, char *outbuf )
{
	int fl;
	char *p1;
	fl = HSPVAR_FLAG_STR;
	p1 = outbuf;
	*p1=0;

	switch(p2) {
	case 0:
#ifdef HSPNDK
		{
		char tmp[256];
		strcpy( tmp, j_getinfo( JAVAFUNC_INFO_VERSION ) );
		strcpy( p1, "android " );
		strcat( p1, tmp );
		}
#endif
#ifdef HSPIOS
        gb_getSysVer( p1 );
#endif
        break;
	case 1:
		break;
	case 2:
#ifdef HSPNDK
		j_getinfo( JAVAFUNC_INFO_DEVICE );
#endif
#ifdef HSPIOS
        gb_getSysModel( p1 );
#endif
		break;
	default:
		return NULL;
	}
	*res = fl;
	return p1;
}

/*-------------------------------------------------------------------------------*/

void hgio_touch( int xx, int yy, int button )
{
    Bmscr *bm;
	mouse_x = ( xx - _originX ) * _rateX;
	mouse_y = ( yy - _originY ) * _rateY;
	mouse_btn = button;
    if ( mainbm != NULL ) {
        mainbm->savepos[BMSCR_SAVEPOS_MOSUEX] = mouse_x;
        mainbm->savepos[BMSCR_SAVEPOS_MOSUEY] = mouse_y;
        mainbm->tapstat = button;
        bm = (Bmscr *)mainbm;
        bm->UpdateAllObjects();
        bm->setMTouchByPointId( 0, mouse_x, mouse_y, button!=0 );
    }
}

void hgio_mtouch( int old_x, int old_y, int xx, int yy, int button, int opt )
{
    Bmscr *bm;
    int x,y,old_x2,old_y2;
    if ( mainbm == NULL ) return;
    bm = (Bmscr *)mainbm;
	x = ( xx - _originX ) * _rateX;
	y = ( yy - _originY ) * _rateY;
    if ( opt == 0) {
        mouse_x = x;
        mouse_y = y;
        mouse_btn = button;
        mainbm->savepos[BMSCR_SAVEPOS_MOSUEX] = mouse_x;
        mainbm->savepos[BMSCR_SAVEPOS_MOSUEY] = mouse_y;
        mainbm->tapstat = button;
        bm->UpdateAllObjects();
    }
    if ( old_x >= 0 ) {
        old_x2 = ( old_x - _originX ) * _rateX;
    } else {
        old_x2 = old_x;
    }
    if ( old_y >= 0 ) {
        old_y2 = ( old_y - _originY ) * _rateY;
    } else {
        old_y2 = old_y;
    }
    bm->setMTouchByPoint( old_x2, old_y2, x, y, button!=0 );
}

void hgio_mtouchid( int pointid, int xx, int yy, int button, int opt )
{
    Bmscr *bm;
    int x,y;
    if ( mainbm == NULL ) return;
    bm = (Bmscr *)mainbm;
	x = ( xx - _originX ) * _rateX;
	y = ( yy - _originY ) * _rateY;
    if ( opt == 0 ) {
        mouse_x = x;
        mouse_y = y;
        mouse_btn = button;
        mainbm->savepos[BMSCR_SAVEPOS_MOSUEX] = mouse_x;
        mainbm->savepos[BMSCR_SAVEPOS_MOSUEY] = mouse_y;
        mainbm->tapstat = button;
        bm->UpdateAllObjects();
    }
    bm->setMTouchByPointId( pointid, x, y, button!=0 );
}

int hgio_getmousex( void )
{
	return mouse_x;
}


int hgio_getmousey( void )
{
	return mouse_y;
}


int hgio_getmousebtn( void )
{
	return mouse_btn;
}

/*-------------------------------------------------------------------------------*/

#if defined(HSPNDK) || defined(HSPEMSCRIPTEN)

void hgio_putTexFont( int x, int y, char *msg, int color )
{

#ifdef USE_JAVA_FONT
	int texid;
	TEXINF *tinf;
	texid = GetCacheMesTextureID( msg, font_size, font_style );
	if ( texid >= 0 ) {
		tinf = GetTex( texid );
		mes_sx = tinf->width;
		mes_sy = tinf->height;
		hgio_fcopy( x, y, 0, 0, mes_sx, mes_sy, texid, color );
	}

	//hgio_makeTexFont( msg );
	//hgio_fcopy( x, y, 0, 0, mes_sx, mes_sy, font_texid, color );

#else
	int xx,yy,tx,ty;
	char a;
	char *p;
	p = msg;
	xx = x; yy = y;
	while(1) {
		a = (int)*p++;
		if ( a == 0 ) break;

		tx = ( a & 15 ) * font_sx;
		ty = ( a >> 4 ) * font_sy;
		hgio_fcopy( xx, yy, tx, ty, font_sx, font_sy, font_texid, 0xffffff );
		xx += font_sx;
	}

	mes_sx = xx - x;
	mes_sy = font_sy;
#endif
}

#endif


void hgio_test(void)
{
    // 描画する
    hgio_render_start();
    //hgio_clear();
    
	hgio_setColor( 0xff00ff );
	hgio_boxfill( 100.1,100.2,200.5,50.2 );
	//hgio_boxfill( 100,200,100,10 );
	//hgio_setColor( 0xffffff );
	//hgio_line( 0,0,400,300 );
	//hgio_setColor( 0xffff00 );
	//hgio_circleFill( 640,400,200,200 );

	//hgio_putTexFont( 0,0, (char *)"This is Android Test." );
	//hgio_fcopy( 0,0,  0, 0, 256, 128, font_texid );

    hgio_render_end();
}



/*-------------------------------------------------------------------------------*/


void hgio_setcenter( float x, float y )
{
	center_x = x;
	center_y = y;
}


void hgio_SetAlphaModeDG( int efxprm )
{
	int alphaop, aval;
	alphaop = efxprm >> 8;
	aval = efxprm & 0xff;

    //ブレンドモード設定
    switch( alphaop ) {
        case 0:                     //blend+alpha
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_ADD_OES);
#endif
            glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
            break;
        case 1:                     //blend+alpha
        case 5:                     //add
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_ADD_OES);
#endif
            glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
            aval = 0xff;
            break;
		case 2:
		case 6:
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_ADD_OES);
#endif
            glBlendFunc(GL_SRC_ALPHA,GL_ONE);
            break;
        case 3:                     //sub
        case 7:                     //sub
        case 4:                     //sub
        case 8:                     //sub
            glEnable(GL_BLEND);
#ifdef HSPIOS
            glBlendEquationOES(GL_FUNC_REVERSE_SUBTRACT_OES);
#endif
            glBlendFunc(GL_SRC_ALPHA,GL_ONE);
            break;
    }
	panelColorsTex[3] = panelColorsTex[4+3] = panelColorsTex[8+3] = panelColorsTex[12+3] = aval;
	glEnableClientState(GL_COLOR_ARRAY);
	glColorPointer(4,GL_UNSIGNED_BYTE,0,panelColorsTex);

    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,_filter); 
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,_filter); 
}


void hgio_drawsprite( hgmodel *mdl, HGMODEL_DRAWPRM *prm )
{
	//		画像コピー(DG用)
	//		texid内の(xx,yy)-(xx+srcsx,yy+srcsy)を現在の画面に(psx,psy)サイズでコピー
	//		カレントポジション、描画モードはBMSCRから取得
	//
	TEXINF *tex = GetTex( prm->tex );
	if ( tex->mode == TEXMODE_NONE ) return;

    GLfloat *flp;
    float ratex,ratey;
	float ang;
	short ua_ofsx, ua_ofsy;

	int texpx,texpy,texid;
	GLfloat x,y,x0,y0,x1,y1,ofsx,ofsy,mx0,mx1,my0,my1;
	GLfloat tx0,ty0,tx1,ty1,sx,sy;

    //Alertf( "(%d,%d)(%d,%d)(%f,%f)",xx,yy,srcsx,srcsy,psx,psy );
    
	ang = prm->rot.z;
	mx0=-(float)sin( ang );
	my0=(float)cos( ang );
	mx1 = -my0;
	my1 = mx0;
    
	ofsx = mdl->center_x * prm->scale.x;
	ofsy = mdl->center_y * prm->scale.y;
	x0 = mx0 * ofsy;
	y0 = my0 * ofsy;
	x1 = mx1 * ofsx;
	y1 = my1 * ofsx;
    
	//		基点の算出
	x = ( prm->pos.x - (-x0+x1) ) + center_x;
	y = ( prm->pos.y - (-y0+y1) ) + center_y;
    
	/*-------------------------------*/
    
	//		回転座標の算出
	ofsx = -( mdl->sizex * prm->scale.x );
	ofsy = -( mdl->sizey * prm->scale.y );
	x0 = mx0 * ofsy;
	y0 = my0 * ofsy;
	x1 = mx1 * ofsx;
	y1 = my1 * ofsx;
    
	/*-------------------------------*/
    
	sx = tex->ratex;
	sy = tex->ratey;
    //sx = 1.0f / image.width;
    //sy = 1.0f / image.height;

	ua_ofsx = prm->ua_ofsx;
	ua_ofsy = prm->ua_ofsy;
	tx0 = ((float)(mdl->uv[0]+ua_ofsx) ) * sx;
	ty0 = ((float)(mdl->uv[1]+ua_ofsy) ) * sy;
	tx1 = ((float)(mdl->uv[2]+ua_ofsx) ) * sx;
	ty1 = ((float)(mdl->uv[3]+ua_ofsy) ) * sy;


    flp = uvf2D;
    *flp++ = tx0;
    *flp++ = ty0;
    *flp++ = tx0;
    *flp++ = ty1;
    *flp++ = tx1;
    *flp++ = ty0;
    *flp++ = tx1;
    *flp++ = ty1;

	/*-------------------------------*/

    flp = vertf2D;
    
	*flp++ = (x);
	*flp++ = -(y);
    
	/*-------------------------------*/

	*flp++ = ((-x0) + x);
	*flp++ = -((-y0) + y);
    
	/*-------------------------------*/
    
	*flp++ = ((x1) + x);
	*flp++ = -((y1) + y);
    
	/*-------------------------------*/

	*flp++ = ((-x0+x1) + x);
	*flp++ = -((-y0+y1) + y);
    
	/*-------------------------------*/
    
	ChangeTex( tex->texid );
    //glBindTexture(GL_TEXTURE_2D,image.name);

    glVertexPointer(2,GL_FLOAT,0,vertf2D);
    glTexCoordPointer(2,GL_FLOAT,0,uvf2D);

	hgio_SetAlphaModeDG( (int)prm->efx.x );
	//hgio_setBlendMode( bm->gmode, bm->gfrate );
    //glDisableClientState(GL_COLOR_ARRAY);
    glDrawArrays(GL_TRIANGLE_STRIP,0,4);
}

HSPREAL hgio_getinfo( int type )
{
	int i;
	i = type - GINFO_EXINFO_BASE;
	if (( i >= 0 )&&( i < GINFO_EXINFO_MAX)) {
		return infoval[i];
	}
	return 0.0;
}

void hgio_setinfo( int type, HSPREAL val )
{
	int i;
	i = type - GINFO_EXINFO_BASE;
	if (( i >= 0 )&&( i < GINFO_EXINFO_MAX)) {
		infoval[i] = val;
	}
}


int hgio_render_start( void )
{
	if ( drawflag ) {
		hgio_render_end();
	}

#ifdef HSPIOS
    gb_render_start();
#endif
    
#if defined(HSPNDK) || defined(HSPEMSCRIPTEN)
	if ( GetSysReq( SYSREQ_CLSMODE ) == CLSMODE_SOLID ) {
		//指定カラーで消去
		int ccol = GetSysReq( SYSREQ_CLSCOLOR );
		hgio_setClear( (ccol>>16)&0xff, (ccol>>8)&0xff, (ccol)&0xff );
		hgio_clear();
	}
#endif


	hgio_reset();


#if defined(HSPNDK) || defined(HSPEMSCRIPTEN)
	if ( GetSysReq( SYSREQ_CLSMODE ) == CLSMODE_TEXTURE ) {
		//テクスチャで消去
	}
#endif


	drawflag = 1;
	return 0;
}


int hgio_render_end( void )
{
	int res;
	res = 0;
	if ( drawflag == 0 ) return 0;

#ifdef HSPIOS
    gb_render_end();
#endif

#ifdef HSPNDK

	//hgio_setColor( 0xffffff );
	//hgio_fcopy( 0, 100,  0, 0, 118, 22, 1 );

    //後処理
    if (appengine->display == NULL) {
        // displayが無い
        return 0;
    }
    eglSwapBuffers(appengine->display, appengine->surface);
#endif

#ifdef HSPEMSCRIPTEN
	SDL_GL_SwapBuffers();
#endif

	drawflag = 0;
	return res;
}


void hgio_screen( BMSCR *bm )
{
	drawflag = 0;
	if (bm->type == HSPWND_TYPE_MAIN) {
		mainbm = bm;
	}
}


void hgio_delscreen( BMSCR *bm )
{
	if ( bm->flag == BMSCR_FLAG_NOUSE ) return;
	if ( bm->texid != -1 ) {
		DeleteTex( bm->texid );
		//gb_delimage( bm->texid );
		bm->texid = -1;
	}
}


int hgio_gsel( BMSCR *bm )
{
	//		gsel(描画先変更) 未実装
	//
	hgio_render_end();
	return 0;
}


int hgio_buffer(BMSCR *bm)
{
	//		buffer(描画用画面作成) 未実装
	//
	return 0;
}


int hgio_redraw( BMSCR *bm, int flag )
{
	if ( bm == NULL ) return -1;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	if ( flag & 1 ) {
		hgio_render_end();
	} else {
		hgio_render_start();
	}
	return 0;
}



//
//		FILE I/O Service
//
static char storage_path[256];
static char my_storage_path[256+64];

int hgio_file_exist( char *fname )
{
#ifdef HSPNDK
	int size;
	AAssetManager* mgr = appengine->app->activity->assetManager;
	if (mgr == NULL) return -1;
	AAsset* asset = AAssetManager_open(mgr, (const char *)fname, AASSET_MODE_UNKNOWN);
	if (asset == NULL) return -1;
    size = (int)AAsset_getLength(asset);
    AAsset_close(asset);
	//Alertf( "[EXIST]%s:%d",fname,size );
    return size;
#endif
    return -1;
}


int hgio_file_read( char *fname, void *ptr, int size, int offset )
{
#ifdef HSPNDK
	int readsize;
	AAssetManager* mgr = appengine->app->activity->assetManager;
	if (mgr == NULL) return -1;
	AAsset* asset = AAssetManager_open(mgr, (const char *)fname, AASSET_MODE_UNKNOWN);
	if (asset == NULL) return -1;
    readsize = (int)AAsset_getLength(asset);
	if ( readsize > size ) readsize = size;
	if ( offset>0 ) AAsset_seek( asset, offset, SEEK_SET );
	AAsset_read( asset, ptr, readsize );
    AAsset_close(asset);
    return readsize;
#endif
    return -1;
}


void hgio_setstorage( char *path )
{
	int i;
	*storage_path = 0;
#ifdef HSPNDK
	i = strlen(path);if (( i<=0 )||( i>=255 )) return;
	strcpy( storage_path, path );
	if ( storage_path[i-1]!='/' ) {
		storage_path[i] = '/';
		storage_path[i+1] = 0;
	}
#endif
}


char *hgio_getstorage( char *fname )
{
#ifdef HSPNDK
	strcpy( my_storage_path, storage_path );
	strcat( my_storage_path, fname );
	return my_storage_path;
#endif
	return fname;
}


