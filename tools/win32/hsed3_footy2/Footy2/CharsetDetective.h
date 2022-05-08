/*===================================================================
CCharsetDetective�N���X
�����R�[�h�̔��ʏ������s���N���X
===================================================================*/

#pragma once

class  CCharsetDetective{
public:
	CCharsetDetective();
	
	virtual CharSetMode GetCodepage() = 0;
	void NewCharacter(unsigned char cChar){
		if (!m_bIsImpossible)
			return NewCharInner(cChar);
	}
	inline int GetPoint(){
		if (m_bIsImpossible)return 0;
		else if (HasByteOrderMark())return 9999;
		else{
			//���ꂾ�����ƕω��ɖR����
			//return 100 + (int)((float)((m_nCommonLetter - m_nRareLetter) * 100 / m_nLetterCount));
			return 100 + (m_nCommonLetter - m_nRareLetter);
		}
	}


protected:	
	virtual void NewCharInner(unsigned char cChar) = 0;
	virtual bool HasByteOrderMark(){return false;}

	//! ASCII�����܂��̓e�L�X�g�ɂӂ��킵���R���g���[���R�[�h���擾���鏈��
	inline bool IsAsciiChar(unsigned char cChar){
		return ((0x20 <= cChar && cChar <= 0x7f) ||
				 cChar == '\t' || cChar == '\r' || cChar == '\n');
	}
	
	//! �悭�o�镶����C���N�������g���鏈��
	inline void IncCommon(){
		m_nCommonLetter++;
		m_nLetterCount++;
	}
	
	//! ���܂�o�Ȃ��������C���N�������g���鏈��
	inline void IncRare(){
		m_nRareLetter++;
		m_nLetterCount++;
	}
	
	//! �����̐����C���N�������g���鏈��
	inline void IncLetter(){
		m_nLetterCount++;
	}
	
	//! �s�\��Ԃɂ���
	inline void SetImpossible(){m_bIsImpossible = true;}

private:
	bool m_bIsImpossible;			//!< ����ł���\���͂Ȃ�
	int m_nLetterCount;				//!< "����"�̃J�E���g
	int m_nCommonLetter;			//!< �悭���݂���"����"�̃J�E���g
	int m_nRareLetter;				//!< ����܂�Ȃ�"����"�̃J�E���g
};

/*[EOF]*/
