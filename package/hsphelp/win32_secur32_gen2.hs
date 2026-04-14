; ============================================================
;   secur32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
GetComputerObjectNameW
Retrieves the local computer's name in a specified format. (Unicode)
%group
Win32 secur32
%prm
NameFormat, lpNameBuffer, nSize
NameFormat : [int] The format for the name. This parameter is a value from the EXTENDED_NAME_FORMAT enumeration type. It cannot be NameUnknown.
lpNameBuffer : [wstr] A pointer to a buffer that receives the name in the specified format.
nSize : [var] On input, specifies the size of the lpNameBuffer buffer, in TCHARs. On success, receives the size of the name copied to the buffer. If the lpNameBuffer buffer is too small to hold the name, the function fails and lpnSize receives the required buffer size.
%inst
Retrieves the local computer's name in a specified format. (Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
> [!NOTE] > The secext.h header defines GetComputerObjectName as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
TranslateNameW
Converts a directory service object name from one format to another. (Unicode)
%group
Win32 secur32
%prm
lpAccountName, AccountNameFormat, DesiredNameFormat, lpTranslatedName, nSize
lpAccountName : [wstr] The name to be translated.
AccountNameFormat : [int] The format of the name to be translated. This parameter is a value from the EXTENDED_NAME_FORMAT enumeration type.
DesiredNameFormat : [int] The format of the converted name. This parameter is a value from the EXTENDED_NAME_FORMAT enumeration type. It cannot be NameUnknown.
lpTranslatedName : [wstr] A pointer to a buffer that receives the converted name.
nSize : [var] On input, the variable indicates the size of the lpTranslatedName buffer, in TCHARs. On output, the variable returns the size of the returned string, in TCHARs, including the terminating null character.
%inst
Converts a directory service object name from one format to another.
(Unicode)

[戻り値]
If the function succeeds, the return value is a nonzero value. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
TranslateName fails if it cannot bind to Active Directory on a domain
controller.
> [!NOTE] > The secext.h header defines TranslateName as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).

