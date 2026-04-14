; ============================================================
;   normaliz.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
IdnToAscii
Converts an internationalized domain name (IDN) or another internationalized label to a Unicode (wide character) representation of the ASCII string that represents the name in the Punycode transfer encoding syntax.
%group
Win32 normaliz
%prm
dwFlags, lpUnicodeCharStr, cchUnicodeChar, lpASCIICharStr, cchASCIIChar
dwFlags : [int] Flags specifying conversion options. The following table lists the possible values.
lpUnicodeCharStr : [wstr] Pointer to a Unicode string representing an IDN or another internationalized label.
cchUnicodeChar : [int] Count of characters in the input Unicode string indicated by lpUnicodeCharStr.
lpASCIICharStr : [wstr] Pointer to a buffer that receives a Unicode string consisting only of characters in the ASCII character set. On return from this function, the buffer contains the ASCII string equivalent of the string provided in lpUnicodeCharStr under Punycode. Alternatively, the function can retrieve NULL for this parameter, if cchASCIIChar is set to 0. In this case, the function returns the size required for this buffer.
cchASCIIChar : [int] Size of the buffer indicated by lpASCIICharStr. The application can set the parameter to 0 to retrieve NULL in lpASCIICharStr.
%inst
Converts an internationalized domain name (IDN) or another
internationalized label to a Unicode (wide character) representation
of the ASCII string that represents the name in the Punycode transfer
encoding syntax.

[戻り値]
Returns the number of characters retrieved in lpASCIICharStr if
successful. The retrieved string is null-terminated only if the input
Unicode string is null-terminated. If the function succeeds and the
value of cchASCIIChar is 0, the function returns the required size,
in characters including a terminating null character if it was part
of the input buffer. The function returns 0 if it does not succeed.
To get extended error information, the application can call
GetLastError, which can return one of the following error codes:
This doc was truncated.

[備考]
The function does not null-terminate an output string if the input
string length is explicitly specified without a terminating null
character. To null-terminate an output string for this function, the
application should supply -1 for the cchUnicodeChar parameter or
explicitly count the terminating null character for the input string.
Note that the function always fails if the input string contains
control characters (U+0001 through U+0020) or the "delete" character
(U+007F). Since the character U+0000 can appear only as a terminating
null character, the function always fails if U+0000 appears anywhere
else in the input string. Windows XP, Windows Server 2003: No longer
supported. The required header file and DLL are part of the Microsoft
Internationalized Domain Name (IDN) Mitigation APIs, which are no
longer available for download.


%index
IdnToUnicode
Converts the Punycode form of an internationalized domain name (IDN) or another internationalized label to the normal Unicode UTF-16 encoding syntax.
%group
Win32 normaliz
%prm
dwFlags, lpASCIICharStr, cchASCIIChar, lpUnicodeCharStr, cchUnicodeChar
dwFlags : [int] Flags specifying conversion options. For detailed definitions, see the dwFlags parameter of IdnToAscii.
lpASCIICharStr : [wstr] Pointer to a string representing the Punycode encoding of an IDN or another internationalized label. This string must consist only of ASCII characters, and can include Punycode-encoded Unicode. The function decodes Punycode values to their UTF-16 values.
cchASCIIChar : [int] Count of characters in the input string indicated by lpASCIICharStr.
lpUnicodeCharStr : [wstr] Pointer to a buffer that receives a normal Unicode UTF-16 encoding equivalent to the Punycode value of the input string. Alternatively, the function can retrieve NULL for this parameter, if cchUnicodeChar set to 0. In this case, the function returns the size required for this buffer.
cchUnicodeChar : [int] Size, in characters, of the buffer indicated by lpUnicodeCharStr. The application can set the size to 0 to retrieve NULL in lpUnicodeCharStr and have the function return the required buffer size.
%inst
Converts the Punycode form of an internationalized domain name (IDN)
or another internationalized label to the normal Unicode UTF-16
encoding syntax.

[戻り値]
Returns the number of characters retrieved in lpUnicodeCharStr if
successful. The retrieved string is null-terminated only if the input
string is null-terminated. If the function succeeds and the value of
cchUnicodeChar is 0, the function returns the required size, in
characters including a terminating null character if it was part of
the input buffer. The function returns 0 if it does not succeed. To
get extended error information, the application can call
GetLastError, which can return one of the following error codes:
This doc was truncated.

[備考]
See Remarks for IdnToAscii.

