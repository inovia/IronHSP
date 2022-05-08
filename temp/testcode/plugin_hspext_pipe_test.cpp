#include <windows.h>
#include <stdio.h>
#include <stdlib.h>

char *test_type_str[] = {
	NULL,
	"STDOUT�ɏo��",
	"STDOUT�ɏo��(30�b�ԃX���[�v)",
	"STDERR�ɏo��",
	"STDERR�ɏo��(30�b�ԃX���[�v)",
	"STDOUT��STDERR�ɏo��",
	"STDOUT��STDERR�ɏo��(30�b�ԃX���[�v)",
	"STDIN�������",
	"STDIN�������(30�b�ԃX���[�v)",
	"STDIN������͂�STDOUT�ɏo��",
	"STDIN������͂�STDERR�ɏo��",
};
enum {
	NotUsed, 
	OUT_STDOUT,
	OUT_STDOUT_WITH_SLEEP,
	OUT_STDERR,
	OUT_STDERR_WITH_SLEEP,
	OUT_STDOUT_AND_STDERR,
	OUT_STDOUT_AND_STDERR_WITH_SLEEP,
	IN_STDIN,
	IN_STDIN_WITH_SLEEP,
	IN_OUT_STDIN_AND_STDOUT,
	IN_OUT_STDIN_AND_STDERR,
};

int main(int argc, char **argv)
{
	char buff[256] = { 0 };
	int test_mode;

	test_mode = argc < 2 ? 0 : atoi(argv[1]);

	if( test_mode < (int)OUT_STDOUT ) {
		printf("usage %s type\n", argv[0]);
		printf("  type:\n");
		for(int i = 1; i < sizeof(test_type_str)/sizeof(test_type_str[0]); i++) {
			printf("   %2d : %s\n", i, test_type_str[i]);
		}
		return 0;
	}

	switch( test_mode )
	{
	case OUT_STDOUT: // STDOUT�ɏo��
	case OUT_STDOUT_WITH_SLEEP: // STDOUT�ɏo��(30�b�ԃX���[�v)
		fprintf(stdout, "%s\n", test_type_str[test_mode]);
		if( OUT_STDOUT_WITH_SLEEP == test_mode) {
			Sleep(30 * 1000);
			fprintf(stdout, "%s'\n", test_type_str[test_mode]);
		}
		break;
	case OUT_STDERR: // STDERR�ɏo��
	case OUT_STDERR_WITH_SLEEP: // STDERR�ɏo��(30�b�ԃX���[�v)
		fprintf(stdout, "%s\n", test_type_str[test_mode]);
		if( OUT_STDERR_WITH_SLEEP == test_mode) {
			Sleep(30 * 1000);
			fprintf(stdout, "%s'\n", test_type_str[test_mode]);
		}
		break;
	case OUT_STDOUT_AND_STDERR: // STDOUT��STDERR�ɏo��
	case OUT_STDOUT_AND_STDERR_WITH_SLEEP: // STDOUT��STDERR�ɏo��(30�b�ԃX���[�v)
		for(int i = 0; i < 10; i++) {
			fprintf(i & 1 ? stdout : stderr, "%s\n", test_type_str[i & 1 ? OUT_STDOUT : OUT_STDERR]);
			if( OUT_STDOUT_AND_STDERR_WITH_SLEEP == test_mode) {
				Sleep(3 * 1000);
				fprintf(i & 1 ? stdout : stderr, "%s'\n", test_type_str[i & 1 ? OUT_STDOUT : OUT_STDERR]);
			}
		}
		break;
	case IN_STDIN: // STDIN�������
		fgets(buff, sizeof(buff)-1, stdin);
		break;
	case IN_STDIN_WITH_SLEEP: // STDIN�������(30�b�ԃX���[�v)
		break;
	case IN_OUT_STDIN_AND_STDOUT: // STDIN������͂�STDOUT�ɏo��
		fgets(buff, sizeof(buff)-1, stdin);
		fprintf(stdout, "%s>>'%s'\n", test_type_str[test_mode], buff);
		break;
	case IN_OUT_STDIN_AND_STDERR: // STDIN������͂�STDERR�ɏo��
		fgets(buff, sizeof(buff)-1, stdin);
		fprintf(stderr, "%s>>'%s'\n", test_type_str[test_mode], buff);
		break;
	}

	return 0;
}

