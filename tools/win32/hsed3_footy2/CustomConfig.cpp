/*------------------------------------------------------------------------------
	�J�X�^���ݒ�t�@�C���ǂݍ��� for HSP Script Editor by inovia
	�쐬 2012.06.21
	�C�� 2012.06.21
------------------------------------------------------------------------------*/

// ������Ȃ��̂����邩��
#include <windows.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "Footy2.h"
#include "hsed_config.h"
#include "poppad.h"
#include "config.h"
#include "classify.h"
#include "support.h"
#include "exttool.h"

#include "CustomConfig.h"
#include "PackIconResource.h"

// PathFileExists�Ŏg�p
#include "shlwapi.h"
#pragma comment(lib, "shlwapi.lib")

#pragma warning( disable : 4996 )
#pragma warning( disable : 4006 )

// �t���p�X�Q�b�g
void GetINIFullPath(char *inipath){
	GetModuleFileNameA(0, inipath, _MAX_PATH);
	PathRemoveFileSpec(inipath);	// �f�B���N�g���݂̂ɂ���
	strcat(inipath, "\\custom.ini");
}

// �ݒ肪���������Ȃ̂Ŕėp�I�Ɏg����悤�ɕύX
void SetINICustomInt(int f, char *s){
	// EXE(hsed3.exe)�̂���f�B���N�g��
	char inipath[_MAX_PATH+1];
	GetINIFullPath(inipath);

	char tmp[64];
	sprintf(tmp,"%d",f);
	WritePrivateProfileString("HSED3", s, tmp, inipath);
}

void SetINICustomBOOL(BOOL f, char *s){
	// EXE(hsed3.exe)�̂���f�B���N�g��
	char inipath[_MAX_PATH+1];
	GetINIFullPath(inipath);

	char tmp[64];
	if (f == TRUE){
		sprintf(tmp, "1");
	}else{
		sprintf(tmp, "0");
	}
	WritePrivateProfileString("HSED3", s, tmp, inipath);
}

void SetINICustomString(char *key, char *value){
	// EXE(hsed3.exe)�̂���f�B���N�g��
	char inipath[_MAX_PATH+1];
	GetINIFullPath(inipath);

	WritePrivateProfileString("HSED3", key, value, inipath);
}

int GetINICustomInt(char *s){

	// EXE(hsed3.exe)�̂���f�B���N�g��
	char inipath[_MAX_PATH+1];
	GetINIFullPath(inipath);

	// �p�X���Ȃ��ꍇ�͐ݒ��0�ɂ��ĕԋp
	if (!_PathFileExists(inipath))
		return 0;

	// INI�t�@�C���ǂݍ���(���s�����Ƃ���0)
	return GetPrivateProfileIntA("HSED3", s, 0, inipath);
}

// ���炩���ߌĂяo�����Ńo�b�t�@�̊m��&0���߂��K�v
DWORD GetINICustomString(char *key, char *value, int maxLength){

	// EXE(hsed3.exe)�̂���f�B���N�g��
	char inipath[_MAX_PATH+1];
	GetINIFullPath(inipath);

	// �p�X���Ȃ��ꍇ��0�ɂ��ĕԋp
	if (!_PathFileExists(inipath))
		return 0;

	// INI�t�@�C���ǂݍ���(���s�����Ƃ���0)
	return GetPrivateProfileStringA("HSED3", key, "", value, (DWORD)maxLength, inipath);
}

BOOL GetINICustomBOOL(char *s){

	// EXE(hsed3.exe)�̂���f�B���N�g��
	char inipath[_MAX_PATH+1];
	GetINIFullPath(inipath);

	// �p�X���Ȃ��ꍇ�͐ݒ��0�ɂ��ĕԋp
	if (!_PathFileExists(inipath))
		return FALSE;

	// INI�t�@�C���ǂݍ���(���s�����Ƃ���0)
	return GetPrivateProfileIntA("HSED3", s, FALSE, inipath);
}

// ���ύX

void SetINIForceFont(BOOL f){
	// EXE(hsed3.exe)�̂���f�B���N�g��
	char inipath[_MAX_PATH+1];
	GetINIFullPath(inipath);

	char tmp[64];
	if (f == TRUE){
		sprintf(tmp, "1");
	}else{
		sprintf(tmp, "0");
	}
	WritePrivateProfileString("HSED3", "ForceFont", tmp, inipath);
}


void SetINICustomColor(int f){
	// EXE(hsed3.exe)�̂���f�B���N�g��
	char inipath[_MAX_PATH+1];
	GetINIFullPath(inipath);

	char tmp[64];
	sprintf(tmp,"%d",f);
	WritePrivateProfileString("HSED3", "CustomColor", tmp, inipath);
}

// INI�t�@�C���̃t�H���g�����ݒ��ǂݍ���
int GetINIForceFont(void){

	// EXE(hsed3.exe)�̂���f�B���N�g��
	char inipath[_MAX_PATH+1];
	GetINIFullPath(inipath);

	// �p�X���Ȃ��ꍇ�͐ݒ��0�ɂ��ĕԋp
	if (!_PathFileExists(inipath))
		return 0;

	// INI�t�@�C���ǂݍ���(���s�����Ƃ���0)
	return GetPrivateProfileIntA("HSED3", "ForceFont", 0, inipath);
}

// INI�t�@�C���̃J�X�^���J���[�ݒ��ǂݍ���
BOOL GetINICustomColor(void){

	// EXE(hsed3.exe)�̂���f�B���N�g��
	char inipath[_MAX_PATH+1];
	GetINIFullPath(inipath);

	// �p�X���Ȃ��ꍇ�͐ݒ��0�ɂ��ĕԋp
	if (!_PathFileExists(inipath))
		return FALSE;

	// INI�t�@�C���ǂݍ���(���s�����Ƃ���0)
	return GetPrivateProfileIntA("HSED3", "CustomColor", FALSE, inipath);
}

