// -------------------------------------------------------------------------------
//
//  DxBulletCompat.h
//
//  DxLib の D_bt* プレフィクス付き Bullet クラスを
//  extlib/bullet3 の bt* クラスに対応付ける shim。
//
//  DxUseCLibPhysics.cpp を Desktop SDL2 fork でビルドする際に force-include する。
//  これにより DxLib 専用の Bullet bundle が無くても extlib/bullet3 を再利用できる。
//
// -------------------------------------------------------------------------------
#ifndef DX_BULLET_COMPAT_H
#define DX_BULLET_COMPAT_H

#include "btBulletDynamicsCommon.h"
#include "BulletDynamics/ConstraintSolver/btGeneric6DofSpringConstraint.h"
#include "BulletCollision/BroadphaseCollision/btAxisSweep3.h"

#define D_btScalar                             btScalar
#define D_btVector3                            btVector3
#define D_btMatrix3x3                          btMatrix3x3
#define D_btTransform                          btTransform

#define D_btMotionState                        btMotionState
#define D_btDefaultMotionState                 btDefaultMotionState

#define D_btCollisionShape                     btCollisionShape
#define D_btBoxShape                           btBoxShape
#define D_btSphereShape                        btSphereShape
#define D_btCapsuleShape                       btCapsuleShape
#define D_btStaticPlaneShape                   btStaticPlaneShape

#define D_btCollisionObject                    btCollisionObject
#define D_btRigidBody                          btRigidBody
#define D_btRigidBodyConstructionInfo          btRigidBodyConstructionInfo

#define D_btTypedConstraint                    btTypedConstraint
#define D_btGeneric6DofSpringConstraint        btGeneric6DofSpringConstraint

#define D_btDefaultCollisionConfiguration      btDefaultCollisionConfiguration
#define D_btCollisionDispatcher                btCollisionDispatcher
#define D_btAxisSweep3                         btAxisSweep3
#define D_btSequentialImpulseConstraintSolver  btSequentialImpulseConstraintSolver
#define D_btDiscreteDynamicsWorld              btDiscreteDynamicsWorld
#define D_btContinuousDynamicsWorld            btDiscreteDynamicsWorld

// 定数 (CollisionObject 内 enum / 活性状態 #define)
#define D_CF_KINEMATIC_OBJECT                  btCollisionObject::CF_KINEMATIC_OBJECT
#define D_DISABLE_DEACTIVATION                 DISABLE_DEACTIVATION
#define D_ACTIVE_TAG                           ACTIVE_TAG

#endif // DX_BULLET_COMPAT_H
