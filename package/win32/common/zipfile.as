
#ifndef __zipfile__
#define __zipfile__

#ifdef __hsp64__
#uselib "ZLibWrap64.dll"
#else
#uselib "ZLibWrap.dll"
#endif
#module "__ZLibWrap"

//    "ZLibWrap.dll"
//    Copyright (C) Streamlet. All rights reserved.
//    File Name:   ZLibWrapLib.h
//    Author:      Streamlet
//    URL:         https://github.com/StreamletStudio/ZLibWrap
//    StreamletStudio/ZLibWrap is licensed under the MIT License
//
//------------------------------------------------------------------------------
// Description: Compress files to a ZIP file.
// Parameter: lpszSourceFiles Source files, supporting wildcards.
// Parameter: lpszDestFile The ZIP file path.
// Parameter: bUtf8 If using UTF-8 to encode the file name.
// Return Value: TRUE/FALSE.
//------------------------------------------------------------------------------
//BOOL ZipCompress(LPCTSTR lpszSourceFiles, LPCTSTR lpszDestFile, bool bUtf8 = false);
#func _ZipCompress "ZWZipCompress" wstr,wstr,int

//------------------------------------------------------------------------------
// Description: Extract files from a ZIP file.
// Parameter: lpszSourceFile Source ZIP file.
// Parameter: lpszDestFolder The folder to output files. The parent of the
//                           specified folder MUST exist.
// Return Value: TRUE/FALSE.
//------------------------------------------------------------------------------
//BOOL ZipExtract(LPCTSTR lpszSourceFile, LPCTSTR lpszDestFolder);
#func _ZipExtract "ZWZipExtract" wstr,wstr

#deffunc ZipCompress str _p1, str _p2

	;	zip���k
	;
	;	ZipCompress "���k�t�@�C�����̎w��", "�ۑ����zip�t�@�C����"
	;	(���k�t�@�C�����́A�u*.*�v�̂悤�ȃ��C���h�J�[�h���w��ł��܂�)
	;	stat�̒l��0�Ȃ�ΐ����A-1�Ȃ�΃G���[���Ԃ�܂�
	;
	_ZipCompress _p1, _p2, 0
	if stat=0 : return -1
	return 0

#deffunc ZipExtract str _p1, str _p2

	;	zip��
	;
	;	ZipExtract "�𓀂���zip�t�@�C����", "�𓀐�̃t�H���_�p�X"
	;	(���k�t�@�C�����́A�u*.*�v�̂悤�ȃ��C���h�J�[�h���w��ł��܂�)
	;	stat�̒l��0�Ȃ�ΐ����A-1�Ȃ�΃G���[���Ԃ�܂�
	;
	_ZipExtract _p1, _p2
	if stat=0 : return -1
	return 0


#global

#endif

