%dll
hspmath
%ver
3.6
%date
2011/05/10
%group
���w�֐�
%port
Win
Mac
Cli
Let
%author
HSPWiki
%note
hspmath.as���C���N���[�h���邱�ƁB



%type
���[�U�[��`�}�N��
%index
M_LOG2E
2���Ƃ���l�C�s�A���̑ΐ�

%inst
2���Ƃ���l�C�s�A���̑ΐ���\���萔�ł��B
2���Ƃ���l�C�s�A���̑ΐ��Ƃ́Alog2(m_e)�̂��Ƃ��w���܂��B

%group
���w�萔

%sample
#include "hspmath.as"
	a = 10.0
	mes "2���Ƃ���a�̑ΐ���" + log2(a) + "�ł��B"
	mes "�����logf(a) * m_log2e�Ƃ��Ă����߂��܂��F" + (logf(a) * m_log2e) + "\n"

	mes "���̂悤��m_log2e���ue���Ƃ���ΐ��v�ɂ����邱�ƂŁA"
	mes "�u2���Ƃ���ΐ��v�𓾂邱�Ƃ��ł��܂��B"
	stop

%href
M_LOG10E
M_E
log2

%type
���[�U�[��`�}�N��
%index
M_LOG10E
10���Ƃ���l�C�s�A���̑ΐ�

%inst
10���Ƃ���l�C�s�A���̑ΐ���\���萔�ł��B
10���Ƃ���l�C�s�A���̑ΐ��Ƃ́Alog10(m_e)�̂��Ƃ��w���܂��B

%group
���w�萔

%sample
#include "hspmath.as"
	a = m_e
	mes "10���Ƃ���a�̑ΐ���" + log10(a) + "�ł��B"
	mes "�����logf(a) * m_log10e�Ƃ��Ă����߂��܂��F" + (logf(a) * m_log10e) + "\n"

	mes "���̂悤��m_log10e���ue���Ƃ���ΐ��v�ɂ����邱�ƂŁA"
	mes "�u10���Ƃ���ΐ��v�𓾂邱�Ƃ��ł��܂��B"
	stop

%href
M_LOG2E
log10
M_E


%type
���[�U�[��`�}�N��
%index
M_LN2
�l�C�s�A�����Ƃ���2�̑ΐ�

%inst
�l�C�s�A�����Ƃ���2�̑ΐ���\���萔�ł��B
�l�C�s�A�����Ƃ���2�̑ΐ��Ƃ́Alogf(2)�̂��Ƃ��w���܂��B

%group
���w�萔

%href
M_LN10



%type
���[�U�[��`�}�N��
%index
M_LN10
�l�C�s�A�����Ƃ���10�̑ΐ�

%inst
�l�C�s�A�����Ƃ���10�̑ΐ���\���萔�ł��B
�l�C�s�A�����Ƃ���10�̑ΐ��Ƃ́Alogf(10)�̂��Ƃ��w���܂��B

%group
���w�萔

%href
M_LN2


%type
���[�U�[��`�}�N��
%index
M_E
�l�C�s�A��

%inst
�l�C�s�A���i���R�ΐ��̒�je��\���萔�ł��B

%href
M_PI
M_LOG2E
M_LOG10E

%group
���w�萔

%url
http://ja.wikipedia.org/wiki/%E3%83%8D%E3%82%A4%E3%83%94%E3%82%A2%E6%95%B0


%type
���[�U�[��`�}�N��
%index
M_SQRTPI
�~�����̕�����

%inst
�~�����̕�������\���萔�ł��B

%href
sqrt
M_PI
M_SQRT2
M_SQRT3

%group
���w�萔


%type
���[�U�[��`�}�N��
%index
M_SQRT2
2�̕�����

%inst
2�̕�������\���萔�ł��B

%href
sqrt
M_SQRTPI
M_SQRT3

%group
���w�萔



%type
���[�U�[��`�}�N��
%index
M_SQRT3
3�̗ݏ捪

%inst
3�̗ݏ捪��\���萔�ł��B

%href
sqrt
M_SQRTPI
M_SQRT2

%group
���w�萔


%type
���[�U�[��`�}�N��
%index
DBL_DIG
10�i���ŗL���Ȍ���

%inst
10�i���ŗL���Ȍ�����\���萔�ł��B

%group
double�̌��x



%type
���[�U�[��`�}�N��
%index
DBL_EPSILON
1.0�Ƃ��̎��ɑ傫���l�Ƃ̍�

%inst
1.0�Ƃ��̎��ɑ傫���l�Ƃ̍���\���萔�ł��B

%group
double�̌��x



%type
���[�U�[��`�}�N��
%index
DBL_MANT_DIG
��������bit��

%inst
�����^�̐��l��\���ۂɗp���鉼������bit����\���萔�ł��B

%group
double�̌��x


%type
���[�U�[��`�}�N��
%index
DBL_MAX
�����̍ő�l

%inst
�����ŕ\���ł���ő�l��\���萔�ł��B

%group
double�̌��x

%href
INT_MAX



%type
���[�U�[��`�}�N��
%index
DBL_MAX_10_EXP
10�i���ł̎w�����̍ő�l

%inst
�w�����̍ő�l��\���萔�ł��B

%href
DBL_MIN_10_EXP
DBL_MAX_EXP

%group
double�̌��x



%type
���[�U�[��`�}�N��
%index
DBL_MAX_EXP
2�i���ł̎w�����̍ő�l

%inst
�w�����̍ő�l��\���萔�ł��B

%group
double�̌��x

%href
DBL_MAX_10_EXP
INT_MAX


%type
���[�U�[��`�}�N��
%index
DBL_MIN
0�𒴂���ŏ��̒l

%inst
0�𒴂���ŏ��̒l��\���萔�ł��B

%group
double�̌��x



%type
���[�U�[��`�}�N��
%index
DBL_MIN_10_EXP
10�i���ł̎w�����̍ŏ��l

%inst
�w�����̍ŏ��l��\���萔�ł��B

%href
DBL_MAX_10_EXP
DBL_MIN_EXP

%group
double�̌��x



%type
���[�U�[��`�}�N��
%index
DBL_MIN_EXP
2�i���ł̎w�����̍ŏ��l

%inst
�w�����̍ŏ��l��\���萔�ł��B

%href
DBL_MIN_10_EXP

%group
double�̌��x



%type
���[�U�[��`�}�N��
%index
INT_DIGIT
2�i���ŗL���Ȍ���

%inst
2�i���ŗL���Ȍ�����\���萔�ł��B

%href
INT_DIGIT10

%group
int�̌��x



%type
���[�U�[��`�}�N��
%index
INT_DIGIT10
10�i���ŗL���Ȍ���

%inst
10�i���ŗL���Ȍ�����\���萔�ł��B

%href
INT_DIGIT

%group
int�̌��x



%type
���[�U�[��`�}�N��
%index
INT_MAX
�ő�l

%inst
�����ŕ\���ł���ő�l��\���萔�ł��B

%href
DBL_MAX
INT_MIN

%group
int�̌��x



%type
���[�U�[��`�}�N��
%index
INT_MIN
�ŏ��l

%inst
�����ŕ\���ł���ŏ��̒l��\���萔�ł��B

%href
INT_MAX

%group
int�̌��x





%index
pow
�ݏ�i�ׂ���j�����߂�

%prm
(p1, p2)
p1 : ��i0�ȏ�j
p2 : �w��

%inst
p1��p2�悵���l�����߂܂��B���ʂ͎����ŗ^�����܂��B

p1�͕K�����łȂ���΂Ȃ�܂���B���̏ꍇ�̓G���[�ɂ͂Ȃ�܂��񂪁A�񐔁i-1.#IND00�j���Ԃ�܂��B

p2�͐����ǂ���ł��\���܂���B�܂��A�������w�肷�邱�Ƃ��\�ł��B

%sample
#include "hspmath.as"
	repeat 5, -2
		mes "10��" + cnt + "���" + pow(10, cnt) + "�ł��B"
	loop
	stop
%href
powf
logf


%index
log10
10���Ƃ����ΐ��i��p�ΐ��j

%prm
(p1)
p1 : �^��

%inst
10���Ƃ���p1�̑ΐ������߂܂��B���ʂ͎����ŗ^�����܂��B

%href
M_LOG10E
logf
log2
%index
log2
2���Ƃ����ΐ�

%prm
(p1)
p1 : �^��

%inst
2���Ƃ���p1�̑ΐ������߂܂��B���ʂ͎����ŗ^�����܂��B

%href
M_LOG2E
logf
log10
%index
asin
�T�C���̋t�֐��i�A�[�N�T�C���j

%prm
(p1)
p1 : �p�x�l�i���W�A���j

%inst
p1�̃A�[�N�T�C���i�t�����j�l��Ԃ��܂��B
���ʂ͎����^�����W�A���A-M_PI/2�`M_PI/2�i�x���@��-90���`90���j�͈̔͂ŗ^�����܂��B

%href
acos
atan

%url
http://ja.wikipedia.org/wiki/%E9%80%86%E4%B8%89%E8%A7%92%E9%96%A2%E6%95%B0
%index
acos
�R�T�C���̋t�֐��i�A�[�N�R�T�C���j

%prm
(p1)
p1 : �p�x�l�i���W�A���j

%inst
p1�̃A�[�N�R�T�C���i�t�]���j�l��Ԃ��܂��B
���ʂ͎����^�����W�A���A0�`M_PI�i�x���@��0���`180���j�͈̔͂ŗ^�����܂��B

%href
asin
atan

%url
http://ja.wikipedia.org/wiki/%E9%80%86%E4%B8%89%E8%A7%92%E9%96%A2%E6%95%B0
%index
sinh
�o�Ȑ������֐��i�n�C�p�{���b�N�T�C���j

%prm
(p1)
p1 : �p�x�l�i���W�A���j

%inst
p1�̃n�C�p�{���b�N�T�C���i�o�Ȑ������j�l��Ԃ��܂��B
���ʂ͎����ŗ^�����܂��B

%href
cosh
tanh
asinh

%url
http://ja.wikipedia.org/wiki/%E5%8F%8C%E6%9B%B2%E7%B7%9A%E9%96%A2%E6%95%B0
%index
cosh
�o�Ȑ��]���֐��i�n�C�p�{���b�N�R�T�C���j

%prm
(p1)
p1 : �p�x�l�i���W�A���j

%inst
p1�̃n�C�p�{���b�N�R�T�C���i�o�Ȑ��]���j�l��Ԃ��܂��B
���ʂ͎����ŗ^�����܂��B

%href
sinh
tanh
acosh

%url
http://ja.wikipedia.org/wiki/%E5%8F%8C%E6%9B%B2%E7%B7%9A%E9%96%A2%E6%95%B0
%index
tanh
�o�Ȑ����ڊ֐��i�n�C�p�{���b�N�^���W�F���g�j

%prm
(p1)
p1 : �p�x�l�i���W�A���j

%inst
p1�̃n�C�p�{���b�N�^���W�F���g�i�o�Ȑ����ځj�l��Ԃ��܂��B
���ʂ͎����ŗ^�����܂��B

%href
sinh
cosh
atanh

%url
http://ja.wikipedia.org/wiki/%E5%8F%8C%E6%9B%B2%E7%B7%9A%E9%96%A2%E6%95%B0
%index
asinh
�o�Ȑ������֐��̋t�֐��i�A�[�N�n�C�p�{���b�N�T�C���j

%prm
(p1)
p1 : �p�x�l�i���W�A���j

%inst
p1�̃A�[�N�n�C�p�{���b�N�T�C���i�t�o�Ȑ������j�l��Ԃ��܂��B
���ʂ͎����ŗ^�����܂��B

%href
acosh
atanh
sinh

%url
http://ja.wikipedia.org/wiki/%E5%8F%8C%E6%9B%B2%E7%B7%9A%E9%96%A2%E6%95%B0
%index
acosh
�o�Ȑ��]���֐��̋t�֐��i�A�[�N�n�C�p�{���b�N�R�T�C���j

%prm
(p1)
p1 : �p�x�l�i���W�A���j

%inst
p1�̃A�[�N�n�C�p�{���b�N�R�T�C���i�t�o�Ȑ��]���j�l��Ԃ��܂��B
���ʂ͎����ŗ^�����܂��B

%href
asinh
atanh
cosh

%url
http://ja.wikipedia.org/wiki/%E5%8F%8C%E6%9B%B2%E7%B7%9A%E9%96%A2%E6%95%B0
%index
atanh
�o�Ȑ����ڊ֐��̋t�֐��i�A�[�N�n�C�p�{���b�N�^���W�F���g�j

%prm
(p1)
p1 : �p�x�l�i���W�A���j

%inst
p1�̃A�[�N�n�C�p�{���b�N�^���W�F���g�i�t�o�Ȑ����ځj�l��Ԃ��܂��B
���ʂ͎����ŗ^�����܂��B

%href
asinh
acosh
tanh

%url
http://ja.wikipedia.org/wiki/%E5%8F%8C%E6%9B%B2%E7%B7%9A%E9%96%A2%E6%95%B0
%index
isfinite
�L���^������񐔂̔���

%prm
(p1)
p1 : ���肷��l

%inst
p1���L���̒l�Ȃ��1���Ap1�������܂��͔񐔂̎���0��Ԃ��܂��B

�񐔂Ƃ͐��l�ȊO�̌^�i������⃉�x���A���W���[���^�Ȃǁj���w�����̂ł͂���܂���B�ϐ��̌^�𒲂ׂ鎞��vartype�֐����g�p���Ă��������B

%sample
#include "hspmath.as"
	mes isfinite(10)            // �L���̒l
	mes isfinite(sqrt(-1))      // ��
	mes isfinite(expf(100))     // �L���̒l
	mes isfinite(expf(1000))    // ������
	stop

%href
isnan
vartype
%index
isnan
�񐔂̔���

%prm
(p1)
p1 : ���肷��l

%inst
p1���񐔂̎���1���A����ȊO�̎���0��Ԃ��܂��B

�񐔂Ƃ͐��l�ȊO�̌^�i������⃉�x���A���W���[���^�Ȃǁj���w�����̂ł͂���܂���B�ϐ��̌^�𒲂ׂ鎞��vartype�֐����g�p���Ă��������B

%sample
#include "hspmath.as"
	mes isnan(10)               // �L���̒l
	mes isnan(sqrt(-1))         // ��
	mes isnan(expf(100))        // �L���̒l
	mes isnan(expf(1000))       // ������
	stop

%href
isfinite
vartype

%url
http://ja.wikipedia.org/wiki/%E9%9D%9E%E6%95%B0
%index
round
�l�̌ܓ�

%prm
(p1)
p1 : �l�̌ܓ�����l�i�����j

%inst
p1�̏����_�ȉ����l�̌ܓ����A���̌��ʂ������ŕԂ��܂��B

%sample
#include "hspmath.as"
	repeat 10
		tmp = 1.0 + 0.1 * cnt
		mes strf("%0.1f���l�̌ܓ������", tmp) + strf("%0.1f�ɂȂ�܂��B", round(tmp))
	loop
	stop

%href
intf
floor
ceil

%url
http://ja.wikipedia.org/wiki/%E7%AB%AF%E6%95%B0%E5%87%A6%E7%90%86
%index
sgn
����

%prm
(p1)
p1 : �����𔻒肷��l�i���l�j

%inst
���l�̕����𔻒肵�A���Ȃ��1���E���Ȃ��-1���E�[���Ȃ��0��Ԃ��܂��B

%sample
#include "hspmath.as"
	tmp = 10
	sign = sgn(tmp)
	if sign == 1 {
		mes str(tmp) + "�͐��ł��B"
	} else : if sign == -1 {
		mes str(tmp) + "�͕��ł��B"
	} else {
		mes str(tmp) + "�̓[���ł��B"
	}
	stop
%index
intf
0�̕����֊ۂ�

%prm
(p1)
p1 : �ۂ߂鐔�l

%inst
p1��0�̕����Ɋۂ߂����l��Ԃ��܂��B���ʂ͎����ŕԂ���܂��B

�����Łup1��0�̕����Ɋۂ߂�v�Ƃ́A�up1�̏����_�ȉ���؂�̂Ă�v���Ƃ��Ӗ����܂��B

%sample
#include "hspmath.as"
	tmp = -2.5
	while(tmp <= 2.5)
		mes strf("%4.1f", tmp) + "��0�̕����֊ۂ߂�ƁA" + strf("%4.1f", intf(tmp)) + "�ɂȂ�܂��B"
		tmp += 0.5
	wend
	stop

%href
round
floor
ceil

%url
http://ja.wikipedia.org/wiki/%E7%AB%AF%E6%95%B0%E5%87%A6%E7%90%86
%index
floor
���̕����֊ۂ�

%prm
(p1)
p1 : �ۂ߂鐔�l

%inst
p1�𕉂̕����Ɋۂ߂����l��Ԃ��܂��B���ʂ͎����ŕԂ���܂��B

�����Łup1�𕉂̕����Ɋۂ߂�v�Ƃ́A
html{
<ul><li>p1�����Ȃ�Ώ����_�ȉ���؂�̂Ă�</li><li>p1�����Ȃ�Ώ����_�ȉ���؂�グ��</ul>
}html
���Ƃ��Ӗ����܂��B

%sample
#include "hspmath.as"
	tmp = -2.5
	while(tmp <= 2.5)
		mes strf("%4.1f", tmp) + "�𕉂̕����֊ۂ߂�ƁA" + strf("%4.1f", floor(tmp)) + "�ɂȂ�܂��B"
		tmp += 0.5
	wend
	stop

%href
round
intf
ceil

%url
http://ja.wikipedia.org/wiki/%E7%AB%AF%E6%95%B0%E5%87%A6%E7%90%86
%index
ceil
���̕����֊ۂ�

%prm
(p1)
p1 : �ۂ߂鐔�l

%inst
p1�𐳂̕����Ɋۂ߂����l��Ԃ��܂��B���ʂ͎����ŕԂ���܂��B

�����Łup1�𐳂̕����Ɋۂ߂�v�Ƃ́A
html{
<ul><li>p1�����Ȃ�Ώ����_�ȉ���؂�グ��</li><li>p1�����Ȃ�Ώ����_�ȉ���؂�̂Ă�</ul>
}html
���Ƃ��Ӗ����܂��B

%sample
#include "hspmath.as"
	tmp = -2.5
	while(tmp <= 2.5)
		mes strf("%4.1f", tmp) + "�𐳂̕����֊ۂ߂�ƁA" + strf("%4.1f", ceil(tmp)) + "�ɂȂ�܂��B"
		tmp += 0.5
	wend
	stop

%href
round
intf
floor

%url
http://ja.wikipedia.org/wiki/%E7%AB%AF%E6%95%B0%E5%87%A6%E7%90%86
%index
fmod
���W����

%prm
(p1, p2)
p1 : �����鐔
p2 : ���鐔

%inst
p1��p2�Ŋ������Ƃ��̗]��������ŕԂ��܂��B
\�L���ɂ�鉉�Z�Ƃ͈قȂ�A�����ɑ΂��Ă��L���ł��B

%sample
#include "hspmath.as"
	mes 5 \ 2
	mes fmod(5, 2)      // �߂�l�͎����ƂȂ�
	mes fmod(3.5, 1.2)  // �����������Ŋ������Ƃ��̗]������߂���
	stop

%url
http://ja.wikipedia.org/wiki/%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%AD
%index
distance2
2�_�̋��������߂�

%prm
(p1, p2)
p1, p2 : �_�̍��W�����������l�^�z��ϐ�

%inst
2�_A�CB�Ԃ̋��������߂܂��B

p1��p2�ɂ͓_�̍��W�𒼌����W�n�ő�����Ă����܂��B
html{
<ul><li>p1(0)�ɓ_A��X���W</li><li>p1(1)�ɓ_A��Y���W</li><li>p2(0)�ɓ_B��X���W</li><li>p2(1)�ɓ_B��Y���W</li></ul>
}html
����������ԂŌĂяo���Ă��������B
���ʂ͎����ŕԂ���܂��B

%sample
#include "hspmath.as"
	point_a = 100, 50       // �_A
	point_b = 500, 400      // �_B
	mes "2�_�Ԃ̋�����" + distance2(point_a, point_b) + "�ł��B"
	line point_a(0), point_a(1), point_b(0), point_b(1)
	color 255  : pset point_a(0), point_a(1)    // �_A
	color ,255 : pset point_b(0), point_b(1)    // �_B
	stop
