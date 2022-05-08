/**
 * @file FootyLine.cpp
 * @brief CFootyLine�̎������s���܂��B
 * @author Shinji Watanabe
 * @date Oct.30.2008
 */

#include "FootyLine.h"

#define USERFUNC_BUFFERSIZE 512// ���[�U�[��`���߁E�֐�������o�b�t�@�̃T�C�Y(������)

wchar_t *funclist;// ���߁E�֐��̃��X�g by Tetr@pod
int *kindlist;// ���̎�� by Tetr@pod
int funcnum;// ���̐� by Tetr@pod
bool defined_funclist = false;// �ƁA���ꂪ�m�ۂ��ꂽ�� by Tetr@podc
bool DrawAllUserFuncs = false;// ���ׂĂ̍s��`�悷��H by Tetr@pod
bool IsUFUpdateTiming = true;// �X�V���ׂ������H by Tetr@pod

//-----------------------------------------------------------------------------
/**
 * @brief �R���X�g���N�^�ł��B�ŏ��̍s���\�z���܂��B
 */
CFootyLine::CFootyLine()
{
	m_nEthicLine = 1;
	m_nLineOffset = 0;
	m_nRealLineNum = 0;
	m_bEmphasisChached = false;
	m_nLineIcons = 0;
}

//-----------------------------------------------------------------------------
/**
 * @brief �O�̍s�̃I�t�Z�b�g�l�Ɨϗ��s�������ɂ��̃I�t�Z�b�g�l��ݒ肵�܂��B
 * @param pPrevLine �O�̍s�ւ̃C�e���[�^
 * @return �������O��ƕς���Ă����true���Ԃ�
 */
bool CFootyLine::SetPrevLineInfo(LinePt pPrevLine)
{
	// �o�b�N�A�b�v
	size_t nOffsetBefore = m_nLineOffset;
	size_t nRealBefore = m_nRealLineNum;

	// �s�ԍ��f�[�^���v�Z
	m_nLineOffset = pPrevLine->m_nLineOffset + pPrevLine->m_nEthicLine;
	m_nRealLineNum = pPrevLine->m_nRealLineNum + 1;

	// �O�̂ƈꏏ���ǂ����`�F�b�N����
	return  m_nLineOffset != nOffsetBefore || m_nRealLineNum != nRealBefore;
}

//-----------------------------------------------------------------------------
/**
 * @brief �s�̃f�[�^���t���b�V�����Ċe��v�Z���s���܂��B
 * @param nTabLen �^�u��
 * @param nColumn �܂�Ԃ���
 * @param nMode �܂�Ԃ����[�h
 * @return �_���s�����ύX���ꂽ�ꍇtrue���Ԃ�
 * @note �f�[�^��ύX������Ō�ɂ��̏������Ăяo���K�v������܂��B
 */
bool CFootyLine::FlushString(int m_nFootyID, size_t nTabLen,size_t nColumn,int nMode, bool *NeedRedrawAll, bool ForceListUpdate/*���s���܂ނ� by Tetr@pod*/)
{
	// �錾
	CUrlInfo stInsert;

	// �_���s���̏����X�V����
	size_t nBeforeEthicLine = m_nEthicLine;
	m_nEthicLine = CalcEthicLine(GetLineLength(),nColumn,nTabLen,nMode).m_nEthicLine + 1;

	// if (!DrawAllUserFuncs) {
		// �ړI�̓��[�U�[��`���߁E�֐������Ȃ̂����ǁA�Ȃ��ƕ`�悳��Ȃ��B
		// �o�b�N�A�b�v���쐬���Ă�������ǂނ̂Ƃǂ����������������낤���B
		
		// �N���b�J�u��URL�̌���
		stInsert.m_nEndPos = -1;
		m_vecUrlInfo.clear();
		forever{
			if (!FindURL(stInsert.m_nEndPos + 1,
				&stInsert.m_nStartPos,&stInsert.m_nEndPos))break;
			m_vecUrlInfo.push_back(stInsert);
		}

		// �N���b�J�u�����[���A�h���X�̌���
		stInsert.m_nEndPos = -1;
		m_vecMailInfo.clear();
		forever{
			if (!FindMail(stInsert.m_nEndPos + 1,
				&stInsert.m_nStartPos,&stInsert.m_nEndPos))break;
			m_vecMailInfo.push_back(stInsert);
		}

		// �N���b�J�u�����x���̌��� by Tetr@pod
		// �{���̓R�[���o�b�N�Ƃ����낢�����āAFooty2���̂ɂ͔ėp����
		// ��������悤�ɂ������������񂾂낤���ǁA�����񂹂�Z�ʂ��c
		// �����ł��A�ėp�����Ȃ��̂̓N���b�J�u�����x���ƃ��[�U�[��`���߁E�֐��̏��������Ȃ̂ŁA
		// �C������ۂ͂�����Ɗy�����B
		// �C������Ƃ��́A(������������Ȃ�)���̂Ƃ���̃O���[�o���ϐ��Ƃ����Y�ꂸ�ɒ����Ă��������B
		stInsert.m_nEndPos = -1;
		m_vecLabelInfo.clear();
		if (UseClickableLabel) {
			FOOTY2_PRINTF(L"�N���b�J�u�����x���̌���\n");
			forever{
				if (!FindLabel(stInsert.m_nEndPos + 1,
					&stInsert.m_nStartPos,&stInsert.m_nEndPos))break;
				m_vecLabelInfo.push_back(stInsert);
			}
		}
	// }


	// ���[�U�[��`���߁E�֐��̌���(��N���b�J�u��) by Tetr@pod
	// �����ł���Ă�̂́AFooty2AddEmphasis���R�[�h�������̂��y�����ŏ������x��������������B
	// (Footy2AddEmphasis���ƁA���߁E�֐������ύX���ꂽ���̏������ʓ|���������A���߁E�֐������������Ƃ����ʓ|��������)
	// ���ƁA���������������B�v�������B���ꂩ����āB���������B
	// �{���̓R�[���o�b�N�Ƃ����낢�����āAFooty2���̂ɂ͔ėp����
	// ��������悤�ɂ������������񂾂낤���ǁA�����񂹂�Z�ʂ��c
	// �����ł��A�ėp�����Ȃ��̂̓N���b�J�u�����x���ƃ��[�U�[��`���߁E�֐��̏��������Ȃ̂ŁA
	// �C������ۂ͂�����Ɗy�����B
	// �C������Ƃ��́A(������������Ȃ�)���̂Ƃ���̃O���[�o���ϐ��Ƃ����Y�ꂸ�ɒ����Ă��������B

	m_vecFuncInfo.clear();// �������B������Ȃ������ł��ׂ�
	stInsert.m_nEndPos = -1;
	if (UseSearchFunction && ( IsUFUpdateTiming || DrawAllUserFuncs )) {
		// �������ɏ������s��Ȃ�(�������̂���)
		if (!DrawAllUserFuncs) {
			IsUFUpdateTiming = false;
		}

		FOOTY2_PRINTF(L"���[�U�[��`���߁E�֐��̌���\n");
		
		int len;

		len = Footy2GetTextLengthW(m_nFootyID, LM_CRLF);
		if(len > 5){// �ł��Z�����߁E�֐���`�v���v���Z�b�T��"#CMD "��
					// �X�y�[�X�܂߂�5�����A
					// �Ƃ������Ƃ͖��߁E�֐��̒�`�ɂ͍Œ�6�����K�v
					// �Ȃ̂ő�������5�����ȉ��Ȃ珈�����΂�

			// ���߁E�֐���`�v���v���Z�b�T�̃��X�g
			// ����ǉ����ꂽ��Ȃ񂾂肵����A������ɒǉ�����B
			// #define�͍Ō�ɂ��邱��
			static const wchar_t * func_define_pp[] = {
				L"deffunc", L"defcfunc",
				L"modinit", L"modterm",
				L"modfunc", L"modcfunc",
				L"func", L"cfunc",
				L"cmd",
				L"comfunc",
				L"define",// �K���Ō�ɏ���
			};
			static const int colorkind[] = {// �F�̎��(�ݒ�E�B���h�E�̃A�C�e�����X�g�ƑΉ����Ă��܂�)
				0, 0, 
				1, 1, 
				2, 2, 
				3, 3, 
				4, 
				5, 
				6, // #define�A����ctype�̊֌W�ŁA�Ō�ɏ���
				7, // #define ctype
			};
			static const bool pp_isfunction[] = {// ���߂��֐����B�킩��Ȃ����true��OK�B(true�Ŋ֐�)
				false, true, 
				false, false, 
				false, true, 
				false, true, 
				false, 
				false, 
				false, // #define�A����ctype�̊֌W�ŁA�Ō�ɏ���
				true, // #define ctype
			};

			bool PreprocessorFound = false;// �L�����b�g�̂���s�Ƀv���v���Z�b�T������������
			// �����L�����b�g�̂���s�Ƀv���v���Z�b�T������������A
			// �������߁E�֐������ނ��ς���Ă��邾�낤�ƌ��߂��āA
			// ���߁E�֐����̃��X�g���X�V����
			// (�����ƍX�V���ꂽ���m�F����ƁA2�{���炢�̎��Ԃ�������H)

			if (!DrawAllUserFuncs) {
				if (defined_funclist && !ForceListUpdate) {// ��`�ς݂ŋ������X�g�X�V�t���O�������Ă��Ȃ��Ȃ�
					size_t CaretLine = 0;
					if (Footy2GetCaretPosition(m_nFootyID, &CaretLine, NULL) == FOOTY2ERR_NONE) {// �L�����b�g�̂���s���擾
						wchar_t *CaretLineData = (wchar_t *)Footy2GetLineW(m_nFootyID, CaretLine);// ���̍s�̓��e���擾
						if (CaretLineData != NULL) {// �擾�ł�����
							const wchar_t *PreprocessorPosition = wcschr(CaretLineData, L'#');// #��T��
							if (PreprocessorPosition != NULL) {// ����������
								for (; L'\t' == *PreprocessorPosition || L' ' == *PreprocessorPosition; PreprocessorPosition++);// �܂��󔒂�ǂݔ�΂�

								for(int i = 0; i < sizeof(func_define_pp)/sizeof(func_define_pp[0]); i++) {// �����Ĉ�v����v���v���Z�b�T�����邩�T��
									if (!ChangeColor_func && ( i == 6 || i == 7 || i == 8 ))// #func�A#cfunc�A#cmd ��F�������Ȃ��ݒ�̏ꍇ
										continue;
									if (!ChangeColor_define && i == 10)// #define�A#define ctype ��F�������Ȃ��ݒ�̏ꍇ
										continue;
									if (wcslen(PreprocessorPosition) >= wcslen(func_define_pp[i])) {// �v���v���Z�b�T�ȏ�̒����Ȃ��r����
										if (wcsncmp(PreprocessorPosition + 1, func_define_pp[i], wcslen(func_define_pp[i])) == 0) {// �v���v���Z�b�T�̒�������r���āA��v���Ă�Ȃ�
											if (
												*(PreprocessorPosition + wcslen(func_define_pp[i]) + 1) == L'\t' ||// �����ăv���v���Z�b�T�̒��オ�^�u��
												*(PreprocessorPosition + wcslen(func_define_pp[i]) + 1) == L' '// �X�y�[�X�Ȃ�
												) {
													PreprocessorFound = true;// �v���v���Z�b�T�����I
													break;// ����ȏ����Ă����ʂȂ̂Ŕ�����
											}
										}
									}
								}
							}
						}
					}
				}
				else {// ���񂩋������X�g�X�V�t���O�������Ă���Ȃ�
					PreprocessorFound = true;// �������ă��X�g���쐬����
				}

				if (PreprocessorFound) {// ���������疽�߁E�֐����X�g�X�V
					// ���߁E�֐��T��
					FOOTY2_PRINTF(L"���߁E�֐��̃��X�g�A�b�v\n");
					// ���X�̖��߁E�֐����X�g�����
					if (defined_funclist) {// ��`�ς݂Ȃ�
						defined_funclist = false;// �Ƃ肠�����t���O�����낵��

						// ���
						free(funclist);
						free(kindlist);
					}

					// ���X�g�A�b�v
					// �錾
					wchar_t lname[USERFUNC_BUFFERSIZE];
					wchar_t *buffer;
					wchar_t *wp;
					// wchar_t *funclist;// �O���[�o����(�������̂���)
					// int *kindlist;// �O���[�o����(�������̂���)
					int line;

					funcnum = 0;

					buffer = (wchar_t *) calloc( len + 2 /* ������I�[�Ɣԕ� */, sizeof(wchar_t) );
					Footy2GetTextW(m_nFootyID, buffer, LM_CRLF, len + 1);

					for (int getmode=0; getmode<2; getmode++) {
						int nowindex = 0;
						line = 1;
						wp = buffer;
						for (; *wp; line++, wp++) {
							// 1�s�ǂݍ���
							for(; *wp && 0x0d != *wp; wp++) {
								// �擪�̋󔒂𖳎�
								if( L' ' == *wp || L'\t' == *wp ) {
									continue;
								}
								// �v���v���Z�b�T�ǂݔ�΂�
								if( L'#' == *wp ) {
									int namelen = 0;
									do {
										for(wp++; *wp && 0x0d != *wp ; wp++) {
											if( (0 < namelen || (L' ' != *wp && L'\t' != *wp)) &&
												(L'\\' != *wp || (0x0a != wp[1] && 0x0d != wp[1])) &&
												0x0a != *wp && 0x0d != *wp &&
												namelen < sizeof(lname)/sizeof(lname[0]) - 1 ) {
												lname[namelen++] = *wp;
											}
										}
										line++;
									} while ( L'\\' == *(wp - 1) && *wp );
									line--;
									lname[namelen] = L'\0';
									//
									for(int i = 0; i < sizeof(func_define_pp)/sizeof(func_define_pp[0]); i++) {
										if (!ChangeColor_func && ( i == 6 || i == 7 || i == 8 ))// #func�A#cfunc�A#cmd ��F�������Ȃ��ݒ�̏ꍇ
											continue;
										if (!ChangeColor_define && i == 10)// #define�A#define ctype ��F�������Ȃ��ݒ�̏ꍇ
											continue;

										int comp_len = min((int)wcslen(func_define_pp[i]), namelen);
										if( !wcsncmp(lname, func_define_pp[i], comp_len) ) {
											wchar_t *pa, *pb;
											pb = lname + comp_len;
											int kind = i;
											do {
												pa = pb;
												for(; L'\t' == *pa || L' ' == *pa; pa++, pb++);	// '#'�̒���̋󔒂��X�L�b�v
												for(; L'\t' != *pb && L' ' != *pb && L',' != *pb && L'(' != *pb && L'@' != *pb && L'-' != *pb && L'*' != *pb && L'/' != *pb && L'\\' != *pb && L'^' != *pb && L'&' != *pb && L'|' != *pb && L';' != *pb && *pb; pb++);	// �󔒂܂ł��擾 @�A(�A-�A+�A*�A/�A\\�A^�A&�A|�A;��ǉ� by Tetr@pod
												namelen = (int)(pb - pa);
												if( sizeof(lname) <= (int)(pa - lname) + namelen ) { DebugBreak(); }
												wcsncpy(lname, pa, namelen);
												/*memcpy(lname, pa, namelen * sizeof(wchar_t));*/
												lname[namelen] = L'\0';
												
												if (i == sizeof(func_define_pp)/sizeof(func_define_pp[0])-1 && _wcsicmp(lname, L"ctype") == 0 ) {// #define ctype�Ȃ�
													kind = sizeof(func_define_pp)/sizeof(func_define_pp[0]);
												}
											} while( (
												!_wcsicmp(lname, L"local") || 
												( i == sizeof(func_define_pp)/sizeof(func_define_pp[0])-1 && ( _wcsicmp(lname, L"ctype") == 0 || _wcsicmp(lname, L"global") == 0 ) )// #define �� ctype�Aglobal �͔�΂�
												) );
											//
											if( *lname ) {
												// realloc���g�p���Ȃ��悤�ɂ��邽�߂����Ȃ��Ă��܂�
												// �����������̗]�n������̂ŁA�N���C�����Ă�����������
												if (getmode == 0) {// �ŏ��̓J�E���g�A�b�v����
													funcnum++;
												}
												else {// ���ڂ͎��ۂɎ擾����
													wcscpy(funclist + nowindex * USERFUNC_BUFFERSIZE, lname);// ���߁E�֐������R�s�[
													kindlist[nowindex] = kind;// ��ށB�F�ł͂Ȃ�
													nowindex++;
												}
											}
											break;
										}
									}
									break;
								}
								// �R�����g�ǂݔ�΂�
								if( L';' == *wp || (L'/' == *wp && L'/' == wp[1]) ) {// ;�܂���//�ł͂��܂�R�����g
									// �s���܂œǂݔ�΂�
									for(wp++; *wp && 0x0d != *wp ; wp++);
									break;
								}
								if( L'/' == *wp && L'*' == wp[1] ) {//  / *�ł͂��܂�R�����g
									for(wp++; *wp ; wp++) {
										if( L'*' == *wp && L'/' == wp[1] ) {
											wp++;
											break;
										}
										if( 0x0d == *wp ) {
											line++;
										}
									}
									continue;
								}
								// ���̃X�e�[�g�����g�܂œǂݔ�΂�
								for(bool bEscape = false;
									*wp && 0x0d != *wp && L':' != *wp &&
									L';' != *wp && (L'/' != *wp || L'*' != wp[1]) && (L'/' != *wp || L'/' != wp[1]); wp++)
								{
									if( L'\"' == *wp && !bEscape ) {
										bool bDameChk = false;
										// ������ǂݔ�΂�
										if( L'{' == *(wp - 1) ) { // �����s������
											wp += 2;
											for(bool bEscape = false; *wp && (L'\"' != *wp || L'}' != wp[1] || bEscape); ) {
												if( L'\\' == *wp ) {
													bEscape = !bEscape;
												}
												wp++;
											}
										} else {
											wp++;
											for(bool bEscape = false; *wp && (L'\"' != *wp || bEscape) && 0x0d != *wp; ) {
												if( L'\\' == *wp ) {
													bEscape = !bEscape;
												}
												wp++;
											}
										}
										wp--;
										continue;
									}
								}
								if( 0x0d == *wp ) {
									break;
								}
								if( L':' != *wp ) {
									wp--;
								}
							}
							if( 0x0d == *wp && 0x0a == wp[1] ) {
								wp++;
							}
						}// ���ʂ̊O�c for (; *wp; line++, wp++)
						if (funcnum < 1) {
							break;
						}
						if (getmode == 0) {
							// �m��
							funclist = (wchar_t *)malloc(funcnum * sizeof(lname) + 4);// �O�̂���+4
							kindlist = (int *)malloc(funcnum * sizeof(int));

							// ���s���ĂȂ����m�F
							if (funclist == NULL || kindlist == NULL) {// �ǂ��炩�����������s
								if (funclist != NULL) {
									free(funclist);
									funclist = NULL;
								}
								if (kindlist != NULL) {// �����Ə������ƁA���蓾�邩��
									free(kindlist);
									kindlist = NULL;
								}

								funcnum = 0;// �������邱�ƂŁA���̏����ɐi�܂Ȃ�
								break;
							}
							else {
								defined_funclist = true;// �m�ۂ����̂Ńt���O�𗧂Ă�
							}

							// 0�t�B��
							// ����ϗv��Ȃ�
							/*memset(funclist, 0, sizeof(funclist));
							memset(kindlist, 0, sizeof(kindlist));*/
						}
					}// ���ʂ̊O�c for (int getmode=0; getmode<2; getmode++)

					// �����g��Ȃ��̂ŉ��
					free(buffer);


					if (funcnum > 0) {// ���߁E�֐�����������
						// �ēo�^
						// �S�폜�͂��łɂ���Ă���̂ŏ����Ȃ���OK
						DrawAllUserFuncs = true;// �t���O�𗧂Ă�

						// ���̊֐����甲�����Ƃ���ł���Ă��炨��
						//   ��CFootyView::Refresh�̂Ƃ���ł���Ă��炢�܂���
						/*// ���ׂĂ̍s��
						for (LinePt Line = GetFooty(m_nFootyID)->m_cDoc.GetTopLine(); Line != GetFooty(m_nFootyID)->m_cDoc.GetLastLine(); Line++) {
							GetFooty(m_nFootyID)->m_cDoc.SetLineInfo2(Line);// �o�^����
							// Line->GetEthicLine();// �Ȃ��Ă������݂���
						}
						DrawAllUserFuncs = false;// �����ăt���O�����낷*/

						// �S�čĕ`��̃t���O�𗧂ĂĂ���
						if (NeedRedrawAll) {
							*NeedRedrawAll = true;
						}
					}
				}// ���ʂ̊O�c if (PreprocessorFound)
			}// ���ʂ̊O�c if (DrawAllUserFuncs)

			if (!PreprocessorFound && funcnum > 0) {// DrawAllUserFuncs�̃t���O�S���̂��͖̂Ə�
				FOOTY2_PRINTF(L"���߁E�֐��̌����E�o�^\n");

				bool IsFirst2 = false;
				for (int i=0; i<funcnum; i++) {
					bool IsFirst;
					stInsert.m_nEndPos = -1;
					forever{
						bool bIsFunction = pp_isfunction[kindlist[i]];// ����͊֐���
						if (!FindFunc(stInsert.m_nEndPos + 1,
							&stInsert.m_nStartPos, &stInsert.m_nEndPos, funclist + i * USERFUNC_BUFFERSIZE, bIsFunction, CustomMatchCase))break;
						// �����ɗ���񐔂��ςȂ�A�����Ŏ��s���Ă���\��������B
						// �񐔂�����ŕ`�悪�ςȂ�AstInsert�l���ςɂȂ��Ă���\��������B
						stInsert.m_nKind = colorkind[kindlist[i]];
						if (!IsFirst2) {
							m_vecFuncInfo.push_back(stInsert);// �ŏ��̊֐��Ȃ�擪�����OK(����͕̂K�������̂��̂�����)
							IsFirst = true;
						}
						else {
							UrlIterator itFuncInfo;
							for(itFuncInfo = m_vecFuncInfo.begin(); itFuncInfo != m_vecFuncInfo.end(); ++itFuncInfo) {
								if ((*itFuncInfo).m_nStartPos > stInsert.m_nStartPos) {
									break;
								}
							}
							m_vecFuncInfo.insert(itFuncInfo, stInsert);// ���ڈȍ~�͐���������(����)�ɂȂ�悤�ɓ����K�v������
						}
					}
					IsFirst2 = IsFirst;
				}
			}
		}// ���ʂ̊O�c if (len > 5)
		else {
			funcnum = 0;
		}

		if (!DrawAllUserFuncs) {
			IsUFUpdateTiming = true;// �������ȊO�̂Ƃ��͏���OK�i�������̂��߁j
		}
	}// ���ʂ̊O�c if (UseSearchFunction && ( IsUFUpdateTiming || DrawAllUserFuncs ))

	return m_nEthicLine != nBeforeEthicLine;
}


//-----------------------------------------------------------------------------
/**
 * @brief nPos�̈ʒu���ǂ���ӂɂ��邩�v�Z���郋�[�`���ł��B
 */
CFootyLine::EthicInfo CFootyLine::CalcEthicLine(size_t nPos,size_t nColumn,size_t nTab,int nMode) const
{
	// �錾
	const wchar_t *pWork = GetLineData();
	EthicInfo stRet;
	// ������
	stRet.m_nEthicLine = 0;
	stRet.m_nEthicColumn = 0;
	// �����񑖍�
	for (size_t i=0;i<nPos;i++,pWork++)
	{
		// �^�u
		if (*pWork == L'\t')
		{
			for (stRet.m_nEthicColumn++;;stRet.m_nEthicColumn++)
			{
				if (stRet.m_nEthicColumn % nTab == 0)break;
			}
		}
		else
		{
			// ����{���ǂ������肷��
			bool bIsDualWidth = false;
			if (IsSurrogateLead(*pWork))	// �T���Q�[�g�y�A�̂P�o�C�g��
			{
				bIsDualWidth = IsDualChar(*pWork,*(pWork+1));
				pWork++;i++;
			}
			else							// �T���Q�[�g�y�A�ł͂Ȃ��Ƃ�
			{
				bIsDualWidth = IsDualChar(*pWork);
			}
			// �ʒu�����炷
			if (bIsDualWidth)stRet.m_nEthicColumn += 2;
			else stRet.m_nEthicColumn ++;
		}
		// ���̕����֍s���܂��H
		if (IsGoNext(pWork,i,stRet.m_nEthicColumn,nColumn,nMode))
		{
			stRet.m_nEthicColumn = 0;
			stRet.m_nEthicLine ++ ;
		}
	}
	// �l��Ԃ�
	return stRet;
}

//-----------------------------------------------------------------------------
/**
 * @brief �ϗ��s������ۂ̌������v�Z���郋�[�`���ł��B
 * @note nEthicLine��nEthicPos��0�x�[�X�œn���܂��B
 */
size_t CFootyLine::CalcRealPosition(size_t nEthicLine,size_t nEthicPos, size_t nColumn,size_t nTab,int nMode) const
{
	// �錾
	const wchar_t *pWork = GetLineData();
	size_t nLineLength = GetLineLength();
	size_t nVisPosition = 0;
	size_t nNowEthic = 0;
	size_t i;
	// �����񑖍�
	for (i=0;i<nLineLength;i++,pWork++)
	{
		// �K�����邩(�I���H)
		if (nNowEthic == nEthicLine)
		{
			if (nVisPosition >= nEthicPos)break;
		}
		// �^�u
		if (*pWork == L'\t')
		{
			for (nVisPosition++;;nVisPosition++)
			{
				if (nVisPosition % nTab == 0)break;
			}
		}
		else
		{
			// ����{���ǂ������肷��
			bool bIsDualWidth = false;
			if (IsSurrogateLead(*pWork))	// �T���Q�[�g�y�A�̂P�o�C�g��
			{
				bIsDualWidth = IsDualChar(*pWork,*(pWork+1));
				pWork++;i++;
			}
			else							// �T���Q�[�g�y�A�ł͂Ȃ��Ƃ�
			{
				bIsDualWidth = IsDualChar(*pWork);
			}
			// �ʒu�����炷
			if (bIsDualWidth)nVisPosition += 2;
			else nVisPosition ++;
		}
		// ���̍s�֍s���܂��H
		if (IsGoNext(pWork,i,nVisPosition,nColumn,nMode))
		{
			nVisPosition = 0;
			nNowEthic ++ ;
		}
	}
	// �l��Ԃ�
	return i;
}

//-----------------------------------------------------------------------------
/**
 * @brief �s�̍ŏ�����w�肳�ꂽ�ʒu�܂ł̋󔒐����v�Z����
 * @param	nPos	[in] �v�Z�ʒu
 * @return ������
 */
size_t CFootyLine::CalcAutoIndentPos( size_t nPos ) const
{
	size_t i = 0;
	for ( i = 0; i < nPos; i++ )
	{
		wchar_t c = m_strLineData[ i ];
		if ( c != '\t' && c != ' ' )
		{
			break;
		}
	}
	return i;
}

/*[EOF]*/
