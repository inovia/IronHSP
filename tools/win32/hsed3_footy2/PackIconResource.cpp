/*------------------------------------------------------------------------------
	�A�C�R���ƃ��\�[�X���ߍ��� for HSP Script Editor by inovia
	�쐬 2012.02.24
	�C�� 2012.04.08
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

#include "PackIconResource.h"
#include "CustomColorKeywords.h"

// PathFileExists�Ŏg�p
#include "shlwapi.h"
#pragma comment(lib, "shlwapi.lib")

#pragma warning( disable : 4996 )
#pragma warning( disable : 4006 )

void RunIconChange(int activeFootyID){
	/* inovia */
	char fpath[1024+1] = {0};	// EXE
	char ipath[1024+1] = {0};	// ico
	char rpath[1024+1] = {0};	// �o�[�W�������\�[�X
	char mpath[1024+1] = {0};	// manifest by Tetr@pod
	char extension[1024+1] = {0};	// �g���q�i�I�v�V�����j
	int upx = 0;	// UPX�i�I�v�V�����j
	int lang = -1;	// ����ID�i�I�v�V�����j
	char cmd[8192+1] = {0};	// �R�}���h���C��

	GetIconResourcePath(fpath, ipath, rpath, mpath/*manifest by Tetr@pod*/, activeFootyID, &upx, &lang, extension);

	// #packopt name "hogehoge" ���Ȃ��ꍇ
	if (strcmp(fpath, "") == 0){
		strcpy(fpath, "hsptmp");
	}

	// EXE(hsed3.exe)�̂���f�B���N�g��
	char exepath[_MAX_PATH+1];
	GetModuleFileNameA(0, exepath, _MAX_PATH);
	_PathRemoveFileSpec(exepath);	// �f�B���N�g���݂̂ɂ���
	strcat(exepath, "\\iconins.exe");

	// �X�N���v�g�\�[�X�̃t�H���_(*.hsp)
	char tmpfn[_MAX_PATH+1] = {0};
	GetCurrentDirectory( _MAX_PATH, tmpfn );

	// ���R�}���h���C���ɓn��������������Ă���
	strcat(cmd, "-e\"");
	strcat(cmd, tmpfn);
	strcat(cmd, "\\");
	strcat(cmd, fpath);
	// �g���q��ύX����I�v�V�����i�w��Ȃ��̏ꍇ��.exe�j
	if (strcmp(extension, "") == 0){
		strcat(cmd, ".exe\"");
	}else{
		strcat(cmd, extension);
		strcat(cmd, "\"");
	}
	// �A�C�R���p�X
	if (strcmp(ipath, "") != 0){
		strcat(cmd, " -i\"");
		strcat(cmd, ipath);
		strcat(cmd, "\"");
	}
	// ���\�[�X�i�o�[�W�����j�p�X
	if (strcmp(rpath, "") != 0){
		strcat(cmd, " -v\"");
		strcat(cmd, rpath);
		strcat(cmd, "\"");
	}
	// ���\�[�X�imanifest�j�p�X by Tetr@pod
	if (strcmp(mpath, "") != 0){
		strcat(cmd, " -m\"");
		strcat(cmd, mpath);
		strcat(cmd, "\"");
	}

	
	if (upx == 1){
		// UPX���g���ꍇ
		strcat(cmd, " -u\"1\"");
	}
	if (lang != -1){
		// ����ID
		char tmp[1024+1] = {0};
		sprintf(tmp, " -l\"%d\"", lang);
		strcat(cmd, tmp);
	}
	//ShellExecute( NULL, "explore", tmpfn, NULL, NULL, SW_SHOWNORMAL );

	// �ǂ��炩�Ƀp�X�������Ă���ꍇ�͎��s����
	if ((strcmp(ipath, ""))||(strcmp(rpath, ""))||(upx == 1)){
		if (_PathFileExists(exepath)){
			//char runpath[4096+1];memset( fpath, '\0', sizeof(runpath) );	// �p�X
			//memset( runpath, '\0', sizeof(runpath) );
			//sprintf( runpath, "\"%s\" %s", exepath, cmd );
			//WinExec( runpath, SW_SHOW );
			
			// �I���܂őҋ@�������̂ł�������g�p
			SHELLEXECUTEINFO sei = {sizeof(sei)};
			sei.cbSize = sizeof(SHELLEXECUTEINFO);
			sei.hwnd = 0;
			sei.nShow = SW_SHOWNORMAL;
			sei.fMask = SEE_MASK_NOCLOSEPROCESS;
			sei.lpFile = exepath;
			sei.lpParameters = cmd;
			ShellExecuteEx(&sei);
			// �I���҂�
			WaitForSingleObject(sei.hProcess, INFINITE) ;
			
		}else{
			//
			MessageBoxA(GetActiveWindow(), "iconins.exe ��������܂���B�A�C�R���̖��ߍ��݂͎��s���܂����B", "�G���[", MB_OK | MB_ICONERROR);
		}
	}
	/* inovia */
}

BOOL _PathFileExists(LPCTSTR pszPath)
{
	return PathFileExists(pszPath);
}

BOOL _PathRemoveFileSpec(LPTSTR pszPath)
{
	return PathRemoveFileSpec(pszPath);
}

// ���C���X�N���v�g����p�X������
int GetIconResourcePath(char *exepath, char *iconpath, char *respath, char *manifestpath/*manifest by Tetr@pod*/, int _activeFootyID, int *upx, int *lang, char *extension){
	
	char *buffer, *dummy;
	// Footy2����P�s���擾
	int lines = Footy2GetLines(_activeFootyID);
	if (lines == FOOTY2ERR_NOID) return 0;	// ����ID��������Ȃ��ꍇ�͂��̂܂܃��^�[��
	int i = 0;
	int flag2 = 0;
	// �S�s���ׂ�
	for (i = 0;i <= lines; i++){
		// �P�s�̃T�C�Y���擾
		int linesize = Footy2GetLineLength(_activeFootyID, i);
		// ��肪�������ꍇ�͒��~
		if ( (linesize == FOOTY2ERR_ARGUMENT) || (linesize == FOOTY2ERR_NOID) ) break;
		// �P�s�̕�������0�̏ꍇ�i��s�̎��ɎQ�Ƃ���Ɨ�����j
		if (linesize == 0) continue;
		// ���I�m��
		buffer = (char *) calloc( linesize * 2 + 2 , sizeof(char) );
		// �P�s�擾(Footy2GetLineA�̃}�j���A���̈������Ԉ���Ă���̂Œ���)
		int res = Footy2GetLine(_activeFootyID, buffer, i, linesize * 2);
		// ���������Ă��܂��ق��̃o�b�t�@�[��buffer����dummy�փR�s�[
		dummy = (char *) calloc( linesize * 2 + 2 , sizeof(char) );
		memcpy(dummy, buffer, linesize * 2);
	
		// ��肪�������ꍇ�͒��~
		if ( (res == FOOTY2ERR_ARGUMENT) || (res == FOOTY2ERR_NOID) ){
			free(dummy);dummy = 0;
			free(buffer);buffer = 0;
			break;
		}
		
		// dummy����^�u�Ƌ󔒂���菜��
		/*
			0 #pack
			1 #packopt
			2  #packopt
			3 // #packopt 0 

			�̂悤�ȏꍇ�A#packopt �̑O�ɃX�y�[�X��^�u�������Ă��Ă����삷��悤�ɂ��邽��
		*/
		StrReplaceALL(dummy, "\t", "");
		StrReplaceALL(dummy, " ", "");

		// #packopt �����邩���ׂ�
		char *pos = strstr(dummy, "#packopt");
		if ((pos != NULL) && (pos-dummy == 0)){
			/*
			char test[128];
			sprintf(test,"%d",pos-dummy);
			MessageBoxA(0,test,"",0);
			*/
			// �^�u���󔒂ɕϊ�����(����)
			StrReplaceALL(buffer, "\t", " ");
			
			// �{���� #packopt �����ׂ�B
			// #packopt2 �Ƃ� #packopts �Ȃǂ̃P�[�X�ɑΉ�
			int splits = GetSplitNum(buffer, " ");
			int flag = 0;	// ��v�����ꍇ�̃t���O
			// �������������ׂ�
			int j;
			for (j = 0;j <= splits; j++){
				// �m��
				char* tmp = (char*)calloc(linesize * 2 + 2, sizeof(char));
				// �X�y�[�X�ŕ����������ʂ�tmp�ɑ��
				GetSplitString(buffer, " ", j, tmp);
				// ��v�����ꍇ�̓t���O�𗧂Ă�
				if (strcmp(tmp, "#packopt") == 0) flag = 1;
				// ���
				free(tmp);tmp = 0;
			}
			// #packopt����v�����ꍇ�̂ݑ��s
			if (flag == 1){
				// �L�[���[�h���擾�Ƃ�������r���ăt���O�𗧂Ă�
				// #packopt name "test"
				//           �� �R��
				splits = GetSplitNum(buffer, " ");
				int j;
				for (j = 0;j <= splits; j++){
					// �m��
					char* tmp = (char*)calloc(linesize * 2 + 2, sizeof(char));
					// �X�y�[�X�ŕ����������ʂ�tmp�ɑ��
					GetSplitString(buffer, " ", j, tmp);
					// ��v�����ꍇ�̓t���O�𗧂Ă�
					if (strcmp(tmp, "name") == 0){ 
						//MessageBoxA(0,tmp,tmp,0);
						flag2 = 1;
					}
					if (strcmp(tmp, "icon") == 0) flag2 = 2;
					if (strcmp(tmp, "version") == 0) flag2 = 3;
					if (strcmp(tmp, "upx") == 0) flag2 = 4;
					if (strcmp(tmp, "lang") == 0) flag2 = 5;
					if (strcmp(tmp, "ext") == 0) flag2 = 6;
					if (strcmp(tmp, "last") == 0) flag2 = 7;
					if (strcmp(tmp, "manifest") == 0) flag2 = 8;// manifest by Tetr@pod
					// ���
					free(tmp);tmp = 0;
				}
				// �� #packopt name "hogehoge" �̂������̊ԁi�͈́j���擾
				char *sp, *ep;
				char* outpath = (char*)calloc(linesize * 2 + 2, sizeof(char));
				sp = strstr(buffer, "\"");
				if (sp != NULL){
					ep = strstr(sp+1, "\"");
					if (ep != NULL){
						strncpy(outpath, sp+1, ep-sp-1);
						//MessageBox(0,outpath,"",0);
					}
				}

				// �����񂪒�������ꍇ�̓G���[������������
				if (strlen(outpath) > 512){
					strcpy(outpath, "::ERROR::");
				}

				// ��������
				switch (flag2) {
					case 1 : 
						// name
						strcpy(exepath, outpath);
						
						//MessageBoxA(0,exepath,exepath,0);
						break;
					case 2 : 
						// icon
						strcpy(iconpath, outpath);
						break;
					case 3 : 
						// version
						strcpy(respath, outpath);
						break;
					case 4 : 
						// upx
						char use_upx[1024+1];memset( use_upx, '\0', sizeof(use_upx) );
						strcpy(use_upx, outpath);
						*upx = atoi(use_upx);
						break;
					case 5 : 
						// lang(����ID)
						char langid[1024+1];memset( langid, '\0', sizeof(langid) );
						strcpy(langid, outpath);
						*lang = atoi(langid);
						break;
					case 6 : 
						// extension(�g���q)
						strcpy(extension, outpath);
						break;
					case 8 : 
						// manifest by Tetr@pod
						strcpy(manifestpath, outpath);
						break;
					default : 
						// ����ȊO�B�������Ȃ��B
						break;
				}
				// ���
				free(outpath);outpath = 0;flag2 = 0;

			}

		}

		// �K�����
		free(dummy);dummy = 0;
		free(buffer);buffer = 0;

		// 7 �̏ꍇ�������E
		if (flag2 == 7)
			break;
	} 
	return 0;
}

// �P�̂ݒu������
int StrReplace(char *buf, char *mae, char *ato)
{
    char *pos;
    size_t maelen, atolen;
    
    maelen = strlen(mae);
    atolen = strlen(ato);
    if (maelen == 0 || (pos = strstr(buf, mae)) == 0) return 0;
    memmove(pos + atolen, pos + maelen, strlen(buf) - (pos + maelen - buf ) + 1);
    memcpy(pos, ato, atolen);
    return 1;
}

// �Ώە���������ׂĒu������
int StrReplaceALL(char *buf, char *mae, char *ato)
{
	int i = 0;
	while (StrReplace(buf, mae, ato)){
		i++;
	}
	return i;
}

