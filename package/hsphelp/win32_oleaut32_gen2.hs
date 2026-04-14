; ============================================================
;   oleaut32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
SysFreeString
SysAllocString、SysAllocStringByteLen、SysReAllocString、SysAllocStringLen、SysReAllocStringLen で以前に割り当てられた文字列の割り当てを解除する。
%group
Win32 oleaut32
%prm
bstrString
bstrString : [int] 以前に割り当てられた文字列。NULL の場合、関数は単に戻る。
%inst

SysAllocString、SysAllocStringByteLen、SysReAllocString、SysAllocStringLen、SysReAllocStringLen
で以前に割り当てられた文字列の割り当てを解除する。


%index
BSTR_UserFree
RPC スタブファイルから呼び出されたとき、サーバー側のリソースを解放する。(BSTR_UserFree)
%group
Win32 oleaut32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
RPC スタブファイルから呼び出されたとき、サーバー側のリソースを解放する。(BSTR_UserFree)


%index
BSTR_UserFree64
RPC スタブファイルから呼び出されたとき、サーバー側のリソースを解放する。(BSTR_UserFree64)
%group
Win32 oleaut32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
RPC スタブファイルから呼び出されたとき、サーバー側のリソースを解放する。(BSTR_UserFree64)


%index
BSTR_UserMarshal
BSTR オブジェクトを RPC バッファへマーシャリングする。(BSTR_UserMarshal)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
BSTR オブジェクトを RPC バッファへマーシャリングする。(BSTR_UserMarshal)

[戻り値]
返される HRESULT 値から得られる値は S_OK である。


%index
BSTR_UserMarshal64
BSTR オブジェクトを RPC バッファへマーシャリングする。(BSTR_UserMarshal64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
BSTR オブジェクトを RPC バッファへマーシャリングする。(BSTR_UserMarshal64)

[戻り値]
返される HRESULT 値から得られる値は S_OK である。


%index
BSTR_UserSize
BSTR オブジェクトのワイヤサイズを計算し、そのハンドルとデータを取得する。(BSTR_UserSize)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
BSTR オブジェクトのワイヤサイズを計算し、そのハンドルとデータを取得する。(BSTR_UserSize)

[戻り値]
返される HRESULT 値から得られる値は S_OK である。


%index
BSTR_UserSize64
BSTR オブジェクトのワイヤサイズを計算し、そのハンドルとデータを取得する。(BSTR_UserSize64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
BSTR オブジェクトのワイヤサイズを計算し、そのハンドルとデータを取得する。(BSTR_UserSize64)

[戻り値]
返される HRESULT 値から得られる値は S_OK である。


%index
BSTR_UserUnmarshal
RPC バッファから BSTR オブジェクトをアンマーシャリングする。(BSTR_UserUnmarshal)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
RPC バッファから BSTR オブジェクトをアンマーシャリングする。(BSTR_UserUnmarshal)

[戻り値]
返される HRESULT 値から得られる値は次のいずれかである。
（以下省略）


%index
BSTR_UserUnmarshal64
RPC バッファから BSTR オブジェクトをアンマーシャリングする。(BSTR_UserUnmarshal64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
RPC バッファから BSTR オブジェクトをアンマーシャリングする。(BSTR_UserUnmarshal64)

[戻り値]
返される HRESULT 値から得られる値は次のいずれかである。
（以下省略）


%index
BstrFromVector
ベクタの各要素を BSTR の文字に割り当て、その BSTR を返す。
%group
Win32 oleaut32
%prm
psa, pbstr
psa : [var] BSTR に変換するベクタ。
pbstr : [var] ベクタの各要素が文字として割り当てられる BSTR。
%inst
ベクタの各要素を BSTR の文字に割り当て、その BSTR を返す。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
ClearCustData
カスタムデータ項目を保持していたメモリを解放する。
%group
Win32 oleaut32
%prm
pCustData
pCustData : [var] 解放するカスタムデータ項目。
%inst
カスタムデータ項目を保持していたメモリを解放する。


%index
CreateDispTypeInfo
IDispatch の実装で使用するための簡略化された型情報を作成する。
%group
Win32 oleaut32
%prm
pidata, lcid, pptinfo
pidata : [var] この型情報が記述するインターフェイスの記述。
lcid : [int] 型情報内で使用される名前のロケール識別子。
pptinfo : [var] 戻り時に、DispGetIDsOfNames および DispInvoke で使用するための型情報実装へのポインタ。
%inst
IDispatch の実装で使用するための簡略化された型情報を作成する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
公開するオブジェクトを記述する INTERFACEDATA 構造体と CreateDispTypeInfo
を使用すると、実行時に型情報を構築できる。この関数が返す型情報は、主に IDispatch
の実装を自動化するために設計されている。CreateDispTypeInfo
は「型記述インターフェイス」で説明されているすべての型情報を返すわけではない。引数 pidata
はインターフェイスの完全な記述ではない。ヘルプ情報、コメント、省略可能な引数、その他の文脈で有用な型情報は含まれない。したがって、オブジェクトに関する型情報を提供する推奨方法は、Object
Description Language (ODL) を使用してオブジェクトを記述し、Microsoft Interface
Definition Language (MIDL)
コンパイラを使用してそのオブジェクト記述をタイプライブラリにコンパイルすることである。タイプライブラリの型情報を使うには、CreateDispTypeInfo
の代わりに LoadTypeLib および GetTypeInfoOfGuid 関数を使用する。詳細は「型記述インターフェイス」を参照。


%index
CreateErrorInfo
汎用エラーオブジェクトのインスタンスを作成する。
%group
Win32 oleaut32
%prm
pperrinfo
pperrinfo : [var] システムが実装する汎用エラーオブジェクト。
%inst
汎用エラーオブジェクトのインスタンスを作成する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
この関数は汎用エラーオブジェクトへのポインタを返し、ICreateErrorInfo に対する QueryInterface
でその内容を設定するために使用できる。続いてその結果のオブジェクトを SetErrorInfo に渡せる。汎用エラーオブジェクトは
ICreateErrorInfo と IErrorInfo の両方を実装する。


%index
CreateStdDispatch
1 回の関数呼び出しで IDispatch インターフェイスの標準実装を作成する。これによりオートメーションを通じてオブジェクトを公開する処理が簡略化される。
%group
Win32 oleaut32
%prm
punkOuter, pvThis, ptinfo, ppunkStdDisp
punkOuter : [var] オブジェクトの IUnknown 実装。
pvThis : [intptr] 公開するオブジェクト。
ptinfo : [var] 公開されるオブジェクトを記述する型情報。
ppunkStdDisp : [var] IDispatch インターフェイスの QueryInterface 呼び出しを実装するオブジェクトのプライベート unknown。関数が失敗した場合、このポインタは null になる。
%inst
1 回の関数呼び出しで IDispatch
インターフェイスの標準実装を作成する。これによりオートメーションを通じてオブジェクトを公開する処理が簡略化される。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
オブジェクトを作成する際、IDispatch のメンバ関数を実装する代わりに CreateStdDispatch
を使用できる。ただし、CreateStdDispatch が作成する実装には次の制限がある。
（以下省略）


%index
CreateTypeLib
ICreateTypeLib インターフェイスをサポートする新しいオブジェクトインスタンスへのアクセスを提供する。
%group
Win32 oleaut32
%prm
syskind, szFile, ppctlib
syskind : [int] タイプライブラリを作成する対象のオペレーティングシステム。
szFile : [wstr] 作成するファイルの名前。
ppctlib : [var] ICreateTypeLib インターフェイス。
%inst
ICreateTypeLib インターフェイスをサポートする新しいオブジェクトインスタンスへのアクセスを提供する。

[戻り値]
（以下省略）

[備考]
CreateTypeLib は出力引数 (ppctlib) を、ICreateTypeLib
インターフェイスをサポートする新たに作成されたオブジェクトを指すように設定する。


%index
CreateTypeLib2
現在のファイル形式でタイプライブラリを作成する。
%group
Win32 oleaut32
%prm
syskind, szFile, ppctlib
syskind : [int] タイプライブラリを作成する対象のオペレーティングシステム。
szFile : [wstr] 作成するファイルの名前。
ppctlib : [var] ICreateTypeLib2 インターフェイス。
%inst
現在のファイル形式でタイプライブラリを作成する。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
DispCallFunc
Invoke のための低レベルヘルパで、カスタマイズされた Invoke にマシン非依存性を提供する。(DispCallFunc)
%group
Win32 oleaut32
%prm
pvInstance, oVft, cc, vtReturn, cActuals, prgvt, prgpvarg, pvargResult
pvInstance : [intptr] この型記述で記述されるインターフェイスのインスタンス。
oVft : [int] FUNC_VIRTUAL 関数の場合、VTBL 内のオフセットを指定する。
cc : [int] 呼び出し規約。CC_STDCALL などの CALLCONV 値のいずれか。
vtReturn : [int] 関数の戻り値の variant 型。void を表すには VT_EMPTY を使う。
cActuals : [int] 関数引数の数。
prgvt : [var] 関数引数の variant 型の配列。
prgpvarg : [var] 関数引数。
pvargResult : [var] 関数の結果。
%inst
Invoke のための低レベルヘルパで、カスタマイズされた Invoke にマシン非依存性を提供する。(DispCallFunc)

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
DispGetIDsOfNames
Invoke のための低レベルヘルパで、カスタマイズされた Invoke にマシン非依存性を提供する。(DispGetIDsOfNames)
%group
Win32 oleaut32
%prm
ptinfo, rgszNames, cNames, rgdispid
ptinfo : [var] インターフェイスの型情報。この型情報は 1 つのインターフェイスと言語コードに固有なので、この関数にインターフェイス識別子 (IID) や LCID を渡す必要はない。
rgszNames : [var] DISPPARAMS 構造体内で DispInvoke に渡されるのと同じ配列となり得る名前文字列の配列。cNames が 1 より大きい場合、最初の名前はメソッド名として解釈され、後続の名前はそのメソッドの引数として解釈される。
cNames : [int] rgszNames 内の要素数。
rgdispid : [var] この関数によって埋められる DISPID の配列。最初の ID はメソッド名に対応する。後続の ID はメソッドの引数として解釈される。
%inst
Invoke のための低レベルヘルパで、カスタマイズされた Invoke
にマシン非依存性を提供する。(DispGetIDsOfNames)

[戻り値]
（以下省略）


%index
DispGetParam
DISPPARAMS 構造体から引数を取得し、名前付き引数と位置引数の両方をチェックして、その引数を指定された型に強制変換する。
%group
Win32 oleaut32
%prm
pdispparams, position, vtTarg, pvarResult, puArgErr
pdispparams : [var] Invoke に渡された引数。
position : [int] 引数リスト内における引数の位置。DispGetParam は配列の末尾から開始するため、position が 0 の場合は配列内の最後の引数が返される。
vtTarg : [int] 引数を強制変換すべき型。
pvarResult : [var] 引数を渡し込む variant。
puArgErr : [var] 戻り時に、DISP_E_TYPEMISMATCH エラーを引き起こした引数のインデックス。このポインタは Invoke に返され、エラーを引き起こした DISPPARAMS 内の引数の位置を示す。
%inst
DISPPARAMS 構造体から引数を取得し、名前付き引数と位置引数の両方をチェックして、その引数を指定された型に強制変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
出力引数 pvarResult は有効な variant でなければならない。既存の内容は標準的な方法で解放される。variant
の内容は VariantFree で解放される。プロパティ put 操作の右辺を取得するために DispGetParam を使った場合、第
2 引数は DISPID_PROPERTYPUT であるべきである。例えば次のとおり。
（以下省略）


%index
DispInvoke
インターフェイスの型情報があれば、そのインターフェイスのメンバ関数を自動的に呼び出す。
%group
Win32 oleaut32
%prm
_this, ptinfo, dispidMember, wFlags, pparams, pvarResult, pexcepinfo, puArgErr
_this : [intptr] ptinfo によって記述される IDispatch インターフェイスの実装。
ptinfo : [var] インターフェイスを記述する型情報。
dispidMember : [int] 呼び出すメンバ。DISPID を取得するには GetIDsOfNames またはオブジェクトのドキュメントを使用する。
wFlags : [int] Invoke 呼び出しの文脈を記述するフラグ。
pparams : [var] 引数の配列、名前付き引数の引数 DISPID 配列、および各配列の要素数を含む構造体へのポインタ。
pvarResult : [var] 結果の格納先へのポインタ。呼び出し元が結果を期待しない場合は Null。DISPATCH_PROPERTYPUT または DISPATCH_PROPERTYPUTREF が指定されている場合、この引数は無視される。
pexcepinfo : [var] 例外情報を含む構造体へのポインタ。DISP_E_EXCEPTION が返される場合、この構造体は埋められるべきである。
puArgErr : [var] エラーを持つ最初の引数の rgvarg 内インデックス。引数は pdispparams->rgvarg に逆順で格納されるため、最初の引数は配列内で最も大きいインデックスを持つ。この引数は戻り値が DISP_E_TYPEMISMATCH または DISP_E_PARAMNOTFOUND の場合にのみ返される。
%inst
インターフェイスの型情報があれば、そのインターフェイスのメンバ関数を自動的に呼び出す。

[戻り値]
（以下省略）

[備考]
引数 _this は、呼び出しが委譲されるインターフェイスの実装へのポインタである。DispInvoke
はスタックフレームを構築し、標準的な強制変換規則を用いて引数を変換し、それらをスタックにプッシュしてから VTBL
内の正しいメンバ関数を呼び出す。


%index
DosDateTimeToVariantTime
MS-DOS 表現の時刻を、variant に格納される日付と時刻の表現へ変換する。
%group
Win32 oleaut32
%prm
wDosDate, wDosTime, pvtime
wDosDate : [int] 変換する MS-DOS 日付。MS-DOS 日付の有効範囲は 1980 年 1 月 1 日から 2099 年 12 月 31 日までである。
wDosTime : [int] 変換する MS-DOS 時刻。
pvtime : [var] 変換後の時刻。
%inst
MS-DOS 表現の時刻を、variant に格納される日付と時刻の表現へ変換する。

[戻り値]
成功した場合は TRUE を返し、それ以外の場合は FALSE を返す。

[備考]
MS-DOS はファイルの日付と時刻をパックされた 16 ビット値として記録する。MS-DOS の日付は次の形式を持つ。
（以下省略）


%index
GetActiveObject
OLE に登録されている実行中オブジェクトへのポインタを取得する。
%group
Win32 oleaut32
%prm
rclsid, pvReserved, ppunk
rclsid : [var] OLE 登録データベースから取得される、アクティブオブジェクトのクラス識別子 (CLSID)。
pvReserved : [intptr] 将来の使用のために予約されている。null でなければならない。
ppunk : [var] 要求されたアクティブオブジェクト。
%inst
OLE に登録されている実行中オブジェクトへのポインタを取得する。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
GetAltMonthNames
二次的な (代替の) 月名を取得する。
%group
Win32 oleaut32
%prm
lcid, prgp
lcid : [int] 代替月名の取得に使うロケール識別子。
prgp : [var] 代替月名を含む文字列へのポインタの配列。
%inst
二次的な (代替の) 月名を取得する。

[戻り値]
成功した場合は TRUE を返し、それ以外の場合は FALSE を返す。

[備考]
ヒジュラ暦、ポーランド語、ロシア語の代替月名で有用である。


%index
GetErrorInfo
現在の論理スレッドで以前に SetErrorInfo によって設定されたエラー情報ポインタを取得する。
%group
Win32 oleaut32
%prm
dwReserved, pperrinfo
dwReserved : [int] 将来の使用のために予約されている。0 でなければならない。
pperrinfo : [var] エラーオブジェクト。
%inst
現在の論理スレッドで以前に SetErrorInfo によって設定されたエラー情報ポインタを取得する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
この関数は、現在の論理スレッドで最も最近設定された IErrorInfo
ポインタへのポインタを返す。エラーオブジェクトの所有権は呼び出し元へ移転され、スレッドのエラー状態はクリアされる。プロキシ/スタブを経由する
COM 呼び出しは、呼び出し元スレッドの既存のエラーオブジェクトをクリアする。呼び出される側のオブジェクトは、SetErrorInfo
を呼び出した後、戻る前にそのような呼び出しを行ってはならない。呼び出し元は、呼び出しから戻った後、GetErrorInfo
を呼び出す前にそのような呼び出しを行ってはならない。経験則として、インターフェイスメソッドは SetErrorInfo
を呼び出した後できるだけ早く戻り、呼び出し元は呼び出しから戻った後できるだけ早く GetErrorInfo を呼び出すべきである。


%index
GetRecordInfoFromGuids
タイプライブラリをロードせずに型情報の GUID を渡して、UDT に対する IRecordInfo インターフェイスへのポインタを返す。
%group
Win32 oleaut32
%prm
rGuidTypeLib, uVerMajor, uVerMinor, lcid, rGuidTypeInfo, ppRecInfo
rGuidTypeLib : [var] UDT を含むタイプライブラリの GUID。
uVerMajor : [int] UDT のタイプライブラリのメジャーバージョン番号。
uVerMinor : [int] UDT のタイプライブラリのマイナーバージョン番号。
lcid : [int] 呼び出し元のロケール ID。
rGuidTypeInfo : [var] UDT を記述する typeinfo の GUID。
ppRecInfo : [var] IRecordInfo インターフェイス。
%inst
タイプライブラリをロードせずに型情報の GUID を渡して、UDT に対する IRecordInfo インターフェイスへのポインタを返す。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
IRecordInfo へのポインタは、GUID とバージョン番号を書き出すことでシリアライズし、その情報を読み込んで
GetRecordInfoFromGuids に渡すことでデシリアライズできる。


%index
GetRecordInfoFromTypeInfo
UDT の型情報を渡して、その UDT の IRecordInfo インターフェイスへのポインタを返す。
%group
Win32 oleaut32
%prm
pTypeInfo, ppRecInfo
pTypeInfo : [var] レコードの型情報。
ppRecInfo : [var] IRecordInfo インターフェイス。
%inst
UDT の型情報を渡して、その UDT の IRecordInfo インターフェイスへのポインタを返す。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
LHashValOfNameSys
名前のハッシュ値を計算する。(LHashValOfNameSys)
%group
Win32 oleaut32
%prm
syskind, lcid, szName
syskind : [int] 対象オペレーティングシステムの SYSKIND。
lcid : [int] 文字列の LCID。
szName : [wstr] ハッシュ値を計算する文字列。
%inst
名前のハッシュ値を計算する。(LHashValOfNameSys)

[戻り値]
渡された名前を表すハッシュ値。


%index
LPSAFEARRAY_UserFree
RPC スタブファイルから呼び出されたとき、サーバー側のリソースを解放する。(LPSAFEARRAY_UserFree)
%group
Win32 oleaut32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
RPC スタブファイルから呼び出されたとき、サーバー側のリソースを解放する。(LPSAFEARRAY_UserFree)


%index
LPSAFEARRAY_UserFree64
RPC スタブファイルから呼び出されたとき、サーバー側のリソースを解放する。(LPSAFEARRAY_UserFree64)
%group
Win32 oleaut32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
RPC スタブファイルから呼び出されたとき、サーバー側のリソースを解放する。(LPSAFEARRAY_UserFree64)


%index
LPSAFEARRAY_UserMarshal
クライアントまたはサーバー側で、指定された SAFEARRAY オブジェクトからユーザーの RPC バッファへデータをマーシャリングする。(LPSAFEARRAY_UserMarshal)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
クライアントまたはサーバー側で、指定された SAFEARRAY オブジェクトからユーザーの RPC
バッファへデータをマーシャリングする。(LPSAFEARRAY_UserMarshal)

[戻り値]
返される HRESULT 値から得られる値は次のいずれかである。
（以下省略）


%index
LPSAFEARRAY_UserMarshal64
クライアントまたはサーバー側で、指定された SAFEARRAY オブジェクトからユーザーの RPC バッファへデータをマーシャリングする。(LPSAFEARRAY_UserMarshal64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
クライアントまたはサーバー側で、指定された SAFEARRAY オブジェクトからユーザーの RPC
バッファへデータをマーシャリングする。(LPSAFEARRAY_UserMarshal64)

[戻り値]
返される HRESULT 値から得られる値は次のいずれかである。
（以下省略）


%index
LPSAFEARRAY_UserSize
SAFEARRAY オブジェクトのワイヤサイズを計算し、そのハンドルとデータを取得する。(LPSAFEARRAY_UserSize)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
SAFEARRAY オブジェクトのワイヤサイズを計算し、そのハンドルとデータを取得する。(LPSAFEARRAY_UserSize)

[戻り値]
返される HRESULT 値から得られる値は S_OK である。


%index
LPSAFEARRAY_UserSize64
SAFEARRAY オブジェクトのワイヤサイズを計算し、そのハンドルとデータを取得する。(LPSAFEARRAY_UserSize64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
SAFEARRAY オブジェクトのワイヤサイズを計算し、そのハンドルとデータを取得する。(LPSAFEARRAY_UserSize64)

[戻り値]
返される HRESULT 値から得られる値は S_OK である。


%index
LPSAFEARRAY_UserUnmarshal
RPC バッファから SAFEARRAY オブジェクトをアンマーシャリングする。(LPSAFEARRAY_UserUnmarshal)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
RPC バッファから SAFEARRAY オブジェクトをアンマーシャリングする。(LPSAFEARRAY_UserUnmarshal)

[戻り値]
返される HRESULT 値から得られる値は次のいずれかである。
（以下省略）


%index
LPSAFEARRAY_UserUnmarshal64
RPC バッファから SAFEARRAY オブジェクトをアンマーシャリングする。(LPSAFEARRAY_UserUnmarshal64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
RPC バッファから SAFEARRAY オブジェクトをアンマーシャリングする。(LPSAFEARRAY_UserUnmarshal64)

[戻り値]
返される HRESULT 値から得られる値は次のいずれかである。
（以下省略）


%index
LoadRegTypeLib
レジストリ情報を使ってタイプライブラリをロードする。
%group
Win32 oleaut32
%prm
rguid, wVerMajor, wVerMinor, lcid, pptlib
rguid : [var] ライブラリの GUID。
wVerMajor : [int] ライブラリのメジャーバージョン。
wVerMinor : [int] ライブラリのマイナーバージョン。
lcid : [int] ライブラリの国別言語コード。
pptlib : [var] ロードされたタイプライブラリ。
%inst
レジストリ情報を使ってタイプライブラリをロードする。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
LoadRegTypeLib 関数はファイルのロードを LoadTypeLib に委譲する。
LoadRegTypeLib は要求されたバージョン番号をシステムレジストリで見つかったものと比較し、次のいずれかの動作を行う。
（以下省略）


%index
LoadTypeLib
タイプライブラリをロードして登録する。
%group
Win32 oleaut32
%prm
szFile, pptlib
szFile : [wstr] メソッドがタイプライブラリのロードを試みるファイルの名前。
pptlib : [var] ロードされたタイプライブラリ。
%inst
タイプライブラリをロードして登録する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
LoadTypeLib 関数は、指定されたファイルに格納されたタイプライブラリ (通常 MkTypLib で作成される)
をロードする。szFile がパスを伴わずファイル名のみを指定する場合、LoadTypeLib
はそのファイルを検索し、次のように処理を進める。
（以下省略）


%index
LoadTypeLibEx
タイプライブラリをロードし、(オプションで) システムレジストリに登録する。
%group
Win32 oleaut32
%prm
szFile, regkind, pptlib
szFile : [wstr] タイプライブラリのファイル。
regkind : [int] DEFAULT、REGISTER、NONE のフラグに基づいて、タイプライブラリに対して実行する登録の種類を指定する。REGKIND_DEFAULT は単に LoadTypeLib を呼び出し、LoadTypeLib の登録規則に基づいて登録が行われる。REGKIND_NONE は登録処理を有効にせずに LoadTypeLib を呼び出す。REGKIND_REGISTER は LoadTypeLib に続いて RegisterTypeLib を呼び出し、タイプライブラリを登録する。タイプライブラリの登録を解除するには UnRegisterTypeLib を使用する。
pptlib : [var] タイプライブラリ。
%inst
タイプライブラリをロードし、(オプションで) システムレジストリに登録する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
プログラマがタイプライブラリをロードすべきかどうかを指定できるようにする。


%index
OaBuildVersion
OLE オートメーションのビルドバージョンを取得する。
%group
Win32 oleaut32
%prm

%inst
OLE オートメーションのビルドバージョンを取得する。

[戻り値]
ビルド番号。


%index
OaEnablePerUserTLibRegistration
Windows Vista Service Pack 1 (SP1)、Windows Server 2008、およびそれ以降のオペレーティングシステムバージョン下で、RegisterTypeLib 関数が既定のレジストリマッピングをオーバーライドできるようにする。
%group
Win32 oleaut32
%prm

%inst
Windows Vista Service Pack 1 (SP1)、Windows Server
2008、およびそれ以降のオペレーティングシステムバージョン下で、RegisterTypeLib
関数が既定のレジストリマッピングをオーバーライドできるようにする。

[備考]
次のシナリオを考える。Windows Vista SP1
以降を実行しているコンピュータでアプリケーションを実行している。アプリケーション内で HKEY_CLASSES_ROOT
レジストリサブツリーをオーバーライドし、別のレジストリサブツリーにマップしている (例えば HKEY_CLASSES_ROOT を
HKEY_CURRENT_USER にマップした場合)。続いて RegisterTypeLib
を呼び出してタイプライブラリの登録を試みると、「access denied」エラーメッセージを受け取る。さらに
RegisterTypeLib は TYPE_E_REGISTRYACCESS (0x8002801c) 値を返す。
この問題は、ユーザーアカウント制御 (UAC) が有効で、アプリケーションが制限付きユーザーアカウントの下で実行されている場合に発生する。
この問題は次の 2 つのいずれかの方法で解決できる。
（以下省略）


%index
OleCreateFontIndirect
FONTDESC 構造体に含まれるフォントプロパティの初期記述を使用して、標準フォントオブジェクトを作成し初期化する。
%group
Win32 oleaut32
%prm
lpFontDesc, riid, lplpvObj
lpFontDesc : [var] フォントの初期状態を含む、呼び出し元が割り当てた FONTDESC 構造体のアドレス。この値は NULL であってはならない。
riid : [var] lplpvObj で返すインターフェイスポインタの種類を記述するインターフェイスの識別子への参照。
lplpvObj : [var] riid で要求されたインターフェイスポインタを受け取るポインタ変数のアドレス。成功して戻った時、この引数は新しく作成されたフォントオブジェクトに対する要求されたインターフェイスポインタを含む。成功した場合、新しいオブジェクトが不要になった時、呼び出し元はこのインターフェイスポインタを通じて Release を呼び出す責任を負う。失敗した場合は値が NULL に設定される。
%inst
FONTDESC 構造体に含まれるフォントプロパティの初期記述を使用して、標準フォントオブジェクトを作成し初期化する。

[戻り値]
成功時、この関数は S_OK を返す。その他の可能な値は次のとおりである。
（以下省略）


%index
OleCreatePictureIndirect
PICTDESC 構造体に従って初期化された新しいピクチャオブジェクトを作成する。
%group
Win32 oleaut32
%prm
lpPictDesc, riid, fOwn, lplpvObj
lpPictDesc : [var] ピクチャの初期状態を含む、呼び出し元が割り当てた構造体へのポインタ。IPersistStream::Load を介してピクチャを初期化する必要がある場合、未初期化のオブジェクトを作成するために指定する構造体は NULL でも構わない。
riid : [var] lplpvObj で返すインターフェイスポインタの種類を記述するインターフェイスの識別子への参照。
fOwn : [int] TRUE の場合、ピクチャオブジェクトは破棄される時に自身のピクチャも破棄する。FALSE の場合、ピクチャの破棄は呼び出し元の責任となる。
lplpvObj : [var] riid で要求されたインターフェイスポインタを受け取るポインタ変数のアドレス。成功して戻った時、この引数は新しく作成されたオブジェクトに対する要求されたインターフェイスポインタを含む。呼び出しが成功した場合、新しいオブジェクトが不要になった時、呼び出し元はこのインターフェイスポインタを通じて Release を呼び出す責任を負う。呼び出しが失敗した場合は値が NULL に設定される。
%inst
PICTDESC 構造体に従って初期化された新しいピクチャオブジェクトを作成する。

[戻り値]
成功時、この関数は S_OK を返す。その他の可能な値は次のとおりである。
（以下省略）

[備考]
fOwn 引数は、ピクチャがそれに含まれる GDI
ピクチャハンドルを所有するかどうかを示し、所有する場合、ピクチャオブジェクトは自身が破棄される時にピクチャも破棄する。関数は呼び出し元が
riid 引数で指定した新しいピクチャオブジェクトへのインターフェイスポインタを返す。QueryInterface
はこの呼び出しに組み込まれている。返されたインターフェイスポインタを通じて Release を呼び出すのは呼び出し元の責任である。


%index
OleCreatePropertyFrame
新しいプロパティフレーム、すなわち親が hwndOwner で、親ウィンドウ内の点 (x,y) に配置され、キャプションが lpszCaption であるプロパティシートダイアログボックスを呼び出す。
%group
Win32 oleaut32
%prm
hwndOwner, x, y, lpszCaption, cObjects, ppUnk, cPages, pPageClsID, lcid, dwReserved, pvReserved
hwndOwner : [intptr] 結果のプロパティシートダイアログボックスの親ウィンドウへのハンドル。
x : [int] 予約。hwndOwner に対するダイアログボックスの水平位置。
y : [int] 予約。hwndOwner に対するダイアログボックスの垂直位置。
lpszCaption : [wstr] ダイアログボックスのキャプションに使用される文字列へのポインタ。
cObjects : [int] ppUnk で渡されるオブジェクトポインタの数。
ppUnk : [var] このプロパティシートが呼び出される対象オブジェクトの IUnknown ポインタの配列。配列内の要素数は cObjects で指定する。これらのポインタは IPropertyPage::SetObjects を介して各プロパティページに渡される。
cPages : [int] pPageCIsID で指定されるプロパティページの数。
pPageClsID : [var] プロパティシートに表示する各プロパティページの CLSID を含む、サイズ cPages の配列。
lcid : [int] プロパティシートに使用するロケール識別子。プロパティページは IPropertyPageSite::GetLocaleID を介してこの識別子を取得できる。
dwReserved : [int] 将来の使用のために予約されている。0 でなければならない。
pvReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
%inst
新しいプロパティフレーム、すなわち親が hwndOwner で、親ウィンドウ内の点 (x,y) に配置され、キャプションが
lpszCaption であるプロパティシートダイアログボックスを呼び出す。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG、E_OUTOFMEMORY、E_UNEXPECTED に加えて、次の値もサポートする。
（以下省略）

[備考]
表示するプロパティページは pPageClsID で識別され、これは cPages 個の CLSID
値の配列である。このプロパティシートが影響するオブジェクトは ppUnk で識別され、これは IUnknown ポインタを含むサイズ
cObjects の配列である。この関数は常にモーダルダイアログボックスを作成し、ダイアログが閉じられるまで戻らない。


%index
OleCreatePropertyFrameIndirect
OleCreatePropertyFrame を呼び出す時のように引数を個別に指定するのではなく、引数を含む構造体 (OCPFIPARAMS) に基づいてプロパティフレーム、すなわちプロパティシートダイアログボックスを作成する。
%group
Win32 oleaut32
%prm
lpParams
lpParams : [var] ダイアログボックスの作成引数を含む、呼び出し元が割り当てた構造体へのポインタ。
%inst
OleCreatePropertyFrame を呼び出す時のように引数を個別に指定するのではなく、引数を含む構造体
(OCPFIPARAMS) に基づいてプロパティフレーム、すなわちプロパティシートダイアログボックスを作成する。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG、E_OUTOFMEMORY、E_UNEXPECTED に加えて、次の値もサポートする。
（以下省略）

[備考]
cbStructSize (構造体のサイズ) と dispIDInitialProperty を除いて、OCPFIPARAMS
構造体のすべてのメンバは OleCreatePropertyFrame の引数と同じ意味を持つ。dispIDInitialProperty
が DISPID_UNKNOWN の場合、2 つの関数の動作は同一である。IPerPropertyBrowsing および
IPropertyPage2 と連携して、dispIDInitialProperty
は呼び出し元がダイアログボックスの表示時に強調表示する 1 つのプロパティを指定できるようにする。この機能は
OleCreatePropertyFrame
では利用できない。プロパティフレームは、最初に表示するページとプロパティを決定するため、次の処理を行う。
（以下省略）


%index
OleIconToCursor
アイコンをカーソルに変換する。
%group
Win32 oleaut32
%prm
hinstExe, hIcon
hinstExe : [intptr] この引数は無視される。
hIcon : [intptr] 変換するアイコンへのハンドル。
%inst
アイコンをカーソルに変換する。

[戻り値]
新しいカーソルオブジェクトへのハンドルを返す。呼び出し元はこのカーソルを DestroyCursor
関数で削除する責任を負う。変換が完了できなかった場合、戻り値は NULL である。

[備考]
この関数は CopyCursor 関数を呼び出す。


%index
OleLoadPicture
新しいピクチャオブジェクトを作成し、ストリームの内容から初期化する。これは、OleCreatePictureIndirect を最初の引数として NULL を指定して呼び出した後に IPersistStream::Load を呼び出すのと同等である。(OleLoadPicture)
%group
Win32 oleaut32
%prm
lpstream, lSize, fRunmode, riid, lplpvObj
lpstream : [var] ピクチャのデータを含むストリームへのポインタ。
lSize : [int] ストリームから読み取るバイト数。ストリーム全体を読み取る場合は 0。
fRunmode : [int] KeepOriginalFormat プロパティの初期値の反対。TRUE の場合、KeepOriginalFormat は FALSE に設定され、その逆も同様。
riid : [var] ppvObj で返すインターフェイスポインタの種類を記述するインターフェイスの識別子への参照。
lplpvObj : [var] riid で要求されたインターフェイスポインタを受け取るポインタ変数のアドレス。成功して戻った時、*ppvObj はモニカで識別されるオブジェクトのストレージ上で要求されたインターフェイスポインタを含む。*ppvObj が NULL でない場合、この関数はインターフェイスに対して IUnknown::AddRef を呼び出す。IUnknown::Release を呼び出すのは呼び出し元の責任である。エラーが発生した場合、*ppvObj は NULL に設定される。
%inst
新しいピクチャオブジェクトを作成し、ストリームの内容から初期化する。これは、OleCreatePictureIndirect
を最初の引数として NULL を指定して呼び出した後に IPersistStream::Load
を呼び出すのと同等である。(OleLoadPicture)

[戻り値]
成功時、この関数は S_OK を返す。その他の可能な値は次のとおりである。
（以下省略）

[備考]
ストリームは BMP (ビットマップ)、WMF (メタファイル)、または ICO (アイコン)
形式でなければならない。OleLoadPicture を使用して作成されたピクチャオブジェクトは、常に内部リソースの所有権を持つ
(fOwn==TRUE が暗黙に設定される)。


%index
OleLoadPictureEx
新しいピクチャオブジェクトを作成し、ストリームの内容から初期化する。これは、OleCreatePictureIndirect を最初の引数として NULL を指定して呼び出した後に IPersistStream::Load を呼び出すのと同等である。(OleLoadPictureEx)
%group
Win32 oleaut32
%prm
lpstream, lSize, fRunmode, riid, xSizeDesired, ySizeDesired, dwFlags, lplpvObj
lpstream : [var] ピクチャのデータを含むストリームへのポインタ。
lSize : [int] ストリームから読み取るバイト数。ストリーム全体を読み取る場合は 0。
fRunmode : [int] KeepOriginalFormat プロパティの初期値の反対。TRUE の場合、KeepOriginalFormat は FALSE に設定され、その逆も同様。
riid : [var] ppvObj で返すインターフェイスポインタの種類を記述するインターフェイスの識別子への参照。
xSizeDesired : [int] アイコンまたはカーソルの希望幅。有効な値は 16、32、48。両方のサイズ引数に LP_DEFAULT を渡すとシステム既定のサイズを使用する。
ySizeDesired : [int] アイコンまたはカーソルの希望高さ。有効な値は 16、32、48。両方のサイズ引数に LP_DEFAULT を渡すとシステム既定のサイズを使用する。
dwFlags : [int] アイコンまたはカーソルの希望色深度。値は LP_MONOCHROME (モノクロ)、LP_VGACOLOR (16 色)、LP_COLOR (256 色)、または LP_DEFAULT (現在の表示に最適な深度を選択)。
lplpvObj : [var] riid で要求されたインターフェイスポインタを受け取るポインタ変数のアドレス。成功して戻った時、*ppvObj はモニカで識別されるオブジェクトのストレージ上で要求されたインターフェイスポインタを含む。*ppvObj が NULL でない場合、この関数はインターフェイスに対して IUnknown::AddRef を呼び出す。IUnknown::Release を呼び出すのは呼び出し元の責任である。エラーが発生した場合、*ppvObj は NULL に設定される。
%inst
新しいピクチャオブジェクトを作成し、ストリームの内容から初期化する。これは、OleCreatePictureIndirect
を最初の引数として NULL を指定して呼び出した後に IPersistStream::Load
を呼び出すのと同等である。(OleLoadPictureEx)

[戻り値]
成功時、この関数は S_OK を返す。その他の可能な値は次のとおりである。
（以下省略）

[備考]
ストリームは BMP (ビットマップ)、WMF (メタファイル)、または ICO (アイコン)
形式でなければならない。OleLoadPictureEx を使用して作成されたピクチャオブジェクトは、常に内部リソースの所有権を持つ
(fOwn==TRUE が暗黙に設定される)。アイコンまたはカーソルサイズの指定を可能にすることに加えて、OleLoadPictureEx
はカラーカーソルのロードもサポートする。


%index
OleLoadPictureFile
ディスク上のピクチャファイルから IPictureDisp オブジェクトを作成する。
%group
Win32 oleaut32
%prm
varFileName, lplpdispPicture
varFileName : [var] ロードするピクチャファイルのパスと名前。
lplpdispPicture : [var] IPictureDisp オブジェクトへのポインタを受け取る場所。
%inst
ディスク上のピクチャファイルから IPictureDisp オブジェクトを作成する。

[戻り値]
このメソッドは標準的な COM エラーコードに加えて次の値を返す。
（以下省略）

[備考]
認識されるグラフィック形式には bitmap (.bmp)、JPEG (.jpg)、GIF (.gif)、PGN (.png)
ファイルが含まれる。


%index
OleLoadPictureFileEx
ファイルからピクチャをロードする。
%group
Win32 oleaut32
%prm
varFileName, xSizeDesired, ySizeDesired, dwFlags, lplpdispPicture
varFileName : [var] ロードするピクチャファイルのパスと名前。
xSizeDesired : [int] ピクチャを表示する際の希望幅。
ySizeDesired : [int] ピクチャを表示する際の希望高さ。
dwFlags : [int] アイコンまたはカーソルの希望色深度。希望サイズと併せて、最も一致する画像を選択するために使用される。
lplpdispPicture : [var] ピクチャへのポインタを受け取る場所。
%inst
ファイルからピクチャをロードする。

[戻り値]
このメソッドは標準的な COM エラーコードに加えて次の値を返す。
（以下省略）

[備考]
認識されるグラフィック形式には bitmap (.bmp)、JPEG (.jpg)、GIF (.gif)、PGN (.png)
ファイルが含まれる。


%index
OleLoadPicturePath
新しいピクチャオブジェクトを作成し、ストリームの内容から初期化する。これは OleCreatePictureIndirect(NULL, ...) を呼び出した後に IPersistStream::Load を呼び出すのと同等である。
%group
Win32 oleaut32
%prm
szURLorPath, punkCaller, dwReserved, clrReserved, riid, ppvRet
szURLorPath : [wstr] 開きたいファイルへのパスまたは URL。
punkCaller : [var] COM 集約のために IUnknown を指す。
dwReserved : [int] 予約。
clrReserved : [int] 透明として予約したい色。
riid : [var] ppvRet で返すインターフェイスポインタの種類を記述するインターフェイスの識別子への参照。
ppvRet : [var] riid で要求されたインターフェイスポインタを受け取るポインタ変数のアドレス。成功して戻った時、*ppvRet はモニカで識別されるオブジェクトのストレージ上で要求されたインターフェイスポインタを含む。*ppvRet が NULL でない場合、この関数はインターフェイスに対して IUnknown::AddRef を呼び出す。IUnknown::Release を呼び出すのは呼び出し元の責任である。エラーが発生した場合、*ppvRet は NULL に設定される。
%inst
新しいピクチャオブジェクトを作成し、ストリームの内容から初期化する。これは OleCreatePictureIndirect(NULL,
...) を呼び出した後に IPersistStream::Load を呼び出すのと同等である。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY、E_UNEXPECTED に加えて、次の値もサポートする。
（以下省略）

[備考]
ストリームは BMP (ビットマップ)、JPEG、WMF (メタファイル)、ICO (アイコン)、または GIF 形式でなければならない。


%index
OleSavePictureFile
ピクチャをファイルに保存する。
%group
Win32 oleaut32
%prm
lpdispPicture, bstrFileName
lpdispPicture : [var] IPictureDisp ピクチャオブジェクトを指す。
bstrFileName : [int] ピクチャを保存するファイルの名前。
%inst
ピクチャをファイルに保存する。

[戻り値]
このメソッドは標準的な COM エラーコードに加えて次の値を返す。
（以下省略）


%index
OleTranslateColor
OLE_COLOR 型を COLORREF に変換する。
%group
Win32 oleaut32
%prm
clr, hpal, lpcolorref
clr : [int] COLORREF に変換する OLE カラー。
hpal : [intptr] 変換の基礎となるパレット。
lpcolorref : [var] 変換された COLORREF 結果を受け取る、呼び出し元の変数へのポインタ。この引数が NULL の場合、呼び出し元は変換された色が存在することの確認だけを望んでいることを意味する。
%inst
OLE_COLOR 型を COLORREF に変換する。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG、E_UNEXPECTED に加えて、次の値もサポートする。
（以下省略）

[備考]
次の表で色変換について説明する。
（以下省略）


%index
QueryPathOfRegTypeLib
登録されたタイプライブラリのパスを取得する。
%group
Win32 oleaut32
%prm
guid, wMaj, wMin, lcid, lpbstrPathName
guid : [var] ライブラリの GUID。
wMaj : [int] ライブラリのメジャーバージョン番号。
wMin : [int] ライブラリのマイナーバージョン番号。
lcid : [int] ライブラリの国別言語コード。
lpbstrPathName : [var] タイプライブラリ名。
%inst
登録されたタイプライブラリのパスを取得する。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
レジストリでタイプライブラリに対して指定されている完全修飾ファイル名を返す。呼び出し元は渡される BSTR
を割り当て、使用後に解放しなければならない。


%index
RegisterActiveObject
オブジェクトをそのクラスのアクティブオブジェクトとして登録する。
%group
Win32 oleaut32
%prm
punk, rclsid, dwFlags, pdwRegister
punk : [var] アクティブオブジェクト。
rclsid : [var] アクティブオブジェクトの CLSID。
dwFlags : [int] オブジェクトの登録を制御するフラグ。指定可能な値は ACTIVEOBJECT_STRONG と ACTIVEOBJECT_WEAK。
pdwRegister : [var] ハンドルを受け取る。このハンドルはオブジェクトのアクティブ状態を終了するために RevokeActiveObject に渡さなければならない。
%inst
オブジェクトをそのクラスのアクティブオブジェクトとして登録する。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
RegisterActiveObject 関数は、punk が指すオブジェクトを rclsid
で示されるクラスのアクティブオブジェクトとして登録する。登録により、オブジェクトは OLE のランニングオブジェクトテーブル (ROT)
に列挙される。これはコンピュータ上で現在実行中のオブジェクトを追跡するグローバルにアクセス可能な検索テーブルである
(ランニングオブジェクトテーブルの詳細は COM プログラマーズリファレンスを参照)。dwFlags
引数は登録の強度または弱さを指定し、これがオブジェクトのシャットダウン方法に影響する。一般に ActiveX
オブジェクトは次のように動作すべきである。
（以下省略）


%index
RegisterTypeLib
タイプライブラリに関する情報をシステムレジストリに追加する。
%group
Win32 oleaut32
%prm
ptlib, szFullPath, szHelpDir
ptlib : [var] タイプライブラリ。
szFullPath : [wstr] タイプライブラリの完全修飾パス指定。
szHelpDir : [wstr] 登録されるライブラリのヘルプファイルが見つかるディレクトリ。この引数は null でも構わない。
%inst
タイプライブラリに関する情報をシステムレジストリに追加する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
この関数はアプリケーションの初期化時にアプリケーションのタイプライブラリを正しく登録するために使用できる。RegisterTypeLib
がタイプライブラリを登録するために呼び出される時、マイナーとメジャーの両方のバージョン番号は 16 進で登録される。
タイプライブラリキー下に完全なレジストリエントリを埋めることに加えて、RegisterTypeLib は各 dispinterface
とオートメーション互換インターフェイス (デュアルインターフェイスを含む)
のエントリも追加する。これらのインスタンスを作成するためにはこの情報が必要である。コクラスは登録されない (つまり
RegisterTypeLib はコクラスの CLSID キーに値を一切書き込まない)。


%index
RegisterTypeLibForUser
呼び出し元ユーザーが使用するためのタイプライブラリを登録する。
%group
Win32 oleaut32
%prm
ptlib, szFullPath, szHelpDir
ptlib : [var] タイプライブラリ。
szFullPath : [wstr] タイプライブラリの完全修飾パス指定。
szHelpDir : [wstr] 登録されるライブラリのヘルプファイルが見つかるディレクトリ。この引数は null でも構わない。
%inst
呼び出し元ユーザーが使用するためのタイプライブラリを登録する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
RegisterTypeLibForUser は RegisterTypeLib
と同一の機能を持つが、タイプライブラリは呼び出し元のユーザー ID のみが使用できるように登録される。


%index
RevokeActiveObject
オブジェクトのアクティブとしての状態を終了する。
%group
Win32 oleaut32
%prm
dwRegister, pvReserved
dwRegister : [int] 以前に RegisterActiveObject によって返されたハンドル。
pvReserved : [intptr] 将来の使用のために予約されている。null でなければならない。
%inst
オブジェクトのアクティブとしての状態を終了する。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
SafeArrayAccessData
配列のロックカウントをインクリメントし、配列データへのポインタを取得する。
%group
Win32 oleaut32
%prm
psa, ppvData
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
ppvData : [var] 配列データ。
%inst
配列のロックカウントをインクリメントし、配列データへのポインタを取得する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
SafeArrayAccessData を呼び出した後、配列のロックを解除するには SafeArrayUnaccessData
関数を呼び出さなければならない。


%index
SafeArrayAddRef
指定された safe array のディスクリプタのピン留め参照カウントを 1 つ増やす。また、safe array のディスクリプタによって判定された通り、その safe array のデータが動的に割り当てられていた場合には、そのデータのピン留め参照カウントも 1 つ増やすことがある。
%group
Win32 oleaut32
%prm
psa, ppDataToRelease
psa : [var] ディスクリプタのピン留め参照カウントを増やす safe array。そのカウントが 0 より大きい間、ディスクリプタのメモリは SafeArrayDestroy または SafeArrayDestroyDescriptor 関数の呼び出しによって解放されることが防がれる。
ppDataToRelease : [var] SafeArrayAddRef がその safe array データに対するピン留め参照も追加した場合、ピン留め参照が追加された safe array データを返す。SafeArrayAddRef がその safe array データに対するピン留め参照を追加しなかった場合、この引数は NULL である。SafeArrayAddRef は、その safe array データが動的に割り当てられていない場合には、その safe array データに対するピン留め参照を追加しない。
%inst
指定された safe array のディスクリプタのピン留め参照カウントを 1 つ増やす。また、safe array
のディスクリプタによって判定された通り、その safe array
のデータが動的に割り当てられていた場合には、そのデータのピン留め参照カウントも 1 つ増やすことがある。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
safe array は伝統的に参照カウントを持たなかった。safe array
の既存の使用は変更なしに動作し続ける。SafeArrayAddRef、SafeArrayReleaseData、SafeArrayReleaseDescriptor
関数は、信頼されないスクリプトから IDispatch メソッド
(メソッドが戻る前にスクリプトがそのメモリを解放することを想定していない可能性がある) を呼び出す前に、safe array
をメモリにピン留めするための参照カウントを使用する機能を追加する。これにより、スクリプトがそのメソッドのコードを解放済みメモリへのアクセスへ強制することができなくなる。そのようなメソッドが安全に戻った後、ピン留め参照は解放されるべきである。次の関数を呼び出すことでピン留め参照を解放できる。
（以下省略）


%index
SafeArrayAllocData
SafeArrayAllocDescriptor で作成されたディスクリプタに基づいて safe array にメモリを割り当てる。
%group
Win32 oleaut32
%prm
psa
psa : [var] SafeArrayAllocDescriptor で作成された safe array ディスクリプタ。
%inst
SafeArrayAllocDescriptor で作成されたディスクリプタに基づいて safe array にメモリを割り当てる。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
SafeArrayAllocDescriptor
safe array ディスクリプタにメモリを割り当てる。
%group
Win32 oleaut32
%prm
cDims, ppsaOut
cDims : [int] 配列の次元数。
ppsaOut : [var] safe array ディスクリプタ。
%inst
safe array ディスクリプタにメモリを割り当てる。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
この関数は SafeArrayCreate で提供される以外のデータ型を持つ要素を含む safe array
の作成を可能にする。SafeArrayAllocDescriptor
を使用して配列ディスクリプタを作成した後、配列ディスクリプタ内で要素サイズを設定し、SafeArrayAllocData
を呼び出して配列要素のメモリを割り当てる。


%index
SafeArrayAllocDescriptorEx
配列データを割り当てずに、VT_RECORD を含む任意の有効な variant 型の配列のための safe array ディスクリプタを作成する。
%group
Win32 oleaut32
%prm
vt, cDims, ppsaOut
vt : [int] variant 型。
cDims : [int] 配列の次元数。
ppsaOut : [var] safe array ディスクリプタ。
%inst
配列データを割り当てずに、VT_RECORD を含む任意の有効な variant 型の配列のための safe array
ディスクリプタを作成する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
SafeArrayAllocDescriptor は VARTYPE を取らないため、レコードの配列のための safe array
ディスクリプタを作成するために使用することはできない。SafeArrayAllocDescriptorEx
は、指定された次元のレコードの配列のための safe array ディスクリプタを割り当てるために使用される。


%index
SafeArrayCopy
既存の safe array のコピーを作成する。
%group
Win32 oleaut32
%prm
psa, ppsaOut
psa : [var] SafeArrayCreate で作成された safe array ディスクリプタ。
ppsaOut : [var] safe array ディスクリプタ。
%inst
既存の safe array のコピーを作成する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
コピー対象の配列が文字列または variant のいずれかのデータ型を含む場合、SafeArrayCopy は文字列または variant
操作関数を呼び出す。コピーされる配列がオブジェクト参照を含む場合、それらのオブジェクトの参照カウントがインクリメントされる。


%index
SafeArrayCopyData
コピー先配列内のリソースを解放した後、コピー元配列を指定されたコピー先配列にコピーする。
%group
Win32 oleaut32
%prm
psaSource, psaTarget
psaSource : [var] コピー元の safe array。
psaTarget : [var] コピー先の safe array。
%inst
コピー先配列内のリソースを解放した後、コピー元配列を指定されたコピー先配列にコピーする。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
SafeArrayCreate
新しい配列ディスクリプタを作成し、配列のデータを割り当てて初期化し、新しい配列ディスクリプタへのポインタを返す。
%group
Win32 oleaut32
%prm
vt, cDims, rgsabound
vt : [int] 配列の基底型 (配列の各要素の VARTYPE)。VARTYPE は variant 型のサブセットに制限される。VT_ARRAY フラグも VT_BYREF フラグも設定できない。VT_EMPTY と VT_NULL は配列の有効な基底型ではない。その他のすべての型は有効である。
cDims : [int] 配列の次元数。配列が作成された後はこの数を変更できない。
rgsabound : [var] 配列に割り当てる、各次元ごとの境界のベクタ。
%inst
新しい配列ディスクリプタを作成し、配列のデータを割り当てて初期化し、新しい配列ディスクリプタへのポインタを返す。

[戻り値]
safe array ディスクリプタ。配列を作成できなかった場合は null。


%index
SafeArrayCreateEx
指定された VARTYPE、次元数、境界から safe array ディスクリプタを作成して返す。
%group
Win32 oleaut32
%prm
vt, cDims, rgsabound, pvExtra
vt : [int] 配列の基底型または各要素の VARTYPE。FADF_RECORD フラグは variant 型 VT_RECORD に対して設定でき、FADF_HAVEIID フラグは VT_DISPATCH または VT_UNKNOWN に対して設定でき、FADF_HAVEVARTYPE はその他すべての VARTYPE に対して設定できる。
cDims : [int] 配列の次元数。
rgsabound : [var] 配列に割り当てる、各次元ごとの境界のベクタ。
pvExtra : [intptr] ユーザー定義型の safe array を作成する場合、そのユーザー定義型の型情報。vt 引数が VT_RECORD の場合、pvExtra はレコードを記述する IRecordInfo へのポインタとなる。vt 引数が VT_DISPATCH または VT_UNKNOWN の場合、pvExtra は配列に渡されるインターフェイスの種類を表す GUID へのポインタを含む。
%inst
指定された VARTYPE、次元数、境界から safe array ディスクリプタを作成して返す。

[戻り値]
safe array ディスクリプタ。配列を作成できなかった場合は null。

[備考]
VARTYPE が VT_RECORD の場合は SafeArraySetRecordInfo が呼ばれる。VARTYPE が
VT_DISPATCH または VT_UNKNOWN
の場合、配列の要素は同じ型のインターフェイスを含まなければならない。この配列を他のプロセスにマーシャリングする処理の一部には、pvExtra
で指される IID のプロキシ/スタブコードを生成することが含まれる。実際に異種のインターフェイスを渡すには、pvExtra に
IID_IUnknown または IID_IDispatch
のいずれかを指定し、呼び出し元が実際のインターフェイスを問い合わせる方法を別途提供する必要がある。


%index
SafeArrayCreateVector
1 次元配列を作成する。SafeArrayCreateVector で作成された safe array は固定サイズなので、定数 FADF_FIXEDSIZE は常に設定される。
%group
Win32 oleaut32
%prm
vt, lLbound, cElements
vt : [int] 配列の基底型 (配列の各要素の VARTYPE)。VARTYPE は variant 型のサブセットに制限される。VT_ARRAY フラグも VT_BYREF フラグも設定できない。VT_EMPTY と VT_NULL は配列の有効な基底型ではない。その他のすべての型は有効である。
lLbound : [int] 配列の下限。この引数は負でも構わない。
cElements : [int] 配列内の要素数。
%inst
1 次元配列を作成する。SafeArrayCreateVector で作成された safe array は固定サイズなので、定数
FADF_FIXEDSIZE は常に設定される。

[戻り値]
safe array ディスクリプタ。配列を作成できなかった場合は null。


%index
SafeArrayCreateVectorEx
指定された VARTYPE と境界の 1 次元 safe array を作成して返す。
%group
Win32 oleaut32
%prm
vt, lLbound, cElements, pvExtra
vt : [int] 配列の基底型 (配列の各要素の VARTYPE)。FADF_RECORD フラグは VT_RECORD に対して設定できる。FADF_HAVEIID は VT_DISPATCH または VT_UNKNOWN に対して設定でき、FADF_HAVEVARTYPE はその他すべての型に対して設定できる。
lLbound : [int] 配列の下限。この引数は負でも構わない。
cElements : [int] 配列内の要素数。
pvExtra : [intptr] ユーザー定義型の safe array を作成する場合、そのユーザー定義型の型情報。vt 引数が VT_RECORD の場合、pvExtra はレコードを記述する IRecordInfo へのポインタとなる。vt 引数が VT_DISPATCH または VT_UNKNOWN の場合、pvExtra は配列に渡されるインターフェイスの種類を表す GUID へのポインタを含む。
%inst
指定された VARTYPE と境界の 1 次元 safe array を作成して返す。

[戻り値]
safe array ディスクリプタ。配列を作成できなかった場合は null。


%index
SafeArrayDestroy
既存の配列ディスクリプタおよび配列内のすべてのデータを破棄する。
%group
Win32 oleaut32
%prm
psa
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
%inst
既存の配列ディスクリプタおよび配列内のすべてのデータを破棄する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
variant の safe array では各メンバに対して VariantClear 関数が呼び出され、BSTR の safe
array では各要素に対して SysFreeString 関数が呼び出される。レコードのオブジェクト参照やその他の値を解放するために
IRecordInfo::RecordClear が呼び出されるが、レコード自体は解放されない。


%index
SafeArrayDestroyData
指定された safe array 内のすべてのデータを破棄する。
%group
Win32 oleaut32
%prm
psa
psa : [var] safe array ディスクリプタ。
%inst
指定された safe array 内のすべてのデータを破棄する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
この関数は通常、variant 以外のデータ型の要素を含む safe array
を解放するときに使用される。配列にオブジェクトが格納されている場合、配列内の各オブジェクトに対して Release
が呼ばれる。variant の safe array では各メンバに対して VariantClear 関数が呼び出され、BSTR の
safe array では各要素に対して SysFreeString
関数が呼び出される。レコードのオブジェクト参照やその他の値を解放するために IRecordInfo::RecordClear
が呼び出されるが、レコード自体は解放されない。


%index
SafeArrayDestroyDescriptor
指定された safe array のディスクリプタを破棄する。
%group
Win32 oleaut32
%prm
psa
psa : [var] safe array ディスクリプタ。
%inst
指定された safe array のディスクリプタを破棄する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
この関数は通常、variant 以外のデータ型の要素を含む safe array
のディスクリプタを破棄するために使用される。配列ディスクリプタを破棄しても配列内の要素は破棄されない。配列ディスクリプタを破棄する前に、SafeArrayDestroyData
を呼び出して要素を解放する必要がある。


%index
SafeArrayGetDim
配列の次元数を取得する。
%group
Win32 oleaut32
%prm
psa
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
%inst
配列の次元数を取得する。

[戻り値]
配列の次元数。


%index
SafeArrayGetElement
配列の単一要素を取得する。
%group
Win32 oleaut32
%prm
psa, rgIndices, pv
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
rgIndices : [var] 配列の各次元のインデックスのベクタ。最も右の (最下位の) 次元が rgIndices[0] である。最も左の次元は rgIndices[psa->cDims ? 1] に格納される。
pv : [intptr] 配列の要素。
%inst
配列の単一要素を取得する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
この関数は要素を取得する前後に SafeArrayLock と SafeArrayUnlock
を自動的に呼び出す。呼び出し元はデータを受け取るために正しいサイズの記憶領域を提供しなければならない。データ要素が文字列、オブジェクト、または
variant の場合、関数は要素を正しい方法でコピーする。


%index
SafeArrayGetElemsize
1 要素のサイズを取得する。
%group
Win32 oleaut32
%prm
psa
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
%inst
1 要素のサイズを取得する。

[戻り値]
safe array 内の 1 要素のサイズ (バイト単位)。


%index
SafeArrayGetIID
指定された safe array に含まれるインターフェイスの GUID を取得する。
%group
Win32 oleaut32
%prm
psa, pguid
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
pguid : [var] インターフェイスの GUID。
%inst
指定された safe array に含まれるインターフェイスの GUID を取得する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
SafeArrayGetLBound
指定された safe array の任意の次元の下限を取得する。
%group
Win32 oleaut32
%prm
psa, nDim, plLbound
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
nDim : [int] 下限を取得する配列次元。
plLbound : [var] 下限。
%inst
指定された safe array の任意の次元の下限を取得する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
SafeArrayGetRecordInfo
指定された safe array に含まれる UDT の IRecordInfo インターフェイスを取得する。
%group
Win32 oleaut32
%prm
psa, prinfo
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
prinfo : [var] IRecordInfo インターフェイス。
%inst
指定された safe array に含まれる UDT の IRecordInfo インターフェイスを取得する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
SafeArrayGetUBound
指定された safe array の任意の次元の上限を取得する。
%group
Win32 oleaut32
%prm
psa, nDim, plUbound
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
nDim : [int] 上限を取得する配列次元。
plUbound : [var] 上限。
%inst
指定された safe array の任意の次元の上限を取得する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
SafeArrayGetVartype
指定された safe array に格納されている VARTYPE を取得する。
%group
Win32 oleaut32
%prm
psa, pvt
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
pvt : [var] VARTYPE。
%inst
指定された safe array に格納されている VARTYPE を取得する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
FADF_HAVEVARTYPE が設定されている場合、SafeArrayGetVartype は配列ディスクリプタに格納されている
VARTYPE を返す。FADF_RECORD が設定されている場合は VT_RECORD を返し、FADF_DISPATCH
が設定されている場合は VT_DISPATCH を返し、FADF_UNKNOWN が設定されている場合は VT_UNKNOWN
を返す。SafeArrayGetVartype は IUnknown に基づく SAFEARRAY 型に対して VT_UNKNOWN
を返さないことがある。呼び出し元はさらに SAFEARRAY 型の fFeatures フィールドに FADF_UNKNOWN
フラグが設定されているかどうかを確認すべきである。


%index
SafeArrayLock
配列のロックカウントをインクリメントし、配列ディスクリプタの pvData に配列データへのポインタを格納する。
%group
Win32 oleaut32
%prm
psa
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
%inst
配列のロックカウントをインクリメントし、配列ディスクリプタの pvData に配列データへのポインタを格納する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
配列ディスクリプタ内のポインタは SafeArrayUnlock 関数が呼び出されるまで有効である。SafeArrayLock
の呼び出しはネストでき、その場合は同じ回数の SafeArrayUnlock
の呼び出しが必要となる。配列はロックされている間は削除できない。


%index
SafeArrayPtrOfIndex
配列要素へのポインタを取得する。
%group
Win32 oleaut32
%prm
psa, rgIndices, ppvData
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
rgIndices : [var] 配列の要素を識別するインデックス値の配列。要素のすべてのインデックスを指定する必要がある。
ppvData : [var] 配列要素。
%inst
配列要素へのポインタを取得する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
SafeArrayPtrOfIndex
を呼び出す前に配列をロックすべきである。配列のロックを怠ると予測不可能な結果を引き起こすことがある。


%index
SafeArrayPutElement
指定された位置にデータ要素を格納する。
%group
Win32 oleaut32
%prm
psa, rgIndices, pv
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
rgIndices : [var] 配列の各次元のインデックスのベクタ。最も右の (最下位の) 次元が rgIndices[0] である。最も左の次元は rgIndices[psa->cDims ? 1] に格納される。
pv : [intptr] 配列に代入するデータ。variant 型 VT_DISPATCH、VT_UNKNOWN、VT_BSTR はポインタであり、もう 1 段階の間接参照を必要としない。
%inst
指定された位置にデータ要素を格納する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
この関数は要素を代入する前後に SafeArrayLock と SafeArrayUnlock
を自動的に呼び出す。データ要素が文字列、オブジェクト、または variant の場合、関数は safe array
が破棄される時にそれを正しくコピーする。既存の要素が文字列、オブジェクト、または variant の場合は正しくクリアされる。データ要素が
VT_DISPATCH または VT_UNKNOWN の場合、AddRef
が呼ばれてオブジェクトの参照カウントがインクリメントされる。注意:
配列には複数のロックを掛けることができる。配列が他の操作によってロックされている間も要素を配列に挿入できる。SafeArrayPutElement
の呼び出し例は、COM Fundamentals Lines サンプル (Lines.cpp の CLines::Add) を参照。


%index
SafeArrayRedim
指定された safe array の最も右の (最下位の) 境界を変更する。
%group
Win32 oleaut32
%prm
psa, psaboundNew
psa : [var] safe array ディスクリプタ。
psaboundNew : [var] 新しい配列境界を含む新しい safe array bound 構造体。配列の最下位次元のみを変更できる。
%inst
指定された safe array の最も右の (最下位の) 境界を変更する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
配列の境界を縮小すると、SafeArrayRedim
は新しい配列境界の外側の配列要素を解放する。配列の境界を拡張すると、SafeArrayRedim
は新しい配列要素を割り当てて初期化する。古い配列と新しい配列の両方に存在する要素のデータは保持される。


%index
SafeArrayReleaseData
指定された safe array データのピン留め参照カウントを 1 つ減らす。そのカウントが 0 に達すると、そのデータのメモリは解放されることが防がれなくなる。
%group
Win32 oleaut32
%prm
pData
pData : [intptr] ピン留め参照カウントを減らす safe array データ。
%inst
指定された safe array データのピン留め参照カウントを 1 つ減らす。そのカウントが 0
に達すると、そのデータのメモリは解放されることが防がれなくなる。

[備考]
SafeArrayReleaseData 関数の呼び出しは、ppDataToRelease 引数に NULL でない値を返した
SafeArrayAddRef 関数の以前の呼び出しと一致しなければならない。


%index
SafeArrayReleaseDescriptor
指定された safe array のディスクリプタのピン留め参照カウントを 1 つ減らす。そのカウントが 0 に達すると、そのディスクリプタのメモリは解放されることが防がれなくなる。
%group
Win32 oleaut32
%prm
psa
psa : [var] ディスクリプタのピン留め参照カウントを減らす safe array。
%inst
指定された safe array のディスクリプタのピン留め参照カウントを 1 つ減らす。そのカウントが 0
に達すると、そのディスクリプタのメモリは解放されることが防がれなくなる。

[備考]
SafeArrayReleaseDescriptor 関数の呼び出しは、SafeArrayAddRef
関数の以前のすべての呼び出しと一致しなければならない。


%index
SafeArraySetIID
指定された safe array にインターフェイスの GUID を設定する。
%group
Win32 oleaut32
%prm
psa, guid
psa : [var] safe array ディスクリプタ。
guid : [var] IID。
%inst
指定された safe array にインターフェイスの GUID を設定する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
SafeArraySetRecordInfo
指定された safe array にレコード情報を設定する。
%group
Win32 oleaut32
%prm
psa, prinfo
psa : [var] 配列ディスクリプタ。
prinfo : [var] レコード情報。
%inst
指定された safe array にレコード情報を設定する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
SafeArrayUnaccessData
配列のロックカウントをデクリメントし、SafeArrayAccessData で取得したポインタを無効化する。
%group
Win32 oleaut32
%prm
psa
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
%inst
配列のロックカウントをデクリメントし、SafeArrayAccessData で取得したポインタを無効化する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
SafeArrayUnlock
解放またはサイズ変更ができるよう、配列のロックカウントをデクリメントする。
%group
Win32 oleaut32
%prm
psa
psa : [var] SafeArrayCreate で作成された配列ディスクリプタ。
%inst
解放またはサイズ変更ができるよう、配列のロックカウントをデクリメントする。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
この関数は配列内のデータへのアクセスが完了した後に呼び出される。


%index
SetErrorInfo
現在の論理実行スレッドにエラー情報オブジェクトを設定する。
%group
Win32 oleaut32
%prm
dwReserved, perrinfo
dwReserved : [int] 将来の使用のために予約されている。0 でなければならない。
perrinfo : [var] エラーオブジェクト。
%inst
現在の論理実行スレッドにエラー情報オブジェクトを設定する。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
この関数は既存のエラー情報オブジェクトがあればそれを解放し、ポインタを perrinfo
に設定する。エラーオブジェクトを作成した後にこの関数を使用して、オブジェクトを現在の論理実行スレッドに関連付ける。SetErrorInfo
を呼び出すプロパティまたはメソッドが DispInvoke によって呼ばれている場合、DispInvoke
はエラー情報オブジェクトに指定された値で EXCEPINFO
引数を埋める。プロパティまたはメソッドが失敗の戻り値を返す場合、DispInvoke は DISP_E_EXCEPTION
を返す。IDispatch::Invoke を使用しない仮想関数テーブル (VTBL) バインディングコントローラは
GetErrorInfo
を使用してエラー情報オブジェクトを取得できる。これにより、デュアルインターフェイスをサポートするオブジェクトは、クライアントが VTBL
バインディングを使用するか IDispatch を使用するかに関わらず SetErrorInfo を使用できる。
クロスアパートメント呼び出しが行われると COM はあらゆるエラーオブジェクトをクリアする。
プロキシ/スタブを経由する COM
呼び出しは、呼び出し元スレッドの既存のエラーオブジェクトをクリアする。呼び出される側のオブジェクトは、SetErrorInfo
を呼び出した後、戻る前にそのような呼び出しを行ってはならない。呼び出し元は、呼び出しから戻った後、GetErrorInfo
を呼び出す前にそのような呼び出しを行ってはならない。経験則として、インターフェイスメソッドは SetErrorInfo
を呼び出した後できるだけ早く戻り、呼び出し元は呼び出しから戻った後できるだけ早く GetErrorInfo を呼び出すべきである。
COM のモーダルメッセージループに入ると既存のエラーオブジェクトはクリアされる。呼び出される側のオブジェクトは SetErrorInfo
を呼び出した後にメッセージループに入ってはならない。


%index
SysAddRefString
指定された文字列のピン留め参照カウントを 1 つ増やす。
%group
Win32 oleaut32
%prm
bstrString
bstrString : [int] ピン留め参照カウントを増やす文字列。そのカウントが 0 より大きい間、文字列のメモリは SysFreeString 関数の呼び出しによって解放されることが防がれる。
%inst
指定された文字列のピン留め参照カウントを 1 つ増やす。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
BSTR
データ型を持つ文字列は伝統的に参照カウントを持たなかった。これらの文字列の既存の使用は変更なしに動作し続ける。SysAddRefString
および SysReleaseString 関数は、信頼されないスクリプトから IDispatch メソッド
(メソッドが戻る前にスクリプトがそのメモリを解放することを想定していない可能性がある)
を呼び出す前に、文字列をメモリにピン留めするための参照カウントを使用する機能を追加する。これにより、スクリプトがそのメソッドのコードを解放済みメモリへのアクセスへ強制することができなくなる。そのようなメソッドが安全に戻った後、ピン留め参照は
SysReleaseString を呼び出して解放されるべきである。


%index
SysAllocString
新しい文字列を割り当て、渡された文字列をそれにコピーする。
%group
Win32 oleaut32
%prm
psz
psz : [wstr] コピーする文字列。
%inst
新しい文字列を割り当て、渡された文字列をそれにコピーする。

[戻り値]
成功した場合は文字列を返す。psz が長さ 0 の文字列なら長さ 0 の BSTR を返す。psz が NULL またはメモリ不足なら
NULL を返す。

[備考]
SysAllocString で作成された文字列は SysFreeString で解放できる。


%index
SysAllocStringByteLen
ANSI 文字列を入力として受け取り、ANSI 文字列を含む BSTR を返す。ANSI から Unicode への変換は行わない。
%group
Win32 oleaut32
%prm
psz, len
psz : [str] コピーする文字列。文字列を未初期化のままにする場合は NULL。
len : [int] コピーするバイト数。後に null 文字が置かれ、合計で len と OLECHAR のサイズを加えたバイト数が割り当てられる。
%inst
ANSI 文字列を入力として受け取り、ANSI 文字列を含む BSTR を返す。ANSI から Unicode への変換は行わない。

[戻り値]
文字列のコピー。操作を完了するためのメモリが不足している場合は NULL。

[備考]
この関数は、バイナリデータを含む BSTR を作成するために提供されている。この種の BSTR は、ANSI から Unicode へ
(またはその逆へ) 変換されない状況でのみ使用できる。例えば、32 ビット Windows システム上で動作する 16
ビットアプリケーションと 32 ビットアプリケーションの間でこれらの BSTR を使用してはならない。OLE の 16 ビットから 32
ビットへの (および 32 ビットから 16 ビットへの) 相互運用層は BSTR
を変換し、バイナリデータを破壊する。バイナリデータを渡すための推奨方法は、OLE によって変換されない VT_UI1 の
SAFEARRAY を使用することである。psz が Null の場合、要求された長さの文字列が割り当てられるが、初期化はされない。文字列
psz は埋め込み null 文字を含むことができ、Null で終わる必要はない。返される文字列は後で SysFreeString
で解放する。


%index
SysAllocStringLen
新しい文字列を割り当て、渡された文字列から指定された文字数をコピーし、null 終端文字を追加する。
%group
Win32 oleaut32
%prm
strIn, ui
strIn : [wstr] 入力文字列。
ui : [int] コピーする文字数。後に null 文字が置かれ、合計で ui に 1 を加えた文字数が割り当てられる。
%inst
新しい文字列を割り当て、渡された文字列から指定された文字数をコピーし、null 終端文字を追加する。

[戻り値]
文字列のコピー。操作を完了するためのメモリが不足している場合は NULL。

[備考]
文字列は埋め込み null 文字を含むことができ、NULL で終わる必要はない。返される文字列は後で SysFreeString
で解放する。strIn が NULL でない場合、strIn に割り当てられたメモリは少なくとも ui
文字以上の長さでなければならない。注意: この関数は char * 文字列を Unicode BSTR に変換しない。


%index
SysReAllocString
以前に割り当てられた文字列を 2 つ目の文字列のサイズに再割り当てし、2 つ目の文字列を再割り当てされたメモリにコピーする。
%group
Win32 oleaut32
%prm
pbstr, psz
pbstr : [var] 以前に割り当てられた文字列。
psz : [wstr] コピーする文字列。
%inst
以前に割り当てられた文字列を 2 つ目の文字列のサイズに再割り当てし、2 つ目の文字列を再割り当てされたメモリにコピーする。

[戻り値]
（以下省略）

[備考]
psz で渡されるアドレスは pbstr
で渡される文字列の一部であってはならない。さもないと予期しない結果が発生する可能性がある。pbstr が NULL
の場合、アクセス違反が発生してプログラムがクラッシュする。NULL ポインタからこの関数を保護するのは利用者の責任である。


%index
SysReAllocStringLen
古い BSTR から指定された文字数を含む新しい BSTR を作成し、古い BSTR を解放する。
%group
Win32 oleaut32
%prm
pbstr, psz, len
pbstr : [var] 以前に割り当てられた文字列。
psz : [wstr] len 文字をコピーする元の文字列。文字列を未初期化のままにする場合は NULL。
len : [int] コピーする文字数。後に null 文字が置かれ、合計で len に 1 を加えた文字数が割り当てられる。
%inst
古い BSTR から指定された文字数を含む新しい BSTR を作成し、古い BSTR を解放する。

[戻り値]
（以下省略）

[備考]
新しい文字列を割り当て、渡された文字列から len 文字をコピーし、その後に null 文字を追加する。pbstr が現在参照している
BSTR を解放し、pbstr を新しい BSTR を指すようにリセットする。psz が null の場合、長さ len
の文字列が割り当てられるが、初期化はされない。psz 文字列は埋め込み null 文字を含むことができ、null
で終わる必要はない。この関数に NULL ポインタが渡された場合、アクセス違反が発生してプログラムがクラッシュする。NULL
ポインタからこの関数を保護するのは利用者の責任である。


%index
SysReleaseString
指定された文字列のピン留め参照カウントを 1 つ減らす。そのカウントが 0 に達すると、その文字列のメモリは解放されることが防がれなくなる。
%group
Win32 oleaut32
%prm
bstrString
bstrString : [int] ピン留め参照カウントを減らす文字列。
%inst
指定された文字列のピン留め参照カウントを 1 つ減らす。そのカウントが 0
に達すると、その文字列のメモリは解放されることが防がれなくなる。

[備考]
SysReleaseString 関数の呼び出しは、SysAddRefString 関数の以前のすべての呼び出しと一致しなければならない。


%index
SysStringByteLen
BSTR の長さ (バイト単位) を返す。
%group
Win32 oleaut32
%prm
bstr
bstr : [int] 以前に割り当てられた文字列。
%inst
BSTR の長さ (バイト単位) を返す。

[戻り値]
bstr のバイト数 (終端の null 文字は含まない)。bstr が null の場合、戻り値は 0 となる。

[備考]
BSTR が埋め込み null 文字を含む場合、返される値は strlen(bstr) と異なることがある。この関数は常に、その BSTR
の割り当てに使用された SysAllocStringByteLen 関数の len 引数で指定されたバイト数を返す。


%index
SysStringLen
BSTR の長さを返す。
%group
Win32 oleaut32
%prm
pbstr
pbstr : [int] 以前に割り当てられた文字列。
%inst
BSTR の長さを返す。

[戻り値]
bstr の文字数(終端 NULL を含まない)。bstr が NULL の場合は 0。

[備考]
返される値は、BSTR が埋め込み NULL 文字を含む場合 strlen(bstr) と異なる場合がある。この関数は常に、BSTR
の割り当てに使われた SysAllocStringLen の cch パラメータで指定された文字数を返す。


%index
SystemTimeToVariantTime
システム時刻を variant 表現に変換する。
%group
Win32 oleaut32
%prm
lpSystemTime, pvtime
lpSystemTime : [var] システム時刻。
pvtime : [var] variant 時刻。
%inst
システム時刻を variant 表現に変換する。

[戻り値]
成功した場合は TRUE を返し、それ以外の場合は FALSE を返す。

[備考]
variant 時刻は 8 バイトの実数値 (double) として格納され、1 月 1 日 100 年から 12 月 31 日 9999
年までの日付を表す。値 2.0 は 1900 年 1 月 1 日を表し、3.0 は 1900 年 1 月 2
日を表す、というように続く。値に 1 を加えると日付が 1 日進む。値の小数部は時刻を表す。したがって 2.5 は 1900 年 1 月
1 日正午を表し、3.25 は 1900 年 1 月 2 日午前 6 時を表す、というように続く。負の値は 1899 年 12 月 30
日より前の日付を表す。variant 時刻の解像度は秒単位である。入力日付内のミリ秒は無視される。> [!NOTE] > variant
時刻を扱う際は、うるう年に追加される 1 日に注意すべきで、これを処理しないと予期しない結果を生む可能性がある。詳細は [leap
year
readiness](https://techcommunity.microsoft.com/t5/azure-developer-community-blog/it-s-2020-is-your-code-ready-for-leap-day/ba-p/1157279)
を参照。SYSTEMTIME 構造体は次の理由で有用である。
（以下省略）


%index
UnRegisterTypeLib
システムレジストリからタイプライブラリ情報を削除する。アプリケーションが正しくアンインストールできるよう、この API を使用する。
%group
Win32 oleaut32
%prm
libID, wVerMajor, wVerMinor, lcid, syskind
libID : [var] タイプライブラリの GUID。
wVerMajor : [int] タイプライブラリのメジャーバージョン。
wVerMinor : [int] タイプライブラリのマイナーバージョン。
lcid : [int] ロケール識別子。
syskind : [int] 対象オペレーティングシステム。
%inst
システムレジストリからタイプライブラリ情報を削除する。アプリケーションが正しくアンインストールできるよう、この API を使用する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
インプロセスオブジェクトは通常、DllUnregisterServer からこの API を呼び出す。


%index
UnRegisterTypeLibForUser
RegisterTypeLibForUser を使用して登録されたタイプライブラリの情報を削除する。
%group
Win32 oleaut32
%prm
libID, wMajorVerNum, wMinorVerNum, lcid, syskind
libID : [var] ライブラリの GUID。
wMajorVerNum : [int] タイプライブラリのメジャーバージョン。
wMinorVerNum : [int] タイプライブラリのマイナーバージョン。
lcid : [int] ロケール識別子。
syskind : [int] 対象オペレーティングシステム。
%inst
RegisterTypeLibForUser を使用して登録されたタイプライブラリの情報を削除する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
RegisterTypeLibForUser 関数で登録されたタイプライブラリの情報を削除するには
UnRegisterTypeLibForUser を使用する。


%index
VARIANT_UserFree
RPC スタブファイルから呼び出されたとき、サーバー側のリソースを解放する。(VARIANT_UserFree)
%group
Win32 oleaut32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
RPC スタブファイルから呼び出されたとき、サーバー側のリソースを解放する。(VARIANT_UserFree)


%index
VARIANT_UserFree64
RPC スタブファイルから呼び出されたとき、サーバー側のリソースを解放する。(VARIANT_UserFree64)
%group
Win32 oleaut32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
RPC スタブファイルから呼び出されたとき、サーバー側のリソースを解放する。(VARIANT_UserFree64)


%index
VARIANT_UserMarshal
VARIANT オブジェクトを RPC バッファへマーシャリングする。(VARIANT_UserMarshal)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
VARIANT オブジェクトを RPC バッファへマーシャリングする。(VARIANT_UserMarshal)

[戻り値]
返される HRESULT 値から得られる値は次のいずれかである。
（以下省略）


%index
VARIANT_UserMarshal64
VARIANT オブジェクトを RPC バッファへマーシャリングする。(VARIANT_UserMarshal64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
VARIANT オブジェクトを RPC バッファへマーシャリングする。(VARIANT_UserMarshal64)

[戻り値]
返される HRESULT 値から得られる値は次のいずれかである。
（以下省略）


%index
VARIANT_UserSize
VARIANT オブジェクトのワイヤサイズを計算し、そのハンドルとデータを取得する。(VARIANT_UserSize)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
VARIANT オブジェクトのワイヤサイズを計算し、そのハンドルとデータを取得する。(VARIANT_UserSize)

[戻り値]
返される HRESULT 値から得られる値は S_OK である。


%index
VARIANT_UserSize64
VARIANT オブジェクトのワイヤサイズを計算し、そのハンドルとデータを取得する。(VARIANT_UserSize64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
VARIANT オブジェクトのワイヤサイズを計算し、そのハンドルとデータを取得する。(VARIANT_UserSize64)

[戻り値]
返される HRESULT 値から得られる値は S_OK である。


%index
VARIANT_UserUnmarshal
RPC バッファから VARIANT オブジェクトをアンマーシャリングする。(VARIANT_UserUnmarshal)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
RPC バッファから VARIANT オブジェクトをアンマーシャリングする。(VARIANT_UserUnmarshal)

[戻り値]
返される HRESULT 値から得られる値は次のいずれかである。
（以下省略）


%index
VARIANT_UserUnmarshal64
RPC バッファから VARIANT オブジェクトをアンマーシャリングする。(VARIANT_UserUnmarshal64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
RPC バッファから VARIANT オブジェクトをアンマーシャリングする。(VARIANT_UserUnmarshal64)

[戻り値]
返される HRESULT 値から得られる値は次のいずれかである。
（以下省略）


%index
VarAbs
variant の絶対値を返す。
%group
Win32 oleaut32
%prm
pvarIn, pvarResult
pvarIn : [var] variant。
pvarResult : [var] 結果の variant。
%inst
variant の絶対値を返す。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
VarAdd
2 つの variant の和を返す。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] 1 つ目の variant。
pvarRight : [var] 2 つ目の variant。
pvarResult : [var] 結果の variant。
%inst
2 つの variant の和を返す。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
関数は次のように動作する。
（以下省略）


%index
VarAnd
任意の整数型の 2 つの variant 間でビット単位の And 演算を行う。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] 1 つ目の variant。
pvarRight : [var] 2 つ目の variant。
pvarResult : [var] 結果の variant。
%inst
任意の整数型の 2 つの variant 間でビット単位の And 演算を行う。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
関数は次のように動作する。
（以下省略）


%index
VarBoolFromCy
通貨値を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
cyIn, pboolOut
cyIn : [var] 変換する値。
pboolOut : [var] 結果の値。
%inst
通貨値を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromDate
日付値を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
dateIn, pboolOut
dateIn : [double] 変換する値。
pboolOut : [var] 結果の値。
%inst
日付値を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromDec
decimal 値を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, pboolOut
pdecIn : [var] 変換する値。
pboolOut : [var] 結果の値。
%inst
decimal 値を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromDisp
IDispatch インスタンスの既定プロパティを Boolean 値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, pboolOut
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
pboolOut : [var] 結果の値。
%inst
IDispatch インスタンスの既定プロパティを Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromI1
char 値を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
cIn, pboolOut
cIn : [int] 変換する値。
pboolOut : [var] 結果の値。
%inst
char 値を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromI2
short 値を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
sIn, pboolOut
sIn : [int] 変換する値。
pboolOut : [var] 結果の値。
%inst
short 値を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromI4
long 値を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
lIn, pboolOut
lIn : [int] 変換する値。
pboolOut : [var] 結果の値。
%inst
long 値を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromI8
8 バイト整数値を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
i64In, pboolOut
i64In : [int64] 変換する値。
pboolOut : [var] 結果の値。
%inst
8 バイト整数値を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromR4
float 値を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
fltIn, pboolOut
fltIn : [float] 変換する値。
pboolOut : [var] 結果の値。
%inst
float 値を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromR8
double 値を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
dblIn, pboolOut
dblIn : [double] 変換する値。
pboolOut : [var] 結果の値。
%inst
double 値を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromStr
OLECHAR 文字列を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pboolOut
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
pboolOut : [var] 結果の値。
%inst
OLECHAR 文字列を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromUI1
unsigned char 値を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
bIn, pboolOut
bIn : [int] 変換する値。
pboolOut : [var] 結果の値。
%inst
unsigned char 値を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromUI2
unsigned short 値を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pboolOut
uiIn : [int] 変換する値。
pboolOut : [var] 結果の値。
%inst
unsigned short 値を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromUI4
unsigned long 値を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
ulIn, pboolOut
ulIn : [int] 変換する値。
pboolOut : [var] 結果の値。
%inst
unsigned long 値を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBoolFromUI8
8 バイト符号なし整数値を Boolean 値に変換する。
%group
Win32 oleaut32
%prm
i64In, pboolOut
i64In : [int64] 変換する値。
pboolOut : [var] 結果の値。
%inst
8 バイト符号なし整数値を Boolean 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBstrCat
BSTR 型の 2 つの variant を連結し、結果の BSTR を返す。
%group
Win32 oleaut32
%prm
bstrLeft, bstrRight, pbstrResult
bstrLeft : [int] 1 つ目の variant。
bstrRight : [int] 2 つ目の variant。
pbstrResult : [var] 結果。
%inst
BSTR 型の 2 つの variant を連結し、結果の BSTR を返す。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
VarBstrCmp
BSTR 型の 2 つの variant を比較する。
%group
Win32 oleaut32
%prm
bstrLeft, bstrRight, lcid, dwFlags
bstrLeft : [int] 1 つ目の variant。
bstrRight : [int] 2 つ目の variant。
lcid : [int] プログラムが UNICODE 文字列と ANSI 文字列のどちらを使用しているかを判別するためのロケール識別子。
dwFlags : [int] 次は比較結果フラグである。
%inst
BSTR 型の 2 つの variant を比較する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）

[備考]
この関数は配列やレコードを比較しない。


%index
VarBstrFromBool
Boolean 値を BSTR 値に変換する。
%group
Win32 oleaut32
%prm
boolIn, lcid, dwFlags, pbstrOut
boolIn : [int] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
pbstrOut : [var] 結果の値。
%inst
Boolean 値を BSTR 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBstrFromCy
通貨値を BSTR 値に変換する。
%group
Win32 oleaut32
%prm
cyIn, lcid, dwFlags, pbstrOut
cyIn : [var] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
pbstrOut : [var] 結果の値。
%inst
通貨値を BSTR 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBstrFromDate
日付値を BSTR 値に変換する。
%group
Win32 oleaut32
%prm
dateIn, lcid, dwFlags, pbstrOut
dateIn : [double] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
pbstrOut : [var] 結果の値。
%inst
日付値を BSTR 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBstrFromDec
decimal 値を BSTR 値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, lcid, dwFlags, pbstrOut
pdecIn : [var] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
pbstrOut : [var] 結果の値。
%inst
decimal 値を BSTR 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBstrFromDisp
IDispatch インスタンスの既定プロパティを BSTR 値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, dwFlags, pbstrOut
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 予約。0 を設定する。
pbstrOut : [var] 結果の値。
%inst
IDispatch インスタンスの既定プロパティを BSTR 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBstrFromI1
char 値を BSTR 値に変換する。
%group
Win32 oleaut32
%prm
cIn, lcid, dwFlags, pbstrOut
cIn : [int] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 予約。0 を設定する。
pbstrOut : [var] 結果の値。
%inst
char 値を BSTR 値に変換する。

[戻り値]
この関数は次のいずれかの値を返すことがある。
（以下省略）


%index
VarBstrFromI2
short 値を BSTR 値に変換する。
%group
Win32 oleaut32
%prm
iVal, lcid, dwFlags, pbstrOut
iVal : [int] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 予約済み。0 を指定する。
pbstrOut : [var] 変換結果の値。
%inst
short 値を BSTR 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarBstrFromI4
long 値を BSTR 値に変換する。
%group
Win32 oleaut32
%prm
lIn, lcid, dwFlags, pbstrOut
lIn : [int] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 予約済み。0 を指定する。
pbstrOut : [var] 変換結果の値。
%inst
long 値を BSTR 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarBstrFromI8
8 バイト符号なし整数値を BSTR 値に変換する。 (VarBstrFromI8)
%group
Win32 oleaut32
%prm
i64In, lcid, dwFlags, pbstrOut
i64In : [int64] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 予約済み。0 を指定する。
pbstrOut : [var] 変換結果の値。
%inst
8 バイト符号なし整数値を BSTR 値に変換する。 (VarBstrFromI8)

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarBstrFromR4
float 値を BSTR 値に変換する。
%group
Win32 oleaut32
%prm
fltIn, lcid, dwFlags, pbstrOut
fltIn : [float] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
pbstrOut : [var] 変換結果の値。
%inst
float 値を BSTR 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarBstrFromR8
double 値を BSTR 値に変換する。
%group
Win32 oleaut32
%prm
dblIn, lcid, dwFlags, pbstrOut
dblIn : [double] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
pbstrOut : [var] 変換結果の値。
%inst
double 値を BSTR 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarBstrFromUI1
unsigned char 値を BSTR 値に変換する。
%group
Win32 oleaut32
%prm
bVal, lcid, dwFlags, pbstrOut
bVal : [int] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
pbstrOut : [var] 変換結果の値。
%inst
unsigned char 値を BSTR 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarBstrFromUI2
unsigned short 値を BSTR 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, lcid, dwFlags, pbstrOut
uiIn : [int] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
pbstrOut : [var] 変換結果の値。
%inst
unsigned short 値を BSTR 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarBstrFromUI4
unsigned long 値を BSTR 値に変換する。
%group
Win32 oleaut32
%prm
ulIn, lcid, dwFlags, pbstrOut
ulIn : [int] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 予約済み。0 を指定する。
pbstrOut : [var] 変換結果の値。
%inst
unsigned long 値を BSTR 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarBstrFromUI8
8 バイト符号なし整数値を BSTR 値に変換する。 (VarBstrFromUI8)
%group
Win32 oleaut32
%prm
ui64In, lcid, dwFlags, pbstrOut
ui64In : [int64] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 予約済み。0 を指定する。
pbstrOut : [var] 変換結果の値。
%inst
8 バイト符号なし整数値を BSTR 値に変換する。 (VarBstrFromUI8)

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCat
2 つの variant を連結し、結果を返す。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] 1 つめの variant。
pvarRight : [var] 2 つめの variant。
pvarResult : [var] 結果を格納する variant。
%inst
2 つの variant を連結し、結果を返す。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
この関数は次のように動作する。
（以下省略）


%index
VarCmp
2 つの variant を比較する。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, lcid, dwFlags
pvarLeft : [var] 1 つめの variant。
pvarRight : [var] 2 つめの variant。
lcid : [int] ロケール識別子。
dwFlags : [int] 比較結果のオプション。
%inst
2 つの variant を比較する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）

[備考]
この関数は variant
型の値のみを比較する。文字列、整数、浮動小数点数を比較するが、配列やレコードは比較しない。NORM_IGNOREWIDTH
を指定すると、VarCmp は次の例のように半角文字と全角文字の違いを無視する: "Ｃａｔ"==
"cat"。全角形式は中国語および日本語の表記で用いられる書式上の区別である。


%index
VarCyAbs
currency 型の variant の絶対値を取得する。
%group
Win32 oleaut32
%prm
cyIn, pcyResult
cyIn : [var] currency 型の variant。
pcyResult : [var] 結果の variant。
%inst
currency 型の variant の絶対値を取得する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarCyAdd
currency 型の 2 つの variant を加算する。
%group
Win32 oleaut32
%prm
cyLeft, cyRight, pcyResult
cyLeft : [var] 1 つめの variant。
cyRight : [var] 2 つめの variant。
pcyResult : [var] 結果の variant。
%inst
currency 型の 2 つの variant を加算する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarCyCmp
currency 型の 2 つの variant を比較する。
%group
Win32 oleaut32
%prm
cyLeft, cyRight
cyLeft : [var] 1 つめの variant。
cyRight : [var] 2 つめの variant。
%inst
currency 型の 2 つの variant を比較する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyCmpR8
currency 型の variant と double 型の値を比較する。
%group
Win32 oleaut32
%prm
cyLeft, dblRight
cyLeft : [var] 1 つめの variant。
dblRight : [double] 2 つめの variant。
%inst
currency 型の variant と double 型の値を比較する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFix
currency 型の variant の整数部分を取得する。 (VarCyFix)
%group
Win32 oleaut32
%prm
cyIn, pcyResult
cyIn : [var] currency 型の variant。
pcyResult : [var] 結果の variant。variant が負の場合は、その値以上で最初の負の整数が返される。
%inst
currency 型の variant の整数部分を取得する。 (VarCyFix)

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarCyFromBool
Boolean 値を currency 値に変換する。
%group
Win32 oleaut32
%prm
boolIn, pcyOut
boolIn : [int] 変換する値。
pcyOut : [var] 変換結果の値。
%inst
Boolean 値を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromDate
date 値を currency 値に変換する。
%group
Win32 oleaut32
%prm
dateIn, pcyOut
dateIn : [double] 変換する値。
pcyOut : [var] 変換結果の値。
%inst
date 値を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromDec
decimal 値を currency 値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, pcyOut
pdecIn : [var] 変換する値。
pcyOut : [var] 変換結果の値。
%inst
decimal 値を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromDisp
IDispatch インスタンスの既定プロパティを currency 値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, pcyOut
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
pcyOut : [var] 変換結果の値。
%inst
IDispatch インスタンスの既定プロパティを currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromI1
char 値を currency 値に変換する。
%group
Win32 oleaut32
%prm
cIn, pcyOut
cIn : [int] 変換する値。
pcyOut : [var] 変換結果の値。
%inst
char 値を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromI2
short 値を currency 値に変換する。
%group
Win32 oleaut32
%prm
sIn, pcyOut
sIn : [int] 変換する値。
pcyOut : [var] 変換結果の値。
%inst
short 値を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromI4
long 値を currency 値に変換する。
%group
Win32 oleaut32
%prm
lIn, pcyOut
lIn : [int] 変換する値。
pcyOut : [var] 変換結果の値。
%inst
long 値を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromI8
8 バイト整数値を currency 値に変換する。
%group
Win32 oleaut32
%prm
i64In, pcyOut
i64In : [int64] 変換する値。
pcyOut : [var] 変換結果の値。
%inst
8 バイト整数値を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromR4
float 値を currency 値に変換する。
%group
Win32 oleaut32
%prm
fltIn, pcyOut
fltIn : [float] 変換する値。
pcyOut : [var] 変換結果の値。
%inst
float 値を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromR8
double 値を currency 値に変換する。
%group
Win32 oleaut32
%prm
dblIn, pcyOut
dblIn : [double] 変換する値。
pcyOut : [var] 変換結果の値。
%inst
double 値を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromStr
OLECHAR 文字列を currency 値に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pcyOut
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
pcyOut : [var] 変換結果の値。
%inst
OLECHAR 文字列を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromUI1
unsigned char 値を currency 値に変換する。
%group
Win32 oleaut32
%prm
bIn, pcyOut
bIn : [int] 変換する値。
pcyOut : [var] 変換結果の値。
%inst
unsigned char 値を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromUI2
unsigned short 値を currency 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pcyOut
uiIn : [int] 変換する値。
pcyOut : [var] 変換結果の値。
%inst
unsigned short 値を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromUI4
unsigned long 値を currency 値に変換する。
%group
Win32 oleaut32
%prm
ulIn, pcyOut
ulIn : [int] 変換する値。
pcyOut : [var] 変換結果の値。
%inst
unsigned long 値を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyFromUI8
8 バイト符号なし整数値を currency 値に変換する。
%group
Win32 oleaut32
%prm
ui64In, pcyOut
ui64In : [int64] 変換する値。
pcyOut : [var] 変換結果の値。
%inst
8 バイト符号なし整数値を currency 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarCyInt
currency 型の variant の整数部分を取得する。 (VarCyInt)
%group
Win32 oleaut32
%prm
cyIn, pcyResult
cyIn : [var] currency 型の variant。
pcyResult : [var] 結果の variant。variant が負の場合は、その値以下で最初の負の整数が返される。
%inst
currency 型の variant の整数部分を取得する。 (VarCyInt)

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarCyMul
currency 型の 2 つの variant を乗算する。
%group
Win32 oleaut32
%prm
cyLeft, cyRight, pcyResult
cyLeft : [var] 1 つめの variant
cyRight : [var] 2 つめの variant。
pcyResult : [var] 結果の variant。
%inst
currency 型の 2 つの variant を乗算する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
cyLeft または cyRight のフィールドのいずれかが未初期化のままだと、既定値として大きな値が設定され
DISP_E_OVERFLOW を引き起こすことがある。


%index
VarCyMulI4
currency 値に 32 ビット整数を乗算する。
%group
Win32 oleaut32
%prm
cyLeft, lRight, pcyResult
cyLeft : [var] 1 つめの variant。
lRight : [int] 2 つめの variant。
pcyResult : [var] 結果の variant。
%inst
currency 値に 32 ビット整数を乗算する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarCyMulI8
currency 値に 64 ビット整数を乗算する。
%group
Win32 oleaut32
%prm
cyLeft, lRight, pcyResult
cyLeft : [var] 1 つめの variant。
lRight : [int64] 2 つめの variant。
pcyResult : [var] 結果の variant。
%inst
currency 値に 64 ビット整数を乗算する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarCyNeg
currency 型の variant に対して論理否定を実行する。
%group
Win32 oleaut32
%prm
cyIn, pcyResult
cyIn : [var] 符号反転する variant。
pcyResult : [var] 結果の variant。
%inst
currency 型の variant に対して論理否定を実行する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarCyRound
currency 型の variant を指定した小数桁数に丸める。
%group
Win32 oleaut32
%prm
cyIn, cDecimals, pcyResult
cyIn : [var] 丸める variant。
cDecimals : [int] currency の小数桁数。
pcyResult : [var] 結果の variant。
%inst
currency 型の variant を指定した小数桁数に丸める。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarCySub
currency 型の 2 つの variant を減算する。
%group
Win32 oleaut32
%prm
cyLeft, cyRight, pcyResult
cyLeft : [var] 1 つめの variant。
cyRight : [var] 2 つめの variant。
pcyResult : [var] 結果の variant。
%inst
currency 型の 2 つの variant を減算する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarDateFromBool
Boolean 値を date 値に変換する。
%group
Win32 oleaut32
%prm
boolIn, pdateOut
boolIn : [int] 変換する値。
pdateOut : [var] 変換結果の値。
%inst
Boolean 値を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromCy
currency 値を date 値に変換する。
%group
Win32 oleaut32
%prm
cyIn, pdateOut
cyIn : [var] 変換する値。
pdateOut : [var] 変換結果の値。
%inst
currency 値を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromDec
decimal 値を date 値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, pdateOut
pdecIn : [var] 変換する値。
pdateOut : [var] 変換結果の値。
%inst
decimal 値を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromDisp
IDispatch インスタンスの既定プロパティを date 値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, pdateOut
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
pdateOut : [var] 変換結果の値。
%inst
IDispatch インスタンスの既定プロパティを date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromI1
char 値を date 値に変換する。
%group
Win32 oleaut32
%prm
cIn, pdateOut
cIn : [int] 変換する値。
pdateOut : [var] 変換結果の値。
%inst
char 値を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromI2
short 値を date 値に変換する。
%group
Win32 oleaut32
%prm
sIn, pdateOut
sIn : [int] 変換する値。
pdateOut : [var] 変換結果の値。
%inst
short 値を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromI4
long 値を date 値に変換する。
%group
Win32 oleaut32
%prm
lIn, pdateOut
lIn : [int] 変換する値。
pdateOut : [var] 変換結果の値。
%inst
long 値を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromI8
8 バイト符号なし整数値を date 値に変換する。
%group
Win32 oleaut32
%prm
i64In, pdateOut
i64In : [int64] 変換する値。
pdateOut : [var] 変換結果の値。
%inst
8 バイト符号なし整数値を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromR4
float 値を date 値に変換する。
%group
Win32 oleaut32
%prm
fltIn, pdateOut
fltIn : [float] 変換する値。
pdateOut : [var] 変換結果の値。
%inst
float 値を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromR8
double 値を date 値に変換する。
%group
Win32 oleaut32
%prm
dblIn, pdateOut
dblIn : [double] 変換する値。
pdateOut : [var] 変換結果の値。
%inst
double 値を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromStr
OLECHAR 文字列を date 値に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pdateOut
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
pdateOut : [var] 変換結果の値。
%inst
OLECHAR 文字列を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromUI1
unsigned char 値を date 値に変換する。
%group
Win32 oleaut32
%prm
bIn, pdateOut
bIn : [int] 変換する値。
pdateOut : [var] 変換結果の値。
%inst
unsigned char 値を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromUI2
unsigned short 値を date 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pdateOut
uiIn : [int] 変換する値。
pdateOut : [var] 変換結果の値。
%inst
unsigned short 値を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromUI4
unsigned long 値を date 値に変換する。
%group
Win32 oleaut32
%prm
ulIn, pdateOut
ulIn : [int] 変換する値。
pdateOut : [var] 変換結果の値。
%inst
unsigned long 値を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromUI8
8 バイト符号なし値を date 値に変換する。
%group
Win32 oleaut32
%prm
ui64In, pdateOut
ui64In : [int64] 変換する値。
pdateOut : [var] 変換結果の値。
%inst
8 バイト符号なし値を date 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDateFromUdate
MS-DOS 形式から変換された日時を variant 形式に変換する。 (VarDateFromUdate)
%group
Win32 oleaut32
%prm
pudateIn, dwFlags, pdateOut
pudateIn : [var] アンパックされた日付。
dwFlags : [int] 日付が有効な場合は VAR_VALIDDATE。
pdateOut : [var] パックされた日付。
%inst
MS-DOS 形式から変換された日時を variant 形式に変換する。 (VarDateFromUdate)

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）

[備考]
UDATE 構造体は VarDateFromUdate、VarDateFromUdateEx、VarUdateFromDate
と共に使用される。アンパックされた日付を表す。
（以下省略）


%index
VarDateFromUdateEx
MS-DOS 形式から変換された日時を variant 形式に変換する。 (VarDateFromUdateEx)
%group
Win32 oleaut32
%prm
pudateIn, lcid, dwFlags, pdateOut
pudateIn : [var] アンパックされた日付。
lcid : [int] ロケール識別子。
dwFlags : [int] 日付が有効な場合は VAR_VALIDDATE。
pdateOut : [var] パックされた日付。
%inst
MS-DOS 形式から変換された日時を variant 形式に変換する。 (VarDateFromUdateEx)

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）

[備考]
UDATE 構造体は VarDateFromUdateEx、VarDateFromUdate、VarUdateFromDate
と共に使用される。アンパックされた日付を表す。
（以下省略）


%index
VarDecAbs
decimal 型の variant の絶対値を取得する。
%group
Win32 oleaut32
%prm
pdecIn, pdecResult
pdecIn : [var] 1 つめの variant。
pdecResult : [var] 2 つめの variant。
%inst
decimal 型の variant の絶対値を取得する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarDecAdd
decimal 型の 2 つの variant を加算する。
%group
Win32 oleaut32
%prm
pdecLeft, pdecRight, pdecResult
pdecLeft : [var] 1 つめの variant。
pdecRight : [var] 2 つめの variant。
pdecResult : [var] 結果の variant。
%inst
decimal 型の 2 つの variant を加算する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarDecCmp
decimal 型の 2 つの variant を比較する。
%group
Win32 oleaut32
%prm
pdecLeft, pdecRight
pdecLeft : [var] 1 つめの variant。
pdecRight : [var] 2 つめの variant。
%inst
decimal 型の 2 つの variant を比較する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecCmpR8
decimal 型の variant と double 型の値を比較する。
%group
Win32 oleaut32
%prm
pdecLeft, dblRight
pdecLeft : [var] 1 つめの variant。
dblRight : [double] 2 つめの variant。
%inst
decimal 型の variant と double 型の値を比較する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecDiv
decimal 型の 2 つの variant を除算する。
%group
Win32 oleaut32
%prm
pdecLeft, pdecRight, pdecResult
pdecLeft : [var] 1 つめの decimal variant。
pdecRight : [var] 2 つめの decimal variant。
pdecResult : [var] 結果の decimal variant。
%inst
decimal 型の 2 つの variant を除算する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarDecFix
decimal 型の variant の整数部分を取得する。 (VarDecFix)
%group
Win32 oleaut32
%prm
pdecIn, pdecResult
pdecIn : [var] decimal variant。
pdecResult : [var] 結果の variant。variant が負の場合は、その値以上で最初の負の整数が返される。
%inst
decimal 型の variant の整数部分を取得する。 (VarDecFix)

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarDecFromBool
Boolean 値を decimal 値に変換する。
%group
Win32 oleaut32
%prm
boolIn, pdecOut
boolIn : [int] 変換する値。
pdecOut : [var] 変換結果の値。
%inst
Boolean 値を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromCy
currency 値を decimal 値に変換する。
%group
Win32 oleaut32
%prm
cyIn, pdecOut
cyIn : [var] 変換する値。
pdecOut : [var] 変換結果の値。
%inst
currency 値を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromDate
date 値を decimal 値に変換する。
%group
Win32 oleaut32
%prm
dateIn, pdecOut
dateIn : [double] 変換する値。
pdecOut : [var] 変換結果の値。
%inst
date 値を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromDisp
IDispatch インスタンスの既定プロパティを decimal 値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, pdecOut
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
pdecOut : [var] 変換結果の値。
%inst
IDispatch インスタンスの既定プロパティを decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromI1
char 値を decimal 値に変換する。
%group
Win32 oleaut32
%prm
cIn, pdecOut
cIn : [int] 変換する値。
pdecOut : [var] 変換結果の値。
%inst
char 値を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromI2
short 値を decimal 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pdecOut
uiIn : [int] 変換する値。
pdecOut : [var] 変換結果の値。
%inst
short 値を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromI4
long 値を decimal 値に変換する。
%group
Win32 oleaut32
%prm
lIn, pdecOut
lIn : [int] 変換する値。
pdecOut : [var] 変換結果の値。
%inst
long 値を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromI8
8 バイト整数値を decimal 値に変換する。
%group
Win32 oleaut32
%prm
i64In, pdecOut
i64In : [int64] 変換する値。
pdecOut : [var] 変換結果の値。
%inst
8 バイト整数値を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromR4
float 値を decimal 値に変換する。
%group
Win32 oleaut32
%prm
fltIn, pdecOut
fltIn : [float] 変換する値。
pdecOut : [var] 変換結果の値。
%inst
float 値を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromR8
double 値を decimal 値に変換する。
%group
Win32 oleaut32
%prm
dblIn, pdecOut
dblIn : [double] 変換する値。
pdecOut : [var] 変換結果の値。
%inst
double 値を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromStr
OLECHAR 文字列を decimal 値に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pdecOut
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
pdecOut : [var] 変換結果の値。
%inst
OLECHAR 文字列を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromUI1
unsigned char 値を decimal 値に変換する。
%group
Win32 oleaut32
%prm
bIn, pdecOut
bIn : [int] 変換する値。
pdecOut : [var] 変換結果の値。
%inst
unsigned char 値を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromUI2
unsigned short 値を decimal 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pdecOut
uiIn : [int] 変換する値。
pdecOut : [var] 変換結果の値。
%inst
unsigned short 値を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromUI4
unsigned long 値を decimal 値に変換する。
%group
Win32 oleaut32
%prm
ulIn, pdecOut
ulIn : [int] 変換する値。
pdecOut : [var] 変換結果の値。
%inst
unsigned long 値を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecFromUI8
8 バイト符号なし整数値を decimal 値に変換する。
%group
Win32 oleaut32
%prm
ui64In, pdecOut
ui64In : [int64] 変換する値。
pdecOut : [var] 変換結果の値。
%inst
8 バイト符号なし整数値を decimal 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarDecInt
decimal 型の variant の整数部分を取得する。 (VarDecInt)
%group
Win32 oleaut32
%prm
pdecIn, pdecResult
pdecIn : [var] decimal variant。
pdecResult : [var] 結果の variant。variant が負の場合は、その値以下で最初の負の整数が返される。
%inst
decimal 型の variant の整数部分を取得する。 (VarDecInt)

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarDecMul
decimal 型の 2 つの variant を乗算する。
%group
Win32 oleaut32
%prm
pdecLeft, pdecRight, pdecResult
pdecLeft : [var] 1 つめの variant。
pdecRight : [var] 2 つめの variant。
pdecResult : [var] 結果の variant。
%inst
decimal 型の 2 つの variant を乗算する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarDecNeg
decimal 型の variant に対して論理否定を実行する。
%group
Win32 oleaut32
%prm
pdecIn, pdecResult
pdecIn : [var] 符号反転する variant。
pdecResult : [var] 結果の variant。
%inst
decimal 型の variant に対して論理否定を実行する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarDecRound
decimal 型の variant を指定した小数桁数に丸める。
%group
Win32 oleaut32
%prm
pdecIn, cDecimals, pdecResult
pdecIn : [var] 丸める variant。
cDecimals : [int] 小数桁数。
pdecResult : [var] 結果の variant。
%inst
decimal 型の variant を指定した小数桁数に丸める。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarDecSub
decimal 型の 2 つの variant を減算する。
%group
Win32 oleaut32
%prm
pdecLeft, pdecRight, pdecResult
pdecLeft : [var] 1 つめの variant。
pdecRight : [var] 2 つめの variant。
pdecResult : [var] 結果の variant。
%inst
decimal 型の 2 つの variant を減算する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
VarDiv
2 つの variant の除算結果を返す。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] 1 つめの variant。
pvarRight : [var] 2 つめの variant。
pvarResult : [var] 結果を格納する variant。
%inst
2 つの variant の除算結果を返す。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
この関数は次のように動作する。
（以下省略）


%index
VarEqv
2 つの variant に対してビット単位の等価演算を実行する。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] 1 つめの variant。
pvarRight : [var] 2 つめの variant。
pvarResult : [var] 結果を格納する variant。
%inst
2 つの variant に対してビット単位の等価演算を実行する。

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
pvarLeft の各ビットが pvarRight の対応するビットと等しい場合は TRUE を返す。それ以外の場合は FALSE
を返す。


%index
VarFix
variant の整数部分を返す。 (VarFix)
%group
Win32 oleaut32
%prm
pvarIn, pvarResult
pvarIn : [var] variant。
pvarResult : [var] 結果を格納する variant。
%inst
variant の整数部分を返す。 (VarFix)

[戻り値]
関数が成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
variant が負の場合は、その値以上で最初の負の整数が返される。


%index
VarFormat
書式文字列を解析して variant を文字列形式に整形する。
%group
Win32 oleaut32
%prm
pvarIn, pstrFormat, iFirstDay, iFirstWeek, dwFlags, pbstrOut
pvarIn : [var] variant。
pstrFormat : [wstr] 書式文字列。例えば "mm-dd-yy"。
iFirstDay : [int] 週の最初の曜日。
iFirstWeek : [int] 年の最初の週。
dwFlags : [int] 書式設定処理を制御するフラグ。設定可能なフラグは VAR_CALENDAR_HIJRI または VAR_FORMAT_NOSUBSTITUTE のみ。
pbstrOut : [var] variant を表す書式設定済み文字列。
%inst
書式文字列を解析して variant を文字列形式に整形する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）

[備考]
この関数は VarTokenizeFormatString および VarFormatFromTokens
を呼び出す際にユーザーの既定ロケールを使用する。


%index
VarFormatCurrency
currency 値を含む variant を文字列形式に整形する。
%group
Win32 oleaut32
%prm
pvarIn, iNumDig, iIncLead, iUseParens, iGroup, dwFlags, pbstrOut
pvarIn : [var] variant。
iNumDig : [int] 小数点以下に詰める桁数。システム既定値を使用するには -1 を指定する。
iIncLead : [int] 数値の先頭桁を含めるかどうかを指定する。
iUseParens : [int] 負の数値で括弧を使用するかどうかを指定する。
iGroup : [int] 千の位で区切るかどうかを指定する。例えば 10,000 と 10000。注意  通常の数値と通貨では上記すべてのオプションについて別々のシステム既定値を持つ。
dwFlags : [int] 設定可能なフラグは VAR_CALENDAR_HIJRI のみ。
pbstrOut : [var] variant を表す書式設定済み文字列。
%inst
currency 値を含む variant を文字列形式に整形する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）

[備考]
この関数は VarTokenizeFormatString および VarFormatFromTokens
を呼び出す際にユーザーの既定ロケールを使用する。


%index
VarFormatDateTime
名前付き日付および時刻情報を含む variant を文字列に整形する。
%group
Win32 oleaut32
%prm
pvarIn, iNamedFormat, dwFlags, pbstrOut
pvarIn : [var] 整形する値を含む variant。
iNamedFormat : [int] 名前付き日付書式は次のとおり。
dwFlags : [int] 設定可能なフラグは VAR_CALENDAR_HIJRI のみ。
pbstrOut : [var] variant を表す書式設定済み文字列を受け取る。
%inst
名前付き日付および時刻情報を含む variant を文字列に整形する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）

[備考]
この関数は VarTokenizeFormatString および VarFormatFromTokens
を呼び出す際にユーザーの既定ロケールを使用する。


%index
VarFormatFromTokens
トークン化された書式文字列を受け取り、それを variant に適用して整形済み出力文字列を生成する。
%group
Win32 oleaut32
%prm
pvarIn, pstrFormat, pbTokCur, dwFlags, pbstrOut, lcid
pvarIn : [var] 整形する値を含む variant。
pstrFormat : [wstr] 元の書式文字列。
pbTokCur : [var] VarTokenizeFormatString からのトークン化された書式文字列。
dwFlags : [int] 設定可能なフラグは VAR_CALENDAR_HIJRI または VAR_FORMAT_NOSUBSTITUTE のみ。
pbstrOut : [var] 整形済み出力文字列。
lcid : [int] 整形済み出力文字列に使用するロケール。
%inst
トークン化された書式文字列を受け取り、それを variant に適用して整形済み出力文字列を生成する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）

[備考]
ロケール lcid が整形済み出力文字列を制御する。


%index
VarFormatNumber
数値を含む variant を文字列形式に整形する。
%group
Win32 oleaut32
%prm
pvarIn, iNumDig, iIncLead, iUseParens, iGroup, dwFlags, pbstrOut
pvarIn : [var] 整形する値を含む variant。
iNumDig : [int] 小数点以下に詰める桁数。システム既定値を使用するには -1 を指定する。
iIncLead : [int] 数値の先頭桁を含めるかどうかを指定する。
iUseParens : [int] 負の数値で括弧を使用するかどうかを指定する。
iGroup : [int] 千の位で区切るかどうかを指定する。例えば 10,000 と 10000。注意  通常の数値と通貨では上記すべてのオプションについて別々のシステム既定値を持つ。
dwFlags : [int] 設定可能なフラグは VAR_CALENDAR_HIJRI のみ。
pbstrOut : [var] variant を表す書式設定済み文字列を指す。
%inst
数値を含む variant を文字列形式に整形する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）

[備考]
この関数は VarTokenizeFormatString および VarFormatFromTokens
を呼び出す際にユーザーの既定ロケールを使用する。


%index
VarFormatPercent
百分率を含む variant を文字列形式に整形する。
%group
Win32 oleaut32
%prm
pvarIn, iNumDig, iIncLead, iUseParens, iGroup, dwFlags, pbstrOut
pvarIn : [var] 整形する値を含む variant。
iNumDig : [int] 小数点以下に詰める桁数。システム既定値を使用するには -1 を指定する。
iIncLead : [int] 数値の先頭桁を含めるかどうかを指定する。
iUseParens : [int] 負の数値で括弧を使用するかどうかを指定する。
iGroup : [int] 千の位で区切るかどうかを指定する。例えば 10,000 と 10000。注意  通常の数値と通貨では上記すべてのオプションについて別々のシステム既定値を持つ。
dwFlags : [int] 設定可能なフラグは VAR_CALENDAR_HIJRI のみ。
pbstrOut : [var] variant を表す書式設定済み文字列を受け取る。
%inst
百分率を含む variant を文字列形式に整形する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）

[備考]
この関数は VarTokenizeFormatString および VarFormatFromTokens
を呼び出す際にユーザーの既定ロケールを使用する。


%index
VarI1FromBool
Boolean 値を char 値に変換する。
%group
Win32 oleaut32
%prm
boolIn, pcOut
boolIn : [int] 変換する値。
pcOut : [str] 変換結果の値。
%inst
Boolean 値を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromCy
currency 値を char 値に変換する。
%group
Win32 oleaut32
%prm
cyIn, pcOut
cyIn : [var] 変換する値。
pcOut : [str] 変換結果の値。
%inst
currency 値を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromDate
date 値を char 値に変換する。
%group
Win32 oleaut32
%prm
dateIn, pcOut
dateIn : [double] 変換する値。
pcOut : [str] 変換結果の値。
%inst
date 値を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromDec
decimal 値を char 値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, pcOut
pdecIn : [var] 変換する値。
pcOut : [str] 変換結果の値。
%inst
decimal 値を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromDisp
IDispatch インスタンスの既定プロパティを char 値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, pcOut
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
pcOut : [str] 変換結果の値。
%inst
IDispatch インスタンスの既定プロパティを char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromI2
short 値を char 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pcOut
uiIn : [int] 変換する値。
pcOut : [str] 変換結果の値。
%inst
short 値を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromI4
long 値を char 値に変換する。
%group
Win32 oleaut32
%prm
lIn, pcOut
lIn : [int] 変換する値。
pcOut : [str] 変換結果の値。
%inst
long 値を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromI8
8 バイト整数値を char 値に変換する。
%group
Win32 oleaut32
%prm
i64In, pcOut
i64In : [int64] 変換する値。
pcOut : [str] 変換結果の値。
%inst
8 バイト整数値を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromR4
float 値を char 値に変換する。
%group
Win32 oleaut32
%prm
fltIn, pcOut
fltIn : [float] 変換する値。
pcOut : [str] 変換結果の値。
%inst
float 値を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromR8
double 値を char 値に変換する。
%group
Win32 oleaut32
%prm
dblIn, pcOut
dblIn : [double] 変換する値。
pcOut : [str] 変換結果の値。
%inst
double 値を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromStr
OLECHAR 文字列を char 値に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pcOut
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
pcOut : [str] 変換結果の値。
%inst
OLECHAR 文字列を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromUI1
unsigned char 値を char 値に変換する。
%group
Win32 oleaut32
%prm
bIn, pcOut
bIn : [int] 変換する値。
pcOut : [str] 変換結果の値。
%inst
unsigned char 値を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromUI2
unsigned short 値を char 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pcOut
uiIn : [int] 変換する値。
pcOut : [str] 変換結果の値。
%inst
unsigned short 値を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromUI4
unsigned long 値を char 値に変換する。
%group
Win32 oleaut32
%prm
ulIn, pcOut
ulIn : [int] 変換する値。
pcOut : [str] 変換結果の値。
%inst
unsigned long 値を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI1FromUI8
8 バイト符号なし整数値を char 値に変換する。
%group
Win32 oleaut32
%prm
i64In, pcOut
i64In : [int64] 変換する値。
pcOut : [str] 変換結果の値。
%inst
8 バイト符号なし整数値を char 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromBool
Boolean 値を short 値に変換する。
%group
Win32 oleaut32
%prm
boolIn, psOut
boolIn : [int] 変換する値。
psOut : [var] 変換結果の値。
%inst
Boolean 値を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromCy
currency 値を short 値に変換する。
%group
Win32 oleaut32
%prm
cyIn, psOut
cyIn : [var] 変換する値。
psOut : [var] 変換結果の値。
%inst
currency 値を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromDate
date 値を short 値に変換する。
%group
Win32 oleaut32
%prm
dateIn, psOut
dateIn : [double] 変換する値。
psOut : [var] 変換結果の値。
%inst
date 値を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromDec
decimal 値を short 値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, psOut
pdecIn : [var] 変換する値。
psOut : [var] 変換結果の値。
%inst
decimal 値を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromDisp
IDispatch インスタンスの既定プロパティを short 値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, psOut
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
psOut : [var] 変換結果の値。
%inst
IDispatch インスタンスの既定プロパティを short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromI1
char 値を short 値に変換する。
%group
Win32 oleaut32
%prm
cIn, psOut
cIn : [int] 変換する値。
psOut : [var] 変換結果の値。
%inst
char 値を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromI4
long 値を short 値に変換する。
%group
Win32 oleaut32
%prm
lIn, psOut
lIn : [int] 変換する値。
psOut : [var] 変換結果の値。
%inst
long 値を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromI8
8 バイト整数値を short 値に変換する。
%group
Win32 oleaut32
%prm
i64In, psOut
i64In : [int64] 変換する値。
psOut : [var] 変換結果の値。
%inst
8 バイト整数値を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromR4
float 値を short 値に変換する。
%group
Win32 oleaut32
%prm
fltIn, psOut
fltIn : [float] 変換する値。
psOut : [var] 変換結果の値。
%inst
float 値を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromR8
double 値を short 値に変換する。
%group
Win32 oleaut32
%prm
dblIn, psOut
dblIn : [double] 変換する値。
psOut : [var] 変換結果の値。
%inst
double 値を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromStr
OLECHAR 文字列を short 値に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, psOut
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
psOut : [var] 変換結果の値。
%inst
OLECHAR 文字列を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromUI1
unsigned char 値を short 値に変換する。
%group
Win32 oleaut32
%prm
bIn, psOut
bIn : [int] 変換する値。
psOut : [var] 変換結果の値。
%inst
unsigned char 値を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromUI2
unsigned short 値を short 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, psOut
uiIn : [int] 変換する値。
psOut : [var] 変換結果の値。
%inst
unsigned short 値を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromUI4
unsigned long 値を short 値に変換する。
%group
Win32 oleaut32
%prm
ulIn, psOut
ulIn : [int] 変換する値。
psOut : [var] 変換結果の値。
%inst
unsigned long 値を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI2FromUI8
8 バイト符号なし整数値を short 値に変換する。
%group
Win32 oleaut32
%prm
ui64In, psOut
ui64In : [int64] 変換する値。
psOut : [var] 変換結果の値。
%inst
8 バイト符号なし整数値を short 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI4FromBool
Boolean 値を long 値に変換する。
%group
Win32 oleaut32
%prm
boolIn, plOut
boolIn : [int] 変換する値。
plOut : [var] 変換結果の値。
%inst
Boolean 値を long 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI4FromCy
currency 値を long 値に変換する。
%group
Win32 oleaut32
%prm
cyIn, plOut
cyIn : [var] 変換する値。
plOut : [var] 変換結果の値。
%inst
currency 値を long 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI4FromDate
date 値を long 値に変換する。
%group
Win32 oleaut32
%prm
dateIn, plOut
dateIn : [double] 変換する値。
plOut : [var] 変換結果の値。
%inst
date 値を long 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI4FromDec
decimal 値を long 値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, plOut
pdecIn : [var] 変換する値。
plOut : [var] 変換結果の値。
%inst
decimal 値を long 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI4FromDisp
IDispatch インスタンスの既定プロパティを long 値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, plOut
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
plOut : [var] 変換結果の値。
%inst
IDispatch インスタンスの既定プロパティを long 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI4FromI1
char 値を long 値に変換する。
%group
Win32 oleaut32
%prm
cIn, plOut
cIn : [int] 変換する値。
plOut : [var] 変換結果の値。
%inst
char 値を long 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI4FromI2
short 値を long 値に変換する。
%group
Win32 oleaut32
%prm
sIn, plOut
sIn : [int] 変換する値。
plOut : [var] 変換結果の値。
%inst
short 値を long 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI4FromI8
8 バイト整数値を long 値に変換する。
%group
Win32 oleaut32
%prm
i64In, plOut
i64In : [int64] 変換する値。
plOut : [var] 変換結果の値。
%inst
8 バイト整数値を long 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI4FromR4
float 値を long 値に変換する。
%group
Win32 oleaut32
%prm
fltIn, plOut
fltIn : [float] 変換する値。
plOut : [var] 変換結果の値。
%inst
float 値を long 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI4FromR8
double 値を long 値に変換する。
%group
Win32 oleaut32
%prm
dblIn, plOut
dblIn : [double] 変換する値。
plOut : [var] 変換結果の値。
%inst
double 値を long 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI4FromStr
OLECHAR 文字列を long 値に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, plOut
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のフラグの 1 つ以上。
plOut : [var] 変換結果の値。
%inst
OLECHAR 文字列を long 値に変換する。

[戻り値]
この関数は次のいずれかの値を返す。
（以下省略）


%index
VarI4FromUI1
符号なし char 値を long 値に変換する。
%group
Win32 oleaut32
%prm
bIn, plOut
bIn : [int] 変換する値。
plOut : [var] 変換後の値。
%inst
符号なし char 値を long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI4FromUI2
符号なし short 値を long 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, plOut
uiIn : [int] 変換する値。
plOut : [var] 変換後の値。
%inst
符号なし short 値を long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI4FromUI4
符号なし long 値を long 値に変換する。
%group
Win32 oleaut32
%prm
ulIn, plOut
ulIn : [int] 変換する値。
plOut : [var] 変換後の値。
%inst
符号なし long 値を long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI4FromUI8
8 バイト符号なし整数値を long に変換する。
%group
Win32 oleaut32
%prm
ui64In, plOut
ui64In : [int64] 変換する値。
plOut : [var] 変換後の値。
%inst
8 バイト符号なし整数値を long に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromBool
Boolean 値を 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
boolIn, pi64Out
boolIn : [int] 変換する値。
pi64Out : [var] 変換後の値。
%inst
Boolean 値を 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromCy
通貨値を 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
cyIn, pi64Out
cyIn : [var] 変換する値。
pi64Out : [var] 変換後の値。
%inst
通貨値を 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromDate
日付値を 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
dateIn, pi64Out
dateIn : [double] 変換する値。
pi64Out : [var] 変換後の値。
%inst
日付値を 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromDec
decimal 値を 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, pi64Out
pdecIn : [var] 変換する値。
pi64Out : [var] 変換後の値。
%inst
decimal 値を 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromDisp
IDispatch インスタンスの既定のプロパティを 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, pi64Out
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
pi64Out : [var] 変換後の値。
%inst
IDispatch インスタンスの既定のプロパティを 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromI1
char 値を 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
cIn, pi64Out
cIn : [int] 変換する値。
pi64Out : [var] 変換後の値。
%inst
char 値を 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromI2
short 値を 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
sIn, pi64Out
sIn : [int] 変換する値。
pi64Out : [var] 変換後の値。
%inst
short 値を 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromR4
float 値を 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
fltIn, pi64Out
fltIn : [float] 変換する値。
pi64Out : [var] 変換後の値。
%inst
float 値を 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromR8
double 値を 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
dblIn, pi64Out
dblIn : [double] 変換する値。
pi64Out : [var] 変換後の値。
%inst
double 値を 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromStr
OLECHAR 文字列を 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pi64Out
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のいずれか 1 つ以上のフラグ。
pi64Out : [var] 変換後の値。
%inst
OLECHAR 文字列を 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromUI1
符号なしバイト値を 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
bIn, pi64Out
bIn : [int] 変換する値。
pi64Out : [var] 変換後の値。
%inst
符号なしバイト値を 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromUI2
符号なし short 値を 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pi64Out
uiIn : [int] 変換する値。
pi64Out : [var] 変換後の値。
%inst
符号なし short 値を 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromUI4
符号なし long 値を 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
ulIn, pi64Out
ulIn : [int] 変換する値。
pi64Out : [var] 変換後の値。
%inst
符号なし long 値を 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarI8FromUI8
符号なし 8 バイト整数値を 8 バイト整数値に変換する。
%group
Win32 oleaut32
%prm
ui64In, pi64Out
ui64In : [int64] 変換する値。
pi64Out : [var] 変換後の値。
%inst
符号なし 8 バイト整数値を 8 バイト整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarIdiv
任意の型の 2 つの variant を整数に変換し、それらを除算した結果を返す。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] 1 番目の variant。
pvarRight : [var] 2 番目の variant。
pvarResult : [var] 結果の variant。
%inst
任意の型の 2 つの variant を整数に変換し、それらを除算した結果を返す。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
この関数は次のように動作する。
（以下省略）


%index
VarImp
2 つの variant に対してビット単位の論理包含 (implication) を行う。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] 1 番目の variant。
pvarRight : [var] 2 番目の variant。
pvarResult : [var] 結果の variant。
%inst
2 つの variant に対してビット単位の論理包含 (implication) を行う。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
この関数は次のように動作する。
（以下省略）


%index
VarInt
variant の整数部分を返す。(VarInt)
%group
Win32 oleaut32
%prm
pvarIn, pvarResult
pvarIn : [var] variant。
pvarResult : [var] 結果の variant。
%inst
variant の整数部分を返す。(VarInt)

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
variant が負の場合、variant 以下で最大の負整数が返される。


%index
VarMod
2 つの variant を除算し、剰余のみを返す。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] 1 番目の variant。
pvarRight : [var] 2 番目の variant。
pvarResult : [var] 結果の variant。
%inst
2 つの variant を除算し、剰余のみを返す。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
VarMonthName
ローカライズされた月名を含む文字列を返す。
%group
Win32 oleaut32
%prm
iMonth, fAbbrev, dwFlags, pbstrOut
iMonth : [int] 1 から 12 までの数値で表される月。
fAbbrev : [int] 0 の場合は省略しない月名を使用する。0 以外の場合は月名の省略形を使用する。
dwFlags : [int] 設定可能なフラグは VAR_CALENDAR_HIJRI のみ。
pbstrOut : [var] variant を表す書式化された文字列を受け取る。
%inst
ローカライズされた月名を含む文字列を返す。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarMul
2 つの variant を乗算した結果を返す。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] 1 番目の variant。
pvarRight : [var] 2 番目の variant。
pvarResult : [var] 結果の variant。
%inst
2 つの variant を乗算した結果を返す。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
この関数は次のように動作する。
（以下省略）


%index
VarNeg
variant に対して論理否定を行う。
%group
Win32 oleaut32
%prm
pvarIn, pvarResult
pvarIn : [var] variant。
pvarResult : [var] 結果の variant。
%inst
variant に対して論理否定を行う。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
VarNot
variant に対してビット単位の not 否定演算を行う。
%group
Win32 oleaut32
%prm
pvarIn, pvarResult
pvarIn : [var] variant。
pvarResult : [var] 結果の variant。
%inst
variant に対してビット単位の not 否定演算を行う。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
この関数は次のように動作する。
（以下省略）


%index
VarNumFromParseNum
解析結果を variant に変換する。
%group
Win32 oleaut32
%prm
pnumprs, rgbDig, dwVtBits, pvar
pnumprs : [var] 解析結果。この引数の cDig メンバは rgbDig に含まれる桁数を指定する。
rgbDig : [var] 各桁の値。pnumprs の cDig フィールドが桁数を保持する。
dwVtBits : [int] 戻り値として受け入れる型ごとに 1 ビットを設定する (多くの場合は 1 ビットのみ)。
pvar : [var] 結果の variant。
%inst
解析結果を variant に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）

[備考]
10 進数を丸める場合、桁配列はデータ型に必要な最大桁数より少なくとも 1 桁多くなければならない。DECIMAL
データ型に必要な最大桁数は 29 なので、桁配列には 30 桁分の領域が必要である。また、8
進数解析オプションが選択されている場合、その数値を受け入れるのに十分な桁数も必要である。(16 進数および 8 進数は
VarNumFromParseNum によって符号なし long [32 ビット] の大きさに制限されるため、11 桁の 8
進数が必要となる。)


%index
VarOr
2 つの variant に対して論理和を行う。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] 1 番目の variant。
pvarRight : [var] 2 番目の variant。
pvarResult : [var] 結果の variant。
%inst
2 つの variant に対して論理和を行う。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
この関数は次のように動作する。
（以下省略）


%index
VarParseNumFromStr
文字列を解析し、それが表す数値を型に依存しない形で記述する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pnumprs, rgbDig
strIn : [wstr] 変換する入力文字列。
lcid : [int] ロケール識別子。
dwFlags : [int] 呼び出し元が解析を制御し、数値として許容される構文を定義できるようにする。このフィールドが 0 に設定されている場合、入力文字列には 10 進数の数字以外を含めてはならない。定義済みの各フラグビットを設定すると、その構文機能の解析が有効になる。標準の Automation 解析 (例: VarI2FromStr で使用されるもの) はすべてのフラグが設定されている (NUMPRS_STD)。
pnumprs : [var] 解析結果。
rgbDig : [var] 数値が 8 進数、10 進数、16 進数のいずれであるかに応じて、0?7、0?9、0?15 の範囲の桁の値。先頭のゼロはすべて取り除かれている。10 進数の場合、末尾のゼロも取り除かれる。ただし数値がゼロの場合は単一のゼロ桁が存在する。
%inst
文字列を解析し、それが表す数値を型に依存しない形で記述する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarPow
2 つの variant でべき乗関数を実行した結果を返す。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] 1 番目の variant。
pvarRight : [var] 2 番目の variant。
pvarResult : [var] 結果の variant。
%inst
2 つの variant でべき乗関数を実行した結果を返す。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
pvarLeft を pvarRight で累乗した結果を返す。


%index
VarR4CmpR8
float 型と double 型の 2 つの variant を比較する。
%group
Win32 oleaut32
%prm
fltLeft, dblRight
fltLeft : [float] 1 番目の variant。
dblRight : [double] 2 番目の variant。
%inst
float 型と double 型の 2 つの variant を比較する。

[戻り値]
関数は SUCCESS HRESULT として次の値を返す。
（以下省略）


%index
VarR4FromBool
Boolean 値を float 値に変換する。
%group
Win32 oleaut32
%prm
boolIn, pfltOut
boolIn : [int] 変換する値。
pfltOut : [var] 変換後の値。
%inst
Boolean 値を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromCy
通貨値を float 値に変換する。
%group
Win32 oleaut32
%prm
cyIn, pfltOut
cyIn : [var] 変換する値。
pfltOut : [var] 変換後の値。
%inst
通貨値を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromDate
日付値を float 値に変換する。
%group
Win32 oleaut32
%prm
dateIn, pfltOut
dateIn : [double] 変換する値。
pfltOut : [var] 変換後の値。
%inst
日付値を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromDec
decimal 値を float 値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, pfltOut
pdecIn : [var] 変換する値。
pfltOut : [var] 変換後の値。
%inst
decimal 値を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromDisp
IDispatch インスタンスの既定のプロパティを float 値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, pfltOut
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
pfltOut : [var] 変換後の値。
%inst
IDispatch インスタンスの既定のプロパティを float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromI1
char 値を float 値に変換する。
%group
Win32 oleaut32
%prm
cIn, pfltOut
cIn : [int] 変換する値。
pfltOut : [var] 変換後の値。
%inst
char 値を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromI2
short 値を float 値に変換する。
%group
Win32 oleaut32
%prm
sIn, pfltOut
sIn : [int] 変換する値。
pfltOut : [var] 変換後の値。
%inst
short 値を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromI4
long 値を float 値に変換する。
%group
Win32 oleaut32
%prm
lIn, pfltOut
lIn : [int] 変換する値。
pfltOut : [var] 変換後の値。
%inst
long 値を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromI8
8 バイト整数値を float 値に変換する。
%group
Win32 oleaut32
%prm
i64In, pfltOut
i64In : [int64] 変換する値。
pfltOut : [var] 変換後の値。
%inst
8 バイト整数値を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromR8
double 値を float 値に変換する。
%group
Win32 oleaut32
%prm
dblIn, pfltOut
dblIn : [double] 変換する値。
pfltOut : [var] 変換後の値。
%inst
double 値を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromStr
OLECHAR 文字列を float 値に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pfltOut
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のいずれか 1 つ以上のフラグ。
pfltOut : [var] 変換後の値。
%inst
OLECHAR 文字列を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromUI1
符号なし char 値を float 値に変換する。
%group
Win32 oleaut32
%prm
bIn, pfltOut
bIn : [int] 変換する値。
pfltOut : [var] 変換後の値。
%inst
符号なし char 値を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromUI2
符号なし short 値を float 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pfltOut
uiIn : [int] 変換する値。
pfltOut : [var] 変換後の値。
%inst
符号なし short 値を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromUI4
符号なし long 値を float 値に変換する。
%group
Win32 oleaut32
%prm
ulIn, pfltOut
ulIn : [int] 変換する値。
pfltOut : [var] 変換後の値。
%inst
符号なし long 値を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR4FromUI8
符号なし 8 バイト整数値を float 値に変換する。
%group
Win32 oleaut32
%prm
ui64In, pfltOut
ui64In : [int64] 変換する値。
pfltOut : [var] 変換後の値。
%inst
符号なし 8 バイト整数値を float 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromBool
Boolean 値を double 値に変換する。
%group
Win32 oleaut32
%prm
boolIn, pdblOut
boolIn : [int] 変換する値。
pdblOut : [var] 変換後の値。
%inst
Boolean 値を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromCy
通貨値を double 値に変換する。
%group
Win32 oleaut32
%prm
cyIn, pdblOut
cyIn : [var] 変換する値。
pdblOut : [var] 変換後の値。
%inst
通貨値を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromDate
日付値を double 値に変換する。
%group
Win32 oleaut32
%prm
dateIn, pdblOut
dateIn : [double] 変換する値。
pdblOut : [var] 変換後の値。
%inst
日付値を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromDec
decimal 値を double 値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, pdblOut
pdecIn : [var] 変換する値。
pdblOut : [var] 変換後の値。
%inst
decimal 値を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromDisp
IDispatch インスタンスの既定のプロパティを double 値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, pdblOut
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
pdblOut : [var] 変換後の値。
%inst
IDispatch インスタンスの既定のプロパティを double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromI1
char 値を double 値に変換する。
%group
Win32 oleaut32
%prm
cIn, pdblOut
cIn : [int] 変換する値。
pdblOut : [var] 変換後の値。
%inst
char 値を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromI2
short 値を double 値に変換する。
%group
Win32 oleaut32
%prm
sIn, pdblOut
sIn : [int] 変換する値。
pdblOut : [var] 変換後の値。
%inst
short 値を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromI4
long 値を double 値に変換する。
%group
Win32 oleaut32
%prm
lIn, pdblOut
lIn : [int] 変換する値。
pdblOut : [var] 変換後の値。
%inst
long 値を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromI8
8 バイト整数値を double 値に変換する。
%group
Win32 oleaut32
%prm
i64In, pdblOut
i64In : [int64] 変換する値。
pdblOut : [var] 変換後の値。
%inst
8 バイト整数値を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromR4
float 値を double 値に変換する。
%group
Win32 oleaut32
%prm
fltIn, pdblOut
fltIn : [float] 変換する値。
pdblOut : [var] 変換後の値。
%inst
float 値を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromStr
OLECHAR 文字列を double 値に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pdblOut
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のいずれか 1 つ以上のフラグ。
pdblOut : [var] 変換後の値。
%inst
OLECHAR 文字列を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromUI1
符号なし char 値を double 値に変換する。
%group
Win32 oleaut32
%prm
bIn, pdblOut
bIn : [int] 変換する値。
pdblOut : [var] 変換後の値。
%inst
符号なし char 値を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromUI2
符号なし short 値を double 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pdblOut
uiIn : [int] 変換する値。
pdblOut : [var] 変換後の値。
%inst
符号なし short 値を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromUI4
符号なし long 値を double 値に変換する。
%group
Win32 oleaut32
%prm
ulIn, pdblOut
ulIn : [int] 変換する値。
pdblOut : [var] 変換後の値。
%inst
符号なし long 値を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8FromUI8
8 バイト符号なし整数値を double 値に変換する。
%group
Win32 oleaut32
%prm
ui64In, pdblOut
ui64In : [int64] 変換する値。
pdblOut : [var] 変換後の値。
%inst
8 バイト符号なし整数値を double 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarR8Pow
double 型の variant に対してべき乗関数を実行する。
%group
Win32 oleaut32
%prm
dblLeft, dblRight, pdblResult
dblLeft : [double] 1 番目の variant。
dblRight : [double] 2 番目の variant。
pdblResult : [var] 結果。
%inst
double 型の variant に対してべき乗関数を実行する。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
VarR8Round
double 型の variant を指定された小数点以下の桁数に丸める。
%group
Win32 oleaut32
%prm
dblIn, cDecimals, pdblResult
dblIn : [double] variant。
cDecimals : [int] 小数点以下の桁数。
pdblResult : [var] 結果。
%inst
double 型の variant を指定された小数点以下の桁数に丸める。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
VarRound
variant を指定された小数点以下の桁数に丸める。
%group
Win32 oleaut32
%prm
pvarIn, cDecimals, pvarResult
pvarIn : [var] variant。
cDecimals : [int] 小数点以下の桁数。
pvarResult : [var] 結果の variant。
%inst
variant を指定された小数点以下の桁数に丸める。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
VarSub
2 つの variant を減算する。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] 1 番目の variant。
pvarRight : [var] 2 番目の variant。
pvarResult : [var] 結果の variant。
%inst
2 つの variant を減算する。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
この関数は次のように動作する。
（以下省略）


%index
VarTokenizeFormatString
実際の書式文字列を一連のトークンに解析する。これらのトークンを使用して VarFormatFromTokens で variant を書式化できる。
%group
Win32 oleaut32
%prm
pstrFormat, rgbTok, cbTok, iFirstDay, iFirstWeek, lcid, pcbActual
pstrFormat : [wstr] 書式文字列。例えば "mm-dd-yy"。
rgbTok : [var] 出力先トークンバッファ。
cbTok : [int] 出力先トークンバッファのサイズ。
iFirstDay : [int] 週の最初の日。
iFirstWeek : [int] 年の最初の週。
lcid : [int] 書式文字列を解釈するロケール。
pcbActual : [var] 最初に生成されたトークンが設定される整数を指す。このパラメータは NULL でも構わない。
%inst
実際の書式文字列を一連のトークンに解析する。これらのトークンを使用して VarFormatFromTokens で variant
を書式化できる。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）

[備考]
書式文字列を 1 度解析してそれを繰り返し使用する方が、VarFormat を繰り返し呼び出すよりも通常は高速である。VarFormat
は呼び出しごとに VarTokenizeFormatString
を呼び出すためである。渡したロケールは書式文字列の解釈方法を制御するが、VarFormatFromTokens
の実際の出力の見え方を制御するわけではない。


%index
VarUI1FromBool
Boolean 値を符号なし char 値に変換する。
%group
Win32 oleaut32
%prm
boolIn, pbOut
boolIn : [int] 変換する値。
pbOut : [var] 変換後の値。
%inst
Boolean 値を符号なし char 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromCy
通貨値を符号なし char 値に変換する。
%group
Win32 oleaut32
%prm
cyIn, pbOut
cyIn : [var] 変換する値。
pbOut : [var] 変換後の値。
%inst
通貨値を符号なし char 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromDate
日付値を符号なし char 値に変換する。
%group
Win32 oleaut32
%prm
dateIn, pbOut
dateIn : [double] 変換する値。
pbOut : [var] 変換後の値。
%inst
日付値を符号なし char 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromDec
decimal 値を符号なし char 値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, pbOut
pdecIn : [var] 変換する値。
pbOut : [var] 変換後の値。
%inst
decimal 値を符号なし char 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromDisp
IDispatch インスタンスの既定のプロパティを符号なし char 値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, pbOut
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
pbOut : [var] 変換後の値。
%inst
IDispatch インスタンスの既定のプロパティを符号なし char 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromI1
char 値を符号なし char 値に変換する。
%group
Win32 oleaut32
%prm
cIn, pbOut
cIn : [int] 変換する値。
pbOut : [var] 変換後の値。
%inst
char 値を符号なし char 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromI2
short 値を符号なし char 値に変換する。
%group
Win32 oleaut32
%prm
sIn, pbOut
sIn : [int] 変換する値。
pbOut : [var] 変換後の値。
%inst
short 値を符号なし char 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromI4
long 値を符号なし char 値に変換する。
%group
Win32 oleaut32
%prm
lIn, pbOut
lIn : [int] 変換する値。
pbOut : [var] 変換後の値。
%inst
long 値を符号なし char 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromI8
8 バイト整数値をバイト値に変換する。
%group
Win32 oleaut32
%prm
i64In, pbOut
i64In : [int64] 変換する値。
pbOut : [var] 変換後の値。
%inst
8 バイト整数値をバイト値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromR4
float 値を符号なし char 値に変換する。
%group
Win32 oleaut32
%prm
fltIn, pbOut
fltIn : [float] 変換する値。
pbOut : [var] 変換後の値。
%inst
float 値を符号なし char 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromR8
double 値を符号なし char 値に変換する。
%group
Win32 oleaut32
%prm
dblIn, pbOut
dblIn : [double] 変換する値。
pbOut : [var] 変換後の値。
%inst
double 値を符号なし char 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromStr
OLECHAR 文字列を符号なし char 文字列に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pbOut
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のいずれか 1 つ以上のフラグ。
pbOut : [var] 変換後の値。
%inst
OLECHAR 文字列を符号なし char 文字列に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromUI2
符号なし short 値を符号なし char 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pbOut
uiIn : [int] 変換する値。
pbOut : [var] 変換後の値。
%inst
符号なし short 値を符号なし char 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromUI4
符号なし long 値を符号なし char 値に変換する。
%group
Win32 oleaut32
%prm
ulIn, pbOut
ulIn : [int] 変換する値。
pbOut : [var] 変換後の値。
%inst
符号なし long 値を符号なし char 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI1FromUI8
8 バイト符号なし整数値をバイト値に変換する。
%group
Win32 oleaut32
%prm
ui64In, pbOut
ui64In : [int64] 変換する値。
pbOut : [var] 変換後の値。
%inst
8 バイト符号なし整数値をバイト値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromBool
Boolean 値を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
boolIn, puiOut
boolIn : [int] 変換する値。
puiOut : [var] 変換後の値。
%inst
Boolean 値を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromCy
通貨値を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
cyIn, puiOut
cyIn : [var] 変換する値。
puiOut : [var] 変換後の値。
%inst
通貨値を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromDate
日付値を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
dateIn, puiOut
dateIn : [double] 変換する値。
puiOut : [var] 変換後の値。
%inst
日付値を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromDec
decimal 値を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, puiOut
pdecIn : [var] 変換する値。
puiOut : [var] 変換後の値。
%inst
decimal 値を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromDisp
IDispatch インスタンスの既定のプロパティを符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, puiOut
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
puiOut : [var] 変換後の値。
%inst
IDispatch インスタンスの既定のプロパティを符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromI1
char 値を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
cIn, puiOut
cIn : [int] 変換する値。
puiOut : [var] 変換後の値。
%inst
char 値を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromI2
short 値を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, puiOut
uiIn : [int] 変換する値。
puiOut : [var] 変換後の値。
%inst
short 値を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromI4
long 値を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
lIn, puiOut
lIn : [int] 変換する値。
puiOut : [var] 変換後の値。
%inst
long 値を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromI8
8 バイト整数値を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
i64In, puiOut
i64In : [int64] 変換する値。
puiOut : [var] 変換後の値。
%inst
8 バイト整数値を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromR4
float 値を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
fltIn, puiOut
fltIn : [float] 変換する値。
puiOut : [var] 変換後の値。
%inst
float 値を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromR8
double 値を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
dblIn, puiOut
dblIn : [double] 変換する値。
puiOut : [var] 変換後の値。
%inst
double 値を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromStr
OLECHAR 文字列を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, puiOut
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のいずれか 1 つ以上のフラグ。
puiOut : [var] 変換後の値。
%inst
OLECHAR 文字列を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromUI1
符号なし char 値を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
bIn, puiOut
bIn : [int] 変換する値。
puiOut : [var] 変換後の値。
%inst
符号なし char 値を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromUI4
符号なし long 値を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
ulIn, puiOut
ulIn : [int] 変換する値。
puiOut : [var] 変換後の値。
%inst
符号なし long 値を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI2FromUI8
8 バイト符号なし整数値を符号なし short 値に変換する。
%group
Win32 oleaut32
%prm
i64In, puiOut
i64In : [int64] 変換する値。
puiOut : [var] 変換後の値。
%inst
8 バイト符号なし整数値を符号なし short 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromBool
Boolean 値を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
boolIn, pulOut
boolIn : [int] 変換する値。
pulOut : [var] 変換後の値。
%inst
Boolean 値を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromCy
通貨値を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
cyIn, pulOut
cyIn : [var] 変換する値。
pulOut : [var] 変換後の値。
%inst
通貨値を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromDate
日付値を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
dateIn, pulOut
dateIn : [double] 変換する値。
pulOut : [var] 変換後の値。
%inst
日付値を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromDec
decimal 値を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, pulOut
pdecIn : [var] 変換する値。
pulOut : [var] 変換後の値。
%inst
decimal 値を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromDisp
IDispatch インスタンスの既定のプロパティを符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, pulOut
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
pulOut : [var] 変換後の値。
%inst
IDispatch インスタンスの既定のプロパティを符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromI1
char 値を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
cIn, pulOut
cIn : [int] 変換する値。
pulOut : [var] 変換後の値。
%inst
char 値を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromI2
short 値を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pulOut
uiIn : [int] 変換する値。
pulOut : [var] 変換後の値。
%inst
short 値を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromI4
long 値を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
lIn, pulOut
lIn : [int] 変換する値。
pulOut : [var] 変換後の値。
%inst
long 値を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromI8
8 バイト整数値を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
i64In, plOut
i64In : [int64] 変換する値。
plOut : [var] 変換後の値。
%inst
8 バイト整数値を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromR4
float 値を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
fltIn, pulOut
fltIn : [float] 変換する値。
pulOut : [var] 変換後の値。
%inst
float 値を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromR8
double 値を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
dblIn, pulOut
dblIn : [double] 変換する値。
pulOut : [var] 変換後の値。
%inst
double 値を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromStr
OLECHAR 文字列を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pulOut
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のいずれか 1 つ以上のフラグ。
pulOut : [var] 変換後の値。
%inst
OLECHAR 文字列を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromUI1
符号なし char 値を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
bIn, pulOut
bIn : [int] 変換する値。
pulOut : [var] 変換後の値。
%inst
符号なし char 値を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromUI2
符号なし short 値を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pulOut
uiIn : [int] 変換する値。
pulOut : [var] 変換後の値。
%inst
符号なし short 値を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI4FromUI8
8 バイト符号なし整数値を符号なし long 値に変換する。
%group
Win32 oleaut32
%prm
ui64In, plOut
ui64In : [int64] 変換する値。
plOut : [var] 変換後の値。
%inst
8 バイト符号なし整数値を符号なし long 値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromBool
VARIANT_BOOL 値を 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
boolIn, pi64Out
boolIn : [int] 変換する値。
pi64Out : [var] 変換後の値。
%inst
VARIANT_BOOL 値を 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromCy
通貨値を 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
cyIn, pi64Out
cyIn : [var] 変換する値。
pi64Out : [var] 変換後の値。
%inst
通貨値を 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromDate
日付値を 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
dateIn, pi64Out
dateIn : [double] 変換する値。
pi64Out : [var] 変換後の値。
%inst
日付値を 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromDec
decimal 値を 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
pdecIn, pi64Out
pdecIn : [var] 変換する値。
pi64Out : [var] 変換後の値。
%inst
decimal 値を 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromDisp
IDispatch インスタンスの既定のプロパティを 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
pdispIn, lcid, pi64Out
pdispIn : [var] 変換する値。
lcid : [int] ロケール識別子。
pi64Out : [var] 変換後の値。
%inst
IDispatch インスタンスの既定のプロパティを 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromI1
char 値を 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
cIn, pi64Out
cIn : [int] 変換する値。
pi64Out : [var] 変換後の値。
%inst
char 値を 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromI2
short 値を 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
sIn, pi64Out
sIn : [int] 変換する値。
pi64Out : [var] 変換後の値。
%inst
short 値を 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromI8
8 バイト整数値を 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
ui64In, pi64Out
ui64In : [int64] 変換する値。
pi64Out : [var] 変換後の値。
%inst
8 バイト整数値を 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromR4
float 値を 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
fltIn, pi64Out
fltIn : [float] 変換する値。
pi64Out : [var] 変換後の値。
%inst
float 値を 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromR8
double 値を 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
dblIn, pi64Out
dblIn : [double] 変換する値。
pi64Out : [var] 変換後の値。
%inst
double 値を 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromStr
OLECHAR 文字列を 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pi64Out
strIn : [wstr] 変換する値。
lcid : [int] ロケール識別子。
dwFlags : [int] 次のいずれか 1 つ以上のフラグ。
pi64Out : [var] 変換後の値。
%inst
OLECHAR 文字列を 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromUI1
バイト値を 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
bIn, pi64Out
bIn : [int] 変換する値。
pi64Out : [var] 変換後の値。
%inst
バイト値を 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromUI2
符号なし short 値を 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
uiIn, pi64Out
uiIn : [int] 変換する値。
pi64Out : [var] 変換後の値。
%inst
符号なし short 値を 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUI8FromUI4
符号なし long 値を 8 バイト符号なし整数値に変換する。
%group
Win32 oleaut32
%prm
ulIn, pi64Out
ulIn : [int] 変換する値。
pi64Out : [var] 変換後の値。
%inst
符号なし long 値を 8 バイト符号なし整数値に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarUdateFromDate
variant 形式から MS-DOS 形式に変換した時刻と日付を変換する。
%group
Win32 oleaut32
%prm
dateIn, dwFlags, pudateOut
dateIn : [double] パックされた日付。
dwFlags : [int] ヒジュラ暦、ポーランド暦、ロシア暦などの代替カレンダー用に設定する。
pudateOut : [var] アンパックされた日付。
%inst
variant 形式から MS-DOS 形式に変換した時刻と日付を変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）

[備考]
UDATE 構造体は VarDateFromUdate および VarUdateFromDate
と共に使用される。これは「アンパックされた」日付を表す。
（以下省略）


%index
VarWeekdayName
ローカライズされた曜日名を含む文字列を返す。
%group
Win32 oleaut32
%prm
iWeekday, fAbbrev, iFirstDay, dwFlags, pbstrOut
iWeekday : [int] 曜日。
fAbbrev : [int] 0 の場合は省略しない曜日名を使用する。0 以外の場合は曜日名の省略形を使用する。
iFirstDay : [int] 週の最初の日。
dwFlags : [int] 設定可能なフラグは VAR_CALENDAR_HIJRI のみ。
pbstrOut : [var] variant を表す書式化された文字列を受け取る。
%inst
ローカライズされた曜日名を含む文字列を返す。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）


%index
VarXor
2 つの variant に対して論理排他を行う。
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] 1 番目の variant。
pvarRight : [var] 2 番目の variant。
pvarResult : [var] 結果の variant。
%inst
2 つの variant に対して論理排他を行う。

[戻り値]
関数が成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
この関数は次のように動作する。
（以下省略）


%index
VariantChangeType
variant をある型から別の型に変換する。
%group
Win32 oleaut32
%prm
pvargDest, pvarSrc, wFlags, vt
pvargDest : [var] 変換先の variant。pvarSrc と同じ場合、variant はその場で変換される。
pvarSrc : [var] 変換する variant。
wFlags : [int] フラグ。
vt : [int] 変換先の型。戻り値が S_OK の場合、*pvargDest の vt フィールドはこの値と等しいことが保証される。
%inst
variant をある型から別の型に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）

[備考]
VariantChangeType 関数は基本型間の型変換 (数値から文字列、文字列から数値への変換を含む) を扱う。pvarSrc
引数は変換処理中に変更される。例えば、ソース variant が VT_BOOL 型で変換先が VT_UINT 型の場合、pvarSrc
引数はまず VT_I2 に変換され、その後変換が進められる。VT_BYREF が設定されている variant
は、参照先の値を取得することで値に変換される。オブジェクトはオブジェクトの Value プロパティ (DISPID_VALUE)
を呼び出すことで値に変換される。通常、IDispatch::Invoke の実装者はアクセスされているメンバを判断し、その後 1
つ以上の引数の値を取得するために VariantChangeType を呼び出す。例えば、IDispatch 呼び出しが文字列引数を 1
つ取る SetTitle メンバを指定している場合、実装者は引数を VT_BSTR に強制変換するために
VariantChangeType を呼び出す。VariantChangeType がエラーを返さなければ、引数を VARIANTARG
の bstrVal フィールドから直接取得できる。VariantChangeType が DISP_E_TYPEMISMATCH
を返した場合、実装者は *puArgErr に 0 を設定し (エラーのある引数を示す)、Invoke から
DISP_E_TYPEMISMATCH を返す。この関数では、ある型の配列を別の型の配列に変換することはできない。注意
VARIANTARG の型を rgvarg 配列内でその場で変更してはならない。


%index
VariantChangeTypeEx
LCID を使用して variant をある型から別の型に変換する。
%group
Win32 oleaut32
%prm
pvargDest, pvarSrc, lcid, wFlags, vt
pvargDest : [var] 変換先の variant。pvarSrc と同じ場合、variant はその場で変換される。
pvarSrc : [var] 変換する variant。
lcid : [int] ロケール識別子。LCID は、ソースまたは変換先の VARIANTARG の型が VT_BSTR、VT_DISPATCH、VT_DATE のいずれかである場合に有用である。
wFlags : [int] フラグ。
vt : [int] 変換先の型。戻り値が S_OK の場合、*pvargDest の vt フィールドはこの値と等しいことが保証される。
%inst
LCID を使用して variant をある型から別の型に変換する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）

[備考]
VariantChangeTypeEx 関数は基本型間の型変換 (数値から文字列、文字列から数値への変換を含む) を扱う。VT_BYREF
が設定されている variant は、参照先の値を取得することで値に変換される。オブジェクトはオブジェクトの Value プロパティ
(DISPID_VALUE) を呼び出すことで値に変換される。通常、IDispatch::Invoke
の実装者はアクセスされているメンバを判断し、その後 1 つ以上の引数の値を取得するために VariantChangeType
を呼び出す。例えば、IDispatch 呼び出しが文字列引数を 1 つ取る SetTitle メンバを指定している場合、実装者は引数を
VT_BSTR に強制変換するために VariantChangeTypeEx を呼び出す。VariantChangeTypeEx
がエラーを返さなければ、引数を VARIANTARG の bstrVal
フィールドから直接取得できる。VariantChangeTypeEx が DISP_E_TYPEMISMATCH を返した場合、実装者は
*puArgErr に 0 を設定し (エラーのある引数を示す)、IDispatch::Invoke から
DISP_E_TYPEMISMATCH を返す。この関数では、ある型の配列を別の型の配列に変換することはできない。注意
VARIANTARG の型を rgvarg 配列内でその場で変更してはならない。


%index
VariantClear
variant をクリアする。
%group
Win32 oleaut32
%prm
pvarg
pvarg : [var] クリアする variant。
%inst
variant をクリアする。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）

[備考]
VARIANTARG (または VARIANT) 型の変数を含むメモリが解放される前 (ローカル変数がスコープから外れる時など)
に、この関数を使用して変数をクリアする。この関数は vt フィールドを VT_EMPTY に設定することで VARIANTARG
をクリアする。VARIANTARG の現在の内容が最初に解放される。vt フィールドが VT_BSTR の場合、文字列が解放される。vt
フィールドが VT_DISPATCH の場合、オブジェクトが解放される。vt フィールドに VT_ARRAY
ビットが設定されている場合、配列が解放される。クリアされる variant が参照によって渡された COM オブジェクトの場合、pvarg
パラメータの vt フィールドは VT_DISPATCH | VT_BYREF または VT_UNKNOWN | VT_BYREF
となる。この場合、VariantClear はオブジェクトを解放しない。クリアされる variant
がオブジェクトへの参照へのポインタであるため、VariantClear
はオブジェクトを解放する必要があるかどうかを判断する方法を持たない。したがって、必要に応じてオブジェクトを解放するかどうかは呼び出し元の責任となる。場合によっては、VariantClear
を呼び出さずにコード内で variant をクリアする方が望ましいことがある。例えば、この関数を呼び出さずに VT_I4 variant
の型を別の型に変更できる。BSTR の safe array は、各要素に対して VariantClear ではなく
SysFreeString が呼び出される。ただし、VT_type を受信したが処理できない場合は VariantClear
を呼び出す必要がある。variant の safe array も各メンバに対して VariantClear
が呼び出される。これらの場合に VariantClear を使用することで、Automation が将来新しい variant
型を追加してもコードが動作し続けることが保証される。未初期化の variant に対して VariantClear
を使用してはならない。新しい VARIANTARG または VARIANT を初期化するには VariantInit
を使用する。未解決の参照を持つ配列を含む variant はクリアできない。クリアしようとすると DISP_E_ARRAYISLOCKED
を含む HRESULT が返される。


%index
VariantCopy
コピー先の variant を解放し、コピー元の variant のコピーを作成する。
%group
Win32 oleaut32
%prm
pvargDest, pvargSrc
pvargDest : [var] コピー先の variant。
pvargSrc : [var] コピー元の variant。
%inst
コピー先の variant を解放し、コピー元の variant のコピーを作成する。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）

[備考]
まず、VariantClear のように pvargDest が所有するメモリを解放する (pvargDest は有効な初期化済み
variant を指している必要があり、単に未初期化のメモリ位置を指していてはならない)。次に、pvargDest は pvargSrc
の内容の正確なコピーを受け取る。pvargSrc が VT_BSTR の場合、文字列のコピーが作成される。pvargSrc が
VT_ARRAY の場合、配列全体がコピーされる。pvargSrc が VT_DISPATCH または VT_UNKNOWN
の場合、オブジェクトの参照カウントを増やすために AddRef が呼び出される。コピーされる variant が参照によって渡された
COM オブジェクトの場合、pvargSrc パラメータの vt フィールドは VT_DISPATCH | VT_BYREF または
VT_UNKNOWN | VT_BYREF となる。この場合、VariantCopy
は参照されているオブジェクトの参照カウントを増やさない。コピーされる variant
がオブジェクトへの参照へのポインタであるため、VariantCopy
はオブジェクトの参照カウントを増やす必要があるかどうかを判断する方法を持たない。したがって、必要に応じてオブジェクトに対して
IUnknown::AddRef を呼び出すかどうかは呼び出し元の責任となる。注意 VariantCopy
メソッドはスレッドセーフではない。


%index
VariantCopyInd
コピー先の variant を解放し、コピー元の variant のコピーを作成する。コピー元が VT_BYREF として指定されている場合は必要な間接参照を行う。
%group
Win32 oleaut32
%prm
pvarDest, pvargSrc
pvarDest : [var] コピー先の variant。
pvargSrc : [var] コピー元の variant。
%inst
コピー先の variant を解放し、コピー元の variant のコピーを作成する。コピー元が VT_BYREF
として指定されている場合は必要な間接参照を行う。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）

[備考]
この関数は、variant のコピーが必要であり、かつ IDispatch::Invoke の実装で引数を扱う時など、それが
VT_BYREF でないことを保証したい場合に有用である。例えば、ソースが (VT_BYREF | VT_I2) の場合、変換先は
BYVAL | VT_I2 となる。VT_VARIANT を含むすべての有効な VT_BYREF
の組み合わせについて同様である。pvargSrc が (VT_BYREF | VT_VARIANT) であり、含まれる variant が
VT_BYREF である場合、含まれる variant も逆参照される。この関数は pvarDest の既存の内容をすべて解放する。


%index
VariantInit
variant を初期化する。
%group
Win32 oleaut32
%prm
pvarg
pvarg : [var] 初期化する variant。
%inst
variant を初期化する。

[備考]
VariantInit 関数は vt フィールドを VT_EMPTY に設定することで VARIANTARG
を初期化する。VariantClear とは異なり、この関数は VARIANTARG の現在の内容を解釈しない。VARIANTARG
(または VARIANT) 型の新しいローカル変数を初期化するために VariantInit を使用する。


%index
VariantTimeToDosDateTime
日付と時刻の variant 表現を MS-DOS の日付と時刻の値に変換する。
%group
Win32 oleaut32
%prm
vtime, pwDosDate, pwDosTime
vtime : [double] 変換する variant 時刻。
pwDosDate : [var] 変換後の MS-DOS 日付を受け取る。
pwDosTime : [var] 変換後の MS-DOS 時刻を受け取る。
%inst
日付と時刻の variant 表現を MS-DOS の日付と時刻の値に変換する。

[戻り値]
関数は成功すると TRUE、それ以外の場合は FALSE を返す。

[備考]
variant 時刻は 8 バイトの実数値 (double) として格納され、100 年 1 月 1 日から 9999 年 12 月 31
日までの日付を表す (両端を含む)。値 2.0 は 1900 年 1 月 1 日を表し、3.0 は 1900 年 1 月 2
日を表す、というように続く。値に 1 を加えると日付が 1 日進む。値の小数部は時刻を表す。したがって、2.5 は 1900 年 1 月
1 日の正午、3.25 は 1900 年 1 月 2 日の午前 6:00 を表す、というように続く。負の数値は 1899 年 12 月
30 日より前の日付を表す。MS-DOS の日付と時刻の形式の説明については、DosDateTimeToVariantTime
を参照のこと。VariantTimeToDosDateTime 関数は、無効な日付を受け入れて VARIANT
時刻に変換する際に修正を試みる。例えば、2/29/2001 のような無効な日付は 3/1/2001
に変換される。修正されるのは日のみであるため、無効な月の値はエラーとなる。日は 1 から 31 の範囲かをチェックされる。負の日や 31
より大きい日はエラーとなる。31 未満だがその月の最大日より大きい日は、翌月の適切な日に繰り上げられる。0
に等しい日は前月の末日として解決される。例えば、2/0/2001 のような無効な日付は 1/31/2001 に解決される。


%index
VariantTimeToSystemTime
時刻の variant 表現をシステム時刻の値に変換する。
%group
Win32 oleaut32
%prm
vtime, lpSystemTime
vtime : [double] 変換する variant 時刻。
lpSystemTime : [var] システム時刻を受け取る。
%inst
時刻の variant 表現をシステム時刻の値に変換する。

[戻り値]
関数は成功すると TRUE、それ以外の場合は FALSE を返す。

[備考]
variant 時刻は 8 バイトの実数値 (double) として格納され、100 年 1 月 1 日から 9999 年 12 月 31
日までの日付を表す (両端を含む)。値 2.0 は 1900 年 1 月 1 日を表し、3.0 は 1900 年 1 月 2
日を表す、というように続く。値に 1 を加えると日付が 1 日進む。値の小数部は時刻を表す。したがって、2.5 は 1900 年 1 月
1 日の正午、3.25 は 1900 年 1 月 2 日の午前 6:00 を表す、というように続く。負の数値は 1899 年 12 月
30 日より前の日付を表す。SYSTEMTIME 構造体を使用すると、次の理由で有用である。
（以下省略）


%index
VectorFromBstr
ベクタを返し、BSTR の各文字をベクタの要素に割り当てる。
%group
Win32 oleaut32
%prm
bstr, ppsa
bstr : [int] ベクタに変換する BSTR。
ppsa : [var] BSTR の文字を含む 1 次元の safe array。
%inst
ベクタを返し、BSTR の各文字をベクタの要素に割り当てる。

[戻り値]
次のいずれかの値を返すことがある。
（以下省略）

