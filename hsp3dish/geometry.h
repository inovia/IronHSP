//---------------------------------------------------------------------------
#ifndef __geometry_h
#define __geometry_h

#define PI 3.14159265358979f
#define PI2 6.28318530717958f
#define HPI 1.570796326794895f

#define DEG2ANG(x) ((int)((x) * 32768.0f / 180.0f) & 0xffff)
#define RAD2ANG(x) ((int)((x) * 32768.0f / PI) & 0xffff)
#define DEG2RAD(x) ((x) * PI / 180.0f)
#define RAD2DEG(x) ((x) * 180.0f / PI)

typedef struct {
	float x, y, z, w;
} VECTOR;

typedef struct {
  float m00, m01, m02, m03;
  float m10, m11, m12, m13;
  float m20, m21, m22, m23;
  float m30, m31, m32, m33;
} MATRIX;

typedef float FVECTOR[4];
typedef float * FVRef;
typedef int * IVRef;
typedef float (*FMatRef)[4];

#define VECREF (VECTOR *)(FVRef)

// ����VECTOR�^
typedef struct {
int x,y,z,w;
} IVECTOR;

/*
// ����VECTOR�^
typedef struct {
float x,y,z,w;
} FVECTOR;
*/

// ����AXIS�^
typedef struct {
int x,y;
} IAXIS;

// ����AXIS�^
typedef struct {
float x,y;
} FAXIS;

// ����AXIS2�^(UV�t��)
typedef struct {
short x,y,tx,ty;
} IAXIS2;

#define setIAXIS( a,b,c ) a.x=(int)b;a.y=(int)c;
#define setIAXIS2( a,b,c,d,e ) a.x=(int)b;a.y=(int)c;a.tx=(int)d;a.ty=(int)e;

typedef struct {
	VECTOR a;			// �����ϊ��s��̌W��(x, y, z0, z1)
	VECTOR b;			// �����ϊ��s��̉��Z�l (0, 0, z2, z3)
	VECTOR ra;			// �W���̋t��(1/K)
	VECTOR rb;			// ���Z�l�̕␔ (-K)
	VECTOR v;			// �y�o�b�t�@�ƃt�H�O�̃p�����[�^
	VECTOR t;			// �I�t�Z�b�g�w�x���W�Ƃy�o�b�t�@�ƃt�H�O�̃p�����[�^
	VECTOR cmin;		// �N���b�v�ŏ��͈́{�e�N�X�`���␳�W��
	VECTOR cmax;		// �N���b�v�ő�͈�
} ViewScreen;


//---------------------------------------------------------------------------

void GeometryInit(void);
void GeometryTerm(void);

//void CopyVector( VECTOR *dst, VECTOR *src );
#define CopyVector( dst,src ) *(dst) = *(src)

//void SetVector( VECTOR *dst, float x, float y, float z, float w );
#define SetVector(dst,xarg,yarg,zarg,warg)	(dst)->x=xarg;(dst)->y=yarg;(dst)->z=zarg;(dst)->w=warg
#define SetVector3(dst,xarg,yarg,zarg)	(dst)->x=xarg;(dst)->y=yarg;(dst)->z=zarg


void AddVector( VECTOR *dst, VECTOR *v0, VECTOR *v1 );
void SubVector( VECTOR *dst, VECTOR *v0, VECTOR *v1 );
void MulVector( VECTOR *dst, VECTOR *v0, VECTOR *v1 );
void DivVector( VECTOR *dst, VECTOR *v0, float r );
void ScaleVector( VECTOR *dst, VECTOR *v0, float r );

//  �}�g���b�N�X������
void  InitMatrix(void);
//  ����n�ɂ���
void  LeftHand(void);
//  �E��n�ɂ���(default)
void  RightHand(void);
//  �}�g���b�N�X�̃R�s�[
void  CopyMatrix( MATRIX *src, MATRIX *dst );
//  �}�g���b�N�X�ޔ�
void  PushMatrix(void);
//  �}�g���b�N�X���A
void  PopMatrix(void);
//  �J�����g�}�g���b�N�X�擾
void  GetCurrentMatrix(MATRIX *dst);
MATRIX *GetCurrentMatrixPtr( void );
//  �J�����g�}�g���b�N�X�ݒ�
void  SetCurrentMatrix(MATRIX *dst);
//  �J�����g�}�g���b�N�X�̃g�����X�𓾂�
void  GetCurrentTrans(VECTOR *v);
//  �P�ʃ}�g���b�N�X
void  UnitMatrix(void);
//  �w����]
void  RotX(float x);
//  �x����]
void  RotY(float y);
//  �y����]
void  RotZ(float z);
//  ���s�ړ�
void  Trans(float x, float y, float z);
//  �X�P�[��
void  Scale(float x, float y, float z);
//  �������e
void  Perspective(float r);
//  �������e���y���y�o�b�t�@�l��
void  PerspectiveWithZBuffer(float r, float N, float F, float Zn, float Zf);
void  PerspectiveFOV(float fov, float Zn, float Zf, float left, float top, float right, float bottom);

//  �}�g���b�N�X���m�̐ρi�J�����g�}�g���b�N�X�ɍ�����|����j
void  MulMatrix(MATRIX *left);
//  �}�g���b�N�X���m�̐ρi�J�����g�}�g���b�N�X�ɉE����|����j
void  MulMatrixR(MATRIX *right);
//  �]�u�s��
void  Transpose(MATRIX *mat);
//  �}�g���b�N�X�̍s��
float  Determinant(MATRIX *mat);
//  3x3�s�񎮂̒l�i�t�s��p�j
float  Determinant3(MATRIX *src);
//  �t�s��
int  InverseMatrix(MATRIX *mat);
//  �x�N�g�����}�g���b�N�X -> �x�N�g��
void  ApplyMatrix(VECTOR *v0, VECTOR *v1);
void  ApplyMatrixN(VECTOR *v0, VECTOR *v1, int nb);
void  ApplyMatrix(MATRIX* mat, VECTOR* v1, VECTOR* v0);
//  �x�N�g�����}�g���b�N�X -> �x�N�g���i��]�̂݁j
void  ApplyMatrixRot(VECTOR *v0, VECTOR *v1);
//  �x�N�g�����}�g���b�N�X -> �x�N�g���i���s�ړ��̂݁j
void  ApplyMatrixTrans(VECTOR *v0, VECTOR *v1);
//  �Q�x�N�g���̊O��
void  OuterProduct(VECTOR *v1, VECTOR *v2, VECTOR *dst);
//  �Q�x�N�g���̓���
float  InnerProduct(VECTOR *v1, VECTOR *v2);
//  �P�ʃx�N�g��
void  UnitVector(VECTOR *v);
//  �J�����}�g���b�N�X����
void  LookAt(VECTOR *cam_pos, VECTOR *cam_int);
void  LookAtWithRoll(VECTOR *cam_pos, VECTOR *cam_int, float roll);
void GetTargetAngle( VECTOR *ang, VECTOR *src, VECTOR *target );

//	View->Screen�}�g���N�X����
void PerspectiveViewScreen( ViewScreen * vs, float scrz, float ax, float ay, 
	       float xcenter, float ycenter, float zbufsmall, float zbufbig, float D, float F, float fognearz, float fogfarz, float W, float H);

//	���s���e�}�g���N�X����
void OrthoMatrix(float basex, float basey, float width, float height, float Znear, float Zfar);


//	�|���S���ڐG����
int HasPoint2D( float x, float y, VECTOR *v );
int HasPoint3D( VECTOR *p, VECTOR *v );
int IntersectLinePlane( VECTOR *lpoint, VECTOR *lvector, VECTOR *ppoint, VECTOR *pnormal, VECTOR *result );
float GetVectorDistance( VECTOR *v1, VECTOR *v2 );


//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#endif
