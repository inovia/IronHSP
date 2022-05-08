//
//	hgimg system structures
//
#ifndef __hginc_h
#define __hginc_h
#include "geometry.h"


// ���_�t�H�[�}�b�g(T&L support)
typedef struct _AXP4GX {
	// D3DEXVERTEX�Ɠ����t�H�[�}�b�g
	float x,y,z;
	int color;
	float tu,tv;
}AXP4GX;

// ���_�t�H�[�}�b�g(T&L support)
typedef struct _AXP4GS {
	// D3DLNVERTEX�Ɠ����t�H�[�}�b�g
	float x,y,z;
	float nx,ny,nz;
	float tu,tv;
}AXP4GS;

#define AXP4Set(axval,val1,val2,val3) (axval).x=val1;(axval).y=val2;(axval).z=val3
#define AXP4SetNormal(axval,val1,val2,val3) (axval).nx=val1;(axval).ny=val2;(axval).nz=val3
#define AXP4SetUV(axval,val1,val2) (axval).tu=val1;(axval).tv=val2

// plain primitive
typedef struct _P_PLAIN {
void *list_prev;	// �O�̃��X�g
void *list_next;	// ���̃��X�g
short code;			// primitive code
short attr;			// attr SW
} P_PLAIN;


// SPRITE primitive
typedef struct
{
short code;			// primitive code
short attr;			// attr SW
short tex;			// texture ID
short alpha;		// Alpha channel
float zx,zy;		// XY Scale
float rot;			// Z-Rotate
IAXIS2 v[2];		// XY Vertices
} P_SPRITE;


// BG primitive
typedef struct
{
short code;			// primitive code
short attr;			// attr SW
short tex;			// texture ID
short alpha;		// alpha blend value (opt)
char *vram;			// Virtual Vram image
short sx,sy;		// Vram Size X,Y
short cx,cy;		// Vram Chip Size X,Y
short wx,wy;		// Window Size X,Y
int vx,vy;			// Vram Pick point X,Y
int xx,yy;			// XY Vertices
} P_BGSPR;


// �l�p�`�|���S��primitive
#define POLY4N 4
typedef struct
{
short code;				// primitive code
short attr;				// attr SW
short tex;				// texture ID
short npoly;			// Num of polygon
IAXIS2 v[POLY4N];		// XY&UV Vertices
int color;				// color code
short alpha;			// alpha blend value (opt)
short specular;			// specular value (opt)
float zattr;			// Z priority
} POLY4;


// �l�p�`3D�|���S��primitive(HGMODEL_FLAG_POLY4)
typedef struct
{
short code;				// primitive code
short attr;				// attr SW
short tex;				// texture ID
short alpha;			// alpha blend value (opt)
AXP4GX v[4];			// vertices info
} POLY4GX;


//		attr�R�[�h
//
#define NODE_ATTR_NONE 0
#define NODE_ATTR_COLKEY 0x8000
#define NODE_ATTR_USEALPHA 0x4000
#define NODE_ATTR_USEMATERIAL 0x400	// MaterialID(bit0-10)���Q�Ƃ���
#define NODE_ATTR_GLOBALMAT 0x800	// �O���[�o����MaterialID���g�p����
#define NODE_ATTR_USEREPEAT 0x200
#define NODE_ATTR_SHADE_NONE 0
#define NODE_ATTR_SHADE_FLAT 1
#define NODE_ATTR_SHADE_GOURAUD 2
#define NODE_ATTR_SHADE_ADVANCED 3
#define NODE_ATTR_SHADE_LNONE 4
#define NODE_ATTR_SHADE_LFLAT 5
#define NODE_ATTR_SHADE_LGOURAUD 6
#define NODE_ATTR_SHADE_LADVANCED 7

#endif
