; ============================================================
;   ole32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
ole32.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の ole32.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
BindMoniker
モニカを使ってオブジェクトを特定し、非アクティブであればアクティブ化し、指定されたインターフェイスへのポインタを取得する。
%prm
pmk, grfOpt, iidResult, ppvResult
pmk : [var] オブジェクトのモニカへのポインタ。IMoniker を参照。
grfOpt : [int] このパラメータは将来の使用のために予約されており、0 を指定しなければならない。
iidResult : [var] オブジェクトと通信するために使用するインターフェイス識別子。
ppvResult : [var] iidResult で要求したインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了した場合、*ppvResult には要求されたインターフェイスポインタが格納される。エラーが発生した場合、*ppvResult は NULL となる。呼び出しが成功した場合、呼び出し側はそのオブジェクトの IUnknown::Release メソッドを呼び出してポインタを解放する責任を負う。
%inst
モニカを使ってオブジェクトを特定し、非アクティブであればアクティブ化し、指定されたインターフェイスへのポインタを取得する。

[戻り値]
この関数は以下のエラーコード、または IMoniker::BindToObject メソッドが返すいずれかのエラー値を返すことがある。
（以下省略）

[備考]
BindMoniker
は、オブジェクトのモニカを保持するクライアントがそのオブジェクトのインターフェイスへのポインタを取得するための便利な補助関数である。BindMoniker
は以下の呼び出しをまとめて行う。
（以下省略）


%index
CoAllowSetForegroundWindow
フォアグラウンド権限（フォアグラウンドウィンドウを設定する権限）を、あるプロセスから別のプロセスへ引き渡す。フォアグラウンド権限を持つプロセスがこの関数を呼び出すことで、ローカル COM サーバープロセスにその権限を引き渡すことができる。
%prm
pUnk, lpvReserved
pUnk : [var] 対象 COM サーバーのプロキシ上の IUnknown インターフェイスへのポインタ。
lpvReserved : [intptr] このパラメータは予約済みであり、NULL を指定しなければならない。
%inst

フォアグラウンド権限（フォアグラウンドウィンドウを設定する権限）を、あるプロセスから別のプロセスへ引き渡す。フォアグラウンド権限を持つプロセスがこの関数を呼び出すことで、ローカル
COM サーバープロセスにその権限を引き渡すことができる。

[戻り値]
この関数は以下の値を返すことがある。
（以下省略）

[備考]
システムは、フォアグラウンドウィンドウを設定するために SetForegroundWindow および
AllowSetForegroundWindow
関数を呼び出せるプロセスを制限している。その結果、ユーザーが操作中であっても、アプリケーションが他のアプリケーションからフォーカスを奪うことはブロックされる。CoAllowSetForegroundWindow
を使用すると、フォアグラウンド権限を持っているプロセスから、まだ権限を持っていないプロセスへ権限を引き渡すことができる。これは推移的に行うことができ、あるプロセスから別のプロセスへ、さらに別のプロセスへと権限を渡していくことができる。CoAllowSetForegroundWindow
により、独自インターフェイスを持つユーザーでも、ウィンドウの切り替えが想定される OLE
インターフェイス（主にリンクや埋め込みに関連するもの）と同じ挙動を得ることができる。内部的には、プロセス間でフォアグラウンドウィンドウを譲り渡すために
IForegroundTransfer インターフェイスが使用されている。標準の COM 提供プロキシは既に
IForegroundTransfer
を実装しているため、標準プロキシを使用している限り追加の作業は不要である。CoAllowSetForegroundWindow
を呼び出すだけで、任意のアウトオブプロセス COM オブジェクトにフォアグラウンド権限を引き渡すことができる。


%index
CoBuildVersion
(no summary)
%prm

%inst



%index
CoDosDateTimeToFileTime
MS-DOS 形式の日付と時刻を、Windows で使用される FILETIME 構造体に変換する。
%prm
nDosDate, nDosTime, lpFileTime
nDosDate : [int] MS-DOS 形式の日付。
nDosTime : [int] MS-DOS 形式の時刻。
lpFileTime : [var] FILETIME 構造体へのポインタ。
%inst
MS-DOS 形式の日付と時刻を、Windows で使用される FILETIME 構造体に変換する。

[戻り値]
関数が成功した場合は TRUE を返す。失敗した場合は FALSE を返す。失敗の原因は通常、引数が不正であることによる。

[備考]
MS-DOS 形式の日付は以下の形式を持つ。
（以下省略）


%index
CoFileTimeToDosDateTime
FILETIME を MS-DOS 形式の日付と時刻の値に変換する。
%prm
lpFileTime, lpDosDate, lpDosTime
lpFileTime : [var] FILETIME 構造体へのポインタ。
lpDosDate : [var] MS-DOS 形式の日付を受け取る。
lpDosTime : [var] MS-DOS 形式の時刻を受け取る。
%inst
FILETIME を MS-DOS 形式の日付と時刻の値に変換する。

[戻り値]
関数が成功した場合は TRUE を返し、失敗した場合は FALSE を返す。


%index
CoFreeAllLibraries
CoLoadLibrary 関数によってロードされたすべての DLL（CoGetClassObject から内部的に呼び出されたものを含む）を、現在使用中かどうかにかかわらず解放する。
%prm

%inst
CoLoadLibrary 関数によってロードされたすべての DLL（CoGetClassObject
から内部的に呼び出されたものを含む）を、現在使用中かどうかにかかわらず解放する。

[備考]
CoFreeAllLibraries は DLL をアンロードするために、COM ライブラリがプロセスごとに管理しているロード済み DLL
の一覧を使用する。CoUninitialize および OleUninitialize 関数は内部で CoFreeAllLibraries
を呼び出すため、通常、アプリケーションから直接この関数を呼び出す必要はない。


%index
CoFreeLibrary
ロード時に明示的解放が指定されたライブラリを解放する。
%prm
hInst
hInst : [intptr] 解放するライブラリモジュールへのハンドル。CoLoadLibrary 関数から返されたもの。
%inst
ロード時に明示的解放が指定されたライブラリを解放する。

[備考]
CoFreeLibrary 関数は、明示的に解放するライブラリを解放するために呼び出す。これは CoLoadLibrary の
bAutoFree パラメータを FALSE に設定してライブラリをロードしたときに決定される。対応する CoLoadLibrary
の呼び出しで自動解放（bAutoFree パラメータが TRUE）が指定されているライブラリを明示的に解放することは許されない。


%index
CoGetInterceptor
インターセプトしたいインターフェイスに対応するインターセプタをインスタンス化し、新しく作成したインターセプタを返す。
%prm
iidIntercepted, punkOuter, iid, ppv
iidIntercepted : [var] インターセプタを返す対象となるインターフェイスの識別子への参照。
punkOuter : [var] このパラメータが NULL の場合、オブジェクトは集約の一部として作成されない。NULL 以外の場合、このパラメータは集約オブジェクトの IUnknown インターフェイス（制御用 IUnknown）へのポインタである。
iid : [var] インターセプタ上で取得したいインターフェイスの識別子への参照。
ppv : [var] iid で要求したインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了した場合、**ppv には要求されたインターセプタのポインタが格納される。
%inst
インターセプトしたいインターフェイスに対応するインターセプタをインスタンス化し、新しく作成したインターセプタを返す。

[戻り値]
この関数は以下の値を返すことがある。
（以下省略）


%index
CoGetInterceptorFromTypeInfo
(no summary)
%prm
iidIntercepted, punkOuter, typeInfo, iid, ppv
iidIntercepted : [var] 
punkOuter : [var] 
typeInfo : [var] 
iid : [var] 
ppv : [var] 
%inst



%index
CoGetObject
表示名を、指定された名前のオブジェクトを識別するモニカに変換し、そのモニカによって識別されるオブジェクトにバインドする。
%prm
pszName, pBindOptions, riid, ppv
pszName : [wstr] 作成するオブジェクトの表示名。
pBindOptions : [var] 実際のオブジェクトを生成するモニカを作成するために使用するバインドオプション。詳細は BIND_OPTS を参照。このパラメータは NULL を指定できる。
riid : [var] 作成するオブジェクトに実装されているインターフェイスの識別子への参照。
ppv : [var] 作成されたオブジェクト上で riid が指定するインターフェイスへのポインタのアドレス。
%inst
表示名を、指定された名前のオブジェクトを識別するモニカに変換し、そのモニカによって識別されるオブジェクトにバインドする。

[戻り値]
この関数は標準の戻り値 E_FAIL、E_OUTOFMEMORY、E_UNEXPECTED に加えて以下の値を返すことがある。
（以下省略）

[備考]
CoGetObject は COM ライブラリ関数 CreateBindCtx、MkParseDisplayName、および
IMoniker::BindToObject の呼び出しをカプセル化する。


%index
CoInitialize
現在のスレッドで COM ライブラリを初期化し、同時実行モデルをシングルスレッドアパートメント(STA)として識別する。
%prm
pvReserved
pvReserved : [intptr] このパラメータは予約されており、NULL を指定する必要がある。
%inst
現在のスレッドで COM ライブラリを初期化し、同時実行モデルをシングルスレッドアパートメント(STA)として識別する。

[戻り値]
標準の戻り値 E_INVALIDARG、E_OUTOFMEMORY、E_UNEXPECTED のほか、次の値を返すことがある。
（以下省略）

[備考]
COM ライブラリの関数を呼び出す前にスレッド上で COM ライブラリを初期化する必要がある(CoGetMalloc
とメモリ割り当て関数を除く)。スレッドの同時実行モデルは一度設定されると変更できず、マルチスレッドとして初期化済みのアパートメントに対する
CoInitialize 呼び出しは RPC_E_CHANGED_MODE で失敗する。CoInitializeEx
は同等の機能に加えて同時実行モデルを明示的に指定するパラメータを持ち、今後のアプリケーションは CoInitializeEx
を使用すべきである。成功した各 CoInitialize/CoInitializeEx 呼び出し(S_FALSE を含む)は
CoUninitialize 呼び出しと対応させる。DllMain からこれらの関数を呼び出してはならない。
（以下省略）


%index
CoInstall
要求された COM サーバーアプリケーションをインストールする。
%prm
pbc, dwFlags, pClassSpec, pQuery, pszCodeBase
pbc : [var] 将来の使用のために予約されている。この値は NULL でなければならない。
dwFlags : [int] 将来の使用のために予約されている。この値は 0 でなければならない。
pClassSpec : [var] uCLSSPEC 共用体へのポインタ。tyspec メンバは TYSPEC_CLSID に設定し、clsid メンバにはインストール対象の CLSID を設定しなければならない。詳細は TYSPEC を参照。
pQuery : [var] QUERYCONTEXT 構造体へのポインタ。dwContext フィールドには、目的の CLSCTX 値を設定しなければならない。詳細は QUERYCONTEXT を参照。
pszCodeBase : [wstr] 将来の使用のために予約されている。この値は NULL でなければならない。
%inst
要求された COM サーバーアプリケーションをインストールする。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG に加えて以下を返すことがある。
（以下省略）


%index
CoIsOle1Class
指定された CLSID が OLE 1 オブジェクトを表すかどうかを判定する。
%prm
rclsid
rclsid : [var] 確認対象の CLSID。
%inst
指定された CLSID が OLE 1 オブジェクトを表すかどうかを判定する。

[戻り値]
CLSID が OLE 1 オブジェクトを指す場合、戻り値は TRUE である。そうでない場合は FALSE である。

[備考]
CoIsOle1Class 関数は、あるオブジェクトクラスが OLE 1 由来であるかどうかを判定する。コンテナ内で OLE 1
オブジェクトへのリンクを防止するために使用できる。OLE 1
オブジェクトはリンクをサポートしていないためである。コンテナがコピーされたデータが埋め込みオブジェクトを表すと判断した場合、そのコンテナは
CoIsOle1Class を呼び出して、その埋め込みオブジェクトが OLE 1
オブジェクトかどうかを判定できる。CoIsOle1Class が TRUE を返した場合、コンテナはクリップボードフォーマットの一つとして
CF_LINKSOURCE を提供しない。この関数は複数の OLE 互換関数のうちの一つである。以下に示す互換関数は、OLE 1 と
OLE の間でオブジェクトのストレージ形式を変換するために使用できる。
（以下省略）


%index
CoLoadLibrary
指定された DLL を呼び出し側プロセスにロードする。
%prm
lpszLibName, bAutoFree
lpszLibName : [wstr] ロードするライブラリの名前。
bAutoFree : [int] このパラメータは 16 ビットアプリケーションとの互換性のために維持されているが、無視される。
%inst
指定された DLL を呼び出し側プロセスにロードする。

[戻り値]
関数が成功した場合、戻り値はロードされたライブラリのハンドルである。失敗した場合は NULL を返す。

[備考]
CoGetClassObject 関数は CoLoadLibrary を呼び出さない。CoLoadLibrary は
lpszLibName で指定された DLL を CoGetClassObject を呼び出したプロセスにロードする。コンテナは
CoLoadLibrary を直接呼び出すべきではない。内部的には、CoLoadLibrary
を使用して参照カウントを増やし、CoFreeLibrary 関数でそれを減らすことにより、ロードされた DLL
の参照カウントが管理されている。


%index
CoRegisterMessageFilter
現在のスレッドでの並行性問題を処理するために使用される IMessageFilter インターフェイスのインスタンスを OLE に登録する。
%prm
lpMessageFilter, lplpMessageFilter
lpMessageFilter : [var] メッセージフィルタ上の IMessageFilter インターフェイスへのポインタ。このメッセージフィルタは現在のスレッドに登録され、（存在する場合は）以前のメッセージフィルタを置き換える。このパラメータは NULL を指定でき、その場合は現在のスレッドにメッセージフィルタを登録しないことを意味する。なお、この関数はメッセージフィルタのインターフェイスポインタに対して AddRef を呼び出す点に注意すること。
lplpMessageFilter : [var] 以前に登録されていたメッセージフィルタへのインターフェイスポインタを受け取る IMessageFilter* ポインタ変数のアドレス。現在のスレッドに以前登録されたメッセージフィルタが存在しなかった場合、*lplpMessageFilter の値は NULL となる。
%inst
現在のスレッドでの並行性問題を処理するために使用される IMessageFilter インターフェイスのインスタンスを OLE
に登録する。

[戻り値]
インスタンスが正常に登録または取り消された場合、戻り値は S_OK である。そうでない場合は S_FALSE である。

[備考]
登録済みのメッセージフィルタを取り消すには、以前のメッセージフィルタ（場合によっては NULL）を lpMessageFilter
パラメータとして CoRegisterMessageFilter に渡す。


%index
CoTreatAsClass
あるクラスのオブジェクトを別クラスのオブジェクトとして扱うエミュレーションを設定または解除する。
%prm
clsidOld, clsidNew
clsidOld : [var] エミュレートされる対象のオブジェクトの CLSID。
clsidNew : [var] 元のオブジェクトをエミュレートすべきオブジェクトの CLSID。これは clsidOld に対する既存のエミュレーション設定を置き換える。このパラメータに CLSID_NULL を指定すると、clsidOld に対する既存のエミュレーション設定が削除される。
%inst
あるクラスのオブジェクトを別クラスのオブジェクトとして扱うエミュレーションを設定または解除する。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG に加えて以下の値を返すことがある。
（以下省略）

[備考]
この関数は、指定したオブジェクトに対してレジストリ内の TreatAs
エントリを設定し、別のアプリケーションによるエミュレーションを可能にする。エミュレーションにより、アプリケーションは異なる形式のオブジェクトを開いて編集することができ、かつ元の形式を保持することができる。このエントリが設定されると、CoGetClassObject
などの関数がオブジェクトの元の CLSID（clsidOld）を指定するたびに、それは透過的に新しい
CLSID（clsidNew）に転送され、TreatAs CLSID
に関連付けられたアプリケーションが起動される。オブジェクトを保存するときには、そのネイティブ形式で保存することができるが、元の形式ではサポートされない編集内容が失われる可能性がある。アプリケーションがエミュレーションをサポートしている場合、以下の状況で
CoTreatAsClass を呼び出す。
（以下省略）


%index
CreateAntiMoniker
新しいアンチモニカを作成して返す。
%prm
ppmk
ppmk : [var] 新しいアンチモニカへのインターフェイスポインタを受け取る IMoniker* ポインタ変数のアドレス。成功時、関数はアンチモニカに対して AddRef を呼び出しており、呼び出し側が Release を呼び出す責任を負う。エラー発生時、アンチモニカのポインタは NULL となる。
%inst
新しいアンチモニカを作成して返す。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY および S_OK を返すことがある。

[備考]
この関数は、独自のモニカクラスを記述している場合（IMoniker
インターフェイスを実装している場合）にのみ呼び出す。内部構造を持たない新しいモニカクラスを記述している場合、IMoniker::Inverse
の実装内で CreateAntiMoniker を使用し、IMoniker::ComposeWith
の実装内でアンチモニカをチェックすることができる。パス内で直前のディレクトリ名の逆となる ".."
ディレクトリのように、アンチモニカは合成モニカ内で直前に置かれた単純モニカの逆として機能する。アンチモニカは、内部構造を持たない単純モニカの逆として使用される。たとえば、システム提供のファイルモニカ、アイテムモニカ、ポインタモニカの実装はすべて、逆としてアンチモニカを使用する。その結果、これらのモニカのいずれかの右に合成されたアンチモニカは何も残らないように合成される。モニカクライアント（モニカを使って別のオブジェクトにバインドしているオブジェクト）は、通常、特定のモニカのクラスを知らないため、アンチモニカが逆であるかどうかを確信できない。したがって、モニカの逆を取得するには、CreateAntiMoniker
ではなく IMoniker::Inverse を呼び出すこと。合成モニカの最後の部分を削除するには、以下を行う。
（以下省略）


%index
CreateBindCtx
IBindCtx（バインドコンテキストオブジェクト）の実装へのポインタを返す。このオブジェクトは特定のモニカバインド操作に関する情報を保持する。
%prm
reserved, ppbc
reserved : [int] このパラメータは予約済みであり、0 を指定しなければならない。
ppbc : [var] 新しいバインドコンテキストオブジェクトへのインターフェイスポインタを受け取る IBindCtx* ポインタ変数のアドレス。関数が成功した場合、呼び出し側はバインドコンテキストに対して Release を呼び出す責任を負う。バインドコンテキストの値が NULL の場合はエラーが発生したことを示す。
%inst

IBindCtx（バインドコンテキストオブジェクト）の実装へのポインタを返す。このオブジェクトは特定のモニカバインド操作に関する情報を保持する。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY および S_OK を返すことがある。

[備考]
CreateBindCtx
は、モニカをバインドする処理（モニカによってインターフェイスを特定し、そのポインタを取得する処理）において、以下の手順のようにもっとも一般的に使用される。
（以下省略）


%index
CreateClassMoniker
指定されたクラスを参照するクラスモニカを作成する。
%prm
rclsid, ppmk
rclsid : [var] このモニカがバインドするオブジェクト型の CLSID への参照。
ppmk : [var] 新しいクラスモニカへのインターフェイスポインタを受け取る IMoniker* ポインタ変数のアドレス。正常終了時、関数はモニカに対して AddRef を呼び出しており、呼び出し側が Release を呼び出す責任を負う。エラー発生時、モニカポインタの値は NULL となる。
%inst
指定されたクラスを参照するクラスモニカを作成する。

[戻り値]
この関数は以下の値を返すことがある。
（以下省略）

[備考]
クラスモニカは、rclsid で識別されるクラスの新しいインスタンスへのバインドをサポートする。


%index
CreateDataAdviseHolder
CreateDataAdviseHolder 関数（ole2.h）は、データアドバイスホルダオブジェクト上の IDataAdviseHolder の OLE 実装へのポインタを取得する。
%prm
ppDAHolder
ppDAHolder : [var] 新しいアドバイスホルダオブジェクトへのインターフェイスポインタを受け取る IDataAdviseHolder ポインタ変数のアドレス。
%inst
CreateDataAdviseHolder 関数（ole2.h）は、データアドバイスホルダオブジェクト上の
IDataAdviseHolder の OLE 実装へのポインタを取得する。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
IDataObject::DAdvise の実装内で CreateDataAdviseHolder
を呼び出して、IDataAdviseHolder インターフェイスの OLE 実装へのポインタを取得する。このポインタを使って
IDataAdviseHolder::Advise メソッドを呼び出すことで IDataObject::DAdvise
の実装を完成させることができる。このメソッドは呼び出し側オブジェクトとデータオブジェクトとの間にアドバイザリ接続を確立する。


%index
CreateDataCache
OLE 提供のデータキャッシュ実装の新しいインスタンスへのポインタを取得する。
%prm
pUnkOuter, rclsid, iid, ppv
pUnkOuter : [var] キャッシュを集約の一部として作成する場合、集約の制御用 IUnknown へのポインタ。そうでない場合、このパラメータには NULL を指定する。
rclsid : [var] アイコンラベル生成に使用する CLSID。通常は CLSID_NULL を指定する。
iid : [var] 呼び出し側がキャッシュと通信するために使用したいインターフェイスの識別子への参照。通常は IID_IOleCache である（OLE ヘッダで IOleCache のインターフェイス識別子と等しく定義されている）。
ppv : [var] riid で要求したインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了した場合、*ppvObj には要求されたキャッシュオブジェクトへのインターフェイスポインタが格納される。
%inst
OLE 提供のデータキャッシュ実装の新しいインスタンスへのポインタを取得する。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
CreateDataCache によって作成されたキャッシュオブジェクトは、キャッシュを制御するための
IOleCache、IOleCache2、および IOleCacheControl
インターフェイスをサポートする。また、IPersistStorage、IDataObject（アドバイスシンクなし）、IViewObject、および
IViewObject2 インターフェイスもサポートする。


%index
CreateFileMoniker
指定されたパスに基づくファイルモニカを作成する。
%prm
lpszPathName, ppmk
lpszPathName : [wstr] このモニカの基となるパス。このパラメータには相対パス、UNC パス、またはドライブレター付きパスを指定できる。相対パスを基にしている場合、結果として得られるモニカは、バインドする前に別のファイルモニカと合成する必要がある。
ppmk : [var] 新しいファイルモニカへのインターフェイスポインタを受け取る IMoniker* ポインタ変数のアドレス。成功時、関数はファイルモニカに対して AddRef を呼び出しており、呼び出し側が Release を呼び出す責任を負う。エラー発生時、インターフェイスポインタの値は NULL となる。
%inst
指定されたパスに基づくファイルモニカを作成する。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY に加えて以下の値を返すことがある。
（以下省略）

[備考]
CreateFileMoniker
は、ファイルに格納されたオブジェクトに対するモニカを作成する。モニカプロバイダ（他のオブジェクトにモニカを提供するオブジェクト）はこの関数を呼び出して、自身が制御するファイルベースのオブジェクトを識別するモニカを作成し、そのモニカへのポインタを他のオブジェクトに提供できる。ファイルモニカで識別されるオブジェクトは、ファイルモニカがバインドされたときにロードできるように、IPersistFile
インターフェイスも実装していなければならない。各オブジェクトがそれぞれ独自のファイルに存在する場合（たとえば、ファイルベースのドキュメント全体に対するリンクのみをサポートする
OLE
サーバーアプリケーション）、必要なモニカの種類はファイルモニカのみである。ファイルより小さい単位のオブジェクトを識別するには、モニカプロバイダはファイルモニカに加えて別の種類のモニカ（アイテムモニカなど）を使用し、合成モニカを作成する必要がある。ドキュメントのセクションや埋め込みオブジェクトなど、ドキュメントより小さい単位のオブジェクトへのリンクをサポートする
OLE
サーバーアプリケーションでは合成モニカが必要となる。ファイルモニカは、もう一方のファイルモニカが絶対パスに基づき、かつこのファイルモニカが相対パスである場合に限り、他のファイルモニカの右に合成することができる。その結果、2
つのパスの組み合わせに基づく単一のファイルモニカが得られる。別のモニカの右に合成されるモニカは、そのモニカの細分化でなければならず、ファイルモニカはストレージの最大単位を表す。ファイル内に格納されたオブジェクトを識別するには、ファイルモニカの右に他の種類のモニカ（通常はアイテムモニカ）を合成する。


%index
CreateGenericComposite
2 つのモニカを汎用合成し、結果として得られる合成モニカへのポインタを返す。
%prm
pmkFirst, pmkRest, ppmkComposite
pmkFirst : [var] pmkRest が指すモニカの左に合成されるモニカへのポインタ。汎用合成モニカを含め、任意の種類のモニカを指すことができる。
pmkRest : [var] pmkFirst が指すモニカの右に合成されるモニカへのポインタ。汎用合成モニカを含め、pmkRest モニカの型と互換性のある任意の種類のモニカを指すことができる。
ppmkComposite : [var] pmkFirst と pmkRest を合成した結果である合成モニカオブジェクトへのインターフェイスポインタを受け取る IMoniker* ポインタ変数のアドレス。このオブジェクトは OLE の合成モニカ実装の IMoniker をサポートする。成功時、関数はモニカに対して AddRef を呼び出しており、呼び出し側が Release を呼び出す責任を負う。pmkFirst または pmkRest のいずれかが NULL の場合、返されるポインタは NULL でないほうとなる。pmkFirst と pmkRest の両方が NULL の場合、またはエラーが発生した場合、返されるポインタは NULL となる。
%inst
2 つのモニカを汎用合成し、結果として得られる合成モニカへのポインタを返す。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY に加えて以下の値を返すことがある。
（以下省略）

[備考]
CreateGenericComposite は 2 つのモニカを 1
つに結合する。結合されるモニカクラスは、合成規則に従う限り異なっていてもよい。この関数は、汎用合成機能を含む
IMoniker::ComposeWith の実装内で、IMoniker
インターフェイスを実装して新しいモニカクラスを記述する場合にのみ呼び出す。モニカプロバイダは、2 つのモニカを合成するために
ComposeWith を呼び出す必要がある。ComposeWith の実装は（OLE
の実装がそうであるように）、クラスにとって妥当な場合、まず同じクラスの 2
つのモニカを結合する非汎用合成を試みるべきである。それが不可能な場合、実装は CreateGenericComposite
を呼び出して、合成規則の範囲内で異なるクラスの 2
つのモニカを結合する汎用合成を行うことができる。新しいモニカクラスを記述する際には、新しい種類の非汎用合成を定義することもできる。2
つのモニカを合成する過程で、CreateGenericComposite は可能な限りの簡略化を行う。たとえば、pmkFirst
が汎用合成モニカ A + B + C で、pmkRest が汎用合成モニカ C -1 + B -1 + Z（C -1 は C
の逆）であるとする。この関数はまず C と C -1 を合成して何も残らないようにし、次に B と B -1
を合成して何も残らないようにする。最後に A と Z を合成し、汎用合成モニカ A + Z へのポインタを返す。


%index
CreateILockBytesOnHGlobal
複合ファイルのメモリ内ストレージに使用するバイトを格納するための HGLOBAL メモリハンドルを用いるバイト配列オブジェクトを作成する。
%prm
hGlobal, fDeleteOnRelease, pplkbyt
hGlobal : [int] GlobalAlloc 関数によって割り当てられたメモリハンドル。NULL の場合は新しいハンドルが割り当てられる。ハンドルは移動可能かつ破棄不可として割り当てなければならない。
fDeleteOnRelease : [int] このバイト配列オブジェクトの基となるハンドルを、オブジェクトが解放されたときに自動的に解放するかどうかを指定するフラグ。FALSE に設定されている場合、呼び出し側は最終解放後に hGlobal を解放しなければならない。TRUE に設定されている場合、最終解放時に hGlobal パラメータが自動的に解放される。
pplkbyt : [var] 新しいバイト配列オブジェクトへのインターフェイスポインタを受け取る ILockBytes ポインタ変数のアドレス。
%inst
複合ファイルのメモリ内ストレージに使用するバイトを格納するための HGLOBAL メモリハンドルを用いるバイト配列オブジェクトを作成する。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG および E_OUTOFMEMORY に加えて以下をサポートする。

[備考]
hGlobal が NULL の場合、CreateILockBytesOnHGlobal
は新しいメモリハンドルを割り当て、バイト配列は初期状態では空となる。hGlobal が NULL
でない場合、バイト配列オブジェクトの初期内容はそのメモリブロックの現在の内容となる。したがって、この関数は、たとえば
StgCreateDocfileOnILockBytes
関数によって以前に作成されたストレージオブジェクトを再ロードするために、メモリ上の既存のバイト配列を開く目的にも使用できる。新しいバイト配列オブジェクトの作成によって、メモリハンドルとその内容が変更されることはない。バイト配列の初期サイズは、GlobalSize
関数が返す hGlobal
のサイズとなる。これは丸めの関係で、ハンドルに対して最初に割り当てられたサイズと同じとは限らない。バイト配列の論理サイズが重要な場合は、CreateILockBytesOnHGlobal
の呼び出しの後に ILockBytes::SetSize の呼び出しを続ける。CreateStreamOnHGlobal
でバイト配列オブジェクトを作成した後は、StgCreateDocfileOnILockBytes
を使用してメモリ上に新しいストレージオブジェクトを作成したり、StgOpenStorageOnILockBytes
を使用して、メモリブロック内にすでに存在する既存のストレージオブジェクトを再度開いたりできる。GetHGlobalFromILockBytes
を呼び出すことで、バイト配列オブジェクトに関連付けられているメモリハンドルを取得できる。メモリハンドルを
CreateILockBytesOnHGlobal に渡した場合、または GetHGlobalFromILockBytes
を呼び出した場合、この関数のメモリハンドルは、バイト配列オブジェクトがそれを使用している間も呼び出し側から直接アクセスできる。この機能を使用する際には、適切な注意を払い、その影響を理解しておくこと。
（以下省略）


%index
CreateItemMoniker
親となるオブジェクト（通常は複合ドキュメント）内のオブジェクトを識別するアイテムモニカを作成する。
%prm
lpszDelim, lpszItem, ppmk
lpszDelim : [wstr] このアイテムの表示名を、それを含むオブジェクトの表示名から区切るために使用する区切り文字（通常は "!"）を含む、ゼロ終端のワイド文字列（1 文字につき 2 バイト）へのポインタ。
lpszItem : [wstr] 識別対象のオブジェクトに対する、それを含むオブジェクトでの名前を示すゼロ終端文字列へのポインタ。この名前は後で IOleItemContainer::GetObject の呼び出しにおいてオブジェクトへのポインタを取得するために使用される。
ppmk : [var] アイテムモニカへのインターフェイスポインタを受け取る IMoniker* ポインタ変数のアドレス。成功時、関数はアイテムモニカに対して AddRef を呼び出しており、呼び出し側が Release を呼び出す責任を負う。エラーが発生した場合、返されるインターフェイスポインタの値は NULL となる。
%inst
親となるオブジェクト（通常は複合ドキュメント）内のオブジェクトを識別するアイテムモニカを作成する。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY および S_OK を返すことがある。

[備考]

モニカプロバイダ（他者からアクセスできるよう、自身のオブジェクトを識別するモニカを配布するオブジェクト）は、自身のオブジェクトをアイテムモニカで識別するために
CreateItemMoniker
を呼び出す。アイテムモニカは文字列に基づき、別のオブジェクト内に含まれるオブジェクトで、文字列によって個別に識別可能なものを識別する。親となるオブジェクトは
IOleContainer インターフェイスも実装していなければならない。ほとんどのモニカプロバイダは、リンクをサポートする OLE
アプリケーションである。ドキュメント内の選択範囲へのリンクを許可するサーバーアプリケーションのように、ファイルベースのドキュメントより小さい単位のオブジェクトへのリンクをサポートするアプリケーションは、それらのオブジェクトを識別するためにアイテムモニカを使用すべきである。埋め込みオブジェクトへのリンクを許可するコンテナアプリケーションは、埋め込みオブジェクトを識別するためにアイテムモニカを使用する。
lpszItem
パラメータは、ドキュメントがそのオブジェクトを一意に識別するために使用する名前である。たとえば、識別対象のオブジェクトがスプレッドシート内のセル範囲である場合、適切な名前は
"A1:E7" のようなものとなる。埋め込みオブジェクトの場合は "embedobj1"
のようなものが適切である。親オブジェクトは、この名前を解釈して対応するオブジェクトを見つけることができる
IOleItemContainer
インターフェイスの実装を提供する必要がある。これにより、アイテムモニカを、それが識別するオブジェクトにバインドすることができる。アイテムモニカは単独では使用されない。それを含むオブジェクトを識別するモニカと合成しなければならない。たとえば、識別対象のオブジェクトがファイルベースのドキュメントに含まれるセル範囲である場合、そのオブジェクトを識別するアイテムモニカは、そのドキュメントを識別するファイルモニカと合成する必要があり、結果は
"C:\work\sales.xls!A1:E7"
に相当する合成モニカとなる。別のドキュメント内の埋め込みオブジェクトにさらに別のオブジェクトが含まれている場合のように、入れ子のコンテナも許される。そのようなオブジェクトの完全なモニカは
"C:\work\report.doc!embedobj1!A1:E7" に相当するものとなる。この場合、親となる各オブジェクトが
CreateItemMoniker を呼び出し、それぞれが独自の IOleItemContainer
インターフェイスの実装を提供しなければならない。


%index
CreateObjrefMoniker
オブジェクトへのポインタに基づく OBJREF モニカを作成する。
%prm
punk, ppmk
punk : [var] モニカが表すオブジェクト上の IUnknown インターフェイスへのポインタ。
ppmk : [var] 作成された OBJREF モニカ上の IMoniker インターフェイスへのポインタのアドレス。
%inst
オブジェクトへのポインタに基づく OBJREF モニカを作成する。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY、E_UNEXPECTED、および S_OK を返すことがある。

[備考]
クライアントは、サーバーのアドレス空間で動作しているオブジェクトへのマーシャルされたポインタを取得するために OBJREF
モニカを使用する。サーバーは通常、CreateObjrefMoniker を呼び出して OBJREF モニカを作成し、続いて
IMoniker::GetDisplayName を呼び出し、最後にモニカを解放する。OBJREF モニカの表示名は次の形式となる。
OBJREF:nnnnnnnn ここで nnnnnnnn は任意の長さの base-64
エンコードで、実行中のオブジェクトのマシン位置、プロセスエンドポイント、およびインターフェイスポインタ
ID（IPID）をカプセル化したものである。表示名はテキストとしてクライアントに転送できる。たとえば、表示名はクライアントがダウンロードする
HTML ページに配置できる。クライアントは表示名を MkParseDisplayName に渡すことができ、これは表示名に基づいて
OBJREF モニカを作成する。続いてモニカの IMoniker::BindToObject
メソッドを呼び出すことで、サーバー上で実行中のインスタンスへのマーシャルされたポインタが得られる。たとえば、Active Server
Page に含まれるサーバー側 COM コンポーネントは、OBJREF
モニカを作成し、その表示名を取得して、クライアントのブラウザに送信される HTML
出力に書き込むことができる。クライアント側で実行されるスクリプトは、この表示名を使用して、実行中のオブジェクト自体にアクセスできる。たとえば、クライアント側の
Visual Basic スクリプトは、表示名を strMyName という変数に格納し、objMyInstance =
GetObject(strMyName) という行を含めることができる。スクリプトエンジンは内部で MkParseDisplayName
および IMoniker::BindToObject の呼び出しを行い、以降スクリプトは objMyInstance
を使用して実行中のオブジェクトを直接参照できる。


%index
CreateOleAdviseHolder
複合ドキュメント通知を管理するためのアドバイスホルダオブジェクトを作成する。このオブジェクトの IOleAdviseHolder インターフェイスの OLE 実装へのポインタを返す。
%prm
ppOAHolder
ppOAHolder : [var] 新しいアドバイスホルダオブジェクトへのインターフェイスポインタを受け取る IOleAdviseHolder ポインタ変数のアドレス。
%inst
複合ドキュメント通知を管理するためのアドバイスホルダオブジェクトを作成する。このオブジェクトの IOleAdviseHolder
インターフェイスの OLE 実装へのポインタを返す。

[戻り値]
この関数は成功時に S_OK を返し、標準の戻り値 E_OUTOFMEMORY をサポートする。

[備考]
CreateOleAdviseHolder 関数は、IOleAdviseHolder インターフェイスの OLE
実装をサポートするアドバイスホルダのインスタンスを作成する。このインターフェイスのメソッドは、IOleObject
のアドバイザリメソッドを実装するため、またアドバイザリシンクをサポートするオブジェクトとの間にアドバイザリ接続が確立されたときに、オブジェクトの変更通知をアドバイザリシンクに送信するために使用される。CreateOleAdviseHolder
が返すアドバイスホルダは大多数のアプリケーションで十分な機能を提供する。ただし、OLE 提供の実装は
IOleAdviseHolder::EnumAdvise
をサポートしていないため、このメソッドを使用する必要がある場合は、独自のアドバイスホルダを実装する必要がある。


%index
CreatePointerMoniker
オブジェクトへのポインタに基づくポインタモニカを作成する。
%prm
punk, ppmk
punk : [var] 結果のモニカで識別するオブジェクト上の IUnknown インターフェイスへのポインタ。
ppmk : [var] 新しいポインタモニカへのインターフェイスポインタを受け取る IMoniker* ポインタ変数のアドレス。成功時、関数はモニカに対して AddRef を呼び出しており、呼び出し側が Release を呼び出す責任を負う。エラー発生時、返されるインターフェイスポインタの値は NULL となる。
%inst
オブジェクトへのポインタに基づくポインタモニカを作成する。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY、E_UNEXPECTED、および S_OK を返すことがある。

[備考]

ポインタモニカは、既存のインターフェイスポインタを、モニカを必要とするインターフェイスに渡せるようにモニカでラップする。ポインタモニカを使用すると、永続的な表現を持たないオブジェクトであっても、モニカバインド操作に参加できる。
ポインタモニカはあまり使用されないため、この関数が呼び出されることはまれである。


%index
CreateStdProgressIndicator
(no summary)
%prm
hwndParent, pszTitle, pIbscCaller, ppIbsc
hwndParent : [intptr] 
pszTitle : [wstr] 
pIbscCaller : [var] 
ppIbsc : [var] 
%inst



%index
DoDragDrop
OLE ドラッグアンドドロップ操作を実行する。
%prm
pDataObj, pDropSource, dwOKEffects, pdwEffect
pDataObj : [var] ドラッグされるデータを含むデータオブジェクト上の IDataObject インターフェイスへのポインタ。
pDropSource : [var] ドラッグ操作中にドラッグ元と通信するために使用される IDropSource インターフェイスの実装へのポインタ。
dwOKEffects : [int] OLE ドラッグアンドドロップ操作でドラッグ元が許可する効果。もっとも重要なのは、移動を許可するかどうかである。dwOKEffect および pdwEffect パラメータは DROPEFFECT 列挙の値を取る。値の一覧は DROPEFFECT を参照。
pdwEffect : [var] OLE ドラッグアンドドロップ操作がドラッグ元データにどう影響したかを示す値へのポインタ。pdwEffect パラメータは操作がキャンセルされなかった場合にのみ設定される。
%inst
OLE ドラッグアンドドロップ操作を実行する。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
OLE ドラッグアンドドロップ操作のデータソースとして機能するアプリケーションを開発している場合、ユーザーが OLE
ドラッグアンドドロップ操作を開始したことを検出したら DoDragDrop を呼び出さなければならない。
DoDragDrop 関数はループに入り、IDropSource および IDropTarget
インターフェイスのさまざまなメソッドを呼び出す。（ドラッグアンドドロップ操作を成功させるには、データソースとして機能するアプリケーションは
IDropSource を実装し、ターゲットアプリケーションは IDropTarget を実装しなければならない。）
（以下省略）


%index
FmtIdToPropStgName
プロパティセット形式識別子（FMTID）をそのストレージ名またはストリーム名に変換する。
%prm
pfmtid, oszName
pfmtid : [var] プロパティセットの FMTID へのポインタ。
oszName : [wstr] pfmtid で識別されるプロパティセットのストレージ名またはストリーム名を受け取るヌル終端文字列へのポインタ。この文字列用に確保する配列は、少なくとも CCH_MAX_PROPSTG_NAME（32）文字の長さを持たなければならない。
%inst
プロパティセット形式識別子（FMTID）をそのストレージ名またはストリーム名に変換する。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG に加えて以下をサポートする。

[備考]
FmtIdToPropStgName は、プロパティセットの FMTID
を、単純プロパティセットの場合はそのストリーム名に、非単純プロパティセットの場合はそのストレージ名にマップする。この関数は、StgCreatePropStg
および StgOpenPropStg 関数で PROPSETFLAG_UNBUFFERED
値を使用してプロパティセットを作成または開く際に便利である。PROPSETFLAG_UNBUFFERED の詳細については
PROPSETFLAG Constants を参照。


%index
FreePropVariantArray
FreePropVariantArray 関数は、rgvars 配列内の各 PROPVARIANT 構造体に対して PropVariantClear を呼び出し、配列の各メンバの値をゼロにする。
%prm
cVariants, rgvars
cVariants : [int] PROPVARIANT 配列（rgvars）の要素数。
rgvars : [var] 解放可能な要素を解放する対象となる、初期化済みの PROPVARIANT 構造体の配列へのポインタ。関数終了時、PROPVARIANT 構造体にはすべて 0 が書き込まれる（これにより VT_EMPTY としてタグ付けされる）。
%inst
FreePropVariantArray 関数は、rgvars 配列内の各 PROPVARIANT 構造体に対して
PropVariantClear を呼び出し、配列の各メンバの値をゼロにする。

[戻り値]
この関数は HRESULT を返す。

[備考]
FreePropVariantArray は PROPVARIANT 構造体の配列に対して PropVariantClear
を呼び出し、すべての有効なメンバをクリアする。有効な PROPVARIANT 構造体はすべて解放される。配列内のいずれかの
PROPVARIANT 構造体が不正な VT 型を含む場合、有効なメンバは解放され、関数は STG_E_INVALIDPARAMETER
を返す。rgvars に NULL を渡すことは合法であり、戻り値 S_OK が返される。


%index
GetClassFile
指定したファイル名に関連付けられた CLSID を返す。
%prm
szFilename, pclsid
szFilename : [wstr] 関連付けられた CLSID を要求する対象のファイル名へのポインタ。
pclsid : [var] 関連付けられた CLSID が書き込まれる場所へのポインタ。
%inst
指定したファイル名に関連付けられた CLSID を返す。

[戻り値]
この関数は、任意のファイルシステムエラー、および以下の値を返すことがある。
（以下省略）

[備考]
ファイル名を与えられると、GetClassFile はそのファイルに関連付けられた CLSID
を見つける。使用例としては、ファイル名が渡されて関連 CLSID が必要となる OleCreateFromFile
関数、およびファイルベースのドキュメントへのリンクがアクティブ化されたときにファイルを開ける対象アプリケーションを特定するために
GetClassFile を呼び出す IMoniker::BindToObject の OLE 実装が挙げられる。
GetClassFile は、適切な CLSID を決定するために次の方法を使用する。
（以下省略）


%index
GetConvertStg
GetConvertStg 関数は、指定されたストレージオブジェクトの変換ビットの現在の値を返す。
%prm
pStg
pStg : [var] 変換ビットを取得する対象のストレージオブジェクトへの IStorage ポインタ。
%inst
GetConvertStg 関数は、指定されたストレージオブジェクトの変換ビットの現在の値を返す。

[戻り値]
IStorage::OpenStream、IStorage::OpenStorage、および
ISequentialStream::Read のストレージおよびストリームアクセスエラー。

[備考]
GetConvertStg
関数は、ある形式から別の形式へのオブジェクト変換をサポートするオブジェクトサーバーから呼び出される。サーバーは、オブジェクトの変換をサポートするために、以前のクラス識別子（CLSID）の形式でストレージオブジェクトを読み取り、新しい
CLSID
の形式でオブジェクトを書き込むことができなければならない。たとえば、あるアプリケーションで作成されたスプレッドシートを、別のアプリケーションで使用される形式に変換することができる。変換ビットは
SetConvertStg
関数の呼び出しによって設定される。コンテナアプリケーションは、エンドユーザーの要求に応じてこの関数を呼び出すこともあれば、セットアッププログラムが新しいバージョンのアプリケーションをインストールする際に呼び出すこともある。エンドユーザーは「変換先」ダイアログボックスを通じてオブジェクトの変換を要求する。オブジェクトが変換されると、新しい
CLSID がそのオブジェクトに恒久的に割り当てられ、オブジェクトは以降新しい CLSID
と関連付けられる。その後、オブジェクトがアクティブ化されると、そのサーバーは GetConvertStg
関数を呼び出してストレージオブジェクトから変換ビットの値を取得する。ビットが設定されている場合、オブジェクトの CLSID
は変更されており、サーバーはストレージオブジェクトの古い形式を読み取って新しい形式で書き込まなければならない。ビット値を取得した後、オブジェクトアプリケーションは
SetConvertStg 関数を fConvert パラメータを FALSE に設定して呼び出し、変換ビットをクリアすること。


%index
GetHGlobalFromILockBytes
GetHGlobalFromILockBytes 関数は、CreateILockBytesOnHGlobal 関数を使用して作成されたバイト配列オブジェクトに対するグローバルメモリハンドルを取得する。
%prm
plkbyt, phglobal
plkbyt : [var] 以前に CreateILockBytesOnHGlobal 関数の呼び出しによって作成されたバイト配列オブジェクト上の ILockBytes インターフェイスへのポインタ。
phglobal : [var] 指定されたバイト配列オブジェクトが使用している現在のメモリハンドルへのポインタ。
%inst
GetHGlobalFromILockBytes 関数は、CreateILockBytesOnHGlobal
関数を使用して作成されたバイト配列オブジェクトに対するグローバルメモリハンドルを取得する。

[戻り値]
この関数は HRESULT を返す。

[備考]
グローバルメモリ上にバイト配列オブジェクトを作成する CreateILockBytesOnHGlobal
の呼び出し後、GetHGlobalFromILockBytes
はバイト配列オブジェクトの基となるグローバルメモリのハンドルへのポインタを取得する。この関数が返すハンドルは、途中の
GlobalReAlloc
関数の呼び出しにより、元のハンドルと異なる場合がある。返されたメモリハンドルの内容は、クリーンなディスクファイルに書き込んで、StgOpenStorage
関数を使ってストレージオブジェクトとして開くことができる。この関数は、バイト配列を作成したプロセスと同じプロセス内でのみ動作する。


%index
GetRunningObjectTable
ローカルの実行中オブジェクトテーブル（ROT）上の IRunningObjectTable インターフェイスへのポインタを返す。
%prm
reserved, pprot
reserved : [int] このパラメータは予約済みであり、0 を指定しなければならない。
pprot : [var] ローカル ROT へのインターフェイスポインタを受け取る IRunningObjectTable* ポインタ変数のアドレス。関数が成功した場合、呼び出し側はインターフェイスポインタに対して Release を呼び出す責任を負う。エラーが発生した場合、*pprot の値は未定義となる。
%inst
ローカルの実行中オブジェクトテーブル（ROT）上の IRunningObjectTable インターフェイスへのポインタを返す。

[戻り値]
この関数は標準の戻り値 E_UNEXPECTED および S_OK を返すことがある。

[備考]
各ワークステーションにはローカル ROT
があり、そのコンピュータ上で実行中として登録されたオブジェクトのテーブルを管理している。この関数は IRunningObjectTable
インターフェイスポインタを返し、それによりテーブルへのアクセスが可能となる。他者からアクセスできるようオブジェクトを識別するモニカを配布するモニカプロバイダは、GetRunningObjectTable
を呼び出すべきである。この関数が返すインターフェイスポインタを使用して、オブジェクトの実行開始時に登録を行い、オブジェクトが変更された時刻を記録し、実行終了時に登録を取り消すこと。詳細は
IRunningObjectTable インターフェイスを参照。

複合ドキュメントのリンク元は、モニカプロバイダのもっとも一般的な例である。これには、ドキュメント（またはドキュメントの一部）へのリンクをサポートするサーバーアプリケーション、およびドキュメント内の埋め込みオブジェクトへのリンクをサポートするコンテナアプリケーションが含まれる。リンクをサポートしないサーバーアプリケーションも、埋め込みへのリンクをサポートするコンテナアプリケーションと協調するために
ROT を使用できる。新しいモニカクラスを記述するために IMoniker インターフェイスを実装しており、ROT
へのインターフェイスポインタが必要な場合、GetRunningObjectTable 関数ではなく
IBindCtx::GetRunningObjectTable を呼び出すこと。これにより、IBindCtx
インターフェイスの将来の実装でバインド動作を変更できるようになる。


%index
IsAccelerator
指定されたキーストロークが、指定されたアクセラレータテーブル内のアクセラレータに対応するかどうかを判定する。
%prm
hAccel, cAccelEntries, lpMsg, lpwCmd
hAccel : [intptr] アクセラレータテーブルへのハンドル。
cAccelEntries : [int] アクセラレータテーブル内のエントリ数。
lpMsg : [var] 変換対象のキーストロークメッセージへのポインタ。
lpwCmd : [var] キーストロークに対応するアクセラレータがある場合、対応するコマンド識別子を受け取る変数へのポインタ。このパラメータは NULL でもよい。
%inst
指定されたキーストロークが、指定されたアクセラレータテーブル内のアクセラレータに対応するかどうかを判定する。

[戻り値]
メッセージがオブジェクトアプリケーションのものである場合、戻り値は TRUE
である。メッセージがオブジェクトのものではなくコンテナに転送すべき場合、戻り値は FALSE である。

[備考]

オブジェクトがインプレースでアクティブな間、そのオブジェクトは常に最初にキーストロークをアクセラレータに変換する機会を持つ。キーストロークがそのアクセラレータの一つに対応する場合、オブジェクトは
TranslateAccelerator 関数の呼び出しが失敗した場合でも、OleTranslateAccelerator
関数を呼び出してはならない。この方法でキーストロークを処理しなかった場合、一貫性のない動作を招く恐れがある。キーストロークがオブジェクトのアクセラレータの一つでない場合、オブジェクトは
OleTranslateAccelerator
を呼び出して、コンテナ側でアクセラレータ変換を試みるようにしなければならない。オブジェクトのサーバーは IsAccelerator
を呼び出して、アクセラレータメッセージが自身のものかどうかを判断できる。一部のサーバーは独自にアクセラレータ変換を行い、TranslateAccelerator
を呼び出さない。そのようなアプリケーションは、すでに情報を持っているため IsAccelerator を呼び出さない。


%index
MkParseDisplayName
文字列を、その文字列で指定されたオブジェクトを識別するモニカに変換する。
%prm
pbc, szUserName, pchEaten, ppmk
pbc : [var] このバインド操作で使用するバインドコンテキストオブジェクト上の IBindCtx インターフェイスへのポインタ。
szUserName : [wstr] 解析対象の表示名へのポインタ。
pchEaten : [var] 消費された szUserName の文字数へのポインタ。関数が成功した場合、*pchEaten は szUserName の長さとなる。そうでない場合は、正常に解析された文字数となる。
ppmk : [var] szUserName から構築されたモニカへのインターフェイスポインタを受け取る IMoniker* ポインタ変数のアドレス。成功時、関数はモニカに対して AddRef を呼び出しており、呼び出し側が Release を呼び出す責任を負う。エラーが発生した場合、指定されたインターフェイスポインタには、エラー発生前に作成できた範囲までのモニカが格納される。
%inst
文字列を、その文字列で指定されたオブジェクトを識別するモニカに変換する。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY に加えて以下の値を返すことがある。
（以下省略）

[備考]
MkParseDisplayName
関数は、人間が読める名前を、リンク元を識別するために使用できるモニカに解析する。結果のモニカは、単純モニカ（ファイルモニカなど）でも、構成要素のモニカから成る汎用合成モニカでもかまわない。たとえば、表示名
"c:\mydir\somefile!item 1" は、"c:\mydir\somefile" に基づく FileMoniker と
"item 1" に基づく ItemMoniker の汎用合成モニカに解析できる。MkParseDisplayName
のもっとも一般的な用途は、標準の「リンク」ダイアログボックスの実装であり、これにより、エンドユーザーは文字列を入力してリンクオブジェクトのソースを指定できる。ドキュメント外の要素への参照を許可するマクロ言語をアプリケーションがサポートする場合にも、MkParseDisplayName
の呼び出しが必要になる場合がある。

表示名の解析は、バインド操作中にアクティブ化するのと同じオブジェクトのアクティブ化を必要とすることが多いため、（性能面では）バインドと同程度にコストがかかる可能性がある。解析操作中にバインドされたオブジェクトは、関数に渡されるバインドコンテキストにキャッシュされる。MkParseDisplayName
が返したモニカをバインドする予定がある場合は、関数が戻った直後に同じバインドコンテキストを使用してバインドするのが望ましい。そうすることで、オブジェクトを
2 回アクティブ化する必要がなくなる。MkParseDisplayName
は、理解できる範囲の表示名をモニカに解析する。続いて、この関数は新しく作成されたモニカ上で
IMoniker::ParseDisplayName を呼び出し、表示名の残りを渡す。ParseDisplayName
が返すモニカは既存のモニカの末尾に合成され、表示名が未解析のまま残っている場合は、合成結果に対して再び ParseDisplayName
が呼び出される。この処理は表示名全体が解析されるまで繰り返される。MkParseDisplayName
は、表示名の先頭を解析するために、次の方法を順に試し、最初に成功したものを使用する。
（以下省略）


%index
MonikerCommonPrefixWith
このモニカ（このモニカオブジェクトのデータを構成するモニカ）と別のモニカが共有する共通プレフィックスに基づき、新しいモニカを作成する。
%prm
pmkThis, pmkOther, ppmkCommon
pmkThis : [var] 共通プレフィックスを求める対象の一方のモニカ上の IMoniker インターフェイスへのポインタ。通常、この呼び出しを IMoniker::CommonPrefixWith の実装に使用しているモニカ自身を指す。
pmkOther : [var] 最初のモニカと比較される、もう一方のモニカ上の IMoniker インターフェイスへのポインタ。
ppmkCommon : [var] pmkThis と pmkOther の共通プレフィックスに基づくモニカへのインターフェイスポインタを受け取る IMoniker* ポインタ変数のアドレス。成功時、関数はモニカに対して AddRef を呼び出しており、呼び出し側が Release を呼び出す責任を負う。エラー発生時、指定されたインターフェイスポインタの値は NULL となる。
%inst
このモニカ（このモニカオブジェクトのデータを構成するモニカ）と別のモニカが共有する共通プレフィックスに基づき、新しいモニカを作成する。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY および E_UNEXPECTED に加えて以下の値を返すことがある。
（以下省略）

[備考]
IMoniker::CommonPrefixWith
の実装では、まず相手のモニカが自分が認識して特別な方法で扱える型かどうかを確認すべきである。そうでない場合、自身を
pmkThis、相手のモニカを pmkOther として MonikerCommonPrefixWith
を呼び出すこと。MonikerCommonPrefixWith は、どちらかのモニカが汎用合成である場合も正しく処理する。
この関数は、pmkThis と pmkOther
の両方が絶対モニカである場合にのみ呼び出すこと。ここで絶対モニカとは、ファイルモニカまたは最左成分がファイルモニカである汎用合成モニカで、かつそのファイルモニカが絶対パスを表すものをいう。相対モニカに対してこの関数を呼び出してはならない。


%index
MonikerRelativePathTo
最初に指定されたモニカ（または類似の構造を持つモニカ）の末尾に合成することで、2 つ目に指定されたモニカが得られるようなモニカを提供する。
%prm
pmkSrc, pmkDest, ppmkRelPath, dwReserved
pmkSrc : [var] 作成する相対モニカと合成することで pmkDest が得られるモニカ上の IMoniker インターフェイスへのポインタ。このモニカは、作成する相対モニカの「ソース」を識別する。
pmkDest : [var] pmkSrc からの相対として表すモニカ上の IMoniker インターフェイスへのポインタ。このモニカは、作成する相対モニカの宛先を識別する。
ppmkRelPath : [var] 新しい相対モニカへのインターフェイスポインタを受け取る IMoniker* ポインタ変数のアドレス。成功時、関数はモニカに対して AddRef を呼び出しており、呼び出し側が Release を呼び出す責任を負う。エラー発生時、インターフェイスポインタの値は NULL となる。
dwReserved : [int] このパラメータは予約済みであり、0 以外の値を指定しなければならない。
%inst
最初に指定されたモニカ（または類似の構造を持つモニカ）の末尾に合成することで、2 つ目に指定されたモニカが得られるようなモニカを提供する。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG、E_OUTOFMEMORY、および E_UNEXPECTED
に加えて以下の値を返すことがある。
（以下省略）

[備考]
IMoniker::RelativePathTo
の実装では、まず相手のモニカが自分が認識して特別な方法で扱える型かどうかを確認すべきである。そうでない場合、自身を
pmkThis、相手のモニカを pmkOther として MonikerRelativePathTo
を呼び出すこと。MonikerRelativePathTo は、どちらかのモニカが汎用合成である場合も正しく処理する。
この関数は、pmkSrc と pmkDest
の両方が絶対モニカである場合にのみ呼び出すこと。ここで絶対モニカとは、ファイルモニカまたは最左成分がファイルモニカである汎用合成モニカで、かつそのファイルモニカが絶対パスを表すものをいう。相対モニカに対してこの関数を呼び出してはならない。


%index
OleBuildVersion
この関数は廃止されている。
%prm

%inst
この関数は廃止されている。

[戻り値]
廃止。


%index
OleConvertIStorageToOLESTREAM
OleConvertIStorageToOLESTREAM 関数は、指定されたストレージオブジェクトを OLE 2 構造化ストレージから OLE 1 ストレージオブジェクトモデルに変換するが、表示データは含めない。これは複数の互換関数の一つである。
%prm
pstg, lpolestream
pstg : [var] OLE 1 ストレージに変換する対象のストレージオブジェクト上の IStorage インターフェイスへのポインタ。
lpolestream : [var] OLE 1 ストレージモデルを使用してオブジェクトの永続的表現を保存する OLE 1 ストリーム構造体へのポインタ。
%inst
OleConvertIStorageToOLESTREAM 関数は、指定されたストレージオブジェクトを OLE 2 構造化ストレージから
OLE 1 ストレージオブジェクトモデルに変換するが、表示データは含めない。これは複数の互換関数の一つである。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG に加えて以下をサポートする。

[備考]
この関数は OLE 2 ストレージオブジェクトを OLE 1 形式に変換する。OLE 1 用に実装された OLESTREAM
構造体のコードが利用可能でなければならない。関数開始時、lpolestm が指すストリームは OleSaveToStream
呼び出し用に作成され、位置決めされている必要がある。関数終了時、ストリームには OLE 1
ストレージを使用したオブジェクトの永続的表現が格納されている。注:
ペイントブラシオブジェクトは、ネイティブデータがデバイス非依存ビットマップ（DIB）形式であるため、他のオブジェクトとは異なる扱いを受ける。ペイントブラシオブジェクトを
OleConvertIStorageToOLESTREAM で変換する場合、OLESTREAM
構造体に表示データは追加されない。表示データを含めるには、代わりに OleConvertIStorageToOLESTREAMEx
関数を使用すること。


%index
OleConvertIStorageToOLESTREAMEx
OleConvertIStorageToOLESTREAMEx 関数は、指定されたストレージオブジェクトを OLE 2 構造化ストレージから OLE 1 ストレージオブジェクトモデルに、表示データを含めて変換する。
%prm
pstg, cfFormat, lWidth, lHeight, dwSize, pmedium, polestm
pstg : [var] OLE 1 ストレージに変換する対象のストレージオブジェクト上の IStorage インターフェイスへのポインタ。
cfFormat : [int] 表示データの形式。NULL を指定することもでき、その場合、lWidth、lHeight、dwSize、および pmedium の各パラメータは無視される。
lWidth : [int] オブジェクト表示データの幅（HIMETRIC 単位）。
lHeight : [int] オブジェクト表示データの高さ（HIMETRIC 単位）。
dwSize : [int] 変換するデータのサイズ（バイト単位）。
pmedium : [var] 変換対象のシリアル化データに対する STGMEDIUM 構造体へのポインタ。
polestm : [var] OLE 1 ストレージモデルを使用してオブジェクトの永続的表現を保存するストリームへのポインタ。
%inst
OleConvertIStorageToOLESTREAMEx 関数は、指定されたストレージオブジェクトを OLE 2
構造化ストレージから OLE 1 ストレージオブジェクトモデルに、表示データを含めて変換する。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG に加えて以下をサポートする。

[備考]
OleConvertIStorageToOLESTREAMEx 関数は OLE 2 ストレージオブジェクトを OLE 1
形式に変換する。OleConvertIStorageToOLESTREAM
関数との違いは、OleConvertIStorageToOLESTREAMEx では表示データも OLE 1
ストレージオブジェクトに渡される点である（OleConvertIStorageToOLESTREAM
では渡されない）。OleConvertIStorageToOLESTREAMEx ではどの表示データを変換するかを指定できるため、OLE
のデフォルトのキャッシュ機能は使用しないが、OLE の変換機能を使用するアプリケーションでも利用できる。STGMEDIUM の tymed
メンバの値は TYMED_HGLOBAL または TYMED_ISTREAM のいずれかでなければならない。詳細は TYMED
列挙を参照。メディアは OleConvertIStorageToOLESTREAMEx 関数によっては解放されない。


%index
OleConvertOLESTREAMToIStorage
指定されたオブジェクトを、表示データを指定せずに OLE 1 ストレージモデルから OLE 2 構造化ストレージオブジェクトに変換する。
%prm
lpolestream, pstg, ptd
lpolestream : [var] OLE 1 ストレージ形式でのオブジェクトの永続的表現を含むストリームへのポインタ。
pstg : [var] OLE 2 構造化ストレージオブジェクト上の IStorage インターフェイスへのポインタ。
ptd : [var] OLE 1 オブジェクトがレンダリングされる対象デバイスを指定する DVTARGETDEVICE 構造体へのポインタ。
%inst
指定されたオブジェクトを、表示データを指定せずに OLE 1 ストレージモデルから OLE 2 構造化ストレージオブジェクトに変換する。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG に加えて以下をサポートする。

[備考]
この関数は OLE 1 オブジェクトを OLE 2
構造化ストレージオブジェクトに変換する。オブジェクトアプリケーションの新しいバージョンが OLE 2 をサポートする場合に、OLE 1
オブジェクトを OLE 2 オブジェクトに更新するためにこの関数を使用する。関数開始時、lpolestm パラメータは
OleLoadFromStream 関数呼び出し用に作成され、位置決めされている必要がある。関数終了時、lpolestm パラメータは
OleLoadFromStream 終了時と同じように位置決めされ、pstg パラメータには OLE 2
ストレージオブジェクトのコミットされていない永続的表現が格納される。表示にネイティブデータを使用する OLE 1
オブジェクトの場合、OleConvertOLESTREAMToIStorage 関数は
CONVERT10_S_NO_PRESENTATION を返す。この戻り値を受け取った呼び出し側は IOleObject::Update
を呼び出して表示データを取得し、それをストレージに書き込むようにすべきである。OLE
のデフォルトのキャッシュ機能を使用せず、変換機能だけを使用するアプリケーションは、代替関数
OleConvertOLESTREAMToIStorageEx
を使用することができ、こちらでは変換する表示データを指定できる。OleConvertOLESTREAMToIStorageEx
関数では、OLESTREAM 構造体から読み取られた表示データが渡され、新しく作成された OLE 2
ストレージオブジェクトには表示ストリームが含まれない。次の手順は、OleConvertOLESTREAMToIStorage
を使用した変換処理を示している。OLE 1 オブジェクトを OLE 2 ストレージオブジェクトに変換する
（以下省略）


%index
OleConvertOLESTREAMToIStorage2
(no summary)
%prm
lpolestream, pstg, ptd, opt, pvCallbackContext, pQueryConvertOLELinkCallback
lpolestream : [var] 
pstg : [var] 
ptd : [var] 
opt : [int] 
pvCallbackContext : [intptr] 
pQueryConvertOLELinkCallback : [int] 
%inst



%index
OleConvertOLESTREAMToIStorageEx
OleConvertOLESTREAMToIStorageEx 関数は、指定されたオブジェクトを表示データを含めて OLE 1 ストレージモデルから OLE 2 構造化ストレージオブジェクトに変換する。これは複数の互換関数の一つである。
%prm
polestm, pstg, pcfFormat, plwWidth, plHeight, pdwSize, pmedium
polestm : [var] OLE 1 ストレージ形式でのオブジェクトの永続的表現を含むストリームへのポインタ。
pstg : [var] OLE 2 構造化ストレージオブジェクトへのポインタ。
pcfFormat : [var] 表示データの形式が返される場所へのポインタ。NULL を指定することもでき、その場合は表示データがないことを示す。
plwWidth : [var] 表示データの幅の値（HIMETRIC 単位）が返される場所へのポインタ。
plHeight : [var] 表示データの高さの値（HIMETRIC 単位）が返される場所へのポインタ。
pdwSize : [var] 変換されたデータのサイズ（バイト単位）が返される場所へのポインタ。
pmedium : [var] 変換されたシリアル化データに対する STGMEDIUM 構造体が返される場所へのポインタ。
%inst
OleConvertOLESTREAMToIStorageEx 関数は、指定されたオブジェクトを表示データを含めて OLE 1
ストレージモデルから OLE 2 構造化ストレージオブジェクトに変換する。これは複数の互換関数の一つである。

[戻り値]
この関数は HRESULT を返す。

[備考]
この関数は OLE 1 オブジェクトを OLE 2
構造化ストレージオブジェクトに変換する。オブジェクトアプリケーションの新しいバージョンが OLE 2 をサポートする場合に、OLE 1
オブジェクトを OLE 2 オブジェクトに更新するためにこの関数を使用できる。この関数と
OleConvertOLESTREAMToIStorage 関数の違いは、OLESTREAM
構造体から読み取られた表示データが渡され、新しく作成される OLE 2
ストレージオブジェクトには表示ストリームが含まれない点である。この関数ではどの表示データを変換するかを指定できるため、OLE
のデフォルトのキャッシュ機能は使用しないが、変換機能を使用するアプリケーションでも利用できる。STGMEDIUM の tymed メンバは
TYMED_NULL または TYMED_ISTREAM でなければならない。TYMED_NULL の場合、データは STGMEDIUM
の hGlobal メンバを通じてグローバルハンドルとして返される。そうでない場合、データはこの構造体の pstm メンバに書き込まれる。


%index
OleConvertOLESTREAMToIStorageEx2
(no summary)
%prm
polestm, pstg, pcfFormat, plwWidth, plHeight, pdwSize, pmedium, opt, pvCallbackContext, pQueryConvertOLELinkCallback
polestm : [var] 
pstg : [var] 
pcfFormat : [var] 
plwWidth : [var] 
plHeight : [var] 
pdwSize : [var] 
pmedium : [var] 
opt : [int] 
pvCallbackContext : [intptr] 
pQueryConvertOLELinkCallback : [int] 
%inst



%index
OleCreate
OleCreate 関数（ole2.h）は、CLSID で識別される埋め込みオブジェクトを作成する。これはエンドユーザーがオブジェクトを挿入できるメニュー項目の実装に使用できる。
%prm
rclsid, riid, renderopt, pFormatEtc, pClientSite, pStg, ppvObj
rclsid : [var] 作成対象の埋め込みオブジェクトの CLSID。
riid : [var] 呼び出し側が新しいオブジェクトと通信するために使用するインターフェイスの識別子への参照。通常は IID_IOleObject（OLE ヘッダで IOleObject のインターフェイス識別子として定義されている）を指定する。
renderopt : [int] 新しく作成されるオブジェクトが持つローカルキャッシュによる描画機能を示す OLERENDER 列挙の値。選択された OLERENDER 値は、pFormatEtc パラメータの取り得る値に影響する。
pFormatEtc : [var] renderopt の値として使用される OLERENDER フラグに応じて、FORMATETC 列挙値の一つへのポインタ。制限については OLERENDER 列挙を参照。このパラメータは renderopt パラメータと合わせて、新しいオブジェクトが初期にキャッシュできるものを指定する。
pClientSite : [var] OleCreate に IOleObject::SetClientSite を呼び出させたい場合、コンテナ上の IOleClientSite インターフェイスへのポインタ。NULL を指定してもよく、その場合は操作を試みる前に明示的に IOleObject::SetClientSite を呼び出す必要がある。
pStg : [var] ストレージオブジェクト上の IStorage インターフェイスのインスタンスへのポインタ。このパラメータに NULL を指定することはできない。
ppvObj : [var] riid で要求したインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了した場合、*ppvObject には要求されたインターフェイスポインタが格納される。
%inst
OleCreate 関数（ole2.h）は、CLSID
で識別される埋め込みオブジェクトを作成する。これはエンドユーザーがオブジェクトを挿入できるメニュー項目の実装に使用できる。

[戻り値]
この関数は成功時に S_OK を返し、標準の戻り値 E_OUTOFMEMORY をサポートする。
（以下省略）

[備考]
OleCreate
関数は新しい埋め込みオブジェクトを作成する。通常はメニュー項目「新規オブジェクトの挿入」を実装するために呼び出される。OleCreate
が戻ったとき、renderopt が OLERENDER_DRAW または OLERENDER_FORMAT
でない限り、作成されたオブジェクトは空（データなし）の状態でロードされている。通常、コンテナはその後 OleRun 関数または
IOleObject::DoVerb を呼び出して、初期編集のためにオブジェクトを表示する。
rclsid パラメータは要求されたオブジェクトの CLSID を指定する。登録済みオブジェクトの CLSID
はシステムレジストリに格納されている。アプリケーションのユーザーが「オブジェクトの挿入」を選択すると、レジストリ内から希望のオブジェクト型をユーザーが選択できる選択ボックスが表示される。OleCreate
を「オブジェクトの挿入」メニュー項目の実装に使用する場合、選択された項目に関連付けられた CLSID が OleCreate の
rclsid パラメータに割り当てられる。
riid パラメータは、クライアントが新しいオブジェクトと通信するために使用するインターフェイスを指定する。正常終了時、ppvObject
パラメータは要求されたインターフェイスへのポインタを保持する。

作成されたオブジェクトのキャッシュには、コンテナが開かれたときにオブジェクトの表示を可能にする情報が含まれる。何をキャッシュすべきかに関する情報は
renderopt および pFormatetc の値で渡される。OleCreate
が戻ったとき、作成されたオブジェクトのキャッシュは必ずしも満たされていない。代わりに、キャッシュはオブジェクトが初めて実行状態に入ったときに満たされる。呼び出し側は
OleCreate が戻った後、オブジェクトが実行される前に IOleCache::Cache
を呼び出してキャッシュ制御を追加することができる。renderopt が OLERENDER_DRAW または
OLERENDER_FORMAT の場合、OleCreate はオブジェクトが IOleCache
インターフェイスをサポートしていることを要求する。その他の renderopt 値の場合はそのような要件はない。pClientSite が
NULL でない場合、OleCreate は pClientSite ポインタを通じて IOleObject::SetClientSite
を呼び出す。IOleClientSite
は、オブジェクトがコンテナからサービスを要求する主要なインターフェイスである。pClientSite が NULL
の場合は、操作を試みる前に明示的に IOleObject::SetClientSite を呼び出す必要がある。


%index
OleCreateDefaultHandler
デフォルトの埋め込みハンドラの新しいインスタンスを作成する。このインスタンスは、埋め込みオブジェクトが実行状態に入ったときにローカルサーバーを作成するように初期化される。
%prm
clsid, pUnkOuter, riid, lplpObj
clsid : [var] 埋め込みオブジェクトが実行状態に入ったときにロードされる OLE サーバーを識別する CLSID。
pUnkOuter : [var] ハンドラを集約する場合は制御用 IUnknown インターフェイスへのポインタ。集約しない場合は NULL。
riid : [var] 呼び出し側がハンドラと通信するために使用するインターフェイスの識別子への参照。通常は IID_IOleObject を指定する。
lplpObj : [var] riid で要求したインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了した場合、*ppvObj には新しく作成されたハンドラ上の要求されたインターフェイスポインタが格納される。
%inst

デフォルトの埋め込みハンドラの新しいインスタンスを作成する。このインスタンスは、埋め込みオブジェクトが実行状態に入ったときにローカルサーバーを作成するように初期化される。

[戻り値]
この関数は成功時に NOERROR を返し、標準の戻り値 E_OUTOFMEMORY をサポートする。

[備考]
OleCreateDefaultHandler
はデフォルトの埋め込みハンドラの新しいインスタンスを作成し、埋め込みオブジェクトが実行状態に入ったときに clsid
パラメータで識別されるローカルサーバーを作成するように初期化する。ハンドラを作成していて、デフォルトハンドラのサービスを利用したい場合は
OleCreateDefaultHandler を呼び出すこと。OLE は、オブジェクト作成呼び出しで指定された CLSID
が登録されていない場合にも、内部でこの関数を呼び出す。
指定されたクラスに特別なハンドラが存在しない場合、OleCreateDefaultHandler
の呼び出しは、クラスコンテキストパラメータに CLSCTX_INPROC_HANDLER を指定した CoCreateInstance
関数の呼び出しと同じ結果を生じる。


%index
OleCreateEmbeddingHelper
OLE デフォルトオブジェクトハンドラの各部分と集約された、アプリケーション提供のコードを用いて OLE 埋め込みヘルパーオブジェクトを作成する。このヘルパーオブジェクトは、呼び出し側が指定する特定のコンテキストおよび役割で作成し使用できる。
%prm
clsid, pUnkOuter, flags, pCF, riid, lplpObj
clsid : [var] 補助対象となるクラスの CLSID。
pUnkOuter : [var] 埋め込みヘルパーを集約する場合、外側のオブジェクトの制御用 IUnknown インターフェイスへのポインタ。集約しない場合は（まれではあるが）NULL を指定する。
flags : [int] 埋め込みヘルパーの役割と作成コンテキストを指定するフラグを含む DWORD。有効な値については後述の「備考」を参照。
pCF : [var] 関数が二次オブジェクトを作成するために使用するクラスオブジェクト上の IClassFactory インターフェイスへのポインタ。状況によってはこの値は NULL でもよい。詳細は後述の「備考」を参照。
riid : [var] 呼び出し側が要求するインターフェイスの識別子への参照。
lplpObj : [var] riid で要求したインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了した場合、*ppvObj には新しく作成された埋め込みヘルパー上の要求されたインターフェイスポインタが格納される。
%inst
OLE デフォルトオブジェクトハンドラの各部分と集約された、アプリケーション提供のコードを用いて OLE
埋め込みヘルパーオブジェクトを作成する。このヘルパーオブジェクトは、呼び出し側が指定する特定のコンテキストおよび役割で作成し使用できる。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
OleCreateEmbeddingHelper
関数は、デフォルトハンドラにあるインターフェイス実装と同じものをサポートするオブジェクトを作成するが、単なるハンドラオブジェクト以上に広く使用できる追加のフックを持っている。次の
2 つの呼び出しは同じ結果を生じる。
（以下省略）


%index
OleCreateEx
OleCreate が単一の形式しかサポートしないのに対し、複数の表示形式またはデータのキャッシュを必要とするコンテナ内でのオブジェクトのより効率的なインスタンス化をサポートすることで、OleCreate の機能を拡張する。
%prm
rclsid, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj
rclsid : [var] 作成するオブジェクトのクラスを識別する。
riid : [var] 返すオブジェクトのインターフェイスの識別子への参照。
dwFlags : [int] この値は 0 または OLECREATE_LEAVERUNNING（0x00000001）である。
renderopt : [int] OLERENDER 列挙から取る値。
cFormats : [int] renderopt が OLERENDER_FORMAT の場合、rgFormatEtc 配列内の FORMATETC 構造体の数を示す。1 以上でなければならない。それ以外の場合、このパラメータは 0 でなければならない。
rgAdvf : [var] renderopt が OLERENDER_FORMAT の場合、cFormats 個の DWORD 要素の配列を指す。各要素は ADVF 列挙の値の組み合わせである。この配列の各要素は、pAdviseSink が NULL かどうかに応じて、IOleCache::Cache または IDataObject::DAdvise の呼び出しに advf パラメータとして渡される（後述）。それ以外の場合、このパラメータは NULL でなければならない。
rgFormatEtc : [var] renderopt が OLERENDER_FORMAT の場合、cFormats 個の FORMATETC 構造体の配列を指す。pAdviseSink が NULL の場合、この配列の各要素はオブジェクトの IOleCache::Cache の呼び出しに pFormatEtc パラメータとして渡される。これにより、オブジェクトのインプロセスハンドラ（通常はデフォルトハンドラ）が管理するデータおよび表示キャッシュが、表示データやその他のキャッシュ可能なデータで満たされる。pAdviseSink が NULL でない場合、この配列の各要素は IDataObject::DAdvise の呼び出しに pFormatEtc パラメータとして渡される。これにより呼び出し側（通常は OLE コンテナ）は、オブジェクトから受信したデータを独自にキャッシュまたは処理できるようになる。それ以外の場合、このパラメータは NULL でなければならない。
lpAdviseSink : [var] renderopt が OLERENDER_FORMAT の場合、有効な IAdviseSink ポインタ（データアドバイスのカスタムキャッシュまたは処理を示す）または NULL（データ形式のデフォルトキャッシュを示す）のいずれかを指定できる。それ以外の場合、このパラメータは NULL でなければならない。
rgdwConnection : [var] IDataObject::DAdvise を使用して各アドバイザリ接続に対して pAdviseSink インターフェイスが登録されたときに返される dwConnection 値の配列を返す場所。返されたアドバイザリ接続が不要な場合は NULL。pAdviseSink が NULL の場合は NULL でなければならない。
pClientSite : [var] オブジェクトがコンテナからサービスを要求するための主要インターフェイスへのポインタ。このパラメータには NULL を指定できる。その場合、呼び出し側は可能な限り早く IOleObject::SetClientSite を使用してクライアントサイトを確立する責任を負う。
pStg : [var] オブジェクトおよびそれに対して確立されるデフォルトのデータまたは表示キャッシュに使用するストレージへのポインタ。このパラメータに NULL を指定することはできない。
ppvObj : [var] riid で要求したインターフェイスポインタを受け取る出力ポインタ変数のアドレス。正常終了した場合、*ppvObj には新しく作成されたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
OleCreate
が単一の形式しかサポートしないのに対し、複数の表示形式またはデータのキャッシュを必要とするコンテナ内でのオブジェクトのより効率的なインスタンス化をサポートすることで、OleCreate
の機能を拡張する。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
以下の OleCreate の呼び出し。
（以下省略）


%index
OleCreateFromData
クリップボードから取得したもの、または OLE ドラッグアンドドロップ操作の一部として取得したデータ転送オブジェクトから埋め込みオブジェクトを作成する。OLE ドラッグアンドドロップ操作からの貼り付け実装に使用することを想定している。
%prm
pSrcDataObj, riid, renderopt, pFormatEtc, pClientSite, pStg, ppvObj
pSrcDataObj : [var] オブジェクト作成の元となるデータを保持するデータ転送オブジェクト上の IDataObject インターフェイスへのポインタ。
riid : [var] 呼び出し側が後に新しいオブジェクトと通信するために使用するインターフェイスの識別子への参照（通常は IID_IOleObject で、これは OLE ヘッダで IOleObject のインターフェイス識別子として定義されている）。
renderopt : [int] 新しく作成されるオブジェクトが持つローカルキャッシュによる描画またはデータ取得機能を示す OLERENDER 列挙の値。追加の考慮事項については後述の「備考」を参照。
pFormatEtc : [var] 新しく作成されるオブジェクトが持つローカルキャッシュによる描画またはデータ取得機能を示す OLERENDER 列挙値へのポインタ。選択された OLERENDER 値は pFormatEtc パラメータの取り得る値に影響する。
pClientSite : [var] オブジェクトがコンテナからサービスを要求するための主要インターフェイスである IOleClientSite のインスタンスへのポインタ。このパラメータには NULL を指定できる。
pStg : [var] ストレージオブジェクト上の IStorage インターフェイスへのポインタ。このパラメータに NULL を指定することはできない。
ppvObj : [var] riid で要求したインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了した場合、*ppvObj には新しく作成されたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
クリップボードから取得したもの、または OLE
ドラッグアンドドロップ操作の一部として取得したデータ転送オブジェクトから埋め込みオブジェクトを作成する。OLE
ドラッグアンドドロップ操作からの貼り付け実装に使用することを想定している。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
OleCreateFromData 関数は、IDataObject
インターフェイスをサポートするデータ転送オブジェクトから埋め込みオブジェクトを作成する。この場合のデータオブジェクトは、OleGetClipboard
関数の呼び出しでクリップボードから取得したものか、または OLE ドラッグアンドドロップ操作の一部として渡されたもの（データオブジェクトは
IDropTarget::Drop の呼び出しに渡される）である。FileName または FileNameW
クリップボード形式（CF_FILENAME）がデータ転送オブジェクト内に存在し、CF_EMBEDDEDOBJECT または
CF_EMBEDSOURCE が存在しない場合、OleCreateFromData
はまず指定されたファイルを含むパッケージを作成しようとする。一般に、最初に利用可能な形式を使用する。パッケージを作成できない場合、OleCreateFromData
は CF_EMBEDDEDOBJECT 形式を使ってオブジェクトの作成を試みる。この形式が利用できない場合は、CF_EMBEDSOURCE
形式での作成を試みる。いずれの形式も利用できず、データ転送オブジェクトが IPersistStorage
インターフェイスをサポートしている場合、OleCreateFromData はオブジェクトの IPersistStorage::Save
を呼び出してオブジェクト自身に保存させる。

既存のリンクオブジェクトが選択されたうえでコピーされた場合、それはクリップボード上では通常の埋め込み可能オブジェクトとして現れる。したがって、OleCreateFromData
を呼び出す貼り付け操作はリンクオブジェクトを作成する可能性がある。貼り付け操作の後、コンテナは QueryInterface
関数を呼び出して IID_IOleLink（OLE ヘッダで IOleLink
のインターフェイス識別子として定義されている）を要求し、リンクオブジェクトが作成されたかどうかを判定すべきである。
renderopt および pFormatetc
パラメータを使用して、新しく作成されるオブジェクトのキャッシュ機能を制御する。これらのパラメータの相互作用を使って何をキャッシュするかを判断する方法に関する一般的な情報については
OLERENDER 列挙を参照。ただし、これらのパラメータが OleCreateFromData
のキャッシュ初期化方法に及ぼす具体的な影響がいくつかある。
OleCreateFromData が CF_EMBEDDEDOBJECT または CF_EMBEDSOURCE
のどちらかのクリップボード形式を使用して埋め込みオブジェクトを作成する場合、両者の主な違いはキャッシュ初期化データの格納場所である。
（以下省略）


%index
OleCreateFromDataEx
OleCreateFromData が単一の形式しかサポートしないのに対し、複数の表示形式またはデータのキャッシュを必要とするコンテナ内でのオブジェクトのより効率的なインスタンス化をサポートすることで、OleCreateFromData の機能を拡張する。
%prm
pSrcDataObj, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj
pSrcDataObj : [var] 新しいオブジェクトを作成するために使用する新しいデータを保持するデータ転送オブジェクトへのポインタ（OleCreateFromData を参照）。
riid : [var] 返すオブジェクトのインターフェイスの識別子への参照。
dwFlags : [int] このパラメータは 0 または OLECREATE_LEAVERUNNING（0x00000001）である。
renderopt : [int] OLERENDER 列挙から取る値。
cFormats : [int] renderopt が OLERENDER_FORMAT の場合、rgFormatEtc 配列内の FORMATETC 構造体の数を示す。1 以上でなければならない。それ以外の場合、このパラメータは 0 でなければならない。
rgAdvf : [var] renderopt が OLERENDER_FORMAT の場合、DWORD 要素の配列を指す。各要素は ADVF 列挙の値の組み合わせである。この配列の各要素は、pAdviseSink が NULL かどうかに応じて、IOleCache::Cache または IDataObject::DAdvise の呼び出しに advf パラメータとして渡される（後述）。それ以外の場合、このパラメータは NULL でなければならない。
rgFormatEtc : [var] renderopt が OLERENDER_FORMAT の場合、FORMATETC 構造体の配列を指す。pAdviseSink が NULL の場合、この配列の各要素はオブジェクトの IOleCache::Cache の呼び出しに pFormatEtc パラメータとして渡される。これにより、オブジェクトのインプロセスハンドラ（通常はデフォルトハンドラ）が管理するデータおよび表示キャッシュが、表示データやその他のキャッシュ可能なデータで満たされる。pAdviseSink が NULL でない場合、この配列の各要素は IDataObject::DAdvise の呼び出しに pFormatEtc パラメータとして渡される。これにより呼び出し側（通常は OLE コンテナ）は、オブジェクトから受信したデータを独自にキャッシュまたは処理できるようになる。
lpAdviseSink : [var] renderopt が OLERENDER_FORMAT の場合、有効な IAdviseSink ポインタ（データアドバイスのカスタムキャッシュまたは処理を示す）または NULL（データ形式のデフォルトキャッシュを示す）のいずれかを指定できる。
rgdwConnection : [var] IDataObject::DAdvise を使用して各アドバイザリ接続に対して IAdviseSink インターフェイスが登録されたときに返される dwConnection 値の配列を返す場所。返されたアドバイザリ接続が不要な場合は NULL。pAdviseSink が NULL の場合は NULL でなければならない。
pClientSite : [var] オブジェクトがコンテナからサービスを要求するための主要インターフェイスへのポインタ。このパラメータには NULL を指定できる。その場合、呼び出し側は可能な限り早く IOleObject::SetClientSite を使用してクライアントサイトを確立する責任を負う。
pStg : [var] オブジェクトおよびそれに対して確立されるデフォルトのデータまたは表示キャッシュに使用するストレージへのポインタ。
ppvObj : [var] riid で要求したインターフェイスポインタを受け取る出力ポインタ変数のアドレス。正常終了した場合、*ppvObj には新しく作成されたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
OleCreateFromData
が単一の形式しかサポートしないのに対し、複数の表示形式またはデータのキャッシュを必要とするコンテナ内でのオブジェクトのより効率的なインスタンス化をサポートすることで、OleCreateFromData
の機能を拡張する。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
以下の OleCreateFromData の呼び出し。
（以下省略）


%index
OleCreateFromFile
OleCreateFromFile 関数（ole2.h）は、指定されたファイルの内容から埋め込みオブジェクトを作成する。
%prm
rclsid, lpszFileName, riid, renderopt, lpFormatEtc, pClientSite, pStg, ppvObj
rclsid : [var] このパラメータは予約済みであり、CLSID_NULL を指定しなければならない。
lpszFileName : [wstr] オブジェクトを初期化するためのファイルの完全なパスを指定する文字列へのポインタ。
riid : [var] 呼び出し側が後に新しいオブジェクトと通信するために使用するインターフェイスの識別子への参照（通常は IID_IOleObject で、これは OLE ヘッダで IOleObject のインターフェイス ID として定義されている）。
renderopt : [int] 新しく作成されるオブジェクトが持つローカルキャッシュによる描画またはデータ取得機能を示す OLERENDER 列挙の値。選択された OLERENDER 値は lpFormatEtc パラメータの取り得る値に影響する。
lpFormatEtc : [var] renderopt の値として使用される OLERENDER フラグに応じて、FORMATETC 列挙値の一つへのポインタ。制限については OLERENDER 列挙も参照。
pClientSite : [var] オブジェクトがコンテナからサービスを要求するための主要インターフェイスである IOleClientSite のインスタンスへのポインタ。このパラメータには NULL を指定できる。
pStg : [var] ストレージオブジェクト上の IStorage インターフェイスへのポインタ。このパラメータに NULL を指定することはできない。
ppvObj : [var] riid で要求したインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了した場合、*ppvObj には新しく作成されたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
OleCreateFromFile 関数（ole2.h）は、指定されたファイルの内容から埋め込みオブジェクトを作成する。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
OleCreateFromFile 関数は、指定されたファイルの内容から新しい埋め込みオブジェクトを作成する。登録データベース内の
ProgID に PackageOnFileDrop キーが含まれている場合、パッケージを作成する。そうでない場合、関数は
GetClassFile 関数を呼び出して lpszFileName パラメータに関連付けられた CLSID を取得し、その CLSID
に関連付けられた OLE 2 埋め込みオブジェクトを作成する。OleCreateFromFile の rclsid
パラメータは常に無視されるので、CLSID_NULL を設定すべきである。他の OleCreateXxx
関数と同様、新しく作成されたオブジェクトはユーザーに編集用には表示されず、編集には DoVerb
操作が必要である。この関数はファイル挿入操作の実装に使用される。


%index
OleCreateFromFileEx
OleCreateFromFile が単一の形式しかサポートしないのに対し、複数の表示形式またはデータのキャッシュを必要とするコンテナ内でのオブジェクトのより効率的なインスタンス化をサポートすることで、OleCreateFromFile の機能を拡張する。
%prm
rclsid, lpszFileName, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj
rclsid : [var] このパラメータは予約済みであり、CLSID_NULL を指定しなければならない。
lpszFileName : [wstr] 新しいオブジェクトの初期化に用いるファイルの名前へのポインタ。
riid : [var] 返すオブジェクトのインターフェイスの識別子への参照。
dwFlags : [int] このパラメータは 0 または OLECREATE_LEAVERUNNING（0x00000001）である。
renderopt : [int] OLERENDER 列挙から取る値。
cFormats : [int] renderopt が OLERENDER_FORMAT の場合、rgFormatEtc 配列内の FORMATETC 構造体の数を示す。1 以上でなければならない。それ以外の場合、このパラメータは 0 でなければならない。
rgAdvf : [var] renderopt が OLERENDER_FORMAT の場合、DWORD 要素の配列を指す。各要素は ADVF 列挙の値の組み合わせである。この配列の各要素は、pAdviseSink が NULL かどうかに応じて、IOleCache::Cache または IDataObject::DAdvise の呼び出しに advf パラメータとして渡される（後述）。それ以外の場合、このパラメータは NULL でなければならない。
rgFormatEtc : [var] renderopt が OLERENDER_FORMAT の場合、FORMATETC 構造体の配列を指す。pAdviseSink が NULL の場合、この配列の各要素はオブジェクトの IOleCache::Cache の呼び出しに pFormatEtc パラメータとして渡される。これにより、オブジェクトのインプロセスハンドラ（通常はデフォルトハンドラ）が管理するデータおよび表示キャッシュが、表示データやその他のキャッシュ可能なデータで満たされる。pAdviseSink が NULL でない場合、この配列の各要素は IDataObject::DAdvise の呼び出しに pFormatEtc パラメータとして渡される。これにより呼び出し側（通常は OLE コンテナ）は、オブジェクトから受信したデータを独自にキャッシュまたは処理できるようになる。
lpAdviseSink : [var] renderopt が OLERENDER_FORMAT の場合、有効な IAdviseSink ポインタ（データアドバイスのカスタムキャッシュまたは処理を示す）または NULL（データ形式のデフォルトキャッシュを示す）のいずれかを指定できる。
rgdwConnection : [var] IDataObject::DAdvise を使用して各アドバイザリ接続に対して pAdviseSink インターフェイスが登録されたときに返される dwConnection 値の配列を返す場所。返されたアドバイザリ接続が不要な場合は NULL。pAdviseSink が NULL の場合は NULL でなければならない。
pClientSite : [var] オブジェクトがコンテナからサービスを要求するための主要インターフェイスへのポインタ。このパラメータには NULL を指定できる。その場合、呼び出し側は可能な限り早く IOleObject::SetClientSite を使用してクライアントサイトを確立する責任を負う。
pStg : [var] オブジェクトおよびそれに対して確立されるデフォルトのデータまたは表示キャッシュに使用するストレージへのポインタ。
ppvObj : [var] riid で要求したインターフェイスポインタを受け取る出力ポインタ変数のアドレス。正常終了した場合、*ppvObj には新しく作成されたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
OleCreateFromFile
が単一の形式しかサポートしないのに対し、複数の表示形式またはデータのキャッシュを必要とするコンテナ内でのオブジェクトのより効率的なインスタンス化をサポートすることで、OleCreateFromFile
の機能を拡張する。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
以下の OleCreateFromFile の呼び出し。
（以下省略）


%index
OleCreateLink
OLE 複合ドキュメントのリンクオブジェクトを作成する。
%prm
pmkLinkSrc, riid, renderopt, lpFormatEtc, pClientSite, pStg, ppvObj
pmkLinkSrc : [var] リンクオブジェクトの元を特定するために使用できるモニカ上の IMoniker インターフェイスへのポインタ。
riid : [var] 呼び出し側が後に新しいオブジェクトと通信するために使用するインターフェイスの識別子への参照（通常は IID_IOleObject で、これは OLE ヘッダで IOleObject のインターフェイス識別子として定義されている）。
renderopt : [int] 新しく作成されるオブジェクトが持つローカルキャッシュによる描画またはデータ取得機能を示す OLERENDER 列挙の値を指定する。追加の考慮事項については後述の「備考」を参照。
lpFormatEtc : [var] 新しく作成されるオブジェクトが持つローカルキャッシュによる描画またはデータ取得機能を示す OLERENDER 列挙値へのポインタ。選択された OLERENDER 値は lpFormatEtc パラメータの取り得る値に影響する。
pClientSite : [var] オブジェクトがコンテナからサービスを要求するための主要インターフェイスである IOleClientSite のインスタンスへのポインタ。このパラメータには NULL を指定できる。
pStg : [var] ストレージオブジェクト上の IStorage インターフェイスへのポインタ。このパラメータに NULL を指定することはできない。
ppvObj : [var] riid で要求したインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了した場合、*ppvObj には新しく作成されたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
OLE 複合ドキュメントのリンクオブジェクトを作成する。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
コンテナがオブジェクトへのリンクを作成できるようにするために OleCreateLink を呼び出す。


%index
OleCreateLinkEx
OleCreateLink が単一の形式しかサポートしないのに対し、複数の表示形式またはデータのキャッシュを必要とするコンテナ内でのオブジェクトのより効率的なインスタンス化をサポートすることで、OleCreateLink の機能を拡張する。
%prm
pmkLinkSrc, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj
pmkLinkSrc : [var] リンクを作成する対象のオブジェクトへのモニカへのポインタ。
riid : [var] 返すオブジェクトのインターフェイスの識別子への参照。
dwFlags : [int] このパラメータは 0 または OLECREATE_LEAVERUNNING（0x00000001）である。
renderopt : [int] OLERENDER 列挙から取る値。
cFormats : [int] renderopt が OLERENDER_FORMAT の場合、rgFormatEtc 配列内の FORMATETC 構造体の数を示す。1 以上でなければならない。それ以外の場合、このパラメータは 0 でなければならない。
rgAdvf : [var] renderopt が OLERENDER_FORMAT の場合、DWORD 要素の配列を指す。各要素は ADVF 列挙の値の組み合わせである。この配列の各要素は、pAdviseSink が NULL かどうかに応じて、IOleCache::Cache または IDataObject::DAdvise の呼び出しに advf パラメータとして渡される（後述）。それ以外の場合、このパラメータは NULL でなければならない。
rgFormatEtc : [var] renderopt が OLERENDER_FORMAT の場合、FORMATETC 構造体の配列を指す。pAdviseSink が NULL の場合、この配列の各要素はオブジェクトの IOleCache::Cache の呼び出しに pFormatEtc パラメータとして渡される。これにより、オブジェクトのインプロセスハンドラ（通常はデフォルトハンドラ）が管理するデータおよび表示キャッシュが、表示データやその他のキャッシュ可能なデータで満たされる。pAdviseSink が NULL でない場合、この配列の各要素は IDataObject::DAdvise の呼び出しに pFormatEtc パラメータとして渡される。これにより呼び出し側（通常は OLE コンテナ）は、オブジェクトから受信したデータを独自にキャッシュまたは処理できるようになる。
lpAdviseSink : [var] renderopt が OLERENDER_FORMAT の場合、有効な IAdviseSink ポインタ（データアドバイスのカスタムキャッシュまたは処理を示す）または NULL（データ形式のデフォルトキャッシュを示す）のいずれかを指定できる。
rgdwConnection : [var] IDataObject::DAdvise を使用して各アドバイザリ接続に対して IAdviseSink インターフェイスが登録されたときに返される dwConnection 値の配列を返す場所。返されたアドバイザリ接続が不要な場合は NULL。pAdviseSink が NULL の場合は NULL でなければならない。
pClientSite : [var] オブジェクトがコンテナからサービスを要求するための主要インターフェイスへのポインタ。このパラメータには NULL を指定できる。その場合、呼び出し側は可能な限り早く IOleObject::SetClientSite を使用してクライアントサイトを確立する責任を負う。
pStg : [var] オブジェクトおよびそれに対して確立されるデフォルトのデータまたは表示キャッシュに使用するストレージへのポインタ。
ppvObj : [var] riid で要求したインターフェイスポインタを受け取る出力ポインタ変数のアドレス。正常終了した場合、*ppvObj には新しく作成されたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
OleCreateLink
が単一の形式しかサポートしないのに対し、複数の表示形式またはデータのキャッシュを必要とするコンテナ内でのオブジェクトのより効率的なインスタンス化をサポートすることで、OleCreateLink
の機能を拡張する。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
以下の OleCreateLink の呼び出し。
（以下省略）


%index
OleCreateLinkFromData
クリップボードから取得したもの、または OLE ドラッグアンドドロップ操作の一部として取得したデータ転送オブジェクトからリンクオブジェクトを作成する。
%prm
pSrcDataObj, riid, renderopt, pFormatEtc, pClientSite, pStg, ppvObj
pSrcDataObj : [var] リンクオブジェクトを作成する元となるデータ転送オブジェクト上の IDataObject インターフェイスへのポインタ。
riid : [var] 呼び出し側が後に新しいオブジェクトと通信するために使用するインターフェイスの識別子への参照（通常は IID_IOleObject で、これは OLE ヘッダで IOleObject のインターフェイス識別子として定義されている）。
renderopt : [int] 新しく作成されるオブジェクトが持つローカルキャッシュによる描画またはデータ取得機能を示す OLERENDER 列挙の値。追加の考慮事項については後述の「備考」を参照。
pFormatEtc : [var] 新しく作成されるオブジェクトが持つローカルキャッシュによる描画またはデータ取得機能を示す OLERENDER 列挙値へのポインタ。選択された OLERENDER 値は pFormatEtc パラメータの取り得る値に影響する。
pClientSite : [var] オブジェクトがコンテナからサービスを要求するための主要インターフェイスである IOleClientSite のインスタンスへのポインタ。このパラメータには NULL を指定できる。
pStg : [var] ストレージオブジェクト上の IStorage インターフェイスへのポインタ。このパラメータに NULL を指定することはできない。
ppvObj : [var] riid で要求したインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了した場合、ppvObj には新しく作成されたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
クリップボードから取得したもの、または OLE
ドラッグアンドドロップ操作の一部として取得したデータ転送オブジェクトからリンクオブジェクトを作成する。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
OleCreateLinkFromData 関数は、ペーストリンクまたはドラッグリンク操作の実装に使用される。その動作は
OleCreateFromData
関数とよく似ているが、リンクを作成する点と、異なるデータ形式を探す点が異なる。CF_LINKSOURCE
形式が存在せず、かつデータ転送オブジェクトに FileName または FileNameW
クリップボード形式のいずれかが存在する場合、OleCreateLinkFromData
は指定されたファイルへのリンクを含むパッケージを作成する。
renderopt および pFormatetc
パラメータを使用して、新しく作成されるオブジェクトのキャッシュ機能を制御する。何をキャッシュするかを決定する方法に関する一般的な情報は、renderopt
と pFormatetc の相互作用の説明については OLERENDER 列挙を参照。ただし、これらのパラメータが
OleCreateLinkFromData のキャッシュ初期化方法に及ぼす具体的な影響がいくつかある。
（以下省略）


%index
OleCreateLinkFromDataEx
OleCreateLinkFromData が単一の形式しかサポートしないのに対し、複数の表示形式またはデータのキャッシュを必要とするコンテナ内でのオブジェクトのより効率的なインスタンス化をサポートすることで、OleCreateLinkFromData の機能を拡張する。
%prm
pSrcDataObj, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj
pSrcDataObj : [var] リンクオブジェクトを作成する対象のデータオブジェクトへのポインタ。
riid : [var] 返すオブジェクトのインターフェイスの識別子への参照。
dwFlags : [int] このパラメータは 0 または OLECREATE_LEAVERUNNING（0x00000001）である。
renderopt : [int] OLERENDER 列挙から取る値。
cFormats : [int] renderopt が OLERENDER_FORMAT の場合、rgFormatEtc 配列内の FORMATETC 構造体の数を示す。1 以上でなければならない。それ以外の場合、このパラメータは 0 でなければならない。
rgAdvf : [var] renderopt が OLERENDER_FORMAT の場合、DWORD 要素の配列を指す。各要素は ADVF 列挙の値の組み合わせである。この配列の各要素は、pAdviseSink が NULL かどうかに応じて、IOleCache::Cache または IDataObject::DAdvise の呼び出しに advf パラメータとして渡される（後述）。それ以外の場合、このパラメータは NULL でなければならない。
rgFormatEtc : [var] renderopt が OLERENDER_FORMAT の場合、FORMATETC 構造体の配列を指す。pAdviseSink が NULL の場合、この配列の各要素はオブジェクトの IOleCache::Cache の呼び出しに pFormatEtc パラメータとして渡される。これにより、オブジェクトのインプロセスハンドラ（通常はデフォルトハンドラ）が管理するデータおよび表示キャッシュが、表示データやその他のキャッシュ可能なデータで満たされる。pAdviseSink が NULL でない場合、この配列の各要素は IDataObject::DAdvise の呼び出しに pFormatEtc パラメータとして渡される。これにより呼び出し側（通常は OLE コンテナ）は、オブジェクトから受信したデータを独自にキャッシュまたは処理できるようになる。
lpAdviseSink : [var] renderopt が OLERENDER_FORMAT の場合、有効な IAdviseSink ポインタ（データアドバイスのカスタムキャッシュまたは処理を示す）または NULL（データ形式のデフォルトキャッシュを示す）のいずれかを指定できる。
rgdwConnection : [var] IDataObject::DAdvise を使用して各アドバイザリ接続に対して pAdviseSink インターフェイスが登録されたときに返される dwConnection 値の配列を返す場所。返されたアドバイザリ接続が不要な場合は NULL。pAdviseSink が NULL の場合は NULL でなければならない。
pClientSite : [var] オブジェクトがコンテナからサービスを要求するための主要インターフェイスへのポインタ。このパラメータには NULL を指定できる。その場合、呼び出し側は可能な限り早く IOleObject::SetClientSite を使用してクライアントサイトを確立する責任を負う。
pStg : [var] オブジェクトおよびそれに対して確立されるデフォルトのデータまたは表示キャッシュに使用するストレージへのポインタ。
ppvObj : [var] riid で要求したインターフェイスポインタを受け取る出力ポインタ変数のアドレス。正常終了した場合、*ppvObj には新しく作成されたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
OleCreateLinkFromData
が単一の形式しかサポートしないのに対し、複数の表示形式またはデータのキャッシュを必要とするコンテナ内でのオブジェクトのより効率的なインスタンス化をサポートすることで、OleCreateLinkFromData
の機能を拡張する。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
以下の OleCreateLinkFromData の呼び出し。
（以下省略）


%index
OleCreateLinkToFile
ファイルにリンクされたオブジェクトを作成する。
%prm
lpszFileName, riid, renderopt, lpFormatEtc, pClientSite, pStg, ppvObj
lpszFileName : [wstr] リンク先となるソースファイルを指定する文字列へのポインタ。
riid : [var] 呼び出し側が後に新しいオブジェクトと通信するために使用するインターフェイスの識別子への参照（通常は IID_IOleObject で、これは OLE ヘッダで IOleObject のインターフェイス識別子として定義されている）。
renderopt : [int] 新しく作成されるオブジェクトが持つローカルキャッシュによる描画またはデータ取得機能を示す OLERENDER 列挙の値。追加の考慮事項については後述の「備考」を参照。
lpFormatEtc : [var] 新しく作成されるオブジェクトが持つローカルキャッシュによる描画またはデータ取得機能を示す OLERENDER 列挙値へのポインタ。選択された OLERENDER 値は pFormatEtc パラメータの取り得る値に影響する。
pClientSite : [var] オブジェクトがコンテナからサービスを要求するための主要インターフェイスである IOleClientSite のインスタンスへのポインタ。このパラメータには NULL を指定できる。
pStg : [var] ストレージオブジェクト上の IStorage インターフェイスへのポインタ。このパラメータに NULL を指定することはできない。
ppvObj : [var] riid で要求したインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了した場合、*ppvObj には新しく作成されたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
ファイルにリンクされたオブジェクトを作成する。

[戻り値]
この関数は成功時に S_OK を返す。その他の戻り値には以下が含まれる。
（以下省略）

[備考]
OleCreateLinkToFile 関数は OleCreateLink 関数と異なり、OLE
を認識していないファイルへのリンクも、Windows Packager を使用しているファイルへのリンクも作成できる。


%index
OleCreateLinkToFileEx
OleCreateLinkToFile の機能を拡張し、OleCreateLinkToFile がサポートする単一形式ではなく、複数のプレゼンテーションやデータ形式のキャッシュを必要とするコンテナにおけるオブジェクトのインスタンス化をより効率的に行えるようにする。
%prm
lpszFileName, riid, dwFlags, renderopt, cFormats, rgAdvf, rgFormatEtc, lpAdviseSink, rgdwConnection, pClientSite, pStg, ppvObj
lpszFileName : [wstr] リンク先となるファイルの名前へのポインタ。
riid : [var] 返すオブジェクトのインターフェイスの識別子への参照。
dwFlags : [int] このパラメータは 0 または OLECREATE_LEAVERUNNING（0x00000001）である。
renderopt : [int] OLERENDER 列挙から取る値。
cFormats : [int] renderopt が OLERENDER_FORMAT の場合、rgFormatEtc 配列内の FORMATETC 構造体の数を示す。1 以上でなければならない。それ以外の場合、このパラメータは 0 でなければならない。
rgAdvf : [var] renderopt が OLERENDER_FORMAT の場合、DWORD 要素の配列を指す。各要素は ADVF 列挙の値の組み合わせである。この配列の各要素は、pAdviseSink が NULL かどうかに応じて、IOleCache::Cache または IDataObject::DAdvise の呼び出しに advf パラメータとして渡される（後述）。それ以外の場合、このパラメータは NULL でなければならない。
rgFormatEtc : [var] renderopt が OLERENDER_FORMAT の場合、FORMATETC 構造体の配列を指す。pAdviseSink が NULL の場合、この配列の各要素はオブジェクトの IOleCache::Cache の呼び出しに pFormatEtc パラメータとして渡される。これにより、オブジェクトのインプロセスハンドラ（通常はデフォルトハンドラ）が管理するデータおよび表示キャッシュが、表示データやその他のキャッシュ可能なデータで満たされる。pAdviseSink が NULL でない場合、この配列の各要素は IDataObject::DAdvise の呼び出しに pFormatEtc パラメータとして渡される。これにより呼び出し側（通常は OLE コンテナ）は、オブジェクトから受信したデータを独自にキャッシュまたは処理できるようになる。
lpAdviseSink : [var] renderopt が OLERENDER_FORMAT の場合、有効な IAdviseSink ポインタ（データアドバイスのカスタムキャッシュまたは処理を示す）または NULL（データ形式のデフォルトキャッシュを示す）のいずれかを指定できる。
rgdwConnection : [var] IDataObject::DAdvise を使用して各アドバイザリ接続に対して IAdviseSink インターフェイスが登録されたときに返される dwConnection 値の配列を返す場所。返されたアドバイザリ接続が不要な場合は NULL。pAdviseSink が NULL の場合は NULL でなければならない。
pClientSite : [var] オブジェクトがコンテナからサービスを要求するための主要インターフェイスへのポインタ。このパラメータには NULL を指定できる。その場合、呼び出し側は可能な限り早く IOleObject::SetClientSite を使用してクライアントサイトを確立する責任を負う。
pStg : [var] オブジェクトおよびそれに対して確立されるデフォルトのデータまたは表示キャッシュに使用するストレージへのポインタ。
ppvObj : [var] riid で要求したインターフェイスポインタを受け取る出力ポインタ変数のアドレス。正常終了した場合、*ppvObj には新しく作成されたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
OleCreateLinkToFile の機能を拡張し、OleCreateLinkToFile
がサポートする単一形式ではなく、複数のプレゼンテーションやデータ形式のキャッシュを必要とするコンテナにおけるオブジェクトのインスタンス化をより効率的に行えるようにする。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
OleCreateLinkToFile への以下の呼び出し：
（以下省略）


%index
OleCreateMenuDescriptor
メニューメッセージとコマンドをディスパッチする際に OLE が使用するための OLE メニュー記述子（メニューを記述する OLE が提供するデータ構造）を作成して返す。
%prm
hmenuCombined, lpMenuWidths
hmenuCombined : [intptr] オブジェクトが作成した結合メニューへのハンドル。
lpMenuWidths : [var] 各グループ内のメニュー数を示す 6 個の LONG 値の配列へのポインタ。
%inst
メニューメッセージとコマンドをディスパッチする際に OLE が使用するための OLE メニュー記述子（メニューを記述する OLE
が提供するデータ構造）を作成して返す。

[戻り値]
記述子へのハンドルを返す。十分なメモリがない場合は NULL を返す。

[備考]
OleCreateMenuDescriptor 関数は、オブジェクトが複合メニューの記述子を作成するために呼び出すことができる。OLE
はこの記述子を使用してメニューメッセージとコマンドをディスパッチする。共有メニュー記述子が不要になった場合、コンテナは対応するヘルパー関数
OleDestroyMenuDescriptor を呼び出して解放する必要がある。


%index
OleCreateStaticFromData
データ転送オブジェクトから、ネイティブデータを持たず表現のみを含む静的オブジェクトを作成する。
%prm
pSrcDataObj, iid, renderopt, pFormatEtc, pClientSite, pStg, ppvObj
pSrcDataObj : [var] オブジェクトを作成するためのデータを保持するデータ転送オブジェクト上の IDataObject インターフェイスへのポインタ。
iid : [var] 呼び出し元が新しいオブジェクトと通信するためのインターフェイスの識別子への参照（通常は IID_IOleObject。OLE ヘッダーで IOleObject のインターフェイス識別子として定義されている）。
renderopt : [int] 新しく作成されるコンポーネントにおいて、コンテナがローカルにキャッシュしたい描画またはデータ取得機能を示す OLERENDER 列挙の値。この関数に OLERENDER_NONE または OLERENDER_ASIS を渡すのはエラーとなる。
pFormatEtc : [var] renderopt の値として使用される OLERENDER フラグに応じて、FORMATETC 列挙値の 1 つへのポインタになることがある。制約については OLERENDER 列挙を参照のこと。
pClientSite : [var] IOleClientSite のインスタンスへのポインタ。これはオブジェクトがコンテナからサービスを要求するための主要なインターフェイスである。このパラメータは NULL でもよい。
pStg : [var] オブジェクトのストレージのための IStorage インターフェイスへのポインタ。このパラメータは NULL にできない。
ppvObj : [var] riid で要求されたインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了時、*ppvObj には新しく作成されたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
データ転送オブジェクトから、ネイティブデータを持たず表現のみを含む静的オブジェクトを作成する。

[戻り値]
関数が成功した場合は S_OK を返す。

[備考]
OleCreateStaticFromData 関数は、IDataObject
インターフェイスを提供している限り、任意のオブジェクトを静的オブジェクトに変換できる。OLE のリンクや埋め込みにおける「Convert
To Picture」オプションの実装に有用である。
静的オブジェクトはソースが OLE
がレンダリングするクリップボード形式（CF_METAFILEPICT、CF_DIB、CF_BITMAP、CF_ENHMETAFILE）のいずれかをサポートしている場合にのみ作成できる。
OleCreateStaticFromData
を呼び出すことでクリップボードから静的オブジェクトを貼り付けることもできる。オブジェクトが静的かどうかを判定するには
OleQueryCreateFromData 関数を呼び出す。これは
CF_METAFILEPICT、CF_DIB、CF_BITMAP、CF_ENHMETAFILE のいずれかが存在し、OLE
形式が存在しない場合に OLE_S_STATIC を返す。これは、オブジェクトを作成するために OleCreateFromData
ではなく OleCreateStaticFromData を呼び出すべきであることを示す。
新しい静的オブジェクトのクラスは、CF_METAFILEPICT の場合は CLSID_StaticMetafile、CF_DIB または
CF_BITMAP の場合は CLSID_StaticDib、CF_ENHMETAFILE の場合は
CLSID_Picture_EnhMetafile となる。静的オブジェクトは IOleObject::GetMiscStatus が返す
OLEMISC_STATIC ビットと OLE_CANTLINKINSIDE ビットを設定する。静的オブジェクトはアスペクト
DVASPECT_CONTENT と LINDEX -1 を持つ。pSrcDataObject は
OleCreateStaticFromData が戻ったあとも有効である。pSrcDataObject
の解放は呼び出し元の責任であり、OLE はこれを解放しない。
静的オブジェクト内のプレゼンテーションストリームは 1 つだけしか持てない。


%index
OleDestroyMenuDescriptor
コンテナによって呼び出され、OleCreateMenuDescriptor 関数で割り当てられた共有メニュー記述子を解放する。
%prm
holemenu
holemenu : [int] OleCreateMenuDescriptor 関数によって返された共有メニュー記述子へのハンドル。
%inst
コンテナによって呼び出され、OleCreateMenuDescriptor 関数で割り当てられた共有メニュー記述子を解放する。

[戻り値]
この関数は値を返さない。


%index
OleDoAutoConvert
そのオブジェクトクラスの自動変換がレジストリに設定されている場合、オブジェクトを新しいクラスに自動的に変換する。
%prm
pStg, pClsidNew
pStg : [var] 変換対象のストレージオブジェクト上の IStorage インターフェイスへのポインタ。
pClsidNew : [var] 変換中のオブジェクトの新しい CLSID へのポインタ。自動変換が行われなかった場合、元のクラスと同じになることがある。
%inst
そのオブジェクトクラスの自動変換がレジストリに設定されている場合、オブジェクトを新しいクラスに自動的に変換する。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG、E_OUTOFMEMORY、E_UNEXPECTED
に加えて、以下の値を返すことがある。
（以下省略）

[備考]
OleDoAutoConvert は、OleSetAutoConvert
関数によりレジストリで自動変換が事前に指定されている場合、オブジェクトを自動的に変換する。オブジェクトの変換とは、オブジェクトが新しい
CLSID
と恒久的に関連付けられることを意味する。自動変換は通常、オブジェクトアプリケーションの新バージョンのセットアッププログラムによって指定され、古いバージョンで作成されたオブジェクトを自動的に更新できるようにする。OleDoAutoConvert
を呼び出すとき、ストレージオブジェクトはアンロード状態になっている必要がある。オブジェクト変換をサポートするコンテナアプリケーションは、オブジェクトをロードするたびに
OleDoAutoConvert を呼び出す必要がある。コンテナが OleLoad ヘルパー関数を使用する場合は、OleLoad
が内部で呼び出すため明示的に OleDoAutoConvert を呼び出す必要はない。OleDoAutoConvert はまず
OleGetAutoConvert 関数を呼び出して変換が必要かどうかを判定し、不要な場合は S_OK
を返す。オブジェクトに変換が必要な場合、OleDoAutoConvert
は新しいオブジェクトアプリケーションを起動してストレージオブジェクトを変更・変換する。新しいオブジェクトアプリケーションは既存のデータ形式を読み取り、新しいネイティブ形式でオブジェクトを保存する。自動変換対象のオブジェクトが
OLE 1 オブジェクトの場合、ItemName 文字列は "\1Ole10ItemName"
というストリームに格納される。このストリームが存在しない場合、オブジェクトの項目名は NULL となる。


%index
OleDraw
OleDraw 関数（ole2.h）はオブジェクトの描画を容易にする。IViewObject::Draw を直接呼び出す代わりに使用できる。
%prm
pUnknown, dwAspect, hdcDraw, lprcBounds
pUnknown : [var] 描画対象のビューオブジェクト上の IUnknown インターフェイスへのポインタ。
dwAspect : [int] オブジェクトをどのように表現するか。表現にはコンテンツ、アイコン、サムネイル、印刷ドキュメントなどがある。指定可能な値は DVASPECT 列挙から取得する。
hdcDraw : [intptr] 描画先のデバイスコンテキスト。メタファイルデバイスコンテキストは指定できない。
lprcBounds : [var] オブジェクトを描画する矩形を指定する RECT 構造体へのポインタ。このパラメータは RECTL 構造体に変換され、IViewObject::Draw に渡される。
%inst
OleDraw 関数（ole2.h）はオブジェクトの描画を容易にする。IViewObject::Draw
を直接呼び出す代わりに使用できる。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
OleDraw ヘルパー関数は、指定されたオブジェクト（pUnk）に対して QueryInterface メソッドを呼び出して
IViewObject インターフェイスを取得する。次に OleDraw は RECT 構造体を RECTL 構造体に変換し、以下のように
IViewObject::Draw を呼び出す：
（以下省略）


%index
OleDuplicateData
指定されたハンドル内のデータを複製し、複製されたデータへのハンドルを返す。ソースデータはクリップボード形式である。IDataObject などのデータ転送インターフェイスの実装を支援するために使用する。
%prm
hSrc, cfFormat, uiFlags
hSrc : [intptr] ソースデータのハンドル。
cfFormat : [int] ソースデータのクリップボード形式。
uiFlags : [int] コピーされたデータのためのグローバルメモリを割り当てるために使用するフラグ。これらのフラグは GlobalAlloc に渡される。uiFlags の値が NULL の場合、既定で GMEM_MOVEABLE が使用される。
%inst
指定されたハンドル内のデータを複製し、複製されたデータへのハンドルを返す。ソースデータはクリップボード形式である。IDataObject
などのデータ転送インターフェイスの実装を支援するために使用する。

[戻り値]
成功時はソースデータの HANDLE を返し、失敗時は NULL を返す。

[備考]
CF_METAFILEPICT、CF_PALETTE、CF_BITMAP の各形式は特別な扱いを受ける。これらは GDI
ハンドルであり、単にバイトをコピーするのではなく新しい GDI
オブジェクトを作成する必要がある。その他の形式はすべてバイト単位で複製される。


%index
OleFlushClipboard
クリップボードのシャットダウンシーケンスを実行する。また、OleSetClipboard 関数によってクリップボードに置かれた IDataObject ポインタを解放する。
%prm

%inst
クリップボードのシャットダウンシーケンスを実行する。また、OleSetClipboard 関数によってクリップボードに置かれた
IDataObject ポインタを解放する。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
OleFlushClipboard はデータオブジェクトのデータをクリップボードにレンダリングし、データオブジェクトへの
IDataObject
ポインタを解放する。データオブジェクトをクリップボードに置いたアプリケーションが実行中の間、クリップボードはデータオブジェクトへのポインタのみを保持してメモリを節約する。クリップボード操作のソースとして動作するアプリケーションを書いている場合、ユーザがアプリケーションを終了するときなどに
OleFlushClipboard 関数を呼び出すことができる。OleFlushClipboard
を呼び出すことで、アプリケーション終了後も OLE オブジェクトの貼り付けや貼り付けリンクが可能になる。OleFlushClipboard
を呼び出す前に、OleIsCurrentClipboard
関数を呼び出すことで自分のデータがまだクリップボード上にあるかを簡単に判定できる。OleFlushClipboard
はデータ転送オブジェクトが提供するすべての形式（OLE 1
互換形式を含む）をクリップボード上に残し、アプリケーション終了後も使用できるようにする。OLE 1
互換形式に加えて、これらにはグローバルハンドルメディア（TYMED_FILE を除くすべて）で提供されるすべての形式、および NULL
ターゲットデバイスで形式化されたものが含まれる。たとえば、データソースアプリケーションが特定のクリップボード形式（cfFOO）を
IStorage オブジェクト上で提供し、OleFlushClipboard
関数を呼び出すと、ストレージオブジェクトはメモリにコピーされ、hglobal
メモリハンドルがクリップボードに置かれる。クリップボード上の情報を取得するには、別のアプリケーションから OleGetClipboard
関数を呼び出すと、既定のデータオブジェクトが作成され、クリップボードからの hglobal
は再びストレージオブジェクトとなる。さらに、FORMATETC 列挙子と IDataObject::QueryGetData
メソッドは元のクリップボード形式（cfFOO）が再び TYMED_ISTORAGE
で利用可能であることを正しく示す。クリップボードを空にするには、パラメータに NULL を指定して OleSetClipboard
関数を呼び出す。終了後にクリップボードにデータを残す必要がない場合、または標準の Windows
クリップボード関数を使用してクリップボードにデータが置かれる場合、アプリケーションは終了時にこれを呼び出すべきである。


%index
OleGetAutoConvert
指定された CLSID のオブジェクトが別の CLSID に自動変換されるようにレジストリが設定されているかを判定し、設定されている場合は新しい CLSID を取得する。
%prm
clsidOld, pClsidNew
clsidOld : [var] オブジェクトの CLSID。
pClsidNew : [var] 新しい CLSID を受け取る変数へのポインタ。clsidOld に対する自動変換がレジストリに設定されていない場合、clsidOld が返される。pClsidNew パラメータが NULL になることはない。
%inst
指定された CLSID のオブジェクトが別の CLSID
に自動変換されるようにレジストリが設定されているかを判定し、設定されている場合は新しい CLSID を取得する。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG、E_OUTOFMEMORY、E_UNEXPECTED
に加えて、以下の値を返すことがある。
（以下省略）

[備考]
OleGetAutoConvert は、指定されたオブジェクトに対するレジストリ内の AutoConvertTo
エントリを返す。AutoConvertTo サブキーは、指定された CLSID のオブジェクトを新しい CLSID
に自動変換するかどうかを指定する。これは通常、古いバージョンのアプリケーションで作成されたファイルを現在のバージョンに変換するために使用される。AutoConvertTo
エントリがない場合、この関数は clsidOld の値を返す。OleDoAutoConvert 関数は OleGetAutoConvert
を呼び出して指定されたオブジェクトを変換すべきかどうかを判定する。オブジェクト変換をサポートするコンテナアプリケーションは、オブジェクトをロードするたびに
OleDoAutoConvert を呼び出すべきである。コンテナが OleLoad ヘルパー関数を使用する場合は、OleLoad
が内部で呼び出すため明示的に OleDoAutoConvert
を呼び出す必要はない。指定したクラスの自動変換を設定するには、OleSetAutoConvert
関数を呼び出すことができる（通常はアプリケーションインストールのセットアッププログラム内で）。この関数は AutoConvertTo
サブキーを使用してオブジェクトクラスを別のオブジェクトクラスへの自動変換のためにタグ付けする。これは CLSID キーのサブキーである。


%index
OleGetClipboard
クリップボードの内容にアクセスするために使用できるデータオブジェクトを取得する。
%prm
ppDataObj
ppDataObj : [var] クリップボードデータオブジェクトへのインターフェイスポインタを受け取る IDataObject ポインタ変数のアドレス。
%inst
クリップボードの内容にアクセスするために使用できるデータオブジェクトを取得する。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]

注意：クリップボードのデータは信頼されない。アプリケーションで使用する前にデータを慎重に解析すること。クリップボードからデータを受け取れるアプリケーションを書いている場合、OleGetClipboard
関数を呼び出して IDataObject
インターフェイスへのポインタを取得し、クリップボードの内容を取得することができる。OleGetClipboard は次の 3
つのケースを処理する：
（以下省略）


%index
OleGetClipboardWithEnterpriseInfo
Windows Information Protection に対応したアプリケーションが、データとソースアプリケーションに関する Windows Information Protection 情報を伴って OLE クリップボードから IDataObject を取得できるようにする。
%prm
dataObject, dataEnterpriseId, sourceDescription, targetDescription, dataDescription
dataObject : [var] クリップボードデータオブジェクトへのインターフェイスポインタを受け取る IDataObject ポインタ変数のアドレス。
dataEnterpriseId : [var] クリップボードデータを設定したアプリケーションのエンタープライズ ID。データが個人用である場合、空文字列となる。
sourceDescription : [var] クリップボードを設定したアプリケーションの説明。
targetDescription : [var] 監査に使用される呼び出し元アプリケーションの説明。
dataDescription : [var] 監査に使用されるデータオブジェクトの説明。
%inst
Windows Information Protection に対応したアプリケーションが、データとソースアプリケーションに関する
Windows Information Protection 情報を伴って OLE クリップボードから IDataObject
を取得できるようにする。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]

注意：クリップボードのデータは信頼されない。アプリケーションで使用する前にデータを慎重に解析すること。クリップボードからデータを受け取れるアプリケーションを書いている場合、OleGetClipboardWithEnterpriseInfo
関数を呼び出して IDataObject
インターフェイスへのポインタを取得し、クリップボードの内容を取得することができる。OleGetClipboardWithEnterpriseInfo
は次の 3 つのケースを処理する：
（以下省略）


%index
OleGetIconOfClass
指定された CLSID のアイコンと文字列ラベルを含むメタファイルへのハンドルを返す。
%prm
rclsid, lpszLabel, fUseTypeAsLabel
rclsid : [var] アイコンと文字列が要求される CLSID。
lpszLabel : [wstr] アイコンのラベルへのポインタ。
fUseTypeAsLabel : [int] アイコンラベルとして CLSID 内のユーザタイプ文字列を使用するかどうかを示す。
%inst
指定された CLSID のアイコンと文字列ラベルを含むメタファイルへのハンドルを返す。

[戻り値]
関数が成功した場合、戻り値は指定された CLSID のアイコンとラベルを含むメタファイルへのハンドルである。失敗した場合は NULL
を返す。


%index
OleGetIconOfFile
指定されたファイル名のアイコンと文字列ラベルを含むメタファイルへのハンドルを返す。
%prm
lpszPath, fUseFileAsLabel
lpszPath : [wstr] アイコンと文字列が要求されるファイルへのポインタ。
fUseFileAsLabel : [int] アイコンラベルとしてファイル名を使用するかどうかを示す。
%inst
指定されたファイル名のアイコンと文字列ラベルを含むメタファイルへのハンドルを返す。

[戻り値]
関数が成功した場合、戻り値は指定されたファイルのアイコンとラベルを含むメタファイルへのハンドルである。レジストリ内にそのファイルの
CLSID がない場合、関数は文字列 "Document" を返す。lpszPath が NULL の場合、関数は NULL を返す。


%index
OleInitialize
現在のアパートメントで COM ライブラリを初期化し、並行性モデルをシングルスレッドアパートメント（STA）として識別し、後述の Remarks に記載される追加機能を有効にする。
%prm
pvReserved
pvReserved : [intptr] このパラメータは予約されており、NULL でなければならない。
%inst
現在のアパートメントで COM ライブラリを初期化し、並行性モデルをシングルスレッドアパートメント（STA）として識別し、後述の
Remarks に記載される追加機能を有効にする。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
次の機能を使用するアプリケーションは、COM ライブラリ内の他の関数を呼び出す前に OleInitialize
を呼び出さなければならない：
（以下省略）


%index
OleIsCurrentClipboard
OleSetClipboard 関数によって以前にクリップボードに置かれたデータオブジェクトポインタが、まだクリップボード上にあるかどうかを判定する。
%prm
pDataObj
pDataObj : [var] 呼び出し元が以前にクリップボードに置いたクリップボードデータを含むデータオブジェクト上の IDataObject インターフェイスへのポインタ。
%inst
OleSetClipboard
関数によって以前にクリップボードに置かれたデータオブジェクトポインタが、まだクリップボード上にあるかどうかを判定する。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
OleIsCurrentClipboard は OleSetClipboard
関数で使用されたデータオブジェクトに対してのみ機能する。データオブジェクトの利用者が、前回の OleGetClipboard
呼び出し時にクリップボード上にあったオブジェクトがまだクリップボード上にあるかを判定するために呼び出すことはできない。


%index
OleIsRunning
複合ドキュメントオブジェクトが現在実行状態にあるかどうかを判定する。
%prm
pObject
pObject : [var] 対象オブジェクト上の IOleObject インターフェイスへのポインタ。
%inst
複合ドキュメントオブジェクトが現在実行状態にあるかどうかを判定する。

[戻り値]
オブジェクトが実行中の場合は TRUE、そうでない場合は FALSE を返す。

[備考]
OleIsRunning と IRunnableObject::IsRunning は相互に置き換え可能である。OleIsRunning
はオブジェクトに対して IRunnableObject インターフェイスへのポインタをクエリし、その
IRunnableObject::IsRunning メソッドを呼び出す。成功した場合、関数は
IRunnableObject::IsRunning 呼び出しの結果を返す。


%index
OleLoad
指定されたストレージオブジェクト内にネストされたオブジェクトをメモリにロードする。
%prm
pStg, riid, pClientSite, ppvObj
pStg : [var] 指定されたオブジェクトをロードするストレージオブジェクト上の IStorage インターフェイスへのポインタ。
riid : [var] オブジェクトをロードした後に呼び出し元がオブジェクトと通信するために使用するインターフェイスの識別子への参照。
pClientSite : [var] ロードされるクライアントサイトオブジェクト上の IOleClientSite インターフェイスへのポインタ。
ppvObj : [var] riid で要求されたインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了時、*ppvObj には新しくロードされたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
指定されたストレージオブジェクト内にネストされたオブジェクトをメモリにロードする。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
OLE コンテナはこの関数を呼び出してオブジェクトをメモリにロードする。OleLoad
関数を呼び出すとき、コンテナアプリケーションはネストされたオブジェクトが格納されている開いているストレージオブジェクトへのポインタを渡す。通常、ロードするネストされたオブジェクトはコンテナのルートストレージオブジェクトの子ストレージオブジェクトである。オブジェクトとともに格納された
OLE 情報を使用して、オブジェクトハンドラ（通常は既定のハンドラ）がオブジェクトをロードしようとする。OleLoad
関数の完了後、オブジェクトはオブジェクトアプリケーションが実行されていない「ロード済み」状態にあると言われる。一部のアプリケーションはオブジェクトのネイティブデータをすべてロードする。コンテナはしばしば必要になるまでオブジェクトのロードを遅延させる。たとえば、オブジェクトがビューにスクロールされて描画する必要があるまでロードする必要はない。OleLoad
関数は次のステップを実行する：
（以下省略）


%index
OleLoadFromStream
OleLoadFromStream 関数（ole2.h）はストリームからオブジェクトをロードする。
%prm
pStm, iidInterface, ppvObj
pStm : [var] オブジェクトをロードする元のストリーム上の IStream インターフェイスへのポインタ。
iidInterface : [var] オブジェクトをロードした後に呼び出し元がオブジェクトと通信するために使用するインターフェイス識別子（IID）。
ppvObj : [var] riid で要求されたインターフェイスポインタを受け取るポインタ変数のアドレス。正常終了時、*ppvObj には新しくロードされたオブジェクト上の要求されたインターフェイスポインタが格納される。
%inst
OleLoadFromStream 関数（ole2.h）はストリームからオブジェクトをロードする。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
重要
セキュリティ上の注意：このメソッドを信頼されないデータで呼び出すことはセキュリティリスクである。信頼されたデータでのみ呼び出すこと。この関数は
IPersistStream インターフェイスをサポートするオブジェクトをロードするために使用できる。オブジェクトの CLSID
はストリーム内のオブジェクトデータの直前になければならない。これは対応する関数
OleSaveToStream（またはそのトピックで説明される、ラップする操作）によって達成される。
ストリームの CLSID が CLSID_NULL の場合、ppvObj パラメータは NULL に設定される。


%index
OleLockRunning
既に実行中のオブジェクトを実行状態にロックするか、実行状態からアンロックする。（OleLockRunning）
%prm
pUnknown, fLock, fLastUnlockCloses
pUnknown : [var] オブジェクト上の IUnknown インターフェイスへのポインタ。関数はこれを使用して IRunnableObject へのポインタをクエリする。
fLock : [int] TRUE はオブジェクトを実行状態にロックする。FALSE はオブジェクトを実行状態からアンロックする。
fLastUnlockCloses : [int] TRUE は、解放される接続がオブジェクトに対する最後の外部ロックである場合、オブジェクトを閉じることを指定する。FALSE は、ユーザまたは別のプロセスが閉じるまでオブジェクトを開いたままにすることを指定する。
%inst
既に実行中のオブジェクトを実行状態にロックするか、実行状態からアンロックする。（OleLockRunning）

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
OleLockRunning 関数を使用すれば、IRunnableObject::LockRunning
メソッドを呼び出す手間を省くことができる。OleLockRunning と IRunnableObject::LockRunning
は相互に置き換え可能である。pUnknown パラメータで渡された IUnknown ポインタを使って、OleLockRunning は
IRunnableObject ポインタをクエリする。成功した場合、IRunnableObject::LockRunning
を呼び出してその結果を返す。
この関数の使用方法の詳細については IRunnableObject::LockRunning を参照のこと。


%index
OleMetafilePictFromIconAndLabel
指定されたアイコンとラベルが描画されたメタファイルを作成する。
%prm
hIcon, lpszLabel, lpszSourceFile, iIconIndex
hIcon : [intptr] メタファイルに描画されるアイコンへのハンドル。このパラメータは NULL でもよい。hIcon が NULL の場合、この関数はメタファイルを作成せずに NULL を返す。
lpszLabel : [wstr] アイコンラベル。このパラメータは NULL でもよい。lpszLabel が NULL の場合、結果のメタファイルにはラベルが含まれない。
lpszSourceFile : [wstr] アイコンファイルのパスとファイル名。この文字列はユーザインターフェイスから、またはレジストリから取得できる。このパラメータは NULL でもよい。
iIconIndex : [int] lpszSourceFile で指定されたファイル内のアイコンの位置。ファイル先頭からのバイトオフセットで表される。
%inst
指定されたアイコンとラベルが描画されたメタファイルを作成する。

[戻り値]
アイコンとラベルを含む METAFILEPICT 構造体へのグローバルハンドル。メタファイルは MM_ANISOTROPIC
マッピングモードを使用する。エラーが発生した場合、返されるハンドルは NULL である。この場合、呼び出し元は GetLastError
を呼び出して詳細情報を取得できる。

[備考]
この関数は OleGetIconOfFile および OleGetIconOfClass から呼び出される。lpszSourceFile
が NULL でなく iIconIndex が 0 でない場合、lpszSourceFile で渡されたソースファイル名と
iIconIndex で渡されたインデックスがコメントレコードとして作成されるメタファイルに追加される。


%index
OleNoteObjectVisible
オブジェクトを実行状態に保つ外部参照をインクリメントまたはデクリメントする。
%prm
pUnknown, fVisible
pUnknown : [var] ロックまたはアンロックするオブジェクト上の IUnknown インターフェイスへのポインタ。
fVisible : [int] オブジェクトが可視かどうか。TRUE の場合、外部または内部の IUnknown::AddRef や IUnknown::Release 操作、登録、取り消しに関係なく、オブジェクトを可視で生かしておくため、OLE は参照カウントをインクリメントする。FALSE の場合、OLE はその保持を解放（参照カウントをデクリメント）し、オブジェクトを閉じることができる。
%inst
オブジェクトを実行状態に保つ外部参照をインクリメントまたはデクリメントする。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
OleNoteObjectVisible 関数は CoLockObjectExternal
関数を呼び出す。これは、オブジェクトがユーザに見えるようになったときにロックする必要性と、見えなくなったときに解放する必要性を強調するために独立した関数として提供されている。これにより、可視である間にコンテナによってオブジェクトが閉じられないようにユーザに代わって強いロックを作成する。


%index
OleQueryCreateFromData
データオブジェクトに、OleCreateFromData または OleCreateStaticFromData 関数の呼び出しによって埋め込みオブジェクトになることを可能にする形式のいずれかが含まれているかをチェックする。
%prm
pSrcDataObject
pSrcDataObject : [var] クエリされるデータ転送オブジェクト上の IDataObject インターフェイスへのポインタ。
%inst
データオブジェクトに、OleCreateFromData または OleCreateStaticFromData
関数の呼び出しによって埋め込みオブジェクトになることを可能にする形式のいずれかが含まれているかをチェックする。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
アプリケーションが OleGetClipboard 関数を呼び出してデータ転送オブジェクトを取得する場合、Edit/Paste または
Edit/Paste Special... コマンドを有効にするか無効にするかを決定する過程の一部として
OleQueryCreateFromData を呼び出すべきである。これはデータオブジェクト内に以下の形式が存在するかをテストする：
（以下省略）


%index
OleQueryLinkFromData
クリップボードデータオブジェクトから OLE 埋め込みオブジェクトではなく OLE リンクオブジェクトを作成できるかどうかを判定する。
%prm
pSrcDataObject
pSrcDataObject : [var] オブジェクトを作成する元となるクリップボードデータオブジェクト上の IDataObject インターフェイスへのポインタ。
%inst
クリップボードデータオブジェクトから OLE 埋め込みオブジェクトではなく OLE リンクオブジェクトを作成できるかどうかを判定する。

[戻り値]
OleCreateLinkFromData 関数を使ってリンクオブジェクトを作成できる場合は S_OK を返し、そうでない場合は
S_FALSE を返す。

[備考]
OleQueryLinkFromData 関数は OleQueryCreateFromData
関数に似ているが、クリップボードデータオブジェクトから OLE 埋め込みオブジェクトではなく OLE
リンクオブジェクトを作成できるかどうかを判定する。戻り値が S_OK の場合、アプリケーションは
OleCreateLinkFromData
を呼び出してオブジェクトを作成しようとすることができる。ただし、OleQueryLinkFromData
が成功して戻ったからといって、リンクの作成が成功するとは限らない。


%index
OleRegEnumFormatEtc
OLE オブジェクトサーバがシステムレジストリに登録したデータ形式を列挙するために使用できる列挙オブジェクトを作成する。
%prm
clsid, dwDirection, ppenum
clsid : [var] 形式が要求されるクラスの CLSID。
dwDirection : [int] IDataObject::GetData に渡せる形式を列挙するか、IDataObject::SetData に渡せる形式を列挙するかを示す。指定可能な値は DATADIR 列挙から取得する。
ppenum : [var] 列挙オブジェクトへのインターフェイスポインタを受け取る IEnumFORMATETC ポインタ変数のアドレス。
%inst
OLE オブジェクトサーバがシステムレジストリに登録したデータ形式を列挙するために使用できる列挙オブジェクトを作成する。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
オブジェクトアプリケーションは、サポートされるデータ形式を列挙する FORMATETC 構造体の列挙オブジェクトを OLE
に作成させるために、2 つの方法のいずれかを使用できる。1 つは OleRegEnumFormatEtc を呼び出す方法である。もう 1
つは、既定のオブジェクトハンドラから IDataObject::EnumFormatEtc が呼び出されたときに OLE_S_USEREG
を返す方法である。OLE_S_USEREG は既定のハンドラに OleRegEnumFormatEtc を呼び出すよう指示する。DLL
オブジェクトアプリケーションは OLE_S_USEREG を返せないため、オブジェクトハンドラに作業を委譲するのではなく
OleRegEnumFormatEtc を呼び出さなければならない。提供されたオブジェクトへの IEnumFORMATETC
ポインタを使用して、標準の列挙オブジェクトメソッドを呼び出して列挙を行うことができる。
OleRegEnumFormatEtc 関数とその兄弟関数である
OleRegGetUserType、OleRegGetMiscStatus、OleRegEnumVerbs は、カスタム DLL
オブジェクトアプリケーションの開発者が、レジストリからオブジェクトに関する情報を取得する際の OLE
の既定のオブジェクトハンドラの動作をエミュレートする方法を提供する。これらの関数を使用することで、独自に書く相当な労力と、レジストリで直接作業することの落とし穴を避けることができる。さらに、これらの関数の今後の拡張や最適化を、自分でコーディングすることなく得られる。


%index
OleRegEnumVerbs
指定されたクラスに登録された動詞の列挙を提供する。カスタム DLL オブジェクトアプリケーションの開発者は、この関数を使用して既定のオブジェクトハンドラの動作をエミュレートする。
%prm
clsid, ppenum
clsid : [var] 動詞が要求されるクラス識別子。
ppenum : [var] 新しい列挙オブジェクトへのインターフェイスポインタを受け取る IEnumOLEVERB* ポインタ変数のアドレス。
%inst
指定されたクラスに登録された動詞の列挙を提供する。カスタム DLL
オブジェクトアプリケーションの開発者は、この関数を使用して既定のオブジェクトハンドラの動作をエミュレートする。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
オブジェクトアプリケーションは、サポートされる動詞を列挙する OLEVERB 構造体の列挙オブジェクトを OLE に作成させるために、2
つの方法のいずれかを使用できる。1 つは OleRegEnumVerbs を呼び出す方法である。もう 1
つは、既定のオブジェクトハンドラから IOleObject::EnumVerbs が呼び出されたときに OLE_S_USEREG
を返す方法である。OLE_S_USEREG は既定のハンドラに OleRegEnumVerbs を呼び出すよう指示する。DLL
オブジェクトアプリケーションは OLE_S_USEREG を返せないため、オブジェクトハンドラに作業を委譲するのではなく
OleRegEnumVerbs を呼び出さなければならない。提供されたオブジェクトへの IEnumOLEVERB
ポインタを使用して、標準の列挙オブジェクトメソッドを呼び出して列挙を行うことができる。OleRegEnumVerbs
関数とその兄弟関数である
OleRegGetUserType、OleRegGetMiscStatus、OleRegEnumFormatEtc は、カスタム DLL
オブジェクトアプリケーションの開発者が、レジストリからオブジェクトに関する情報を取得する際の OLE
の既定のオブジェクトハンドラの動作をエミュレートする方法を提供する。これらの関数を使用することで、独自に書く相当な労力と、レジストリで直接作業することの落とし穴を避けることができる。さらに、これらの関数の今後の拡張や最適化を、自分でコーディングすることなく得られる。


%index
OleRegGetMiscStatus
指定された CLSID がサポートする表現と動作に関する雑多な情報をレジストリから返す。
%prm
clsid, dwAspect, pdwStatus
clsid : [var] 状態情報が要求されるクラスの CLSID。
dwAspect : [int] 情報が要求されるクラスの表示アスペクト。指定可能な値は DVASPECT 列挙から取得する。
pdwStatus : [var] 状態情報を受け取る変数へのポインタ。
%inst
指定された CLSID がサポートする表現と動作に関する雑多な情報をレジストリから返す。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY に加えて、以下の値を返すことがある。
（以下省略）

[備考]
オブジェクトアプリケーションは、雑多な状態情報を取得するために OLE に依頼する 2 つの方法のいずれかを使用できる。1 つは
OleRegGetMiscStatus を呼び出す方法である。もう 1 つは、既定のオブジェクトハンドラから
IOleObject::GetMiscStatus が呼び出されたときに OLE_S_USEREG
を返す方法である。OLE_S_USEREG は既定のハンドラに OleRegGetMiscStatus を呼び出すよう指示する。DLL
オブジェクトアプリケーションは OLE_S_USEREG を返せないため、オブジェクトハンドラに作業を委譲するのではなく
OleRegGetMiscStatus を呼び出さなければならない。
OleRegGetMiscStatus とその兄弟関数である
OleRegGetUserType、OleRegEnumFormatEtc、OleRegEnumVerbs は、カスタム DLL
オブジェクトアプリケーションの開発者が、レジストリからオブジェクトに関する情報を取得する際の OLE
の既定のオブジェクトハンドラの動作をエミュレートする方法を提供する。これらの関数を使用することで、独自に書く相当な労力と、レジストリで直接作業することの落とし穴を避けることができる。さらに、これらの関数の今後の拡張や最適化を、自分でコーディングすることなく得られる。


%index
OleRegGetUserType
指定されたクラスのユーザタイプをレジストリから取得する。
%prm
clsid, dwFormOfType, pszUserType
clsid : [var] ユーザタイプが要求されるクラスの CLSID。
dwFormOfType : [int] ユーザに提示する文字列の形式。指定可能な値は USERCLASSTYPE 列挙から取得する。
pszUserType : [var] ユーザタイプを受け取る文字列へのポインタ。
%inst
指定されたクラスのユーザタイプをレジストリから取得する。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY に加えて、以下の値を返すことがある。
（以下省略）

[備考]
オブジェクトアプリケーションは、指定されたクラスのユーザタイプ名を取得するために OLE に依頼する 2
つの方法のいずれかを使用できる。1 つは OleRegGetUserType を呼び出す方法である。もう 1
つは、既定のオブジェクトハンドラから IOleObject::GetUserType が呼び出されたときに OLE_S_USEREG
を返す方法である。OLE_S_USEREG は既定のハンドラに OleRegGetUserType を呼び出すよう指示する。DLL
オブジェクトアプリケーションは OLE_S_USEREG を返せないため、オブジェクトハンドラに作業を委譲するのではなく
OleRegGetUserType を呼び出さなければならない。
OleRegGetUserType 関数とその兄弟関数である
OleRegGetMiscStatus、OleRegEnumFormatEtc、OleRegEnumVerbs は、カスタム DLL
オブジェクトアプリケーションの開発者が、レジストリからオブジェクトに関する情報を取得する際の OLE
の既定のオブジェクトハンドラの動作をエミュレートする方法を提供する。これらの関数を使用することで、独自に書く相当な労力と、レジストリで直接作業することの落とし穴を避けることができる。さらに、これらの関数の今後の拡張や最適化を、自分でコーディングすることなく得られる。


%index
OleRun
OLE 複合ドキュメントオブジェクトを実行状態にする。
%prm
pUnknown
pUnknown : [var] オブジェクト上の IUnknown インターフェイスへのポインタ。これを使用して IRunnableObject インターフェイスへのポインタをクエリし、その Run メソッドを呼び出す。
%inst
OLE 複合ドキュメントオブジェクトを実行状態にする。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
OleRun 関数はオブジェクトを実行状態にする。OleRun の実装は IRunnableObject インターフェイスの公開と同時に
OLE 2.01 で変更された。OleRun と IRunnableObject::Run は相互に置き換え可能である。OleRun
はオブジェクトに対して IRunnableObject へのポインタをクエリする。成功した場合、関数は
IRunnableObject::Run メソッドを呼び出した結果を返す。この関数の使用方法の詳細については
IRunnableObject::Run を参照のこと。


%index
OleSave
トランザクションモードで開かれたオブジェクトを指定されたストレージオブジェクトに保存する。
%prm
pPS, pStg, fSameAsLoad
pPS : [var] 保存するオブジェクト上の IPersistStorage インターフェイスへのポインタ。
pStg : [var] pPS で示されるオブジェクトが保存される宛先ストレージオブジェクト上の IStorage インターフェイスへのポインタ。
fSameAsLoad : [int] TRUE は pStg がオブジェクトをロードまたは作成した元のストレージオブジェクトと同じであることを示す。FALSE は pStg が別のストレージオブジェクトからロードまたは作成されたことを示す。
%inst
トランザクションモードで開かれたオブジェクトを指定されたストレージオブジェクトに保存する。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
OleSave ヘルパー関数は、オブジェクトがトランザクションモードで開かれており、OLE
が提供する複合ファイル実装を使う指定されたストレージオブジェクトに保存される一般的な状況を処理する。トランザクションモードとは、IStorage::Commit
または IStorage::Revert が呼び出されるまでオブジェクトへの変更がバッファリングされることを意味する。呼び出し元は
IPersistStorage と IStorage インターフェイスを直接呼び出すことで他の状況を処理できる。
OleSave は次の処理を行う：
（以下省略）


%index
OleSaveToStream
OleSaveToStream 関数（ole2.h）は、IPersistStream インターフェイスを持つオブジェクトを指定されたストリームに保存する。
%prm
pPStm, pStm
pPStm : [var] ストリームに保存するオブジェクト上の IPersistStream インターフェイスへのポインタ。pPStm パラメータは NULL にできない。
pStm : [var] オブジェクトを保存するストリーム上の IStream インターフェイスへのポインタ。
%inst
OleSaveToStream 関数（ole2.h）は、IPersistStream
インターフェイスを持つオブジェクトを指定されたストリームに保存する。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
この関数は、IPersistStream
インターフェイスを実装するオブジェクトをストリームに保存することを簡単にする。このストリームでは、オブジェクトの CLSID
がそのデータの前に置かれる。ストリームが取得されたとき、CLSID
により適切なコードをデータと関連付けることができる。OleSaveToStream 関数は次の処理を行う：
（以下省略）


%index
OleSetAutoConvert
あるクラスのオブジェクトがロードされたときに別のクラスへ自動変換するための CLSID を指定する。
%prm
clsidOld, clsidNew
clsidOld : [var] 変換されるオブジェクトクラスの CLSID。
clsidNew : [var] clsidOld を置き換えるオブジェクトクラスの CLSID。この新しい CLSID は、clsidOld に対する既存の自動変換情報をレジストリ内で置き換える。この値が CLSID_NULL の場合、clsidOld に対する既存の自動変換情報はレジストリから削除される。
%inst
あるクラスのオブジェクトがロードされたときに別のクラスへ自動変換するための CLSID を指定する。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG、E_OUTOFMEMORY、E_UNEXPECTED
に加えて、以下の値を返すことがある。
（以下省略）

[備考]
OleSetAutoConvert はシステムレジストリに行き、clsidOld で指定された CLSID の下にある
AutoConvertTo サブキーを見つけ、それを clsidNew に設定する。この関数は clsidNew
に適切なレジストリエントリが現在存在するかどうかを検証しない。これらのエントリはレジストリ内では CLSID
キーのサブキーとして表示される。オブジェクト変換とは、オブジェクトのデータが新しい CLSID
と恒久的に関連付けられることを意味する。自動変換は通常、オブジェクトアプリケーションの新バージョンのセットアッププログラムで指定され、古いバージョンで作成されたオブジェクトを新バージョンに自動的に更新できるようにする。

たとえば、以前のバージョンのスプレッドシートアプリケーションで作成されたスプレッドシートを新バージョンに変換する必要があるかもしれない。以前のバージョンのスプレッドシートオブジェクトは新バージョンとは異なる
CLSID を持つ。自動的に更新したい以前のバージョンごとに、セットアッププログラムで OleSetAutoConvert
を呼び出し、古いバージョンと新バージョンの CLSID
を指定する。すると、ユーザが以前のバージョンからオブジェクトをロードするたびに自動的に更新される。オブジェクトの自動変換をサポートするには、変換をサポートするサーバが、サーバの以前のバージョンの形式を持つオブジェクトを手動で変換する準備ができていなければならない。自動変換は内部的にこの手動変換サポートに依存している。目的の
AutoConvertTo 値を設定する前に、セットアッププログラムは新クラスを clsidOld
パラメータとして指定し、clsidNew パラメータを CLSID_NULL に設定して OleSetAutoConvert
を呼び出し、新クラスに対する既存の変換を削除すべきである。


%index
OleSetClipboard
特定のデータオブジェクトへのポインタをクリップボードに置く。これにより、データオブジェクトが OleGetClipboard 関数からアクセス可能になる。
%prm
pDataObj
pDataObj : [var] クリップボードに置くデータを取得できるデータオブジェクト上の IDataObject インターフェイスへのポインタ。このパラメータは NULL でもよく、その場合はクリップボードが空にされる。
%inst
特定のデータオブジェクトへのポインタをクリップボードに置く。これにより、データオブジェクトが OleGetClipboard
関数からアクセス可能になる。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
クリップボード操作のソースとして動作するアプリケーションを書いている場合、次のことを行う必要がある：
（以下省略）


%index
OleSetContainedObject
オブジェクトが OLE コンテナに埋め込まれていることを通知し、埋め込みオブジェクトへのリンクをサポートするコンテナで参照カウントが正しく行われるようにする。（OleSetContainedObject）
%prm
pUnknown, fContained
pUnknown : [var] オブジェクトの IUnknown インターフェイスへのポインタ。
fContained : [int] オブジェクトが埋め込みオブジェクトの場合は TRUE、そうでない場合は FALSE。
%inst
オブジェクトが OLE
コンテナに埋め込まれていることを通知し、埋め込みオブジェクトへのリンクをサポートするコンテナで参照カウントが正しく行われるようにする。（OleSetContainedObject）

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
OleSetContainedObject 関数は、オブジェクトが OLE
コンテナに埋め込まれていることを通知する。OleSetContainedObject の実装は IRunnableObject
インターフェイスの公開と同時に OLE 2.01 で変更された。OleSetContainedObject と
IRunnableObject::SetContainedObject
メソッドは相互に置き換え可能である。OleSetContainedObject 関数はオブジェクトに対して IRunnableObject
インターフェイスへのポインタをクエリする。成功した場合、関数は IRunnableObject::SetContainedObject
を呼び出した結果を返す。


%index
OleSetMenuDescriptor
コンテナのフレームウィンドウから OLE ディスパッチコードをインストールまたは削除する。
%prm
holemenu, hwndFrame, hwndActiveObject, lpFrame, lpActiveObj
holemenu : [int] OleCreateMenuDescriptor 関数によって返された複合メニュー記述子へのハンドル。NULL の場合、ディスパッチコードが取り外される。
hwndFrame : [intptr] インプレース複合メニューがインストールされるコンテナのフレームウィンドウへのハンドル。
hwndActiveObject : [intptr] オブジェクトのインプレースアクティブ化ウィンドウへのハンドル。OLE はメニューメッセージとコマンドをこのウィンドウにディスパッチする。
lpFrame : [var] コンテナのフレームウィンドウ上の IOleInPlaceFrame インターフェイスへのポインタ。
lpActiveObj : [var] アクティブなインプレースオブジェクト上の IOleInPlaceActiveObject インターフェイスへのポインタ。
%inst
コンテナのフレームウィンドウから OLE ディスパッチコードをインストールまたは削除する。

[戻り値]
関数が成功した場合は S_OK を返す。

[備考]
オブジェクトが IOleInPlaceFrame::SetMenu メソッドを呼び出したとき、コンテナは hwndFrame
にディスパッチコードをインストールするために OleSetMenuDescriptor を呼び出すべきである。あるいは、holemenu
の値として NULL を渡してディスパッチコードを取り外すために呼び出すべきである。lpFrame と lpActiveObj
の両方のパラメータが NULL でない場合、OLE はアプリケーションのコンテキスト依存ヘルプ F1
メッセージフィルタをインストールする。それ以外の場合、アプリケーションは独自のメッセージフィルタを提供しなければならない。


%index
OleTranslateAccelerator
オブジェクトアプリケーションによって呼び出され、オブジェクトのコンテナがコンテナのアクセラレータテーブルに従ってアクセラレータを変換できるようにする。
%prm
lpFrame, lpFrameInfo, lpmsg
lpFrame : [var] キーストロークを送信できる IOleInPlaceFrame インターフェイスへのポインタ。
lpFrameInfo : [var] コンテナから取得したアクセラレータテーブルを含む OLEINPLACEFRAMEINFO 構造体へのポインタ。
lpmsg : [var] キーストロークを含む MSG 構造体へのポインタ。
%inst

オブジェクトアプリケーションによって呼び出され、オブジェクトのコンテナがコンテナのアクセラレータテーブルに従ってアクセラレータを変換できるようにする。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
オブジェクトサーバは OleTranslateAccelerator
を呼び出すことで、オブジェクトのコンテナがコンテナのアクセラレータテーブル（lpFrameInfo
によって指される）に従ってアクセラレータキーストロークを変換できるようにする。コンテナされたオブジェクトがアクティブオブジェクトである間、オブジェクトのサーバは常に受信したメッセージを最初に変換する機会を持つ。これが望ましくない場合、サーバは
OleTranslateAccelerator
を呼び出してオブジェクトのコンテナに機会を与える。キーボード入力がコンテナが提供するアクセラレータテーブル内のアクセラレータと一致する場合、OleTranslateAccelerator
は IOleInPlaceFrame::TranslateAccelerator
メソッドを介してメッセージとそのコマンド識別子をコンテナに渡す。このメソッドはキーストロークが消費された場合は S_OK
を返し、そうでない場合は S_FALSE を返す。

コンテナのアクセラレータテーブルは、独自のアクセラレータキーストローク変換を行うオブジェクトアプリケーションと適切に動作するように定義する必要がある。これらのテーブルは次の形式を取るべきである：
（以下省略）


%index
OleUninitialize
アパートメント上の COM ライブラリを閉じ、アパートメントが保持するクラスファクトリ、その他の COM オブジェクト、サーバを解放し、アパートメント上の RPC を無効化し、アパートメントが保持するリソースを解放する。
%prm

%inst
アパートメント上の COM ライブラリを閉じ、アパートメントが保持するクラスファクトリ、その他の COM
オブジェクト、サーバを解放し、アパートメント上の RPC を無効化し、アパートメントが保持するリソースを解放する。

[備考]
アパートメントが OleInitialize の呼び出しで初期化された場合、アプリケーション終了時に最後の COM
ライブラリ呼び出しとして OleUninitialize を呼び出す。OleUninitialize は内部で
CoUninitialize 関数を呼び出して OLE Component Object（COM）ライブラリをシャットダウンする。COM
ライブラリがアパートメント上で CoInitialize または CoInitializeEx
の呼び出しで初期化された場合、CoUninitialize の呼び出しで閉じる必要がある。OleInitialize と
OleUninitialize の呼び出しは均衡を取らなければならない。OleInitialize
関数の複数回の呼び出しがある場合、同じ回数の OleUninitialize 呼び出しが必要であり、ライブラリを実際に初期化した
OleInitialize 呼び出しに対応する OleUninitialize
呼び出しのみがそれを閉じることができる。インプロセスサーバがロードまたはアンロードされる順序を制御する方法がないため、DllMain
関数から OleInitialize や OleUninitialize を呼び出してはならない。


%index
PropStgNameToFmtId
プロパティセットのストレージ名またはストリーム名を、その形式識別子に変換する。
%prm
oszName, pfmtid
oszName : [wstr] シンプルなプロパティセットのストリーム名、または非シンプルなプロパティセットのストレージ名を含む、null 終端の Unicode 文字列へのポインタ。
pfmtid : [var] oszName で指定されたプロパティセットの形式識別子を受け取る FMTID 変数へのポインタ。
%inst
プロパティセットのストレージ名またはストリーム名を、その形式識別子に変換する。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG に加えて、以下をサポートする：

[備考]
PropStgNameToFmtId
関数は、シンプルなプロパティセットのストリーム名または非シンプルなプロパティセットのストレージ名を、その形式識別子にマッピングする。この関数は、StgCreatePropStg
と StgOpenPropStg 関数で PROPSETFLAG_UNBUFFERED
値を使用してプロパティセットを作成または開くときに有用である。PROPSETFLAG_UNBUFFERED の詳細については
PROPSETFLAG Constants を参照のこと。


%index
PropVariantClear
指定された PROPVARIANT 構造体内で解放可能な要素をすべて解放する。
%prm
pvar
pvar : [var] 解放可能な要素を解放する初期化済みの PROPVARIANT 構造体へのポインタ。戻り時には PROPVARIANT 構造体にすべて 0 が書き込まれる。
%inst
指定された PROPVARIANT 構造体内で解放可能な要素をすべて解放する。

[戻り値]
この関数は HRESULT を返す。

[備考]
あらゆるレベルの間接参照において、NULL ポインタは無視される。たとえば、pvar パラメータが VT_CF 型の
PROPVARIANT 構造体を指しているとする。PROPVARIANT 構造体の pclipdata メンバーは CLIPDATA
構造体を指している。CLIPDATA 構造体内の pClipData ポインタは NULL である。この例では、pClipData
ポインタは無視される。しかし、PROPVARIANT 構造体の pclipdata メンバーが指す CLIPDATA
構造体は解放される。戻り時に、この関数は指定された PROPVARIANT 構造体に 0 を書き込むため、VT 型は VT_EMPTY
となる。pvar パラメータに NULL を渡すと S_OK の戻りコードが返される。注意：PROPVARIANT
構造体の初期化にはこの関数を使用しないこと。代わりに PropVariantInit マクロ（Propidl.h
で定義）を使用して初期化する。


%index
PropVariantCopy
PropVariantCopy 関数は、ある PROPVARIANT 構造体の内容を別の PROPVARIANT 構造体にコピーする。
%prm
pvarDest, pvarSrc
pvarDest : [var] コピーを受け取る初期化されていない PROPVARIANT 構造体へのポインタ。
pvarSrc : [var] コピーされる PROPVARIANT 構造体へのポインタ。
%inst
PropVariantCopy 関数は、ある PROPVARIANT 構造体の内容を別の PROPVARIANT 構造体にコピーする。

[戻り値]
この関数は HRESULT を返す。

[備考]
PROPVARIANT 構造体を値でコピーするので、元の pvarSrc と新しい pvarDest パラメータは
PropVariantClear の呼び出しで独立に解放できる。PropVariantCopy は VariantCopy
関数のように宛先を解放しない。VT_STREAM、VT_STORAGE などのサブオブジェクトが必要な非シンプルな PROPVARIANT
型については、コピーは参照によって行われる。ポインタがコピーされ、それに対して
[IUnknown::AddRef](../unknwn/nf-unknwn-iunknown-addref.md)
が呼び出される。pvarDest または pvarSrc のいずれかに NULL を渡すことは違法である。


%index
ReadClassStg
ReadClassStg 関数は、WriteClassStg 関数でストレージオブジェクトに以前書き込まれた CLSID を読み取る。
%prm
pStg, pclsid
pStg : [var] 取得する CLSID を含むストレージオブジェクト上の IStorage インターフェイスへのポインタ。
pclsid : [var] CLSID が書き込まれる場所へのポインタ。CLSID_NULL を返すことがある。
%inst
ReadClassStg 関数は、WriteClassStg 関数でストレージオブジェクトに以前書き込まれた CLSID を読み取る。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY に加えて、以下をサポートする。この関数は IStorage::Stat
メソッドが返すエラー値も返す。

[備考]
ReadClassStg は IStorage::Stat メソッドを呼び出し、WriteClassStg
の呼び出しでストレージオブジェクトに以前書き込まれた CLSID を STATSTG 構造体から取得するヘルパー関数である。


%index
ReadClassStm
WriteClassStm 関数でストリームオブジェクトに以前書き込まれた CLSID を読み取る。
%prm
pStm, pclsid
pStm : [var] 読み取る CLSID を含むストリームオブジェクト上の IStream インターフェイスへのポインタ。この CLSID は WriteClassStm を使って事前にストリームオブジェクトに書き込まれていなければならない。
pclsid : [var] CLSID が書き込まれる場所へのポインタ。
%inst
WriteClassStm 関数でストリームオブジェクトに以前書き込まれた CLSID を読み取る。

[戻り値]
この関数は ISequentialStream::Read メソッドが返すエラー値も返す。

[備考]
ほとんどのアプリケーションは ReadClassStm 関数を直接呼び出さない。COM はオブジェクトの
IPersistStream::Load 実装を呼び出す前にこれを呼び出す。


%index
ReadFmtUserTypeStg
ReadFmtUserTypeStg 関数は、WriteFmtUserTypeStg 関数で以前保存されたクリップボード形式とユーザタイプを返す。
%prm
pstg, pcf, lplpszUserType
pstg : [var] 情報を読み取るストレージオブジェクト上の IStorage インターフェイスへのポインタ。
pcf : [var] クリップボード形式が戻り時に書き込まれる場所へのポインタ。NULL でもよく、これは形式に呼び出し元が関心がないことを示す。
lplpszUserType : [var] null 終端の Unicode ユーザタイプ文字列へのポインタを受け取る LPWSTR ポインタ変数のアドレス。呼び出し元はこのパラメータに NULL を指定でき、これはユーザタイプに関心がないことを示す。この関数は文字列のためのメモリを割り当てる。呼び出し元は CoTaskMemFree でメモリを解放する責任がある。
%inst
ReadFmtUserTypeStg 関数は、WriteFmtUserTypeStg
関数で以前保存されたクリップボード形式とユーザタイプを返す。

[戻り値]
この関数は標準の戻り値 E_FAIL、E_INVALIDARG、E_OUTOFMEMORY に加えて、以下をサポートする。この関数は
ISequentialStream::Read メソッドが返すエラー値も返す。

[備考]
ReadFmtUserTypeStg
は指定されたストレージオブジェクトからクリップボード形式とユーザタイプ文字列を返す。ReadFmtUserTypeStg
関数を呼び出す前に WriteClassStg 関数を呼び出していなければならない。


%index
RegisterDragDrop
指定されたウィンドウを OLE ドラッグアンドドロップ操作のターゲットとなり得るものとして登録し、ドロップ操作に使用する IDropTarget インスタンスを指定する。
%prm
hwnd, pDropTarget
hwnd : [intptr] OLE ドラッグアンドドロップ操作のターゲットとなり得るウィンドウへのハンドル。
pDropTarget : [var] 指定されたウィンドウでドラッグアンドドロップ操作のターゲットとなるオブジェクト上の IDropTarget インターフェイスへのポインタ。このインターフェイスは、そのウィンドウの OLE ドラッグアンドドロップ情報を伝達するために使用される。
%inst
指定されたウィンドウを OLE ドラッグアンドドロップ操作のターゲットとなり得るものとして登録し、ドロップ操作に使用する
IDropTarget インスタンスを指定する。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
アプリケーションが OLE
ドラッグアンドドロップ操作中にドロップされたオブジェクトを受け入れることができる場合、RegisterDragDrop
関数を呼び出さなければならない。アプリケーションのウィンドウが潜在的なドロップターゲットとして利用可能になるとき（つまり、ウィンドウが画面上に遮られずに表示されているとき）、これを行う。RegisterDragDrop
関数を呼び出すアプリケーションスレッドは、メッセージをポンプしていなければならない。OLE
がメッセージ処理を必要とするスレッド上にウィンドウを作成するため、おそらく NULL の hWnd パラメータで GetMessage
関数を呼び出す必要がある。この要件が満たされない場合、ドロップターゲットとして登録されたウィンドウ上にオブジェクトをドラッグするアプリケーションは、ターゲットアプリケーションが閉じるまでハングする。RegisterDragDrop
関数は一度に 1
つのウィンドウしか登録しないので、ドロップされたオブジェクトを受け入れることができる各アプリケーションウィンドウについて呼び出す必要がある。OLE
ドラッグアンドドロップ操作中にマウスがターゲットウィンドウの遮られていない部分を通過するとき、DoDragDrop
関数は現在のウィンドウに対して指定された IDropTarget::DragOver
メソッドを呼び出す。あるウィンドウで実際にドロップ操作が行われたとき、DoDragDrop 関数は IDropTarget::Drop
を呼び出す。RegisterDragDrop 関数はまた IDropTarget ポインタに対して IUnknown::AddRef
メソッドも呼び出す。


%index
ReleaseStgMedium
指定されたストレージメディアを解放する。
%prm
param0
param0 : [var] 
%inst
指定されたストレージメディアを解放する。

[備考]
ReleaseStgMedium
関数は適切なメソッドまたは関数を呼び出して指定されたストレージメディアを解放する。ストレージメディア構造体がパラメータとなる
IDataObject::GetData や IDataObject::SetData
などのデータ転送操作中にこの関数を使用する。この構造体はストレージメディアの種類を識別するだけでなく、不要になったときにストレージメディアを解放するための適切な
Release メソッドも指定する。STGMEDIUM
をあるコード本体から別のコード本体に渡すことは一般的であり、IDataObject::GetData
などでは呼び出されたコードがメディアを割り当てて呼び出し元に返すことができる。ReleaseStgMedium
は、受信側のコードがメディアを所有するか、元のメディア提供者がまだ所有していて、その場合は受信側コードが提供者にメディアを解放できることを通知する必要があるかについての柔軟性を可能にする。元のメディア提供者がメディアの解放に責任がある場合、提供者は
ReleaseStgMedium を呼び出し、メディアと適切な IUnknown ポインタを punkForRelease
構造体メンバーとして指定する。解放されるストレージメディアの種類に応じて、次のいずれかのアクションが取られ、その後指定された
IUnknown ポインタに対して IUnknown::Release メソッドが呼び出される。
（以下省略）


%index
RevokeDragDrop
指定されたアプリケーションウィンドウを OLE ドラッグアンドドロップ操作の潜在的なターゲットとしての登録を取り消す。
%prm
hwnd
hwnd : [intptr] OLE ドラッグアンドドロップ操作のターゲットとして以前に登録されたウィンドウへのハンドル。
%inst
指定されたアプリケーションウィンドウを OLE ドラッグアンドドロップ操作の潜在的なターゲットとしての登録を取り消す。

[戻り値]
関数が成功した場合は S_OK を返す。その他に返される値は以下のとおり。
（以下省略）

[備考]
アプリケーションウィンドウが OLE
ドラッグアンドドロップ操作の潜在的なターゲットとしてもはや利用可能でなくなったときには、RevokeDragDrop
を呼び出さなければならない。この関数はドロップターゲットインターフェイスに対して IUnknown::Release メソッドを呼び出す。


%index
SNB_UserFree
(no summary)
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst



%index
SNB_UserFree64
(no summary)
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst



%index
SNB_UserMarshal
(no summary)
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst



%index
SNB_UserMarshal64
(no summary)
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst



%index
SNB_UserSize
(no summary)
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst



%index
SNB_UserSize64
(no summary)
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst



%index
SNB_UserUnmarshal
(no summary)
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst



%index
SNB_UserUnmarshal64
(no summary)
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst



%index
STGMEDIUM_UserFree
STGMEDIUM_UserFree 関数（oleidl.h）は、RPC スタブファイルから呼び出されたときにサーバ側のリソースを解放する。
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
STGMEDIUM_UserFree 関数（oleidl.h）は、RPC
スタブファイルから呼び出されたときにサーバ側のリソースを解放する。


%index
STGMEDIUM_UserFree64
STGMEDIUM_UserFree64 関数（oleidl.h）は、RPC スタブファイルから呼び出されたときにサーバ側のリソースを解放する。
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
STGMEDIUM_UserFree64 関数（oleidl.h）は、RPC
スタブファイルから呼び出されたときにサーバ側のリソースを解放する。


%index
STGMEDIUM_UserMarshal
STGMEDIUM_UserMarshal 関数（oleidl.h）は、STGMEDIUM オブジェクトを RPC バッファにマーシャルする。
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
STGMEDIUM_UserMarshal 関数（oleidl.h）は、STGMEDIUM オブジェクトを RPC
バッファにマーシャルする。


%index
STGMEDIUM_UserMarshal64
STGMEDIUM_UserMarshal64 関数（oleidl.h）は、STGMEDIUM オブジェクトを RPC バッファにマーシャルする。
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
STGMEDIUM_UserMarshal64 関数（oleidl.h）は、STGMEDIUM オブジェクトを RPC
バッファにマーシャルする。


%index
STGMEDIUM_UserSize
STGMEDIUM_UserSize 関数（oleidl.h）は、STGMEDIUM オブジェクトの転送サイズを計算し、そのハンドルとデータを取得する。
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
STGMEDIUM_UserSize 関数（oleidl.h）は、STGMEDIUM
オブジェクトの転送サイズを計算し、そのハンドルとデータを取得する。


%index
STGMEDIUM_UserSize64
STGMEDIUM_UserSize64 関数（oleidl.h）は、STGMEDIUM オブジェクトの転送サイズを計算し、そのハンドルとデータを取得する。
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
STGMEDIUM_UserSize64 関数（oleidl.h）は、STGMEDIUM
オブジェクトの転送サイズを計算し、そのハンドルとデータを取得する。


%index
STGMEDIUM_UserUnmarshal
STGMEDIUM_UserUnmarshal 関数（oleidl.h）は、STGMEDIUM オブジェクトを RPC バッファからアンマーシャルする。
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
STGMEDIUM_UserUnmarshal 関数（oleidl.h）は、STGMEDIUM オブジェクトを RPC
バッファからアンマーシャルする。


%index
STGMEDIUM_UserUnmarshal64
STGMEDIUM_UserUnmarshal64 関数（oleidl.h）は、STGMEDIUM オブジェクトを RPC バッファからアンマーシャルする。
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
STGMEDIUM_UserUnmarshal64 関数（oleidl.h）は、STGMEDIUM オブジェクトを RPC
バッファからアンマーシャルする。


%index
SetConvertStg
SetConvertStg 関数は、ストレージオブジェクトに変換ビットを設定し、開かれたときにオブジェクトが新しいクラスに変換されることを示す。設定は GetConvertStg 関数の呼び出しで取得できる。
%prm
pStg, fConvert
pStg : [var] 変換ビットを設定するストレージオブジェクトへの IStorage ポインタ。
fConvert : [int] TRUE の場合、オブジェクトの変換ビットを設定して、開かれたときにオブジェクトが変換されることを示す。FALSE の場合、変換ビットをクリアする。
%inst
SetConvertStg
関数は、ストレージオブジェクトに変換ビットを設定し、開かれたときにオブジェクトが新しいクラスに変換されることを示す。設定は
GetConvertStg 関数の呼び出しで取得できる。

[戻り値]

ストレージとストリームへのアクセスエラーの可能性については、IStorage::CreateStream、IStorage::OpenStream、ISequentialStream::Read、ISequentialStream::Write
メソッドを参照のこと。

[備考]
SetConvertStg
関数は、コンテナオブジェクト内の変換ビットの状態を決定する。これは、オブジェクトをあるクラスから別のクラスに変換する過程で、コンテナアプリケーションとサーバの両方から呼び出される。ユーザが（コンテナが
OleUIConvert
関数の呼び出しで生成する）「変換」ダイアログを通じてオブジェクトを変換することを指定すると、コンテナは次のステップを実行しなければならない：
（以下省略）


%index
StgConvertPropertyToVariant
SERIALIZEDPROPERTYVALUE データ型を PROPVARIANT データ型に変換する。
%prm
pprop, CodePage, pvar, pma
pprop : [var] SERIALIZEDPROPERTYVALUE へのポインタ。
CodePage : [int] プロパティセットのコードページ。
pvar : [var] PROPVARIANT へのポインタ。
pma : [var] IMemoryAllocator 抽象クラスを実装するクラスへのポインタ。
%inst
SERIALIZEDPROPERTYVALUE データ型を PROPVARIANT データ型に変換する。

[戻り値]
変換されたプロパティが間接型（VT_STREAM または VT_STREAMED_OBJECT）であった場合は TRUE
を返し、そうでない場合は FALSE を返す。

[備考]
この関数はプロパティを PROPVARIANT データ型に変換する。関数が失敗した場合は STATUS_INVALID_PARAMETER
などの NT_STATUS を表す例外をスローする。


%index
StgConvertVariantToProperty
PROPVARIANT データ型を SERIALIZEDPROPERTYVALUE データ型に変換する。
%prm
pvar, CodePage, pprop, pcb, pid, fReserved, pcIndirect
pvar : [var] PROPVARIANT へのポインタ。
CodePage : [int] プロパティセットのコードページ。
pprop : [var] オプション。SERIALIZEDPROPERTYVALUE へのポインタ。
pcb : [var] 残りのストリーム長へのポインタで、戻り時に実際のプロパティサイズに更新される。
pid : [int] propid（間接の場合に使用される）。
fReserved : [int] 予約。値は FALSE でなければならない。
pcIndirect : [var] オプション。間接プロパティカウントへのポインタ。
%inst
PROPVARIANT データ型を SERIALIZEDPROPERTYVALUE データ型に変換する。

[戻り値]
SERIALIZEDPROPERTYVALUE へのポインタを返す。

[備考]
この関数は PROPVARIANT をプロパティに変換する。関数が失敗した場合は STATUS_INVALID_PARAMETER
NT_STATUS を表す例外をスローする。


%index
StgCreateDocfile
IStorage インターフェイスの COM が提供する複合ファイル実装を使用して、新しい複合ファイルストレージオブジェクトを作成する。
%prm
pwcsName, grfMode, reserved, ppstgOpen
pwcsName : [wstr] 作成される複合ファイルの null 終端の Unicode 文字列名へのポインタ。これは解釈されずにファイルシステムに渡される。これは相対名または NULL でもよい。NULL の場合、一意の名前で一時的な複合ファイルが割り当てられる。
grfMode : [int] 新しいストレージオブジェクトを開くときに使用するアクセスモードを指定する。詳細については STGM Constants を参照のこと。呼び出し元がトランザクションモードと STGM_CREATE または STGM_CONVERT を一緒に指定した場合、上書きまたは変換はルートストレージに対して commit 操作が呼び出されたときに発生する。ルートストレージオブジェクトに対して IStorage::Commit が呼び出されなかった場合、ファイルの以前の内容が復元される。STGM_CREATE および STGM_CONVERT は STGM_NOSNAPSHOT フラグと組み合わせることができない。これは、トランザクションモードでファイルを上書きまたは変換する際にスナップショットコピーが必要となるためである。
reserved : [int] 将来の使用のために予約されており、ゼロでなければならない。
ppstgOpen : [var] 新しいストレージオブジェクトへの IStorage ポインタの場所へのポインタ。
%inst
IStorage インターフェイスの COM が提供する複合ファイル実装を使用して、新しい複合ファイルストレージオブジェクトを作成する。

[戻り値]
StgCreateDocfile は HRESULT にラップされたファイルシステムエラーやシステムエラーも返すことがある。詳細については
Error Handling Strategies と Handling Unknown Errors を参照のこと。

[備考]
StgCreateDocfile 関数は、IStorage インターフェイスの COM
が提供する複合ファイル実装を使用して新しいストレージオブジェクトを作成する。開かれた複合ファイルの名前は IStorage::Stat
メソッドの呼び出しで取得できる。StgCreateDocfile はファイルが存在しない場合に作成する。存在する場合、grfMode
パラメータでの STGM_CREATE、STGM_CONVERT、STGM_FAILIFTHERE
フラグの使用方法が処理方法を示す。詳細については STGM Constants
を参照のこと。複合ファイルがトランザクションモード（grfMode パラメータが STGM_TRANSACTED
を指定）で開かれており、この名前のファイルがすでに存在する場合、未処理の変更がすべてコミットされるまで既存のファイルは変更されない。呼び出しプロセスが既存のファイルへの書き込みアクセスを欠いている場合（ファイルシステムのアクセス制御による）、grfMode
パラメータは STGM_READ のみを指定でき、STGM_WRITE や STGM_READWRITE
は指定できない。結果として新しく開かれた複合ファイルには書き込み可能だが、その後の commit
操作は失敗する（トランザクションモードでは、書き込み権限はコミット時に強制される）。STGM_SIMPLE
を指定すると、複数のストリームと no storages
を必要とするアプリケーションで頻繁に使用される限定的なケースで複合ファイルオブジェクトのはるかに高速な実装を提供する。シンプルモードは
IStorage 上のすべてのメソッドをサポートしない。詳細については STGM Constants を参照のこと。grfMode
パラメータが STGM_TRANSACTED を指定しており、pwcsName
パラメータで指定された名前のファイルがまだ存在しない場合、ファイルは即座に作成される。アクセス制御されたファイルシステムでは、呼び出し元は複合ファイルが作成されるファイルシステムディレクトリへの書き込み権限を持たなければならない。STGM_TRANSACTED
が指定されておらず STGM_CREATE
が指定されている場合、新しいファイルが作成される前に同じ名前の既存ファイルが破棄される。StgCreateDocfile は
pwcsName パラメータに NULL
値を渡すことで一時的な複合ファイルを作成するために使用できる。ただし、これらのファイルは、システムが提供する一意の名前（おそらくユーザにとって意味のない名前）を持つという意味でのみ一時的である。STGM_DELETEONRELEASE
が grfMode パラメータに指定されていない限り、終了時に一時ファイルを削除する責任は呼び出し元にある。


%index
StgCreateDocfileOnILockBytes
呼び出し元が提供するバイト配列オブジェクトの上に新しい複合ファイルストレージオブジェクトを作成して開く。
%prm
plkbyt, grfMode, reserved, ppstgOpen
plkbyt : [var] 複合ファイルを作成する基礎となるバイト配列オブジェクト上の ILockBytes インターフェイスへのポインタ。
grfMode : [int] 新しい複合ファイルを開くときに使用するアクセスモードを指定する。詳細については STGM Constants と後述の Remarks を参照のこと。
reserved : [int] 将来の使用のために予約されており、ゼロでなければならない。
ppstgOpen : [var] 新しいストレージオブジェクト上の IStorage ポインタの場所へのポインタ。
%inst
呼び出し元が提供するバイト配列オブジェクトの上に新しい複合ファイルストレージオブジェクトを作成して開く。

[戻り値]
StgCreateDocfileOnILockBytes 関数は HRESULT
にラップされたファイルシステムエラーやシステムエラー、または ILockBytes
インターフェイスのエラー戻り値も返すことがある。詳細については Error Handling Strategies と Handling
Unknown Errors を参照のこと。

[備考]
StgCreateDocfileOnILockBytes 関数は、IStorage インターフェイスの COM
が提供する複合ファイル実装を使用して、バイト配列オブジェクトの上にストレージオブジェクトを作成する。StgCreateDocfileOnILockBytes
は、メモリやリレーショナルデータベースなどの任意のデータストアにドキュメントを格納するために使用できる。バイト配列（pLkbyt
パラメータが指す。これはオブジェクト上の ILockBytes
インターフェイスを指す）は、ディスクファイルの代わりに基礎となるストレージとして使用される。プログラマが提供するバイト配列オブジェクトを指定することを除けば、StgCreateDocfileOnILockBytes
は StgCreateDocfile 関数に似ている。新しく作成された複合ファイルは grfMode
パラメータのアクセスモードに従って開かれるが、次の制約に従う：共有モードの動作とトランザクション分離は、LOCK_ONLYONCE
セマンティクスでの LockRegion と UnlockRegion をサポートする ILockBytes 実装に依存する。実装は
STATSTG の grfLocksSupported メンバーに LOCK_ONLYONCE
ビットを設定することで、構造化ストレージにこの機能をサポートしていることを示すことができる。ILockBytes
実装がこの機能をサポートしていない場合、共有モードは強制されず、ルートレベルのトランザクションコミットは同じバイト配列上で開かれた他のトランザクションインスタンスと適切に協調しない。CreateStreamOnHGlobal
実装のような領域ロックをサポートしない ILockBytes
実装を使用するアプリケーションは、同じバイト配列上で複数の同時インスタンスを開くことを避けるべきである。StgCreateDocfileOnILockBytes
はシンプルモードをサポートしない。STGM_SIMPLE
フラグが存在する場合は無視される。変換目的では、ファイルはすでに存在するとみなされる。その結果、エラーが返されるため
STGM_FAILIFTHERE 値を使用することは有用ではない。しかし、STGM_CREATE と STGM_CONVERT
は依然として有用である。バイト配列オブジェクトの上に複合ファイルを構築できる機能は、データ（IStorage と IStream
ツリー構造の下）を非永続的な空間に置く機能をサポートするために提供されている。この機能を考えると、ファイルに格納されているドキュメントがこの機能を使用することを妨げるものはない。たとえば、コンテナは
COM の採用によって自分のファイル形式に与える影響を最小化するためにこれを行うかもしれない。しかし、COM
ドキュメントは独自の最外殻ストレージのために IStorage インターフェイスを採用することが推奨される。これには次の利点がある：
（以下省略）


%index
StgCreatePropSetStg
指定されたストレージオブジェクトからプロパティセットストレージオブジェクトを作成する。
%prm
pStorage, dwReserved, ppPropSetStg
pStorage : [var] 1 つ以上のプロパティセットを含む、または含むことになるストレージオブジェクトへのポインタ。
dwReserved : [int] 将来の使用のために予約されており、ゼロでなければならない。
ppPropSetStg : [var] プロパティセットストレージオブジェクトへのインターフェイスポインタを受け取る IPropertySetStorage* ポインタ変数へのポインタ。
%inst
指定されたストレージオブジェクトからプロパティセットストレージオブジェクトを作成する。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG に加えて、以下をサポートする：

[備考]
StgCreatePropSetStg 関数は、pStorage パラメータで指定された IStorage インターフェイス上で動作する
IPropertySetStorage インターフェイスを作成する。この関数はそれ自体ではこの IStorage を変更しないが、その後の
IPropertySetStorage インターフェイスへの呼び出しは変更する可能性がある。StgCreatePropSetStg は
pStorage で指定されたストレージオブジェクトに対して IUnknown::AddRef
を呼び出す。呼び出し元はオブジェクトが不要になったら Release を呼び出して解放しなければならない。


%index
StgCreatePropStg
指定されたストレージまたはストリームオブジェクト内にプロパティセットを作成して開く。
%prm
pUnk, fmtid, pclsid, grfFlags, dwReserved, ppPropStg
pUnk : [var] 新しいプロパティセットを格納するストレージまたはストリームオブジェクト上の IUnknown インターフェイスへのポインタ。
fmtid : [var] 作成されるプロパティセットの FMTID。
pclsid : [var] このプロパティセットの初期 CLSID へのポインタ。NULL でもよく、その場合 pclsid はすべてゼロに設定される。
grfFlags : [int] プロパティセットがどのように作成され開かれるかを決定する、PROPSETFLAG Constants からの値。
dwReserved : [int] 予約。ゼロでなければならない。
ppPropStg : [var] 新しいプロパティセットへのインターフェイスポインタを受け取る IPropertyStorage* ポインタ変数のアドレス。
%inst
指定されたストレージまたはストリームオブジェクト内にプロパティセットを作成して開く。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG と E_UNEXPECTED に加えて、以下をサポートする：

[備考]
StgCreatePropStg は新しいプロパティセットを作成して開き、IPropertyStorage
インターフェイスのシステム提供のスタンドアロン実装を提供する。新しいプロパティセットは pUnk
で指定されたストレージまたはストリームオブジェクトに含まれる。grfFlags パラメータの値は、pUnk
がストレージオブジェクトを指定するかストリームオブジェクトを指定するかを示す。たとえば、PROPSETFLAG_NONSIMPLE
が設定されている場合、pUnk はストレージオブジェクト上の IStorage
インターフェイスについてクエリできる。いずれの場合も、この関数はプロパティセットを含むストレージまたはストリームオブジェクトに対して
pUnk->AddRef を呼び出す。オブジェクトが不要になったら解放するのは呼び出し元の責任である。この関数は
IPropertySetStorage::Create メソッドに似ている。ただし、StgCreatePropStg は pUnk
パラメータを追加し、grfFlags パラメータの PROPSETFLAG_UNBUFFERED
値をサポートする。IPropertySetStorage インターフェイスをサポートしない IStorage
インターフェイスがある場合、または PROPSETFLAG_UNBUFFERED 値を使用したい場合は、Create
メソッドの代わりにこの関数を使用する。PROPSETFLAG_UNBUFFERED 列挙値の使用方法の詳細については
PROPSETFLAG Constants
を参照のこと。プロパティセットは自動的にコードページとロケール識別子（ID）プロパティを含む。これらはそれぞれ現在のシステムの既定値と現在のユーザの既定値に設定される。grfFlags
パラメータは PROPSETFLAG Constants からの値の組み合わせである。新しい列挙値
PROPSETFLAG_UNBUFFERED がサポートされる。詳細については PROPSETFLAG Constants
を参照のこと。この関数は再頒布可能な Iprop.dll からエクスポートされており、これは Windows NT 4.0 with
Service Pack 2 (SP2) 以降に含まれており、Windows 95、Windows 98
以降では再頒布可能として利用できる。Windows 2000 と Windows XP では ole32.dll
からエクスポートされる。Windows 2000 と Windows XP では iprop.dll
からもエクスポートできるが、呼び出しは ole32.dll に転送される。


%index
StgCreateStorageEx
IStorage または IPropertySetStorage インターフェイスの提供された実装を使用して新しいストレージオブジェクトを作成する。
%prm
pwcsName, grfMode, stgfmt, grfAttrs, pStgOptions, pSecurityDescriptor, riid, ppObjectOpen
pwcsName : [wstr] 作成するファイルのパスへのポインタ。これは解釈されずにファイルシステムに渡される。これは相対名または NULL でもよい。NULL の場合、一意の名前で一時ファイルが割り当てられる。NULL でない場合、文字列のサイズは MAX_PATH 文字を超えてはならない。
grfMode : [int] 新しいストレージオブジェクトを開くときに使用するアクセスモードを指定する値。詳細については STGM Constants を参照のこと。呼び出し元がトランザクションモードと STGM_CREATE または STGM_CONVERT を一緒に指定した場合、上書きまたは変換はルートストレージに対して commit 操作が呼び出されたときに発生する。ルートストレージオブジェクトに対して IStorage::Commit が呼び出されなかった場合、ファイルの以前の内容が復元される。STGM_CREATE および STGM_CONVERT は STGM_NOSNAPSHOT フラグと組み合わせることができない。これは、トランザクションモードでファイルを上書きまたは変換する際にスナップショットコピーが必要となるためである。
stgfmt : [int] ストレージファイル形式を指定する値。詳細については STGFMT 列挙を参照のこと。
grfAttrs : [int] stgfmt パラメータの値に依存する値。
pStgOptions : [var] pStgOptions パラメータは stgfmt パラメータが STGFMT_DOCFILE に設定されている場合のみ有効である。stgfmt パラメータが STGFMT_DOCFILE に設定されている場合、pStgOptions は STGOPTIONS 構造体を指す。これはセクタサイズなどのストレージオブジェクトの機能を指定する。このパラメータは NULL でもよく、その場合は既定の 512 バイトのセクタサイズでストレージオブジェクトが作成される。NULL でない場合、ulSectorSize メンバーは 512 または 4096 のいずれかに設定する必要がある。4096 に設定された場合、grfMode パラメータに STGM_SIMPLE を指定することはできない。usVersion メンバーは StgCreateStorageEx を呼び出す前に設定しなければならない。詳細については STGOPTIONS を参照のこと。
pSecurityDescriptor : [int] ファイルが作成されるときに ACL を設定できるようにする。NULL でない場合、SECURITY_ATTRIBUTES 構造体へのポインタである必要がある。ファイルに ACL を設定する方法については CreateFile を参照のこと。Windows Server 2003、Windows 2000 Server、Windows XP、Windows 2000 Professional：値は NULL でなければならない。
riid : [var] 返されるインターフェイスポインタのインターフェイス識別子（IID）を指定する値。この IID は IStorage インターフェイスまたは IPropertySetStorage インターフェイスのものでよい。
ppObjectOpen : [var] 新しいストレージオブジェクト上のインターフェイスへのポインタを受け取るインターフェイスポインタ変数へのポインタ。操作が失敗した場合は NULL を含む。
%inst
IStorage または IPropertySetStorage
インターフェイスの提供された実装を使用して新しいストレージオブジェクトを作成する。

[戻り値]
この関数は HRESULT にラップされたファイルシステムエラーやシステムエラーも返すことがある。詳細については Error
Handling Strategies と Handling Unknown Errors を参照のこと。

[備考]
アプリケーションがそのファイルを変更するとき、通常は元のコピーを作成する。StgCreateStorageEx 関数はコピーを作成する 1
つの方法である。この関数は暗号化ファイルシステム（EFS）の複製 API
と間接的に動作する。この関数を使用するときは、STGOPTIONS
構造体でファイルストレージのオプションを設定する必要がある。StgCreateStorageEx は StgCreateDocfile
関数のスーパーセットであり、新しいコードでは使用すべきである。構造化ストレージへの今後の拡張は StgCreateStorageEx
関数を通じて公開される。サポートされるプラットフォームについては次の Requirements
セクションを参照のこと。StgCreateStorageEx 関数はシステムが提供する構造化ストレージ実装の 1
つを使用して新しいストレージオブジェクトを作成する。この関数は IStorage 複合ファイル実装、IPropertySetStorage
複合ファイル実装、または IPropertySetStorage NTFS
実装を取得するために使用できる。新しいファイルが作成されるとき、使用されるストレージ実装は指定するフラグとファイルが格納されているドライブの種類に依存する。詳細については
STGFMT 列挙を参照のこと。StgCreateStorageEx はファイルが存在しない場合に作成する。存在する場合、grfMode
パラメータでの STGM_CREATE、STGM_CONVERT、STGM_FAILIFTHERE
フラグの使用方法が処理方法を示す。これらの値の詳細については STGM Constants
を参照のこと。直接モード（STGM_TRANSACTED フラグを指定しないことで示される）で grfMode パラメータに
STGM_READ モードを指定することは無効である。この関数は既存のファイルを開くために使用できない。代わりに
StgOpenStorageEx 関数を使用する。StgCreateStorageEx
関数を使用して、構造化ストレージドキュメントのルートストレージや、プロパティセットをサポートする任意のファイルのプロパティセットストレージにアクセスできる。さまざまな
STGFMT 値に対してどの IID がサポートされているかについては STGFMT のドキュメントを参照のこと。NTFS
プロパティセット実装にアクセスするためにこの関数でファイルが作成される場合、特別な共有ルールが適用される。詳細については
IPropertySetStorage-NTFS Implementation
を参照のこと。複合ファイルがトランザクションモード（STGM_TRANSACTED を指定）と読み取り専用モード（STGM_READ
を指定）で作成される場合、返されたストレージオブジェクトに変更を加えることが可能である。たとえば
IStorage::CreateStream を呼び出すことができる。しかし、IStorage::Commit
を呼び出してそれらの変更をコミットすることはできない。したがって、そのような変更は失われる。STGM_SIMPLE
を指定すると、複数のストリームと no storages
を必要とするアプリケーションを伴う限定的だが頻繁に使用されるケースで複合ファイルオブジェクトのはるかに高速な実装を提供する。詳細については
STGM Constants を参照のこと。STGM_SIMPLE が指定されている場合に STGM_TRANSACTED
を指定することは無効である。シンプルモードは IStorage
上のすべてのメソッドをサポートしない。具体的にはシンプルモードでサポートされる IStorage メソッドは
CreateStream、Commit、SetClass、および COM IUnknown メソッドの
QueryInterface、AddRef、Release である。さらに SetElementTimes は NULL
名で対応されており、アプリケーションがルートストレージに時刻を設定できる。IStorage の他のすべてのメソッドは
STG_E_INVALIDFUNCTION を返す。grfMode パラメータが STGM_TRANSACTED
を指定しており、pwcsName
パラメータで指定された名前のファイルがまだ存在しない場合、ファイルは即座に作成される。アクセス制御されたファイルシステムでは、呼び出し元は複合ファイルが作成されるファイルシステムディレクトリへの書き込み権限を持たなければならない。STGM_TRANSACTED
が指定されておらず STGM_CREATE
が指定されている場合、新しいファイルを作成する前に同じ名前の既存ファイルが破棄される。pwcsName パラメータに NULL
値を渡すことで、StgCreateStorageEx
を使用して一時的な複合ファイルを作成することもできる。ただし、これらのファイルは、システムが提供する一意の名前（おそらくユーザにとって意味のない名前）を持つという意味でのみ一時的である。STGM_DELETEONRELEASE
が grfMode パラメータに指定されていない限り、終了時に一時ファイルを削除する責任は呼び出し元にある。これらのフラグの詳細については
STGM Constants を参照のこと。


%index
StgGetIFillLockBytesOnFile
一時ファイル上にラッパーオブジェクトを開く。
%prm
pwcsName, ppflb
pwcsName : [wstr] ラッパーオブジェクトが作成されるファイルの null 終端の Unicode 文字列名へのポインタ。
ppflb : [var] 新しいバイト配列ラッパーオブジェクトへのインターフェイスポインタを受け取る IFillLockBytes* ポインタ変数へのポインタ。
%inst
一時ファイル上にラッパーオブジェクトを開く。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY、E_UNEXPECTED、E_INVALIDARG、E_FAIL
に加えて、以下をサポートする。StgGetIFillLockBytesOnFile 関数はファイルシステムエラーも返すことがある。

[備考]
pwcsName
で指定されたファイルのダウンロードを管理するモニカは、データの非同期ダウンロードを管理するために必要な非同期ストレージを作成する過程でこの関数を呼び出す。モニカはまず一時ファイルを作成し、次にそのファイル上にラッパーオブジェクトを作成するためにこの関数を呼び出す。最後に、モニカは
StgOpenAsyncDocfileOnIFillLockBytes
を呼び出して、一時ファイルにダウンロードされる複合ファイルのルートストレージを開く。


%index
StgGetIFillLockBytesOnILockBytes
呼び出し元が提供するバイト配列オブジェクト上に新しいラッパーオブジェクトを作成する。
%prm
pilb, ppflb
pilb : [var] 既存のバイト配列オブジェクトへのポインタ。
ppflb : [var] 新しいバイト配列ラッパーオブジェクトへのインターフェイスポインタを受け取る IFillLockBytes ポインタ変数へのポインタ。
%inst
呼び出し元が提供するバイト配列オブジェクト上に新しいラッパーオブジェクトを作成する。

[戻り値]
この関数は標準の戻り値 E_UNEXPECTED と E_FAIL に加えて、以下をサポートする：

[備考]
StgGetIFillLockBytesOnILockBytes
関数は、カスタムバイト配列オブジェクト上に非同期ストレージラッパーオブジェクトを作成することを可能にする。たとえば、すでにバイト配列オブジェクトを作成しているデータベース上に非同期ストレージを実装したい場合、バイト配列のラッパーオブジェクトを作成するためにこの関数を呼び出す。そのために、関数は新しいラッパーオブジェクトを作成し、それを既存のバイト配列オブジェクトへのポインタを渡すことで初期化する。


%index
StgIsStorageFile
StgIsStorageFile 関数は、特定のディスクファイルがストレージオブジェクトを含むかどうかを示す。
%prm
pwcsName
pwcsName : [wstr] 調査されるディスクファイルの null 終端の Unicode 文字列名へのポインタ。pwcsName パラメータは解釈されずに基礎となるファイルシステムに渡される。
%inst
StgIsStorageFile 関数は、特定のディスクファイルがストレージオブジェクトを含むかどうかを示す。

[戻り値]
StgIsStorageFile 関数は HRESULT にラップされたファイルシステムエラーやシステムエラーも返すことがある。Error
Handling Strategies と Handling Unknown Errors を参照のこと。

[備考]

ストレージオブジェクトの基礎となるディスクファイルの先頭には、ストレージオブジェクトを他のファイル形式と区別する署名がある。StgIsStorageFile
関数は、ドキュメントがストレージオブジェクトを使用する場合と使用しない場合があるディスクファイル形式を使用するアプリケーションに有用である。ルート複合ファイルがトランザクションモードで作成されているがまだコミットされていない場合、このメソッドは依然として
S_OK を返す。


%index
StgIsStorageILockBytes
StgIsStorageILockBytes 関数は、指定されたバイト配列がストレージオブジェクトを含むかどうかを示す。
%prm
plkbyt
plkbyt : [var] 調査されるバイト配列への ILockBytes ポインタ。
%inst
StgIsStorageILockBytes 関数は、指定されたバイト配列がストレージオブジェクトを含むかどうかを示す。

[戻り値]
この関数は HRESULT にラップされたファイルシステムエラーやシステムエラー、または ILockBytes
インターフェイスのエラー戻り値も返すことがある。Error Handling Strategies と Handling Unknown
Errors を参照のこと。

[備考]
ストレージオブジェクトの基礎となるバイト配列の先頭には、ストレージオブジェクト（IStorage
インターフェイスをサポート）を他のファイル形式と区別する署名がある。StgIsStorageILockBytes
関数は、ドキュメントがストレージオブジェクトを使用する場合と使用しない場合があるバイト配列（バイト配列オブジェクトは ILockBytes
インターフェイスをサポートする）を使用するアプリケーションに有用である。


%index
StgOpenAsyncDocfileOnIFillLockBytes
呼び出し元が提供するバイト配列ラッパーオブジェクト上の既存のルート非同期ストレージオブジェクトを開く。
%prm
pflb, grfMode, asyncFlags, ppstgOpen
pflb : [var] 開かれるストレージオブジェクトを含むバイト配列ラッパーオブジェクトへの IFillLockBytes ポインタ。
grfMode : [int] ストレージオブジェクトを開くために使用するアクセスモードを指定する値。STGM Constants から取られる最も一般的なアクセスモードは STGM_READ である。
asyncFlags : [int] ストレージ上の接続ポイントがそのサブストレージとストリームによって継承されるかどうかを示す値。ASYNC_MODE_COMPATIBILITY は接続ポイントが継承されることを示す。ASYNC_MODE_DEFAULT は接続ポイントが継承されないことを示す。
ppstgOpen : [var] ルート非同期ストレージオブジェクトへのインターフェイスポインタを受け取る IStorage* ポインタ変数へのポインタ。
%inst
呼び出し元が提供するバイト配列ラッパーオブジェクト上の既存のルート非同期ストレージオブジェクトを開く。

[戻り値]
この関数は標準の戻り値 E_OUTOFMEMORY、E_UNEXPECTED、E_INVALIDARG、E_FAIL
に加えて、以下をサポートする：

[備考]
非同期ストレージオブジェクトのルートストレージは grfMode
パラメータのアクセスモードに従って開かれる。開かれたストレージオブジェクト上の IStorage インターフェイスへのポインタは
ppstgOpen パラメータを通じて提供される。バイト配列ラッパーオブジェクトは事前に
StgGetIFillLockBytesOnFile
関数の呼び出しでインスタンス化されていなければならない。StgOpenAsyncDocfileOnIFillLockBytes
は優先アクセスモードや排他をサポートしない。それ以外は StgOpenStorageOnILockBytes
関数とほぼ同じように動作する。返されるストレージオブジェクトは IProgressNotify への接続ポイントを持つ。


%index
StgOpenPropStg
指定されたストレージまたはストリームオブジェクト内の指定されたプロパティセットを開く。
%prm
pUnk, fmtid, grfFlags, dwReserved, ppPropStg
pUnk : [var] 要求されたプロパティセットオブジェクトを含むストレージまたはストリームオブジェクト上の IUnknown インターフェイスへのインターフェイスポインタ。
fmtid : [var] 開かれるプロパティセットの FMTID。
grfFlags : [int] PROPSETFLAG Constants からの値。
dwReserved : [int] 将来の使用のために予約されており、ゼロでなければならない。
ppPropStg : [var] 要求されたプロパティセットへのインターフェイスポインタを受け取る IPropertyStorage* ポインタ変数へのポインタ。
%inst
指定されたストレージまたはストリームオブジェクト内の指定されたプロパティセットを開く。

[戻り値]
この関数は標準の戻り値 E_INVALIDARG と E_UNEXPECTED に加えて、以下をサポートする：

[備考]
StgOpenPropStg は要求されたプロパティセットを開き、IPropertyStorage
インターフェイスのシステム提供のスタンドアロン実装を提供する。要求されたプロパティセットは pUnk
で指定されたストレージまたはストリームオブジェクトに含まれる。grfFlags パラメータの値は、pUnk
がストレージオブジェクトを指定するかストリームオブジェクトを指定するかを示す。たとえば、PROPSETFLAG_NONSIMPLE
が設定されている場合、pUnk はストレージオブジェクト上の IStorage
インターフェイスについてクエリできる。いずれの場合も、この関数はプロパティセットを含むストレージまたはストリームオブジェクトに対して
pUnk->AddRef を呼び出す。呼び出し元はオブジェクトが不要になったら解放しなければならない。この関数は
IPropertySetStorage::Open メソッドに似ている。ただし、StgOpenPropStg は pUnk と
grfFlags パラメータを追加し、grfFlags パラメータの PROPSETFLAG_UNBUFFERED
値を含む。IPropertySetStorage インターフェイスをサポートしない IStorage インターフェイスがある場合、または
PROPSETFLAG_UNBUFFERED 値を使用したい場合は、Open
メソッドの代わりにこの関数を使用する。PROPSETFLAG_UNBUFFERED の使用方法の詳細については PROPSETFLAG
Constants を参照のこと。grfFlags パラメータは PROPSETFLAG Constants
からの値の組み合わせである。新しい列挙値 PROPSETFLAG_UNBUFFERED がサポートされる。詳細については
PROPSETFLAG Constants を参照のこと。この関数は再頒布可能な iprop.dll からエクスポートされており、これは
Windows NT 4.0 with Service Pack 2 (SP2) に含まれており、Windows 95
以降では再頒布可能として利用できる。Windows 2000 では Ole32.dll からエクスポートされる。Windows 2000
では iprop.dll からもエクスポートできるが、呼び出しは ole32.dll に転送される。


%index
StgOpenStorage
ファイルシステム内の既存のルートストレージオブジェクトを開く。
%prm
pwcsName, pstgPriority, grfMode, snbExclude, reserved, ppstgOpen
pwcsName : [wstr] 開くストレージオブジェクトを含むファイルのパスへの null 終端の Unicode 文字列へのポインタ。pstgPriority パラメータが NULL でない場合、このパラメータは無視される。
pstgPriority : [var] NULL であるべき IStorage インターフェイスへのポインタ。NULL でない場合、このパラメータは後述の Remarks セクションで説明されるように使用される。StgOpenStorage が戻った後、pStgPriority で指定されたストレージオブジェクトは解放されている可能性があり、もはや使用すべきではない。
grfMode : [int] ストレージオブジェクトを開くために使用するアクセスモードを指定する。
snbExclude : [var] NULL でない場合、ストレージオブジェクトが開かれるときに除外されるストレージ内の要素ブロックへのポインタ。除外は、開く際にスナップショットコピーが発生するかどうかに関係なく行われる。NULL でもよい。
reserved : [int] 将来の使用のために予約されていることを示す。ゼロでなければならない。
ppstgOpen : [var] 開かれたストレージへのインターフェイスポインタを受け取る IStorage* ポインタ変数へのポインタ。
%inst
ファイルシステム内の既存のルートストレージオブジェクトを開く。

[戻り値]
StgOpenStorage 関数は HRESULT にラップされたファイルシステムエラーやシステムエラーも返すことがある。詳細については
Error Handling Strategies と Handling Unknown Errors を参照のこと。

[備考]
StgOpenStorage 関数は grfMode
パラメータのアクセスモードに従って指定されたルートストレージオブジェクトを開き、成功した場合は ppstgOpen
パラメータで開かれたストレージオブジェクトへの IStorage
ポインタを提供する。サブストレージのないストレージオブジェクトを保存するシンプルモードをサポートするために、StgOpenStorage
関数は grfMode パラメータの有効なモードとして次の 2 つのフラグの組み合わせのいずれかを受け入れる。
（以下省略）


%index
StgOpenStorageEx
ファイルシステム内の既存のルートストレージオブジェクトを開く。複合ファイルと通常のファイルを開くにはこの関数を使用する。
%prm
pwcsName, grfMode, stgfmt, grfAttrs, pStgOptions, pSecurityDescriptor, riid, ppObjectOpen
pwcsName : [wstr] ストレージオブジェクトを含むファイルのパスへの null 終端の Unicode 文字列へのポインタ。この文字列のサイズは MAX_PATH 文字を超えてはならない。Windows Server 2003 と Windows XP/2000：CreateFile 関数とは異なり、"\\?\" プレフィックスを使用して MAX_PATH 制限を超えることはできない。
grfMode : [int] 新しいストレージオブジェクトを開くアクセスモードを指定する値。詳細については STGM Constants を参照のこと。呼び出し元がトランザクションモードと STGM_CREATE または STGM_CONVERT を一緒に指定した場合、上書きまたは変換はルートストレージに対して commit 操作が呼び出されたときに発生する。ルートストレージオブジェクトに対して IStorage::Commit が呼び出されなかった場合、ファイルの以前の内容が復元される。STGM_CREATE および STGM_CONVERT は STGM_NOSNAPSHOT フラグと組み合わせることができない。これは、トランザクションモードでファイルを上書きまたは変換する際にスナップショットコピーが必要となるためである。ストレージオブジェクトが直接モード（STGM_DIRECT）で STGM_WRITE または STGM_READWRITE のいずれかへのアクセスで開かれる場合、STGM_DIRECT_SWMR モードが指定されていない限り、共有モードは STGM_SHARE_EXCLUSIVE でなければならない。詳細については Remarks セクションを参照のこと。ストレージオブジェクトが直接モードで STGM_READ へのアクセスで開かれる場合、STGM_PRIORITY または STGM_DIRECT_SWMR が指定されていない限り、共有モードは STGM_SHARE_EXCLUSIVE または STGM_SHARE_DENY_WRITE のいずれかでなければならない。詳細については Remarks セクションを参照のこと。ファイルを開くモードは実装のパフォーマンスに影響を与えることがある。詳細については Compound File Implementation Limits を参照のこと。
stgfmt : [int] ストレージファイル形式を指定する値。詳細については STGFMT 列挙を参照のこと。
grfAttrs : [int] stgfmt パラメータの値に依存する値。STGFMT_DOCFILE はゼロ（0）または FILE_FLAG_NO_BUFFERING でなければならない。この値の詳細については CreateFile を参照のこと。pStgOptions で指定されたファイルのセクタサイズが基礎となるディスクの物理セクタサイズの整数倍でない場合、この操作は失敗する。stgfmt のその他すべての値はゼロでなければならない。
pStgOptions : [var] 開かれるストレージオブジェクトに関するデータを含む STGOPTIONS 構造体へのポインタ。pStgOptions パラメータは stgfmt パラメータが STGFMT_DOCFILE に設定されている場合のみ有効である。usVersion メンバーは StgOpenStorageEx を呼び出す前に設定しなければならない。詳細については STGOPTIONS 構造体を参照のこと。
pSecurityDescriptor : [int] 予約。ゼロでなければならない。
riid : [var] 返されるインターフェイスポインタの GUID を指定する値。IStorage インターフェイスを取得するための IID_IStorage、または IPropertySetStorage インターフェイスを取得するための IID_IPropertySetStorage のヘッダで指定された値も指定できる。
ppObjectOpen : [var] 開かれたストレージオブジェクト上のインターフェイスへのポインタを受け取るインターフェイスポインタ変数のアドレス。操作が失敗した場合は NULL を含む。
%inst
ファイルシステム内の既存のルートストレージオブジェクトを開く。複合ファイルと通常のファイルを開くにはこの関数を使用する。

[戻り値]
この関数は HRESULT にラップされたファイルシステムエラーやシステムエラーも返すことがある。詳細については Error
Handling Strategies と Handling Unknown Errors を参照のこと。

[備考]
StgOpenStorageEx は StgOpenStorage
関数のスーパーセットであり、新しいコードでは使用すべきである。構造化ストレージへの今後の拡張はこの関数を通じて公開される。サポートされるプラットフォームの詳細については
Requirements セクションを参照のこと。StgOpenStorageEx 関数は grfMode
パラメータのアクセスモードに従って指定されたルートストレージオブジェクトを開き、成功した場合は ppObjectOpen
パラメータで開かれたストレージオブジェクトのインターフェイスポインタを提供する。この関数は IStorage
複合ファイル実装、IPropertySetStorage 複合ファイル実装、または IPropertySetStorage の NTFS
ファイルシステム実装を取得するために使用できる。ファイルを開くとき、システムは指定する STGFMT
フラグ、ファイルの種類、およびファイルが格納されるドライブの種類に応じて構造化ストレージ実装を選択する。StgOpenStorageEx
関数を使用して、構造化ストレージドキュメントのルートストレージや、プロパティセットをサポートする任意のファイルのプロパティセットストレージにアクセスする。さまざまな
STGFMT 値に対してどのインターフェイス識別子（IID）がサポートされているかについての詳細は STGFMT を参照のこと。NTFS
プロパティセット実装にアクセスするためにこの関数でファイルが開かれる場合、特別な共有ルールが適用される。詳細については
IPropertySetStorage-NTFS Implementation を参照のこと。複合ファイルが
STGM_TRANSACTED を指定したトランザクションモードと STGM_READ
を指定した読み取り専用モードで開かれる場合、返されたストレージオブジェクトを変更することが可能である。たとえば
IStorage::CreateStream を呼び出すことができる。しかし、IStorage::Commit
を呼び出してそれらの変更をコミットすることはできない。したがって、そのような変更は失われる。grfMode パラメータでこの関数に
STGM_CREATE、STGM_DELETEONRELEASE、STGM_CONVERT
フラグを使用することは無効である。サブストレージのないストレージオブジェクトを保存するシンプルモードをサポートするために、StgOpenStorageEx
関数は grfMode パラメータの有効なモードとして次の 2 つのフラグの組み合わせのいずれかを受け入れる：
（以下省略）


%index
StgOpenStorageOnILockBytes
StgOpenStorageOnILockBytes 関数は、ディスクファイル内には存在せず、代わりに呼び出し元が提供する基礎となるバイト配列を持つ既存のストレージオブジェクトを開く。
%prm
plkbyt, pstgPriority, grfMode, snbExclude, reserved, ppstgOpen
plkbyt : [var] 開かれるストレージオブジェクトを含む基礎となるバイト配列オブジェクトへの ILockBytes ポインタ。
pstgPriority : [var] NULL であるべき IStorage インターフェイスへのポインタ。NULL でない場合、このパラメータは後述の Remarks セクションで説明されるように使用される。StgOpenStorageOnILockBytes が戻った後、pStgPriority で指定されたストレージオブジェクトは解放されている可能性があり、もはや使用すべきではない。
grfMode : [int] ストレージオブジェクトを開くために使用するアクセスモードを指定する。詳細については STGM Constants と後述の Remarks を参照のこと。
snbExclude : [var] NULL でもよい。NULL でない場合、このパラメータはストレージオブジェクトが開かれるときに除外されるストレージ内の要素ブロックを指す。この除外は、開く際にスナップショットコピーが発生するかどうかとは独立して発生する。
reserved : [int] 将来の使用のために予約されていることを示す。ゼロでなければならない。
ppstgOpen : [var] 成功時に開かれたストレージへの IStorage ポインタの場所を指す。
%inst
StgOpenStorageOnILockBytes
関数は、ディスクファイル内には存在せず、代わりに呼び出し元が提供する基礎となるバイト配列を持つ既存のストレージオブジェクトを開く。

[戻り値]
StgOpenStorageOnILockBytes 関数は HRESULT にラップされたファイルシステムエラーやシステムエラー、または
ILockBytes インターフェイスのエラー戻り値も返すことがある。Error Handling Strategies と
Handling Unknown Errors を参照のこと。

[備考]
StgOpenStorageOnILockBytes は指定されたルートストレージオブジェクトを開く。開かれたストレージオブジェクト上の
IStorage インターフェイスへのポインタは ppstgOpen パラメータを通じて提供される。ストレージオブジェクトは事前に
StgCreateDocfileOnILockBytes
関数で作成されていなければならない。プログラマが提供するバイト配列オブジェクトを指定することを除けば、StgOpenStorageOnILockBytes
は StgOpenStorage 関数に似ている。ストレージオブジェクトは grfMode
パラメータのアクセスモードに従って開かれるが、次の制約に従う：共有モードの動作とトランザクション分離は、LOCK_ONLYONCE
セマンティクスでの LockRegion と UnlockRegion をサポートする ILockBytes 実装に依存する。実装は
STATSTG の grfLocksSupported メンバーに LOCK_ONLYONCE
ビットを設定することで、構造化ストレージにこの機能をサポートしていることを示すことができる。ILockBytes
実装がこの機能をサポートしていない場合、共有モードは強制されず、ルートレベルのトランザクションコミットは同じバイト配列上で開かれた他のトランザクションインスタンスと適切に協調しない。CreateStreamOnHGlobal
実装のような領域ロックをサポートしない ILockBytes
実装を使用するアプリケーションは、同じバイト配列上で複数の同時インスタンスを開くことを避けるべきである。StgOpenStorageOnILockBytes
はシンプルモードをサポートしない。STGM_SIMPLE フラグが存在する場合は無視される。pStgPriority
パラメータは、既存のストレージオブジェクト（多くの場合、優先モードで開かれたもの）を、同じバイト配列で開かれた新しいストレージオブジェクトに置き換える呼び出し元の便宜のためのものである。StgOpenStorage
の pStgPriority パラメータとは異なり、このパラメータは StgOpenStorageOnILockBytes
が実行する開く操作には影響せず、単に呼び出し元が解放したい既存のストレージオブジェクトである。StgOpenStorageOnILockBytes
は状況によってはオブジェクトを解放し、他の状況では解放しないため、呼び出し元は常にこのパラメータに NULL
を渡すべきである。pStgPriority パラメータの使用は、次の例に示すように、代わりに
StgOpenStorageOnILockBytes を呼び出す前にオブジェクトを解放することで、呼び出し元がより安全な方法で複製できる：
（以下省略）


%index
StgPropertyLengthAsVariant
StgPropertyLengthAsVariant 関数は、SERIALIZEDPROPERTYVALUE を調査し、このプロパティが PROPVARIANT として占有するメモリ量を返す。
%prm
pProp, cbProp, CodePage, bReserved
pProp : [var] SERIALIZEDPROPERTYVALUE へのポインタ。
cbProp : [int] pProp バッファのサイズ（バイト単位）。
CodePage : [int] プロパティセットのコードページ。
bReserved : [int] 予約。0 でなければならない。
%inst
StgPropertyLengthAsVariant 関数は、SERIALIZEDPROPERTYVALUE を調査し、このプロパティが
PROPVARIANT として占有するメモリ量を返す。

[戻り値]
プロパティが PROPVARIANT として占有するメモリ量を返す。

[備考]

メモリ不足のシナリオでプロパティ値をデシリアライズするかどうかを判断するためにこの関数を使用する。ほとんどのアプリケーションはこの関数を呼び出す必要はない。


%index
StgSetTimes
StgSetTimes 関数は、基礎となるファイルシステムでサポートされている場合、指定されたファイルの作成、アクセス、更新の時刻を設定する。
%prm
lpszName, pctime, patime, pmtime
lpszName : [wstr] 変更されるファイルの名前へのポインタ。
pctime : [var] 作成時刻の新しい値へのポインタ。
patime : [var] アクセス時刻の新しい値へのポインタ。
pmtime : [var] 更新時刻の新しい値へのポインタ。
%inst
StgSetTimes
関数は、基礎となるファイルシステムでサポートされている場合、指定されたファイルの作成、アクセス、更新の時刻を設定する。

[戻り値]
StgSetTimes 関数は HRESULT にラップされたファイルシステムエラーやシステムエラーも返すことがある。Error
Handling Strategies と Handling Unknown Errors を参照のこと。

[備考]
StgSetTimes 関数は指定されたファイルの時刻値を設定する。各時刻値パラメータは NULL
でもよく、その場合は変更が行われないことを示す。これらの時刻値の 1
つ以上が基礎となるファイルシステムでサポートされていない可能性がある。この関数は設定可能な時刻を設定し、それ以外は無視する。


%index
WriteClassStg
WriteClassStg 関数は、指定されたクラス識別子（CLSID）をストレージオブジェクトに格納する。
%prm
pStg, rclsid
pStg : [var] 新しい CLSID を取得するストレージオブジェクトへの IStorage ポインタ。
rclsid : [var] オブジェクトとともに格納される CLSID へのポインタ。
%inst
WriteClassStg 関数は、指定されたクラス識別子（CLSID）をストレージオブジェクトに格納する。

[戻り値]
この関数は HRESULT を返す。

[備考]
WriteClassStg 関数は、ReadClassStg 関数で読み取れるように、指定されたストレージオブジェクトに CLSID
を書き込む。コンテナアプリケーションは通常、IPersistStorage::Save メソッドを呼び出す前にこの関数を呼び出す。


%index
WriteClassStm
WriteClassStm 関数は、指定された CLSID をストリームに格納する。
%prm
pStm, rclsid
pStm : [var] CLSID が書き込まれるストリームへの IStream ポインタ。
rclsid : [var] ストリームに書き込む CLSID を指定する。
%inst
WriteClassStm 関数は、指定された CLSID をストリームに格納する。

[戻り値]
この関数は HRESULT を返す。

[備考]
WriteClassStm 関数は、ReadClassStm 関数で読み取れるように、指定されたストリームオブジェクトに CLSID
を書き込む。ほとんどのアプリケーションは WriteClassStm を直接呼び出さない。OLE はオブジェクトの
IPersistStream::Save メソッドを呼び出す前にこれを呼び出す。


%index
WriteFmtUserTypeStg
WriteFmtUserTypeStg 関数は、ストレージオブジェクトにクリップボード形式とユーザタイプを書き込む。
%prm
pstg, cf, lpszUserType
pstg : [var] 情報が書き込まれるストレージオブジェクトへの IStorage ポインタ。
cf : [int] ストレージオブジェクトのネイティブ領域の構造を記述するクリップボード形式を指定する。形式タグには、このストレージオブジェクト内のストリームとサブストレージの名前のポリシー、およびそれらのストリーム内のデータを解釈するためのルールが含まれる。
lpszUserType : [wstr] オブジェクトの現在のユーザタイプを指定する null 終端の Unicode 文字列へのポインタ。ユーザタイプ値自体は NULL にできない。これは IOleObject::GetUserType メソッドが返すタイプである。この関数がオブジェクトクラスが存在しないリモートマシンに転送された場合、この永続的に格納されたユーザタイプはダイアログボックスでユーザに表示できる。
%inst
WriteFmtUserTypeStg 関数は、ストレージオブジェクトにクリップボード形式とユーザタイプを書き込む。

[戻り値]
この関数は HRESULT を返す。

[備考]
WriteFmtUserTypeStg 関数はオブジェクトの IPersistStorage::Save
メソッドの実装内で呼び出されなければならない。また、構造化ストレージを永続表現に使用するドキュメントレベルのオブジェクトの保存シーケンスでも呼び出されなければならない。保存された情報を読み取るには、アプリケーションは
ReadFmtUserTypeStg 関数を呼び出す。

