#ifndef		__SYSREQ_H__
#define		__SYSREQ_H__

/*---------------------------------------------------------------------------*/

// �V�X�e���������R�[�h
enum {
SYSREQ_NONE = 0,
SYSREQ_PHYSICS_RATE,
SYSREQ_MAXOBJ,
SYSREQ_MAXLOG,
SYSREQ_DEFAULT_WEIGHT,
SYSREQ_DEFAULT_MOMENT,
SYSREQ_DEFAULT_DAMPER,
SYSREQ_DEFAULT_FRICTION,
SYSREQ_MAX
};

void InitSysReq( void );
void SetSysReq( int reqid, int val );
void SetSysReq( int reqid, float val );
float GetSysReq( int reqid );
int GetSysReqInt( int reqid );
void DebugMsg( char *format, ... );
char *GetDebug( void );

/*---------------------------------------------------------------------------*/

#endif
