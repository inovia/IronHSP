/*------------------------------------------------------------------------------
	�F��`�ǉ� for HSP Script Editor by inovia
	�쐬 2011.12.20
	�C�� 2011.12.26
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

// PathIsDirectory�Ŏg�p
#include "shlwapi.h"
#pragma comment(lib, "shlwapi.lib")

#include "CustomColorKeywords.h"

#pragma warning( disable : 4996 )

extern BOOL bCustomColor;

extern BOOL CustomMatchCase;// by Tetr@pod


// classify.cpp	�� SetClassify()����Ăяo����܂�
void SetCumtomColorKeywords(int FootyID, MYCOLOR color)
{
	// �ݒ�t�@�C���Ŏg�p���Ȃ��ݒ�̏ꍇ�͐F�t�����Ȃ�
	if (bCustomColor == FALSE)
		return;
	// �F��`(�f�t�H�̐F)
	int FuncColor = RGB(  0, 255, 255);
	int OwnFuncColor = RGB(  0, 255, 255);
	int CFuncColor = RGB(  0, 255, 255);
	int OwnCFuncColor = RGB(  0, 255, 255);
	int Win32APIFuncColor = RGB(  0, 255, 255);
	int Win32APICFuncColor = RGB(  0, 255, 255);
	int MacroColor = RGB(192, 255, 255);
	int SysVarColor = RGB(  0, 255, 255);
	/*int FuncParam = EMP_IND_BLANKS;
	int CFuncParam = EMP_IND_BLANKS | EMP_IND_PARENTHESIS; 
	int VarParam = EMP_IND_BLANKS | EMP_IND_PARENTHESIS | EMP_IND_OTHER_ASCII_SIGN;*/
	// �召��r�L���AOR�L���A���Z�q�Aif��{}�A���Z�q��() �Ȃǂ����� by Tetr@pod
	int FuncParam = EMP_IND_BLANKS | EMP_IND_BRACE | EMP_IND_OPERATORS | EMP_IND_OTHER_ASCII_SIGN | EMP_IND_ANGLE_BRACKET | EMP_IND_PARENTHESIS;
	int CFuncParam = EMP_IND_BLANKS | EMP_IND_PARENTHESIS | EMP_IND_BRACE | EMP_IND_OPERATORS | EMP_IND_OTHER_ASCII_SIGN | EMP_IND_ANGLE_BRACKET; 
	int VarParam = EMP_IND_BLANKS | EMP_IND_PARENTHESIS | EMP_IND_OTHER_ASCII_SIGN | EMP_IND_BRACE | EMP_IND_OPERATORS | EMP_IND_ANGLE_BRACKET;

	// �G�f�B�^����ݒ�ǂݏo��
	FuncColor = color.Character.Function.Conf;
	CFuncColor = color.Character.Function.Conf;
	OwnFuncColor = color.Character.Function.Conf;
	OwnCFuncColor = color.Character.Function.Conf;
	Win32APIFuncColor = color.Character.Function.Conf;
	Win32APICFuncColor = color.Character.Function.Conf;
	SysVarColor = color.Character.Function.Conf;
	MacroColor = color.Character.Macro.Conf;

	// EXE�̂���f�B���N�g��
	char exepath[MAX_PATH+1];
	GetModuleFileNameA(0, exepath, MAX_PATH);
	PathRemoveFileSpec(exepath);

	// �J�X�^���F��`�t�@�C���ǂݍ���
	char cumtompath[MAX_PATH+1];
	strcpy(cumtompath, exepath);
	strcat(cumtompath, "\\keywords\\color.ini");

	FILE *fpini = fopen(cumtompath,"r");
	if (fpini != NULL){
		char tmp[1024+1];
		while ((fgets(tmp, 1024, fpini)) != NULL) {
			// ���s�R�[�h�������ꍇ
			if (tmp[strlen(tmp)-1] == 0x0A){
				tmp[strlen(tmp)-1] = '\0';	// �]�v�ȉ��s�R�[�h��NULL�Ŗ��߂č폜
			}
			// ���������Q�̏ꍇ
			if (GetSplitNum(tmp, " ") == 2){
				char* p = (char*)calloc(1024+1, sizeof(char));
				char* c = (char*)calloc(1024+1, sizeof(char));
				GetSplitString(tmp, " ", 0, p); // �X�y�[�X�ŕ������ĂO�Ԗڂ̗v�f���擾
				GetSplitString(tmp, " ", 1, c);	// �X�y�[�X�ŕ������ĂP�Ԗڂ̗v�f���擾
				// �L�[���[�h�`�F�b�N
				if (strcmp(p,"FUNC") == 0){
					FuncColor = atoi(c);
				}else if(strcmp(p,"OWNFUNC") == 0){
					OwnFuncColor = atoi(c);
				}else if (strcmp(p,"CFUNC") == 0){
					CFuncColor = atoi(c);
				}else if(strcmp(p,"OWNCFUNC") == 0){
					OwnCFuncColor = atoi(c);
				}else if(strcmp(p,"MACRO") == 0){
					MacroColor = atoi(c);
				}else if(strcmp(p,"SYSVAR") == 0){
					SysVarColor = atoi(c);
				}else if((strcmp(p,"W32APIFUNC") == 0) || (strcmp(p,"WIN32APIFUNC") == 0)){
					Win32APIFuncColor = atoi(c);
				}else if((strcmp(p,"W32APICFUNC") == 0) || (strcmp(p,"WIN32APICFUNC") == 0)){
					Win32APICFuncColor = atoi(c);
				}
				free(p);
				free(c);
			}
		}
		fclose(fpini);
	}


	// �L�[���[�h�t�H���_���`�F�b�N
	char crDir[MAX_PATH + 1];
	//GetCurrentDirectoryA(MAX_PATH+1, crDir);
	//strcat(crDir, "\\keywords\\");
	strcpy(crDir, exepath);
	strcat(crDir, "\\keywords\\");

	// �L�[���[�h�t�H���_�����݂��Ă��邩�ǂ���
	if (PathIsDirectoryA(crDir)){
		// ����ꍇ(�Ō��\\�����Ă��邱��)
		// �t�H���_���̃t�@�C���̐����擾
		int fnum = GetFileListNum(crDir);
		// (MAX_PATH�{2)�~fnum bytes���̗̈���m��(���s�R�[�h���܂�)
		char* flist = (char*)calloc(fnum*(MAX_PATH+2)+1,sizeof(char));
		// �t�@�C���̈ꗗ���擾(\n�ŕ�����ꂽ�`��)
		GetFileList(crDir, flist);
		// �t�@�C���̐������J��Ԃ�
		int i = 0;
		for(i = 0; i<GetSplitNum(flist, "\n"); i++){
			// �t�@�C�������i�[����ϐ����m��
			char* fname = (char*)calloc(MAX_PATH+1, sizeof(char));
			strcpy(fname, exepath);
			strcat(fname, "\\keywords\\");// �t�H���_�����ɕt��
			// �t�@�C�������擾����
			GetSplitString(flist, "\n", i, fname);
			// �t�@�C�����I�[�v������
			FILE *fp = fopen(fname,"r");
			if (fp != NULL){
				// 1�s���̃f�[�^�ۑ��p�i����Ȃɂ���Ȃ��Ǝv�����ǁj
				char* line = (char*)calloc(1024+1, sizeof(char));
				// 1�s���ǂݎ��
				while ((fgets(line, 1024, fp)) != NULL) {
					// ���s�R�[�h�������ꍇ
					if (line[strlen(line)-1] == 0x0A){
						line[strlen(line)-1] = '\0';	// �]�v�ȉ��s�R�[�h�폜
					}
					// ���������R�̏ꍇ�͏�������
					if (GetSplitNum(line, " ") == 3){
						int footy2col = 0;
						int footy2flg = 0;
						char* param = (char*)calloc(1024+1, sizeof(char));
						char* flg = (char*)calloc(1024+1, sizeof(char));
						char* col = (char*)calloc(1024+1, sizeof(char));

						GetSplitString(line, " ", 0, param);
						GetSplitString(line, " ", 1, flg);
						GetSplitString(line, " ", 2, col);

						// �F�̃L�[���[�h�`�F�b�N
						if (strcmp(col,"FUNC") == 0){
							footy2col = FuncColor;
						}else if(strcmp(col,"OWNFUNC") == 0){
							footy2col = OwnFuncColor;
						}else if (strcmp(col,"CFUNC") == 0){
							footy2col = CFuncColor;
						}else if(strcmp(col,"OWNCFUNC") == 0){
							footy2col = OwnCFuncColor;
						}else if(strcmp(col,"MACRO") == 0){
							footy2col = MacroColor;
						}else if(strcmp(col,"SYSVAR") == 0){
							footy2col = SysVarColor;
						}else if((strcmp(col,"W32APIFUNC") == 0) || (strcmp(col,"WIN32APIFUNC") == 0)){
							footy2col = Win32APIFuncColor;
						}else if((strcmp(col,"W32APICFUNC") == 0) || (strcmp(col,"WIN32APICFUNC") == 0)){
							footy2col = Win32APICFuncColor;
						}else{
							// ����ȊO�̏ꍇ�͐��l�Ƃ݂Ȃ��B
							int customcolor = atoi(col);
							footy2col = customcolor;
						}
						// �Ɨ����̐ݒ�
						if (strcmp(flg,"FUNC") == 0){
							footy2flg = FuncParam;
						}else if(strcmp(flg,"OWNFUNC") == 0){
							footy2flg = FuncParam;
						}else if (strcmp(flg,"CFUNC") == 0){
							footy2flg = CFuncParam;
						}else if(strcmp(flg,"OWNCFUNC") == 0){
							footy2flg = CFuncParam;
						}else if(strcmp(flg,"MACRO") == 0){
							footy2flg = VarParam;
						}else if((strcmp(flg,"W32APIFUNC") == 0) || (strcmp(flg,"WIN32APIFUNC") == 0)){
							footy2flg = FuncParam;
						}else if((strcmp(flg,"W32APICFUNC") == 0) || (strcmp(flg,"WIN32APICFUNC") == 0)){
							footy2flg = CFuncParam;
						}else if(strcmp(flg,"SYSVAR") == 0){
							footy2flg = VarParam;
						}else{
							// ����ȊO�̏ꍇ�͐��l�Ƃ݂Ȃ��B
							footy2flg = atoi(flg);
						}
						// Footy2���ɓK�p
						
						if (CustomMatchCase) {// by Tetr@pod
							int res= Footy2AddEmphasis(FootyID, param, 0, EMP_WORD, 0, 1, 1, footy2flg, footy2col);
						} else {
							int res= Footy2AddEmphasis(FootyID, param, 0, EMP_WORD, 2, 1, 1, footy2flg, footy2col);
						}

						free(param);
						free(flg);
						free(col);
					}
				}
				// 1�s���i�[�����ϐ������
				free(line);
				// �t�@�C�����N���[�Y
				fclose(fp);
			}
			// �t�@�C�������i�[�����ϐ������
			free(fname);
		}
		
		// ���
		free(flist);
		flist = NULL;

	}else{
		// �t�H���_���Ȃ�
		//MessageBoxA(0, "�Ȃ�", "�Ȃ�", 0);
	}

}

// �����I�Ɏg�p���Ă���֐�

// �߂�l�̓e�L�X�g�t�@�C���̐�
int GetFileListNum(char *folder){
	// 1��ڂ̓f�[�^�̃T�C�Y���擾���邽��
	char temp[_MAX_PATH];
	WIN32_FIND_DATAA lp;
	HANDLE hFile;

	// �p�X�̃R�s�[��*.txt�̕t��
	strcpy(temp, folder);
	strcat(temp, "*.txt");
	// ��������
	hFile = FindFirstFileA(temp, &lp);

	if (hFile == INVALID_HANDLE_VALUE) {
		return 0;
	}

	int num = 0;
	do{      
		if((lp.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)!=FILE_ATTRIBUTE_DIRECTORY){
			num++;
		}
	}while(FindNextFileA(hFile, &lp));
	// �N���[�Y
	FindClose(hFile);

	return num;
}

// �߂�l�̓e�L�X�g�t�@�C���̐�
int GetFileList(char *folder,char *flist){
	// 2��ڂ̓f�[�^���擾���邽��
	char temp[_MAX_PATH];
	WIN32_FIND_DATAA lp;
	HANDLE hFile;

	// �p�X�̃R�s�[��*.txt�̕t��
	strcpy(temp, folder);
	strcat(temp, "*.txt");
	// ��������
	hFile = FindFirstFileA(temp, &lp);

	if (hFile == INVALID_HANDLE_VALUE) {
		return 0;
	}

	int num = 0;
	do{      
		if((lp.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)!=FILE_ATTRIBUTE_DIRECTORY){
			strcat(flist, lp.cFileName);
			strcat(flist, "\n");
			num++;
		}
	}while(FindNextFileA(hFile, &lp));
	// �N���[�Y
	FindClose(hFile);

	// �Ō��\n���폜
	flist[strlen(flist)-1] = '\0';

	return num;
}

// ��؂�ꂽ�����擾
int GetSplitNum(char *_s1,const char *s2){
	char *tok;
	int num = 0;

	// �R�s�[���Ďg�p���邽�ߊm��(���Ȃ炸+1����)
	char* s1 = (char*)calloc(strlen(_s1)+1,sizeof(char));
	strcpy(s1, _s1);

	tok = strtok( s1, s2 );
	while( tok != NULL ){
		num++;
		tok = strtok( NULL, s2 );  /* 2��ڈȍ~ */
	}
	
	free(s1);
	return num;
}

// �w�肳�ꂽ�s�̕�������擾
int GetSplitString(char *_s1, const char *s2, int num, char *res){

	char *tok;

	// �R�s�[���Ďg�p���邽�ߊm��(���Ȃ炸+1����)
	char* s1 = (char*)calloc(strlen(_s1)+1,sizeof(char));
	strcpy(s1, _s1);

	int i = 0;
	tok = strtok( s1, s2 );
	while( tok != NULL ){
		if (num == i){
			strcat(res, tok);
			free(s1);	// ����Y��Ă��̂Œǉ�
			return 1;
		}
		i++;
		tok = strtok( NULL, s2 );  /* 2��ڈȍ~ */
	}
	
	free(s1);
	return 0;
}