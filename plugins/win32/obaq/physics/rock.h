#ifndef ROCK_H

//
// OBAQ physics library
// Copyright   : Zener Works, Inc/kuni/onitama
// License     : CC BY-NC-ND 4.0
// See OBAQlicense.txt for information
// This is a part of HSP related product.
// http://hsp.tv/
//
//

#include <stdio.h>
#include <float.h>
#include <math.h>
#include <string.h>

#include "ptttypes.h"
#include "gamePhysics.h"

/*
#define MAX_ROCKBASE_VERTEX		256
#define MAX_ROCKBASE_VERTEXW	1024

#define MAX_ROCK			64
#define MAX_ROCK_AREA		8
#define MAX_ROCK_WIRE		2

#define MAX_WIRE			8
#define MAX_WIRE_POINT		32

const float margin_default = 2.0f;
const float margin_collect = 4.0f;
const float margin_attract = 8.0f;

const float maxRockSpeed = 9.9f;
*/

class ROCK {
	public:
		enum {
			stat_reserve	= 0x00,	// ��
			stat_sleep		= 0x01,	// �p�����[�^��`�͂������Ǐo�����Ă��Ȃ��B
			stat_active		= 0x02,	// �o�����Ă���B
		};

		enum {
			collisionCheck_none		= 0,	// �o�����R���W�����`�F�b�N����
			collisionCheck_active	= 1,	// �o����active��Ԃ̊�Ƃ̐ڐG�������
			collisionCheck_all		= 2,	// �o����reserve��ԈȊO�̊�Ƃ̐ڐG�������
			collisionCheck_nest		= 3,	// nest�t���O�̗����Ă���₩��o��������
		};

		enum {
			addFail_overflow		= -1,
			addFail_collision		= -2,
		};

		enum {
			// �m��
			type_normal		= 0x0000,
			type_inner		= 0x0001,	// ���\���t�Ƃ��Ĕ���i�قڊO����p�j
			type_puppet		= 0x0002,	// ����̈ꕔ���Q�[�����Ɉڂ��A�ړ��������L�����Z���B
										// ����������O�͂� force, torque �ɓ����Ă��邽�߁A weight, moment�Ŋ������l�Əd�͉����x�� speed, rSpeed �ɉ��Z����Βʏ�̕��������B
										// �����W�̍X�V��ɂ́AcalcVertexW()���ĂсA���_���Ƃ̃��[���h���W���X�V����K�v������̂Œ��ӁB
			type_explode	= 0x0004,	// �@���⑼�̔����Atype_ignite���ݒ肳�ꂽROCK�ɐG���ƁA�V���ɔ�������������B
			type_ignite		= 0x0008,	// �ڐG�ɂ��Atype_explode���ݒ肳�ꂽROCK�𔚔�������B

			// ���ؒ�
			type_cancelShot	= 0x0010,	// �V���b�g�Ƃ̏Փ˔�����s��Ȃ��B
		//	type_sponge		= 0x0020,	// �����z���B

			type_bindX		= 0x0040,	// x���ړ����Œ肷��B
			type_bindY		= 0x0080,	// y���ړ����Œ肷��B
			type_bindXY		= 0x00c0,	// xy���ړ����Œ肷��B
			type_bindR		= 0x0100,	// ��]���Œ肷��B
			type_bind		= 0x01c0,	// ���S�ɌŒ肷��B

			type_attract	= 0x0600,
			type_attractW	= 0x0200,
			type_attractB	= 0x0400,

			type_item		= 0x0800,

			type_quake		= 0x1000,

			type_float		= 0x2000,

			type_boss		= 0x4000,

			type_ceiling	= 0x8000,

			type_freeze		= 0x10000,

			type_nest		= 0x20000,

			type_bar		= 0x40000,

			type_autowipe	= 0x100000,		// �ڐG�Ŏ����I�ɏ�������
			type_rewind		= 0x80000,		// �p�x�������I�ɕ��A������
			type_autoguide	= 0x200000,		// �ړI�n��L���ɂ���

			type_debug		= 0x80000000,
		};

		unsigned int	type;

		unsigned short	sleepCount;		// �f�N�������g����A�[���ɂȂ�����active�ɏ�ԕύX�B�ŏ�����[���̏ꍇ�̓f�N�������g���ꂸsleep�p���B

		unsigned char	stat;

		char			nTotalVertex;
		char			nArea;

		float			damage;
		float			damageLimit;	// ���e�_���[�W, �}�C�i�X�͖��G, �[���͑���, �j�󔻒�̓Q�[�����ւ̈ڊǂ��Ó�
		float			damageShave;	// �����ɂ��_���[�W������

		bool			shave;			// ����Ă����true

		short			startAreaVertex;
		short			startVertex;
		short			startVertexW;

		char			wirenum[MAX_ROCK_WIRE];

		FVECTOR2		center;
		float			angle;

		float			weight;
		float			moment;
		float			buoyancy;

		float			radius;
		float			radiusSqrt;

		float			cost, sint;

		FVECTOR2		speed;
		float			rSpeed;

		FVECTOR2		force;
		float			torque;

		float			torqueV;
		unsigned int	tSign;

		FVECTOR2		tmpCenter;
		float			tmpAngle;

		short			parentRock;
		float			parentAngle;
		float			parentDistance;

		unsigned int	group;				// ��������O���[�v�̃r�b�g��ON�ɂȂ�
		unsigned int	exceptGroup;		// �Փ˔�������O����O���[�v�̃r�b�g��ON�ɂȂ�
		unsigned int	recordGroup;		// �Փ˃��O���L�^����O���[�v�̃r�b�g��ON�ɂȂ�

		char			ground;				// �ڒn�i�����̂ɏ㑤����ڐG�j���Ă���ꍇ��|=1, ������킸�ڐG�� |=2
		char			bombarded;			// �����ɂ���ă_���[�W���󂯂��ۂɗ��t���O

		unsigned char	mineral;			// �j�󎞂ɕ��o����锚��

		unsigned char	stop;

		char			round;

		int				num;
		class ROCKBASE* base;

		float			inertia;			// �Đ�(0.0f <= inertia <= 1.0f, default 0.999f), 0.0f�ɋ߂Â��قǓ��R�ł˂��Ƃ肵�������ɂȂ�
		float			friction;			// ���C(0.0f <= friction <= 1.0f, default - 0.7f), �ڐG���镨�̂�friction�Ə�Z�������l���Q�Ƃ����
		float			damper;				// �z�U(0.0f <= damper <= 1.0f, default - 0.7f), �ڐG���镨�̂�damper�Ə�Z�������l���Q�Ƃ����

		float			gravity;

		FVECTOR2		minPos, maxPos;
		float			marginOrg;

		// �Q�[�����ŗ��p����p�����[�^�ւ̃|�C���^
		class GAMEROCK*	pGameRock;

		short			target_id;				// �^�[�Q�b�gID
		short			target_opt;				// �^�[�Q�b�goption
		short			target_timer;			// �^�[�Q�b�gtimer
		short			target_int;				// �^�[�Q�b�g�C���^�[�o��
		float			target_x,target_y;		// �^�[�Q�b�gX,Y
		float			target_px,target_py;	// �^�[�Q�b�g�X�V�lX,Y
		float			target_x1,target_x2;	// �^�[�Q�b�gX�ݒ�͈�
		float			target_y1,target_y2;	// �^�[�Q�b�gY�ݒ�͈�
		float			target_maxsp;			// �^�[�Q�b�g�ڋߍő呬�x

		ROCK() {
			init();
		}
		void init(void);

		void setSide(float margin);
		void deleteSide(void);
		void calcVertexW(void);

		void setDamage(float limit_, float shave_ = 0.0f, int mineral_ = 0) {
			damageLimit = limit_;
			damageShave = shave_;
			mineral = mineral_;
		}
		void setWeight(float weight_, float moment_, float buoyancy_ = 0.0f) {
			weight = weight_;
			moment = moment_;
			buoyancy = buoyancy_;
		}

		// �ʒu������
		void setPosition(float x, float y) {
			center.x = x;
			center.y = y;
		}
		// �p�x������
		void setAngle(float r) {
			angle = r;
		}
		// �ʒu���ړ��i���x���ݒ�j
		void movePosition(float x, float y) {
			FVECTOR2 oc = center;
			center.x = x;
			center.y = y;
			speed.x = x - oc.x;
			speed.y = y - oc.y;
		}
		// �p�x����]�i�p���x���ݒ�j
		void turnAngle(float r) {
			float oa = angle;
			angle = r;
			rSpeed = r - oa;
		}

		// type_inner���ォ��ύX�����ۂ̃��Z�b�g�p
		void reset(void) {
			setSide(marginOrg);
			calcVertexW();
		}

		float collision_rock(ROCK* pR2);
		float check_rock(ROCK* pR2);
		float check_rock_rev(ROCK* pR2);
		float collision_point_n(float xw, float yw, ROCK* pR, int &nvv, FVECTOR2* pVertex = NULL);
		float collision_fluid(float xw, float yw, FVECTOR2* pFr);
		float collision_circle(float xw, float yw);

		void push(float xw, float yw, float ax, float ay);
		void blast(float xw, float yw, float power, float nearClip = 1.0f, float farCLip = FLT_MAX);

		void pushMove(float xw, float yw, float ax, float ay);
		void blastMove(float xw, float yw, float power, float nearClip = 1.0f, float farClip = FLT_MAX);
};

class WIRE {
	public:
		short		vertex;		// �ڑ����̒��_�ԍ�
		short		rock;		// �ڑ���̊�ԍ��i�}�C�i�X�Ŕw�i�ɌŒ�j
		float		length;		// ���C���[����(�}�C�i�X�Ŗ��o�^)
		float		tension;
		FVECTOR2	position;	// �ڑ���̍��W

		short		nPoint;
		char		unfix;
		float		jointLength;

		FVECTOR2	pointPosition[MAX_WIRE_POINT];
		FVECTOR2	pointSpeed[MAX_WIRE_POINT];

		WIRE() {
			init();
		}
		void init(void) {
			length = -1.0f;
		}
};

struct COLLISIONLOG {
	unsigned int	rockNum;	// �ڐG����rock�̔ԍ��B����16bit�Ə��16bit�ŕʂ̔ԍ��������Ă���̂Œ��ӁB
	FVECTOR2*		vertexID;	// ���������p�B

	FVECTOR2		position;	// �ڐG�ʒu�B 
	FVECTOR2		normal;		// rockNum�̒l�������������猩���A�ڐG�ʂ̖@�������B
	float			depth;		// �ڐG�ʂɂ߂肱�񂾋����B
	float			bound;		// �ڐG�ʂƐ����i�͂˂�j�����̑��x�B�v���X�����߂肱�ݕ����B
	float			slide;		// �ڐG�ʂƐ����i�Ђ�����j�����̑��x�B
};

class ROCKBASE {
	public:
		ROCK		rock[MAX_ROCK];
		WIRE		wire[MAX_WIRE];

		char		areaVertex[MAX_ROCKBASE_AREAVERTEX];
		int			nAreaVertex;

		FVECTOR2	vertex[MAX_ROCKBASE_VERTEX];
		FSEQ		side[MAX_ROCKBASE_VERTEX];
		int			nVertex;

		FVECTOR2	vertexW[MAX_ROCKBASE_VERTEXW];
		int			nVertexW;

		FVECTOR2	gravity;
		float		maxBombRadius;

		COLLISIONLOG*	pCollisionLog;
		int				nCollisionLog;
		int				maxCollisionLog;
		int				overflowCollisionLog;

		int				getCollisionParam[2];
		COLLISIONLOG*	getCollisionTmp;

		ROCKBASE() {
			maxCollisionLog = 0;
			init();
		}
		~ROCKBASE() {
			if(maxCollisionLog) {
				delete pCollisionLog;
			}
		}

		// ������
		void init(int _maxCollisionLog = 0) {
			nAreaVertex = 0;
			nVertex = 0;
			nVertexW = 0;
			gravity.x = 0.0f;
			gravity.y = 0.01f / 4.0f;

			if(maxCollisionLog) {
				delete pCollisionLog;
			}
			maxCollisionLog = _maxCollisionLog;
			if(maxCollisionLog) {
				pCollisionLog = new COLLISIONLOG[maxCollisionLog];
			}
			resetCollisionLog();
		}

		void setGravity(float x, float y) {
			gravity.x = x;
			gravity.y = y;
		}

		// �R���W�������O�̃��Z�b�g
		void resetCollisionLog(void) {
			nCollisionLog = 0;
			overflowCollisionLog = 0;
			getCollisionParam[0] = -1;
			getCollisionParam[1] = -1;
		}

		// rocknumA��rocknumB���Փ˂��Ă���ꍇ�ɁACOLLISIONLOG�ւ̃|�C���^��Ԃ��B
		// �� �Փ˂͕����ӏ��ŋN���邱�Ƃ����邽�߁A�Ă΂�邲�ƂɎ��̏Փ˂ւƑΏۂ��ڂ�B
		// �� NULL���Ԃ�悤�ɂȂ�����A����ȏ�̏Փ˂͑��݂��Ȃ��B
		// �� rocknumB���}�C�i�X�̏ꍇ�́ArocknumA�Ɋւ���S�Ă̏Փ˂��擾���郏�C���h�J�[�h�ɂȂ�B
		// �� rocknumA��rocknumB�̒l���O��̌Ăяo���ƈقȂ�ꍇ�́A�ǂݏo���̃|�C���^�����Z�b�g�����B
		// �� �蓮�Ń��Z�b�g��ɌĂяo�����s�������ꍇ�́Areset��true�ɂ��ČĂяo���B
		// �� COLLISIONLOG�̖@�������́Arocknum*�̒l�����������猩���@�������B
		COLLISIONLOG* getCollisionLog(int rocknumA, int rocknumB = -1, bool reset = false) {
			if(rocknumA != getCollisionParam[0] || rocknumB != getCollisionParam[1] || reset == true) {
				getCollisionParam[0] = rocknumA;
				getCollisionParam[1] = rocknumB;
				getCollisionTmp = pCollisionLog;
			}

			if(rocknumB >= 0) {
				unsigned int rocknum;
				if(rocknumA < rocknumB) {
					rocknum = (rocknumA << 16) | rocknumB;
				} else{
					rocknum = (rocknumB << 16) | rocknumA;
				}

				while(getCollisionTmp != (pCollisionLog + nCollisionLog)) {
					COLLISIONLOG* r = getCollisionTmp ++;
					if(r->rockNum == rocknum) {
						return r;
					}
				}
			} else {
				while(getCollisionTmp != (pCollisionLog + nCollisionLog)) {
					COLLISIONLOG* r = getCollisionTmp ++;
					if((r->rockNum & 0x0000ffff) == rocknumA || (r->rockNum >> 16) == rocknumA) {
						return r;
					}
				}
			}

			return NULL;
		}

		void proc(int procCount, bool wake);
		void proc2(void);

	//	void sync(ROCKBASE* pSrc, int cont);
	//	void makeRockMap(unsigned char* pMap, int width, int height);

		int addRock(int stat, int type, float weight, float moment, float buoyancy, float x, float y, float angle, float xsize, float ysize, int nVertex, const FVECTOR2* pVec, float margin, int collisionCheck, unsigned int group, unsigned int exceptGroup);
		int adjustRock(ROCK* pR, int stat, int type, float weight, float moment, float buoyancy, float x, float y, float angle, float xsize, float ysize, int nVertex, const FVECTOR2* pVec, float margin, int collisionCheck);
		void delRock(ROCK* pR);
};

#endif
#define ROCK_H
