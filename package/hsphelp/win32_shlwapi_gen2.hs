; ============================================================
;   shlwapi.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
StrChrW
Searches a string for the first occurrence of a character that matches the specified character. The comparison is case-sensitive. (Unicode)
%group
Win32 shlwapi
%prm
pszStart, wMatch
pszStart : [wstr] Type: PTSTR The address of the string to be searched.
wMatch : [int] Type: TCHAR The character to be used for comparison.
%inst
Searches a string for the first occurrence of a character that
matches the specified character. The comparison is case-sensitive.
(Unicode)

[戻り値]
Type: PTSTR Returns the address of the first occurrence of the
character in the string if successful, or NULL otherwise.

[備考]
The comparison assumes pszStart points to the start of a
null-terminated string.
> [!NOTE] > The shlwapi.h header defines StrChr as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrChrIA
Searches a string for the first occurrence of a character that matches the specified character. The comparison is not case-sensitive. (ANSI)
%group
Win32 shlwapi
%prm
pszStart, wMatch
pszStart : [str] Type: PTSTR A pointer to the string to be searched.
wMatch : [int] Type: TCHAR The character to be used for comparison.
%inst
Searches a string for the first occurrence of a character that
matches the specified character. The comparison is not
case-sensitive. (ANSI)

[戻り値]
Type: PTSTR Returns the address of the first occurrence of the
character in the string if successful, or NULL otherwise.

[備考]
The comparison assumes pszStart points to the start of a
null-terminated string.
> [!NOTE] > The shlwapi.h header defines StrChrI as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrChrIW
Searches a string for the first occurrence of a character that matches the specified character. The comparison is not case-sensitive. (Unicode)
%group
Win32 shlwapi
%prm
pszStart, wMatch
pszStart : [wstr] Type: PTSTR A pointer to the string to be searched.
wMatch : [int] Type: TCHAR The character to be used for comparison.
%inst
Searches a string for the first occurrence of a character that
matches the specified character. The comparison is not
case-sensitive. (Unicode)

[戻り値]
Type: PTSTR Returns the address of the first occurrence of the
character in the string if successful, or NULL otherwise.

[備考]
The comparison assumes pszStart points to the start of a
null-terminated string.
> [!NOTE] > The shlwapi.h header defines StrChrI as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrCmpNA
Compares a specified number of characters from the beginning of two strings to determine if they are the same. The comparison is case-sensitive. The StrNCmp macro differs from this function in name only. (ANSI)
%group
Win32 shlwapi
%prm
psz1, psz2, nChar
psz1 : [str] Type: PCTSTR A pointer to the first null-terminated string to be compared.
psz2 : [str] Type: PCTSTR A pointer to the second null-terminated string to be compared.
nChar : [int] Type: int The number of characters from the beginning of each string to be compared.
%inst
Compares a specified number of characters from the beginning of two
strings to determine if they are the same. The comparison is
case-sensitive. The StrNCmp macro differs from this function in name
only. (ANSI)

[戻り値]
Type: int Returns zero if the strings are identical. Returns a
positive value if the first nChar characters of the string pointed to
by psz1 are greater than those from the string pointed to by psz2. It
returns a negative value if the first nChar characters of the string
pointed to by psz1 are less than those from the string pointed to by
psz2.

[備考]
> [!NOTE] > The shlwapi.h header defines StrCmpN as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrCmpNIA
Compares a specified number of characters from the beginning of two strings to determine if they are the same. The comparison is not case-sensitive. The StrNCmpI macro differs from this function in name only. (ANSI)
%group
Win32 shlwapi
%prm
psz1, psz2, nChar
psz1 : [str] Type: PCTSTR A pointer to the first null-terminated string to be compared.
psz2 : [str] Type: PCTSTR A pointer to the second null-terminated string to be compared.
nChar : [int] Type: int The number of characters from the beginning of each string to be compared.
%inst
Compares a specified number of characters from the beginning of two
strings to determine if they are the same. The comparison is not
case-sensitive. The StrNCmpI macro differs from this function in name
only. (ANSI)

[戻り値]
Type: int Returns zero if the strings are identical. Returns a
positive value if the first nChar characters of the string pointed to
by psz1 are greater than those from the string pointed to by psz2. It
returns a negative value if the first nChar characters of the string
pointed to by psz1 are less than those from the string pointed to by
psz2.

[備考]
> [!NOTE] > The shlwapi.h header defines StrCmpNI as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrCmpNIW
Compares a specified number of characters from the beginning of two strings to determine if they are the same. The comparison is not case-sensitive. The StrNCmpI macro differs from this function in name only. (Unicode)
%group
Win32 shlwapi
%prm
psz1, psz2, nChar
psz1 : [wstr] Type: PCTSTR A pointer to the first null-terminated string to be compared.
psz2 : [wstr] Type: PCTSTR A pointer to the second null-terminated string to be compared.
nChar : [int] Type: int The number of characters from the beginning of each string to be compared.
%inst
Compares a specified number of characters from the beginning of two
strings to determine if they are the same. The comparison is not
case-sensitive. The StrNCmpI macro differs from this function in name
only. (Unicode)

[戻り値]
Type: int Returns zero if the strings are identical. Returns a
positive value if the first nChar characters of the string pointed to
by psz1 are greater than those from the string pointed to by psz2. It
returns a negative value if the first nChar characters of the string
pointed to by psz1 are less than those from the string pointed to by
psz2.

[備考]
> [!NOTE] > The shlwapi.h header defines StrCmpNI as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrCmpNW
Compares a specified number of characters from the beginning of two strings to determine if they are the same. The comparison is case-sensitive. The StrNCmp macro differs from this function in name only. (Unicode)
%group
Win32 shlwapi
%prm
psz1, psz2, nChar
psz1 : [wstr] Type: PCTSTR A pointer to the first null-terminated string to be compared.
psz2 : [wstr] Type: PCTSTR A pointer to the second null-terminated string to be compared.
nChar : [int] Type: int The number of characters from the beginning of each string to be compared.
%inst
Compares a specified number of characters from the beginning of two
strings to determine if they are the same. The comparison is
case-sensitive. The StrNCmp macro differs from this function in name
only. (Unicode)

[戻り値]
Type: int Returns zero if the strings are identical. Returns a
positive value if the first nChar characters of the string pointed to
by psz1 are greater than those from the string pointed to by psz2. It
returns a negative value if the first nChar characters of the string
pointed to by psz1 are less than those from the string pointed to by
psz2.

[備考]
> [!NOTE] > The shlwapi.h header defines StrCmpN as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrRChrW
Searches a string for the last occurrence of a specified character. The comparison is case-sensitive. (Unicode)
%group
Win32 shlwapi
%prm
pszStart, pszEnd, wMatch
pszStart : [wstr] Type: PTSTR A pointer to the null-terminated string to be searched.
pszEnd : [wstr] Type: PCTSTR A pointer into the source string that defines the range of the search. Set pszEnd to point to a character in the string and the search will stop with the preceding character. Set pszEnd to NULL to search the entire string.
wMatch : [int] Type: TCHAR The character to search for.
%inst
Searches a string for the last occurrence of a specified character.
The comparison is case-sensitive. (Unicode)

[戻り値]
Type: PTSTR Returns a pointer to the last occurrence of the character
in the string, if successful, or NULL if not.

[備考]
The comparison assumes that pszEnd points to the end of the string.
> [!NOTE] > The shlwapi.h header defines StrRChr as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrRChrIA
Searches a string for the last occurrence of a specified character. The comparison is not case-sensitive. (ANSI)
%group
Win32 shlwapi
%prm
pszStart, pszEnd, wMatch
pszStart : [str] Type: PTSTR A pointer to the null-terminated string to be searched.
pszEnd : [str] Type: PCTSTR A pointer into the source string that defines the range of the search. Set pszEnd to point to a character in the string and the search will stop with the preceding character. Set pszEnd to NULL to search the entire string.
wMatch : [int] Type: TCHAR The character to search for.
%inst
Searches a string for the last occurrence of a specified character.
The comparison is not case-sensitive. (ANSI)

[戻り値]
Type: PTSTR Returns a pointer to the last occurrence of the character
in the string, if successful, or NULL if not.

[備考]
The comparison assumes that pszEnd points to the end of the string.
> [!NOTE] > The shlwapi.h header defines StrRChrI as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrRChrIW
Searches a string for the last occurrence of a specified character. The comparison is not case-sensitive. (Unicode)
%group
Win32 shlwapi
%prm
pszStart, pszEnd, wMatch
pszStart : [wstr] Type: PTSTR A pointer to the null-terminated string to be searched.
pszEnd : [wstr] Type: PCTSTR A pointer into the source string that defines the range of the search. Set pszEnd to point to a character in the string and the search will stop with the preceding character. Set pszEnd to NULL to search the entire string.
wMatch : [int] Type: TCHAR The character to search for.
%inst
Searches a string for the last occurrence of a specified character.
The comparison is not case-sensitive. (Unicode)

[戻り値]
Type: PTSTR Returns a pointer to the last occurrence of the character
in the string, if successful, or NULL if not.

[備考]
The comparison assumes that pszEnd points to the end of the string.
> [!NOTE] > The shlwapi.h header defines StrRChrI as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrRStrIA
Searches for the last occurrence of a specified substring within a string. The comparison is not case-sensitive. (ANSI)
%group
Win32 shlwapi
%prm
pszSource, pszLast, pszSrch
pszSource : [str] Type: PTSTR A pointer to a null-terminated source string.
pszLast : [str] Type: PCTSTR A pointer into the source string that defines the range of the search. Set pszLast to point to a character in the source string, and the search will stop with the preceding character. Set pszLast to NULL to search the entire source string.
pszSrch : [str] Type: PCTSTR A pointer to the substring to search for.
%inst
Searches for the last occurrence of a specified substring within a
string. The comparison is not case-sensitive. (ANSI)

[戻り値]
Type: PTSTR Returns the address of the last occurrence of the
substring if successful, or NULL otherwise.

[備考]
> [!NOTE] > The shlwapi.h header defines StrRStrI as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrRStrIW
Searches for the last occurrence of a specified substring within a string. The comparison is not case-sensitive. (Unicode)
%group
Win32 shlwapi
%prm
pszSource, pszLast, pszSrch
pszSource : [wstr] Type: PTSTR A pointer to a null-terminated source string.
pszLast : [wstr] Type: PCTSTR A pointer into the source string that defines the range of the search. Set pszLast to point to a character in the source string, and the search will stop with the preceding character. Set pszLast to NULL to search the entire source string.
pszSrch : [wstr] Type: PCTSTR A pointer to the substring to search for.
%inst
Searches for the last occurrence of a specified substring within a
string. The comparison is not case-sensitive. (Unicode)

[戻り値]
Type: PTSTR Returns the address of the last occurrence of the
substring if successful, or NULL otherwise.

[備考]
> [!NOTE] > The shlwapi.h header defines StrRStrI as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrStrW
Finds the first occurrence of a substring within a string. The comparison is case-sensitive. (StrStrW)
%group
Win32 shlwapi
%prm
pszFirst, pszSrch
pszFirst : [wstr] Type: PTSTR A pointer to the null-terminated string to search.
pszSrch : [wstr] Type: PCTSTR A pointer to the substring to search for.
%inst
Finds the first occurrence of a substring within a string. The
comparison is case-sensitive. (StrStrW)

[戻り値]
Type: PTSTR Returns the address of the first occurrence of the
matching substring if successful, or NULL otherwise.

[備考]
> [!NOTE] > The shlwapi.h header defines StrStr as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrStrIA
Finds the first occurrence of a substring within a string. The comparison is not case-sensitive. (ANSI)
%group
Win32 shlwapi
%prm
pszFirst, pszSrch
pszFirst : [str] Type: PTSTR A pointer to the null-terminated string being searched.
pszSrch : [str] Type: PCTSTR A pointer to the substring to search for.
%inst
Finds the first occurrence of a substring within a string. The
comparison is not case-sensitive. (ANSI)

[戻り値]
Type: PTSTR Returns the address of the first occurrence of the
matching substring if successful, or NULL otherwise.

[備考]
> [!NOTE] > The shlwapi.h header defines StrStrI as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
StrStrIW
Finds the first occurrence of a substring within a string. The comparison is not case-sensitive. (Unicode)
%group
Win32 shlwapi
%prm
pszFirst, pszSrch
pszFirst : [wstr] Type: PTSTR A pointer to the null-terminated string being searched.
pszSrch : [wstr] Type: PCTSTR A pointer to the substring to search for.
%inst
Finds the first occurrence of a substring within a string. The
comparison is not case-sensitive. (Unicode)

[戻り値]
Type: PTSTR Returns the address of the first occurrence of the
matching substring if successful, or NULL otherwise.

[備考]
> [!NOTE] > The shlwapi.h header defines StrStrI as an alias which
automatically selects the ANSI or Unicode version of this function
based on the definition of the UNICODE preprocessor constant. Mixing
usage of the encoding-neutral alias with code that not
encoding-neutral can lead to mismatches that result in compilation or
runtime errors. For more information, see [Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).

