//---------------------------------------------------------------------------
#include <stdio.h>
#include <math.h>
#include "geometry.h"

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

static  MATRIX matrixBuf[128];
static  MATRIX *currentMatrix;
static  int rightHand;

//---------------------------------------------------------------------------
//	�R���X�g���N�^
//---------------------------------------------------------------------------
void GeometryInit(void)
{
  InitMatrix();
  //RightHand();
  LeftHand();
}
//---------------------------------------------------------------------------
//	�f�X�g���N�^
//---------------------------------------------------------------------------
void GeometryTerm(void)
{
}



/*-----------------------------------------------
  �x�N�g���̃R�s�[
-----------------------------------------------*/
void ICopyVector( VECTOR *dst, VECTOR *src )
{
	*dst = *src;
}

/*-----------------------------------------------
  �x�N�g���̑��
-----------------------------------------------*/
void ISetVector( VECTOR *dst, float x, float y, float z, float w )
{
	dst->x = x;
	dst->y = y;
	dst->z = z;
	dst->w = w;
}

/*-----------------------------------------------
  �x�N�g���̉��Z
-----------------------------------------------*/
void AddVector( VECTOR *dst, VECTOR *v0, VECTOR *v1 )
{
	dst->x = v0->x + v1->x;
	dst->y = v0->y + v1->y;
	dst->z = v0->z + v1->z;
	dst->w = v0->w + v1->w;
}

/*-----------------------------------------------
  �x�N�g���̌��Z
-----------------------------------------------*/
void SubVector( VECTOR *dst, VECTOR *v0, VECTOR *v1 )
{
	dst->x = v0->x - v1->x;
	dst->y = v0->y - v1->y;
	dst->z = v0->z - v1->z;
	dst->w = v0->w - v1->w;
}

/*-----------------------------------------------
  �x�N�g���̏�Z
-----------------------------------------------*/
void MulVector( VECTOR *dst, VECTOR *v0, VECTOR *v1 )
{
	dst->x = v0->x * v1->x;
	dst->y = v0->y * v1->y;
	dst->z = v0->z * v1->z;
	dst->w = v0->w * v1->w;
}

/*-----------------------------------------------
  �x�N�g���̏�Z
-----------------------------------------------*/
void ScaleVector( VECTOR *dst, VECTOR *v0, float r )
{
	dst->x = v0->x * r;
	dst->y = v0->y * r;
	dst->z = v0->z * r;
	dst->w = v0->w * r;
}

/*-----------------------------------------------
  �x�N�g���̏��Z
-----------------------------------------------*/
void DivVector( VECTOR *dst, VECTOR *v0, float r )
{
	float a;
	a = 1.0f / r;
	dst->x = v0->x * a;
	dst->y = v0->y * a;
	dst->z = v0->z * a;
	dst->w = v0->w * a;
}


/*-----------------------------------------------
  �}�g���b�N�X������
-----------------------------------------------*/
void InitMatrix(void)
{
  currentMatrix = &matrixBuf[0];
  UnitMatrix();
}

/*-----------------------------------------------
  ����n�ɂ���
-----------------------------------------------*/
void LeftHand(void)
{
  rightHand = 0;
}


/*-----------------------------------------------
  �E��n�ɂ���
-----------------------------------------------*/
void RightHand(void)
{
  rightHand = 1;
}


/*-----------------------------------------------
  �}�g���b�N�X�̃R�s�[
-----------------------------------------------*/
void CopyMatrix( MATRIX *dst, MATRIX *src )
{
  dst->m00 = src->m00; dst->m01 = src->m01; dst->m02 = src->m02; dst->m03 = src->m03;
  dst->m10 = src->m10; dst->m11 = src->m11; dst->m12 = src->m12; dst->m13 = src->m13;
  dst->m20 = src->m20; dst->m21 = src->m21; dst->m22 = src->m22; dst->m23 = src->m23;
  dst->m30 = src->m30; dst->m31 = src->m31; dst->m32 = src->m32; dst->m33 = src->m33;
}

static inline void CopyMatrixInt( MATRIX *src, MATRIX *dst )
{
  //	Matrix copy ( for internal )
  //
  dst->m00 = src->m00; dst->m01 = src->m01; dst->m02 = src->m02; dst->m03 = src->m03;
  dst->m10 = src->m10; dst->m11 = src->m11; dst->m12 = src->m12; dst->m13 = src->m13;
  dst->m20 = src->m20; dst->m21 = src->m21; dst->m22 = src->m22; dst->m23 = src->m23;
  dst->m30 = src->m30; dst->m31 = src->m31; dst->m32 = src->m32; dst->m33 = src->m33;
}

/*-----------------------------------------------
  �}�g���b�N�X�ޔ�
-----------------------------------------------*/
void PushMatrix(void)
{
  /* MATRIX STACK */
  CopyMatrixInt(currentMatrix, currentMatrix + 1);
  currentMatrix++;
}

/*-----------------------------------------------
  �}�g���b�N�X���A
-----------------------------------------------*/
void PopMatrix(void)
{
  /* MATRIX STACK */
  currentMatrix--;
}


/*-----------------------------------------------
  �J�����g�}�g���b�N�X�擾
-----------------------------------------------*/
void GetCurrentMatrix(MATRIX *dst)
{
  CopyMatrixInt(currentMatrix, dst);
}


/*-----------------------------------------------
  �J�����g�}�g���b�N�X�擾
-----------------------------------------------*/
MATRIX *GetCurrentMatrixPtr( void )
{
	return currentMatrix;
}


/*-----------------------------------------------
  �J�����g�}�g���b�N�X�ݒ�
-----------------------------------------------*/
void SetCurrentMatrix(MATRIX *src)
{
  CopyMatrixInt(src, currentMatrix);
}


/*-----------------------------------------------
  �P�ʃ}�g���b�N�X
-----------------------------------------------*/
void UnitMatrix(void)
{
  MATRIX *mat = currentMatrix;

  mat->m00 = 1.0f; mat->m01 = 0.0f; mat->m02 = 0.0f; mat->m03 = 0.0f;
  mat->m10 = 0.0f; mat->m11 = 1.0f; mat->m12 = 0.0f; mat->m13 = 0.0f;
  mat->m20 = 0.0f; mat->m21 = 0.0f; mat->m22 = 1.0f; mat->m23 = 0.0f;
  mat->m30 = 0.0f; mat->m31 = 0.0f; mat->m32 = 0.0f; mat->m33 = 1.0f;
}




/*-----------------------------------------------
  �w����]�i����n�j
-----------------------------------------------*/
#if 0

X axis rotation

|M00 M01 M02 M03|   |1     0     0     0||m00 m01 m02 m03|
|M10 M11 M12 M13| = |0  cosx -sinx     0||m10 m11 m12 m13|
|M20 M21 M22 M23|   |0  sinx  cosx     0||m20 m21 m22 m23|
|M30 M31 M32 M33|   |0     0     0     1||m30 m31 m32 m33|

#endif
static void RotXLeft(float x)
{
  MATRIX *mat, mt;
  float s, c;

  mat = currentMatrix;
  CopyMatrixInt(mat, &mt);

  s = (float)sin(x); c = (float)cos(x);

#if 0
  mat->m00 =    mt.m00;
  mat->m01 =    mt.m01;
  mat->m02 =    mt.m02;
  mat->m03 =    mt.m03;
#endif
  mat->m10 =  c*mt.m10 + -s*mt.m20;
  mat->m11 =  c*mt.m11 + -s*mt.m21;
  mat->m12 =  c*mt.m12 + -s*mt.m22;
  mat->m13 =  c*mt.m13 + -s*mt.m23;

  mat->m20 =  s*mt.m10 +  c*mt.m20;
  mat->m21 =  s*mt.m11 +  c*mt.m21;
  mat->m22 =  s*mt.m12 +  c*mt.m22;
  mat->m23 =  s*mt.m13 +  c*mt.m23;
}

/*-----------------------------------------------
  �x����]�i����n�j
-----------------------------------------------*/
#if 0

Y axis rotation

|M00 M01 M02 M03|   | cosy     0  siny     0||m00 m01 m02 m03|
|M10 M11 M12 M13| = |    0     1     0     0||m10 m11 m12 m13|
|M20 M21 M22 M23|   |-siny     0  cosy     0||m20 m21 m22 m23|
|M30 M31 M32 M33|   |    0     0     0     1||m30 m31 m32 m33|

#endif
static void RotYLeft(float y)
{
  MATRIX *mat, mt;
  float s, c;

  mat = currentMatrix;
  CopyMatrixInt(mat, &mt);

  s = (float)sin(y); c = (float)cos(y);

  mat->m00 =  c*mt.m00 +  s*mt.m20;
  mat->m01 =  c*mt.m01 +  s*mt.m21;
  mat->m02 =  c*mt.m02 +  s*mt.m22;
  mat->m03 =  c*mt.m03 +  s*mt.m23;
#if 0
  mat->m10 =    mt.m10;
  mat->m11 =    mt.m11;
  mat->m12 =    mt.m12;
  mat->m13 =    mt.m13;
#endif
  mat->m20 = -s*mt.m00 +  c*mt.m20;
  mat->m21 = -s*mt.m01 +  c*mt.m21;
  mat->m22 = -s*mt.m02 +  c*mt.m22;
  mat->m23 = -s*mt.m03 +  c*mt.m23;
}


/*-----------------------------------------------
  �y����]�i����n�j
-----------------------------------------------*/
#if 0

Z axis rotation

|M00 M01 M02 M03|   | cosz -sinz     0     0||m00 m01 m02 m03|
|M10 M11 M12 M13| = | sinz  cosz     0     0||m10 m11 m12 m13|
|M20 M21 M22 M23|   |    0     0     1     0||m20 m21 m22 m23|
|M30 M31 M32 M33|   |    0     0     0     1||m30 m31 m32 m33|

#endif
static void RotZLeft(float z)
{
  MATRIX *mat, mt;
  float s, c;

  mat = currentMatrix;
  CopyMatrixInt(mat, &mt);
  
  s = (float)sin(z); c = (float)cos(z);

  mat->m00 =  c*mt.m00 + -s*mt.m10;
  mat->m01 =  c*mt.m01 + -s*mt.m11;
  mat->m02 =  c*mt.m02 + -s*mt.m12;
  mat->m03 =  c*mt.m03 + -s*mt.m13;

  mat->m10 =  s*mt.m00 +  c*mt.m10;
  mat->m11 =  s*mt.m01 +  c*mt.m11;
  mat->m12 =  s*mt.m02 +  c*mt.m12;
  mat->m13 =  s*mt.m03 +  c*mt.m13;
#if 0
  mat->m20 =    mt.m20;
  mat->m21 =    mt.m21;
  mat->m22 =    mt.m22;
  mat->m23 =    mt.m23;
#endif
}


/*-----------------------------------------------
  �w����]�i�E��n�j
-----------------------------------------------*/
#if 0

X axis rotation

|M00 M01 M02 M03|   |1     0     0     0||m00 m01 m02 m03|
|M10 M11 M12 M13| = |0  cosx  sinx     0||m10 m11 m12 m13|
|M20 M21 M22 M23|   |0 -sinx  cosx     0||m20 m21 m22 m23|
|M30 M31 M32 M33|   |0     0     0     1||m30 m31 m32 m33|

#endif
static void RotXRight(float x)
{
  MATRIX *mat, mt;
  float s, c;

  mat = currentMatrix;
  CopyMatrixInt(mat, &mt);

  s = (float)sin(x); c = (float)cos(x);

#if 0
  mat->m00 =    mt.m00;
  mat->m01 =    mt.m01;
  mat->m02 =    mt.m02;
  mat->m03 =    mt.m03;
#endif
  mat->m10 =  c*mt.m10 +  s*mt.m20;
  mat->m11 =  c*mt.m11 +  s*mt.m21;
  mat->m12 =  c*mt.m12 +  s*mt.m22;
  mat->m13 =  c*mt.m13 +  s*mt.m23;

  mat->m20 = -s*mt.m10 +  c*mt.m20;
  mat->m21 = -s*mt.m11 +  c*mt.m21;
  mat->m22 = -s*mt.m12 +  c*mt.m22;
  mat->m23 = -s*mt.m13 +  c*mt.m23;

}

/*-----------------------------------------------
  �x����]�i�E��n�j
-----------------------------------------------*/
#if 0

Y axis rotation

|M00 M01 M02 M03|   | cosy     0 -siny     0||m00 m01 m02 m03|
|M10 M11 M12 M13| = |    0     1     0     0||m10 m11 m12 m13|
|M20 M21 M22 M23|   | siny     0  cosy     0||m20 m21 m22 m23|
|M30 M31 M32 M33|   |    0     0     0     1||m30 m31 m32 m33|

#endif
static void RotYRight(float y)
{
  MATRIX *mat, mt;
  float s, c;

  mat = currentMatrix;
  CopyMatrixInt(mat, &mt);

  s = (float)sin(y); c = (float)cos(y);

  mat->m00 =  c*mt.m00 + -s*mt.m20;
  mat->m01 =  c*mt.m01 + -s*mt.m21;
  mat->m02 =  c*mt.m02 + -s*mt.m22;
  mat->m03 =  c*mt.m03 + -s*mt.m23;
#if 0
  mat->m10 =    mt.m10;
  mat->m11 =    mt.m11;
  mat->m12 =    mt.m12;
  mat->m13 =    mt.m13;
#endif
  mat->m20 =  s*mt.m00 +  c*mt.m20;
  mat->m21 =  s*mt.m01 +  c*mt.m21;
  mat->m22 =  s*mt.m02 +  c*mt.m22;
  mat->m23 =  s*mt.m03 +  c*mt.m23;
}


/*-----------------------------------------------
  �y����]�i�E��n�j
-----------------------------------------------*/
#if 0

Z axis rotation

|M00 M01 M02 M03|   |  cosz  sinz     0     0||m00 m01 m02 m03|
|M10 M11 M12 M13| = | -sinz  cosz     0     0||m10 m11 m12 m13|
|M20 M21 M22 M23|   |     0     0     1     0||m20 m21 m22 m23|
|M30 M31 M32 M33|   |     0     0     0     1||m30 m31 m32 m33|

#endif
static void RotZRight(float z)
{
  MATRIX *mat, mt;
  float s, c;

  mat = currentMatrix;
  CopyMatrixInt(mat, &mt);
  
  s = (float)sin(z); c = (float)cos(z);

  mat->m00 =  c*mt.m00 +  s*mt.m10;
  mat->m01 =  c*mt.m01 +  s*mt.m11;
  mat->m02 =  c*mt.m02 +  s*mt.m12;
  mat->m03 =  c*mt.m03 +  s*mt.m13;

  mat->m10 = -s*mt.m00 +  c*mt.m10;
  mat->m11 = -s*mt.m01 +  c*mt.m11;
  mat->m12 = -s*mt.m02 +  c*mt.m12;
  mat->m13 = -s*mt.m03 +  c*mt.m13;
#if 0
  mat->m20 =    mt.m20;
  mat->m21 =    mt.m21;
  mat->m22 =    mt.m22;
  mat->m23 =    mt.m23;
#endif
}

/*-----------------------------------------------
  �w����]
-----------------------------------------------*/
void RotX(float x)
{
  if (rightHand) RotXRight(x);
  else           RotXLeft(x);
}
/*-----------------------------------------------
  �x����]
-----------------------------------------------*/
void RotY(float y)
{
  if (rightHand) RotYRight(y);
  else           RotYLeft(y);
}
/*-----------------------------------------------
  �y����]
-----------------------------------------------*/
void RotZ(float z)
{
  if (rightHand) RotZRight(z);
  else           RotZLeft(z);
}


/*-----------------------------------------------
  ���s�ړ�
-----------------------------------------------*/
#if 0

translation

|M00 M01 M02 M03|   | 1     0     0     0||m00 m01 m02 m03|
|M10 M11 M12 M13| = | 0     1     0     0||m10 m11 m12 m13|
|M20 M21 M22 M23|   | 0     0     1     0||m20 m21 m22 m23|
|M30 M31 M32 M33|   | x     y     z     1||m30 m31 m32 m33|

#endif
void Trans(float x, float y, float z)
{
  MATRIX *mat;
  mat = currentMatrix;

  mat->m30 += x * mat->m00  +  y * mat->m10  +  z * mat->m20;
  mat->m31 += x * mat->m01  +  y * mat->m11  +  z * mat->m21;
  mat->m32 += x * mat->m02  +  y * mat->m12  +  z * mat->m22;
  mat->m33 += x * mat->m03  +  y * mat->m13  +  z * mat->m23;
}


/*-----------------------------------------------
  �X�P�[��
-----------------------------------------------*/
#if 0

scaling

|M00 M01 M02 M03|   | x     0     0     0||m00 m01 m02 m03|
|M10 M11 M12 M13| = | 0     y     0     0||m10 m11 m12 m13|
|M20 M21 M22 M23|   | 0     0     z     0||m20 m21 m22 m23|
|M30 M31 M32 M33|   | 0     0     0     1||m30 m31 m32 m33|

#endif
void  Scale(float x, float y, float z)	/* scale vector */
{
  MATRIX *mat;
  mat = currentMatrix;

  mat->m00 *= x;
  mat->m01 *= x;
  mat->m02 *= x;
  mat->m03 *= x;
  mat->m10 *= y;
  mat->m11 *= y;
  mat->m12 *= y;
  mat->m13 *= y;
  mat->m20 *= z;
  mat->m21 *= z;
  mat->m22 *= z;
  mat->m23 *= z;
}


/*-----------------------------------------------
  �������e
-----------------------------------------------*/
#if 0

perspective

|M00 M01 M02 M03|   | 1     0     0     0||m00 m01 m02 m03|
|M10 M11 M12 M13| = | 0     1     0     0||m10 m11 m12 m13|
|M20 M21 M22 M23|   | 0     0     1     r||m20 m21 m22 m23|
|M30 M31 M32 M33|   | 0     0     0     1||m30 m31 m32 m33|

#endif
void Perspective(float r)
{
  MATRIX *mat;
  mat = currentMatrix;

  mat->m20 += r * mat->m30;
  mat->m21 += r * mat->m31;
  mat->m22 += r * mat->m32;
  mat->m23 += r * mat->m33;
}


/*-----------------------------------------------
  �y���y�o�b�t�@�l�ɂ���
-----------------------------------------------*/
#if 0
�i���Ӂj
�����ϊ��}�g���b�N�X���|������ɂ��̃}�g���b�N�X���|����B

----------���-------------

�O���N���b�v�ʂ̂y���W N,���̎��̂y�o�b�t�@�lZn
����N���b�v�ʂ̂y���W F,���̎��̂y�o�b�t�@�lZf �Ƃ���B

�����ϊ������x�N�g����(x,y,z,rz+1)
�X�N���[����ł̍��W��( x/(rz+1), y/(rz+1), z/(rz+1), 1 )

z/(rz+1) = N �̎� Zbuffer=Zn
z/(rz+1) = F �̎� Zbuffer=Zf
�ƂȂ�悤�ɂ������B

z/(rz+1) = N �� z�ɂ��ĉ�����
z = N/(1-rN) �ƂȂ�B
�܂�

z = N/(1-rN) �̎���Zbuffer=Zn ... (1)
z = F/(1-rF) �̎���Zbuffer=Zf ... (2)

�ƂȂ�悤�ȕϊ��}�g���b�N�X��p�ӂ���B

                            |1   0   0   0|
|X  Y  Z  W|  = |x y z rz+1||0   1   0   0|
                            |0   0  m22  0|
                            |0   0  m32  1|

Z ��ZBuffer�̒l�B
Z �ɂ��Čv�Z�����

Z = m22z + m32(rz+1)

(1)(2)���
m22{N/(1-rN)} + m32{(rN)/(1-rN) + 1} = Zn
m32{F/(1-rF)} + m32{(rF)/(1-rF) + 1} = Zf

A = N/(1-rN)
B = F/(1-rF)
C = (rN)/(1-rN) + 1
D = (rF)/(1-rF) + 1

�Ƃ���ƁA

m22A + m32C = Zn
m22B + m32D = Zf

����������ƁA

m22 = (DZn - CZf) / (AD - BC)
m32 = (AZf - BZn) / (AD - BC)

�ƂȂ�B

----------����I��------------

|M00 M01 M02 M03|   | 1     0     0     0||m00 m01 m02 m03|
|M10 M11 M12 M13| = | 0     1     0     0||m10 m11 m12 m13|
|M20 M21 M22 M23|   | 0     0    m22    0||m20 m21 m22 m23|
|M30 M31 M32 M33|   | 0     0    m32    1||m30 m31 m32 m33|

��������������������������������������������������
Zn>Zf�łȂ��Ƃ��܂������Ȃ��i�o�O���H�j
��������������������������������������������������


#endif
void ZBufferMatrix(float N, float F, float Zn, float Zf, float r)
{
  MATRIX m;
  float A,B,C,D;
  float coef;

  A = N / (1.0f - r * N);
  B = F / (1.0f - r * F);
  C = r * N / (1.0f - r * N) + 1.0f;
  D = r * F / (1.0f - r * F) + 1.0f;
  coef = 1.0f / (A * D - B * C);

  m.m00 = 1.0f;
  m.m01 = 0.0f;
  m.m02 = 0.0f;
  m.m03 = 0.0f;

  m.m10 = 0.0f;
  m.m11 = 1.0f;
  m.m12 = 0.0f;
  m.m13 = 0.0f;

  m.m20 = 0.0f;
  m.m21 = 0.0f;
  m.m22 = (D * Zn - C * Zf) * coef;
  m.m23 = 0.0f;

  m.m30 = 0.0f;
  m.m31 = 0.0f;
  m.m32 = (A * Zf - B * Zn) * coef;
  m.m33 = 1.0f;

  MulMatrix(&m);
}


/*-----------------------------------------------
  �������e���y���y�o�b�t�@�l��
-----------------------------------------------*/
void  PerspectiveWithZBuffer(float r, float N, float F, float Zn, float Zf)
{
  ZBufferMatrix(N, F, Zn, Zf, r);
  Perspective(r);
}




/*-----------------------------------------------
  �}�g���b�N�X���m�̐ρi�J�����g�}�g���b�N�X�ɍ�����|����j
-----------------------------------------------*/
void MulMatrix(MATRIX *l)
{
  MATRIX *dst, *r, mt;

  dst = currentMatrix;
  CopyMatrixInt(dst, &mt);
  r = &mt;

  dst->m00 = l->m00 * r->m00 + l->m01 * r->m10 + l->m02 * r->m20 + l->m03 * r->m30;
  dst->m01 = l->m00 * r->m01 + l->m01 * r->m11 + l->m02 * r->m21 + l->m03 * r->m31;
  dst->m02 = l->m00 * r->m02 + l->m01 * r->m12 + l->m02 * r->m22 + l->m03 * r->m32;
  dst->m03 = l->m00 * r->m03 + l->m01 * r->m13 + l->m02 * r->m23 + l->m03 * r->m33;

  dst->m10 = l->m10 * r->m00 + l->m11 * r->m10 + l->m12 * r->m20 + l->m13 * r->m30;
  dst->m11 = l->m10 * r->m01 + l->m11 * r->m11 + l->m12 * r->m21 + l->m13 * r->m31;
  dst->m12 = l->m10 * r->m02 + l->m11 * r->m12 + l->m12 * r->m22 + l->m13 * r->m32;
  dst->m13 = l->m10 * r->m03 + l->m11 * r->m13 + l->m12 * r->m23 + l->m13 * r->m33;

  dst->m20 = l->m20 * r->m00 + l->m21 * r->m10 + l->m22 * r->m20 + l->m23 * r->m30;
  dst->m21 = l->m20 * r->m01 + l->m21 * r->m11 + l->m22 * r->m21 + l->m23 * r->m31;
  dst->m22 = l->m20 * r->m02 + l->m21 * r->m12 + l->m22 * r->m22 + l->m23 * r->m32;
  dst->m23 = l->m20 * r->m03 + l->m21 * r->m13 + l->m22 * r->m23 + l->m23 * r->m33;

  dst->m30 = l->m30 * r->m00 + l->m31 * r->m10 + l->m32 * r->m20 + l->m33 * r->m30;
  dst->m31 = l->m30 * r->m01 + l->m31 * r->m11 + l->m32 * r->m21 + l->m33 * r->m31;
  dst->m32 = l->m30 * r->m02 + l->m31 * r->m12 + l->m32 * r->m22 + l->m33 * r->m32;
  dst->m33 = l->m30 * r->m03 + l->m31 * r->m13 + l->m32 * r->m23 + l->m33 * r->m33;
}


/*-----------------------------------------------
  �}�g���b�N�X���m�̐ρi�J�����g�}�g���b�N�X�ɉE����|����j
-----------------------------------------------*/
void MulMatrixR(MATRIX *r)
{
  MATRIX *dst, *l, mt;

  dst = currentMatrix;
  CopyMatrixInt(dst, &mt);
  l = &mt;

  dst->m00 = l->m00 * r->m00 + l->m01 * r->m10 + l->m02 * r->m20 + l->m03 * r->m30;
  dst->m01 = l->m00 * r->m01 + l->m01 * r->m11 + l->m02 * r->m21 + l->m03 * r->m31;
  dst->m02 = l->m00 * r->m02 + l->m01 * r->m12 + l->m02 * r->m22 + l->m03 * r->m32;
  dst->m03 = l->m00 * r->m03 + l->m01 * r->m13 + l->m02 * r->m23 + l->m03 * r->m33;

  dst->m10 = l->m10 * r->m00 + l->m11 * r->m10 + l->m12 * r->m20 + l->m13 * r->m30;
  dst->m11 = l->m10 * r->m01 + l->m11 * r->m11 + l->m12 * r->m21 + l->m13 * r->m31;
  dst->m12 = l->m10 * r->m02 + l->m11 * r->m12 + l->m12 * r->m22 + l->m13 * r->m32;
  dst->m13 = l->m10 * r->m03 + l->m11 * r->m13 + l->m12 * r->m23 + l->m13 * r->m33;

  dst->m20 = l->m20 * r->m00 + l->m21 * r->m10 + l->m22 * r->m20 + l->m23 * r->m30;
  dst->m21 = l->m20 * r->m01 + l->m21 * r->m11 + l->m22 * r->m21 + l->m23 * r->m31;
  dst->m22 = l->m20 * r->m02 + l->m21 * r->m12 + l->m22 * r->m22 + l->m23 * r->m32;
  dst->m23 = l->m20 * r->m03 + l->m21 * r->m13 + l->m22 * r->m23 + l->m23 * r->m33;

  dst->m30 = l->m30 * r->m00 + l->m31 * r->m10 + l->m32 * r->m20 + l->m33 * r->m30;
  dst->m31 = l->m30 * r->m01 + l->m31 * r->m11 + l->m32 * r->m21 + l->m33 * r->m31;
  dst->m32 = l->m30 * r->m02 + l->m31 * r->m12 + l->m32 * r->m22 + l->m33 * r->m32;
  dst->m33 = l->m30 * r->m03 + l->m31 * r->m13 + l->m32 * r->m23 + l->m33 * r->m33;
}


/*-----------------------------------------------
  �]�u�s��
-----------------------------------------------*/
void Transpose(MATRIX *dst)
{
  MATRIX *src;
  MATRIX mt;

  src = &mt;
  if (dst == NULL){
    dst = currentMatrix;
  }

  CopyMatrixInt(dst, src);

  /* dst->m00 = src->m00; */ dst->m01 = src->m10;    dst->m02 = src->m20;    dst->m03 = src->m30;
     dst->m10 = src->m01; /* dst->m11 = src->m11; */ dst->m12 = src->m21;    dst->m13 = src->m31;
     dst->m20 = src->m02;    dst->m21 = src->m12; /* dst->m22 = src->m22; */ dst->m23 = src->m32;
     dst->m30 = src->m03;    dst->m31 = src->m13;    dst->m32 = src->m23; /* dst->m33 = src->m33; */

}


/*-----------------------------------------------
  �}�g���b�N�X�̍s��
-----------------------------------------------*/
float Determinant(MATRIX *src)
{
  float val0, val1, val2, val3, val4, val5;
  float val00, val01, val02, val03;
  float value;

  if (src == NULL){
    src = currentMatrix;
  }

  val0 = (src->m22 * src->m33 - src->m23 * src->m32);
  val1 = (src->m21 * src->m33 - src->m23 * src->m31);
  val2 = (src->m21 * src->m32 - src->m22 * src->m31);
  val3 = (src->m20 * src->m33 - src->m23 * src->m30);
  val4 = (src->m20 * src->m32 - src->m22 * src->m30);
  val5 = (src->m20 * src->m31 - src->m21 * src->m30);

  val00 = (src->m11 * val0 - src->m12 * val1 + src->m13 * val2);
  val01 = (src->m10 * val0 - src->m12 * val3 + src->m13 * val4);
  val02 = (src->m10 * val1 - src->m11 * val3 + src->m13 * val5);
  val03 = (src->m10 * val2 - src->m11 * val4 + src->m12 * val5);

  value = src->m00 * val00 - src->m01 * val01 + src->m02 * val02 - src->m03 * val03;

#if 0
  value  =  src->m00 * (src->m11 * val0 - src->m12 * val1 + src->m13 * val2);
  value += -src->m01 * (src->m10 * val0 - src->m12 * val3 + src->m13 * val4);
  value +=  src->m02 * (src->m10 * val1 - src->m11 * val3 + src->m13 * val5);
  value += -src->m03 * (src->m10 * val2 - src->m11 * val4 + src->m12 * val5);


  value  =  src->m00 * (
			 src->m11 * (src->m22 * src->m33 - src->m23 * src->m32) +
			-src->m12 * (src->m21 * src->m33 - src->m23 * src->m31) +
			 src->m13 * (src->m21 * src->m32 - src->m22 * src->m31)
			);

  value += -src->m01 * (
			 src->m10 * (src->m22 * src->m33 - src0>m23 * src->m32) +
			-src->m12 * (src->m20 * src->m33 - src->m23 * src->m30) +
			 src->m13 * (src->m20 * src->m32 - src->m22 * src->m30)
			);

  value +=  src->m02 * (
			 src->m10 * (src->m21 * src->m33 - src->m23 * src->m31) +
			-src->m11 * (src->m20 * src->m33 - src->m23 * src->m30) +
			 src->m13 * (src->m20 * src->m31 - src->m21 * src->m30)
			);

  value += -src->m03 * (
			 src->m10 * (src->m21 * src->m32 - src->m22 * src->m31) +
			-src->m11 * (src->m20 * src->m32 - src->m22 * src->m30) +
			 src->m12 * (src->m20 * src->m31 - src->m21 * src->m30)
			);
#endif

  return value;
}


/*
 *
 * 3x3�s�񎮂̒l�i�t�s��p�j
 *
 */
float Determinant3(MATRIX *src)
{
  float val0, val1, val2;
  float value;
  
  val0 = (src->m11 * src->m22 - src->m12 * src->m21);
  val1 = (src->m10 * src->m22 - src->m12 * src->m20);
  val2 = (src->m10 * src->m21 - src->m11 * src->m20);

  value = src->m00 * val0 - src->m01 * val1 + src->m02 * val2;

  return value;
}


/*-----------------------------------------------
  �t�s��
-----------------------------------------------*/
int InverseMatrix(MATRIX *dst)
{
  MATRIX *src;
  MATRIX mt, mat3;
  float invA;

  src = &mt;
  if (dst == NULL){
    dst = currentMatrix;
  }

  invA = Determinant(NULL);
  if (invA == 0.0f){
    return FALSE;
  }
  invA = 1.0f / invA;

  CopyMatrixInt(dst, src);

  mat3.m00 = src->m11; mat3.m01 = src->m12; mat3.m02 = src->m13;
  mat3.m10 = src->m21; mat3.m11 = src->m22; mat3.m12 = src->m23;
  mat3.m20 = src->m31; mat3.m21 = src->m32; mat3.m22 = src->m33;
  dst->m00 = Determinant3(&mat3) * invA;

  mat3.m00 = src->m10; /* mat3.m01 = src->m12; mat3.m02 = src->m13; */
  mat3.m10 = src->m20; /* mat3.m11 = src->m22; mat3.m12 = src->m23; */
  mat3.m20 = src->m30; /* mat3.m21 = src->m32; mat3.m22 = src->m33; */
  dst->m01 = -Determinant3(&mat3) * invA;

  /* mat3.m00 = src->m10; */ mat3.m01 = src->m11; /* mat3.m02 = src->m13; */
  /* mat3.m10 = src->m20; */ mat3.m11 = src->m21; /* mat3.m12 = src->m23; */
  /* mat3.m20 = src->m30; */ mat3.m21 = src->m31; /* mat3.m22 = src->m33; */
  dst->m02 = Determinant3(&mat3) * invA;

  /* mat3.m00 = src->m10; mat3.m01 = src->m11; */ mat3.m02 = src->m12;
  /* mat3.m10 = src->m20; mat3.m11 = src->m21; */ mat3.m12 = src->m22;
  /* mat3.m20 = src->m30; mat3.m21 = src->m31; */ mat3.m22 = src->m32;
  dst->m03 = -Determinant3(&mat3) * invA;

  mat3.m00 = src->m01; mat3.m01 = src->m02; mat3.m02 = src->m03;
  mat3.m10 = src->m21; mat3.m11 = src->m22; mat3.m12 = src->m23;
  mat3.m20 = src->m31; mat3.m21 = src->m32; mat3.m22 = src->m33;
  dst->m10 = -Determinant3(&mat3) * invA;

  mat3.m00 = src->m00; /* mat3.m01 = src->m02; mat3.m02 = src->m03; */
  mat3.m10 = src->m20; /* mat3.m11 = src->m22; mat3.m12 = src->m23; */
  mat3.m20 = src->m30; /* mat3.m21 = src->m32; mat3.m22 = src->m33; */
  dst->m11 = Determinant3(&mat3) * invA;

  /* mat3.m00 = src->m00; */ mat3.m01 = src->m01; /* mat3.m02 = src->m03; */
  /* mat3.m10 = src->m20; */ mat3.m11 = src->m21; /* mat3.m12 = src->m23; */
  /* mat3.m20 = src->m30; */ mat3.m21 = src->m31; /* mat3.m22 = src->m33; */
  dst->m12 = -Determinant3(&mat3) * invA;

  /* mat3.m00 = src->m00; mat3.m01 = src->m01; */ mat3.m02 = src->m02;
  /* mat3.m10 = src->m20; mat3.m11 = src->m21; */ mat3.m12 = src->m22;
  /* mat3.m20 = src->m30; mat3.m21 = src->m31; */ mat3.m22 = src->m32;
  dst->m13 = Determinant3(&mat3) * invA;

  mat3.m00 = src->m01; mat3.m01 = src->m02; mat3.m02 = src->m03;
  mat3.m10 = src->m11; mat3.m11 = src->m12; mat3.m12 = src->m13;
  mat3.m20 = src->m31; mat3.m21 = src->m32; mat3.m22 = src->m33;
  dst->m20 = Determinant3(&mat3) * invA;

  mat3.m00 = src->m00; /* mat3.m01 = src->m02; mat3.m02 = src->m03; */
  mat3.m10 = src->m10; /* mat3.m11 = src->m12; mat3.m12 = src->m13; */
  mat3.m20 = src->m30; /* mat3.m21 = src->m32; mat3.m22 = src->m33; */
  dst->m21 = -Determinant3(&mat3) * invA;

  /* mat3.m00 = src->m00; */ mat3.m01 = src->m01; /* mat3.m02 = src->m03; */
  /* mat3.m10 = src->m10; */ mat3.m11 = src->m11; /* mat3.m12 = src->m13; */
  /* mat3.m20 = src->m30; */ mat3.m21 = src->m31; /* mat3.m22 = src->m33; */
  dst->m22 = Determinant3(&mat3) * invA;

  /* mat3.m00 = src->m00; mat3.m01 = src->m01; */ mat3.m02 = src->m02;
  /* mat3.m10 = src->m10; mat3.m11 = src->m11; */ mat3.m12 = src->m12;
  /* mat3.m20 = src->m30; mat3.m21 = src->m31; */ mat3.m22 = src->m32;
  dst->m23 = -Determinant3(&mat3) * invA;

  mat3.m00 = src->m01; mat3.m01 = src->m02; mat3.m02 = src->m03;
  mat3.m10 = src->m11; mat3.m11 = src->m12; mat3.m12 = src->m13;
  mat3.m20 = src->m21; mat3.m21 = src->m22; mat3.m22 = src->m23;
  dst->m30 = -Determinant3(&mat3) * invA;

  mat3.m00 = src->m00; /* mat3.m01 = src->m02; mat3.m02 = src->m03; */
  mat3.m10 = src->m10; /* mat3.m11 = src->m12; mat3.m12 = src->m13; */
  mat3.m20 = src->m20; /* mat3.m21 = src->m22; mat3.m22 = src->m23; */
  dst->m31 = Determinant3(&mat3) * invA;

  /* mat3.m00 = src->m00; */ mat3.m01 = src->m01; /* mat3.m02 = src->m03; */
  /* mat3.m10 = src->m10; */ mat3.m11 = src->m11; /* mat3.m12 = src->m13; */
  /* mat3.m20 = src->m20; */ mat3.m21 = src->m21; /* mat3.m22 = src->m23; */
  dst->m32 = -Determinant3(&mat3) * invA;

  /* mat3.m00 = src->m00; mat3.m01 = src->m01; */ mat3.m02 = src->m02;
  /* mat3.m10 = src->m10; mat3.m11 = src->m11; */ mat3.m12 = src->m12;
  /* mat3.m20 = src->m20; mat3.m21 = src->m21; */ mat3.m22 = src->m22;
  dst->m33 = Determinant3(&mat3) * invA;

  Transpose(NULL);
  return TRUE;
}


/*-----------------------------------------------
  �J�����g�}�g���b�N�X�̃g�����X�𓾂�
-----------------------------------------------*/
void GetCurrentTrans(VECTOR *v)
{
  MATRIX *mat = currentMatrix;

  v->x = mat->m30;
  v->y = mat->m31;
  v->z = mat->m32;
}


/*-----------------------------------------------
  �x�N�g�����}�g���b�N�X -> �x�N�g��
-----------------------------------------------*/
#if 0

                           |m00 m01 m02 m03|
|X  Y  Z  W| = |x  y  z  1||m10 m11 m12 m13|
                           |m20 m21 m22 m23|
                           |m30 m31 m32 m33|

#endif
void ApplyMatrix(VECTOR *v1, VECTOR *v0)
{
  MATRIX *mat;
//  float w, oow;

  mat = currentMatrix;

  v1->x = (v0->x * mat->m00 + v0->y * mat->m10 + v0->z * mat->m20) + mat->m30;
  v1->y = (v0->x * mat->m01 + v0->y * mat->m11 + v0->z * mat->m21) + mat->m31;
  v1->z = (v0->x * mat->m02 + v0->y * mat->m12 + v0->z * mat->m22) + mat->m32;
  v1->w = (v0->x * mat->m03 + v0->y * mat->m13 + v0->z * mat->m23) + mat->m33;
/*
  if (w != 0.0f){
    oow = 1.0f / w;
  }
  else {
    oow = 1.0f;
  }
  v1->x *= oow;
  v1->y *= oow;
  v1->z *= oow;
  v1->w = w;
*/
}

/*-----------------------------------------------
  �x�N�g�����}�g���b�N�X -> �x�N�g���i��]�̂݁j
-----------------------------------------------*/
#if 0

                           |m00 m01 m02  0|
|X  Y  Z  1| = |x  y  z  1||m10 m11 m12  0|
                           |m20 m21 m22  0|
                           | 0   0   0   1|

#endif
void ApplyMatrixRot(VECTOR *v1, VECTOR *v0)
{
  MATRIX *mat;
  mat = currentMatrix;

  v1->x = (v0->x * mat->m00 + v0->y * mat->m10 + v0->z * mat->m20);
  v1->y = (v0->x * mat->m01 + v0->y * mat->m11 + v0->z * mat->m21);
  v1->z = (v0->x * mat->m02 + v0->y * mat->m12 + v0->z * mat->m22);
}


/*-----------------------------------------------
  �x�N�g�����}�g���b�N�X -> �x�N�g���i���s�ړ��̂݁j
-----------------------------------------------*/
#if 0

                           | 1   0   0   0|
|X  Y  Z  1| = |x  y  z  1|| 0   1   0   0|
                           | 0   0   1   0|
                           |m30 m31 m32  1|

#endif
void ApplyMatrixTrans(VECTOR *v1, VECTOR *v0)
{
  MATRIX *mat;
  mat = currentMatrix;

  v1->x = v0->x + mat->m30;
  v1->y = v0->y + mat->m31;
  v1->z = v0->z + mat->m32;
}


/*-----------------------------------------------
  �Q�x�N�g���̊O��
-----------------------------------------------*/
void OuterProduct( VECTOR *dst, VECTOR *v1, VECTOR *v2 )
{
  dst->x = v1->y * v2->z - v1->z * v2->y;
  dst->y = v1->z * v2->x - v1->x * v2->z;
  dst->z = v1->x * v2->y - v1->y * v2->x;
}


/*-----------------------------------------------
  �Q�x�N�g���̓���
-----------------------------------------------*/
float InnerProduct(VECTOR *v1, VECTOR *v2)
{
  return v1->x * v2->x + v1->y * v2->y + v1->z * v2->z;
}


/*-----------------------------------------------
  �P�ʃx�N�g��
-----------------------------------------------*/
void UnitVector(VECTOR *v)
{
  float d;

  d = (float)sqrt(v->x * v->x + v->y * v->y + v->z * v->z);
  if (d < 0.00001f){
    v->x = 1.0f;
    v->y = 0.0f;
    v->z = 0.0f;
    return;
  }
  d = 1.0f / d;
  v->x *= d;
  v->y *= d;
  v->z *= d;
}


/*-----------------------------------------------
  �J�����}�g���b�N�X����
-----------------------------------------------*/
void LookAt(VECTOR *cam_pos, VECTOR *cam_int)
{
  VECTOR vec;
  float x, y;

  /* �����_->�|�W�V�����̃x�N�g�� */
  vec.x = cam_pos->x - cam_int->x;
  vec.y = cam_pos->y - cam_int->y;
  vec.z = cam_pos->z - cam_int->z;

  /* ��]�p */
  y = (float)atan2(vec.x, vec.z);
  x = (float)-atan2(vec.y, sqrt(vec.x*vec.x + vec.z*vec.z));

  RotX(-x);
  RotY(-y);
  Trans(-cam_pos->x, -cam_pos->y, -cam_pos->z);
}

void  LookAtWithRoll(VECTOR *cam_pos, VECTOR *cam_int, float roll)
{
  VECTOR vec;
  float x, y;

  /* �����_->�|�W�V�����̃x�N�g�� */
  vec.x = cam_pos->x - cam_int->x;
  vec.y = cam_pos->y - cam_int->y;
  vec.z = cam_pos->z - cam_int->z;

  /* ��]�p */
  y = (float)atan2(vec.x, vec.z);
  x = (float)-atan2(vec.y, sqrt(vec.x*vec.x + vec.z*vec.z));

  RotX(-x);
  RotY(-y);
  Trans(-cam_pos->x, -cam_pos->y, -cam_pos->z);
  RotZ(-roll);
}


/*---------------------------------------------------------------------*
 *	�������e
 *---------------------------------------------------------------------*/
/*
static void PerspectiveViewScreen( float scrz, float ax, float ay, 
	       float xcenter, float ycenter, float zbufsmall, float zbufbig, float zD, float zF, float D, float F, float W, float H)
{

		// D = nearz, F = farz, W = width/2, H = Height/2
		//
		// Perspective
		//
		//     | scrz*ax/W          0            0           0 |
		// m = |    0       scrz*ay/H            0           0 | 
		//     |    0               0  (F+D)/(F-D)  -2FD/(F-D) |
		//     |    0               0            1           0 |
		// z = D, zh = -D, z = F, zh = F		�y�N���b�v�͈̔� zh :(-D, F)


	float p, q, fscale, foffset, zscale, zoffset, qa, qb, za, zb;

		p = (F+D)/(F-D);
		q = -2*F*D/(F-D);

		SetVector( &vs->a, scrz * ax / W, scrz * ay / H, p, 1.0f );
		SetVector( &vs->b, 0.0f, 0.0f, q, 0.0f);
		SetVector( &vs->ra, 1/(scrz * ax / W), 1/(scrz * ay / H), 1/(p), 0.0f );
		SetVector( &vs->rb, 0.0f, 0.0f, -q/(p), 0.0f);


		za = zD * zF * (zbufbig - zbufsmall) / (zF - zD);
		zb = (zbufsmall * zF - zbufbig * zD) / (zF - zD);

		zscale = za / q;
		zoffset = zb - za * p / q;


		if ( fognearz < fogfarz ) {
			qa =  fogfarz * fognearz / (fogfarz - fognearz) * 255.0f;
			qb =  -fognearz / (fogfarz - fognearz) * 255.0f;
		}
		else {
			qa = 0.0f;
			qb = 255.0f;
		};

		fscale = qa / q;
		foffset = qb - qa * p / q;

		SetVector( &vs->v, xcenter, ycenter, zoffset, fscale );
		SetVector( &vs->t, W, H, zscale, foffset);

		SetVector( &vs->cmin, -W + xcenter, -H + ycenter, -D, 1.0f );
		SetVector( &vs->cmax,  W + xcenter,  H + ycenter,  F, -zb );
}

void PerspectiveViewScreen( ViewScreen * vs, float scrz, float ax, float ay, 
	       float xcenter, float ycenter, float zbufsmall, float zbufbig, float D, float F, float fognearz, float fogfarz, float W, float H)
{
		PerspectiveViewScreenEx(vs, scrz, ax, ay, xcenter, ycenter, zbufsmall, zbufbig, D, F, D, F, fognearz, fogfarz, W, H);
}

*/

/*-----------------------------------------------
  2�_�Ԃ̋��������߂�(3D)
-----------------------------------------------*/

float GetVectorDistance( VECTOR *v1, VECTOR *v2 )
{
	float x,y,z;
	x = (float)fabs( v1->x - v2->x );
	y = (float)fabs( v1->y - v2->y );
	z = (float)fabs( v1->z - v2->z );
	return (float)sqrt( x * x + y * y + z * z );
}


/*-----------------------------------------------
  �C�ӂ̓_���|���S��(�l�p�`)���ɂ��邩?(2D)
-----------------------------------------------*/

int HasPoint2D( float x, float y, VECTOR *v )
{
	int i,j,r,npol;
	r=0;npol=4;
	for( i=0,j=npol-1; i<npol; j=i++ ) {
		if (((( v[i].y <=y )
			&& ( y<v[j].y ))
			|| (( v[j].y <= y )
			&& ( y<v[i].y )))
			&& ( x<(v[j].x-v[i].x)*(y-v[i].y)/(v[j].y-v[i].y)+v[i].x))
			r=!r;
	}
	return r;
}


/*-----------------------------------------------
  �����ƕ��ʂ̌�_�����߂�(3D)
-----------------------------------------------*/

int IntersectLinePlane( VECTOR *lpoint, VECTOR *lvector, VECTOR *ppoint, VECTOR *pnormal, VECTOR *result )
{
	float top,bottom,mul;
	top = ( ppoint->x - lpoint->x ) * pnormal->x
		+ ( ppoint->y - lpoint->y ) * pnormal->y
		+ ( ppoint->z - lpoint->z ) * pnormal->z;
	bottom  = lvector->x * pnormal->x
			+ lvector->y * pnormal->y
			+ lvector->z * pnormal->z;
	if ( bottom == 0.0f ) return -1;		// ���s
	mul = top / bottom;
	result->x = lpoint->x + mul * lvector->x;
	result->y = lpoint->y + mul * lvector->y;
	result->z = lpoint->z + mul * lvector->z;
	return 0;
}


/*-----------------------------------------------
  �C�ӂ̓_���|���S��(�l�p�`)���ɂ��邩?(3D)
-----------------------------------------------*/

static int HasPoint3DSub( float x, float y, VECTOR *v, int p1, int p2 )
{
	int i,j,r,npol;
	float *ti;
	float *tj;
	r=0;npol=4;
	for( i=0,j=npol-1; i<npol; j=i++ ) {
		ti = (float *)&v[i]; tj = (float *)&v[j];
		if (((( ti[p2] <=y )
			&& ( y<tj[p2] ))
			|| (( tj[p2] <= y )
			&& ( y<ti[p2] )))
			&& ( x<(tj[p1]-ti[p1])*(y-ti[p2])/(tj[p2]-ti[p2])+ti[p1]))
			r=!r;
	}
	return r;
}


int HasPoint3D( VECTOR *p, VECTOR *v )
{
	if ( HasPoint3DSub( p->x, p->y, v, 0, 1 ) )
//		if ( HasPoint3DSub( p->x, p->z, v, 0, 2 ) ) return -1;
			if ( HasPoint3DSub( p->y, p->z, v, 1, 2 ) ) return -1;
	return 0;
}


void GetTargetAngle( VECTOR *ang, VECTOR *src, VECTOR *target )
{
	//--------------------------------------------------
	//	�J�����̃|�W�V����->�����_�̉�]�p�����߂�
	//--------------------------------------------------
	VECTOR vec;
	/* �����_->�|�W�V�����̃x�N�g�� */
	vec.x = src->x - target->x;
	vec.y = src->y - target->y;
	vec.z = src->z - target->z;
	/* ��]�p */
	ang->y = (float)-atan2( vec.x, vec.z );
	ang->x = (float)-atan2( vec.y, sqrt(vec.x*vec.x + vec.z*vec.z) );
	ang->z = 0.0f;
	ang->w = 0.0f;
}
	
