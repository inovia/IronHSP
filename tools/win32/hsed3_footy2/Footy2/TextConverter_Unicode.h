/*===================================================================
CTextConverter_Unicode�N���X
UNICODE����_�ɂ����e�L�X�g�̕ϊ��������\�ȃx�[�X�N���X�ł��B
����͓��{��̊��N���X
===================================================================*/

#ifndef _TEXT_CONVERTER_CLASS_UNICODE_H_
#define _TEXT_CONVERTER_CLASS_UNICODE_H_

#include "TextConverter.h"

//! �R���o�[�^�[��Unicode�p���
class CTextConverter_Unicode : public CTextConverter{
public:
	inline bool IncludeBOM(){return m_bIncludeBOM;}
protected:
	bool m_bIncludeBOM;
};

//! UTF-8�̃R���o�[�^�[
class CTextConverter_UTF8 : public CTextConverter_Unicode{
public:
	CTextConverter_UTF8(){m_bIncludeBOM = true;}
	CTextConverter_UTF8(bool bWriteBom){m_bIncludeBOM = bWriteBom;}

	bool ToUnicode(const char*,size_t nSize);
	bool ToMulti(const wchar_t*,size_t nSize);
};

//! UTF-16���g���G���f�B�A���̃R���o�[�^�[
class CTextConverter_UTF16LE : public CTextConverter_Unicode{
public:
	CTextConverter_UTF16LE(){m_bIncludeBOM = true;}
	CTextConverter_UTF16LE(bool bWriteBom){m_bIncludeBOM = bWriteBom;}

	bool ToUnicode(const char*,size_t nSize);
	bool ToMulti(const wchar_t*,size_t nSize);
};

//! UTF-16�r�b�O�G���f�B�A���R���o�[�^�[
class CTextConverter_UTF16BE : public CTextConverter_Unicode{
public:
	CTextConverter_UTF16BE(){m_bIncludeBOM = true;}
	CTextConverter_UTF16BE(bool bWriteBom){m_bIncludeBOM = bWriteBom;}

	bool ToUnicode(const char*,size_t nSize);
	bool ToMulti(const wchar_t*,size_t nSize);
};

//! UTF-32���g���G���f�B�A���̃R���o�[�^�[
class CTextConverter_UTF32LE : public CTextConverter_Unicode{
public:
	CTextConverter_UTF32LE(){m_bIncludeBOM = true;}
	CTextConverter_UTF32LE(bool bWriteBom){m_bIncludeBOM = bWriteBom;}

	bool ToUnicode(const char*,size_t nSize);
	bool ToMulti(const wchar_t*,size_t nSize);
};

//! UTF-32�r�b�O�G���f�B�A���R���o�[�^�[
class CTextConverter_UTF32BE : public CTextConverter_Unicode{
public:
	CTextConverter_UTF32BE(){m_bIncludeBOM = true;}
	CTextConverter_UTF32BE(bool bWriteBom){m_bIncludeBOM = bWriteBom;}

	bool ToUnicode(const char*,size_t nSize);
	bool ToMulti(const wchar_t*,size_t nSize);
private:
	inline unsigned long ChangeByteOrder(unsigned long u){
		return ((u & 0x000000FF) << 24) |
			   ((u & 0x0000FF00) << 8 ) |
			   ((u & 0x00FF0000) >> 8 ) |
			   ((u & 0xFF000000) >> 24);
	}
};

#endif	/*_TEXT_CONVERTER_CLASS_UNICODE_H_*/
