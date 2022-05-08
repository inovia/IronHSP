;--------------------------------------------------
; SQLele help
;--------------------------------------------------

%dll
SQLele

%ver
1.17

%date
2018/06/07

%author
s.programs

%url
http://spn.php.xdomain.jp/

%note
sqlele.hsp ���C���N���[�h���Ďg�p���܂��B���s�ɂ� sqlite3.dll ���K�v�ł��B

%type
���[�U�[�g������

%index
prm_blob
�ϐ��� BLOB �^�f�[�^�� SQL �p�����[�^�Ƃ��Ďw��

%prm
(v1, p1)
v1 : BLOB �^�p�����[�^�Ƃ��ė^����ϐ�
p1 : �ϐ��̃f�[�^�T�C�Y (�o�C�g��)

%inst
���̊֐��́A�ϐ��o�b�t�@�� BLOB �^�f�[�^�Ƃ��� SQL ���̃p�����[�^�ɂ��邽�߂Ɏg�p���܂��Bsql_q ���߂̈����������p�ł��B

���̊֐��Őݒ肵���p�����[�^�́Asql_q ���߂̎��s���Ƀo�C���h�ϐ��Ƃ��Ĉ����܂��B

%href
sql_q

%sample
	...

	sql_q "INSERT INTO Tbl (v1, v2, v3) VALUES ("+prm_blob(v1, n1)+","+prm_blob(v2, n2)+","+prm_blob(v3, n3)+")"

%group
�p�����[�^�p�֐�

%index
sql_q
SQL �X�e�[�g�����g�����s

%prm
"p1", v1
"p1"	: ���s���� SQL ��
v1	: �Ώۃ��R�[�h�Z�b�g�ϐ� (�ȗ��l tmparr)

%inst
SQL �������s���܂��B

p1 �ŁA���s���� SQL �����w�肵�܂��B

v1 �ŁA���ʃf�[�^���󂯎�郌�R�[�h�Z�b�g�ϐ����w�肵�܂��B

SELECT ���ȂǂŌ��ʂƂȂ郌�R�[�h�Z�b�g������ꍇ�A���R�[�h�Z�b�g�ϐ��Ƀ��R�[�h�f�[�^���擾����܂��B�V�X�e���ϐ� stat �ɂ́A���R�[�h�̍s�����Ԃ�܂��Bstat �� 0 �̏ꍇ�́A���R�[�h���Ȃ��������Ƃ�\���܂��B

�u���R�[�h�Z�b�g�ϐ��v�́A2 �����̕�����o�b�t�@�̔z��Ƃ��ď���������܂��B���̔z��ϐ��ɂ́A�o�̓f�[�^��^���A�J�������Ȃǂ��i�[����Ă��܂��B���R�[�h�Z�b�g�ϐ��͕�����z��Ƃ��Ē��ڎQ�Ƃł���ق��Asql_v() ���g�p����΃J���������g�����f�[�^�Q�Ƃ��ł��Asql_type() ���g�p����Ό��̃f�[�^�^���擾���邱�Ƃ��ł��܂��B

v1 ���ȗ������ꍇ�́A�}�N���ɂ��ϐ��� tmparr ���ݒ肳��܂��BSQLele �̂��ׂĂ̖��߁E�֐��ł́A���R�[�h�Z�b�g�ϐ��̎w����ȗ������ꍇ�Atmparr �Ƃ����ϐ������^�����܂��B���̂��߁A�����̏ꍇ���R�[�h�Z�b�g�ϐ��̎w����ȗ����邱�Ƃ��ł��܂��B

p1 �ŗ^����p�����[�^�Ƀo�C���h���g�p����ꍇ�́Aprm_i(), prm_f(), prm_text(), prm_blob() �֐����g�p���܂��B����ɂ��A�����̌�������}�邱�Ƃ��ł��܂��B

sql_q ���߂����s���邽�߂ɂ́Asql_open ���߂Ńf�[�^�x�[�X���J����Ă���K�v������܂��B

���̃v���Z�X�̃g�����U�N�V�����ɂ���ă��b�N���ꂽ�f�[�^�x�[�X�ɏ����������Ƃ����ꍇ�́A���b�N�����������܂ő҂��Ă��珑�����݂����s����܂��B

(����) ���R�[�h�Z�b�g�ϐ��̃t�H�[�}�b�g
�f�[�^������     = v1(column [0�`], record [0�`stat-1])
�J������         = v1(column [0�`], stat)
�^               = lpeek(v1(column, record), strlen(v1(column, record)) + 4)
���R�[�h�J�E���^ = lpeek(v1(0, 0), strlen(v1(0, 0)) + 8)
BLOB �T�C�Y      = lpeek(v1(column, record), strlen(v1(column, record)) + 12)
BLOB �f�[�^      = v1(column, record) 16 �o�C�g�ڈȍ~
���R�[�h��       = length2(v1) - 1
�J������         = length(v1)

%href
sql_v
sql_i
sql_f
sql_type
prm_i
prm_f
prm_text
prm_blob

%sample
	...

	sql_q "SELECT ID, Val FROM [�e�[�u��]"
	count = stat

	mes "���� = " + count
	repeat count
		mes "ID = " + sql_v("ID") + " / Val = " + sql_v("Val")
		sql_next
	loop

%group
�f�[�^�x�[�X����

%index
prm_f
���������_���� SQL �p�����[�^�Ƃ��Ďw��

%prm
(p1)
p1 : �p�����[�^�Ƃ��ė^���镂�������_��

%inst
���̊֐��́A���������_���� SQL ���̃p�����[�^�ɂ��邽�߂Ɏg�p���܂��Bsql_q ���߂̈����������p�ł��B

���̊֐��Őݒ肵���p�����[�^�́Asql_q ���߂̎��s���Ƀo�C���h�ϐ��Ƃ��Ĉ����܂��B

%href
sql_q

%sample
	...

	sql_q "INSERT INTO Tbl (f1, f2, f3) VALUES ("+prm_f(0.0)+","+prm_f(1.0)+","+prm_f(2.0)+")"

%group
�p�����[�^�p�֐�

%index
prm_i
������ SQL �p�����[�^�Ƃ��Ďw��

%prm
(p1)
p1 : �p�����[�^�Ƃ��ė^���鐮��

%inst
���̊֐��́A������ SQL ���̃p�����[�^�ɂ��邽�߂Ɏg�p���܂��Bsql_q ���߂̈����������p�ł��B

���̊֐��Őݒ肵���p�����[�^�́Asql_q ���߂̎��s���Ƀo�C���h�ϐ��Ƃ��Ĉ����܂��B

%href
sql_q

%sample
	...

	sql_q "INSERT INTO Tbl (i1, i2, i3) VALUES ("+prm_i(0)+","+prm_i(1)+","+prm_i(2)+")"

%group
�p�����[�^�p�֐�

%index
prm_text
������ϐ����e�L�X�g�^�� SQL �p�����[�^�Ƃ��Ďw��

%prm
(v1)
v1 : �e�L�X�g�^�p�����[�^�ɂ���ϐ�

%inst
���̊֐��́A������^�̕ϐ����e�L�X�g�f�[�^�Ƃ��� SQL ���̃p�����[�^�ɂ��邽�߂Ɏg�p���܂��Bsql_q ���߂̈����������p�ł��B

���̊֐��Őݒ肵���p�����[�^�́Asql_q ���߂̎��s���Ƀo�C���h�ϐ��Ƃ��Ĉ����܂��BSQL ���ɒ��ڕ�����������荂���ɏ�������܂��B�V���O���N�H�[�e�[�V�����ň͂܂��Ɏg�p���Ă��������B

%href
sql_q
sqesc

%sample
	...

	sql_q "INSERT INTO Tbl (s1, s2, s3) VALUES ("+prm_text(s1)+","+prm_text(s2)+","+prm_text(s3)+")"

%group
�p�����[�^�p�֐�

%index
sql_f
���R�[�h�Z�b�g�ϐ����� double �Ƃ��ăf�[�^�擾

%prm
("p1", v1)
"p1"	: �J������
v1	: �Ώۃ��R�[�h�Z�b�g�ϐ� (�ȗ��l tmparr)

%inst
���R�[�h�Z�b�g�ϐ�����A�J���������w�肵�� (���̃f�[�^�̌^�Ɋ֌W�Ȃ�) ���������_���Ƃ��ăf�[�^���Q�Ƃ��܂��B

�Q�Ƃ��郌�R�[�h�����֐i�߂�Ƃ��́Asql_next ���߂��g�p���܂��B

%href
sql_q
sql_next
sql_v
sql_i
sql_type

%group
���R�[�h�Z�b�g����

%index
sql_i
���R�[�h�Z�b�g�ϐ����� int �Ƃ��ăf�[�^�擾

%prm
("p1", v1)
"p1"	: �J������
v1	: �Ώۃ��R�[�h�Z�b�g�ϐ� (�ȗ��l tmparr)

%inst
���R�[�h�Z�b�g�ϐ�����A�J���������w�肵�� (���̃f�[�^�̌^�Ɋ֌W�Ȃ�) �����l�Ƃ��ăf�[�^���Q�Ƃ��܂��B

�Q�Ƃ��郌�R�[�h�����֐i�߂�Ƃ��́Asql_next ���߂��g�p���܂��B

%href
sql_q
sql_next
sql_v
sql_f
sql_type

%sample
	...

	sql_q "SELECT ID, ...", tmparr

	id = sql_i("ID")

%group
���R�[�h�Z�b�g����

%index
sql_type
���R�[�h�Z�b�g�ϐ�����f�[�^�̌^���擾

%prm
("p1", v1)
"p1"	: �J������
v1	: �Ώۃ��R�[�h�Z�b�g�ϐ� (�ȗ��l tmparr)

%inst
���R�[�h�Z�b�g�ϐ�����A�J���������w�肵�ăf�[�^�̌^���擾���܂��B

sql_q ���߂Ŏ擾����郌�R�[�h�Z�b�g�ϐ��͕�����^�̔z��ɂȂ邽�߁A���̌^��m�肽���ꍇ�͂��̊֐��Œ��ׂ܂��B�l�̈Ӗ��́A���L�̂悤�ɂȂ�܂��B

type = sql_type("Col name", arr)

type == SQLITE_INTEGER	-> INTEGER �^
type == SQLITE_FLOAT	-> FLOAT �^
type == SQLITE_TEXT	-> TEXT �^
type == SQLITE_BLOB	-> BLOB �^
type == SQLITE_NULL	-> NULL

SQLite �ł́A�����J�����̃f�[�^�ł����R�[�h�ɂ���ĈقȂ�^�������Ƃ��ł��܂��B

�Q�Ƃ��郌�R�[�h�����֐i�߂�Ƃ��́Asql_next ���߂��g�p���܂��B

%href
sql_q
sql_next
sql_v
sql_i
sql_f

%group
���R�[�h�Z�b�g����

%index
sql_v
���R�[�h�Z�b�g�ϐ��̃f�[�^���Q��

%prm
("p1", v1)
"p1"	: �J������
v1	: �Ώۃ��R�[�h�Z�b�g�ϐ� (�ȗ��l tmparr)

%inst
���R�[�h�Z�b�g�ϐ�����A�J���������w�肵�ăf�[�^���Q�Ƃ��܂��B���̊֐��^�}�N���́A�ϐ��Ƃ��ĎQ�Ɖ\�Ȍ`�œW�J����܂��B

�f�[�^�̌^�́A���̃f�[�^�^�Ɋ֌W�Ȃ�������^�ƂȂ�܂��B���̌^��m�肽���ꍇ�́Asql_type() ���g�p���܂��B

���̃}�N���͕ϐ��Ƃ��ēW�J����邽�߁A���L�̂悤�Ɉ����ɕ�����^�ϐ���v������W���֐��ł��̂܂܎g�p�ł��܂��B

i = instr(sql_v("hoge"), 0, "srch")
s = strmid(sql_v("hoge"), 0, 99)

�Q�Ƃ��郌�R�[�h�����֐i�߂�Ƃ��́Asql_next ���߂��g�p���܂��B

(����) �}�N���̎d�l
�W�J�O : sql_v("Col", arr)
�W�J�� : arr(sql_colid("Col", arr), [���R�[�h�J�E���^])

%href
sql_q
sql_next
sql_i
sql_f
sql_type

%sample
	; �t������
	sql_q "SELECT * FROM ...", tmparr
	repeat stat
		mes sql_v("col1", tmparr) + "/" +  sql_v("col2", tmparr)
		sql_next tmparr
	loop

	��

	; �����ȗ�
	sql_q "SELECT * FROM ..."
	repeat stat
		mes sql_v("col1") + "/" +  sql_v("col2")
		sql_next
	loop

%group
���R�[�h�Z�b�g����

%index
sqesc
�V���O���N�H�[�e�[�V���� �G�X�P�[�v

%prm
("p1")
"p1" : �ϊ����镶����

%inst
���̊֐��́A�����񒆂̃V���O���N�H�[�e�[�V���������ׂ� 2 �A���ɂ����l��Ԃ��܂��B

�� : "let's go" �� "let''s go"

SQL ���Ŏg�p����V���O���N�H�[�e�[�V��������̕����񃊃e�����ł́A������̒��g�ɃV���O���N�H�[�e�[�V�������܂܂��ꍇ�A����� 2 �A���Ƃ��邱�Ƃɂ���ăG�X�P�[�v����K�v������܂��B

SQL ���ɒP���ɕ�����ϐ���}������ꍇ�́A��荂���� prm_text() ���g�p���邱�Ƃ��ł��܂��B

%href
prm_text

%sample
	...

	sql_q "SELECT ... WHERE [���l] like '%"+sqesc(srch)+"%')"

%group
�p�����[�^�p�֐�
%index
sql_next
���̃��R�[�h�ֈړ�

%prm
v1
v1 : �Ώۃ��R�[�h�Z�b�g�ϐ� (�ȗ��l tmparr)

%inst
���R�[�h�Z�b�g�ϐ� v1 �̃��R�[�h�J�E���^�� 1 �i�߂܂��B

���R�[�h�J�E���^�Ƃ̓��R�[�h�Z�b�g�ϐ��ɋL�^����Ă���J�E���^�ŁAsql_v(), sql_i() �Ȃǂ̃f�[�^�擾�֐��Ŏ��o����郌�R�[�h�̈ʒu���������̂ł��B

���ۂ̃��R�[�h���ȏ�ɃJ�E���^��i�߂��ꍇ�A�G���[�ƂȂ�܂��B

%href
sql_move
sql_v
sql_i
sql_f
sql_type
sql_blobsize
sql_blobcopy

%sample
	...

	sql_q "SELECT * FROM ..."
	repeat stat
		mes sql_v("Column")
		sql_next
	loop

%group
���R�[�h�Z�b�g����

%index
sql_blobcopy
BLOB �f�[�^��ϐ��ɃR�s�[

%prm
v1, "p1", v2
v1	: �l���󂯎��ϐ�
"p1"	: �J������
v2	: �Ώۃ��R�[�h�Z�b�g�ϐ� (�ȗ��l tmparr)

%inst
���R�[�h�Z�b�g�ϐ�����A�J���������w�肵�� BLOB �f�[�^��ʂ̕ϐ��ɃR�s�[���܂��B

�l���󂯎��ϐ��́Adim �� sdim, memexpand �ł��炩���� sql_blobsize() �Ŏ擾����� BLOB �T�C�Y�ȏ�̑傫�����m�ۂ���Ă���K�v������܂��B

���Y�̃f�[�^�� BLOB �^���ǂ����́Asql_type() �Ŕ��ʂł��܂��B

�Q�Ƃ��郌�R�[�h�����֐i�߂�Ƃ��́Asql_next ���߂��g�p���܂��B

%href
sql_blobsize
sql_next

%sample
	...

	sql_q "SELECT blob1 FROM ..."

	; �J���� blob1 �� BLOB �f�[�^��ϐ� v �ɃR�s�[
	size = sql_blobsize("blob1")
	sdim v, size
	sql_blobcopy v, "blob1"

%group
���R�[�h�Z�b�g����

%index
sql_blobsize
BLOB �f�[�^�̃T�C�Y���擾

%prm
("p1", v1)
"p1"	: �J������
v1	: �Ώۃ��R�[�h�Z�b�g�ϐ� (�ȗ��l tmparr)

%inst
���R�[�h�Z�b�g�ϐ�����A�J���������w�肵�� BLOB �f�[�^ (�f�[�^�x�[�X�Ɋi�[���ꂽ�o�C�i���f�[�^) �̃T�C�Y���擾���܂��B

���Y�̃f�[�^�� BLOB �^���ǂ����́Asql_type() �Ŕ��ʂł��܂��BBLOB �f�[�^�{�̂́Asql_v() �ŎQ�Ƃł���ϐ��� 16 �o�C�g�ڈȍ~�Ɋi�[����Ă���Asql_blobcopy ���߂ŕʂ̕ϐ��ɃR�s�[�ł��܂��B

BLOB �^�ȊO�̃f�[�^�ɑ΂��Ă��̊֐������s�����ꍇ�́A0 ���Ԃ�܂��B

�Q�Ƃ��郌�R�[�h�����֐i�߂�Ƃ��́Asql_next ���߂��g�p���܂��B

%href
sql_blobcopy
sql_next

%sample
	...

	sql_q "SELECT ID, blob1 FROM ..."
	repeat stat
		mes "ID " + sql_v("ID") + " �� blob1 �̃T�C�Y�� " + sql_blobsize("blob1")
		sql_next
	loop

%group
���R�[�h�Z�b�g����

%index
sql_move
���R�[�h�ʒu�̈ړ�

%prm
p1, v1
p1 : ���R�[�h�ʒu�w�� [0�`] (0)
v1 : �Ώۃ��R�[�h�Z�b�g�ϐ� (�ȗ��l tmparr)

%inst
���R�[�h�Z�b�g�ϐ� v1 �̓ǂݏo�����R�[�h�ʒu (���R�[�h�J�E���^) �̒l��ݒ肵�܂��B

���R�[�h�J�E���^�Ƃ̓��R�[�h�Z�b�g�ϐ��ɋL�^����Ă���J�E���^�ŁAsql_v(), sql_i() �Ȃǂ̃f�[�^�擾�֐��̑ΏۂƂȂ郌�R�[�h���������̂ł��B

���R�[�h�J�E���^�ɂ́A0 �` (���R�[�h�� - 1) �̒l���ݒ�ł��܂��B�͈͊O�̒l���w�肵���ꍇ�A�G���[�ƂȂ�܂��B

%href
sql_next

%sample
	sql_q "SELECT * FROM ..."
	repeat stat
		mes sql_v("Column")
		sql_next
	loop

 ;	����������������

	sql_q "SELECT * FROM ..."
	repeat stat
		sql_move cnt
		mes sql_v("Column")
	loop

%group
���R�[�h�Z�b�g����

%index
sql_close
�f�[�^�x�[�X���N���[�Y

%prm

%inst
sql_open ���߂ŊJ�����f�[�^�x�[�X���N���[�Y (�g�p�I��) ���܂��B

�A�v���P�[�V�����I�����ȂǁA�f�[�^�x�[�X�̎g�p���I������Ƃ��ɌĂяo���Ă��������B

%href
sql_open

%sample
	sql_open "test.db"

	...

	sql_close

%group
�f�[�^�x�[�X����

%index
sql_open
�f�[�^�x�[�X���I�[�v��

%prm
"p1"
"p1" : �I�[�v������t�@�C����

%inst
�f�[�^�x�[�X �t�@�C�����J���܂��B

p1 �Ńt�@�C�������w�肵�܂��B�w�肳�ꂽ�t�@�C�����Ȃ���΁A�V�K�ɍ쐬����܂��B

p1 �� "" ���w�肷��ƁA�f�B�X�N��Ɉꎞ�I�ȃf�[�^�x�[�X���쐬����܂��B":memory:" ���w�肷��ƁA�t�@�C�����쐬�����Ƀ�������Ɉꎞ�I�ȃf�[�^�x�[�X���쐬���܂��B

�f�[�^�x�[�X�̎g�p���I������Ƃ��́Asql_close �Ńf�[�^�x�[�X����Ă��������B

%href
sql_close

%sample
	sql_open "test.db"

	...

	sql_close

%group
�f�[�^�x�[�X����

%index
sql_colid
�J���������烌�R�[�h�Z�b�g�ϐ��̔z��C���f�b�N�X���擾

%prm
("p1", v1)
"p1"	: �J������
v1	: �Ώۃ��R�[�h�Z�b�g�ϐ� (�ȗ��l tmparr)

%inst
���R�[�h�Z�b�g�ϐ�����A�J���������w�肵�Ă��̔z��C���f�b�N�X���擾���܂��B

�Ⴆ�� SQL �� "SELECT ID, hoge, foo FROM ..." �����s�����ꍇ�A

sql_colid("ID") == 0
sql_colid("hoge") == 1
sql_colid("foo") == 2

�ƂȂ�܂��B

�J�������́A�啶�����������܂ߊ��S��v�łȂ���΂Ȃ�܂���B

���̊֐��́Asql_v(), sql_i(), sql_f(), sql_type() ���g�p���Ă��܂��B

%sample
	...

	sql_q "SELECT * FROM ...", arr

	c_id  = sql_colid("ID", arr)
	c_val = sql_colid("Val", arr)

	mes "ID=" + arr(c_id, 0) + " / Val=" + arr(c_val, 0)

%group
���R�[�h�Z�b�g����

%index
sql_collist
���R�[�h�Z�b�g�ϐ��̃J�����ꗗ���擾

%prm
("p1", v1)
"p1"	: ��؂蕶����
v1	: �Ώۃ��R�[�h�Z�b�g�ϐ� (�ȗ��l tmparr)

%inst
���R�[�h�Z�b�g�ϐ��Ɋ܂܂��J�������̈ꗗ���擾���܂��B

p1 �ŁA�J����������؂镶������w�肵�܂��B���̈������ȗ�����ƁA"," (�R���}) ���g�p����܂��B

v1 �ŁA���R�[�h�Z�b�g�ϐ������w�肵�܂��B���R�[�h�Z�b�g�ϐ����ȗ�����ƁAtmparr �Ƃ����ϐ������g�p����܂��B

%sample
	...

	sql_q "SELECT * FROM Table1" ; ���R�[�h�Z�b�g�擾

	mes sql_collist() ; ���R�[�h�Z�b�g�ϐ��Ɋ܂܂��J�������ꗗ��\��

%group
���R�[�h�Z�b�g����

