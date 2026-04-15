; ============================================================
;   com_misc.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
com_misc.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の com_misc.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
IAdviseSink_OnDataChange
データオブジェクト内のデータが変更されたことを、現在登録されているアドバイスシンクに通知するためにサーバーから呼び出される。
%prm
this, pFormatetc, pStgmed
this : [comobj] IAdviseSink インターフェースの COM オブジェクト変数
pFormatetc : [var] 呼び出し元のデータオブジェクトの形式、ターゲットデバイス、レンダリング、ストレージ情報を記述する FORMATETC 構造体へのポインタ。
pStgmed : [int] 呼び出し元のデータオブジェクトに関する記憶媒体（グローバルメモリ、ディスクファイル、ストレージオブジェクト、ストリームオブジェクト、GDI オブジェクト、または未定義）とその所有権を定義する STGMEDIUM 構造体へのポインタ。
%inst
データオブジェクト内のデータが変更されたことを、現在登録されているアドバイスシンクに通知するためにサーバーから呼び出される。

[備考]
リンクオブジェクトのオブジェクトハンドラやコンテナは、オブジェクト内のデータが変更されたという通知を受けたときに適切な処理を行うために
IAdviseSink::OnDataChange を実装する。また、興味のあるオブジェクトとアドバイザリ接続を確立するために
IDataObject::DAdvise を呼び出さなければならない。OLE
のキャッシュサポートを利用するコンテナは、データ変更通知を登録する必要はない。なぜなら、コンテナがオブジェクトを表示するために必要な情報（データの変更を含む）はすべてオブジェクトのキャッシュ内に保持されるからである。実装者への注意
コンテナで IAdviseSink::OnDataChange
を実装する場合、このメソッドは非同期であり、非同期メソッド内で同期呼び出しを行うことは無効である点に注意すること。したがって、オブジェクトの更新に必要なデータを取得するために
IDataObject::GetData を呼び出すことはできない。代わりに、内部メッセージをポストするか、InvalidateRect
を呼び出して変更されたデータの矩形を無効化し、WM_PAINT
メッセージを待ってからデータを取得しオブジェクトを更新する。データ自体は呼び出しの間だけ有効で、pStgmed
が指す記憶媒体を介して渡される。媒体の所有権は呼び出し元にあるため、アドバイスシンクはそれを解放してはならない。また、pStgmed が
IStorage や IStream インターフェースを指している場合、シンクは参照カウントをインクリメントしてはならない。


%index
IAdviseSink_OnViewChange
ビューが変更されたことを、オブジェクトに登録されたアドバイスシンクに通知する。
%prm
this, dwAspect, lindex
this : [comobj] IAdviseSink インターフェースの COM オブジェクト変数
dwAspect : [int] オブジェクトのアスペクト（ビュー）。DVASPECT 列挙体から取得した値が入る。
lindex : [int] 変更されたビューの一部分。現時点では -1 のみが有効である。
%inst
ビューが変更されたことを、オブジェクトに登録されたアドバイスシンクに通知する。

[備考]
コンテナは IViewObject::SetAdvise
を呼び出して、オブジェクトのビューが変化したときに通知を受けるよう登録する。登録後、オブジェクトは適切なタイミングでシンクの
IAdviseSink::OnViewChange メソッドを呼び出す。OnViewChange
はオブジェクトがロード状態または実行状態のいずれにあっても呼び出し得る。DVASPECT の値は個別のフラグビットだが、dwAspect
は単一の値だけを表現できる。つまり dwAspect は 2 つ以上の DVASPECT 値を OR
演算した結果を含むことはできない。lindex パラメータは関心のあるアスペクトの一部分を表す。lindex の値は dwAspect
の値に依存する。dwAspect が DVASPECT_THUMBNAIL または DVASPECT_ICON の場合 lindex
は無視される。dwAspect が DVASPECT_CONTENT の場合 lindex は -1
でなければならず、これはビュー全体が関心の対象であることを示し、現時点で唯一有効な値である。


%index
IAdviseSink_OnRename
オブジェクトの名前が変更されたことを、登録されたすべてのアドバイスシンクに通知するためにサーバーから呼び出される。
%prm
this, pmk
this : [comobj] IAdviseSink インターフェースの COM オブジェクト変数
pmk : [comobj] オブジェクトの新しい完全モニカ上の IMoniker インターフェースへのポインタ。
%inst
オブジェクトの名前が変更されたことを、登録されたすべてのアドバイスシンクに通知するためにサーバーから呼び出される。

[備考]
OLE リンクオブジェクトは通常、リンクソースまたはそのコンテナの名前変更通知を受けるために IAdviseSink::OnRename
を実装する。リンクソースとして機能するオブジェクトは OnRename
を呼び出し、新しい完全モニカをオブジェクトハンドラに渡し、ハンドラはその通知をリンクオブジェクトへ転送する。これに応じてリンクオブジェクトはモニカを更新しなければならない。さらにリンクオブジェクトは、その通知を自身のコンテナへ転送する。


%index
IAdviseSink_OnSave
オブジェクトが保存されたことを、登録されたすべてのアドバイスシンクに通知するためにサーバーから呼び出される。
%prm
this
this : [comobj] IAdviseSink インターフェースの COM オブジェクト変数
%inst
オブジェクトが保存されたことを、登録されたすべてのアドバイスシンクに通知するためにサーバーから呼び出される。

[備考]

オブジェクトハンドラやリンクオブジェクトは、オブジェクトが元のストレージ（保存操作経由）または新しいストレージ（名前を付けて保存操作経由）へディスクに保存されたときに通知を受けるために、通常
IAdviseSink::OnSave
を実装する。オブジェクトハンドラやリンクオブジェクトは、自身のキャッシュを更新する目的でオブジェクトの保存通知を登録するが、これは登録時に渡したアドバイスフラグが
ADVFCACHE_ONSAVE
を指定している場合のみである。オブジェクトハンドラとリンクオブジェクトは、これらの通知を自身のコンテナに転送する。


%index
IAdviseSink_OnClose
オブジェクトが実行状態からロード状態へ変化したことを、登録されたすべてのアドバイスシンクに通知するためにサーバーから呼び出される。
%prm
this
this : [comobj] IAdviseSink インターフェースの COM オブジェクト変数
%inst
オブジェクトが実行状態からロード状態へ変化したことを、登録されたすべてのアドバイスシンクに通知するためにサーバーから呼び出される。

[備考]
OnClose
通知は、オブジェクトが実行状態からロード状態へ遷移しようとしていることを示し、コンテナが整然としたシャットダウンを行えるようにする。たとえば、オブジェクトハンドラはオブジェクトへのポインタを解放しなければならない。閉じようとしているオブジェクトが、その
OLE
サーバーアプリケーションによってサポートされる最後の開いているオブジェクトであれば、アプリケーション自体もシャットダウンできる。リンクオブジェクトの場合、この通知は常にリンクソースとの接続が切断されたことを意味すると解釈すべきである。


%index
IBindCtx_RegisterObjectBound
バインドコンテキストが解放されるまでオブジェクトがアクティブのまま保たれるよう、そのオブジェクトをバインドコンテキストに登録する。
%prm
this, punk
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
punk : [int] バインド済みとして登録するオブジェクトの IUnknown インターフェースへのポインター。
%inst
バインドコンテキストが解放されるまでオブジェクトがアクティブのまま保たれるよう、そのオブジェクトをバインドコンテキストに登録する。

[戻り値]
このメソッドは標準の戻り値 E_OUTOFMEMORY および S_OK を返すことがある。

[備考]
新しいモニカクラスを作成する場合（IMoniker
インターフェースの実装を通じて）、実装がオブジェクトをアクティブ化したときは常にこのメソッドを呼び出すべきである。これはモニカのバインド過程で最もよく発生するが、モニカの表示名の取得、表示名からモニカへの解析、オブジェクトの最終変更時刻の取得中にも起こり得る。RegisterObjectBound
はオブジェクトに対する追加の参照を作成するために AddRef
を呼び出す。ただし自身のポインターは別途解放する必要がある。同じオブジェクトに対してこのメソッドを 2
回呼び出すと、そのオブジェクトへの参照が 2 つ作成される。このメソッドの呼び出しで取得した参照は
IBindCtx::RevokeObjectBound
を呼び出して解放できる。バインドコンテキスト自身が解放されると、そのバインドコンテキストが保持していたすべての参照が解放される。RegisterObjectBound
でオブジェクトをバインドコンテキストに登録すると、バインドコンテキストが解放されるまでそのオブジェクトはアクティブ状態に保たれる。同じバインドコンテキストを後続のバインド操作で（同じ複合モニカの別の部分に対して、あるいは異なるモニカに対して）再利用すると、そのオブジェクトを再読み込みする必要がなくなるためバインド操作を効率化できる。ただしこれは後続のバインド操作が元の操作と同じオブジェクトを必要とする場合にのみ性能向上につながるため、バインドコンテキスト再利用による性能向上と不要にオブジェクトをアクティブのまま保持するコストを比較検討する必要がある。
IBindCtx は RegisterObjectBound
で登録されたオブジェクトへのポインターを取得するメソッドを提供しない。オブジェクトがランニングオブジェクトテーブルに自身を登録していれば、モニカ実装は
IRunningObjectTable::GetObject を呼び出してオブジェクトへのポインターを取得できる。


%index
IBindCtx_RevokeObjectBound
RegisterObjectBound の呼び出しを取り消し、バインドコンテキストからオブジェクトを削除する。
%prm
this, punk
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
punk : [int] 削除するオブジェクトの IUnknown インターフェースへのポインター。
%inst
RegisterObjectBound の呼び出しを取り消し、バインドコンテキストからオブジェクトを削除する。

[戻り値]
このメソッドは以下の値を返すことがある。
（以下省略）

[備考]
このメソッドを呼び出すことはほとんどない。主として完全性のためにドキュメント化されている。


%index
IBindCtx_ReleaseBoundObjects
RegisterObjectBound の呼び出しで以前に登録されたすべてのオブジェクトへのポインターを解放する。
%prm
this
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
%inst
RegisterObjectBound の呼び出しで以前に登録されたすべてのオブジェクトへのポインターを解放する。

[戻り値]
成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
このメソッドを直接呼び出すことはほとんどない。システムの IBindCtx 実装は、バインドコンテキストの IBindCtx
インターフェースへのポインターが解放されるとき（バインドコンテキストが解放されるとき）にこのメソッドを呼び出す。バインドコンテキストが解放されなかった場合、登録されたすべてのオブジェクトはアクティブのままとなる。同じオブジェクトが複数回登録されている場合、このメソッドは登録回数分だけそのオブジェクトの
Release メソッドを呼び出す。


%index
IBindCtx_SetBindOptions
バインドコンテキストに格納されているバインドパラメーターに新しい値を設定する。
%prm
this, pbindopts
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pbindopts : [var] バインドパラメーターを含む [BIND_OPTS3](/windows/win32/api/objidl/ns-objidl-bind_opts3-r1) 構造体へのポインター。
%inst
バインドコンテキストに格納されているバインドパラメーターに新しい値を設定する。

[戻り値]
このメソッドは標準の戻り値 E_OUTOFMEMORY および S_OK を返すことがある。

[備考]
バインドコンテキストには、ほとんどの IMoniker
操作に共通のパラメーターのブロックが含まれる。これらのパラメーターは複合モニカの各部分を処理する過程でも変化しない。後続のバインド操作は
IBindCtx::GetBindOptions を呼び出してこれらのパラメーターを取得できる。呼び出し側へのメモ
このメソッドはモニカクライアント（モニカを使ってオブジェクトへのインターフェースポインターを取得する側）から呼び出されることがある。CreateBindCtx
関数を使ってバインドコンテキストを初めて作成するとき、BIND_OPTS 構造体のフィールドは以下の値に初期化される。
（以下省略）


%index
IBindCtx_GetBindOptions
このバインドコンテキストに格納されているバインドオプションを取得する。
%prm
this, pbindopts
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pbindopts : [var] 戻り時に現在のバインドパラメーターを受け取る初期化済み構造体へのポインター。[BIND_OPTS3](/windows/win32/api/objidl/ns-objidl-bind_opts3-r1) を参照。
%inst
このバインドコンテキストに格納されているバインドオプションを取得する。

[戻り値]
このメソッドは標準の戻り値 E_UNEXPECTED および S_OK を返すことがある。

[備考]
バインドコンテキストには、ほとんどの IMoniker
操作に共通で、複合モニカの各部分を処理する過程でも変化しないパラメーターのブロックが含まれる。呼び出し側へのメモ
独自のモニカクラスを作成する場合、通常このメソッドを呼び出す（IMoniker
インターフェースの実装が必要）。モニカクライアントによって指定されたパラメーターを取得するために呼び出す。このメソッドによって設定される構造体は初期化しておかなければならない。呼び出し前に
cbStruct メンバーを構造体のサイズに初期化しておく必要がある。


%index
IBindCtx_GetRunningObjectTable
このバインドコンテキストが動作しているコンピューターのランニングオブジェクトテーブル (ROT) へのインターフェースポインターを取得する。
%prm
this, pprot
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pprot : [comobj] ランニングオブジェクトテーブルへのインターフェースポインターを受け取る IRunningObjectTable* ポインター変数のアドレス。エラーが発生した場合 *pprot は NULL に設定される。*pprot が非 NULL の場合、実装はランニングテーブルオブジェクトに対して AddRef を呼び出す。Release を呼び出す責任は呼び出し側にある。
%inst
このバインドコンテキストが動作しているコンピューターのランニングオブジェクトテーブル (ROT)
へのインターフェースポインターを取得する。

[戻り値]
このメソッドは標準の戻り値 E_OUTOFMEMORY、E_UNEXPECTED、および S_OK を返すことがある。

[備考]
ランニングオブジェクトテーブル (ROT)
は各コンピューター上でグローバルにアクセス可能なテーブルで、現在実行中のオブジェクトをすべて追跡する。呼び出し側へのメモ
通常、新しいモニカクラスを実装する側（IMoniker
の実装を通じて）がこのメソッドを呼び出す。IMoniker::BindToObject や IMoniker::IsRunning
の実装内でオブジェクトが現在実行中かどうかを確認するのに便利である。また IMoniker::GetTimeOfLastChange
の実装内で、実行中オブジェクトが最後に変更された時刻を取得するためにも利用できる。モニカ実装では
GetRunningObjectTable 関数を使わずにこのメソッドを呼び出すべきである。これにより将来の IBindCtx
実装がバインド動作を変更する余地が残る。


%index
IBindCtx_RegisterObjectParam
バインドコンテキストの文字列キー付きポインターテーブルで、オブジェクトを文字列キーに関連付ける。
%prm
this, pszKey, punk
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pszKey : [wstr] オブジェクトを登録するバインドコンテキスト文字列キー。キー文字列の比較は大文字と小文字を区別する。
punk : [int] 登録するオブジェクトの IUnknown インターフェースへのポインター。メソッドはこのポインターに対して AddRef を呼び出す。
%inst
バインドコンテキストの文字列キー付きポインターテーブルで、オブジェクトを文字列キーに関連付ける。

[戻り値]
このメソッドは標準の戻り値 E_OUTOFMEMORY および S_OK を返すことがある。

[備考]

バインドコンテキストはインターフェースポインターのテーブルを保持し、それぞれが文字列キーに関連付けられている。これによりモニカ実装とバインド操作を開始した呼び出し側との間で通信が可能になる。一方がインターフェースポインターを双方で既知の文字列で格納しておけば、もう一方が後でバインドコンテキストから取り出すことができる。このメソッドを使用した後のバインド操作は
IBindCtx::GetObjectParam を使って格納されたポインターを取得できる。呼び出し側へのメモ
RegisterObjectParam は新しいモニカクラスを実装する側（IMoniker
の実装を通じて）とモニカクライアント（モニカを使ってオブジェクトへバインドする側）の双方に有用である。新しいモニカクラスを実装する際、モニカバインド中にエラーが発生した場合にエラーの原因を呼び出し側に通知するためにこのメソッドを呼び出す。このメソッドで使用するキーはエラー条件に依存する。以下によくあるモニカバインドエラーと、それぞれに適したキーを挙げる。
（以下省略）


%index
IBindCtx_GetObjectParam
バインドコンテキストの文字列キー付きポインターテーブルで、指定キーに関連付けられたオブジェクトへのインターフェースポインターを取得する。
%prm
this, pszKey, ppunk
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pszKey : [wstr] 検索対象のバインドコンテキスト文字列キー。キー文字列の比較は大文字と小文字を区別する。
ppunk : [int] pszKey に関連付けられたオブジェクトへのインターフェースポインターを受け取る IUnknown* ポインター変数のアドレス。成功時、実装は *ppunk に対して AddRef を呼び出す。Release を呼び出す責任は呼び出し側にある。エラーが発生した場合、実装は *ppunk を NULL に設定する。
%inst
バインドコンテキストの文字列キー付きポインターテーブルで、指定キーに関連付けられたオブジェクトへのインターフェースポインターを取得する。

[戻り値]
メソッドが成功した場合、戻り値は S_OK。そうでなければ E_FAIL。

[備考]

バインドコンテキストはインターフェースポインターのテーブルを保持し、それぞれが文字列キーに関連付けられている。これによりモニカ実装とバインド操作を開始した呼び出し側との間で通信が可能になる。このメソッドで取得できるポインターは、事前に
IBindCtx::RegisterObjectParam メソッドを使ってテーブルに挿入されている必要がある。呼び出し側へのメモ
他のオブジェクトを探すためにモニカを使用しているオブジェクトは、バインド操作に失敗したときにこのメソッドを呼び出して発生したエラーの具体的情報を取得できる。エラー内容によっては状況を修正してバインド操作を再試行することも可能である。詳細は
IBindCtx::RegisterObjectParam
を参照。モニカ実装では、呼び出し側がバインド操作を開始して具体的な情報を要求する状況を処理するためにこのメソッドを呼び出すことができる。慣例として、実装者はモニカクラスの
CLSID の文字列形式で始まるキー名を使用するべきである（StringFromCLSID 関数を参照）。


%index
IBindCtx_EnumObjectParam
バインドコンテキストの文字列キー付きポインターテーブルのキーを列挙するためのインターフェースへのポインターを取得する。
%prm
this, ppenum
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
ppenum : [comobj] 列挙子へのインターフェースポインターを受け取る IEnumString* ポインター変数のアドレス。エラーが発生した場合 *ppenum は NULL に設定される。*ppenum が非 NULL の場合、実装は *ppenum に対して AddRef を呼び出す。Release を呼び出す責任は呼び出し側にある。
%inst
バインドコンテキストの文字列キー付きポインターテーブルのキーを列挙するためのインターフェースへのポインターを取得する。

[戻り値]
このメソッドは標準の戻り値 E_OUTOFMEMORY および S_OK を返すことがある。

[備考]
列挙子が返すキーは、IBindCtx::RegisterObjectParam
への呼び出しで以前に指定されたものである。呼び出し側へのメモ
バインドコンテキストはインターフェースポインターのテーブルを保持し、それぞれが文字列キーに関連付けられている。これによりモニカ実装とバインド操作を開始した呼び出し側との間で通信が可能になる。一方がインターフェースポインターを双方で既知の文字列で格納しておけば、もう一方が後でバインドコンテキストから取り出すことができる。IBindCtx
インターフェースのシステム実装では、このメソッドは実装されていない。したがってこのメソッドを呼び出すと戻り値 E_NOTIMPL が返る。


%index
IBindCtx_RevokeObjectParam
バインドコンテキストの文字列キー付きオブジェクトテーブルから、指定キーとそれに関連付けられたポインターを削除する。このキーは事前に RegisterObjectParam の呼び出しでテーブルに挿入されている必要がある。
%prm
this, pszKey
this : [comobj] IBindCtx インターフェースの COM オブジェクト変数
pszKey : [wstr] 削除するバインドコンテキスト文字列キー。キー文字列の比較は大文字と小文字を区別する。
%inst
バインドコンテキストの文字列キー付きオブジェクトテーブルから、指定キーとそれに関連付けられたポインターを削除する。このキーは事前に
RegisterObjectParam の呼び出しでテーブルに挿入されている必要がある。

[戻り値]
このメソッドは以下の値を返すことがある。
（以下省略）

[備考]

バインドコンテキストはインターフェースポインターのテーブルを保持し、それぞれが文字列キーに関連付けられている。これによりモニカ実装とバインド操作を開始した呼び出し側との間で通信が可能になる。一方がインターフェースポインターを双方で既知の文字列で格納しておけば、もう一方が後でバインドコンテキストから取り出すことができる。このメソッドはテーブルからエントリーを削除するために使用する。指定キーが見つかった場合、バインドコンテキストはそのオブジェクトへの参照も解放する。


%index
IBinding_Abort
IBinding::Abort (vtable slot 3)
%prm
this
this : [comobj] IBinding インターフェースの COM オブジェクト変数
%inst


%index
IBinding_Suspend
IBinding::Suspend (vtable slot 4)
%prm
this
this : [comobj] IBinding インターフェースの COM オブジェクト変数
%inst


%index
IBinding_Resume
IBinding::Resume (vtable slot 5)
%prm
this
this : [comobj] IBinding インターフェースの COM オブジェクト変数
%inst


%index
IBinding_SetPriority
IBinding::SetPriority (vtable slot 6)
%prm
this, nPriority
this : [comobj] IBinding インターフェースの COM オブジェクト変数
nPriority : [int] 
%inst


%index
IBinding_GetPriority
IBinding::GetPriority (vtable slot 7)
%prm
this, pnPriority
this : [comobj] IBinding インターフェースの COM オブジェクト変数
pnPriority : [int] 
%inst


%index
IBinding_GetBindResult
IBinding::GetBindResult (vtable slot 8)
%prm
this, pclsidProtocol, pdwResult, pszResult, pdwReserved
this : [comobj] IBinding インターフェースの COM オブジェクト変数
pclsidProtocol : [var] 
pdwResult : [int] 
pszResult : [var] 
pdwReserved : [int] 
%inst


%index
IBindStatusCallback_OnStartBinding
IBindStatusCallback::OnStartBinding (vtable slot 3)
%prm
this, dwReserved, pib
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
dwReserved : [int] 
pib : [comobj] 
%inst


%index
IBindStatusCallback_GetPriority
IBindStatusCallback::GetPriority (vtable slot 4)
%prm
this, pnPriority
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
pnPriority : [int] 
%inst


%index
IBindStatusCallback_OnLowResource
IBindStatusCallback::OnLowResource (vtable slot 5)
%prm
this, reserved
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
reserved : [int] 
%inst


%index
IBindStatusCallback_OnProgress
IBindStatusCallback::OnProgress (vtable slot 6)
%prm
this, ulProgress, ulProgressMax, ulStatusCode, szStatusText
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
ulProgress : [int] 
ulProgressMax : [int] 
ulStatusCode : [int] 
szStatusText : [wstr] 
%inst


%index
IBindStatusCallback_OnStopBinding
IBindStatusCallback::OnStopBinding (vtable slot 7)
%prm
this, hresult, szError
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
hresult : [intptr] 
szError : [wstr] 
%inst


%index
IBindStatusCallback_GetBindInfo
IBindStatusCallback::GetBindInfo (vtable slot 8)
%prm
this, grfBINDF, pbindinfo
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
grfBINDF : [int] 
pbindinfo : [int] 
%inst


%index
IBindStatusCallback_OnDataAvailable
IBindStatusCallback::OnDataAvailable (vtable slot 9)
%prm
this, grfBSCF, dwSize, pformatetc, pstgmed
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
grfBSCF : [int] 
dwSize : [int] 
pformatetc : [var] 
pstgmed : [int] 
%inst


%index
IBindStatusCallback_OnObjectAvailable
IBindStatusCallback::OnObjectAvailable (vtable slot 10)
%prm
this, riid, punk
this : [comobj] IBindStatusCallback インターフェースの COM オブジェクト変数
riid : [var] 
punk : [int] 
%inst


%index
ID2D1Bitmap_GetFactory
ID2D1Bitmap::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1Bitmap_GetSize
デバイス非依存ピクセル (DIP) 単位でのビットマップのサイズを返す。
%prm
this
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
%inst
デバイス非依存ピクセル (DIP) 単位でのビットマップのサイズを返す。

[戻り値]
型: D2D1_SIZE_F ビットマップのサイズ（DIP 単位）。

[備考]
DIP は 1/96 インチである。デバイスピクセル単位のサイズを取得するには ID2D1Bitmap::GetPixelSize
メソッドを使用する。


%index
ID2D1Bitmap_GetPixelSize
デバイス依存単位（ピクセル）でのビットマップのサイズを返す。
%prm
this
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
%inst
デバイス依存単位（ピクセル）でのビットマップのサイズを返す。

[戻り値]
型: D2D1_SIZE_U ビットマップのサイズ（ピクセル単位）。


%index
ID2D1Bitmap_GetPixelFormat
ビットマップのピクセル形式とアルファモードを取得する。
%prm
this
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
%inst
ビットマップのピクセル形式とアルファモードを取得する。

[戻り値]
型: D2D1_PIXEL_FORMAT ビットマップのピクセル形式とアルファモード。


%index
ID2D1Bitmap_GetDpi
ビットマップの DPI (dots per inch) を返す。
%prm
this, dpiX, dpiY
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
dpiX : [float] 型: FLOAT* 画像の水平 DPI。このパラメーターの格納領域は呼び出し側が確保する必要がある。
dpiY : [float] 型: FLOAT* 画像の垂直 DPI。このパラメーターの格納領域は呼び出し側が確保する必要がある。
%inst
ビットマップの DPI (dots per inch) を返す。


%index
ID2D1Bitmap_CopyFromBitmap
指定したビットマップから指定した領域を現在のビットマップにコピーする。
%prm
this, destPoint, bitmap, srcRect
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
destPoint : [var] 型: const D2D1_POINT_2U* 現在のビットマップ内で、srcRect で指定された領域のコピー先となる左上隅。
bitmap : [comobj] 型: ID2D1Bitmap* コピー元のビットマップ。
srcRect : [var] 型: const D2D1_RECT_U* コピー元ビットマップ内のコピーする領域。
%inst
指定したビットマップから指定した領域を現在のビットマップにコピーする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]

このメソッドは現在のビットマップのサイズを更新しない。コピー元ビットマップの内容が現在のビットマップに収まらない場合、このメソッドは失敗する。またこのメソッドは形式変換を行わないため、ビットマップの形式が一致しない場合は失敗する。ビットマップが現在のバッチでアクティブな場合、このメソッドの呼び出しによって現在のバッチがフラッシュされることがある。フラッシュされたバッチが正常に完了しなかった場合、このメソッドは失敗する。ただしバッチがフラッシュされたレンダーターゲットのエラー状態はクリアされない。失敗した
HRESULT とタグ状態は次の EndDraw または Flush の呼び出し時に返される。Windows 8.1
以降、このメソッドはブロック圧縮ビットマップをサポートする。ブロック圧縮形式を使用する場合、srcRect パラメーターの終端座標は 4
の倍数でなければならず、そうでない場合は E_INVALIDARG を返す。


%index
ID2D1Bitmap_CopyFromRenderTarget
指定したレンダーターゲットの指定領域を現在のビットマップにコピーする。
%prm
this, destPoint, renderTarget, srcRect
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
destPoint : [var] 型: const D2D1_POINT_2U* 現在のビットマップ内で、srcRect で指定された領域のコピー先となる左上隅。
renderTarget : [comobj] 型: ID2D1RenderTarget* コピー元領域を含むレンダーターゲット。
srcRect : [var] 型: const D2D1_RECT_U* renderTarget 内のコピーする領域。
%inst
指定したレンダーターゲットの指定領域を現在のビットマップにコピーする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]

このメソッドは現在のビットマップのサイズを更新しない。コピー元ビットマップの内容が現在のビットマップに収まらない場合、このメソッドは失敗する。またこのメソッドは形式変換を行わないため、ビットマップの形式が一致しない場合は失敗する。ビットマップが現在のバッチでアクティブな場合、このメソッドの呼び出しによって現在のバッチがフラッシュされることがある。フラッシュされたバッチが正常に完了しなかった場合、このメソッドは失敗する。ただしバッチがフラッシュされたレンダーターゲットのエラー状態はクリアされない。失敗した
HRESULT とタグ状態は次の EndDraw または Flush
の呼び出し時に返される。このメソッドを呼び出す前に、すべてのクリップとレイヤーをレンダーターゲットからポップしておく必要がある。レンダーターゲットにクリップまたはレイヤーが適用されている場合、メソッドは
D2DERR_RENDER_TARGET_HAS_LAYER_OR_CLIPRECT を返す。


%index
ID2D1Bitmap_CopyFromMemory
メモリ上の指定領域を現在のビットマップにコピーする。
%prm
this, dstRect, srcData, pitch
this : [comobj] ID2D1Bitmap インターフェースの COM オブジェクト変数
dstRect : [var] 型: const D2D1_RECT_U* 現在のビットマップ内で、srcRect で指定された領域のコピー先となる矩形。
srcData : [intptr] 型: const void* コピーするデータ。
pitch : [int] 型: UINT32 srcData に格納されたコピー元ビットマップのストライド（ピッチ）。ストライドとはスキャンライン（メモリ上のピクセル 1 行）のバイト数である。ストライドは「ピクセル幅 * ピクセルあたりのバイト数 + メモリパディング」で算出できる。
%inst
メモリ上の指定領域を現在のビットマップにコピーする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]

このメソッドは現在のビットマップのサイズを更新しない。コピー元ビットマップの内容が現在のビットマップに収まらない場合、このメソッドは失敗する。またこのメソッドは形式変換を行わないため、2
つのビットマップの形式は一致している必要がある。このメソッドに無効な入力（無効なコピー先矩形など）を渡すと、歪んだ画像やデバイス障害など予測不能な結果を生じることがある。ビットマップが現在のバッチでアクティブな場合、このメソッドの呼び出しによって現在のバッチがフラッシュされることがある。フラッシュされたバッチが正常に完了しなかった場合、このメソッドは失敗する。ただしバッチがフラッシュされたレンダーターゲットのエラー状態はクリアされない。失敗した
HRESULT とタグ状態は次の EndDraw または Flush の呼び出し時に返される。Windows 8.1
以降、このメソッドはブロック圧縮ビットマップをサポートする。ブロック圧縮形式を使用する場合、srcRect パラメーターの終端座標は 4
の倍数でなければならず、そうでない場合は E_INVALIDARG を返す。


%index
ID2D1BitmapBrush_GetFactory
ID2D1BitmapBrush::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1BitmapBrush_SetOpacity
ID2D1BitmapBrush::SetOpacity (vtable slot 4)
%prm
this, opacity
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
opacity : [float] 
%inst


%index
ID2D1BitmapBrush_SetTransform
ID2D1BitmapBrush::SetTransform (vtable slot 5)
%prm
this, transform
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1BitmapBrush_GetOpacity
ID2D1BitmapBrush::GetOpacity (vtable slot 6)
%prm
this
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapBrush_GetTransform
ID2D1BitmapBrush::GetTransform (vtable slot 7)
%prm
this, transform
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1BitmapBrush_SetExtendModeX
ビットマップの範囲外の領域をブラシが水平方向にどのようにタイル表示するかを指定する。
%prm
this, extendModeX
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
extendModeX : [int] 型: D2D1_EXTEND_MODE ビットマップの範囲外の領域をブラシが水平方向にどのようにタイル表示するかを示す値。
%inst
ビットマップの範囲外の領域をブラシが水平方向にどのようにタイル表示するかを指定する。

[備考]
ビットマップブラシのビットマップが描画対象の領域を完全に埋めきれない場合がある。そのようなとき、Direct2D はブラシの水平方向
(SetExtendModeX) および垂直方向 (SetExtendModeY)
の拡張モード設定に基づいて残りの領域の埋め方を決定する。次の図は、ID2D1BitmapBrush に対する拡張モードの組み合わせ
(D2D1_EXTEND_MODE_CLAMP (CLAMP)、D2D1_EXTEND_MODE_WRAP
(WRAP)、D2D1_EXTEND_MIRROR (MIRROR)) の結果を示している。
（以下省略）


%index
ID2D1BitmapBrush_SetExtendModeY
ビットマップの範囲外の領域をブラシが垂直方向にどのようにタイル表示するかを指定する。
%prm
this, extendModeY
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
extendModeY : [int] 型: D2D1_EXTEND_MODE ビットマップの範囲外の領域をブラシが垂直方向にどのようにタイル表示するかを示す値。
%inst
ビットマップの範囲外の領域をブラシが垂直方向にどのようにタイル表示するかを指定する。

[備考]
ビットマップブラシのビットマップが描画対象の領域を完全に埋めきれない場合がある。そのようなとき、Direct2D はブラシの水平方向
(SetExtendModeX) および垂直方向 (SetExtendModeY)
の拡張モード設定に基づいて残りの領域の埋め方を決定する。次の図は、ID2D1BitmapBrush に対する拡張モードの組み合わせ
(D2D1_EXTEND_MODE_CLAMP (CLAMP)、D2D1_EXTEND_MODE_WRAP
(WRAP)、D2D1_EXTEND_MIRROR (MIRROR)) の結果を示している。
（以下省略）


%index
ID2D1BitmapBrush_SetInterpolationMode
ブラシのビットマップが拡大縮小または回転された際に使用される補間モードを指定する。
%prm
this, interpolationMode
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
interpolationMode : [int] 型: D2D1_BITMAP_INTERPOLATION_MODE ブラシのビットマップが拡大縮小または回転された際に使用される補間モード。
%inst
ブラシのビットマップが拡大縮小または回転された際に使用される補間モードを指定する。

[備考]
このメソッドはビットマップの補間モードを設定する。補間モードは D2D1_BITMAP_INTERPOLATION_MODE
列挙型で指定される列挙値である。D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR
は最近傍フィルタリングを表し、現在のレンダリングピクセルに最も近いビットマップピクセルを参照してその色をそのまま選択する。D2D1_BITMAP_INTERPOLATION_MODE_LINEAR
は線形フィルタリングを表し、最も近い 4
つのビットマップピクセルから色を補間する。ビットマップの補間モードはサブピクセル移動にも影響する。サブピクセル移動では、双線形補間によりアプリケーションの要求に対してビットマップがより精密に配置されるが、その過程でビットマップはぼかされる。


%index
ID2D1BitmapBrush_SetBitmap
このブラシが描画に使うビットマップソースを指定する。
%prm
this, bitmap
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
bitmap : [comobj] 型: ID2D1Bitmap* ブラシが使うビットマップソース。
%inst
このブラシが描画に使うビットマップソースを指定する。

[備考]

このメソッドはこのブラシが描画に使うビットマップソースを指定する。ビットマップは塗りつぶす対象のジオメトリに合わせて自動的にリサイズやリスケールされることはなく、ネイティブサイズのまま維持される。ビットマップをリサイズまたは平行移動したい場合は、SetTransform
メソッドでブラシにトランスフォームを適用する。ビットマップのネイティブサイズは、ビットマップピクセル単位の幅と高さをビットマップの DPI
で割った値である。このネイティブサイズがブラシの基本タイルとなる。ビットマップの部分領域をタイル表示したい場合は、その部分領域を含む新しいビットマップを生成し、SetBitmap
でブラシに適用する必要がある。


%index
ID2D1BitmapBrush_GetExtendModeX
ビットマップの範囲外の領域をブラシが水平方向にどのようにタイル表示するかを示す方式を取得する。
%prm
this
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
%inst
ビットマップの範囲外の領域をブラシが水平方向にどのようにタイル表示するかを示す方式を取得する。

[戻り値]
型: D2D1_EXTEND_MODE ビットマップの範囲外の領域をブラシが水平方向にどのようにタイル表示するかを示す値。

[備考]
すべてのブラシと同じく、ID2D1BitmapBrush
は無限平面のコンテンツを定義する。ビットマップは有限であるため、水平方向および垂直方向に平面をどう埋めるかを決定するために拡張モードを利用する。


%index
ID2D1BitmapBrush_GetExtendModeY
ビットマップの範囲外の領域をブラシが垂直方向にどのようにタイル表示するかを示す方式を取得する。
%prm
this
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
%inst
ビットマップの範囲外の領域をブラシが垂直方向にどのようにタイル表示するかを示す方式を取得する。

[戻り値]
型: D2D1_EXTEND_MODE ビットマップの範囲外の領域をブラシが垂直方向にどのようにタイル表示するかを示す値。

[備考]
すべてのブラシと同じく、ID2D1BitmapBrush
は無限平面のコンテンツを定義する。ビットマップは有限であるため、水平方向および垂直方向に平面をどう埋めるかを決定するために拡張モードを利用する。


%index
ID2D1BitmapBrush_GetInterpolationMode
ブラシのビットマップが拡大縮小または回転された際に使用される補間方式を取得する。
%prm
this
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
%inst
ブラシのビットマップが拡大縮小または回転された際に使用される補間方式を取得する。

[戻り値]
型: D2D1_BITMAP_INTERPOLATION_MODE ブラシのビットマップが拡大縮小または回転された際に使用される補間方式。

[備考]
このメソッドはビットマップの補間モードを取得する。補間モードは D2D1_BITMAP_INTERPOLATION_MODE
列挙型で指定される。D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR
は最近傍フィルタリングを表す。これは現在のレンダリングピクセルに最も近いビットマップピクセルを参照し、その色をそのまま選択する。D2D1_BITMAP_INTERPOLATION_MODE_LINEAR
は線形フィルタリングを表し、最も近い 4
つのビットマップピクセルから色を補間する。ビットマップの補間モードはサブピクセル移動にも影響する。サブピクセル移動では、線形補間によりアプリケーションの要求に対してビットマップがより精密に配置されるが、その過程でビットマップはぼかされる。


%index
ID2D1BitmapBrush_GetBitmap
このブラシが描画に使うビットマップソースを取得する。
%prm
this, bitmap
this : [comobj] ID2D1BitmapBrush インターフェースの COM オブジェクト変数
bitmap : [comobj] 型: ID2D1Bitmap** このメソッドが返るとき、このブラシが描画に使うビットマップへのポインタのアドレスを格納する。
%inst
このブラシが描画に使うビットマップソースを取得する。


%index
ID2D1BitmapRenderTarget_GetFactory
ID2D1BitmapRenderTarget::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateBitmap
ID2D1BitmapRenderTarget::CreateBitmap (vtable slot 4)
%prm
this, size, srcData, pitch, bitmapProperties, bitmap
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
size : [int] 
srcData : [intptr] 
pitch : [int] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateBitmapFromWicBitmap
ID2D1BitmapRenderTarget::CreateBitmapFromWicBitmap (vtable slot 5)
%prm
this, wicBitmapSource, bitmapProperties, bitmap
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
wicBitmapSource : [comobj] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateSharedBitmap
ID2D1BitmapRenderTarget::CreateSharedBitmap (vtable slot 6)
%prm
this, riid, data, bitmapProperties, bitmap
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
riid : [var] 
data : [intptr] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateBitmapBrush
ID2D1BitmapRenderTarget::CreateBitmapBrush (vtable slot 7)
%prm
this, bitmap, bitmapBrushProperties, brushProperties, bitmapBrush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
bitmapBrushProperties : [var] 
brushProperties : [var] 
bitmapBrush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateSolidColorBrush
ID2D1BitmapRenderTarget::CreateSolidColorBrush (vtable slot 8)
%prm
this, color, brushProperties, solidColorBrush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
color : [var] 
brushProperties : [var] 
solidColorBrush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateGradientStopCollection
ID2D1BitmapRenderTarget::CreateGradientStopCollection (vtable slot 9)
%prm
this, gradientStops, gradientStopsCount, colorInterpolationGamma, extendMode, gradientStopCollection
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
gradientStops : [var] 
gradientStopsCount : [int] 
colorInterpolationGamma : [int] 
extendMode : [int] 
gradientStopCollection : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateLinearGradientBrush
ID2D1BitmapRenderTarget::CreateLinearGradientBrush (vtable slot 10)
%prm
this, linearGradientBrushProperties, brushProperties, gradientStopCollection, linearGradientBrush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
linearGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
linearGradientBrush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateRadialGradientBrush
ID2D1BitmapRenderTarget::CreateRadialGradientBrush (vtable slot 11)
%prm
this, radialGradientBrushProperties, brushProperties, gradientStopCollection, radialGradientBrush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
radialGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
radialGradientBrush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateCompatibleRenderTarget
ID2D1BitmapRenderTarget::CreateCompatibleRenderTarget (vtable slot 12)
%prm
this, desiredSize, desiredPixelSize, desiredFormat, options, bitmapRenderTarget
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
desiredSize : [var] 
desiredPixelSize : [var] 
desiredFormat : [var] 
options : [int] 
bitmapRenderTarget : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateLayer
ID2D1BitmapRenderTarget::CreateLayer (vtable slot 13)
%prm
this, size, layer
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
size : [var] 
layer : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_CreateMesh
ID2D1BitmapRenderTarget::CreateMesh (vtable slot 14)
%prm
this, mesh
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_DrawLine
ID2D1BitmapRenderTarget::DrawLine (vtable slot 15)
%prm
this, point0, point1, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
point0 : [int] 
point1 : [int] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_DrawRectangle
ID2D1BitmapRenderTarget::DrawRectangle (vtable slot 16)
%prm
this, rect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_FillRectangle
ID2D1BitmapRenderTarget::FillRectangle (vtable slot 17)
%prm
this, rect, brush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_DrawRoundedRectangle
ID2D1BitmapRenderTarget::DrawRoundedRectangle (vtable slot 18)
%prm
this, roundedRect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_FillRoundedRectangle
ID2D1BitmapRenderTarget::FillRoundedRectangle (vtable slot 19)
%prm
this, roundedRect, brush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_DrawEllipse
ID2D1BitmapRenderTarget::DrawEllipse (vtable slot 20)
%prm
this, ellipse, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_FillEllipse
ID2D1BitmapRenderTarget::FillEllipse (vtable slot 21)
%prm
this, ellipse, brush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_DrawGeometry
ID2D1BitmapRenderTarget::DrawGeometry (vtable slot 22)
%prm
this, geometry, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_FillGeometry
ID2D1BitmapRenderTarget::FillGeometry (vtable slot 23)
%prm
this, geometry, brush, opacityBrush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 
brush : [comobj] 
opacityBrush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_FillMesh
ID2D1BitmapRenderTarget::FillMesh (vtable slot 24)
%prm
this, mesh, brush
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 
brush : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_FillOpacityMask
ID2D1BitmapRenderTarget::FillOpacityMask (vtable slot 25)
%prm
this, opacityMask, brush, content, destinationRectangle, sourceRectangle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
opacityMask : [comobj] 
brush : [comobj] 
content : [int] 
destinationRectangle : [var] 
sourceRectangle : [var] 
%inst


%index
ID2D1BitmapRenderTarget_DrawBitmap
ID2D1BitmapRenderTarget::DrawBitmap (vtable slot 26)
%prm
this, bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
destinationRectangle : [var] 
opacity : [float] 
interpolationMode : [int] 
sourceRectangle : [var] 
%inst


%index
ID2D1BitmapRenderTarget_DrawText
ID2D1BitmapRenderTarget::DrawText (vtable slot 27)
%prm
this, string, stringLength, textFormat, layoutRect, defaultFillBrush, options, measuringMode
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
string : [int] 
stringLength : [int] 
textFormat : [comobj] 
layoutRect : [var] 
defaultFillBrush : [comobj] 
options : [int] 
measuringMode : [int] 
%inst


%index
ID2D1BitmapRenderTarget_DrawTextLayout
ID2D1BitmapRenderTarget::DrawTextLayout (vtable slot 28)
%prm
this, origin, textLayout, defaultFillBrush, options
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
origin : [int] 
textLayout : [comobj] 
defaultFillBrush : [comobj] 
options : [int] 
%inst


%index
ID2D1BitmapRenderTarget_DrawGlyphRun
ID2D1BitmapRenderTarget::DrawGlyphRun (vtable slot 29)
%prm
this, baselineOrigin, glyphRun, foregroundBrush, measuringMode
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
baselineOrigin : [int] 
glyphRun : [int] 
foregroundBrush : [comobj] 
measuringMode : [int] 
%inst


%index
ID2D1BitmapRenderTarget_SetTransform
ID2D1BitmapRenderTarget::SetTransform (vtable slot 30)
%prm
this, transform
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1BitmapRenderTarget_GetTransform
ID2D1BitmapRenderTarget::GetTransform (vtable slot 31)
%prm
this, transform
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1BitmapRenderTarget_SetAntialiasMode
ID2D1BitmapRenderTarget::SetAntialiasMode (vtable slot 32)
%prm
this, antialiasMode
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
antialiasMode : [int] 
%inst


%index
ID2D1BitmapRenderTarget_GetAntialiasMode
ID2D1BitmapRenderTarget::GetAntialiasMode (vtable slot 33)
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_SetTextAntialiasMode
ID2D1BitmapRenderTarget::SetTextAntialiasMode (vtable slot 34)
%prm
this, textAntialiasMode
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
textAntialiasMode : [int] 
%inst


%index
ID2D1BitmapRenderTarget_GetTextAntialiasMode
ID2D1BitmapRenderTarget::GetTextAntialiasMode (vtable slot 35)
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_SetTextRenderingParams
ID2D1BitmapRenderTarget::SetTextRenderingParams (vtable slot 36)
%prm
this, textRenderingParams
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_GetTextRenderingParams
ID2D1BitmapRenderTarget::GetTextRenderingParams (vtable slot 37)
%prm
this, textRenderingParams
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_SetTags
ID2D1BitmapRenderTarget::SetTags (vtable slot 38)
%prm
this, tag1, tag2
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
tag1 : [int64] 
tag2 : [int64] 
%inst


%index
ID2D1BitmapRenderTarget_GetTags
ID2D1BitmapRenderTarget::GetTags (vtable slot 39)
%prm
this, tag1, tag2
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1BitmapRenderTarget_PushLayer
ID2D1BitmapRenderTarget::PushLayer (vtable slot 40)
%prm
this, layerParameters, layer
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
layerParameters : [int] 
layer : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_PopLayer
ID2D1BitmapRenderTarget::PopLayer (vtable slot 41)
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_Flush
ID2D1BitmapRenderTarget::Flush (vtable slot 42)
%prm
this, tag1, tag2
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1BitmapRenderTarget_SaveDrawingState
ID2D1BitmapRenderTarget::SaveDrawingState (vtable slot 43)
%prm
this, drawingStateBlock
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_RestoreDrawingState
ID2D1BitmapRenderTarget::RestoreDrawingState (vtable slot 44)
%prm
this, drawingStateBlock
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 
%inst


%index
ID2D1BitmapRenderTarget_PushAxisAlignedClip
ID2D1BitmapRenderTarget::PushAxisAlignedClip (vtable slot 45)
%prm
this, clipRect, antialiasMode
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
clipRect : [var] 
antialiasMode : [int] 
%inst


%index
ID2D1BitmapRenderTarget_PopAxisAlignedClip
ID2D1BitmapRenderTarget::PopAxisAlignedClip (vtable slot 46)
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_Clear
ID2D1BitmapRenderTarget::Clear (vtable slot 47)
%prm
this, clearColor
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
clearColor : [var] 
%inst


%index
ID2D1BitmapRenderTarget_BeginDraw
ID2D1BitmapRenderTarget::BeginDraw (vtable slot 48)
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_EndDraw
ID2D1BitmapRenderTarget::EndDraw (vtable slot 49)
%prm
this, tag1, tag2
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1BitmapRenderTarget_GetPixelFormat
ID2D1BitmapRenderTarget::GetPixelFormat (vtable slot 50)
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_SetDpi
ID2D1BitmapRenderTarget::SetDpi (vtable slot 51)
%prm
this, dpiX, dpiY
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 
dpiY : [float] 
%inst


%index
ID2D1BitmapRenderTarget_GetDpi
ID2D1BitmapRenderTarget::GetDpi (vtable slot 52)
%prm
this, dpiX, dpiY
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 
dpiY : [float] 
%inst


%index
ID2D1BitmapRenderTarget_GetSize
ID2D1BitmapRenderTarget::GetSize (vtable slot 53)
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_GetPixelSize
ID2D1BitmapRenderTarget::GetPixelSize (vtable slot 54)
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_GetMaximumBitmapSize
ID2D1BitmapRenderTarget::GetMaximumBitmapSize (vtable slot 55)
%prm
this
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1BitmapRenderTarget_IsSupported
ID2D1BitmapRenderTarget::IsSupported (vtable slot 56)
%prm
this, renderTargetProperties
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
renderTargetProperties : [var] 
%inst


%index
ID2D1BitmapRenderTarget_GetBitmap
このレンダーターゲット用のビットマップを取得する。返されるビットマップは描画操作に使用できる。
%prm
this, bitmap
this : [comobj] ID2D1BitmapRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 型: ID2D1Bitmap** このメソッドが返るとき、このレンダーターゲット用のビットマップへのポインタのアドレスを格納する。このビットマップは描画操作に使用できる。
%inst
このレンダーターゲット用のビットマップを取得する。返されるビットマップは描画操作に使用できる。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
GetBitmap で取得した ID2D1Bitmap の DPI は、ID2D1BitmapRenderTarget
が作成された時点での DPI となる。SetDpi の呼び出しによって ID2D1BitmapRenderTarget の DPI
を変更しても、たとえそれが GetBitmap の前であっても、ビットマップ自体の DPI は変化しない。SetDpi で
ID2D1BitmapRenderTarget の DPI
を変更すると、ビットマップへ描画される内容のレンダリング方法には影響するが、GetBitmap で取得されるビットマップの DPI
には影響しない。


%index
ID2D1Brush_GetFactory
ID2D1Brush::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1Brush インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1Brush_SetOpacity
このブラシの不透明度を設定する。
%prm
this, opacity
this : [comobj] ID2D1Brush インターフェースの COM オブジェクト変数
opacity : [float] 型: FLOAT ブラシの不透明度を示す 0 から 1 までの値。この値はブラシによって塗りつぶされるすべてのピクセルのアルファ値に対する線形スケーリング係数として作用する定数倍率である。不透明度の値は乗算前に 0?1 の範囲にクランプされる。
%inst
このブラシの不透明度を設定する。


%index
ID2D1Brush_SetTransform
ブラシに適用する変換を設定する。
%prm
this, transform
this : [comobj] ID2D1Brush インターフェースの COM オブジェクト変数
transform : [var] 
%inst
ブラシに適用する変換を設定する。

[備考]

ブラシで描画する際は、レンダーターゲットの座標空間で塗りつぶしが行われる。ブラシは描画対象に整列するよう自動的に位置を合わせるわけではなく、デフォルトではレンダーターゲットの原点
(0, 0)
から描画を開始する。[**ID2D1LinearGradientBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1lineargradientbrush)
で定義されたグラデーションは、開始点と終了点を設定することで対象領域へ「移動」できる。同様に
[**ID2D1RadialGradientBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1radialgradientbrush)
で定義されたグラデーションは中心と半径を変更することで移動できる。[**ID2D1BitmapBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush)
の内容を塗りつぶし対象領域に整列させたい場合は **SetTransform**
メソッドを使ってビットマップを目的の位置へ平行移動できる。この変換はブラシのみに作用し、レンダーターゲットによって描画される他のコンテンツには影響しない。次の図は
(100, 100) に位置する矩形を
[**ID2D1BitmapBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush)
で塗りつぶしたときの効果を示す。左の図はブラシを変換しないまま矩形を塗りつぶした結果で、ビットマップはレンダーターゲットの原点に描画される。その結果、矩形にはビットマップの一部しか現れない。右の図は
[**ID2D1BitmapBrush**](/windows/win32/api/d2d1/nn-d2d1-id2d1bitmapbrush)
を変換してその内容を右へ 50 ピクセル、下へ 50
ピクセルずらした結果で、ビットマップが矩形を埋めている。![変換していないブラシで塗られた正方形と、変換したブラシで塗られた正方形を示す図](images/brushes-ovw-transform.png)


%index
ID2D1Brush_GetOpacity
このブラシの不透明度を取得する。
%prm
this
this : [comobj] ID2D1Brush インターフェースの COM オブジェクト変数
%inst
このブラシの不透明度を取得する。

[戻り値]
型: FLOAT ブラシの不透明度を示す 0 から 1
までの値。この値はブラシによって塗りつぶされるすべてのピクセルのアルファ値に対する線形スケーリング係数として作用する定数倍率である。不透明度の値は乗算前に
0?1 の範囲にクランプされる。


%index
ID2D1Brush_GetTransform
このブラシに適用されている変換を取得する。
%prm
this, transform
this : [comobj] ID2D1Brush インターフェースの COM オブジェクト変数
transform : [var] 型: D2D1_MATRIX_3X2_F* このブラシに適用されている変換。
%inst
このブラシに適用されている変換を取得する。

[備考]
ブラシの変換が単位行列の場合、ブラシは描画されるレンダーターゲットと同じ座標空間に出現する。


%index
ID2D1DCRenderTarget_GetFactory
ID2D1DCRenderTarget::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateBitmap
ID2D1DCRenderTarget::CreateBitmap (vtable slot 4)
%prm
this, size, srcData, pitch, bitmapProperties, bitmap
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
size : [int] 
srcData : [intptr] 
pitch : [int] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateBitmapFromWicBitmap
ID2D1DCRenderTarget::CreateBitmapFromWicBitmap (vtable slot 5)
%prm
this, wicBitmapSource, bitmapProperties, bitmap
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
wicBitmapSource : [comobj] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateSharedBitmap
ID2D1DCRenderTarget::CreateSharedBitmap (vtable slot 6)
%prm
this, riid, data, bitmapProperties, bitmap
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
riid : [var] 
data : [intptr] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateBitmapBrush
ID2D1DCRenderTarget::CreateBitmapBrush (vtable slot 7)
%prm
this, bitmap, bitmapBrushProperties, brushProperties, bitmapBrush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
bitmapBrushProperties : [var] 
brushProperties : [var] 
bitmapBrush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateSolidColorBrush
ID2D1DCRenderTarget::CreateSolidColorBrush (vtable slot 8)
%prm
this, color, brushProperties, solidColorBrush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
color : [var] 
brushProperties : [var] 
solidColorBrush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateGradientStopCollection
ID2D1DCRenderTarget::CreateGradientStopCollection (vtable slot 9)
%prm
this, gradientStops, gradientStopsCount, colorInterpolationGamma, extendMode, gradientStopCollection
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
gradientStops : [var] 
gradientStopsCount : [int] 
colorInterpolationGamma : [int] 
extendMode : [int] 
gradientStopCollection : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateLinearGradientBrush
ID2D1DCRenderTarget::CreateLinearGradientBrush (vtable slot 10)
%prm
this, linearGradientBrushProperties, brushProperties, gradientStopCollection, linearGradientBrush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
linearGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
linearGradientBrush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateRadialGradientBrush
ID2D1DCRenderTarget::CreateRadialGradientBrush (vtable slot 11)
%prm
this, radialGradientBrushProperties, brushProperties, gradientStopCollection, radialGradientBrush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
radialGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
radialGradientBrush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateCompatibleRenderTarget
ID2D1DCRenderTarget::CreateCompatibleRenderTarget (vtable slot 12)
%prm
this, desiredSize, desiredPixelSize, desiredFormat, options, bitmapRenderTarget
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
desiredSize : [var] 
desiredPixelSize : [var] 
desiredFormat : [var] 
options : [int] 
bitmapRenderTarget : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateLayer
ID2D1DCRenderTarget::CreateLayer (vtable slot 13)
%prm
this, size, layer
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
size : [var] 
layer : [comobj] 
%inst


%index
ID2D1DCRenderTarget_CreateMesh
ID2D1DCRenderTarget::CreateMesh (vtable slot 14)
%prm
this, mesh
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 
%inst


%index
ID2D1DCRenderTarget_DrawLine
ID2D1DCRenderTarget::DrawLine (vtable slot 15)
%prm
this, point0, point1, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
point0 : [int] 
point1 : [int] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1DCRenderTarget_DrawRectangle
ID2D1DCRenderTarget::DrawRectangle (vtable slot 16)
%prm
this, rect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1DCRenderTarget_FillRectangle
ID2D1DCRenderTarget::FillRectangle (vtable slot 17)
%prm
this, rect, brush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_DrawRoundedRectangle
ID2D1DCRenderTarget::DrawRoundedRectangle (vtable slot 18)
%prm
this, roundedRect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1DCRenderTarget_FillRoundedRectangle
ID2D1DCRenderTarget::FillRoundedRectangle (vtable slot 19)
%prm
this, roundedRect, brush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_DrawEllipse
ID2D1DCRenderTarget::DrawEllipse (vtable slot 20)
%prm
this, ellipse, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1DCRenderTarget_FillEllipse
ID2D1DCRenderTarget::FillEllipse (vtable slot 21)
%prm
this, ellipse, brush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_DrawGeometry
ID2D1DCRenderTarget::DrawGeometry (vtable slot 22)
%prm
this, geometry, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1DCRenderTarget_FillGeometry
ID2D1DCRenderTarget::FillGeometry (vtable slot 23)
%prm
this, geometry, brush, opacityBrush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 
brush : [comobj] 
opacityBrush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_FillMesh
ID2D1DCRenderTarget::FillMesh (vtable slot 24)
%prm
this, mesh, brush
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 
brush : [comobj] 
%inst


%index
ID2D1DCRenderTarget_FillOpacityMask
ID2D1DCRenderTarget::FillOpacityMask (vtable slot 25)
%prm
this, opacityMask, brush, content, destinationRectangle, sourceRectangle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
opacityMask : [comobj] 
brush : [comobj] 
content : [int] 
destinationRectangle : [var] 
sourceRectangle : [var] 
%inst


%index
ID2D1DCRenderTarget_DrawBitmap
ID2D1DCRenderTarget::DrawBitmap (vtable slot 26)
%prm
this, bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
destinationRectangle : [var] 
opacity : [float] 
interpolationMode : [int] 
sourceRectangle : [var] 
%inst


%index
ID2D1DCRenderTarget_DrawText
ID2D1DCRenderTarget::DrawText (vtable slot 27)
%prm
this, string, stringLength, textFormat, layoutRect, defaultFillBrush, options, measuringMode
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
string : [int] 
stringLength : [int] 
textFormat : [comobj] 
layoutRect : [var] 
defaultFillBrush : [comobj] 
options : [int] 
measuringMode : [int] 
%inst


%index
ID2D1DCRenderTarget_DrawTextLayout
ID2D1DCRenderTarget::DrawTextLayout (vtable slot 28)
%prm
this, origin, textLayout, defaultFillBrush, options
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
origin : [int] 
textLayout : [comobj] 
defaultFillBrush : [comobj] 
options : [int] 
%inst


%index
ID2D1DCRenderTarget_DrawGlyphRun
ID2D1DCRenderTarget::DrawGlyphRun (vtable slot 29)
%prm
this, baselineOrigin, glyphRun, foregroundBrush, measuringMode
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
baselineOrigin : [int] 
glyphRun : [int] 
foregroundBrush : [comobj] 
measuringMode : [int] 
%inst


%index
ID2D1DCRenderTarget_SetTransform
ID2D1DCRenderTarget::SetTransform (vtable slot 30)
%prm
this, transform
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1DCRenderTarget_GetTransform
ID2D1DCRenderTarget::GetTransform (vtable slot 31)
%prm
this, transform
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1DCRenderTarget_SetAntialiasMode
ID2D1DCRenderTarget::SetAntialiasMode (vtable slot 32)
%prm
this, antialiasMode
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
antialiasMode : [int] 
%inst


%index
ID2D1DCRenderTarget_GetAntialiasMode
ID2D1DCRenderTarget::GetAntialiasMode (vtable slot 33)
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_SetTextAntialiasMode
ID2D1DCRenderTarget::SetTextAntialiasMode (vtable slot 34)
%prm
this, textAntialiasMode
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
textAntialiasMode : [int] 
%inst


%index
ID2D1DCRenderTarget_GetTextAntialiasMode
ID2D1DCRenderTarget::GetTextAntialiasMode (vtable slot 35)
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_SetTextRenderingParams
ID2D1DCRenderTarget::SetTextRenderingParams (vtable slot 36)
%prm
this, textRenderingParams
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 
%inst


%index
ID2D1DCRenderTarget_GetTextRenderingParams
ID2D1DCRenderTarget::GetTextRenderingParams (vtable slot 37)
%prm
this, textRenderingParams
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 
%inst


%index
ID2D1DCRenderTarget_SetTags
ID2D1DCRenderTarget::SetTags (vtable slot 38)
%prm
this, tag1, tag2
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
tag1 : [int64] 
tag2 : [int64] 
%inst


%index
ID2D1DCRenderTarget_GetTags
ID2D1DCRenderTarget::GetTags (vtable slot 39)
%prm
this, tag1, tag2
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1DCRenderTarget_PushLayer
ID2D1DCRenderTarget::PushLayer (vtable slot 40)
%prm
this, layerParameters, layer
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
layerParameters : [int] 
layer : [comobj] 
%inst


%index
ID2D1DCRenderTarget_PopLayer
ID2D1DCRenderTarget::PopLayer (vtable slot 41)
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_Flush
ID2D1DCRenderTarget::Flush (vtable slot 42)
%prm
this, tag1, tag2
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1DCRenderTarget_SaveDrawingState
ID2D1DCRenderTarget::SaveDrawingState (vtable slot 43)
%prm
this, drawingStateBlock
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 
%inst


%index
ID2D1DCRenderTarget_RestoreDrawingState
ID2D1DCRenderTarget::RestoreDrawingState (vtable slot 44)
%prm
this, drawingStateBlock
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 
%inst


%index
ID2D1DCRenderTarget_PushAxisAlignedClip
ID2D1DCRenderTarget::PushAxisAlignedClip (vtable slot 45)
%prm
this, clipRect, antialiasMode
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
clipRect : [var] 
antialiasMode : [int] 
%inst


%index
ID2D1DCRenderTarget_PopAxisAlignedClip
ID2D1DCRenderTarget::PopAxisAlignedClip (vtable slot 46)
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_Clear
ID2D1DCRenderTarget::Clear (vtable slot 47)
%prm
this, clearColor
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
clearColor : [var] 
%inst


%index
ID2D1DCRenderTarget_BeginDraw
ID2D1DCRenderTarget::BeginDraw (vtable slot 48)
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_EndDraw
ID2D1DCRenderTarget::EndDraw (vtable slot 49)
%prm
this, tag1, tag2
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1DCRenderTarget_GetPixelFormat
ID2D1DCRenderTarget::GetPixelFormat (vtable slot 50)
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_SetDpi
ID2D1DCRenderTarget::SetDpi (vtable slot 51)
%prm
this, dpiX, dpiY
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 
dpiY : [float] 
%inst


%index
ID2D1DCRenderTarget_GetDpi
ID2D1DCRenderTarget::GetDpi (vtable slot 52)
%prm
this, dpiX, dpiY
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 
dpiY : [float] 
%inst


%index
ID2D1DCRenderTarget_GetSize
ID2D1DCRenderTarget::GetSize (vtable slot 53)
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_GetPixelSize
ID2D1DCRenderTarget::GetPixelSize (vtable slot 54)
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_GetMaximumBitmapSize
ID2D1DCRenderTarget::GetMaximumBitmapSize (vtable slot 55)
%prm
this
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1DCRenderTarget_IsSupported
ID2D1DCRenderTarget::IsSupported (vtable slot 56)
%prm
this, renderTargetProperties
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
renderTargetProperties : [var] 
%inst


%index
ID2D1DCRenderTarget_BindDC
レンダーターゲットを、描画コマンドを発行するデバイスコンテキストにバインドする。
%prm
this, hDC, pSubRect
this : [comobj] ID2D1DCRenderTarget インターフェースの COM オブジェクト変数
hDC : [intptr] 型: const HDC レンダーターゲットが描画コマンドを発行する対象となるデバイスコンテキスト。
pSubRect : [var] 型: const RECT* レンダーターゲットがバインドされるデバイスコンテキスト (HDC) ハンドルの寸法。
%inst
レンダーターゲットを、描画コマンドを発行するデバイスコンテキストにバインドする。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
DC レンダーターゲットでレンダリングする前に、その BindDC メソッドを使って GDI DC と関連付ける必要がある。異なる DC
を使うたび、または描画したい領域のサイズが変わるたびにこの操作を行う。


%index
ID2D1DrawingStateBlock_GetFactory
ID2D1DrawingStateBlock::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1DrawingStateBlock インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1DrawingStateBlock_GetDescription
描画状態のうちアンチエイリアスモード、変換、タグの部分を取得する。
%prm
this, stateDescription
this : [comobj] ID2D1DrawingStateBlock インターフェースの COM オブジェクト変数
stateDescription : [var] 型: D2D1_DRAWING_STATE_DESCRIPTION* このメソッドが返るとき、描画状態のうちアンチエイリアスモード、変換、タグの部分を格納する。呼び出し側がこのパラメータ用の領域を確保しなければならない。
%inst
描画状態のうちアンチエイリアスモード、変換、タグの部分を取得する。


%index
ID2D1DrawingStateBlock_SetDescription
描画状態のうちアンチエイリアスモード、変換、タグの部分を指定する。
%prm
this, stateDescription
this : [comobj] ID2D1DrawingStateBlock インターフェースの COM オブジェクト変数
stateDescription : [var] 
%inst
描画状態のうちアンチエイリアスモード、変換、タグの部分を指定する。


%index
ID2D1DrawingStateBlock_SetTextRenderingParams
描画状態のテキストレンダリング設定を指定する。
%prm
this, textRenderingParams
this : [comobj] ID2D1DrawingStateBlock インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 型: IDWriteRenderingParams* 描画状態のテキストレンダリング設定。デフォルト設定を使用する場合は NULL。
%inst
描画状態のテキストレンダリング設定を指定する。


%index
ID2D1DrawingStateBlock_GetTextRenderingParams
描画状態のテキストレンダリング設定を取得する。
%prm
this, textRenderingParams
this : [comobj] ID2D1DrawingStateBlock インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 型: IDWriteRenderingParams** このメソッドが返るとき、描画状態のテキストレンダリング設定を表す IDWriteRenderingParams オブジェクトへのポインタのアドレスを格納する。
%inst
描画状態のテキストレンダリング設定を取得する。


%index
ID2D1EllipseGeometry_GetFactory
ID2D1EllipseGeometry::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1EllipseGeometry_GetBounds
ID2D1EllipseGeometry::GetBounds (vtable slot 4)
%prm
this, worldTransform, bounds
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst


%index
ID2D1EllipseGeometry_GetWidenedBounds
ID2D1EllipseGeometry::GetWidenedBounds (vtable slot 5)
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst


%index
ID2D1EllipseGeometry_StrokeContainsPoint
ID2D1EllipseGeometry::StrokeContainsPoint (vtable slot 6)
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1EllipseGeometry_FillContainsPoint
ID2D1EllipseGeometry::FillContainsPoint (vtable slot 7)
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1EllipseGeometry_CompareWithGeometry
ID2D1EllipseGeometry::CompareWithGeometry (vtable slot 8)
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst


%index
ID2D1EllipseGeometry_Simplify
ID2D1EllipseGeometry::Simplify (vtable slot 9)
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1EllipseGeometry_Tessellate
ID2D1EllipseGeometry::Tessellate (vtable slot 10)
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst


%index
ID2D1EllipseGeometry_CombineWithGeometry
ID2D1EllipseGeometry::CombineWithGeometry (vtable slot 11)
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1EllipseGeometry_Outline
ID2D1EllipseGeometry::Outline (vtable slot 12)
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1EllipseGeometry_ComputeArea
ID2D1EllipseGeometry::ComputeArea (vtable slot 13)
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst


%index
ID2D1EllipseGeometry_ComputeLength
ID2D1EllipseGeometry::ComputeLength (vtable slot 14)
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst


%index
ID2D1EllipseGeometry_ComputePointAtLength
ID2D1EllipseGeometry::ComputePointAtLength (vtable slot 15)
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst


%index
ID2D1EllipseGeometry_Widen
ID2D1EllipseGeometry::Widen (vtable slot 16)
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1EllipseGeometry_GetEllipse
この楕円ジオメトリを表す D2D1_ELLIPSE 構造体を取得する。
%prm
this, ellipse
this : [comobj] ID2D1EllipseGeometry インターフェースの COM オブジェクト変数
ellipse : [var] 型: D2D1_ELLIPSE* このメソッドが返るときに、楕円のサイズと位置を表す D2D1_ELLIPSE が格納される。このパラメータの記憶領域は呼び出し側で確保する必要がある。
%inst
この楕円ジオメトリを表す D2D1_ELLIPSE 構造体を取得する。


%index
ID2D1Factory_ReloadSystemMetrics
ファクトリー作成後に変更された可能性のあるシステム既定値を、強制的にリロードする。
%prm
this
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
%inst
ファクトリー作成後に変更された可能性のあるシステム既定値を、強制的にリロードする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
システム DPI
を最新の状態にするため、[GetDesktopDpi](/windows/win32/api/d2d1/nf-d2d1-id2d1factory-getdesktopdpi)
メソッドを呼び出す前に **ID2D1Factory.ReloadSystemMetrics** を呼び出しておくべきである。


%index
ID2D1Factory_GetDesktopDpi
現在のデスクトップの DPI (dots per inch) を取得する。この値を更新するには ReloadSystemMetrics を呼び出す。
%prm
this, dpiX, dpiY
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
dpiX : [float] 型: FLOAT* このメソッドが戻るとデスクトップの水平 DPI が格納される。このパラメーターの格納領域は呼び出し側が確保する必要がある。
dpiY : [float] 型: FLOAT* このメソッドが戻るとデスクトップの垂直 DPI が格納される。このパラメーターの格納領域は呼び出し側が確保する必要がある。
%inst
現在のデスクトップの DPI (dots per inch) を取得する。この値を更新するには ReloadSystemMetrics
を呼び出す。

[備考]
ウィンドウのサイズ指定など、物理ピクセル値を設定する際にシステム DPI を取得するためにこのメソッドを使用する。


%index
ID2D1Factory_CreateRectangleGeometry
ID2D1RectangleGeometry を作成する。
%prm
this, rectangle, rectangleGeometry
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
rectangle : [var] 
rectangleGeometry : [comobj] 
%inst
ID2D1RectangleGeometry を作成する。


%index
ID2D1Factory_CreateRoundedRectangleGeometry
ID2D1RoundedRectangleGeometry を作成する。
%prm
this, roundedRectangle, roundedRectangleGeometry
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
roundedRectangle : [var] 
roundedRectangleGeometry : [comobj] 
%inst
ID2D1RoundedRectangleGeometry を作成する。


%index
ID2D1Factory_CreateEllipseGeometry
ID2D1EllipseGeometry を作成する。
%prm
this, ellipse, ellipseGeometry
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
ellipse : [var] 
ellipseGeometry : [comobj] 
%inst
ID2D1EllipseGeometry を作成する。


%index
ID2D1Factory_CreateGeometryGroup
他のジオメトリーを保持するオブジェクトである ID2D1GeometryGroup を作成する。
%prm
this, fillMode, geometries, geometriesCount, geometryGroup
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
fillMode : [int] 型: D2D1_FILL_MODE 複合シェイプが、ある点がジオメトリーに含まれるかどうかを判定するために使用するルールを指定する値。
geometries : [comobj] 型: ID2D1Geometry** ジオメトリーグループに追加するジオメトリーオブジェクトを含む配列。この配列の要素数は geometriesCount パラメーターで示される。
geometriesCount : [int] 型: UINT geometries の要素数。
geometryGroup : [comobj] 型: ID2D1GeometryGroup** このメソッドが戻ると、このメソッドが作成したジオメトリーグループへのポインターのアドレスが格納される。
%inst
他のジオメトリーを保持するオブジェクトである ID2D1GeometryGroup を作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
ジオメトリーグループは複数のジオメトリーを同時にグループ化する便利な方法であり、複数の異なるジオメトリーのすべての図形を 1
つに連結する。ID2D1GeometryGroup オブジェクトを作成するには ID2D1Factory オブジェクトで
CreateGeometryGroup メソッドを呼び出し、fillMode（D2D1_FILL_MODE_ALTERNATE または
D2D1_FILL_MODE_WINDING）、ジオメトリーグループに追加するジオメトリーオブジェクトの配列、およびこの配列の要素数を渡す。


%index
ID2D1Factory_CreateTransformedGeometry
指定したジオメトリーを変換し、その結果を ID2D1TransformedGeometry オブジェクトとして格納する。
%prm
this, sourceGeometry, transform, transformedGeometry
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
sourceGeometry : [comobj] 
transform : [var] 
transformedGeometry : [comobj] 
%inst
指定したジオメトリーを変換し、その結果を ID2D1TransformedGeometry オブジェクトとして格納する。

[備考]

他のリソースと同様、変換済みジオメトリーは作成元ファクトリーのリソース空間とスレッディングポリシーを継承する。このオブジェクトは不変である。変換済みジオメトリーを
[**DrawGeometry**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawgeometry)
メソッドでストロークする場合、ストローク幅はジオメトリーに適用された変換の影響を受けない。ストローク幅はワールド変換にのみ影響される。


%index
ID2D1Factory_CreatePathGeometry
空の ID2D1PathGeometry を作成する。
%prm
this, pathGeometry
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
pathGeometry : [comobj] 型: ID2D1PathGeometry** このメソッドが戻ると、このメソッドが作成したパスジオメトリーへのポインターのアドレスが格納される。
%inst
空の ID2D1PathGeometry を作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。


%index
ID2D1Factory_CreateStrokeStyle
ストロークの開始キャップ、破線パターン、その他の特徴を記述する ID2D1StrokeStyle を作成する。
%prm
this, strokeStyleProperties, dashes, dashesCount, strokeStyle
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
strokeStyleProperties : [var] 
dashes : [var] 
dashesCount : [int] 
strokeStyle : [comobj] 
%inst
ストロークの開始キャップ、破線パターン、その他の特徴を記述する ID2D1StrokeStyle を作成する。


%index
ID2D1Factory_CreateDrawingStateBlock
レンダーターゲットの SaveDrawingState メソッドおよび RestoreDrawingState メソッドで使用できる ID2D1DrawingStateBlock を作成する。
%prm
this, drawingStateDescription, textRenderingParams, drawingStateBlock
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
drawingStateDescription : [var] 
textRenderingParams : [comobj] 
drawingStateBlock : [comobj] 
%inst
レンダーターゲットの SaveDrawingState メソッドおよび RestoreDrawingState メソッドで使用できる
ID2D1DrawingStateBlock を作成する。


%index
ID2D1Factory_CreateWicBitmapRenderTarget
Microsoft Windows Imaging Component (WIC) ビットマップに描画するレンダーターゲットを作成する。
%prm
this, target, renderTargetProperties, renderTarget
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
target : [comobj] 
renderTargetProperties : [var] 
renderTarget : [comobj] 
%inst
Microsoft Windows Imaging Component (WIC) ビットマップに描画するレンダーターゲットを作成する。

[備考]
アプリケーションはレンダーターゲットを一度だけ作成し、アプリケーションの寿命の間、または
[**D2DERR\_RECREATE\_TARGET**](direct2d-error-codes.md)
エラーを受け取るまで保持すべきである。このエラーを受け取った場合は、レンダーターゲット（およびそれが作成したリソース）を作成し直す必要がある。**注意**
このメソッドは Windows Phone ではサポートされておらず、デバイス上で呼び出すとエラーコード
0x8899000b（この操作に利用可能なハードウェアレンダリングデバイスがありません）で失敗する。Windows Phone
Emulator は WARP レンダリングをサポートするため、エミュレーター上で呼び出すと別のエラーコード 0x88982f80
(wincodec\_err\_unsupportedpixelformat) で失敗する。


%index
ID2D1Factory_CreateHwndRenderTarget
ウィンドウに描画するレンダーターゲットである ID2D1HwndRenderTarget を作成する。
%prm
this, renderTargetProperties, hwndRenderTargetProperties, hwndRenderTarget
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
renderTargetProperties : [var] 
hwndRenderTargetProperties : [var] 
hwndRenderTarget : [comobj] 
%inst
ウィンドウに描画するレンダーターゲットである ID2D1HwndRenderTarget を作成する。

[備考]
レンダーターゲット作成時にハードウェアアクセラレーションが利用可能な場合、コンピューターの GPU
上にリソースが確保される。レンダーターゲットを一度だけ作成してできるだけ長く保持することで性能上の利点が得られる。アプリケーションはレンダーターゲットを一度だけ作成し、アプリケーションの寿命の間、または
[**D2DERR\_RECREATE\_TARGET**](direct2d-error-codes.md)
エラーを受け取るまで保持すべきである。このエラーを受け取った場合は、レンダーターゲット（およびそれが作成したリソース）を作成し直す必要がある。


%index
ID2D1Factory_CreateDxgiSurfaceRenderTarget
DXGI (DirectX Graphics Infrastructure) サーフェイスに描画するレンダーターゲットを作成する。(overload 1/2)
%prm
this, dxgiSurface, renderTargetProperties, renderTarget
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
dxgiSurface : [comobj] 型: IDXGISurface* レンダーターゲットが描画する IDXGISurface。
renderTargetProperties : [var] 型: const D2D1_RENDER_TARGET_PROPERTIES & レンダリングモード、ピクセル形式、リモート化オプション、DPI 情報、およびハードウェアレンダリングに必要な DirectX の最低サポート。対応ピクセル形式については「Supported Pixel Formats and Alpha Modes」を参照。
renderTarget : [comobj] 型: ID2D1RenderTarget** このメソッドが戻ると、このメソッドが作成した ID2D1RenderTarget オブジェクトへのポインターのアドレスが格納される。
%inst
DXGI (DirectX Graphics Infrastructure)
サーフェイスに描画するレンダーターゲットを作成する。(overload 1/2)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
Direct3D サーフェイスに書き込むには、IDXGISurface を取得して
CreateDxgiSurfaceRenderTarget メソッドに渡して DXGI
サーフェイスレンダーターゲットを作成し、それを使って DXGI サーフェイスへ 2D コンテンツを描画できる。DXGI
サーフェイスレンダーターゲットは ID2D1RenderTarget の一種であり、他の Direct2D
レンダーターゲットと同様にリソースの作成や描画コマンドの発行に使用できる。DXGI サーフェイスレンダーターゲットと DXGI
サーフェイスは同じ DXGI 形式を使用しなければならない。レンダーターゲット作成時に DXGI_FORMAT_UNKOWN
を指定すると自動的にサーフェイスの形式が使用される。DXGI サーフェイスレンダーターゲットは DXGI
サーフェイス同期を行わない。DXGI サーフェイスレンダーターゲットの作成と使用の詳細は Direct2D and Direct3D
Interoperability Overview を参照。Direct2D と連携するには、IDXGISurface を提供する
Direct3D デバイスを D3D10_CREATE_DEVICE_BGRA_SUPPORT
フラグ付きで作成する必要がある。レンダーターゲット作成時にハードウェアアクセラレーションが利用可能な場合、コンピューターの GPU
上にリソースが確保される。レンダーターゲットを一度だけ作成してできるだけ長く保持することで性能上の利点が得られる。アプリケーションはレンダーターゲットを一度だけ作成し、アプリケーションの寿命の間、またはレンダーターゲットの
EndDraw メソッドが D2DERR_RECREATE_TARGET
エラーを返すまで保持すべきである。このエラーを受け取った場合は、レンダーターゲット（およびそれが作成したリソース）を作成し直す必要がある。


%index
ID2D1Factory_CreateDCRenderTarget
Windows GDI デバイスコンテキストに描画するレンダーターゲットを作成する。
%prm
this, renderTargetProperties, dcRenderTarget
this : [comobj] ID2D1Factory インターフェースの COM オブジェクト変数
renderTargetProperties : [var] 型: const D2D1_RENDER_TARGET_PROPERTIES* レンダリングモード、ピクセル形式、リモート化オプション、DPI 情報、およびハードウェアレンダリングに必要な DirectX の最低サポート。デバイスコンテキスト (DC) レンダーターゲットが GDI と連携できるようにするには、DXGI 形式を DXGI_FORMAT_B8G8R8A8_UNORM に、アルファモードを D2D1_ALPHA_MODE_PREMULTIPLIED または D2D1_ALPHA_MODE_IGNORE に設定する。ピクセル形式の詳細については「Supported Pixel Formats and Alpha Modes」を参照。
dcRenderTarget : [comobj] 型: ID2D1DCRenderTarget** このメソッドが戻ると、dcRenderTarget にはメソッドが作成した ID2D1DCRenderTarget へのポインターのアドレスが格納される。
%inst
Windows GDI デバイスコンテキストに描画するレンダーターゲットを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
DC レンダーターゲットでレンダリングする前に、レンダーターゲットの BindDC メソッドで GDI DC
と関連付けておく必要がある。これは DC が変わるたび、および描画先領域のサイズが変わるたびに行う。DC レンダーターゲットが GDI
と連携できるようにするには、レンダーターゲットの DXGI 形式を DXGI_FORMAT_B8G8R8A8_UNORM
に、アルファモードを D2D1_ALPHA_MODE_PREMULTIPLIED または D2D1_ALPHA_MODE_IGNORE
に設定する。アプリケーションはレンダーターゲットを一度だけ作成し、アプリケーションの寿命の間、またはレンダーターゲットの EndDraw
メソッドが D2DERR_RECREATE_TARGET
エラーを返すまで保持すべきである。このエラーを受け取った場合は、レンダーターゲット（およびそれが作成したリソース）を作成し直す必要がある。


%index
ID2D1Geometry_GetFactory
ID2D1Geometry::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1Geometry_GetBounds
ジオメトリの境界を取得する。
%prm
this, worldTransform, bounds
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst
ジオメトリの境界を取得する。


%index
ID2D1Geometry_GetWidenedBounds
指定したストローク幅とスタイルで太らせ、指定した行列で変換したあとのジオメトリの境界を取得する。
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst
指定したストローク幅とスタイルで太らせ、指定した行列で変換したあとのジオメトリの境界を取得する。


%index
ID2D1Geometry_StrokeContainsPoint
ジオメトリのストロークが指定した点を含むかどうかを判定する。
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst
ジオメトリのストロークが指定した点を含むかどうかを判定する。


%index
ID2D1Geometry_FillContainsPoint
ジオメトリの塗りつぶし領域が指定した点を含むかどうかを示す。
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst
ジオメトリの塗りつぶし領域が指定した点を含むかどうかを示す。


%index
ID2D1Geometry_CompareWithGeometry
このジオメトリと指定したジオメトリの交差を記述する。
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst
このジオメトリと指定したジオメトリの交差を記述する。

[備考]
返される *relation*
の値を解釈する際は、[**D2D1\_GEOMETRY\_RELATION\_IS\_CONTAINED**](/windows/desktop/api/d2d1/ne-d2d1-d2d1_geometry_relation)
という **D2D1\_GEOMETRY\_RELATION** 列挙体のメンバーが「このジオメトリが *inputGeometry*
に含まれている」ことを意味し、「このジオメトリが *inputGeometry*
を含む」という意味ではない点に注意することが重要である。他に取り得る戻り値の解釈については
[**D2D1\_GEOMETRY\_RELATION**](/windows/desktop/api/d2d1/ne-d2d1-d2d1_geometry_relation)
を参照。


%index
ID2D1Geometry_Simplify
直線と（オプションで）3 次ベジェ曲線のみを含む単純化版のジオメトリを生成し、結果を ID2D1SimplifiedGeometrySink に書き出す。
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst
直線と（オプションで）3 次ベジェ曲線のみを含む単純化版のジオメトリを生成し、結果を
ID2D1SimplifiedGeometrySink に書き出す。


%index
ID2D1Geometry_Tessellate
指定した行列で変換し、指定した許容値で平坦化したあとのジオメトリを覆う、時計回りに巻かれた一連の三角形を生成する。
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst
指定した行列で変換し、指定した許容値で平坦化したあとのジオメトリを覆う、時計回りに巻かれた一連の三角形を生成する。


%index
ID2D1Geometry_CombineWithGeometry
このジオメトリと指定したジオメトリを結合し、結果を ID2D1SimplifiedGeometrySink に格納する。
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst
このジオメトリと指定したジオメトリを結合し、結果を ID2D1SimplifiedGeometrySink に格納する。


%index
ID2D1Geometry_Outline
ジオメトリのアウトラインを計算し、結果を ID2D1SimplifiedGeometrySink に書き出す。
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst
ジオメトリのアウトラインを計算し、結果を ID2D1SimplifiedGeometrySink に書き出す。

[備考]

[**Outline**](/windows/win32/api/d2d1/nf-d2d1-id2d1geometry-outline(constd2d1_matrix_3x2_f__id2d1simplifiedgeometrysink))
メソッドを使うと、入力ジオメトリと等価な塗りつぶしを持ち、さらに次の特性を備えたジオメトリを呼び出し側が生成できる。-
出力ジオメトリには横断的な交差が含まれない。すなわちセグメント同士は接することはあっても決して交差しない。-
出力ジオメトリの最外図形はすべて反時計回りに向き付けされる。-
出力ジオメトリは塗りつぶしモード不変である。すなわちジオメトリの塗りつぶしは塗りつぶしモードの選択に依存しない。塗りつぶしモードの詳細については
[**D2D1\_FILL\_MODE**](/windows/desktop/api/d2d1/ne-d2d1-d2d1_fill_mode)
を参照。さらに
[**Outline**](/windows/win32/api/d2d1/nf-d2d1-id2d1geometry-outline(constd2d1_matrix_3x2_f__id2d1simplifiedgeometrysink))
メソッドは、複雑なジオメトリを単純化するために前述のジオメトリの冗長部分を取り除くのにも有用である。また
[**ID2D1GeometryGroup**](/windows/win32/api/d2d1/nn-d2d1-id2d1geometrygroup)
と組み合わせて、複数のジオメトリの和集合を一度に作成するのにも役立つ。


%index
ID2D1Geometry_ComputeArea
ジオメトリの面積を計算する。
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst
ジオメトリの面積を計算する。


%index
ID2D1Geometry_ComputeLength
各セグメントを直線として展開した場合のジオメトリの長さを計算する。
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst
各セグメントを直線として展開した場合のジオメトリの長さを計算する。


%index
ID2D1Geometry_ComputePointAtLength
ジオメトリ上の指定距離における点と接線ベクトルを計算する。
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst
ジオメトリ上の指定距離における点と接線ベクトルを計算する。


%index
ID2D1Geometry_Widen
指定したストロークでジオメトリを太らせ、結果を ID2D1SimplifiedGeometrySink に書き出す。
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1Geometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst
指定したストロークでジオメトリを太らせ、結果を ID2D1SimplifiedGeometrySink に書き出す。


%index
ID2D1GeometryGroup_GetFactory
ID2D1GeometryGroup::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1GeometryGroup_GetBounds
ID2D1GeometryGroup::GetBounds (vtable slot 4)
%prm
this, worldTransform, bounds
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst


%index
ID2D1GeometryGroup_GetWidenedBounds
ID2D1GeometryGroup::GetWidenedBounds (vtable slot 5)
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst


%index
ID2D1GeometryGroup_StrokeContainsPoint
ID2D1GeometryGroup::StrokeContainsPoint (vtable slot 6)
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1GeometryGroup_FillContainsPoint
ID2D1GeometryGroup::FillContainsPoint (vtable slot 7)
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1GeometryGroup_CompareWithGeometry
ID2D1GeometryGroup::CompareWithGeometry (vtable slot 8)
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst


%index
ID2D1GeometryGroup_Simplify
ID2D1GeometryGroup::Simplify (vtable slot 9)
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1GeometryGroup_Tessellate
ID2D1GeometryGroup::Tessellate (vtable slot 10)
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst


%index
ID2D1GeometryGroup_CombineWithGeometry
ID2D1GeometryGroup::CombineWithGeometry (vtable slot 11)
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1GeometryGroup_Outline
ID2D1GeometryGroup::Outline (vtable slot 12)
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1GeometryGroup_ComputeArea
ID2D1GeometryGroup::ComputeArea (vtable slot 13)
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst


%index
ID2D1GeometryGroup_ComputeLength
ID2D1GeometryGroup::ComputeLength (vtable slot 14)
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst


%index
ID2D1GeometryGroup_ComputePointAtLength
ID2D1GeometryGroup::ComputePointAtLength (vtable slot 15)
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst


%index
ID2D1GeometryGroup_Widen
ID2D1GeometryGroup::Widen (vtable slot 16)
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1GeometryGroup_GetFillMode
このジオメトリグループに含まれるジオメトリの交差領域がどのように結合されるかを示す。
%prm
this
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
%inst
このジオメトリグループに含まれるジオメトリの交差領域がどのように結合されるかを示す。

[戻り値]
型: D2D1_FILL_MODE このジオメトリグループに含まれるジオメトリの交差領域がどのように結合されるかを示す値。


%index
ID2D1GeometryGroup_GetSourceGeometryCount
ジオメトリグループ内のジオメトリオブジェクトの数を示す。
%prm
this
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
%inst
ジオメトリグループ内のジオメトリオブジェクトの数を示す。

[戻り値]
型: UINT32 ID2D1GeometryGroup 内のジオメトリの数。


%index
ID2D1GeometryGroup_GetSourceGeometries
ジオメトリグループ内のジオメトリを取得する。
%prm
this, geometries, geometriesCount
this : [comobj] ID2D1GeometryGroup インターフェースの COM オブジェクト変数
geometries : [comobj] 型: const ID2D1Geometry** このメソッドが返るとき、本メソッドが埋めるジオメトリの配列へのポインタのアドレスを格納する。配列の長さは geometriesCount パラメータで指定する。配列が NULL の場合、本メソッドは何も行わない。この配列のメモリは呼び出し側が確保しなければならない。
geometriesCount : [int] 型: UINT geometries 配列に返すジオメトリの数を示す値。この値がジオメトリグループ内のジオメトリ数より小さい場合、残りのジオメトリは省略される。大きい場合、余分な要素は NULL に設定される。現在ジオメトリグループに含まれるジオメトリの数を取得するには GetSourceGeometryCount メソッドを使用する。
%inst
ジオメトリグループ内のジオメトリを取得する。

[備考]
返されたジオメトリは参照されてカウントされており、呼び出し側がそれらを解放しなければならない。


%index
ID2D1GeometrySink_SetFillMode
ID2D1GeometrySink::SetFillMode (vtable slot 3)
%prm
this, fillMode
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
fillMode : [int] 
%inst


%index
ID2D1GeometrySink_SetSegmentFlags
ID2D1GeometrySink::SetSegmentFlags (vtable slot 4)
%prm
this, vertexFlags
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
vertexFlags : [int] 
%inst


%index
ID2D1GeometrySink_BeginFigure
ID2D1GeometrySink::BeginFigure (vtable slot 5)
%prm
this, startPoint, figureBegin
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
startPoint : [int] 
figureBegin : [int] 
%inst


%index
ID2D1GeometrySink_AddLines
ID2D1GeometrySink::AddLines (vtable slot 6)
%prm
this, points, pointsCount
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
points : [var] 
pointsCount : [int] 
%inst


%index
ID2D1GeometrySink_AddBeziers
ID2D1GeometrySink::AddBeziers (vtable slot 7)
%prm
this, beziers, beziersCount
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
beziers : [var] 
beziersCount : [int] 
%inst


%index
ID2D1GeometrySink_EndFigure
ID2D1GeometrySink::EndFigure (vtable slot 8)
%prm
this, figureEnd
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
figureEnd : [int] 
%inst


%index
ID2D1GeometrySink_Close
ID2D1GeometrySink::Close (vtable slot 9)
%prm
this
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
%inst


%index
ID2D1GeometrySink_AddLine
現在の点と指定された終点との間に線分を作成し、ジオメトリシンクに追加する。
%prm
this, point
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
point : [int] 型: D2D1_POINT_2F 描画する線分の終点。
%inst
現在の点と指定された終点との間に線分を作成し、ジオメトリシンクに追加する。


%index
ID2D1GeometrySink_AddBezier
現在の点と指定された終点との間に 3 次ベジェ曲線を作成し、ジオメトリシンクに追加する。
%prm
this, bezier
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
bezier : [var] 
%inst
現在の点と指定された終点との間に 3 次ベジェ曲線を作成し、ジオメトリシンクに追加する。


%index
ID2D1GeometrySink_AddQuadraticBezier
現在の点と指定された終点との間に 2 次ベジェ曲線を作成し、ジオメトリシンクに追加する。
%prm
this, bezier
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
bezier : [var] 
%inst
現在の点と指定された終点との間に 2 次ベジェ曲線を作成し、ジオメトリシンクに追加する。


%index
ID2D1GeometrySink_AddQuadraticBeziers
一連の 2 次ベジェセグメントを 1 回の呼び出しで配列としてまとめて追加する。
%prm
this, beziers, beziersCount
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
beziers : [var] 型: const D2D1_QUADRATIC_BEZIER_SEGMENT* 一連の 2 次ベジェセグメントの配列。
beziersCount : [int] 型: UINT beziers 内の 2 次ベジェセグメントの数を示す値。
%inst
一連の 2 次ベジェセグメントを 1 回の呼び出しで配列としてまとめて追加する。


%index
ID2D1GeometrySink_AddArc
1 本の円弧を作成し、パスジオメトリに追加する。
%prm
this, arc
this : [comobj] ID2D1GeometrySink インターフェースの COM オブジェクト変数
arc : [var] 
%inst
1 本の円弧を作成し、パスジオメトリに追加する。


%index
ID2D1GradientStopCollection_GetFactory
ID2D1GradientStopCollection::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1GradientStopCollection インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1GradientStopCollection_GetGradientStopCount
コレクション内のグラデーションストップの数を取得する。
%prm
this
this : [comobj] ID2D1GradientStopCollection インターフェースの COM オブジェクト変数
%inst
コレクション内のグラデーションストップの数を取得する。

[戻り値]
型: UINT32 コレクション内のグラデーションストップの数。


%index
ID2D1GradientStopCollection_GetGradientStops
コレクションのグラデーションストップを D2D1_GRADIENT_STOP 構造体の配列へコピーする。
%prm
this, gradientStops, gradientStopsCount
this : [comobj] ID2D1GradientStopCollection インターフェースの COM オブジェクト変数
gradientStops : [var] 型: D2D1_GRADIENT_STOP* D2D1_GRADIENT_STOP 構造体の 1 次元配列へのポインタ。本メソッドが返るとき、配列にはコレクションのグラデーションストップのコピーが格納される。この配列のメモリは呼び出し側が確保しなければならない。
gradientStopsCount : [int] 型: UINT コピーするグラデーションストップの数を示す値。値がコレクション内のグラデーションストップの数より小さい場合、残りのストップは省略される。大きい場合、余分な要素は NULL に設定される。コレクション内のグラデーションストップの数を取得するには GetGradientStopCount メソッドを使用する。
%inst
コレクションのグラデーションストップを D2D1_GRADIENT_STOP 構造体の配列へコピーする。

[備考]
グラデーションストップは位置の小さいものから大きいものへと位置順にコピーされる。


%index
ID2D1GradientStopCollection_GetColorInterpolationGamma
グラデーションストップが補間されるガンマ空間を示す。
%prm
this
this : [comobj] ID2D1GradientStopCollection インターフェースの COM オブジェクト変数
%inst
グラデーションストップが補間されるガンマ空間を示す。

[戻り値]
型: D2D1_GAMMA グラデーションストップが補間されるガンマ空間。


%index
ID2D1GradientStopCollection_GetExtendMode
正規化グラデーション範囲の外側におけるグラデーションの動作を示す。
%prm
this
this : [comobj] ID2D1GradientStopCollection インターフェースの COM オブジェクト変数
%inst
正規化グラデーション範囲の外側におけるグラデーションの動作を示す。

[戻り値]
型: D2D1_EXTEND_MODE 正規化グラデーション範囲 [0,1] の外側におけるグラデーションの動作。


%index
ID2D1HwndRenderTarget_GetFactory
ID2D1HwndRenderTarget::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateBitmap
ID2D1HwndRenderTarget::CreateBitmap (vtable slot 4)
%prm
this, size, srcData, pitch, bitmapProperties, bitmap
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
size : [int] 
srcData : [intptr] 
pitch : [int] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateBitmapFromWicBitmap
ID2D1HwndRenderTarget::CreateBitmapFromWicBitmap (vtable slot 5)
%prm
this, wicBitmapSource, bitmapProperties, bitmap
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
wicBitmapSource : [comobj] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateSharedBitmap
ID2D1HwndRenderTarget::CreateSharedBitmap (vtable slot 6)
%prm
this, riid, data, bitmapProperties, bitmap
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
riid : [var] 
data : [intptr] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateBitmapBrush
ID2D1HwndRenderTarget::CreateBitmapBrush (vtable slot 7)
%prm
this, bitmap, bitmapBrushProperties, brushProperties, bitmapBrush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
bitmapBrushProperties : [var] 
brushProperties : [var] 
bitmapBrush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateSolidColorBrush
ID2D1HwndRenderTarget::CreateSolidColorBrush (vtable slot 8)
%prm
this, color, brushProperties, solidColorBrush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
color : [var] 
brushProperties : [var] 
solidColorBrush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateGradientStopCollection
ID2D1HwndRenderTarget::CreateGradientStopCollection (vtable slot 9)
%prm
this, gradientStops, gradientStopsCount, colorInterpolationGamma, extendMode, gradientStopCollection
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
gradientStops : [var] 
gradientStopsCount : [int] 
colorInterpolationGamma : [int] 
extendMode : [int] 
gradientStopCollection : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateLinearGradientBrush
ID2D1HwndRenderTarget::CreateLinearGradientBrush (vtable slot 10)
%prm
this, linearGradientBrushProperties, brushProperties, gradientStopCollection, linearGradientBrush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
linearGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
linearGradientBrush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateRadialGradientBrush
ID2D1HwndRenderTarget::CreateRadialGradientBrush (vtable slot 11)
%prm
this, radialGradientBrushProperties, brushProperties, gradientStopCollection, radialGradientBrush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
radialGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
radialGradientBrush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateCompatibleRenderTarget
ID2D1HwndRenderTarget::CreateCompatibleRenderTarget (vtable slot 12)
%prm
this, desiredSize, desiredPixelSize, desiredFormat, options, bitmapRenderTarget
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
desiredSize : [var] 
desiredPixelSize : [var] 
desiredFormat : [var] 
options : [int] 
bitmapRenderTarget : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateLayer
ID2D1HwndRenderTarget::CreateLayer (vtable slot 13)
%prm
this, size, layer
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
size : [var] 
layer : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_CreateMesh
ID2D1HwndRenderTarget::CreateMesh (vtable slot 14)
%prm
this, mesh
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_DrawLine
ID2D1HwndRenderTarget::DrawLine (vtable slot 15)
%prm
this, point0, point1, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
point0 : [int] 
point1 : [int] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_DrawRectangle
ID2D1HwndRenderTarget::DrawRectangle (vtable slot 16)
%prm
this, rect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_FillRectangle
ID2D1HwndRenderTarget::FillRectangle (vtable slot 17)
%prm
this, rect, brush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_DrawRoundedRectangle
ID2D1HwndRenderTarget::DrawRoundedRectangle (vtable slot 18)
%prm
this, roundedRect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_FillRoundedRectangle
ID2D1HwndRenderTarget::FillRoundedRectangle (vtable slot 19)
%prm
this, roundedRect, brush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_DrawEllipse
ID2D1HwndRenderTarget::DrawEllipse (vtable slot 20)
%prm
this, ellipse, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_FillEllipse
ID2D1HwndRenderTarget::FillEllipse (vtable slot 21)
%prm
this, ellipse, brush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_DrawGeometry
ID2D1HwndRenderTarget::DrawGeometry (vtable slot 22)
%prm
this, geometry, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_FillGeometry
ID2D1HwndRenderTarget::FillGeometry (vtable slot 23)
%prm
this, geometry, brush, opacityBrush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 
brush : [comobj] 
opacityBrush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_FillMesh
ID2D1HwndRenderTarget::FillMesh (vtable slot 24)
%prm
this, mesh, brush
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 
brush : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_FillOpacityMask
ID2D1HwndRenderTarget::FillOpacityMask (vtable slot 25)
%prm
this, opacityMask, brush, content, destinationRectangle, sourceRectangle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
opacityMask : [comobj] 
brush : [comobj] 
content : [int] 
destinationRectangle : [var] 
sourceRectangle : [var] 
%inst


%index
ID2D1HwndRenderTarget_DrawBitmap
ID2D1HwndRenderTarget::DrawBitmap (vtable slot 26)
%prm
this, bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
destinationRectangle : [var] 
opacity : [float] 
interpolationMode : [int] 
sourceRectangle : [var] 
%inst


%index
ID2D1HwndRenderTarget_DrawText
ID2D1HwndRenderTarget::DrawText (vtable slot 27)
%prm
this, string, stringLength, textFormat, layoutRect, defaultFillBrush, options, measuringMode
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
string : [int] 
stringLength : [int] 
textFormat : [comobj] 
layoutRect : [var] 
defaultFillBrush : [comobj] 
options : [int] 
measuringMode : [int] 
%inst


%index
ID2D1HwndRenderTarget_DrawTextLayout
ID2D1HwndRenderTarget::DrawTextLayout (vtable slot 28)
%prm
this, origin, textLayout, defaultFillBrush, options
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
origin : [int] 
textLayout : [comobj] 
defaultFillBrush : [comobj] 
options : [int] 
%inst


%index
ID2D1HwndRenderTarget_DrawGlyphRun
ID2D1HwndRenderTarget::DrawGlyphRun (vtable slot 29)
%prm
this, baselineOrigin, glyphRun, foregroundBrush, measuringMode
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
baselineOrigin : [int] 
glyphRun : [int] 
foregroundBrush : [comobj] 
measuringMode : [int] 
%inst


%index
ID2D1HwndRenderTarget_SetTransform
ID2D1HwndRenderTarget::SetTransform (vtable slot 30)
%prm
this, transform
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1HwndRenderTarget_GetTransform
ID2D1HwndRenderTarget::GetTransform (vtable slot 31)
%prm
this, transform
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1HwndRenderTarget_SetAntialiasMode
ID2D1HwndRenderTarget::SetAntialiasMode (vtable slot 32)
%prm
this, antialiasMode
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
antialiasMode : [int] 
%inst


%index
ID2D1HwndRenderTarget_GetAntialiasMode
ID2D1HwndRenderTarget::GetAntialiasMode (vtable slot 33)
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_SetTextAntialiasMode
ID2D1HwndRenderTarget::SetTextAntialiasMode (vtable slot 34)
%prm
this, textAntialiasMode
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
textAntialiasMode : [int] 
%inst


%index
ID2D1HwndRenderTarget_GetTextAntialiasMode
ID2D1HwndRenderTarget::GetTextAntialiasMode (vtable slot 35)
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_SetTextRenderingParams
ID2D1HwndRenderTarget::SetTextRenderingParams (vtable slot 36)
%prm
this, textRenderingParams
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_GetTextRenderingParams
ID2D1HwndRenderTarget::GetTextRenderingParams (vtable slot 37)
%prm
this, textRenderingParams
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_SetTags
ID2D1HwndRenderTarget::SetTags (vtable slot 38)
%prm
this, tag1, tag2
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
tag1 : [int64] 
tag2 : [int64] 
%inst


%index
ID2D1HwndRenderTarget_GetTags
ID2D1HwndRenderTarget::GetTags (vtable slot 39)
%prm
this, tag1, tag2
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1HwndRenderTarget_PushLayer
ID2D1HwndRenderTarget::PushLayer (vtable slot 40)
%prm
this, layerParameters, layer
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
layerParameters : [int] 
layer : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_PopLayer
ID2D1HwndRenderTarget::PopLayer (vtable slot 41)
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_Flush
ID2D1HwndRenderTarget::Flush (vtable slot 42)
%prm
this, tag1, tag2
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1HwndRenderTarget_SaveDrawingState
ID2D1HwndRenderTarget::SaveDrawingState (vtable slot 43)
%prm
this, drawingStateBlock
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_RestoreDrawingState
ID2D1HwndRenderTarget::RestoreDrawingState (vtable slot 44)
%prm
this, drawingStateBlock
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 
%inst


%index
ID2D1HwndRenderTarget_PushAxisAlignedClip
ID2D1HwndRenderTarget::PushAxisAlignedClip (vtable slot 45)
%prm
this, clipRect, antialiasMode
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
clipRect : [var] 
antialiasMode : [int] 
%inst


%index
ID2D1HwndRenderTarget_PopAxisAlignedClip
ID2D1HwndRenderTarget::PopAxisAlignedClip (vtable slot 46)
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_Clear
ID2D1HwndRenderTarget::Clear (vtable slot 47)
%prm
this, clearColor
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
clearColor : [var] 
%inst


%index
ID2D1HwndRenderTarget_BeginDraw
ID2D1HwndRenderTarget::BeginDraw (vtable slot 48)
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_EndDraw
ID2D1HwndRenderTarget::EndDraw (vtable slot 49)
%prm
this, tag1, tag2
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 
tag2 : [var] 
%inst


%index
ID2D1HwndRenderTarget_GetPixelFormat
ID2D1HwndRenderTarget::GetPixelFormat (vtable slot 50)
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_SetDpi
ID2D1HwndRenderTarget::SetDpi (vtable slot 51)
%prm
this, dpiX, dpiY
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 
dpiY : [float] 
%inst


%index
ID2D1HwndRenderTarget_GetDpi
ID2D1HwndRenderTarget::GetDpi (vtable slot 52)
%prm
this, dpiX, dpiY
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 
dpiY : [float] 
%inst


%index
ID2D1HwndRenderTarget_GetSize
ID2D1HwndRenderTarget::GetSize (vtable slot 53)
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_GetPixelSize
ID2D1HwndRenderTarget::GetPixelSize (vtable slot 54)
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_GetMaximumBitmapSize
ID2D1HwndRenderTarget::GetMaximumBitmapSize (vtable slot 55)
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst


%index
ID2D1HwndRenderTarget_IsSupported
ID2D1HwndRenderTarget::IsSupported (vtable slot 56)
%prm
this, renderTargetProperties
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
renderTargetProperties : [var] 
%inst


%index
ID2D1HwndRenderTarget_CheckWindowState
このレンダーターゲットに関連付けられた HWND がオクルードされているかどうかを示す。
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst
このレンダーターゲットに関連付けられた HWND がオクルードされているかどうかを示す。

[戻り値]
型: D2D1_WINDOW_STATE このレンダーターゲットに関連付けられた HWND がオクルードされているかどうかを示す値。

[備考]
注意 前回の EndDraw 呼び出し時にウィンドウがオクルードされていた場合、現在のウィンドウ状態にかかわらず、次回
CheckWindowState を呼び出すと D2D1_WINDOW_STATE_OCCLUDED
が返る。CheckWindowState を使って現在のウィンドウ状態を判定したい場合は、EndDraw の呼び出しごとに
CheckWindowState を呼び出して戻り値を無視しておくべきである。こうすることで、次の CheckWindowState
呼び出しは実際のウィンドウ状態を返すようになる。


%index
ID2D1HwndRenderTarget_Resize
レンダーターゲットのサイズを指定したピクセルサイズに変更する。
%prm
this, pixelSize
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
pixelSize : [var] 
%inst
レンダーターゲットのサイズを指定したピクセルサイズに変更する。

[備考]
このメソッドが呼び出された後、レンダーターゲット作成時に
[**D2D1\_PRESENT\_OPTIONS\_RETAIN\_CONTENTS**](/windows/win32/api/d2d1/ne-d2d1-d2d1_present_options)
オプションが指定されていたとしても、レンダーターゲットのバックバッファの内容は未定義となる。


%index
ID2D1HwndRenderTarget_GetHwnd
このレンダーターゲットに関連付けられた HWND を返す。
%prm
this
this : [comobj] ID2D1HwndRenderTarget インターフェースの COM オブジェクト変数
%inst
このレンダーターゲットに関連付けられた HWND を返す。

[戻り値]
型: HWND このレンダーターゲットに関連付けられた HWND。


%index
ID2D1Image_GetFactory
ID2D1Image::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1Image インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1Layer_GetFactory
ID2D1Layer::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1Layer インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1Layer_GetSize
デバイス非依存ピクセル単位でレイヤーのサイズを取得する。
%prm
this
this : [comobj] ID2D1Layer インターフェースの COM オブジェクト変数
%inst
デバイス非依存ピクセル単位でレイヤーのサイズを取得する。

[戻り値]
型: D2D1_SIZE_F デバイス非依存ピクセル単位でのレイヤーのサイズ。


%index
ID2D1LinearGradientBrush_GetFactory
ID2D1LinearGradientBrush::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1LinearGradientBrush_SetOpacity
ID2D1LinearGradientBrush::SetOpacity (vtable slot 4)
%prm
this, opacity
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
opacity : [float] 
%inst


%index
ID2D1LinearGradientBrush_SetTransform
ID2D1LinearGradientBrush::SetTransform (vtable slot 5)
%prm
this, transform
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1LinearGradientBrush_GetOpacity
ID2D1LinearGradientBrush::GetOpacity (vtable slot 6)
%prm
this
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
%inst


%index
ID2D1LinearGradientBrush_GetTransform
ID2D1LinearGradientBrush::GetTransform (vtable slot 7)
%prm
this, transform
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1LinearGradientBrush_SetStartPoint
線形グラデーションの開始座標をブラシの座標空間で設定する。
%prm
this, startPoint
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
startPoint : [int] 型: D2D1_POINT_2F ブラシの座標空間における線形グラデーションの開始座標 (2 次元)。
%inst
線形グラデーションの開始座標をブラシの座標空間で設定する。

[備考]

開始点と終了点はブラシの空間で記述され、ブラシが使用される際にレンダーターゲットへマッピングされる。ブラシ変換やレンダーターゲット変換が単位行列でない場合、ブラシの開始点と終了点もそれに応じて変換される。


%index
ID2D1LinearGradientBrush_SetEndPoint
線形グラデーションの終了座標をブラシの座標空間で設定する。
%prm
this, endPoint
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
endPoint : [int] 型: D2D1_POINT_2F ブラシの座標空間における線形グラデーションの終了座標 (2 次元)。
%inst
線形グラデーションの終了座標をブラシの座標空間で設定する。

[備考]

開始点と終了点はブラシの空間で記述され、ブラシが使用される際にレンダーターゲットへマッピングされる。ブラシ変換やレンダーターゲット変換が単位行列でない場合、ブラシの開始点と終了点もそれに応じて変換される。


%index
ID2D1LinearGradientBrush_GetStartPoint
線形グラデーションの開始座標を取得する。
%prm
this
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
%inst
線形グラデーションの開始座標を取得する。

[戻り値]
型: D2D1_POINT_2F ブラシの座標空間における線形グラデーションの開始座標 (2 次元)。

[備考]

開始点と終了点はブラシの空間で記述され、ブラシが使用される際にレンダーターゲットへマッピングされる。ブラシ変換やレンダーターゲット変換が単位行列でない場合、ブラシの開始点と終了点もそれに応じて変換される。


%index
ID2D1LinearGradientBrush_GetEndPoint
線形グラデーションの終了座標を取得する。
%prm
this
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
%inst
線形グラデーションの終了座標を取得する。

[戻り値]
型: D2D1_POINT_2F ブラシの座標空間における線形グラデーションの終了座標 (2 次元)。

[備考]

開始点と終了点はブラシの空間で記述され、ブラシが使用される際にレンダーターゲットへマッピングされる。ブラシ変換やレンダーターゲット変換が単位行列でない場合、ブラシの開始点と終了点もそれに応じて変換される。


%index
ID2D1LinearGradientBrush_GetGradientStopCollection
この線形グラデーションブラシに関連付けられた ID2D1GradientStopCollection を取得する。
%prm
this, gradientStopCollection
this : [comobj] ID2D1LinearGradientBrush インターフェースの COM オブジェクト変数
gradientStopCollection : [comobj] 型: ID2D1GradientStopCollection** この線形グラデーションブラシオブジェクトに関連付けられた ID2D1GradientStopCollection オブジェクト。このパラメータは未初期化の状態で渡される。
%inst
この線形グラデーションブラシに関連付けられた ID2D1GradientStopCollection を取得する。

[備考]
ID2D1GradientStopCollection は D2D1_GRADIENT_STOP
構造体の配列と、エクステンドモードや色補間モードといった情報を保持する。


%index
ID2D1Mesh_GetFactory
ID2D1Mesh::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1Mesh インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1Mesh_Open
メッシュを開いて書き込み可能な状態にする。
%prm
this, tessellationSink
this : [comobj] ID2D1Mesh インターフェースの COM オブジェクト変数
tessellationSink : [comobj] 型: ID2D1TessellationSink** このメソッドが返るときに、メッシュへの書き込みに用いる ID2D1TessellationSink へのポインタへのポインタが格納される。このパラメータは未初期化の状態で渡す。
%inst
メッシュを開いて書き込み可能な状態にする。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。


%index
ID2D1PathGeometry_GetFactory
ID2D1PathGeometry::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1PathGeometry_GetBounds
ID2D1PathGeometry::GetBounds (vtable slot 4)
%prm
this, worldTransform, bounds
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst


%index
ID2D1PathGeometry_GetWidenedBounds
ID2D1PathGeometry::GetWidenedBounds (vtable slot 5)
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst


%index
ID2D1PathGeometry_StrokeContainsPoint
ID2D1PathGeometry::StrokeContainsPoint (vtable slot 6)
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1PathGeometry_FillContainsPoint
ID2D1PathGeometry::FillContainsPoint (vtable slot 7)
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1PathGeometry_CompareWithGeometry
ID2D1PathGeometry::CompareWithGeometry (vtable slot 8)
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst


%index
ID2D1PathGeometry_Simplify
ID2D1PathGeometry::Simplify (vtable slot 9)
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1PathGeometry_Tessellate
ID2D1PathGeometry::Tessellate (vtable slot 10)
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst


%index
ID2D1PathGeometry_CombineWithGeometry
ID2D1PathGeometry::CombineWithGeometry (vtable slot 11)
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1PathGeometry_Outline
ID2D1PathGeometry::Outline (vtable slot 12)
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1PathGeometry_ComputeArea
ID2D1PathGeometry::ComputeArea (vtable slot 13)
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst


%index
ID2D1PathGeometry_ComputeLength
ID2D1PathGeometry::ComputeLength (vtable slot 14)
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst


%index
ID2D1PathGeometry_ComputePointAtLength
ID2D1PathGeometry::ComputePointAtLength (vtable slot 15)
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst


%index
ID2D1PathGeometry_Widen
ID2D1PathGeometry::Widen (vtable slot 16)
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1PathGeometry_Open
パスジオメトリを figure とセグメントで埋めるために使用するジオメトリシンクを取得する。
%prm
this, geometrySink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
geometrySink : [comobj] 型: ID2D1GeometrySink** このメソッドが返るとき、geometrySink にはパスジオメトリを figure とセグメントで埋めるために使用するジオメトリシンクへのポインタのアドレスが格納される。このパラメータは未初期化の状態で渡される。
%inst
パスジオメトリを figure とセグメントで埋めるために使用するジオメトリシンクを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
パスジオメトリは不変であり一度しか埋められないため、同じパスジオメトリに対して Open
を複数回呼び出すのはエラーである。塗りつぶしモードは既定で D2D1_FILL_MODE_ALTERNATE
になっている点に注意。塗りつぶしモードを設定するには、最初の BeginFigure の呼び出しより前に SetFillMode
を呼ぶ必要がある。これを怠るとジオメトリシンクはエラー状態になる。


%index
ID2D1PathGeometry_Stream
パスジオメトリの内容を指定した ID2D1GeometrySink にコピーする。
%prm
this, geometrySink
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
geometrySink : [comobj] 型: ID2D1GeometrySink* パスジオメトリの内容のコピー先となるシンク。このシンクを変更しても、このパスジオメトリの内容は変化しない。
%inst
パスジオメトリの内容を指定した ID2D1GeometrySink にコピーする。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。


%index
ID2D1PathGeometry_GetSegmentCount
パスジオメトリ内のセグメント数を取得する。
%prm
this, count
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
count : [int] 型: UINT32* このメソッドが返るとき、パスジオメトリ内のセグメント数を受け取るポインタ。このパラメータ用の領域は呼び出し側が確保しなければならない。
%inst
パスジオメトリ内のセグメント数を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。


%index
ID2D1PathGeometry_GetFigureCount
パスジオメトリ内の図形 (figure) の数を取得する。
%prm
this, count
this : [comobj] ID2D1PathGeometry インターフェースの COM オブジェクト変数
count : [int] 型: UINT32* このメソッドが返るとき、パスジオメトリ内の図形 (figure) の数を受け取るポインタ。このパラメータ用の領域は呼び出し側が確保しなければならない。
%inst
パスジオメトリ内の図形 (figure) の数を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。


%index
ID2D1RadialGradientBrush_GetFactory
ID2D1RadialGradientBrush::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1RadialGradientBrush_SetOpacity
ID2D1RadialGradientBrush::SetOpacity (vtable slot 4)
%prm
this, opacity
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
opacity : [float] 
%inst


%index
ID2D1RadialGradientBrush_SetTransform
ID2D1RadialGradientBrush::SetTransform (vtable slot 5)
%prm
this, transform
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1RadialGradientBrush_GetOpacity
ID2D1RadialGradientBrush::GetOpacity (vtable slot 6)
%prm
this
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
%inst


%index
ID2D1RadialGradientBrush_GetTransform
ID2D1RadialGradientBrush::GetTransform (vtable slot 7)
%prm
this, transform
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1RadialGradientBrush_SetCenter
ブラシの座標空間におけるグラデーション楕円の中心を指定する。
%prm
this, center
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
center : [int] 型: D2D1_POINT_2F ブラシの座標空間におけるグラデーション楕円の中心。
%inst
ブラシの座標空間におけるグラデーション楕円の中心を指定する。


%index
ID2D1RadialGradientBrush_SetGradientOriginOffset
グラデーション楕円の中心を基準としたグラデーション原点のオフセットを指定する。
%prm
this, gradientOriginOffset
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
gradientOriginOffset : [int] 型: D2D1_POINT_2F グラデーション楕円の中心からのグラデーション原点のオフセット。
%inst
グラデーション楕円の中心を基準としたグラデーション原点のオフセットを指定する。


%index
ID2D1RadialGradientBrush_SetRadiusX
ブラシの座標空間におけるグラデーション楕円の x 半径を指定する。
%prm
this, radiusX
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
radiusX : [float] 型: FLOAT グラデーション楕円の x 半径。値はブラシの座標空間で指定する。
%inst
ブラシの座標空間におけるグラデーション楕円の x 半径を指定する。


%index
ID2D1RadialGradientBrush_SetRadiusY
ブラシの座標空間におけるグラデーション楕円の y 半径を指定する。
%prm
this, radiusY
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
radiusY : [float] 型: FLOAT グラデーション楕円の y 半径。値はブラシの座標空間で指定する。
%inst
ブラシの座標空間におけるグラデーション楕円の y 半径を指定する。


%index
ID2D1RadialGradientBrush_GetCenter
グラデーション楕円の中心を取得する。
%prm
this
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
%inst
グラデーション楕円の中心を取得する。

[戻り値]
型: D2D1_POINT_2F グラデーション楕円の中心。値はブラシの座標空間で表される。


%index
ID2D1RadialGradientBrush_GetGradientOriginOffset
グラデーション楕円の中心を基準としたグラデーション原点のオフセットを取得する。
%prm
this
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
%inst
グラデーション楕円の中心を基準としたグラデーション原点のオフセットを取得する。

[戻り値]
型: D2D1_POINT_2F グラデーション楕円の中心からのグラデーション原点のオフセット。値はブラシの座標空間で表される。


%index
ID2D1RadialGradientBrush_GetRadiusX
グラデーション楕円の x 半径を取得する。
%prm
this
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
%inst
グラデーション楕円の x 半径を取得する。

[戻り値]
型: FLOAT グラデーション楕円の x 半径。値はブラシの座標空間で表される。


%index
ID2D1RadialGradientBrush_GetRadiusY
グラデーション楕円の y 半径を取得する。
%prm
this
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
%inst
グラデーション楕円の y 半径を取得する。

[戻り値]
型: FLOAT グラデーション楕円の y 半径。値はブラシの座標空間で表される。


%index
ID2D1RadialGradientBrush_GetGradientStopCollection
この放射状グラデーションブラシオブジェクトに関連付けられた ID2D1GradientStopCollection を取得する。
%prm
this, gradientStopCollection
this : [comobj] ID2D1RadialGradientBrush インターフェースの COM オブジェクト変数
gradientStopCollection : [comobj] 型: ID2D1GradientStopCollection** この線形グラデーションブラシオブジェクトに関連付けられた ID2D1GradientStopCollection オブジェクト。このパラメータは未初期化で渡される。
%inst
この放射状グラデーションブラシオブジェクトに関連付けられた ID2D1GradientStopCollection を取得する。

[備考]
ID2D1GradientStopCollection は D2D1_GRADIENT_STOP
構造体の配列と、拡張モードや色補間モードなどの追加情報を保持する。


%index
ID2D1RectangleGeometry_GetFactory
ID2D1RectangleGeometry::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1RectangleGeometry_GetBounds
ID2D1RectangleGeometry::GetBounds (vtable slot 4)
%prm
this, worldTransform, bounds
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst


%index
ID2D1RectangleGeometry_GetWidenedBounds
ID2D1RectangleGeometry::GetWidenedBounds (vtable slot 5)
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst


%index
ID2D1RectangleGeometry_StrokeContainsPoint
ID2D1RectangleGeometry::StrokeContainsPoint (vtable slot 6)
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1RectangleGeometry_FillContainsPoint
ID2D1RectangleGeometry::FillContainsPoint (vtable slot 7)
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1RectangleGeometry_CompareWithGeometry
ID2D1RectangleGeometry::CompareWithGeometry (vtable slot 8)
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst


%index
ID2D1RectangleGeometry_Simplify
ID2D1RectangleGeometry::Simplify (vtable slot 9)
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RectangleGeometry_Tessellate
ID2D1RectangleGeometry::Tessellate (vtable slot 10)
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst


%index
ID2D1RectangleGeometry_CombineWithGeometry
ID2D1RectangleGeometry::CombineWithGeometry (vtable slot 11)
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RectangleGeometry_Outline
ID2D1RectangleGeometry::Outline (vtable slot 12)
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RectangleGeometry_ComputeArea
ID2D1RectangleGeometry::ComputeArea (vtable slot 13)
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst


%index
ID2D1RectangleGeometry_ComputeLength
ID2D1RectangleGeometry::ComputeLength (vtable slot 14)
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst


%index
ID2D1RectangleGeometry_ComputePointAtLength
ID2D1RectangleGeometry::ComputePointAtLength (vtable slot 15)
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst


%index
ID2D1RectangleGeometry_Widen
ID2D1RectangleGeometry::Widen (vtable slot 16)
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RectangleGeometry_GetRect
矩形ジオメトリの寸法を表す矩形を取得する。
%prm
this, rect
this : [comobj] ID2D1RectangleGeometry インターフェースの COM オブジェクト変数
rect : [var] 型: D2D1_RECT_F* このメソッドが返るときに、矩形ジオメトリの寸法を表す矩形へのポインタが格納される。このパラメータの記憶領域は呼び出し側で確保する必要がある。
%inst
矩形ジオメトリの寸法を表す矩形を取得する。


%index
ID2D1RenderTarget_GetFactory
ID2D1RenderTarget::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1RenderTarget_CreateBitmap
Direct2D ビットマップを作成する。
%prm
this, size, srcData, pitch, bitmapProperties, bitmap
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
size : [int] 
srcData : [intptr] 
pitch : [int] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst
Direct2D ビットマップを作成する。


%index
ID2D1RenderTarget_CreateBitmapFromWicBitmap
指定した Microsoft Windows Imaging Component (WIC) ビットマップをコピーして ID2D1Bitmap を作成する。
%prm
this, wicBitmapSource, bitmapProperties, bitmap
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
wicBitmapSource : [comobj] 
bitmapProperties : [var] 
bitmap : [comobj] 
%inst
指定した Microsoft Windows Imaging Component (WIC) ビットマップをコピーして
ID2D1Bitmap を作成する。

[備考]
Direct2D が WIC
画像を読み込む前に、対応するピクセル形式とアルファモードへの変換が必要である。対応するピクセル形式とアルファモードの一覧については
[Supported Pixel Formats and Alpha
Modes](supported-pixel-formats-and-alpha-modes.md) を参照。


%index
ID2D1RenderTarget_CreateSharedBitmap
他のリソースとデータを共有する ID2D1Bitmap を作成する。
%prm
this, riid, data, bitmapProperties, bitmap
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
riid : [var] 型: REFIID ソースデータを提供するオブジェクトのインターフェース ID。
data : [intptr] 型: void* 新しい ID2D1Bitmap と共有するデータを含む ID2D1Bitmap、IDXGISurface、または IWICBitmapLock。詳細は Remarks を参照。
bitmapProperties : [var] 型: D2D1_BITMAP_PROPERTIES* 作成するビットマップのピクセル形式と DPI。ピクセル形式の DXGI_FORMAT 部分は data の DXGI_FORMAT と一致している必要がある（アルファモードは一致していなくてもよい）。不一致を避けるには NULL または D2D1::PixelFormat ヘルパー関数から得た値を渡せる。DPI 設定は data と一致している必要はない。dpiX と dpiY がいずれも 0.0f の場合はレンダーターゲットの DPI が使用される。
bitmap : [comobj] 型: ID2D1Bitmap** このメソッドが戻ると、新しいビットマップへのポインターのアドレスが格納される。このパラメーターは未初期化で渡される。
%inst
他のリソースとデータを共有する ID2D1Bitmap を作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
CreateSharedBitmap メソッドはビットマップデータを効率よく再利用するのに便利で、Direct3D
との相互運用にも使える。ID2D1Bitmap の共有 リソース互換性のあるレンダーターゲットで作成された ID2D1Bitmap
を渡すことで、そのレンダーターゲットとビットマップを共有できる。元の ID2D1Bitmap とこのメソッドで作成される新しい
ID2D1Bitmap はともに同じビットマップデータを指す。レンダーターゲットリソースをいつ共有できるかについては Resources
Overview の Sharing Render Target Resources セクションを参照。既存のビットマップのデータを新しい
DPI またはアルファモードで再解釈するためにこのメソッドを使うこともできる。例えばビットマップアトラスの場合、ID2D1Bitmap
に複数のサブ画像が含まれ、それぞれ異なる D2D1_ALPHA_MODE (D2D1_ALPHA_MODE_PREMULTIPLIED
または D2D1_ALPHA_MODE_IGNORE) でレンダリングされるべきであることがある。CreateSharedBitmap
を使えばビットマップを別のコピーとしてメモリに読み込み直すことなく、望むアルファモードで再解釈できる。IDXGISurface の共有
DXGI サーフェイスレンダーターゲット（CreateDxgiSurfaceRenderTarget メソッドで作成された
ID2D1RenderTarget オブジェクト）を使用している場合、IDXGISurface サーフェイスを
CreateSharedBitmap に渡すことでビデオメモリを Direct3D と共有し、Direct3D コンテンツを
ID2D1Bitmap として操作できる。Resources Overview で説明されているとおり、レンダーターゲットと
IDXGISurface は同じ Direct3D デバイスを使用していなければならない。
同様に IDXGISurface は Supported Pixel Formats and Alpha Modes
に記載されているサポート対象のピクセル形式とアルファモードのいずれかを使用していなければならない。Direct3D
との相互運用の詳細については Direct2D and Direct3D Interoperability Overview
を参照。IWICBitmapLock の共有 IWICBitmapLock は WIC
ビットマップの内容を格納し、同時アクセスから保護する。IWICBitmapLock を CreateSharedBitmap
に渡すことで、IWICBitmapLock に既に格納されているビットマップデータを指す ID2D1Bitmap
を作成できる。CreateSharedBitmap で IWICBitmapLock
を使用するには、レンダーターゲットはソフトウェアレンダリングを使用していなければならない。レンダーターゲットにソフトウェアレンダリングを強制するには、レンダーターゲット作成時に使う
D2D1_RENDER_TARGET_PROPERTIES 構造体の type フィールドを
D2D1_RENDER_TARGET_TYPE_SOFTWARE
に設定する。既存のレンダーターゲットがソフトウェアレンダリングを使用しているかどうかを確認するには IsSupported
メソッドを使用する。


%index
ID2D1RenderTarget_CreateBitmapBrush
指定したビットマップから ID2D1BitmapBrush を作成する。
%prm
this, bitmap, bitmapBrushProperties, brushProperties, bitmapBrush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
bitmapBrushProperties : [var] 
brushProperties : [var] 
bitmapBrush : [comobj] 
%inst
指定したビットマップから ID2D1BitmapBrush を作成する。


%index
ID2D1RenderTarget_CreateSolidColorBrush
単色で領域を塗りつぶすために使用できる新しい ID2D1SolidColorBrush を作成する。
%prm
this, color, brushProperties, solidColorBrush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
color : [var] 
brushProperties : [var] 
solidColorBrush : [comobj] 
%inst
単色で領域を塗りつぶすために使用できる新しい ID2D1SolidColorBrush を作成する。


%index
ID2D1RenderTarget_CreateGradientStopCollection
指定した D2D1\_GRADIENT\_STOP 構造体の配列から ID2D1GradientStopCollection を作成する。
%prm
this, gradientStops, gradientStopsCount, colorInterpolationGamma, extendMode, gradientStopCollection
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
gradientStops : [var] 
gradientStopsCount : [int] 
colorInterpolationGamma : [int] 
extendMode : [int] 
gradientStopCollection : [comobj] 
%inst
指定した D2D1\_GRADIENT\_STOP 構造体の配列から ID2D1GradientStopCollection を作成する。


%index
ID2D1RenderTarget_CreateLinearGradientBrush
線形グラデーションで領域を塗りつぶすための ID2D1LinearGradientBrush オブジェクトを作成する。
%prm
this, linearGradientBrushProperties, brushProperties, gradientStopCollection, linearGradientBrush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
linearGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
linearGradientBrush : [comobj] 
%inst
線形グラデーションで領域を塗りつぶすための ID2D1LinearGradientBrush オブジェクトを作成する。


%index
ID2D1RenderTarget_CreateRadialGradientBrush
放射状グラデーションで領域を塗りつぶすために使用できる ID2D1RadialGradientBrush オブジェクトを作成する。
%prm
this, radialGradientBrushProperties, brushProperties, gradientStopCollection, radialGradientBrush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
radialGradientBrushProperties : [var] 
brushProperties : [var] 
gradientStopCollection : [comobj] 
radialGradientBrush : [comobj] 
%inst
放射状グラデーションで領域を塗りつぶすために使用できる ID2D1RadialGradientBrush オブジェクトを作成する。


%index
ID2D1RenderTarget_CreateCompatibleRenderTarget
現在のレンダーターゲットと互換性のある、オフスクリーン中間描画用の新しいビットマップレンダーターゲットを作成する。
%prm
this, desiredSize, desiredPixelSize, desiredFormat, options, bitmapRenderTarget
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
desiredSize : [var] 
desiredPixelSize : [var] 
desiredFormat : [var] 
options : [int] 
bitmapRenderTarget : [comobj] 
%inst
現在のレンダーターゲットと互換性のある、オフスクリーン中間描画用の新しいビットマップレンダーターゲットを作成する。


%index
ID2D1RenderTarget_CreateLayer
このレンダーターゲットおよびそれと互換性のあるレンダーターゲットで使用できるレイヤーリソースを作成する。
%prm
this, size, layer
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
size : [var] 
layer : [comobj] 
%inst
このレンダーターゲットおよびそれと互換性のあるレンダーターゲットで使用できるレイヤーリソースを作成する。

[備考]
レイヤーは必要に応じて自動的にサイズ変更される。


%index
ID2D1RenderTarget_CreateMesh
三角形を使って形状を記述するメッシュを作成する。
%prm
this, mesh
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 型: ID2D1Mesh** このメソッドが戻ると、新しいメッシュへのポインターへのポインターが格納される。
%inst
三角形を使って形状を記述するメッシュを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]
メッシュを埋めるには Open メソッドを使って ID2D1TessellationSink
を取得する。メッシュを描画するにはレンダーターゲットの FillMesh メソッドを使用する。


%index
ID2D1RenderTarget_DrawLine
指定したストロークスタイルを使って指定した 2 点間に線を描画する。
%prm
this, point0, point1, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
point0 : [int] 型: D2D1_POINT_2F 線の始点（デバイス非依存ピクセル単位）。
point1 : [int] 型: D2D1_POINT_2F 線の終点（デバイス非依存ピクセル単位）。
brush : [comobj] 型: ID2D1Brush* 線のストロークを塗るのに使用するブラシ。
strokeWidth : [float] 型: FLOAT ストロークの幅（デバイス非依存ピクセル単位）。値は 0.0f 以上でなければならない。このパラメーターを指定しない場合の既定値は 1.0f。ストロークは線の中心に配置される。
strokeStyle : [comobj] 型: ID2D1StrokeStyle* 適用するストロークスタイル。ベタの線を描画する場合は NULL を指定する。
%inst
指定したストロークスタイルを使って指定した 2 点間に線を描画する。

[備考]
このメソッドは失敗してもエラーコードを返さない。DrawLine
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_DrawRectangle
指定した寸法とストロークスタイルを持つ矩形の輪郭を描画する。
%prm
this, rect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst
指定した寸法とストロークスタイルを持つ矩形の輪郭を描画する。

[備考]
このメソッドは失敗してもエラーコードを返さない。**DrawRectangle**
のような描画メソッドが失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_FillRectangle
指定した矩形の内部を塗りつぶす。
%prm
this, rect, brush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
rect : [var] 
brush : [comobj] 
%inst
指定した矩形の内部を塗りつぶす。

[備考]
このメソッドは失敗してもエラーコードを返さない。**FillRectangle**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_DrawRoundedRectangle
指定したストロークスタイルを使って指定した角丸矩形の輪郭を描画する。
%prm
this, roundedRect, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst
指定したストロークスタイルを使って指定した角丸矩形の輪郭を描画する。

[備考]
このメソッドは失敗してもエラーコードを返さない。**DrawRoundedRectangle**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_FillRoundedRectangle
指定した角丸矩形の内部を塗りつぶす。
%prm
this, roundedRect, brush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
roundedRect : [var] 
brush : [comobj] 
%inst
指定した角丸矩形の内部を塗りつぶす。

[備考]
このメソッドは失敗してもエラーコードを返さない。**FillRoundedRectangle**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_DrawEllipse
指定した寸法とストロークで楕円の輪郭を描画する。
%prm
this, ellipse, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
strokeWidth : [float] 
strokeStyle : [comobj] 
%inst
指定した寸法とストロークで楕円の輪郭を描画する。

[備考]
**DrawEllipse** メソッドは失敗してもエラーコードを返さない。**DrawEllipse**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_FillEllipse
指定した楕円の内部を塗りつぶす。
%prm
this, ellipse, brush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
ellipse : [var] 
brush : [comobj] 
%inst
指定した楕円の内部を塗りつぶす。

[備考]
このメソッドは失敗してもエラーコードを返さない。**FillEllipse**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_DrawGeometry
指定したストロークスタイルを使って指定したジオメトリーの輪郭を描画する。
%prm
this, geometry, brush, strokeWidth, strokeStyle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 型: ID2D1Geometry* 描画するジオメトリー。
brush : [comobj] 型: ID2D1Brush* ジオメトリーのストロークを塗るのに使用するブラシ。
strokeWidth : [float] 型: FLOAT ストロークの幅（デバイス非依存ピクセル単位）。値は 0.0f 以上でなければならない。このパラメーターを指定しない場合の既定値は 1.0f。ストロークは線の中心に配置される。
strokeStyle : [comobj] 型: ID2D1StrokeStyle* ジオメトリーの輪郭に適用するストロークスタイル。ベタのストロークを描画する場合は NULL を指定する。
%inst
指定したストロークスタイルを使って指定したジオメトリーの輪郭を描画する。

[備考]
このメソッドは失敗してもエラーコードを返さない。DrawGeometry
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_FillGeometry
指定したジオメトリーの内部を塗りつぶす。
%prm
this, geometry, brush, opacityBrush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
geometry : [comobj] 型: ID2D1Geometry* 塗りつぶすジオメトリー。
brush : [comobj] 型: ID2D1Brush* ジオメトリーの内部を塗るのに使用するブラシ。
opacityBrush : [comobj] 型: ID2D1Brush* ジオメトリーに適用する不透明度マスク。不透明度マスクを使用しない場合は NULL。不透明度マスク（opacityBrush パラメーター）を指定する場合、brush は x/y 拡張モードが D2D1_EXTEND_MODE_CLAMP に設定された ID2D1BitmapBrush でなければならない。詳細は Remarks を参照。
%inst
指定したジオメトリーの内部を塗りつぶす。

[備考]
opacityBrush パラメーターが NULL でない場合、マップされた opacityBrush
の各ピクセルのアルファ値を使ってジオメトリーの対応する各ピクセルの最終的な不透明度が決定される。この処理にはブラシ内の各色のアルファ値のみが使われ、他の色情報はすべて無視される。ブラシが指定するアルファ値は、ジオメトリーが
brush で塗られた後、ジオメトリーのアルファ値に乗算される。
このメソッドは失敗してもエラーコードを返さない。FillGeometry
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_FillMesh
指定したメッシュの内部を塗りつぶす。
%prm
this, mesh, brush
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
mesh : [comobj] 型: ID2D1Mesh* 塗りつぶすメッシュ。
brush : [comobj] 型: ID2D1Brush* メッシュを塗るのに使用するブラシ。
%inst
指定したメッシュの内部を塗りつぶす。

[備考]
FillMesh を呼び出す際、レンダーターゲットの現在のアンチエイリアスモードは D2D1_ANTIALIAS_MODE_ALIASED
でなければならない。レンダーターゲットのアンチエイリアスモードを変更するには SetAntialiasMode
メソッドを使用する。FillMesh は ID2D1Mesh
内の三角形に特定のワインディング順を期待しない。時計回り・反時計回りのどちらでも動作する。このメソッドは失敗してもエラーコードを返さない。FillMesh
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_FillOpacityMask
指定したビットマップが記述する不透明度マスクをブラシに適用し、そのブラシを使ってレンダーターゲットの領域を塗りつぶす。
%prm
this, opacityMask, brush, content, destinationRectangle, sourceRectangle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
opacityMask : [comobj] 
brush : [comobj] 
content : [int] 
destinationRectangle : [var] 
sourceRectangle : [var] 
%inst
指定したビットマップが記述する不透明度マスクをブラシに適用し、そのブラシを使ってレンダーターゲットの領域を塗りつぶす。

[備考]
このメソッドが正しく動作するには、レンダーターゲットが
[**D2D1\_ANTIALIAS\_MODE\_ALIASED**](/windows/desktop/api/d2d1/ne-d2d1-d2d1_antialias_mode)
アンチエイリアスモードを使用している必要がある。アンチエイリアスモードは
[**ID2D1RenderTarget::SetAntialiasMode**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-setantialiasmode)
メソッドで設定できる。このメソッドは失敗してもエラーコードを返さない。**FillOpacityMask**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_DrawBitmap
指定した ID2D1Bitmap を描画する。
%prm
this, bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
bitmap : [comobj] 
destinationRectangle : [var] 
opacity : [float] 
interpolationMode : [int] 
sourceRectangle : [var] 
%inst
指定した ID2D1Bitmap を描画する。

[備考]
このメソッドは失敗してもエラーコードを返さない。**DrawBitmap**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_DrawText
IDWriteTextFormat オブジェクトが提供する書式情報を使って指定したテキストを描画する。
%prm
this, string, stringLength, textFormat, layoutRect, defaultFillBrush, options, measuringMode
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
string : [int] 
stringLength : [int] 
textFormat : [comobj] 
layoutRect : [var] 
defaultFillBrush : [comobj] 
options : [int] 
measuringMode : [int] 
%inst
IDWriteTextFormat オブジェクトが提供する書式情報を使って指定したテキストを描画する。

[備考]
Direct2D でテキストを描画するには、単一の書式のテキストには
[**ID2D1RenderTarget::DrawText**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawtext(constwchar_uint32_idwritetextformat_constd2d1_rect_f__id2d1brush_d2d1_draw_text_options_dwrite_measuring_mode))
メソッドを、複数書式・高度な OpenType 機能・ヒットテストが必要な場合は
[**ID2D1RenderTarget::DrawTextLayout**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawtextlayout)
メソッドを使用する。これらのメソッドは DirectWrite API
を利用して高品質のテキスト表示を提供する。このメソッドは失敗してもエラーコードを返さない。**DrawText**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_DrawTextLayout
指定した IDWriteTextLayout オブジェクトが記述する書式付きテキストを描画する。
%prm
this, origin, textLayout, defaultFillBrush, options
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
origin : [int] 型: D2D1_POINT_2F textLayout が記述するテキストの左上隅が描画される点（デバイス非依存ピクセル単位）。
textLayout : [comobj] 型: IDWriteTextLayout* 描画する書式付きテキスト。ID2D1Resource を継承しない描画効果は無視される。ID2D1Resource を継承するがブラシではない描画効果がある場合、このメソッドは失敗しレンダーターゲットをエラー状態にする。
defaultFillBrush : [comobj] 型: ID2D1Brush* textLayout 内で、描画効果として関連付けられたブラシ（IDWriteTextLayout::SetDrawingEffect メソッドで指定）を持たないテキストを塗るために使用するブラシ。
options : [int] 型: D2D1_DRAW_TEXT_OPTIONS テキストをピクセル境界にスナップするかどうか、およびレイアウト矩形でクリップするかどうかを示す値。既定値は D2D1_DRAW_TEXT_OPTIONS_NONE で、テキストはピクセル境界にスナップされ、レイアウト矩形ではクリップされないことを示す。
%inst
指定した IDWriteTextLayout オブジェクトが記述する書式付きテキストを描画する。

[備考]
同じテキストを繰り返し描画する場合、呼び出しごとにテキストの書式設定とレイアウト処理を必要としないため、DrawText メソッドよりも
DrawTextLayout メソッドの方が効率的である。このメソッドは失敗してもエラーコードを返さない。DrawTextLayout
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_DrawGlyphRun
指定したグリフを描画する。
%prm
this, baselineOrigin, glyphRun, foregroundBrush, measuringMode
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
baselineOrigin : [int] 型: D2D1_POINT_2F グリフのベースラインの原点（デバイス非依存ピクセル単位）。
glyphRun : [int] 型: const DWRITE_GLYPH_RUN* レンダリングするグリフ。
foregroundBrush : [comobj] 型: ID2D1Brush* 指定したグリフを塗るのに使用するブラシ。
measuringMode : [int] 型: DWRITE_MEASURING_MODE テキストの書式設定時にグリフメトリックをどのように使用してテキストを測定するかを示す値。既定値は DWRITE_MEASURING_MODE_NATURAL。
%inst
指定したグリフを描画する。

[備考]
このメソッドは失敗してもエラーコードを返さない。DrawGlyphRun
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_SetTransform
指定した変換をレンダーターゲットに適用し、既存の変換を置き換える。後続のすべての描画操作は変換後の空間で行われる。
%prm
this, transform
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
transform : [var] 
%inst
指定した変換をレンダーターゲットに適用し、既存の変換を置き換える。後続のすべての描画操作は変換後の空間で行われる。


%index
ID2D1RenderTarget_GetTransform
レンダーターゲットの現在の変換を取得する。
%prm
this, transform
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
transform : [var] 型: D2D1_MATRIX_3X2_F* このメソッドが戻ると、レンダーターゲットの現在の変換が格納される。このパラメーターは未初期化で渡される。
%inst
レンダーターゲットの現在の変換を取得する。


%index
ID2D1RenderTarget_SetAntialiasMode
レンダーターゲットのアンチエイリアスモードを設定する。このアンチエイリアスモードは、テキストおよびグリフ描画操作を除く後続のすべての描画操作に適用される。
%prm
this, antialiasMode
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
antialiasMode : [int] 型: D2D1_ANTIALIAS_MODE 以降の描画操作で使用するアンチエイリアスモード。
%inst

レンダーターゲットのアンチエイリアスモードを設定する。このアンチエイリアスモードは、テキストおよびグリフ描画操作を除く後続のすべての描画操作に適用される。

[備考]
テキストおよびグリフ操作のアンチエイリアスモードを指定するには SetTextAntialiasMode メソッドを使用する。


%index
ID2D1RenderTarget_GetAntialiasMode
非テキスト描画操作の現在のアンチエイリアスモードを取得する。
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
非テキスト描画操作の現在のアンチエイリアスモードを取得する。

[戻り値]
型: D2D1_ANTIALIAS_MODE 非テキスト描画操作の現在のアンチエイリアスモード。


%index
ID2D1RenderTarget_SetTextAntialiasMode
以降のテキストおよびグリフ描画操作で使用するアンチエイリアスモードを指定する。
%prm
this, textAntialiasMode
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
textAntialiasMode : [int] 型: D2D1_TEXT_ANTIALIAS_MODE 以降のテキストおよびグリフ描画操作で使用するアンチエイリアスモード。
%inst
以降のテキストおよびグリフ描画操作で使用するアンチエイリアスモードを指定する。


%index
ID2D1RenderTarget_GetTextAntialiasMode
テキストおよびグリフ描画操作の現在のアンチエイリアスモードを取得する。
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
テキストおよびグリフ描画操作の現在のアンチエイリアスモードを取得する。

[戻り値]
型: D2D1_TEXT_ANTIALIAS_MODE テキストおよびグリフ描画操作の現在のアンチエイリアスモード。


%index
ID2D1RenderTarget_SetTextRenderingParams
以降のすべてのテキストおよびグリフ描画操作に適用するテキストレンダリングオプションを指定する。
%prm
this, textRenderingParams
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 型: IDWriteRenderingParams* 以降のすべてのテキストおよびグリフ描画操作に適用するテキストレンダリングオプション。現在のテキストレンダリングオプションをクリアするには NULL を指定する。
%inst
以降のすべてのテキストおよびグリフ描画操作に適用するテキストレンダリングオプションを指定する。

[備考]
textRenderingParams
で指定された設定がレンダーターゲットのテキストアンチエイリアスモード（SetTextAntialiasMode
で指定）と互換性がない場合、後続のテキストおよびグリフ描画操作は失敗し、レンダーターゲットはエラー状態になる。


%index
ID2D1RenderTarget_GetTextRenderingParams
レンダーターゲットの現在のテキストレンダリングオプションを取得する。
%prm
this, textRenderingParams
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
textRenderingParams : [comobj] 型: IDWriteRenderingParams** このメソッドが戻ると、textRenderingParams にはレンダーターゲットの現在のテキストレンダリングオプションへのポインターのアドレスが格納される。
%inst
レンダーターゲットの現在のテキストレンダリングオプションを取得する。

[備考]
textRenderingParams
で指定された設定がレンダーターゲットのテキストアンチエイリアスモード（SetTextAntialiasMode
で指定）と互換性がない場合、後続のテキストおよびグリフ描画操作は失敗し、レンダーターゲットはエラー状態になる。


%index
ID2D1RenderTarget_SetTags
後続の描画操作のラベルを指定する。
%prm
this, tag1, tag2
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
tag1 : [int64] 型: D2D1_TAG 後続の描画操作に適用するラベル。
tag2 : [int64] 型: D2D1_TAG 後続の描画操作に適用するラベル。
%inst
後続の描画操作のラベルを指定する。

[備考]
このメソッドで指定したラベルはデバッグ時のエラーメッセージで出力される。タグが設定されていない場合、各タグの既定値は 0。


%index
ID2D1RenderTarget_GetTags
後続の描画操作のラベルを取得する。
%prm
this, tag1, tag2
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 型: D2D1_TAG* このメソッドが戻ると、後続の描画操作に付ける最初のラベルが格納される。このパラメーターは未初期化で渡される。NULL を指定した場合はこのパラメーターに値は取得されない。
tag2 : [var] 型: D2D1_TAG* このメソッドが戻ると、後続の描画操作に付ける 2 つ目のラベルが格納される。このパラメーターは未初期化で渡される。NULL を指定した場合はこのパラメーターに値は取得されない。
%inst
後続の描画操作のラベルを取得する。

[備考]
両方のパラメーターに同じアドレスを渡した場合、両方のパラメーターが 2 つ目のタグの値を受け取る。


%index
ID2D1RenderTarget_PushLayer
PopLayer が呼び出されるまでの後続のすべての描画操作を受け取るよう、指定したレイヤーをレンダーターゲットに追加する。(overload 1/2)
%prm
this, layerParameters, layer
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
layerParameters : [int] 型: const D2D1_LAYER_PARAMETERS* レイヤーのコンテンツ境界、ジオメトリックマスク、不透明度、不透明度マスク、およびアンチエイリアスオプション。
layer : [comobj] 型: ID2D1Layer* 後続の描画操作を受け取るレイヤー。注意 Windows 8 以降、このパラメーターは省略可能である。レイヤーを指定しない場合、Direct2D がレイヤーリソースを自動的に管理する。
%inst
PopLayer
が呼び出されるまでの後続のすべての描画操作を受け取るよう、指定したレイヤーをレンダーターゲットに追加する。(overload 1/2)

[備考]
PushLayer
メソッドは呼び出し側がレンダリングをレイヤーへリダイレクトし始めることを可能にする。レイヤー内ではすべてのレンダリング操作が有効である。レイヤーの位置はレンダーターゲットに設定されたワールド変換の影響を受ける。PushLayer
の呼び出しには対応する PopLayer の呼び出しが必要である。PopLayer の呼び出しが PushLayer
の呼び出しよりも多い場合、レンダーターゲットはエラー状態になる。未解決のレイヤーがすべてポップされる前に Flush
を呼び出すとレンダーターゲットはエラー状態になり、エラーが返される。このエラー状態は EndDraw の呼び出しでクリアできる。特定の
ID2D1Layer リソースは同時に 1 つしかアクティブにできない。つまり PushLayer
メソッドを呼び出した直後に同じレイヤーリソースで PushLayer メソッドを呼び出すことはできない。2 つ目の PushLayer
メソッドは別のレイヤーリソースで呼び出す必要がある。
このメソッドは失敗してもエラーコードを返さない。PushLayer
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_PopLayer
直前の PushLayer 呼び出しで指定したレイヤーへの描画操作のリダイレクトを停止する。
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
直前の PushLayer 呼び出しで指定したレイヤーへの描画操作のリダイレクトを停止する。

[備考]
PopLayer は直前の PushLayer
呼び出しと対応している必要がある。このメソッドは失敗してもエラーコードを返さない。PopLayer
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_Flush
保留中のすべての描画コマンドを実行する。
%prm
this, tag1, tag2
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 型: D2D1_TAG* このメソッドが戻ると、エラーを発生させた描画操作のタグ、またはエラーがなかった場合は 0 が格納される。このパラメーターは未初期化で渡される。
tag2 : [var] 型: D2D1_TAG* このメソッドが戻ると、エラーを発生させた描画操作のタグ、またはエラーがなかった場合は 0 が格納される。このパラメーターは未初期化で渡される。
%inst
保留中のすべての描画コマンドを実行する。

[戻り値]
型: HRESULT メソッドが成功した場合 S_OK を返す。そうでなければ HRESULT
エラーコードを返し、エラー発生時にアクティブだったタグを tag1 および tag2
に設定する。エラーがなかった場合、このメソッドはエラータグ状態を (0,0) に設定する。

[備考]
このコマンドはレンダーターゲットに関連付けられた Direct3D
デバイスコンテキストをフラッシュしない。このメソッドを呼び出すとレンダーターゲットのエラー状態がリセットされる。


%index
ID2D1RenderTarget_SaveDrawingState
現在の描画状態を、指定した ID2D1DrawingStateBlock に保存する。
%prm
this, drawingStateBlock
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 型: ID2D1DrawingStateBlock* このメソッドが戻ると、レンダーターゲットの現在の描画状態が格納される。このパラメーターはメソッドに渡す前に初期化しておく必要がある。
%inst
現在の描画状態を、指定した ID2D1DrawingStateBlock に保存する。


%index
ID2D1RenderTarget_RestoreDrawingState
レンダーターゲットの描画状態を、指定した ID2D1DrawingStateBlock の状態に設定する。
%prm
this, drawingStateBlock
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
drawingStateBlock : [comobj] 型: ID2D1DrawingStateBlock* レンダーターゲットの新しい描画状態。
%inst
レンダーターゲットの描画状態を、指定した ID2D1DrawingStateBlock の状態に設定する。


%index
ID2D1RenderTarget_PushAxisAlignedClip
以降のすべての描画操作のクリップ先となる矩形を指定する。
%prm
this, clipRect, antialiasMode
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
clipRect : [var] 
antialiasMode : [int] 
%inst
以降のすべての描画操作のクリップ先となる矩形を指定する。

[備考]

[**PushAxisAlignedClip**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushaxisalignedclip(constd2d1_rect_f__d2d1_antialias_mode))
と
[**PopAxisAlignedClip**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-popaxisalignedclip)
のペアは
[**PushLayer**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer))
と
[**PopLayer**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-poplayer)
のペアの外側または内側に出現できるが、互いに重なり合ってはならない。例えば
**PushAxisAlignedClip**、[**PushLayer**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushlayer(constd2d1_layer_parameters__id2d1layer))、**PopLayer**、**PopAxisAlignedClip**
のシーケンスは有効だが、**PushAxisAlignedClip**、**PushLayer**、**PopAxisAlignedClip**、**PopLayer**
のシーケンスは無効である。このメソッドは失敗してもエラーコードを返さない。**PushAxisAlignedClip**
のような描画操作が失敗したかどうかを判定するには、[**ID2D1RenderTarget::EndDraw**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw)
または
[**ID2D1RenderTarget::Flush**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-flush)
の戻り値を確認する。


%index
ID2D1RenderTarget_PopAxisAlignedClip
レンダーターゲットから最後の軸揃えクリップを取り除く。このメソッドを呼び出した後は、そのクリップは後続の描画操作に適用されない。
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
レンダーターゲットから最後の軸揃えクリップを取り除く。このメソッドを呼び出した後は、そのクリップは後続の描画操作に適用されない。

[備考]
PushAxisAlignedClip と PopAxisAlignedClip のペアは PushLayer と PopLayer
のペアの外側または内側に出現できるが、互いに重なり合ってはならない。例えば
PushAxisAlignedClip、PushLayer、PopLayer、PopAxisAlignedClip
のシーケンスは有効だが、PushAxisAlignedClip、PushLayer、PopAxisAlignedClip、PopLayer
のシーケンスは無効である。PopAxisAlignedClip は PushAxisAlignedClip の呼び出しごとに 1
回呼び出す必要がある。例については「How to Clip with an Axis-Aligned Clip
Rectangle」を参照。このメソッドは失敗してもエラーコードを返さない。PopAxisAlignedClip
のような描画操作が失敗したかどうかを判定するには、ID2D1RenderTarget::EndDraw または
ID2D1RenderTarget::Flush の戻り値を確認する。


%index
ID2D1RenderTarget_Clear
描画領域を指定した色でクリアする。
%prm
this, clearColor
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
clearColor : [var] 
%inst
描画領域を指定した色でクリアする。

[備考]
Direct2D は *clearColor*
をストレートアルファ（プリマルチプライドではない）として解釈する。レンダーターゲットのアルファモードが
[**D2D1\_ALPHA\_MODE\_IGNORE**](/windows/desktop/api/dcommon/ne-dcommon-d2d1_alpha_mode)
の場合、*clearColor* のアルファチャンネルは無視され
1.0f（完全不透明）に置き換えられる。レンダーターゲットにアクティブなクリップ（[**PushAxisAlignedClip**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-pushaxisalignedclip(constd2d1_rect_f__d2d1_antialias_mode))
で指定）がある場合、クリア操作はクリップ領域内のみに適用される。


%index
ID2D1RenderTarget_BeginDraw
このレンダーターゲットでの描画を開始する。
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
このレンダーターゲットでの描画を開始する。

[備考]
描画操作は BeginDraw と EndDraw の呼び出しの間でのみ発行できる。BeginDraw と EndDraw
は、レンダーターゲットが Direct2D システムによって使用中であることを示すために使われる。BeginDraw が呼び出されたときの
ID2D1RenderTarget の各実装の振る舞いは異なる場合がある。例えば ID2D1BitmapRenderTarget は
BeginDraw/EndDraw 呼び出しの間ロックされることがあり、DXGI サーフェイスレンダーターゲットは BeginDraw
時に取得されて EndDraw 時に解放されることがあり、ID2D1HwndRenderTarget は BeginDraw
時にバッチを開始し EndDraw 時にプレゼントすることがある。レンダリング操作を呼び出すには BeginDraw
メソッドを先に呼び出す必要があるが、状態の設定と取得は BeginDraw/EndDraw の外でも行える。BeginDraw
が呼び出されると、通常レンダーターゲットはレンダリングコマンドのバッチを蓄積するが、内部バッファがいっぱいになるか Flush
メソッドが呼び出されるか EndDraw が呼び出されるまで、これらコマンドの処理を遅延する。EndDraw
メソッドはバッチ化された描画操作を完了させ、その後操作の成否を示す HRESULT
と、オプションでエラー発生時のレンダーターゲットのタグ状態を返す。EndDraw は常に成功する。直前の EndDraw が失敗した
HRESULT を返した場合でも二度呼び出すべきではない。BeginDraw と対応しない EndDraw を呼び出すと、EndDraw
の前に BeginDraw を呼ぶ必要があることを示すエラーを返す。同一のレンダーターゲットで BeginDraw
を二度呼ぶとエラー状態になり、それ以降は何も描画されず、EndDraw が呼ばれたときに適切な HRESULT とエラー情報を返す。


%index
ID2D1RenderTarget_EndDraw
レンダーターゲットでの描画操作を終了し、現在のエラー状態と関連タグを示す。
%prm
this, tag1, tag2
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
tag1 : [var] 型: D2D1_TAG* このメソッドが戻ると、エラーを発生させた描画操作のタグ、またはエラーがなかった場合は 0 が格納される。このパラメーターは未初期化で渡される。
tag2 : [var] 型: D2D1_TAG* このメソッドが戻ると、エラーを発生させた描画操作のタグ、またはエラーがなかった場合は 0 が格納される。このパラメーターは未初期化で渡される。
%inst
レンダーターゲットでの描画操作を終了し、現在のエラー状態と関連タグを示す。

[戻り値]
型: HRESULT メソッドが成功した場合 S_OK を返す。そうでなければ HRESULT
エラーコードを返し、エラー発生時にアクティブだったタグを tag1 および tag2 に設定する。

[備考]
描画操作は BeginDraw と EndDraw の呼び出しの間でのみ発行できる。
BeginDraw と EndDraw はレンダーターゲットが Direct2D
システムによって使用中であることを示すために使われる。BeginDraw が呼び出されたときの ID2D1RenderTarget
の各実装の振る舞いは異なる場合がある。例えば ID2D1BitmapRenderTarget は BeginDraw/EndDraw
呼び出しの間ロックされることがあり、DXGI サーフェイスレンダーターゲットは BeginDraw 時に取得されて EndDraw
時に解放されることがあり、ID2D1HwndRenderTarget は BeginDraw 時にバッチを開始し EndDraw
時にプレゼントすることがある。レンダリング操作を呼び出すには BeginDraw メソッドを先に呼び出す必要があるが、状態の設定と取得は
BeginDraw/EndDraw の外でも行える。BeginDraw
が呼び出されると、通常レンダーターゲットはレンダリングコマンドのバッチを蓄積するが、内部バッファがいっぱいになるか Flush
メソッドが呼び出されるか EndDraw が呼び出されるまで、これらコマンドの処理を遅延する。EndDraw
メソッドはバッチ化された描画操作を完了させ、その後操作の成否を示す HRESULT
と、オプションでエラー発生時のレンダーターゲットのタグ状態を返す。EndDraw は常に成功する。直前の EndDraw が失敗した
HRESULT を返した場合でも二度呼び出すべきではない。BeginDraw と対応しない EndDraw を呼び出すと、EndDraw
の前に BeginDraw を呼ぶ必要があることを示すエラーを返す。同一のレンダーターゲットで BeginDraw
を二度呼ぶとエラー状態になり、それ以降は何も描画されず、EndDraw が呼ばれたときに適切な HRESULT とエラー情報を返す。


%index
ID2D1RenderTarget_GetPixelFormat
レンダーターゲットのピクセル形式とアルファモードを取得する。
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
レンダーターゲットのピクセル形式とアルファモードを取得する。

[戻り値]
型: D2D1_PIXEL_FORMAT レンダーターゲットのピクセル形式とアルファモード。


%index
ID2D1RenderTarget_SetDpi
レンダーターゲットの DPI (dots per inch) を設定する。
%prm
this, dpiX, dpiY
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 型: FLOAT レンダーターゲットの水平 DPI を指定する 0 以上の値。
dpiY : [float] 型: FLOAT レンダーターゲットの垂直 DPI を指定する 0 以上の値。
%inst
レンダーターゲットの DPI (dots per inch) を設定する。

[備考]
このメソッドはレンダーターゲットのピクセル空間からデバイス非依存空間へのマッピングを指定する。dpiX と dpiY がいずれも 0
の場合は、ファクトリーが読み取ったシステム DPI が選ばれる。一方が 0 でもう一方が未指定の場合、DPI
は変更されない。ID2D1HwndRenderTarget の DPI 既定値は直近にファクトリーが読み取ったシステム DPI
である。その他のレンダーターゲットの既定値は 96 DPI。


%index
ID2D1RenderTarget_GetDpi
レンダーターゲットの DPI (dots per inch) を返す。
%prm
this, dpiX, dpiY
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
dpiX : [float] 型: FLOAT* このメソッドが戻るとレンダーターゲットの水平 DPI が格納される。このパラメーターは未初期化で渡される。
dpiY : [float] 型: FLOAT* このメソッドが戻るとレンダーターゲットの垂直 DPI が格納される。このパラメーターは未初期化で渡される。
%inst
レンダーターゲットの DPI (dots per inch) を返す。

[備考]
このメソッドはレンダーターゲットのピクセル空間からデバイス非依存空間へのマッピングを示す。ID2D1HwndRenderTarget の
DPI 既定値は直近にファクトリーが読み取ったシステム DPI である。その他のレンダーターゲットの既定値は 96 DPI。


%index
ID2D1RenderTarget_GetSize
レンダーターゲットのサイズをデバイス非依存ピクセル単位で返す。
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
レンダーターゲットのサイズをデバイス非依存ピクセル単位で返す。

[戻り値]
型: D2D1_SIZE_F レンダーターゲットの現在のサイズ（デバイス非依存ピクセル単位）。


%index
ID2D1RenderTarget_GetPixelSize
レンダーターゲットのサイズをデバイスピクセル単位で返す。
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
レンダーターゲットのサイズをデバイスピクセル単位で返す。

[戻り値]
型: D2D1_SIZE_U レンダーターゲットのサイズ（デバイスピクセル単位）。


%index
ID2D1RenderTarget_GetMaximumBitmapSize
レンダーターゲットがサポートするビットマップの 1 次元あたりの最大サイズをデバイス依存単位（ピクセル）で取得する。
%prm
this
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
%inst
レンダーターゲットがサポートするビットマップの 1 次元あたりの最大サイズをデバイス依存単位（ピクセル）で取得する。

[戻り値]
型: UINT32 レンダーターゲットがサポートするビットマップの 1 次元あたりの最大サイズ（ピクセル単位）。

[備考]
このメソッドは Direct3D デバイスの最大テクスチャーサイズを返す。注意 ソフトウェアレンダラーと WARP デバイスは 16
メガピクセル (16*1024*1024) の値を返す。このサイズの Direct2D テクスチャーは作成できるが、同じサイズの
Direct3D テクスチャーは作成できない。


%index
ID2D1RenderTarget_IsSupported
レンダーターゲットが指定されたプロパティをサポートしているかどうかを示す。(overload 1/2)
%prm
this, renderTargetProperties
this : [comobj] ID2D1RenderTarget インターフェースの COM オブジェクト変数
renderTargetProperties : [var] 型: const D2D1_RENDER_TARGET_PROPERTIES* テストするレンダーターゲットプロパティ。
%inst
レンダーターゲットが指定されたプロパティをサポートしているかどうかを示す。(overload 1/2)

[戻り値]
型: BOOL 指定したレンダーターゲットプロパティがこのレンダーターゲットでサポートされている場合は TRUE、そうでなければ
FALSE。

[備考]
このメソッドは renderTargetProperties パラメーターで指定された DPI 設定を評価しない。


%index
ID2D1Resource_GetFactory
このリソースに関連付けられているファクトリを取得する。
%prm
this, factory
this : [comobj] ID2D1Resource インターフェースの COM オブジェクト変数
factory : [comobj] 型: ID2D1Factory** このメソッドが返るときに、このリソースを作成したファクトリへのポインタへのポインタが格納される。このパラメータは未初期化の状態で渡す。
%inst
このリソースに関連付けられているファクトリを取得する。


%index
ID2D1RoundedRectangleGeometry_GetFactory
ID2D1RoundedRectangleGeometry::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1RoundedRectangleGeometry_GetBounds
ID2D1RoundedRectangleGeometry::GetBounds (vtable slot 4)
%prm
this, worldTransform, bounds
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst


%index
ID2D1RoundedRectangleGeometry_GetWidenedBounds
ID2D1RoundedRectangleGeometry::GetWidenedBounds (vtable slot 5)
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst


%index
ID2D1RoundedRectangleGeometry_StrokeContainsPoint
ID2D1RoundedRectangleGeometry::StrokeContainsPoint (vtable slot 6)
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1RoundedRectangleGeometry_FillContainsPoint
ID2D1RoundedRectangleGeometry::FillContainsPoint (vtable slot 7)
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1RoundedRectangleGeometry_CompareWithGeometry
ID2D1RoundedRectangleGeometry::CompareWithGeometry (vtable slot 8)
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst


%index
ID2D1RoundedRectangleGeometry_Simplify
ID2D1RoundedRectangleGeometry::Simplify (vtable slot 9)
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RoundedRectangleGeometry_Tessellate
ID2D1RoundedRectangleGeometry::Tessellate (vtable slot 10)
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst


%index
ID2D1RoundedRectangleGeometry_CombineWithGeometry
ID2D1RoundedRectangleGeometry::CombineWithGeometry (vtable slot 11)
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RoundedRectangleGeometry_Outline
ID2D1RoundedRectangleGeometry::Outline (vtable slot 12)
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RoundedRectangleGeometry_ComputeArea
ID2D1RoundedRectangleGeometry::ComputeArea (vtable slot 13)
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst


%index
ID2D1RoundedRectangleGeometry_ComputeLength
ID2D1RoundedRectangleGeometry::ComputeLength (vtable slot 14)
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst


%index
ID2D1RoundedRectangleGeometry_ComputePointAtLength
ID2D1RoundedRectangleGeometry::ComputePointAtLength (vtable slot 15)
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst


%index
ID2D1RoundedRectangleGeometry_Widen
ID2D1RoundedRectangleGeometry::Widen (vtable slot 16)
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1RoundedRectangleGeometry_GetRoundedRect
この角丸矩形ジオメトリを表す角丸矩形を取得する。
%prm
this, roundedRect
this : [comobj] ID2D1RoundedRectangleGeometry インターフェースの COM オブジェクト変数
roundedRect : [var] 型: D2D1_ROUNDED_RECT* この角丸矩形ジオメトリを表す角丸矩形を受け取るポインタ。このパラメータの記憶領域は呼び出し側で確保する必要がある。
%inst
この角丸矩形ジオメトリを表す角丸矩形を取得する。


%index
ID2D1SimplifiedGeometrySink_SetFillMode
このジオメトリシンクが記述するジオメトリにおいて、どの点が内側でどの点が外側であるかを判定するための方式を指定する。
%prm
this, fillMode
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
fillMode : [int] 型: D2D1_FILL_MODE 与えられた点がジオメトリの一部であるかどうかを判定する方式。
%inst
このジオメトリシンクが記述するジオメトリにおいて、どの点が内側でどの点が外側であるかを判定するための方式を指定する。

[備考]
塗りつぶしモードの既定値は D2D1_FILL_MODE_ALTERNATE である。塗りつぶしモードを設定するには、最初の
BeginFigure 呼び出しの前に SetFillMode を呼び出す必要がある。そうしない場合、ジオメトリシンクはエラー状態になる。


%index
ID2D1SimplifiedGeometrySink_SetSegmentFlags
ジオメトリシンクに新たに追加されるセグメントに適用するストロークおよびジョインオプションを指定する。
%prm
this, vertexFlags
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
vertexFlags : [int] 型: D2D1_PATH_SEGMENT ジオメトリシンクに新たに追加されるセグメントに適用するストロークおよびジョインオプション。
%inst
ジオメトリシンクに新たに追加されるセグメントに適用するストロークおよびジョインオプションを指定する。

[備考]

このメソッドが呼び出されると、以降シンクに追加されるすべてのセグメントに指定のセグメントフラグが適用される。セグメントフラグは、このメソッドが再び呼び出されて異なるセグメントフラグ集合が指定されるまで、追加される各セグメントに適用され続ける。


%index
ID2D1SimplifiedGeometrySink_BeginFigure
指定した点から新しいフィギュアを開始する。
%prm
this, startPoint, figureBegin
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
startPoint : [int] 型: D2D1_POINT_2F 新しいフィギュアを開始する点。
figureBegin : [int] 型: D2D1_FIGURE_BEGIN 新しいフィギュアを中空にするか塗りつぶしにするか。
%inst
指定した点から新しいフィギュアを開始する。

[備考]
フィギュアの処理中にこのメソッドが呼ばれた場合、インターフェースは無効化され、以降のすべてのメソッド呼び出しは失敗する。


%index
ID2D1SimplifiedGeometrySink_AddLines
指定された点を用いて直線のシーケンスを生成し、ジオメトリシンクに追加する。
%prm
this, points, pointsCount
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
points : [var] 型: const D2D1_POINT_2F* 描画する線を記述する 1 つ以上の点の配列へのポインタ。ジオメトリシンクの現在の点 (直前に描画したセグメントの終点、または BeginFigure で指定された位置) から配列内の最初の点に向けて線が描画される。配列にさらに点が含まれる場合、最初の点から 2 番目の点、2 番目の点から 3 番目の点へ、というように線が描画される。
pointsCount : [int] 型: UINT points 配列に含まれる点の数。
%inst
指定された点を用いて直線のシーケンスを生成し、ジオメトリシンクに追加する。


%index
ID2D1SimplifiedGeometrySink_AddBeziers
3 次ベジエ曲線のシーケンスを生成し、ジオメトリシンクに追加する。
%prm
this, beziers, beziersCount
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
beziers : [var] 型: const D2D1_BEZIER_SEGMENT* 生成するベジエ曲線を記述するベジエセグメント配列へのポインタ。ジオメトリシンクの現在の点 (直前に描画したセグメントの終点、または BeginFigure で指定された位置) から配列内の最初のベジエセグメントの終点に向けて曲線が描画される。配列にさらにベジエセグメントが含まれる場合、後続の各ベジエセグメントは直前のベジエセグメントの終点を始点とする。
beziersCount : [int] 型: UINT beziers 配列に含まれるベジエセグメントの数。
%inst
3 次ベジエ曲線のシーケンスを生成し、ジオメトリシンクに追加する。


%index
ID2D1SimplifiedGeometrySink_EndFigure
現在のフィギュアを終了する。必要に応じて閉じる。
%prm
this, figureEnd
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
figureEnd : [int] 型: D2D1_FIGURE_END 現在のフィギュアを閉じるかどうかを示す値。閉じる場合、現在の点と BeginFigure で指定した始点の間に線が描画される。
%inst
現在のフィギュアを終了する。必要に応じて閉じる。

[備考]
対応する BeginFigure
の呼び出しなしにこのメソッドを呼び出すとジオメトリシンクはエラー状態になる。以降の呼び出しは無視され、最終的な失敗は Close
メソッド呼び出し時に返される。


%index
ID2D1SimplifiedGeometrySink_Close
ジオメトリシンクを閉じ、エラー状態にあるかどうかを示し、シンクのエラー状態をリセットする。
%prm
this
this : [comobj] ID2D1SimplifiedGeometrySink インターフェースの COM オブジェクト変数
%inst
ジオメトリシンクを閉じ、エラー状態にあるかどうかを示し、シンクのエラー状態をリセットする。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。

[備考]

フィギュアの処理中にジオメトリシンクを閉じてはならない。閉じるとジオメトリシンクはエラー状態になる。クローズ処理を成功させるためには、BeginFigure
呼び出しごとに対応する EndFigure
呼び出しが必要である。このメソッドを呼び出した後、ジオメトリシンクは使用できなくなる場合がある。Direct2D
のこのインターフェース実装ではクローズ後のジオメトリシンクへの変更を許可しないが、他の実装ではこの制約がない場合もある。


%index
ID2D1SolidColorBrush_GetFactory
ID2D1SolidColorBrush::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1SolidColorBrush_SetOpacity
ID2D1SolidColorBrush::SetOpacity (vtable slot 4)
%prm
this, opacity
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
opacity : [float] 
%inst


%index
ID2D1SolidColorBrush_SetTransform
ID2D1SolidColorBrush::SetTransform (vtable slot 5)
%prm
this, transform
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1SolidColorBrush_GetOpacity
ID2D1SolidColorBrush::GetOpacity (vtable slot 6)
%prm
this
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
%inst


%index
ID2D1SolidColorBrush_GetTransform
ID2D1SolidColorBrush::GetTransform (vtable slot 7)
%prm
this, transform
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
transform : [var] 
%inst


%index
ID2D1SolidColorBrush_SetColor
このソリッドカラーブラシの色を指定する。
%prm
this, color
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
color : [var] 
%inst
このソリッドカラーブラシの色を指定する。

[備考]
色の作成を支援するため、Direct2D は
[**ColorF**](/windows/win32/api/d2d1helper/nl-d2d1helper-colorf)
クラスを提供する。このクラスは色を作成するためのヘルパーメソッドと、定義済み色のセットを提供する。


%index
ID2D1SolidColorBrush_GetColor
ソリッドカラーブラシの色を取得する。
%prm
this
this : [comobj] ID2D1SolidColorBrush インターフェースの COM オブジェクト変数
%inst
ソリッドカラーブラシの色を取得する。

[戻り値]
型: D2D1_COLOR_F このソリッドカラーブラシの色。


%index
ID2D1StrokeStyle_GetFactory
ID2D1StrokeStyle::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1StrokeStyle_GetStartCap
ストロークの始端に使用される形状の種類を取得する。
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
ストロークの始端に使用される形状の種類を取得する。

[戻り値]
型: D2D1_CAP_STYLE ストロークの始端に使用される形状の種類。


%index
ID2D1StrokeStyle_GetEndCap
ストロークの終端に使用される形状の種類を取得する。
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
ストロークの終端に使用される形状の種類を取得する。

[戻り値]
型: D2D1_CAP_STYLE ストロークの終端に使用される形状の種類。


%index
ID2D1StrokeStyle_GetDashCap
各ダッシュの端をどのように描画するかを示す値を取得する。
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
各ダッシュの端をどのように描画するかを示す値を取得する。

[戻り値]
型: D2D1_CAP_STYLE 各ダッシュの端をどのように描画するかを示す値。


%index
ID2D1StrokeStyle_GetMiterLimit
マイタ長とストローク厚の半分との比に対する上限を取得する。
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
マイタ長とストローク厚の半分との比に対する上限を取得する。

[戻り値]
型: FLOAT マイタ長とストローク厚の半分との比に対する上限を表す、1.0f 以上の正の数。


%index
ID2D1StrokeStyle_GetLineJoin
図形の輪郭の頂点で使用される接合の種類を取得する。
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
図形の輪郭の頂点で使用される接合の種類を取得する。

[戻り値]
型: D2D1_LINE_JOIN 図形の輪郭の頂点で使用される接合の種類を示す値。


%index
ID2D1StrokeStyle_GetDashOffset
ダッシュシーケンス上のどの位置からストロークを開始するかを示す値を取得する。
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
ダッシュシーケンス上のどの位置からストロークを開始するかを示す値を取得する。

[戻り値]
型: FLOAT ダッシュシーケンス上のどの位置からストロークを開始するかを示す値。


%index
ID2D1StrokeStyle_GetDashStyle
ストロークのダッシュパターンを示す値を取得する。
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
ストロークのダッシュパターンを示す値を取得する。

[戻り値]
型: D2D1_DASH_STYLE 使用される定義済みダッシュパターンを示す値、またはカスタムダッシュスタイルの場合は
D2D1_DASH_STYLE_CUSTOM。

[備考]
カスタムのダッシュスタイルが指定されている場合、ダッシュパターンは dashes 配列で記述され、GetDashes
メソッドで取得できる。


%index
ID2D1StrokeStyle_GetDashesCount
dashes 配列の要素数を取得する。
%prm
this
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
%inst
dashes 配列の要素数を取得する。

[戻り値]
型: UINT32 ストロークが破線である場合は dashes 配列の要素数。それ以外の場合は 0。


%index
ID2D1StrokeStyle_GetDashes
ダッシュパターンを指定された配列にコピーする。
%prm
this, dashes, dashesCount
this : [comobj] ID2D1StrokeStyle インターフェースの COM オブジェクト変数
dashes : [float] 型: FLOAT* ダッシュパターンを受け取る配列へのポインタ。配列には少なくとも dashesCount で指定された数の要素を格納できる必要がある。この配列用の領域は呼び出し側が確保する。
dashesCount : [int] 型: UINT コピーするダッシュの数。この値がストロークスタイルの dashes 配列のダッシュ数より少ない場合、返されるダッシュは dashesCount に切り詰められる。この値がストロークスタイルの dashes 配列のダッシュ数より多い場合、余分なダッシュは 0.0f に設定される。ストロークスタイルの dashes 配列の実際のダッシュ数を取得するには GetDashesCount メソッドを使用する。
%inst
ダッシュパターンを指定された配列にコピーする。

[備考]
ダッシュはストローク幅の倍数単位で指定される。配列の要素はダッシュとダッシュ間の隙間を交互に示す。最初の要素は塗りつぶされたダッシュを、2
番目の要素は隙間を示す。


%index
ID2D1TessellationSink_AddTriangles
指定された三角形をシンクにコピーする。
%prm
this, triangles, trianglesCount
this : [comobj] ID2D1TessellationSink インターフェースの COM オブジェクト変数
triangles : [var] 型: const D2D1_TRIANGLE* シンクに追加する三角形を記述する D2D1_TRIANGLE 構造体の配列。
trianglesCount : [int] 型: UINT triangles 配列からコピーする三角形の数。
%inst
指定された三角形をシンクにコピーする。


%index
ID2D1TessellationSink_Close
シンクを閉じ、そのエラー状態を返す。
%prm
this
this : [comobj] ID2D1TessellationSink インターフェースの COM オブジェクト変数
%inst
シンクを閉じ、そのエラー状態を返す。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は
[**HRESULT**](/windows/desktop/com/structure-of-com-error-codes)
エラーコードを返す。


%index
ID2D1TransformedGeometry_GetFactory
ID2D1TransformedGeometry::GetFactory (vtable slot 3)
%prm
this, factory
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
factory : [comobj] 
%inst


%index
ID2D1TransformedGeometry_GetBounds
ID2D1TransformedGeometry::GetBounds (vtable slot 4)
%prm
this, worldTransform, bounds
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
bounds : [var] 
%inst


%index
ID2D1TransformedGeometry_GetWidenedBounds
ID2D1TransformedGeometry::GetWidenedBounds (vtable slot 5)
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, bounds
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
bounds : [var] 
%inst


%index
ID2D1TransformedGeometry_StrokeContainsPoint
ID2D1TransformedGeometry::StrokeContainsPoint (vtable slot 6)
%prm
this, point, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
point : [int] 
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1TransformedGeometry_FillContainsPoint
ID2D1TransformedGeometry::FillContainsPoint (vtable slot 7)
%prm
this, point, worldTransform, flatteningTolerance, contains
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
point : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
contains : [var] 
%inst


%index
ID2D1TransformedGeometry_CompareWithGeometry
ID2D1TransformedGeometry::CompareWithGeometry (vtable slot 8)
%prm
this, inputGeometry, inputGeometryTransform, flatteningTolerance, relation
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
relation : [var] 
%inst


%index
ID2D1TransformedGeometry_Simplify
ID2D1TransformedGeometry::Simplify (vtable slot 9)
%prm
this, simplificationOption, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
simplificationOption : [int] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1TransformedGeometry_Tessellate
ID2D1TransformedGeometry::Tessellate (vtable slot 10)
%prm
this, worldTransform, flatteningTolerance, tessellationSink
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
tessellationSink : [comobj] 
%inst


%index
ID2D1TransformedGeometry_CombineWithGeometry
ID2D1TransformedGeometry::CombineWithGeometry (vtable slot 11)
%prm
this, inputGeometry, combineMode, inputGeometryTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
inputGeometry : [comobj] 
combineMode : [int] 
inputGeometryTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1TransformedGeometry_Outline
ID2D1TransformedGeometry::Outline (vtable slot 12)
%prm
this, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1TransformedGeometry_ComputeArea
ID2D1TransformedGeometry::ComputeArea (vtable slot 13)
%prm
this, worldTransform, flatteningTolerance, area
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
area : [float] 
%inst


%index
ID2D1TransformedGeometry_ComputeLength
ID2D1TransformedGeometry::ComputeLength (vtable slot 14)
%prm
this, worldTransform, flatteningTolerance, length
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
worldTransform : [var] 
flatteningTolerance : [float] 
length : [float] 
%inst


%index
ID2D1TransformedGeometry_ComputePointAtLength
ID2D1TransformedGeometry::ComputePointAtLength (vtable slot 15)
%prm
this, length, worldTransform, flatteningTolerance, point, unitTangentVector
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
length : [float] 
worldTransform : [var] 
flatteningTolerance : [float] 
point : [var] 
unitTangentVector : [var] 
%inst


%index
ID2D1TransformedGeometry_Widen
ID2D1TransformedGeometry::Widen (vtable slot 16)
%prm
this, strokeWidth, strokeStyle, worldTransform, flatteningTolerance, geometrySink
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
strokeWidth : [float] 
strokeStyle : [comobj] 
worldTransform : [var] 
flatteningTolerance : [float] 
geometrySink : [comobj] 
%inst


%index
ID2D1TransformedGeometry_GetSourceGeometry
この変換済みジオメトリオブジェクトのソースジオメトリを取得する。
%prm
this, sourceGeometry
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
sourceGeometry : [comobj] 型: ID2D1Geometry** このメソッドが返るとき、この変換済みジオメトリオブジェクトのソースジオメトリへのポインタへのポインタを格納する。このパラメータは未初期化の状態で渡される。
%inst
この変換済みジオメトリオブジェクトのソースジオメトリを取得する。


%index
ID2D1TransformedGeometry_GetTransform
ID2D1TransformedGeometry オブジェクトのソースジオメトリを変換するために使用される行列を取得する。
%prm
this, transform
this : [comobj] ID2D1TransformedGeometry インターフェースの COM オブジェクト変数
transform : [var] 型: D2D1_MATRIX_3X2_F* ID2D1TransformedGeometry オブジェクトのソースジオメトリを変換するために使用される行列を受け取るポインタ。このパラメータ用の領域は呼び出し側が確保しなければならない。
%inst
ID2D1TransformedGeometry オブジェクトのソースジオメトリを変換するために使用される行列を取得する。


%index
IDataObject_GetData
データコンシューマーがソースデータオブジェクトからデータを取得するために呼び出す。
%prm
this, pformatetcIn, pmedium
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetcIn : [var] データを渡す際に使用する形式、メディウム、ターゲットデバイスを定義する FORMATETC 構造体へのポインター。ブール OR 演算子を使って複数のメディウムを指定でき、その場合メソッドは指定された中から最適なメディウムを選択できる。
pmedium : [int] tymed メンバーで返されたデータを含む記憶メディウムを示し、pUnkForRelease メンバーでメディウムの解放責任を示す STGMEDIUM 構造体へのポインター。pUnkForRelease が NULL の場合、メディウムの受け取り側が解放責任を負う。そうでない場合、pUnkForRelease は適切なオブジェクトの IUnknown を指し、その Release メソッドを呼び出せる。メディウムは GetData によって確保されデータが埋められなければならない。
%inst
データコンシューマーがソースデータオブジェクトからデータを取得するために呼び出す。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
データコンシューマーは、STGMEDIUM 構造体で定義される記憶メディウムを介してデータオブジェクトからデータを取得するために
GetData を呼び出す。呼び出し側へのメモ ブール OR 演算子で複数の許容可能な tymed メディウムを指定できる。GetData
は OR
された値からデータを最もよく表すメディウムを選択し、確保を行い、メディウムの解放責任を示さなければならない。ストリーム経由で転送されたデータは、ストリームポインターの位置
0 から現在のストリームポインター位置（終了時のストリームポインター位置）直前までに及ぶ。実装者へのメモ GetData は
FORMATETC
構造体のすべてのフィールドを確認しなければならない。要求されたアスペクトをレンダリングし、可能であれば要求されたメディウムを使用することが重要である。データオブジェクトが
FORMATETC で指定された情報に従えない場合、DV_E_FORMATETC
を返すべきである。メディウムの確保に失敗した場合、STG_E_MEDIUMFULL を返すべきである。STGMEDIUM
構造体のすべてのフィールドを埋めることが重要である。呼び出し側はデータ返却用に複数のメディウムを指定できるが、GetData
が提供できるメディウムは 1
つだけである。選択したメディウムで最初の転送が失敗した場合、エラーを返す前に指定された他のメディウムのいずれかを試すように実装できる。


%index
IDataObject_GetDataHere
データコンシューマーがソースデータオブジェクトからデータを取得するために呼び出す。このメソッドは、呼び出し側が指定した記憶メディウムの確保と解放を行わなければならない点で GetData メソッドと異なる。
%prm
this, pformatetc, pmedium
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetc : [var] データを渡す際に使用する形式、メディウム、ターゲットデバイスを定義する FORMATETC 構造体へのポインター。tymed には 1 つのメディウムしか指定できず、TYMED_ISTORAGE、TYMED_ISTREAM、TYMED_HGLOBAL、TYMED_FILE のみが有効である。
pmedium : [int] 転送されるデータを含む記憶メディウムを定義する STGMEDIUM 構造体へのポインター。メディウムは呼び出し側が確保し、GetDataHere が埋める。呼び出し側はメディウムの解放も行う必要がある。このメソッドの実装は、このパラメーターが指す STGMEDIUM 構造体の punkForRelease メンバーに常に NULL を設定しなければならない。
%inst

データコンシューマーがソースデータオブジェクトからデータを取得するために呼び出す。このメソッドは、呼び出し側が指定した記憶メディウムの確保と解放を行わなければならない点で
GetData メソッドと異なる。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
GetDataHere メソッドは IDataObject::GetData と似ているが、pmedium
で指定されるメディウムの確保と解放を呼び出し側が行う必要がある点が異なる。GetDataHere は FORMATETC
構造体で記述されたデータをレンダリングし、呼び出し側が提供する STGMEDIUM 構造体にデータをコピーする。例えばメディウムが
TYMED_HGLOBAL の場合、このメソッドはメディウムのサイズを変更したり新しい hGlobal
を確保したりできない。メタファイルなどの GDI 型などは GetDataHere
での使用に適さないメディウムもある。GetDataHere
メソッドは呼び出し側が提供するメタファイルにデータを格納できない。一般に、このメソッドでサポートすべき記憶メディウムは
TYMED_ISTORAGE、TYMED_ISTREAM、TYMED_FILE のみである。転送メディウムがストリームである場合、OLE
はデータが返される場所とストリームのシークポインターの位置について仮定する。GetData
の呼び出しでは、返されるデータはストリームの位置 0
からストリームの現在のシークポインター（終了時の位置）直前までである。GetDataHere
の場合、返されるデータは呼び出し時のストリームの位置から終了時の位置の直前までである。


%index
IDataObject_QueryGetData
データオブジェクトが指定どおりにデータをレンダリングできるかを判定する。貼り付けやドロップ操作を行うオブジェクトは、IDataObject::GetData を呼び出す前にこのメソッドを呼び出して操作が成功する見込みがあるかを確認できる。
%prm
this, pformatetc
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetc : [var] クエリに使用する形式、メディウム、ターゲットデバイスを定義する FORMATETC 構造体へのポインター。
%inst

データオブジェクトが指定どおりにデータをレンダリングできるかを判定する。貼り付けやドロップ操作を行うオブジェクトは、IDataObject::GetData
を呼び出す前にこのメソッドを呼び出して操作が成功する見込みがあるかを確認できる。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
データオブジェクトのクライアントは QueryGetData を呼び出して、指定した FORMATETC 構造体を後続の
IDataObject::GetData
の呼び出しに渡したときに成功する見込みがあるかを判定する。このメソッドからの成功戻り値は、後続の貼り付けやドロップ操作の成功を必ずしも保証しない。


%index
IDataObject_GetCanonicalFormatEtc
論理的に等価で、場合によっては異なる FORMATETC 構造体を提供する。このメソッドは 2 つの異なる FORMATETC 構造体が同じデータを返すかどうかを判定するのに使用し、重複したレンダリングを不要にする。
%prm
this, pformatectIn, pformatetcOut
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatectIn : [var] 呼び出し側が後続の IDataObject::GetData のような呼び出しでデータを取得するために使いたい形式、メディウム、ターゲットデバイスを定義する FORMATETC 構造体へのポインター。この場合 tymed メンバーは重要ではなく、無視されるべきである。
pformatetcOut : [var] 特定のレンダリングに可能な限り一般的な情報を含み、pformatetcIn と正準的に等価となる FORMATETC 構造体へのポインター。この構造体は呼び出し側が確保し、GetCanonicalFormatEtc メソッドがデータを埋める。後続の IDataObject::GetData のような呼び出しでデータを取得する際、呼び出し側は pformatetcOut の指定値が NULL でない限りそれを使用する。この値はメソッドが DATA_S_SAMEFORMATETC を返した場合に NULL となる。この場合 tymed メンバーは重要ではなく、無視されるべきである。
%inst
論理的に等価で、場合によっては異なる FORMATETC 構造体を提供する。このメソッドは 2 つの異なる FORMATETC
構造体が同じデータを返すかどうかを判定するのに使用し、重複したレンダリングを不要にする。

[戻り値]
このメソッドは以下の値を返すことがある。
（以下省略）

[備考]
データオブジェクトが複数の要求された FORMATETC
構造体に対してまったく同じデータを供給できる場合、GetCanonicalFormatEtc は複数のより複雑な FORMATETC
構造体のセットと同じレンダリングを与える「正準」または標準の FORMATETC を供給できる。例えば、返されるデータが他の点では類似した
FORMATETC 構造体のセット内のどの 1 つで指定されたターゲットデバイスにも影響されないことはよくある。呼び出し側へのメモ 2
つの異なる FORMATETC 構造体を指定してデータオブジェクトに対して IDataObject::GetData を 2
回呼び出したときに、実際に同じレンダリングが生成されるかどうかをこのメソッドで判定できる。これにより 2
回目の呼び出しが不要になり、性能が向上する。GetCanonicalFormatEtc の呼び出しで pformatetcOut
パラメーターに正準形式が書き込まれた場合、呼び出し側はその構造体を以降の IDataObject::GetData
呼び出しで使用する。実装者へのメモ 概念的には、同じ結果を提供する正準 FORMATETC によって定義されるグループに
FORMATETC 構造体を分類できる。正準 FORMATETC
を構築するときは、特定のレンダリングを生成しつつ可能な限り一般的な情報を含むようにすべきである。デバイス固有のレンダリングを提供しないデータオブジェクトの場合、このメソッドの最も単純な実装は入力
FORMATETC を出力 FORMATETC にコピーし、出力 FORMATETC の ptd メンバーに NULL を格納して
DATA_S_SAMEFORMATETC を返すことである。


%index
IDataObject_SetData
データソースを含むオブジェクトから呼び出され、このメソッドを実装するオブジェクトにデータを転送する。
%prm
this, pformatetc, pmedium, fRelease
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetc : [var] 記憶メディウムに含まれるデータをデータオブジェクトが解釈する際の形式を定義する FORMATETC 構造体へのポインター。
pmedium : [int] データが渡される記憶メディウムを定義する STGMEDIUM 構造体へのポインター。
fRelease : [int] TRUE の場合、SetData を実装するデータオブジェクトは呼び出し戻り後に記憶メディウムの所有権を持つ。つまり使用後に ReleaseStgMedium 関数を呼び出してメディウムを解放しなければならない。FALSE の場合、呼び出し側は記憶メディウムの所有権を保持し、呼び出されたデータオブジェクトはこの呼び出しの間だけメディウムを使用する。
%inst
データソースを含むオブジェクトから呼び出され、このメソッドを実装するオブジェクトにデータを転送する。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
SetData
は別のオブジェクトが、実装側のデータオブジェクトにデータを送信しようと試みることを可能にする。別のオブジェクトからデータを受け取るサポートがあるデータオブジェクトはこのメソッドを実装する。サポートしない場合は
E_NOTIMPL を返すように実装すべきである。呼び出し側は pmedium
パラメーターで示される記憶メディウムを確保し、そこにデータが渡される。呼び出されたデータオブジェクトは、データを正常に受け取ってエラーコードを返さない限りデータの所有権を取得しない。fRelease
パラメーターの値は呼び出し戻り後のメディウムの所有権を示す。FALSE
は呼び出し側が依然としてメディウムを所有することを示し、データオブジェクトは呼び出し中のみ使用できる。TRUE
はデータオブジェクトが所有権を持ち、不要になった時点で解放しなければならないことを示す。pformatetc と pmedium
で指定されるメディウムの型は同じでなければならない。例えば、一方がグローバルハンドルでもう一方がストリームであってはならない。


%index
IDataObject_EnumFormatEtc
データオブジェクトがサポートする形式を列挙するオブジェクトを作成する。
%prm
this, dwDirection, ppenumFormatEtc
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
dwDirection : [int] データの方向。取り得る値は DATADIR 列挙子から来る。DATADIR_GET は IDataObject::GetData に渡せる形式を列挙する。DATADIR_SET は IDataObject::SetData に渡せる形式を列挙する。
ppenumFormatEtc : [comobj] 新しい列挙子オブジェクトへのインターフェースポインターを受け取る IEnumFORMATETC ポインター変数へのポインター。
%inst
データオブジェクトがサポートする形式を列挙するオブジェクトを作成する。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
EnumFormatEtc はデータオブジェクトが FORMATETC
構造体でデータを記述する際のあらゆる方法を特定するのに使用できる列挙子オブジェクトを作成し、その IEnumFORMATETC
インターフェースへのポインターを提供する。これは標準的な列挙子インターフェースの 1 つである。呼び出し側へのメモ
ポインターを取得した後、呼び出し側は IEnumFORMATETC の列挙メソッドを呼び出して FORMATETC
構造体を列挙できる。形式は時間とともに変化する可能性があるため、列挙された形式が現在サポートされているとは限らない。したがってアプリケーションは列挙を渡せる形式型のヒントとして扱うべきである。呼び出し側は列挙子の使用を終えたら
Release を呼び出す責任がある。EnumFormatEtc は以下のいずれかの動作が発生したときに呼び出される。
（以下省略）


%index
IDataObject_DAdvise
アドバイスシンクをサポートするオブジェクトから呼び出され、データオブジェクトとアドバイスシンクとの間に接続を作成する。これによりアドバイスシンクがオブジェクトのデータの変更を通知できるようになる。
%prm
this, pformatetc, advf, pAdvSink, pdwConnection
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
pformatetc : [var] 今後の通知で使用する形式、ターゲットデバイス、アスペクト、メディウムを定義する FORMATETC 構造体へのポインター。例えばあるシンクはデータオブジェクト内のデータのビットマップ表現が変更されたときのみ通知を受けたいかもしれない。別のシンクは同じオブジェクトのメタファイル形式にのみ関心を持つかもしれない。各アドバイスシンクは関心のあるデータが変更されたときに通知される。このデータは通知発生時にアドバイスシンクに渡される。
advf : [int] アドバイザリ接続を制御するフラグの組み合わせ。取り得る値は ADVF 列挙子から来る。ただしこのメソッドに関係するのは可能な ADVF 値の一部のみである。以下の表は関連する値を簡単に説明する。
pAdvSink : [comobj] 変更通知を受け取るアドバイスシンク上の IAdviseSink インターフェースへのポインター。
pdwConnection : [int] この接続を識別するトークン。このトークンは後でアドバイザリ接続を削除する際（IDataObject::DUnadvise に渡す）に使える。この値が 0 の場合、接続は確立されなかったことを意味する。
%inst

アドバイスシンクをサポートするオブジェクトから呼び出され、データオブジェクトとアドバイスシンクとの間に接続を作成する。これによりアドバイスシンクがオブジェクトのデータの変更を通知できるようになる。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
DAdvise
はデータオブジェクトと呼び出し側との間に変更通知接続を作成する。呼び出し側は、オブジェクトのデータが変更されたときに通知を送信できるアドバイザリシンクを提供する。単にデータ転送に使われるオブジェクトは通常アドバイザリ通知をサポートせず、DAdvise
から OLE_E_ADVISENOTSUPPORTED を返す。呼び出し側へのメモ アドバイスシンクをサポートするオブジェクトは、渡された
FORMATETC 構造体で対象の形式、アスペクト、メディウム、ターゲットデバイスを指定して DAdvise
を呼び出し、接続を確立する。データオブジェクトが要求された属性のいずれかをサポートしないか、通知の送信自体をサポートしない場合、OLE_E_ADVISENOTSUPPORTED
を返して接続を拒否できる。リンクオブジェクトのコンテナーは、バインド済みのリンクソースと直接アドバイザリ接続を確立することもできるし、接続を管理する標準
OLE
リンクオブジェクトを介して間接的に確立することもできる。バインド済みリンクソースと確立した接続は自動的に削除されない。コンテナーはアドバイザリ接続を削除するために明示的にバインド済みリンクソースで
IDataObject::DUnadvise を呼び出さなければならない。IOleLink インターフェース経由で操作される OLE
リンクオブジェクトは既定ハンドラー内に実装されている。OLE
リンクオブジェクトを介して確立された接続はリンクオブジェクトの削除時に破棄される。OLE
既定のリンクオブジェクトはリンクソースと「ワイルドカードアドバイス」を作成して、OLE
が最終変更時刻を保持できるようにする。このアドバイスは何かが変更された時刻を記録するために特別に使用される。OLE
は変更された可能性のあるすべてのデータ形式を無視し、最終変更時刻のみを記録する。ワイルドカードアドバイスを許可するには、DAdvise
の呼び出し前に FORMATETC メンバーを以下のように設定する。
（以下省略）


%index
IDataObject_DUnadvise
以前に確立された通知接続を破棄する。
%prm
this, dwConnection
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
dwConnection : [int] 削除する接続を示すトークン。接続確立時に IDataObject::DAdvise が返した値を使用する。
%inst
以前に確立された通知接続を破棄する。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
このメソッドは IDataObject::DAdvise の呼び出しで作成された通知を破棄する。削除対象のアドバイザリ接続が
IDataAdviseHolder::Advise への委譲によって最初に確立された場合、それを削除するには
IDataAdviseHolder::Unadvise にこの呼び出しを委譲する必要がある。


%index
IDataObject_EnumDAdvise
現在のアドバイザリ接続を列挙するために使用できるオブジェクトを作成する。
%prm
this, ppenumAdvise
this : [comobj] IDataObject インターフェースの COM オブジェクト変数
ppenumAdvise : [comobj] 新しい列挙子オブジェクトへのインターフェースポインターを受け取る IEnumSTATDATA ポインター変数へのポインター。実装が *ppenumAdvise を NULL に設定した場合、現時点でアドバイスシンクへの接続が存在しないことを意味する。
%inst
現在のアドバイザリ接続を列挙するために使用できるオブジェクトを作成する。

[戻り値]
列挙子オブジェクトが正常にインスタンス化された場合、または接続が存在しない場合は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
このメソッドで作成される列挙子オブジェクトは IEnumSTATDATA インターフェースを実装する。IEnumSTATDATA は
STATDATA 構造体の配列に格納されたデータの列挙を可能にする。これらの構造体のそれぞれは 1
つのアドバイザリ接続に関する情報を提供し、FORMATETC および ADVF
情報に加えてアドバイスシンクへのポインターと接続を表すトークンを含む。呼び出し側へのメモ アドバイザリ接続の処理には OLE
のデータアドバイスホルダーオブジェクトを使うことが推奨される。CreateDataAdviseHolder
の呼び出しで取得したポインターがあれば、IDataObject::EnumDAdvise の実装は単に
IDataAdviseHolder::EnumAdvise に委譲するだけでよい。これにより列挙子が作成され、IEnumSTATDATA
の OLE 実装へのポインターが得られる。その後、そのメソッドを呼び出して現在のアドバイザリ接続を列挙できる。


%index
IDropSource_QueryContinueDrag
ドラッグ&ドロップ操作を継続するか、キャンセルするか、完了するかを判定する。このメソッドを直接呼び出すことはない。ドラッグ&ドロップ操作中に OLE DoDragDrop 関数が呼び出す。
%prm
this, fEscapePressed, grfKeyState
this : [comobj] IDropSource インターフェースの COM オブジェクト変数
fEscapePressed : [int] 前回の QueryContinueDrag の呼び出し以降（初回の場合は DoDragDrop 以降）に Esc キーが押されたかどうかを示す。TRUE はエンドユーザーがエスケープキーを押したことを、FALSE は押されていないことを示す。
grfKeyState : [int] キーボード上の修飾キーの現在の状態。取り得る値は MK_CONTROL、MK_SHIFT、MK_ALT、MK_BUTTON、MK_LBUTTON、MK_MBUTTON、MK_RBUTTON のいずれかの組み合わせである。
%inst

ドラッグ&ドロップ操作を継続するか、キャンセルするか、完了するかを判定する。このメソッドを直接呼び出すことはない。ドラッグ&ドロップ操作中に
OLE DoDragDrop 関数が呼び出す。

[戻り値]
このメソッドは以下の値を返すことがある。
（以下省略）

[備考]
DoDragDrop 関数はドラッグ&ドロップ操作中にキーボードやマウスボタンの状態変化を検出するたびに
QueryContinueDrag を呼び出す。QueryContinueDrag は grfKeyState および
fEscapePressed の内容に基づいて、ドラッグ&ドロップ操作を継続するか、キャンセルするか、完了するかを判定しなければならない。


%index
IDropSource_GiveFeedback
視覚効果を指定する列挙値を DoDragDrop 関数に提供することで、ドラッグ&ドロップ操作中にソースアプリケーションがエンドユーザーに視覚的なフィードバックを与えられるようにする。
%prm
this, dwEffect
this : [comobj] IDropSource インターフェースの COM オブジェクト変数
dwEffect : [int] IDropTarget::DragEnter、IDropTarget::DragOver、または IDropTarget::DragLeave の直近の呼び出しが返した DROPEFFECT 値。
%inst
視覚効果を指定する列挙値を DoDragDrop
関数に提供することで、ドラッグ&ドロップ操作中にソースアプリケーションがエンドユーザーに視覚的なフィードバックを与えられるようにする。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
アプリケーションがユーザーによるドラッグ&ドロップ操作の開始を検出したら、DoDragDrop
関数を呼び出すべきである。DoDragDrop はループに入り、マウスが最初にドロップターゲットウィンドウに入ったときに
IDropTarget::DragEnter を、マウスがターゲットウィンドウ内で位置を変えたときに
IDropTarget::DragOver を、マウスがターゲットウィンドウから出たときに IDropTarget::DragLeave
を呼び出す。IDropTarget::DragEnter または IDropTarget::DragOver
の呼び出しごとに、DoDragDrop はドロップターゲット呼び出しから返された DROPEFFECT 値を渡して
IDropSource::GiveFeedback を呼び出す。
マウスがターゲットウィンドウから出たとき、DoDragDrop は IDropTarget::DragLeave を呼び出す。その後
DoDragDrop は IDropSource::GiveFeedback を呼び出し、dwEffect パラメーターに
DROPEFFECT_NONE を渡す。dwEffect パラメーターには DROPEFFECT_SCROLL
を含めることができ、これはソースが適切なポインターのドラッグスクロール派生形を表示すべきであることを示す。実装者へのメモ この関数は
DoDragDrop
ループ中に頻繁に呼び出されるため、実装をできるだけ最適化することで性能面の利点を得られる。IDropSource::GiveFeedback
は dwEffect
パラメーターの値に基づいてカーソル形状を変えたり、強調表示されるソースを変えたりする責任がある。既定のカーソルを使用する場合は
DRAGDROP_S_USEDEFAULTCURSORS を返せる。そうすると OLE が既定を使ってカーソルを更新する。


%index
IDropTarget_DragEnter
ドロップが受け入れ可能かどうか、受け入れ可能な場合はドロップの効果を示す。
%prm
this, pDataObj, grfKeyState, pt, pdwEffect
this : [comobj] IDropTarget インターフェースの COM オブジェクト変数
pDataObj : [comobj] データオブジェクト上の IDataObject インターフェースへのポインター。このデータオブジェクトにはドラッグ&ドロップ操作で転送されているデータが含まれる。ドロップが発生すると、このデータオブジェクトはターゲットに取り込まれる。
grfKeyState : [int] キーボード上の修飾キーの現在の状態。取り得る値は MK_CONTROL、MK_SHIFT、MK_ALT、MK_BUTTON、MK_LBUTTON、MK_MBUTTON、MK_RBUTTON のいずれかの組み合わせである。
pt : [int] 現在のカーソル位置をスクリーン座標で含む POINTL 構造体。
pdwEffect : [var] 入力時は DoDragDrop 関数の pdwEffect パラメーターの値へのポインター。戻り時はドロップ操作の結果を示す DROPEFFECT フラグのいずれかを含まなければならない。
%inst
ドロップが受け入れ可能かどうか、受け入れ可能な場合はドロップの効果を示す。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
DragEnter を直接呼び出すことはない。代わりに DoDragDrop
関数が、登録済みドロップターゲットのウィンドウにユーザーが初めてマウスをドラッグした際に、ドロップの効果を判定するために呼び出す。DragEnter
を実装するには、ソースデータオブジェクト内のデータをターゲットが使用できるかどうかを、以下の 3 点を確認することで判定する必要がある。
（以下省略）


%index
IDropTarget_DragOver
ユーザーにターゲットフィードバックを提供し、ドロップの効果を DoDragDrop 関数に伝えることで、ドロップの効果をソースに伝達させる。
%prm
this, grfKeyState, pt, pdwEffect
this : [comobj] IDropTarget インターフェースの COM オブジェクト変数
grfKeyState : [int] キーボード上の修飾キーの現在の状態。有効な値は MK_CONTROL、MK_SHIFT、MK_ALT、MK_BUTTON、MK_LBUTTON、MK_MBUTTON、MK_RBUTTON のいずれかの組み合わせである。
pt : [int] 現在のカーソル位置をスクリーン座標で含む POINTL 構造体。
pdwEffect : [var] 入力時は DoDragDrop 関数の pdwEffect パラメーターの値へのポインター。戻り時はドロップ操作の結果を示す DROPEFFECT フラグのいずれかを含まなければならない。
%inst
ユーザーにターゲットフィードバックを提供し、ドロップの効果を DoDragDrop
関数に伝えることで、ドロップの効果をソースに伝達させる。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
DragOver を直接呼び出すことはない。DoDragDrop
関数はユーザーが指定したターゲットウィンドウ上でマウスを動かすたびにこのメソッドを呼び出す。ドラッグ&ドロップ操作がキャンセルされた場合、マウスがターゲットウィンドウから出た場合、またはドロップが完了した場合に
DoDragDrop はループを抜ける。IDropTarget::DragOver を実装する際は
IDropTarget::DragEnter
と同様の機能を提供しなければならない。ドロップの効果は、データオブジェクトの形式とメディウムを定義する FORMATETC
と修飾キーの状態を調べて判定しなければならない。マウス位置もドロップの効果を決定するのに使われることがある。以下の修飾キーはドロップの結果に影響する。
（以下省略）


%index
IDropTarget_DragLeave
ターゲットフィードバックを取り除き、データオブジェクトを解放する。
%prm
this
this : [comobj] IDropTarget インターフェースの COM オブジェクト変数
%inst
ターゲットフィードバックを取り除き、データオブジェクトを解放する。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
このメソッドを直接呼び出すことはない。DoDragDrop 関数は以下のいずれかの場合にこのメソッドを呼び出す。
（以下省略）


%index
IDropTarget_Drop
ソースデータをターゲットウィンドウに取り込み、ターゲットフィードバックを取り除き、データオブジェクトを解放する。
%prm
this, pDataObj, grfKeyState, pt, pdwEffect
this : [comobj] IDropTarget インターフェースの COM オブジェクト変数
pDataObj : [comobj] ドラッグ&ドロップ操作で転送されているデータオブジェクト上の IDataObject インターフェースへのポインター。
grfKeyState : [int] キーボード上の修飾キーの現在の状態。取り得る値は MK_CONTROL、MK_SHIFT、MK_ALT、MK_BUTTON、MK_LBUTTON、MK_MBUTTON、MK_RBUTTON のいずれかの組み合わせである。
pt : [int] 現在のカーソル位置をスクリーン座標で含む POINTL 構造体。
pdwEffect : [var] 入力時は DoDragDrop 関数の pdwEffect パラメーターの値へのポインター。戻り時はドロップ操作の結果を示す DROPEFFECT フラグのいずれかを含まなければならない。
%inst
ソースデータをターゲットウィンドウに取り込み、ターゲットフィードバックを取り除き、データオブジェクトを解放する。

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）

[備考]
このメソッドを直接呼び出すことはない。ユーザーがドラッグ&ドロップ操作を完了したときに DoDragDrop
関数がこのメソッドを呼び出す。Drop の実装では、データオブジェクトをターゲットに取り込まなければならない。pDataObj
経由で取得できる IDataObject
で利用可能な形式と、修飾キーの現在の状態を使用して、データをリンクや埋め込みなどどのように取り込むかを決定する。データの取り込みに加えて、IDropTarget::DragLeave
メソッドと同様にクリーンアップも行う必要がある。
（以下省略）


%index
IDWriteBitmapRenderTarget_DrawGlyphRun
指定した位置でビットマップターゲットにグリフランを描画する。
%prm
this, baselineOriginX, baselineOriginY, measuringMode, glyphRun, renderingParams, textColor, blackBoxRect
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
baselineOriginX : [float] 型: FLOAT DIB の左上隅を基準とした、ベースライン原点の水平位置 (DIP 単位)。
baselineOriginY : [float] 型: FLOAT DIB の左上隅を基準とした、ベースライン原点の垂直位置 (DIP 単位)。
measuringMode : [int] 型: DWRITE_MEASURING_MODE ラン内のグリフの計測方式。他のプロパティと組み合わせてレンダリングモードを決定するために使用される。
glyphRun : [int] 型: const DWRITE_GLYPH_RUN* グリフランのプロパティを含む構造体。
renderingParams : [comobj] 型: IDWriteRenderingParams* 描画動作を制御するオブジェクト。
textColor : [int] 型: COLORREF テキストの前景色。
blackBoxRect : [var] 型: RECT* グリフラン描画で影響を受けるすべてのピクセルの境界ボックス (DIP ではなくピクセル単位) を受け取るオプションの矩形。ブラックボックス矩形はビットマップの寸法を超えて拡張される場合がある。
%inst
指定した位置でビットマップターゲットにグリフランを描画する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
独自に実装したカスタムテキストレンダラーからビットマップへ描画するために
IDWriteBitmapRenderTarget::DrawGlyphRun を使用できる。カスタムテキストレンダラーは
IDWriteTextRenderer::DrawGlyphRun
コールバックメソッド内で次のコードのようにこのメソッドを呼び出すべきである。
（以下省略）


%index
IDWriteBitmapRenderTarget_GetMemoryDC
メモリデバイスコンテキストへのハンドルを取得する。
%prm
this
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
%inst
メモリデバイスコンテキストへのハンドルを取得する。

[戻り値]
型: HDC メモリデバイスコンテキストへのデバイスコンテキストハンドルを返す。

[備考]
アプリケーションはこのデバイスコンテキストを使用して GDI 関数で描画できる。アプリケーションは GetCurrentObject
を呼び出してビットマップハンドル (HBITMAP) を取得できる。内部のビットマップに関する情報 (ピクセルデータへのポインタを含む)
を取得したい場合は、GetObject を呼び出して DIBSECTION 構造体に情報を入れることができる。ビットマップは常に 32
ビットのトップダウン DIB である。このメソッドはパラメータを取らず、HRESULT ではなく HDC 変数を返すことに注意。
（以下省略）


%index
IDWriteBitmapRenderTarget_GetPixelsPerDip
DIP あたりのビットマップピクセル数を取得する。
%prm
this
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
%inst
DIP あたりのビットマップピクセル数を取得する。

[戻り値]
型: FLOAT DIP あたりのビットマップピクセル数。

[備考]
DIP (デバイス非依存ピクセル) は 1/96 インチである。したがってこの値は 1 インチあたりのピクセル数を 96
で割った値となる。


%index
IDWriteBitmapRenderTarget_SetPixelsPerDip
DIP (デバイス非依存ピクセル) あたりのビットマップピクセル数を設定する。DIP は 1/96 インチなので、この値は 1 インチあたりのピクセル数を 96 で割った値となる。
%prm
this, pixelsPerDip
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
pixelsPerDip : [float] 型: FLOAT DIP あたりのピクセル数を指定する値。
%inst
DIP (デバイス非依存ピクセル) あたりのビットマップピクセル数を設定する。DIP は 1/96 インチなので、この値は 1
インチあたりのピクセル数を 96 で割った値となる。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteBitmapRenderTarget_GetCurrentTransform
抽象座標を DIP にマップするトランスフォームを取得する。既定では恒等変換である。これは内部デバイスコンテキストのワールドトランスフォームとは無関係である。
%prm
this, transform
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 型: DWRITE_MATRIX* このメソッドが返るとき、トランスフォーム行列を格納する。
%inst
抽象座標を DIP
にマップするトランスフォームを取得する。既定では恒等変換である。これは内部デバイスコンテキストのワールドトランスフォームとは無関係である。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteBitmapRenderTarget_SetCurrentTransform
抽象座標を DIP (デバイス非依存ピクセル) にマップするトランスフォームを設定する。このメソッドは内部デバイスコンテキストのワールドトランスフォームには影響しない。
%prm
this, transform
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
transform : [var] 型: const DWRITE_MATRIX* 新しいトランスフォームを指定する。このパラメータは NULL にもでき、その場合は恒等変換が暗黙的に適用される。
%inst
抽象座標を DIP (デバイス非依存ピクセル)
にマップするトランスフォームを設定する。このメソッドは内部デバイスコンテキストのワールドトランスフォームには影響しない。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteBitmapRenderTarget_GetSize
ターゲットビットマップの寸法を取得する。
%prm
this, size
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
size : [var] 型: SIZE* ビットマップの幅と高さをピクセル単位で返す。
%inst
ターゲットビットマップの寸法を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteBitmapRenderTarget_Resize
ビットマップをリサイズする。
%prm
this, width, height
this : [comobj] IDWriteBitmapRenderTarget インターフェースの COM オブジェクト変数
width : [int] 型: UINT32 新しいビットマップの幅 (ピクセル単位)。
height : [int] 型: UINT32 新しいビットマップの高さ (ピクセル単位)。
%inst
ビットマップをリサイズする。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_GetSystemFontCollection
インストール済みフォントの集合を表すオブジェクトを取得する。
%prm
this, fontCollection, checkForUpdates
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontCollection : [comobj] 型: IDWriteFontCollection** メソッドが戻る際、システムフォントコレクションオブジェクトへのポインタのアドレスを格納する。失敗時は NULL。
checkForUpdates : [int] 型: BOOL 0 以外の場合、インストール済みフォントの変更を直ちにチェックする。FALSE の場合でも、フォントキャッシュサービスが動作していれば変更は検出されるが、多少のレイテンシが生じる可能性がある。例えば、アプリケーションが自身でフォントをインストールし、それが確実にコレクションに含まれているようにしたい場合には TRUE を指定するとよい。
%inst
インストール済みフォントの集合を表すオブジェクトを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_CreateCustomFontCollection
カスタムフォントコレクションローダーを用いてフォントコレクションを作成する。
%prm
this, collectionLoader, collectionKey, collectionKeySize, fontCollection
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
collectionLoader : [comobj] 型: IDWriteFontCollectionLoader* アプリケーション定義のフォントコレクションローダー。事前に RegisterFontCollectionLoader で登録しておく必要がある。
collectionKey : [intptr] 型: const void* ローダーがフォントファイルのコレクションを識別するために使用するキー。このキー用に確保するバッファは、少なくとも collectionKeySize のサイズを持つ必要がある。
collectionKeySize : [int] 型: UINT32 コレクションキーのサイズ (バイト単位)。
fontCollection : [comobj] 型: IDWriteFontCollection** メソッドが成功した場合はシステムフォントコレクションオブジェクトへのポインタのアドレスを、失敗した場合は NULL を格納する。
%inst
カスタムフォントコレクションローダーを用いてフォントコレクションを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_RegisterFontCollectionLoader
カスタムフォントコレクションローダーをファクトリオブジェクトに登録する。
%prm
this, fontCollectionLoader
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontCollectionLoader : [comobj] 型: IDWriteFontCollectionLoader* 登録対象となる IDWriteFontCollectionLoader オブジェクトへのポインタ。
%inst
カスタムフォントコレクションローダーをファクトリオブジェクトに登録する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数はフォントコレクションローダーを DirectWrite
に登録する。フォントコレクションローダーインターフェースはシングルトンオブジェクトで実装されるべきで、特定の種類のキーを与えられたときにフォントコレクション内のフォントファイルを列挙する役割を持つ。同一インスタンスは一度しか登録できず、再度登録しようとするとエラーが返される。なお、フォントファイルローダーの実装は、コンストラクタ内で
DirectWrite
に自身を登録してはならず、デストラクタ内で登録解除してもならない。登録/登録解除はそれぞれオブジェクトの参照カウントを増減させるためである。代わりに、フォントファイルローダーの
DirectWrite への登録/登録解除は、ローダー実装の外側で行うべきである。


%index
IDWriteFactory_UnregisterFontCollectionLoader
以前に RegisterFontCollectionLoader で登録したカスタムフォントコレクションローダーを登録解除する。
%prm
this, fontCollectionLoader
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontCollectionLoader : [comobj] 型: IDWriteFontCollectionLoader* 登録解除対象となる IDWriteFontCollectionLoader オブジェクトへのポインタ。
%inst
以前に RegisterFontCollectionLoader で登録したカスタムフォントコレクションローダーを登録解除する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_CreateFontFileReference
ローカルのフォントファイルからフォントファイル参照オブジェクトを作成する。
%prm
this, filePath, lastWriteTime, fontFile
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
filePath : [wstr] 型: const WCHAR* フォントファイルの絶対パスを格納した文字配列。filePath がディスク上の有効なファイルに対応していない場合、作成後のオブジェクトに対する後続操作は失敗する可能性がある。
lastWriteTime : [var] 型: const FILETIME* 入力ファイルパスの最終更新日時。省略した場合、関数はフォントファイルにアクセスして最終書き込み日時を取得する。余分なディスクアクセスを避けるためにはこの値を指定すべきである。lastWriteTime がディスク上のファイルと一致しない場合、後続操作は失敗する可能性がある。
fontFile : [comobj] 型: IDWriteFontFile** メソッドが戻る際、新規作成されたフォントファイル参照オブジェクトへのポインタのアドレスを格納する。失敗時は NULL。
%inst
ローカルのフォントファイルからフォントファイル参照オブジェクトを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_CreateCustomFontFileReference
アプリケーション固有のフォントファイルリソースへの参照を作成する。
%prm
this, fontFileReferenceKey, fontFileReferenceKeySize, fontFileLoader, fontFile
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontFileReferenceKey : [intptr] 型: const void* fontFileLoader の生存期間中、フォントファイルリソースを一意に識別するためのフォントファイル参照キー。
fontFileReferenceKeySize : [int] 型: UINT32 フォントファイル参照キーのサイズ (バイト単位)。
fontFileLoader : [comobj] 型: IDWriteFontFileLoader* fontFileReferenceKey で識別されるファイルからデータを読み込むためにフォントシステムが使用するフォントファイルローダー。
fontFile : [comobj] 型: IDWriteFontFile** メソッドが成功した場合は新規作成されたフォントファイルオブジェクトへのポインタのアドレスを、失敗した場合は NULL を格納する。
%inst
アプリケーション固有のフォントファイルリソースへの参照を作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]

この関数は、アプリケーションやドキュメントがシステムにインストールすることなくプライベートフォントを使用する必要がある場合に提供される。fontFileReferenceKey
は、この呼び出しで使用される fontFileLoader のスコープ内でのみ一意であればよい。


%index
IDWriteFactory_CreateFontFace
フォントフェイスを表すオブジェクトを作成する。
%prm
this, fontFaceType, numberOfFiles, fontFiles, faceIndex, fontFaceSimulationFlags, fontFace
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontFaceType : [int] 型: DWRITE_FONT_FACE_TYPE フォントフェイスのファイル形式の種類を示す値。
numberOfFiles : [int] 型: UINT32 フォントフェイスを表すために必要なフォントファイルの数 (要素数)。
fontFiles : [comobj] 型: const IDWriteFontFile* フォントフェイスを表すフォントファイルオブジェクト。IDWriteFontFace は入力のフォントファイルオブジェクトへの参照を自身で保持するため、本呼び出し後に解放してよい。
faceIndex : [int] 型: UINT32 フォントファイルがフォントフェイスのコレクションを含む場合の、フォントフェイスの 0 起点インデックス。単一のフェイスしか含まない場合は 0 を指定する。
fontFaceSimulationFlags : [int] 型: DWRITE_FONT_SIMULATIONS 現在のフォントフェイスに対して、テキストをアルゴリズム的にボールドやイタリックにするためのフォントフェイスシミュレーションフラグを指定する値。
fontFace : [comobj] 型: IDWriteFontFace** メソッドが戻る際、新規作成されたフォントフェイスオブジェクトへのポインタのアドレスを格納する。失敗時は NULL。
%inst
フォントフェイスを表すオブジェクトを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_CreateRenderingParams
プライマリモニター向けの既定設定を持つレンダリングパラメータオブジェクトを作成する。モニターごとに異なるレンダリングパラメータを持つ場合があるため、詳細はマルチモニターサポートの追加方法を参照のこと。
%prm
this, renderingParams
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
renderingParams : [comobj] 型: IDWriteRenderingParams** メソッドが戻る際、新規作成されたレンダリングパラメータオブジェクトへのポインタのアドレスを格納する。
%inst

プライマリモニター向けの既定設定を持つレンダリングパラメータオブジェクトを作成する。モニターごとに異なるレンダリングパラメータを持つ場合があるため、詳細はマルチモニターサポートの追加方法を参照のこと。

[戻り値]
型: HRESULT 標準の HRESULT エラーコード。


%index
IDWriteFactory_CreateMonitorRenderingParams
指定したモニター向けの既定設定を持つレンダリングパラメータオブジェクトを作成する。多くの場合、これがレンダリングパラメータオブジェクトを作成する推奨の方法である。
%prm
this, monitor, renderingParams
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
monitor : [int] 型: HMONITOR 対象となるモニターのハンドル。
renderingParams : [comobj] 型: IDWriteRenderingParams** メソッドが戻る際、このメソッドで作成されたレンダリングパラメータオブジェクトへのポインタのアドレスを格納する。
%inst

指定したモニター向けの既定設定を持つレンダリングパラメータオブジェクトを作成する。多くの場合、これがレンダリングパラメータオブジェクトを作成する推奨の方法である。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_CreateCustomRenderingParams
指定したプロパティを持つレンダリングパラメータオブジェクトを作成する。(IDWriteFactory.CreateCustomRenderingParams)
%prm
this, gamma, enhancedContrast, clearTypeLevel, pixelGeometry, renderingMode, renderingParams
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
gamma : [float] 型: FLOAT 新しいレンダリングパラメータオブジェクトに設定するガンマレベル。
enhancedContrast : [float] 型: FLOAT 新しいレンダリングパラメータオブジェクトに設定する拡張コントラストレベル。
clearTypeLevel : [float] 型: FLOAT 新しいレンダリングパラメータオブジェクトに設定する ClearType レベル。
pixelGeometry : [int] 型: DWRITE_PIXEL_GEOMETRY テキストのレンダリングで想定されるデバイスピクセルの内部構造 (赤・緑・青の色成分の物理的な配置) を表す。
renderingMode : [int] 型: DWRITE_RENDERING_MODE グリフをレンダリングする方式 (例: ClearType natural quality) を表す値。
renderingParams : [comobj] 型: IDWriteRenderingParams** メソッドが戻る際、新規作成されたレンダリングパラメータオブジェクトへのポインタのアドレスを格納する。
%inst

指定したプロパティを持つレンダリングパラメータオブジェクトを作成する。(IDWriteFactory.CreateCustomRenderingParams)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_RegisterFontFileLoader
フォントファイルローダーを DirectWrite に登録する。
%prm
this, fontFileLoader
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontFileLoader : [comobj] 型: IDWriteFontFileLoader* 特定のファイルリソース種別に対する IDWriteFontFileLoader オブジェクトへのポインタ。
%inst
フォントファイルローダーを DirectWrite に登録する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数はフォントファイルローダーを DirectWrite
に登録する。フォントファイルローダーインターフェースはシングルトンオブジェクトで実装されるべきで、キーから特定種別のフォントファイルリソースを読み込む役割を持つ。同一インスタンスは一度しか登録できず、再度登録しようとするとエラーが返される。なお、フォントファイルローダーの実装は、コンストラクタ内で
DirectWrite
に自身を登録してはならず、デストラクタ内で登録解除してもならない。登録/登録解除はそれぞれオブジェクトの参照カウントを増減させるためである。代わりに、フォントファイルローダーの
DirectWrite への登録/登録解除は、ローダー実装の外側で行うべきである。


%index
IDWriteFactory_UnregisterFontFileLoader
以前に RegisterFontFileLoader で DirectWrite のフォントシステムに登録したフォントファイルローダーを登録解除する。
%prm
this, fontFileLoader
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontFileLoader : [comobj] 型: IDWriteFontFileLoader* 以前に RegisterFontFileLoader で DirectWrite のフォントシステムに登録したファイルローダーへのポインタ。
%inst
以前に RegisterFontFileLoader で DirectWrite
のフォントシステムに登録したフォントファイルローダーを登録解除する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数は DirectWrite
のフォントシステムからフォントファイルローダーのコールバックを登録解除する。フォントファイルローダーインターフェースはシングルトンオブジェクトで実装すべきである。なお、フォントファイルローダーの実装は、コンストラクタ内で
DirectWrite
に自身を登録してはならず、デストラクタ内で登録解除してもならない。登録/登録解除はそれぞれオブジェクトの参照カウントを増減させるためである。代わりに、フォントファイルローダーの
DirectWrite への登録/登録解除は、ローダー実装の外側で行うべきである。


%index
IDWriteFactory_CreateTextFormat
テキストレイアウトに使用するテキストフォーマットオブジェクトを作成する。(IDWriteFactory.CreateTextFormat)
%prm
this, fontFamilyName, fontCollection, fontWeight, fontStyle, fontStretch, fontSize, localeName, textFormat
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
fontFamilyName : [wstr] 型: const WCHAR* フォントファミリー名を格納する文字配列。
fontCollection : [comobj] 型: IDWriteFontCollection* フォントコレクションオブジェクトへのポインタ。NULL の場合はシステムフォントコレクションを指定したことになる。
fontWeight : [int] 型: DWRITE_FONT_WEIGHT このメソッドで作成されるテキストオブジェクトのフォントウェイトを示す値。
fontStyle : [int] 型: DWRITE_FONT_STYLE このメソッドで作成されるテキストオブジェクトのフォントスタイルを示す値。
fontStretch : [int] 型: DWRITE_FONT_STRETCH このメソッドで作成されるテキストオブジェクトのフォントストレッチを示す値。
fontSize : [float] 型: FLOAT フォントの論理サイズ (DIP 単位)。1 DIP は 1/96 インチに相当する。
localeName : [wstr] 型: const WCHAR* ロケール名を格納する文字配列。
textFormat : [comobj] 型: IDWriteTextFormat** メソッドが戻る際、新規作成されたテキストフォーマットオブジェクトへのポインタのアドレスを格納する。失敗時は NULL。
%inst
テキストレイアウトに使用するテキストフォーマットオブジェクトを作成する。(IDWriteFactory.CreateTextFormat)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_CreateTypography
テキストレイアウトで使用するタイポグラフィオブジェクトを作成する。
%prm
this, typography
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
typography : [comobj] 型: IDWriteTypography** メソッドが戻る際、新規作成されたタイポグラフィオブジェクトへのポインタのアドレスを格納する。失敗時は NULL。
%inst
テキストレイアウトで使用するタイポグラフィオブジェクトを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_GetGdiInterop
GDI との相互運用に使用するオブジェクトを作成する。
%prm
this, gdiInterop
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
gdiInterop : [comobj] 型: IDWriteGdiInterop** メソッドが戻る際、成功時は GDI 相互運用オブジェクトへのポインタのアドレスを、失敗時は NULL を格納する。
%inst
GDI との相互運用に使用するオブジェクトを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_CreateTextLayout
文字列、テキストフォーマット、および付随する制約を受け取り、完全に解析・整形された結果を表すオブジェクトを生成する。
%prm
this, string, stringLength, textFormat, maxWidth, maxHeight, textLayout
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
string : [int] 
stringLength : [int] 型: UINT32 文字列中の文字数。
textFormat : [comobj] 型: IDWriteTextFormat* 文字列に適用するフォーマットを示すオブジェクトへのポインタ。
maxWidth : [float] 型: FLOAT レイアウトボックスの幅。
maxHeight : [float] 型: FLOAT レイアウトボックスの高さ。
textLayout : [comobj] 型: IDWriteTextLayout** メソッドが戻る際、生成されたテキストレイアウトオブジェクトへのポインタのアドレスを格納する。
%inst
文字列、テキストフォーマット、および付随する制約を受け取り、完全に解析・整形された結果を表すオブジェクトを生成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_CreateGdiCompatibleTextLayout
文字列、フォーマット、および付随する制約を受け取り、特定の表示解像度と計測モード向けに整形した結果を表すオブジェクトを生成する。
%prm
this, string, stringLength, textFormat, layoutWidth, layoutHeight, pixelsPerDip, transform, useGdiNatural, textLayout
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
string : [int] 
stringLength : [int] 型: UINT32 文字列の長さ (文字数)。
textFormat : [comobj] 型: IDWriteTextFormat* 文字列に適用するテキストフォーマットオブジェクト。
layoutWidth : [float] 型: FLOAT レイアウトボックスの幅。
layoutHeight : [float] 型: FLOAT レイアウトボックスの高さ。
pixelsPerDip : [float] 型: FLOAT DIP (デバイス非依存ピクセル) あたりの物理ピクセル数。例えば 96 DPI のデバイスにレンダリングする場合は 1、120 DPI のデバイスの場合は 1.25 (120/96) となる。
transform : [var] 型: const DWRITE_MATRIX* グリフおよびその位置に適用する任意のトランスフォーム。このトランスフォームは、フォントサイズと DIP あたりのピクセル数による拡大縮小の後に適用される。
useGdiNatural : [int] 型: BOOL FALSE のとき、テキストレイアウトに GDI の二値テキストと同じメトリクスを使用させる。TRUE のとき、CLEARTYPE_NATURAL_QUALITY で作成されたフォントを用いて GDI が計測したテキストと同じメトリクスを使用させる。
textLayout : [comobj] 型: IDWriteTextLayout** メソッドが戻る際、生成されたテキストレイアウトオブジェクトへのポインタのアドレスを格納する。
%inst
文字列、フォーマット、および付随する制約を受け取り、特定の表示解像度と計測モード向けに整形した結果を表すオブジェクトを生成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
生成されたテキストレイアウトは意図した解像度でのみ使用すべきであり、テキストのスケーラビリティが必要な場合は
CreateTextLayout を使用すべきである。


%index
IDWriteFactory_CreateEllipsisTrimmingSign
省略記号をトリミング記号として用いる、トリミング用のインラインオブジェクトを作成する。
%prm
this, textFormat, trimmingSign
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
textFormat : [comobj] 型: IDWriteTextFormat* CreateTextFormat で作成され、テキストレイアウトに使用されるテキストフォーマットオブジェクト。
trimmingSign : [comobj] 型: IDWriteInlineObject** メソッドが戻る際、このメソッドで作成された省略記号 (楕円トリミング記号) へのポインタのアドレスを格納する。
%inst
省略記号をトリミング記号として用いる、トリミング用のインラインオブジェクトを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
省略記号は、フォーマットの現在の設定 (ベースフォント、スタイル、各種効果を含む)
を使用して作成される。代替の省略記号は、アプリケーションが IDWriteInlineObject を実装することで作成できる。


%index
IDWriteFactory_CreateTextAnalyzer
テキスト解析を行うためのインターフェースを返す。
%prm
this, textAnalyzer
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
textAnalyzer : [comobj] 型: IDWriteTextAnalyzer** メソッドが戻る際、新規作成されたテキストアナライザーオブジェクトへのポインタのアドレスを格納する。
%inst
テキスト解析を行うためのインターフェースを返す。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_CreateNumberSubstitution
ロケール名、置換方式、およびユーザーによる上書きを無視するか (無視する場合は指定カルチャの NLS 既定値を使う) を示すフラグを指定して、数字置換オブジェクトを作成する。
%prm
this, substitutionMethod, localeName, ignoreUserOverride, numberSubstitution
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
substitutionMethod : [int] 型: DWRITE_NUMBER_SUBSTITUTION_METHOD 数字および関連する記号に対する置換方式を指定する値。
localeName : [wstr] 型: const WCHAR* numberSubstitution オブジェクトで使用するロケール名。
ignoreUserOverride : [int] 型: BOOL ユーザーによる上書きを無視するかどうかを示すブールフラグ。
numberSubstitution : [comobj] 型: IDWriteNumberSubstitution** メソッドが戻る際、このメソッドで作成された数字置換オブジェクトへのポインタのアドレスを格納する。
%inst
ロケール名、置換方式、およびユーザーによる上書きを無視するか (無視する場合は指定カルチャの NLS 既定値を使う)
を示すフラグを指定して、数字置換オブジェクトを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteFactory_CreateGlyphRunAnalysis
グリフランのレンダリングに使用する情報をカプセル化したグリフラン解析オブジェクトを作成する。(IDWriteFactory.CreateGlyphRunAnalysis)
%prm
this, glyphRun, pixelsPerDip, transform, renderingMode, measuringMode, baselineOriginX, baselineOriginY, glyphRunAnalysis
this : [comobj] IDWriteFactory インターフェースの COM オブジェクト変数
glyphRun : [int] 型: const DWRITE_GLYPH_RUN* グリフラン (フォントフェイス、アドバンスなど) のプロパティを格納する構造体。
pixelsPerDip : [float] 型: FLOAT DIP (デバイス非依存ピクセル) あたりの物理ピクセル数。例えば 96 DPI のビットマップにレンダリングする場合は 1、120 DPI のビットマップの場合は 1.25 となる。
transform : [var] 型: const DWRITE_MATRIX* グリフおよびその位置に適用する任意のトランスフォーム。このトランスフォームは emSize と pixelsPerDip による拡大縮小の後に適用される。
renderingMode : [int] 型: DWRITE_RENDERING_MODE レンダリングモードを指定する値。ラスターレンダリングモード (つまり default や outline でないもの) のいずれかでなければならない。
measuringMode : [int] 型: DWRITE_MEASURING_MODE グリフに対して使用する計測モードを指定する。
baselineOriginX : [float] 型: FLOAT ベースライン原点の水平位置 (X 座標)。DIP 単位。
baselineOriginY : [float] 型: FLOAT ベースライン原点の垂直位置 (Y 座標)。DIP 単位。
glyphRunAnalysis : [comobj] 型: IDWriteGlyphRunAnalysis** メソッドが戻る際、新規作成されたグリフラン解析オブジェクトへのポインタのアドレスを格納する。
%inst

グリフランのレンダリングに使用する情報をカプセル化したグリフラン解析オブジェクトを作成する。(IDWriteFactory.CreateGlyphRunAnalysis)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
グリフラン解析オブジェクトは、グリフランを解析した結果 (全グリフの位置と、フォントキャッシュ内のラスタ化されたグリフへの参照を含む)
を保持する。


%index
IDWriteFont_GetFontFamily
指定したフォントが属するフォントファミリを取得する。
%prm
this, fontFamily
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
fontFamily : [comobj] 型: IDWriteFontFamily** このメソッドが返るとき、指定フォントが属するフォントファミリオブジェクトへのポインタのアドレスを格納する。
%inst
指定したフォントが属するフォントファミリを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteFont_GetWeight
指定フォントのウェイト (ストロークの太さ) を取得する。
%prm
this
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
%inst
指定フォントのウェイト (ストロークの太さ) を取得する。

[戻り値]
型: DWRITE_FONT_WEIGHT 指定フォントのウェイトを示す値。


%index
IDWriteFont_GetStretch
指定フォントのストレッチ (幅) を取得する。
%prm
this
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
%inst
指定フォントのストレッチ (幅) を取得する。

[戻り値]
型: DWRITE_FONT_STRETCH 指定フォントに適用されているストレッチ (幅) の種類を示す値。


%index
IDWriteFont_GetStyle
指定フォントのスタイル (傾斜) を取得する。
%prm
this
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
%inst
指定フォントのスタイル (傾斜) を取得する。

[戻り値]
型: DWRITE_FONT_STYLE 指定フォントのスタイル (傾斜) の種類を示す値。


%index
IDWriteFont_IsSymbolFont
フォントがシンボルフォントかどうかを判定する。(IDWriteFont.IsSymbolFont)
%prm
this
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
%inst
フォントがシンボルフォントかどうかを判定する。(IDWriteFont.IsSymbolFont)

[戻り値]
型: BOOL フォントがシンボルフォントであれば TRUE、そうでなければ FALSE。


%index
IDWriteFont_GetFaceNames
フォントのフェイス名 (Regular や Bold など) を、ロケール名でインデックス化したローカライズ文字列コレクションとして取得する。
%prm
this, names
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
names : [comobj] 型: IDWriteLocalizedStrings** このメソッドが返るとき、新しく生成されたローカライズ文字列オブジェクトへのポインタのアドレスを格納する。
%inst
フォントのフェイス名 (Regular や Bold など)
を、ロケール名でインデックス化したローカライズ文字列コレクションとして取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteFont_GetInformationalStrings
指定した情報文字列を、ロケール名でインデックス化したローカライズ文字列コレクションとして取得する。
%prm
this, informationalStringID, informationalStrings, exists
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
informationalStringID : [int] 型: DWRITE_INFORMATIONAL_STRING_ID 取得する情報文字列を識別する値。たとえば DWRITE_INFORMATIONAL_STRING_DESCRIPTION はフォントの説明を含む文字列を指定する。
informationalStrings : [comobj] 型: IDWriteLocalizedStrings** このメソッドが返るとき、新しく生成されたローカライズ文字列オブジェクトへのポインタのアドレスを格納する。
exists : [var] 型: BOOL* このメソッドが返るとき、フォントが指定した文字列 ID を含んでいれば TRUE、そうでなければ FALSE を格納する。
%inst
指定した情報文字列を、ロケール名でインデックス化したローカライズ文字列コレクションとして取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
フォントが informationalStringID で指定された文字列を含んでいない場合、戻り値は S_OK
だが、informationalStrings には NULL ポインタが、exists には FALSE が格納される。


%index
IDWriteFont_GetSimulations
指定フォントに適用されているシミュレーションを示す値を取得する。
%prm
this
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
%inst
指定フォントに適用されているシミュレーションを示す値を取得する。

[戻り値]
型: DWRITE_FONT_SIMULATIONS 指定フォントに適用されているシミュレーション (なし、ボールド、斜体) の 1
つ以上の種類を示す値。


%index
IDWriteFont_GetMetrics
フォントフェイスのデザイン単位と共通メトリクスを取得する。これらのメトリクスはフォントフェイス内のすべてのグリフに適用され、アプリケーションのレイアウト計算に使用される。(IDWriteFont.GetMetrics)
%prm
this, fontMetrics
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
fontMetrics : [var] 型: DWRITE_FONT_METRICS* このメソッドが返るとき、現在のフォントフェイスのフォントメトリクスを格納した構造体。この関数が返すメトリクスはフォントデザイン単位である。
%inst

フォントフェイスのデザイン単位と共通メトリクスを取得する。これらのメトリクスはフォントフェイス内のすべてのグリフに適用され、アプリケーションのレイアウト計算に使用される。(IDWriteFont.GetMetrics)


%index
IDWriteFont_HasCharacter
フォントが指定した文字をサポートしているかどうかを判定する。
%prm
this, unicodeValue, exists
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
unicodeValue : [int] 型: UINT32 このメソッドが検査する Unicode (UCS-4) 文字値。
exists : [var] 型: BOOL* このメソッドが返るとき、フォントが指定文字をサポートしていれば TRUE、そうでなければ FALSE を格納する。
%inst
フォントが指定した文字をサポートしているかどうかを判定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteFont_CreateFontFace
フォント用のフォントフェイスオブジェクトを生成する。(IDWriteFont.CreateFontFace)
%prm
this, fontFace
this : [comobj] IDWriteFont インターフェースの COM オブジェクト変数
fontFace : [comobj] 型: IDWriteFontFace** このメソッドが返るとき、新しく生成されたフォントフェイスオブジェクトへのポインタのアドレスを格納する。
%inst
フォント用のフォントフェイスオブジェクトを生成する。(IDWriteFont.CreateFontFace)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteFontCollection_GetFontFamilyCount
コレクション内のフォントファミリーの数を取得する。
%prm
this
this : [comobj] IDWriteFontCollection インターフェースの COM オブジェクト変数
%inst
コレクション内のフォントファミリーの数を取得する。

[戻り値]
型: UINT32 コレクション内のフォントファミリーの数。


%index
IDWriteFontCollection_GetFontFamily
0 起点のフォントファミリーインデックスからフォントファミリーオブジェクトを作成する。
%prm
this, index, fontFamily
this : [comobj] IDWriteFontCollection インターフェースの COM オブジェクト変数
index : [int] 型: UINT32 フォントファミリーの 0 起点のインデックス。
fontFamily : [comobj] 型: IDWriteFontFamily** このメソッドが返るとき、新しく作成されたフォントファミリーオブジェクトへのポインタのアドレスを格納する。
%inst
0 起点のフォントファミリーインデックスからフォントファミリーオブジェクトを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteFontCollection_FindFamilyName
指定したファミリー名を持つフォントファミリーを検索する。
%prm
this, familyName, index, exists
this : [comobj] IDWriteFontCollection インターフェースの COM オブジェクト変数
familyName : [wstr] 型: const WCHAR* フォントファミリーの名前を含む null 終端された文字配列。名前は大文字小文字を区別しないが、それ以外はコレクション内のファミリー名と完全に一致する必要がある。
index : [int] 型: UINT32* このメソッドが返るとき、ファミリー名が見つかった場合は一致するフォントファミリーの 0 起点のインデックスを格納し、見つからなかった場合は UINT_MAX を格納する。
exists : [var] 型: BOOL* このメソッドが返るとき、ファミリー名が存在する場合は TRUE、そうでない場合は FALSE。
%inst
指定したファミリー名を持つフォントファミリーを検索する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteFontCollection_GetFontFromFontFace
指定したフォントフェイスオブジェクトと同じ物理フォントに対応するフォントオブジェクトを取得する。指定された物理フォントはこのフォントコレクションに属していなければならない。
%prm
this, fontFace, font
this : [comobj] IDWriteFontCollection インターフェースの COM オブジェクト変数
fontFace : [comobj] 型: IDWriteFontFace* 物理フォントを指定するフォントフェイスオブジェクト。
font : [comobj] 型: IDWriteFont** このメソッドが返るとき、成功した場合は新しく作成されたフォントオブジェクトへのポインタのアドレスを格納し、それ以外は NULL を格納する。
%inst

指定したフォントフェイスオブジェクトと同じ物理フォントに対応するフォントオブジェクトを取得する。指定された物理フォントはこのフォントコレクションに属していなければならない。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteFontCollectionLoader_CreateEnumeratorFromKey
フォントファイルのコレクションをカプセル化するフォントファイル列挙子オブジェクトを作成する。フォントシステムはこのインターフェースをコールバックしてフォントコレクションを作成する。
%prm
this, factory, collectionKey, collectionKeySize, fontFileEnumerator
this : [comobj] IDWriteFontCollectionLoader インターフェースの COM オブジェクト変数
factory : [comobj] 型: IDWriteFactory* 現在のフォントコレクションを作成するのに使用された IDWriteFactory オブジェクトへのポインタ。
collectionKey : [intptr] 型: const void* 使用しているフォントコレクションローダのスコープ内でフォントファイルのコレクションを一意に識別するフォントコレクションキー。このキーに割り当てるバッファは少なくとも collectionKeySize で指定されたバイト数を持たなければならない。
collectionKeySize : [int] 型: UINT32 フォントコレクションキーのサイズ (バイト単位)。
fontFileEnumerator : [comobj] 型: IDWriteFontFileEnumerator** このメソッドが返るとき、新しく作成されたフォントファイル列挙子へのポインタのアドレスを格納する。
%inst

フォントファイルのコレクションをカプセル化するフォントファイル列挙子オブジェクトを作成する。フォントシステムはこのインターフェースをコールバックしてフォントコレクションを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteFontFace_GetType
フォントフェイスのファイルフォーマットの種類を取得する。
%prm
this
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
%inst
フォントフェイスのファイルフォーマットの種類を取得する。

[戻り値]
型: DWRITE_FONT_FACE_TYPE フォントフェイスのフォーマットの種類 (Type
1、TrueType、ベクター、ビットマップなど) を示す値。


%index
IDWriteFontFace_GetFiles
フォントフェイスを表すフォントファイルを取得する。
%prm
this, numberOfFiles, fontFiles
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
numberOfFiles : [int] 型: UINT32* fontFiles が NULL の場合、フォントフェイスを表すファイル数を受け取る。それ以外の場合は、要求するフォントファイル数を渡す必要がある。詳しくは下の備考セクションを参照。
fontFiles : [comobj] 型: IDWriteFontFile** このメソッドが返るときに、フォントフェイスを表すフォントファイルへのポインタを格納する、ユーザー提供の配列へのポインタを格納する。フォントフェイスを表すファイル数のみを取得したい場合は、このパラメータを NULL にできる。この API は COM の規約に従って返されたフォントファイルポインタの参照カウントをインクリメントするので、呼び出し側は使用後にそれらを解放する必要がある。
%inst
フォントフェイスを表すフォントファイルを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
IDWriteFontFace::GetFiles メソッドは 2 回呼び出す必要がある。1 回目は GetFiles に
fontFiles を NULL で渡す。メソッドが返ると、numberOfFiles
にフォントフェイスを表すフォントファイル数が格納される。次に、1 回目の呼び出しで出力された numberOfFiles
の値と、IDWriteFontFile ポインタを格納するための適切なサイズの非 NULL バッファを渡して、メソッドを 2
回目に呼び出す。


%index
IDWriteFontFace_GetIndex
フォントファイルのコンテキストにおけるフォントフェイスのインデックスを取得する。
%prm
this
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
%inst
フォントファイルのコンテキストにおけるフォントフェイスのインデックスを取得する。

[戻り値]
型: UINT32 フォントファイルにフォントフェイスのコレクションが含まれている場合、フォントフェイスの 0
ベースのインデックス。フォントファイルに単一のフェイスしか含まれていない場合、この値は 0 である。


%index
IDWriteFontFace_GetSimulations
フォントフェイスのアルゴリズム的なスタイルシミュレーションフラグを取得する。(IDWriteFontFace.GetSimulations)
%prm
this
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
%inst

フォントフェイスのアルゴリズム的なスタイルシミュレーションフラグを取得する。(IDWriteFontFace.GetSimulations)

[戻り値]
型: DWRITE_FONT_SIMULATIONS
テキストをアルゴリズム的にボールドまたはイタリックにするためのフォントフェイスのシミュレーションフラグ。


%index
IDWriteFontFace_IsSymbolFont
フォントがシンボルフォントかどうかを判断する。(IDWriteFontFace.IsSymbolFont)
%prm
this
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
%inst
フォントがシンボルフォントかどうかを判断する。(IDWriteFontFace.IsSymbolFont)

[戻り値]
型: BOOL フォントがシンボルフォントである場合は TRUE、そうでない場合は FALSE を返す。


%index
IDWriteFontFace_GetMetrics
フォントフェイスのデザイン単位と共通のメトリクスを取得する。これらのメトリクスはフォントフェイス内のすべてのグリフに適用され、アプリケーションがレイアウト計算に使用する。(IDWriteFontFace.GetMetrics)
%prm
this, fontFaceMetrics
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
fontFaceMetrics : [var] 型: DWRITE_FONT_METRICS* このメソッドが返るときに、現在のフォントフェイス要素のメトリクス (アセント、ディセント、キャップハイトなど) を保持する DWRITE_FONT_METRICS 構造体。この関数が返すメトリクスはフォントデザイン単位である。
%inst

フォントフェイスのデザイン単位と共通のメトリクスを取得する。これらのメトリクスはフォントフェイス内のすべてのグリフに適用され、アプリケーションがレイアウト計算に使用する。(IDWriteFontFace.GetMetrics)


%index
IDWriteFontFace_GetGlyphCount
フォントフェイス内のグリフ数を取得する。
%prm
this
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
%inst
フォントフェイス内のグリフ数を取得する。

[戻り値]
型: UINT16 フォントフェイス内のグリフ数。


%index
IDWriteFontFace_GetDesignGlyphMetrics
フォントデザイン単位での理想的な (解像度に依存しない) グリフメトリクスを取得する。
%prm
this, glyphIndices, glyphCount, glyphMetrics, isSideways
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
glyphIndices : [int] 型: const UINT16* メトリクスを計算するグリフインデックスの配列。配列には少なくとも glyphCount で指定された数の要素が含まれている必要がある。
glyphCount : [int] 型: UINT32 glyphIndices 配列の要素数。
glyphMetrics : [var] 型: DWRITE_GLYPH_METRICS* このメソッドが返るときに、DWRITE_GLYPH_METRICS 構造体の配列を格納する。glyphMetrics は、少なくとも glyphCount と同じ要素数を持つ空のバッファで初期化されている必要がある。この関数が返すメトリクスはフォントデザイン単位である。
isSideways : [int] 型: BOOL フォントが横向き (sideways) ランで使用されているかどうかを示す。フォントに斜体シミュレーションが適用されている場合、横向きの斜体シミュレーションは非横向きのものとは異なるため、グリフメトリクスに影響する可能性がある。
%inst
フォントデザイン単位での理想的な (解像度に依存しない) グリフメトリクスを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
デザイングリフメトリクスはグリフ配置に使用される。


%index
IDWriteFontFace_GetGlyphIndices
フォントの 'CMAP' テーブルで定義された UCS4 Unicode コードポイントからグリフインデックスへの名目上のマッピングを返す。
%prm
this, codePoints, codePointCount, glyphIndices
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
codePoints : [int] 型: const UINT32* 名目上のグリフインデックスを取得する元となる UCS4 コードポイントの配列。配列は確保され、codePointCount で指定された要素数を格納できる必要がある。
codePointCount : [int] 型: UINT32 codePoints 配列の要素数。
glyphIndices : [int] 型: UINT16* このメソッドが返るときに、この関数が埋める名目上のグリフインデックスの配列へのポインタを格納する。
%inst
フォントの 'CMAP' テーブルで定義された UCS4 Unicode
コードポイントからグリフインデックスへの名目上のマッピングを返す。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
このマッピングは、主に物理フォント API 上に構築された行レイアウトエンジン向けに提供されることに注意。OpenType
のグリフ置換と行レイアウトの文字置換のため、名目上の変換は特定のフォントフェイスを使用してレンダリングする際に Unicode
文字列がどのようにグリフインデックスにマップされるかと必ずしも一致しない。また、Unicode
の異体字セレクタにより、文字からグリフへの代替マッピングが提供されることにも注意。この呼び出しは常にデフォルトの異体字を返す。フォントに文字が存在しない場合、このメソッドは未定義のグリフ、つまり
".notdef" グリフであるインデックス 0
を返す。文字がフォントに含まれない場合、IDWriteFont::HasCharacter は false
を返し、GetUnicodeRanges もその範囲を返さない。


%index
IDWriteFontFace_TryGetFontTable
指定された OpenType フォントテーブルが存在する場合、それを検索してポインタを返す。この関数は、フォントファイルローダーが実装する IDWriteFontFileStream インターフェースを通じて基礎となるフォントデータにアクセスする。
%prm
this, openTypeTableTag, tableData, tableSize, tableContext, exists
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
openTypeTableTag : [int] 型: UINT32 検索する OpenType フォントテーブルの 4 文字タグ。DWRITE_MAKE_OPENTYPE_TAG マクロを使用して UINT32 として作成する。GDI とは異なり、フォント全体にアクセスするための特殊な TTCF タグや null タグはサポートされていない。
tableData : [var] 型: const void** このメソッドが返るときに、メモリ内のテーブルの先頭へのポインタのアドレスを格納する。このポインタは、フォントテーブルを取得するために使用したフォントフェイスが存在する間のみ有効である (実際に同じ物理フォントを参照していても、他のフォントフェイスは含まない)。このパラメータは未初期化で渡される。
tableSize : [int] 型: UINT32* このメソッドが返るときに、フォントテーブルのサイズ (バイト単位) へのポインタを格納する。
tableContext : [var] 型: void** このメソッドが返るときに、不透明なコンテキストへのポインタのアドレスを格納する。これは ReleaseFontTable を呼び出して解放する必要がある。コンテキストは実際にはより低レベルの IDWriteFontFileStream から来ており、アプリケーションまたは DWrite 自体が実装する場合がある。実装がファイル全体に対して直接メモリマッピングを行う場合などは特に、tableContext として NULL が返される可能性がある。それでも、後で必ず解放し、関数の成功テストとして使用してはならない。同じテーブルを複数回照会できるが、返されるコンテキストは毎回異なる場合があるため、各コンテキストを個別に解放する必要がある。
exists : [var] 型: BOOL* このメソッドが返るときに、フォントテーブルが存在する場合は TRUE、そうでない場合は FALSE。
%inst
指定された OpenType フォントテーブルが存在する場合、それを検索してポインタを返す。この関数は、フォントファイルローダーが実装する
IDWriteFontFileStream インターフェースを通じて基礎となるフォントデータにアクセスする。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
同じタグに対するコンテキストは呼び出しごとに異なる場合があるため、各コンテキストを個別に保持し解放する必要がある。


%index
IDWriteFontFace_ReleaseFontTable
TryGetFontTable で先に取得したテーブルを解放する。
%prm
this, tableContext
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
tableContext : [intptr] 型: void* TryGetFontTable から取得した不透明なコンテキストへのポインタ。
%inst
TryGetFontTable で先に取得したテーブルを解放する。


%index
IDWriteFontFace_GetGlyphRunOutline
アウトラインシンクインターフェースへのコールバックによってグリフのランのアウトラインを計算する。
%prm
this, emSize, glyphIndices, glyphAdvances, glyphOffsets, glyphCount, isSideways, isRightToLeft, geometrySink
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
emSize : [float] 型: FLOAT フォントの論理サイズ (DIP 単位)。DIP ("デバイス非依存ピクセル") は 1/96 インチに等しい。
glyphIndices : [int] 型: const UINT16* グリフインデックスの配列。グリフは論理順で、アドバンス方向は isRightToLeft パラメータに依存する。配列は確保され、glyphCount で指定された要素数を格納できる必要がある。
glyphAdvances : [var] 型: const FLOAT* DIP 単位のグリフアドバンスのオプション配列。グリフのアドバンスとは、グリフを描画した後にベースラインの方向に位置を進める量である。glyphAdvances は glyphCount で指定された要素数を含む。
glyphOffsets : [var] 型: const DWRITE_GLYPH_OFFSET* グリフオフセットのオプション配列。各オフセットは、現在のペン位置に対するグリフのベースライン方向のオフセットとベースラインに垂直な方向のオフセットを指定する。glyphOffsets は glyphCount で指定された要素数を含む。
glyphCount : [int] 型: UINT32 ラン内のグリフ数。
isSideways : [int] 型: BOOL TRUE の場合、グリフのアセンダはベースラインに沿って走る。FALSE の場合、グリフのアセンダはベースラインに垂直に走る。たとえば、垂直のベースライン上の英語アルファベットでは isSideways は FALSE に設定される。クライアントは、isSideways を TRUE に設定し、結果のジオメトリを変換を使用して右に 90 度回転することで、垂直のランをレンダリングできる。isSideways と isRightToLeft のパラメータを両方とも true にすることはできない。
isRightToLeft : [int] 型: BOOL グリフの視覚的な順序。このパラメータが FALSE の場合、グリフのアドバンスは左から右である。TRUE の場合、アドバンス方向は右から左である。デフォルトでは、アドバンス方向は左から右である。
geometrySink : [comobj] 型: IDWriteGeometrySink* アウトライン描画操作を実行するためにコールバックされるインターフェースへのポインタ。
%inst
アウトラインシンクインターフェースへのコールバックによってグリフのランのアウトラインを計算する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteFontFace_GetRecommendedRenderingMode
指定されたサイズとレンダリングパラメータを使用して、フォントの推奨レンダリングモードを決定する。(IDWriteFontFace.GetRecommendedRenderingMode)
%prm
this, emSize, pixelsPerDip, measuringMode, renderingParams, renderingMode
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
emSize : [float] 型: FLOAT フォントの論理サイズ (DIP 単位)。DIP ("デバイス非依存ピクセル") は 1/96 インチに等しい。
pixelsPerDip : [float] 型: FLOAT DIP あたりの物理ピクセル数。たとえば、レンダリングサーフェスの DPI が 96 の場合、この値は 1.0f である。DPI が 120 の場合、この値は 120.0f/96 である。
measuringMode : [int] 型: DWRITE_MEASURING_MODE フォント内のグリフに使用される測定方法。レンダラーの実装は測定方法ごとに異なるレンダリングモードを選択する場合がある。例:
renderingParams : [comobj] 型: IDWriteRenderingParams* ガンマレベル、強調コントラスト、ClearType レベルなどのレンダリング設定を含むオブジェクトへのポインタ。レンダリングパラメータオブジェクトがレンダリングモードをオーバーライドする場合に必要となる。
renderingMode : [var] 型: DWRITE_RENDERING_MODE* このメソッドが返るときに、使用すべき推奨レンダリングモードを示す値を格納する。
%inst

指定されたサイズとレンダリングパラメータを使用して、フォントの推奨レンダリングモードを決定する。(IDWriteFontFace.GetRecommendedRenderingMode)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteFontFace_GetGdiCompatibleMetrics
フォントフェイスのデザイン単位と共通のメトリクスを取得する。これらのメトリクスはフォントフェイス内のすべてのグリフに適用され、アプリケーションがレイアウト計算に使用する。
%prm
this, emSize, pixelsPerDip, transform, fontFaceMetrics
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
emSize : [float] 型: **FLOAT** フォントの論理サイズ (DIP 単位)。
pixelsPerDip : [float] 型: **FLOAT** DIP あたりの物理ピクセル数。
transform : [var] 型: **const [**DWRITE\_MATRIX**](/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix)\*** グリフとその位置に適用されるオプションの変換。この変換はフォントサイズと *pixelsPerDip* で指定されたスケーリングの後に適用される。
fontFaceMetrics : [var] 型: **[**DWRITE\_FONT\_METRICS**](/windows/win32/api/dwrite/ns-dwrite-dwrite_font_metrics)\*** 埋める [**DWRITE\_FONT\_METRIC**](/windows/win32/api/dwrite/ns-dwrite-dwrite_font_metrics)S 構造体へのポインタ。この関数が返すメトリクスはフォントデザイン単位である。
%inst

フォントフェイスのデザイン単位と共通のメトリクスを取得する。これらのメトリクスはフォントフェイス内のすべてのグリフに適用され、アプリケーションがレイアウト計算に使用する。

[戻り値]
型: **HRESULT** 標準の HRESULT エラーコード。


%index
IDWriteFontFace_GetGdiCompatibleGlyphMetrics
GDI が生成するものと互換性のある戻り値で、フォントデザイン単位のグリフメトリクスを取得する。
%prm
this, emSize, pixelsPerDip, transform, useGdiNatural, glyphIndices, glyphCount, glyphMetrics, isSideways
this : [comobj] IDWriteFontFace インターフェースの COM オブジェクト変数
emSize : [float] 型: **FLOAT** フォントの論理サイズ (DIP 単位)。
pixelsPerDip : [float] 型: **FLOAT** DIP あたりの物理ピクセル数。
transform : [var] 型: **const [**DWRITE\_MATRIX**](/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix)\*** グリフとその位置に適用されるオプションの変換。この変換はフォントサイズと *pixelsPerDip* で指定されたスケーリングの後に適用される。
useGdiNatural : [int] 型: **BOOL** **FALSE** に設定すると、メトリクスは GDI のエイリアステキストのメトリクスと同じになる。**TRUE** に設定すると、メトリクスは **CLEARTYPE\_NATURAL\_QUALITY** で作成したフォントを使用して GDI で測定したテキストのメトリクスと同じになる。
glyphIndices : [int] 型: **const UINT16\*** メトリクスを計算するグリフインデックスの配列。
glyphCount : [int] 型: **UINT32** *glyphIndices* 配列の要素数。
glyphMetrics : [var] 型: **[**DWRITE\_GLYPH\_METRICS**](/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_metrics)\*** この関数が埋める [**DWRITE\_GLYPH\_METRICS**](/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_metrics) 構造体の配列。メトリクスはフォントデザイン単位である。
isSideways : [int] 型: **BOOL** フォントが横向きランで使用されているかどうかを示す BOOL 値。フォントに斜体シミュレーションが適用されている場合、横向きの斜体シミュレーションは非横向きのものとは異なるため、グリフメトリクスに影響する可能性がある。
%inst
GDI が生成するものと互換性のある戻り値で、フォントデザイン単位のグリフメトリクスを取得する。

[戻り値]
型: **HRESULT** 標準の **HRESULT**
エラーコード。入力グリフインデックスのいずれかが現在のフォントフェイスの有効なグリフインデックス範囲外にある場合は
**E\_INVALIDARG** が返される。


%index
IDWriteFontFamily_GetFontCollection
IDWriteFontFamily::GetFontCollection (vtable slot 3)
%prm
this, fontCollection
this : [comobj] IDWriteFontFamily インターフェースの COM オブジェクト変数
fontCollection : [comobj] 
%inst


%index
IDWriteFontFamily_GetFontCount
IDWriteFontFamily::GetFontCount (vtable slot 4)
%prm
this
this : [comobj] IDWriteFontFamily インターフェースの COM オブジェクト変数
%inst


%index
IDWriteFontFamily_GetFont
IDWriteFontFamily::GetFont (vtable slot 5)
%prm
this, index, font
this : [comobj] IDWriteFontFamily インターフェースの COM オブジェクト変数
index : [int] 
font : [comobj] 
%inst


%index
IDWriteFontFamily_GetFamilyNames
ロケール名でインデックス付けされた、フォントファミリーのファミリー名を含むローカライズド文字列オブジェクトを作成する。(IDWriteFontFamily.GetFamilyNames)
%prm
this, names
this : [comobj] IDWriteFontFamily インターフェースの COM オブジェクト変数
names : [comobj] 型: IDWriteLocalizedStrings** 新しく作成された IDWriteLocalizedStrings オブジェクトへのポインタのアドレス。
%inst

ロケール名でインデックス付けされた、フォントファミリーのファミリー名を含むローカライズド文字列オブジェクトを作成する。(IDWriteFontFamily.GetFamilyNames)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
次のコード例は IDWriteFontFamily オブジェクトからフォントファミリー名を取得する方法を示す。
（以下省略）


%index
IDWriteFontFamily_GetFirstMatchingFont
指定したプロパティに最も一致するフォントを取得する。
%prm
this, weight, stretch, style, matchingFont
this : [comobj] IDWriteFontFamily インターフェースの COM オブジェクト変数
weight : [int] 型: DWRITE_FONT_WEIGHT 要求するフォントウェイトに一致させるために使用される値。
stretch : [int] 型: DWRITE_FONT_STRETCH 要求するフォントストレッチに一致させるために使用される値。
style : [int] 型: DWRITE_FONT_STYLE 要求するフォントスタイルに一致させるために使用される値。
matchingFont : [comobj] 型: IDWriteFont** このメソッドが返るとき、新しく作成された IDWriteFont オブジェクトへのポインタのアドレスを格納する。
%inst
指定したプロパティに最も一致するフォントを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteFontFamily_GetMatchingFonts
指定したプロパティとの一致度の高い順に並べたフォントファミリー内のフォント一覧を取得する。
%prm
this, weight, stretch, style, matchingFonts
this : [comobj] IDWriteFontFamily インターフェースの COM オブジェクト変数
weight : [int] 型: DWRITE_FONT_WEIGHT 要求するフォントウェイトに一致させるために使用される値。
stretch : [int] 型: DWRITE_FONT_STRETCH 要求するフォントストレッチに一致させるために使用される値。
style : [int] 型: DWRITE_FONT_STYLE 要求するフォントスタイルに一致させるために使用される値。
matchingFonts : [comobj] 型: IDWriteFontList** 新しく作成された IDWriteFontList オブジェクトへのポインタのアドレス。
%inst
指定したプロパティとの一致度の高い順に並べたフォントファミリー内のフォント一覧を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteFontFile_GetReferenceKey
フォントファイルの参照キーへのポインタを取得する。返されたポインタはフォントファイルオブジェクトが解放されるまで有効である。
%prm
this, fontFileReferenceKey, fontFileReferenceKeySize
this : [comobj] IDWriteFontFile インターフェースの COM オブジェクト変数
fontFileReferenceKey : [var] 型: const void** このメソッドが返るとき、フォントファイル参照キーへのポインタのアドレスを格納する。なお、このポインタの値は、それを取得したフォントファイルオブジェクトが解放されるまでの間のみ有効である。このパラメータは未初期化の状態で渡される。
fontFileReferenceKeySize : [int] 型: UINT32* このメソッドが返るとき、フォントファイル参照キーのサイズをバイト単位で格納する。このパラメータは未初期化の状態で渡される。
%inst
フォントファイルの参照キーへのポインタを取得する。返されたポインタはフォントファイルオブジェクトが解放されるまで有効である。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteFontFile_GetLoader
フォントファイルオブジェクトに関連付けられたファイルローダを取得する。
%prm
this, fontFileLoader
this : [comobj] IDWriteFontFile インターフェースの COM オブジェクト変数
fontFileLoader : [comobj] 型: IDWriteFontFileLoader** このメソッドが返るとき、フォントファイルオブジェクトに関連付けられたフォントファイルローダへのポインタのアドレスを格納する。
%inst
フォントファイルオブジェクトに関連付けられたファイルローダを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteFontFile_Analyze
ファイルを解析し、それがフォントを表しているか、またそのフォント種別がフォントシステムでサポートされているかを返す。
%prm
this, isSupportedFontType, fontFileType, fontFaceType, numberOfFaces
this : [comobj] IDWriteFontFile インターフェースの COM オブジェクト変数
isSupportedFontType : [var] 型: BOOL* フォントの種類がフォントシステムでサポートされている場合は TRUE、そうでない場合は FALSE。
fontFileType : [var] 型: DWRITE_FONT_FILE_TYPE* このメソッドが返るとき、フォントファイルの種類を示す値を格納する。たとえ isSupportedFontType が FALSE であっても、fontFileType の値は DWRITE_FONT_FILE_TYPE_UNKNOWN と異なる場合があることに注意。
fontFaceType : [var] 型: DWRITE_FONT_FACE_TYPE* このメソッドが返るとき、フォントフェイスの種類を示す値を格納する。fontFileType が DWRITE_FONT_FILE_TYPE_UNKNOWN と等しくない場合、その値からフォントファイルからフォントフェイスを構築できる。
numberOfFaces : [int] 型: UINT32* このメソッドが返るとき、フォントファイルに含まれるフォントフェイスの数を格納する。
%inst
ファイルを解析し、それがフォントを表しているか、またそのフォント種別がフォントシステムでサポートされているかを返す。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
重要 一部のフォントファイル種別は認識はされるがフォントシステムではサポートされない。たとえばフォントシステムはファイルを Type 1
フォントファイルとして認識できるが、それからフォントフェイスオブジェクトを構築することはできない。このような状況では Analyze
は出力パラメータ isSupportedFontType を FALSE に設定する。


%index
IDWriteFontFileEnumerator_MoveNext
コレクション内の次のフォントファイルへ進む。作成直後の列挙子はコレクションの最初の要素より前に位置しており、最初の MoveNext の呼び出しで先頭のファイルへ進む。
%prm
this, hasCurrentFile
this : [comobj] IDWriteFontFileEnumerator インターフェースの COM オブジェクト変数
hasCurrentFile : [var] 型: BOOL* メソッドが返るとき、列挙子がファイルへ進んだ場合は TRUE、コレクション内の最後のファイルを越えた場合は FALSE が格納される。
%inst
コレクション内の次のフォントファイルへ進む。作成直後の列挙子はコレクションの最初の要素より前に位置しており、最初の MoveNext
の呼び出しで先頭のファイルへ進む。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteFontFileEnumerator_GetCurrentFontFile
現在のフォントファイルへの参照を取得する。
%prm
this, fontFile
this : [comobj] IDWriteFontFileEnumerator インターフェースの COM オブジェクト変数
fontFile : [comobj] 型: IDWriteFontFile** このメソッドが返るとき、新しく作成された IDWriteFontFile オブジェクトへのポインタのアドレス。
%inst
現在のフォントファイルへの参照を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteFontFileLoader_CreateStreamFromKey
オープンされたファイルリソースをカプセル化するフォントファイルストリームオブジェクトを作成する。
%prm
this, fontFileReferenceKey, fontFileReferenceKeySize, fontFileStream
this : [comobj] IDWriteFontFileLoader インターフェースの COM オブジェクト変数
fontFileReferenceKey : [intptr] 型: const void* 使用しているフォントローダのスコープ内でフォントファイルリソースを一意に識別するフォントファイル参照キーへのポインタ。このキーに割り当てるバッファは少なくとも fontFileReferenceKeySize で指定されたバイト数を持たなければならない。
fontFileReferenceKeySize : [int] 型: UINT32 フォントファイル参照キーのサイズ (バイト単位)。
fontFileStream : [comobj] 型: IDWriteFontFileStream** このメソッドが返るとき、新しく作成された IDWriteFontFileStream オブジェクトへのポインタのアドレスを格納する。
%inst
オープンされたファイルリソースをカプセル化するフォントファイルストリームオブジェクトを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
リソースは fontFileStream への最後の参照が解放された時点でクローズされる。


%index
IDWriteFontFileStream_ReadFileFragment
フォントファイルからフラグメントを読み込む。
%prm
this, fragmentStart, fileOffset, fragmentSize, fragmentContext
this : [comobj] IDWriteFontFileStream インターフェースの COM オブジェクト変数
fragmentStart : [var] 型: const void** このメソッドが返るとき、フォントファイルフラグメントの先頭へのポインタのアドレスを格納する。このパラメータは未初期化の状態で渡される。
fileOffset : [int64] 型: UINT64 フォントファイルの先頭からのフラグメントのオフセット (バイト単位)。
fragmentSize : [int64] 型: UINT64 ファイルフラグメントのサイズ (バイト単位)。
fragmentContext : [var] 型: void** このメソッドが返るとき、ReleaseFileFragment に渡すクライアント定義のコンテキストへのポインタへのポインタのアドレスを格納する。
%inst
フォントファイルからフラグメントを読み込む。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
ReadFileFragment
の実装では、要求されたフォントファイルフラグメントがファイル境界内にあるかを必ず確認しなければならない。そうでなければ
ReadFileFragment からエラーを返すべきである。DirectWrite は同じオブジェクト上の
IDWriteFontFileStream メソッドを複数のスレッドから同時に呼び出すことがある。したがって、内部の可変状態に依存する
ReadFileFragment
の実装は、複数スレッドからのその状態へのアクセスを直列化しなければならない。たとえば、ファイルフラグメントを読み込むために Seek と
Read 操作を別々に行う実装は、Seek と Read
の呼び出しを含むコードブロックをロックまたはクリティカルセクションの下に置く必要がある。


%index
IDWriteFontFileStream_ReleaseFileFragment
ファイルからフラグメントを解放する。
%prm
this, fragmentContext
this : [comobj] IDWriteFontFileStream インターフェースの COM オブジェクト変数
fragmentContext : [intptr] 型: void* ReadFileFragment から返されたフォントフラグメントのクライアント定義コンテキストへのポインタ。
%inst
ファイルからフラグメントを解放する。


%index
IDWriteFontFileStream_GetFileSize
ファイルの総サイズを取得する。
%prm
this, fileSize
this : [comobj] IDWriteFontFileStream インターフェースの COM オブジェクト変数
fileSize : [int64] 型: UINT64* このメソッドが返るとき、ファイルの総サイズを格納する。
%inst
ファイルの総サイズを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
非同期にロードされるフォントファイルに対して GetFileSize()
を実装する場合、ファイルの内容を完全にダウンロードする必要があることがある。したがって、このメソッドはフォントファイル全体をロードしなければならない操作（例:
フォントファイルのコピー）や、ファイルサイズの値に基づいて判断を下す必要がある操作（例:
永続化されたファイルサイズとの照合）にのみ使用すべきである。


%index
IDWriteFontFileStream_GetLastWriteTime
ファイルの最終更新時刻を取得する。
%prm
this, lastWriteTime
this : [comobj] IDWriteFontFileStream インターフェースの COM オブジェクト変数
lastWriteTime : [int64] 型: UINT64* このメソッドが返るとき、ファイルの最終更新時刻を、1601 年 1 月 1 日 (UTC) から数えた 100 ナノ秒間隔の数を表す形式で格納する。
%inst
ファイルの最終更新時刻を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
「最終更新時刻」は DirectWrite
のフォント選択アルゴリズムが、あるフォントリソースが別のリソースより新しいかどうかを判定するために使用する。


%index
IDWriteFontList_GetFontCollection
フォントリストに含まれるフォントを保持するフォントコレクションを取得する。
%prm
this, fontCollection
this : [comobj] IDWriteFontList インターフェースの COM オブジェクト変数
fontCollection : [comobj] 型: IDWriteFontCollection** このメソッドが返るとき、現在の IDWriteFontCollection オブジェクトへのポインタのアドレスを格納する。
%inst
フォントリストに含まれるフォントを保持するフォントコレクションを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteFontList_GetFontCount
フォントリスト内のフォントの数を取得する。
%prm
this
this : [comobj] IDWriteFontList インターフェースの COM オブジェクト変数
%inst
フォントリスト内のフォントの数を取得する。

[戻り値]
型: UINT32 フォントリスト内のフォントの数。


%index
IDWriteFontList_GetFont
0 起点のインデックスからフォントを取得する。(IDWriteFontList.GetFont)
%prm
this, index, font
this : [comobj] IDWriteFontList インターフェースの COM オブジェクト変数
index : [int] 型: UINT32 フォントリスト内のフォントの 0 起点のインデックス。
font : [comobj] 型: IDWriteFont** このメソッドが返るとき、新しく作成された IDWriteFont オブジェクトへのポインタのアドレスを格納する。
%inst
0 起点のインデックスからフォントを取得する。(IDWriteFontList.GetFont)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteGdiInterop_CreateFontFromLOGFONT
LOGFONT 構造体で指定されたプロパティに一致するフォントオブジェクトを生成する。(IDWriteGdiInterop.CreateFontFromLOGFONT)
%prm
this, logFont, font
this : [comobj] IDWriteGdiInterop インターフェースの COM オブジェクト変数
logFont : [var] 型: const LOGFONTW* GDI 互換のフォント記述を含む構造体。
font : [comobj] 型: IDWriteFont** このメソッドが返るとき、成功した場合は新しく生成された IDWriteFont オブジェクトへのポインタのアドレスを格納する。それ以外の場合は NULL。
%inst
LOGFONT
構造体で指定されたプロパティに一致するフォントオブジェクトを生成する。(IDWriteGdiInterop.CreateFontFromLOGFONT)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteGdiInterop_ConvertFontToLOGFONT
指定フォントの GDI 互換プロパティに基づいて LOGFONT 構造体を初期化する。(IDWriteGdiInterop.ConvertFontToLOGFONT)
%prm
this, font, logFont, isSystemFont
this : [comobj] IDWriteGdiInterop インターフェースの COM オブジェクト変数
font : [comobj] 型: IDWriteFont* GDI 互換の LOGFONT 構造体に変換する IDWriteFont オブジェクト。
logFont : [var] 型: LOGFONTW* このメソッドが返るとき、GDI 互換のフォント記述を受け取る構造体を格納する。
isSystemFont : [var] 型: BOOL* このメソッドが返るとき、指定フォントオブジェクトがシステムフォントコレクションの一部であれば TRUE、そうでなければ FALSE を格納する。
%inst
指定フォントの GDI 互換プロパティに基づいて LOGFONT
構造体を初期化する。(IDWriteGdiInterop.ConvertFontToLOGFONT)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
ConvertFontToLOGFONT による LOGFONT
への変換は論理フォントレベルで動作するため、特定の物理フォントにマップされることを保証しない。変換元の IDWriteFont
オブジェクトと、LOGFONT でフォーマットされたテキストの描画に GDI が同じ物理フォントを選択する保証はない。


%index
IDWriteGdiInterop_ConvertFontFaceToLOGFONT
指定フォントの GDI 互換プロパティに基づいて LOGFONT 構造体を初期化する。(IDWriteGdiInterop.ConvertFontFaceToLOGFONT)
%prm
this, font, logFont
this : [comobj] IDWriteGdiInterop インターフェースの COM オブジェクト変数
font : [comobj] 型: IDWriteFontFace* GDI 互換の LOGFONT 構造体に変換する IDWriteFontFace オブジェクト。
logFont : [var] 型: LOGFONTW* このメソッドが返るとき、GDI 互換のフォント記述を受け取る構造体へのポインタを格納する。
%inst
指定フォントの GDI 互換プロパティに基づいて LOGFONT
構造体を初期化する。(IDWriteGdiInterop.ConvertFontFaceToLOGFONT)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
ConvertFontFaceToLOGFONT による LOGFONT
への変換は論理フォントレベルで動作するため、特定の物理フォントにマップされることを保証しない。変換元の IDWriteFont
オブジェクトと、LOGFONT でフォーマットされたテキストの描画に GDI が同じ物理フォントを選択する保証はない。


%index
IDWriteGdiInterop_CreateFontFaceFromHdc
指定した HDC に現在選択されている HFONT に対応する IDWriteFontFace オブジェクトを生成する。
%prm
this, hdc, fontFace
this : [comobj] IDWriteGdiInterop インターフェースの COM オブジェクト変数
hdc : [intptr] 型: HDC フォントが選択されているデバイスコンテキストへのハンドル。クライアントはすでにフォントマッピングを実行済みであり、デバイスコンテキストに選択されているフォントがグリフの描画に使用される実際のフォントであると想定される。
fontFace : [comobj] 型: IDWriteFontFace** 新しく生成されたフォントフェイスオブジェクトへのポインタのアドレスを格納する。失敗した場合は NULL。返されるフォントフェイスは、ExtTextOut を使用したグリフ (必ずしも文字ではない) 描画に使われるのと同じ物理書体を参照することが保証される。
%inst
指定した HDC に現在選択されている HFONT に対応する IDWriteFontFace オブジェクトを生成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
この関数は、アプリケーションがテキストレイアウトとシェイピングに GDI および Uniscribe 1.x を使用しつつ、最終的な描画に
DirectWrite
を使用するシナリオを想定している。この関数はクライアントがグリフインデックスによるテキスト出力を行っていることを前提とする。


%index
IDWriteGdiInterop_CreateBitmapRenderTarget
グリフ描画に使用できるビットマップとメモリ DC (デバイスコンテキスト) をカプセル化したオブジェクトを生成する。
%prm
this, hdc, width, height, renderTarget
this : [comobj] IDWriteGdiInterop インターフェースの COM オブジェクト変数
hdc : [intptr] 型: HDC 互換のメモリ DC (デバイスコンテキスト) を生成するために使用するオプションのデバイスコンテキストへのハンドル。
width : [int] 型: UINT32 ビットマップレンダーターゲットの幅。
height : [int] 型: UINT32 ビットマップレンダーターゲットの高さ。
renderTarget : [comobj] 型: IDWriteBitmapRenderTarget** このメソッドが返るとき、新しく生成された IDWriteBitmapRenderTarget オブジェクトへのポインタのアドレスを格納する。
%inst
グリフ描画に使用できるビットマップとメモリ DC (デバイスコンテキスト) をカプセル化したオブジェクトを生成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteGlyphRunAnalysis_GetAlphaTextureBounds
グリフランの影響を受ける物理ピクセルの境界矩形を取得する。
%prm
this, textureType, textureBounds
this : [comobj] IDWriteGlyphRunAnalysis インターフェースの COM オブジェクト変数
textureType : [int] 型: DWRITE_TEXTURE_TYPE 要求するテクスチャの種別を指定する。バイレベルテクスチャを要求した場合、境界矩形にはバイレベルのグリフのみが含まれる。それ以外の場合はアンチエイリアスされたグリフのみが含まれる。
textureBounds : [var] 型: RECT* このメソッドが返るとき、グリフランの影響を受ける物理ピクセルの境界矩形を格納する。指定したテクスチャ種別のグリフが存在しない場合は空の矩形を格納する。
%inst
グリフランの影響を受ける物理ピクセルの境界矩形を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteGlyphRunAnalysis_CreateAlphaTexture
指定された境界矩形内のグリフに対して、指定された種類のアルファテクスチャを作成する。
%prm
this, textureType, textureBounds, alphaValues, bufferSize
this : [comobj] IDWriteGlyphRunAnalysis インターフェースの COM オブジェクト変数
textureType : [int] 型: DWRITE_TEXTURE_TYPE 要求するテクスチャの種別を指定する値。DWRITE_TEXTURE_BILEVEL_1x1 または DWRITE_TEXTURE_CLEARTYPE_3x1 を指定できる。バイレベルテクスチャを要求した場合、テクスチャにはバイレベルのグリフのみが含まれる。それ以外の場合はアンチエイリアスされたグリフのみが含まれる。
textureBounds : [var] 型: const RECT* テクスチャの境界矩形。GetAlphaTextureBounds が返す境界矩形と異なっていてもよい。
alphaValues : [int] 型: BYTE* このメソッドが返るとき、テクスチャから取得したアルファ値の配列を格納する。この配列に確保するバッファは少なくとも bufferSize のサイズが必要である。
bufferSize : [int] 型: UINT32 alphaValues 配列のサイズ (バイト単位)。最小サイズは矩形の寸法と要求するテクスチャ種別に依存する。
%inst
指定された境界矩形内のグリフに対して、指定された種類のアルファテクスチャを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteGlyphRunAnalysis_GetAlphaBlendParams
ClearType ブレンドに必要なアルファブレンドのプロパティを取得する。
%prm
this, renderingParams, blendGamma, blendEnhancedContrast, blendClearTypeLevel
this : [comobj] IDWriteGlyphRunAnalysis インターフェースの COM オブジェクト変数
renderingParams : [comobj] 型: IDWriteRenderingParams* ClearType レベル、強調コントラスト、ガンマ、ピクセルジオメトリ、レンダリングモードを指定するオブジェクト。GDI 互換のレンダリングモードが指定されている場合を除き、このメソッドの出力パラメータが返す値の多くはこのオブジェクトのプロパティに基づく。
blendGamma : [float] 型: FLOAT* このメソッドが返るとき、ガンマ補正に使用するガンマ値を格納する。
blendEnhancedContrast : [float] 型: FLOAT* このメソッドが返るとき、ブレンドに使用される強調コントラスト値を格納する。
blendClearTypeLevel : [float] 型: FLOAT* このメソッドが返るとき、アルファブレンドに使用される ClearType レベルを格納する。
%inst
ClearType ブレンドに必要なアルファブレンドのプロパティを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteInlineObject_Draw
アプリケーションが実装する描画コールバック (IDWriteTextRenderer::DrawInlineObject) は、オブジェクト型をキャストまたはクエリせずにインラインオブジェクトを描画するためにこのメソッドを利用できる。テキストレイアウトはこのメソッドを直接呼び出さない。
%prm
this, clientDrawingContext, renderer, originX, originY, isSideways, isRightToLeft, clientDrawingEffect
this : [comobj] IDWriteInlineObject インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 型: void* IDWriteTextLayout::Draw に渡された描画コンテキスト。このパラメータは NULL にできる。
renderer : [comobj] 型: IDWriteTextRenderer* オブジェクトを包含する親として IDWriteTextLayout::Draw に渡されたのと同じレンダラー。インラインオブジェクトがネストされたレイアウトなど再帰的な場合に有用である。
originX : [float] 型: FLOAT インラインオブジェクトの左上隅の x 座標。
originY : [float] 型: FLOAT インラインオブジェクトの左上隅の y 座標。
isSideways : [int] 型: BOOL オブジェクトのベースラインが行のベースライン軸に沿って走るかどうかを示すブーリアンフラグ。
isRightToLeft : [int] 型: BOOL オブジェクトが右から左へのコンテキストにあり、反転して描画すべきかどうかを示すブーリアンフラグ。
clientDrawingEffect : [int] 型: IUnknown* IDWriteTextLayout::SetDrawingEffect で設定された描画効果。通常この効果はグリフ描画で用いる前景ブラシである。
%inst
アプリケーションが実装する描画コールバック (IDWriteTextRenderer::DrawInlineObject)
は、オブジェクト型をキャストまたはクエリせずにインラインオブジェクトを描画するためにこのメソッドを利用できる。テキストレイアウトはこのメソッドを直接呼び出さない。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteInlineObject_GetMetrics
IDWriteTextLayout はインラインオブジェクトの計測値を取得するためにこのコールバック関数を呼び出す。
%prm
this, metrics
this : [comobj] IDWriteInlineObject インターフェースの COM オブジェクト変数
metrics : [var] 型: DWRITE_INLINE_OBJECT_METRICS* このメソッドが返るとき、アプリケーション定義インラインオブジェクトの幾何学的計測を記述する構造体を格納する。これらのメトリクスは隣接テキストのベースラインを基準とする。
%inst
IDWriteTextLayout はインラインオブジェクトの計測値を取得するためにこのコールバック関数を呼び出す。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteInlineObject_GetOverhangMetrics
IDWriteTextLayout はインラインオブジェクトの可視範囲 (DIP 単位) を取得するためにこのコールバック関数を呼び出す。パディングやはみ出しのない単純なビットマップの場合、すべてのはみ出しは単純にゼロとなる。
%prm
this, overhangs
this : [comobj] IDWriteInlineObject インターフェースの COM オブジェクト変数
overhangs : [var] 型: **[**DWRITE\_OVERHANG\_METRICS**](/windows/win32/api/dwrite/ns-dwrite-dwrite_overhang_metrics)\*** オブジェクト外への可視範囲のはみ出し (DIP 単位)。
%inst
IDWriteTextLayout はインラインオブジェクトの可視範囲 (DIP 単位)
を取得するためにこのコールバック関数を呼び出す。パディングやはみ出しのない単純なビットマップの場合、すべてのはみ出しは単純にゼロとなる。

[戻り値]
型: **HRESULT** このメソッドが成功した場合は **S\_OK** を返す。失敗した場合は **HRESULT**
エラーコードを返す。


%index
IDWriteInlineObject_GetBreakConditions
レイアウトはこのメソッドを使用して、テキスト中のインラインオブジェクトの改行挙動を決定する。
%prm
this, breakConditionBefore, breakConditionAfter
this : [comobj] IDWriteInlineObject インターフェースの COM オブジェクト変数
breakConditionBefore : [var] 型: DWRITE_BREAK_CONDITION* このメソッドが返るとき、オブジェクトとその直前のコンテンツとの間の改行条件を示す値を格納する。
breakConditionAfter : [var] 型: DWRITE_BREAK_CONDITION* このメソッドが返るとき、オブジェクトとその直後のコンテンツとの間の改行条件を示す値を格納する。
%inst
レイアウトはこのメソッドを使用して、テキスト中のインラインオブジェクトの改行挙動を決定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteLocalizedStrings_GetCount
言語と文字列のペアの数を取得する。
%prm
this
this : [comobj] IDWriteLocalizedStrings インターフェースの COM オブジェクト変数
%inst
言語と文字列のペアの数を取得する。

[戻り値]
型: UINT32 言語と文字列のペアの数。


%index
IDWriteLocalizedStrings_FindLocaleName
指定したロケール名を持つロケール名と文字列のペアの 0 基準インデックスを取得する。
%prm
this, localeName, index, exists
this : [comobj] IDWriteLocalizedStrings インターフェースの COM オブジェクト変数
localeName : [wstr] 型: const WCHAR* 検索するロケール名を含むヌル終端の文字配列。
index : [int] 型: UINT32* ロケール名と文字列のペアの 0 基準インデックス。このメソッドは index を UINT_MAX に初期化する。
exists : [var] 型: BOOL* このメソッドが返るとき、ロケール名が存在すれば TRUE、そうでなければ FALSE を格納する。このメソッドは exists を FALSE に初期化する。
%inst
指定したロケール名を持つロケール名と文字列のペアの 0 基準インデックスを取得する。

[戻り値]
型: HRESULT 指定したロケール名が存在しない場合、戻り値は S_OK だが、index は UINT_MAX、exists は
FALSE となる。

[備考]
ロケール名が存在しない場合でも戻り値は成功となり、exists パラメータが FALSE
になることに注意。フォントのフォントファミリ名を取得していて指定したロケール名が存在しない場合の一つの選択肢は、次のように index を
0 に設定することである。フォントファミリには常に少なくとも 1 つのロケールが存在する。
（以下省略）


%index
IDWriteLocalizedStrings_GetLocaleNameLength
指定したインデックスのロケール名の文字数 (ヌル終端を含まない) を取得する。(IDWriteLocalizedStrings.GetLocaleNameLength)
%prm
this, index, length
this : [comobj] IDWriteLocalizedStrings インターフェースの COM オブジェクト変数
index : [int] 型: UINT32 取得するロケール名の 0 基準インデックス。
length : [int] 型: UINT32* このメソッドが返るとき、ロケール名の文字数 (ヌル終端を含まない) を格納する。
%inst
指定したインデックスのロケール名の文字数 (ヌル終端を含まない)
を取得する。(IDWriteLocalizedStrings.GetLocaleNameLength)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteLocalizedStrings_GetLocaleName
指定したインデックスのロケール名を指定した配列にコピーする。(IDWriteLocalizedStrings.GetLocaleName)
%prm
this, index, localeName, size
this : [comobj] IDWriteLocalizedStrings インターフェースの COM オブジェクト変数
index : [int] 型: UINT32 取得するロケール名の 0 基準インデックス。
localeName : [wstr] 型: WCHAR* このメソッドが返るとき、言語と文字列のペアからロケール名を受け取るヌル終端の文字配列を格納する。この配列に割り当てるバッファは size に指定した要素数以上でなければならない。
size : [int] 型: UINT32 配列のサイズ (文字数)。サイズには終端のヌル文字の分も含める必要がある。
%inst
指定したインデックスのロケール名を指定した配列にコピーする。(IDWriteLocalizedStrings.GetLocaleName)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteLocalizedStrings_GetStringLength
指定したインデックスの文字列の文字数 (ヌル終端を含まない) を取得する。(IDWriteLocalizedStrings.GetStringLength)
%prm
this, index, length
this : [comobj] IDWriteLocalizedStrings インターフェースの COM オブジェクト変数
index : [int] 型: UINT32 言語と文字列のペアの 0 基準インデックス。
length : [int] 型: UINT32* 言語と文字列のペアから得られる文字列の文字数 (ヌル終端を含まない)。
%inst
指定したインデックスの文字列の文字数 (ヌル終端を含まない)
を取得する。(IDWriteLocalizedStrings.GetStringLength)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
次のコードのように、IDWriteLocalizedStrings::GetString メソッドを呼び出す前に文字列の長さを取得するには
GetStringLength を使用する。
（以下省略）


%index
IDWriteLocalizedStrings_GetString
指定したインデックスの文字列を指定した配列にコピーする。(IDWriteLocalizedStrings.GetString)
%prm
this, index, stringBuffer, size
this : [comobj] IDWriteLocalizedStrings インターフェースの COM オブジェクト変数
index : [int] 型: UINT32 調査する言語と文字列のペアの 0 基準インデックス。
stringBuffer : [wstr] 型: WCHAR* 言語と文字列のペアから文字列を受け取るヌル終端の文字配列。この配列に割り当てるバッファは少なくとも size 以上でなければならない。このメソッドを使う前に GetStringLength で配列サイズを取得できる。
size : [int] 型: UINT32 配列のサイズ (文字数)。サイズには終端のヌル文字の分も含める必要がある。このメソッドを使う前に GetStringLength で配列サイズを取得できる。
%inst
指定したインデックスの文字列を指定した配列にコピーする。(IDWriteLocalizedStrings.GetString)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
返される文字列は呼び出し側が領域を確保する必要がある。次の例のように、GetString を呼ぶ前に GetStringLength
メソッドで文字列のサイズを取得できる。
（以下省略）


%index
IDWritePixelSnapping_IsPixelSnappingDisabled
IDWritePixelSnapping::IsPixelSnappingDisabled (vtable slot 3)
%prm
this, clientDrawingContext, isDisabled
this : [comobj] IDWritePixelSnapping インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 
isDisabled : [var] 
%inst


%index
IDWritePixelSnapping_GetCurrentTransform
抽象座標を DIP にマッピングする変換を取得する。
%prm
this, clientDrawingContext, transform
this : [comobj] IDWritePixelSnapping インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 型: void* IDWriteTextLayout::Draw に渡された描画コンテキスト。
transform : [var] 型: DWRITE_MATRIX* このメソッドが返るとき、ピクセルスナッピングのための変換情報を持つ構造体を格納する。
%inst
抽象座標を DIP にマッピングする変換を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWritePixelSnapping_GetPixelsPerDip
DIP あたりの物理ピクセル数を取得する。
%prm
this, clientDrawingContext, pixelsPerDip
this : [comobj] IDWritePixelSnapping インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 型: void* IDWriteTextLayout::Draw に渡された描画コンテキスト。
pixelsPerDip : [float] 型: FLOAT* このメソッドが返るとき、DIP あたりの物理ピクセル数を格納する。
%inst
DIP あたりの物理ピクセル数を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
DIP (デバイス独立ピクセル) は 1/96 インチであるため、pixelsPerDip の値は 1 インチあたりの論理ピクセル数を
96 で割ったものになる。


%index
IDWriteRenderingParams_GetGamma
ガンマ補正に使用されるガンマ値を取得する。有効な値は 0 より大きく、256 を超えてはならない。
%prm
this
this : [comobj] IDWriteRenderingParams インターフェースの COM オブジェクト変数
%inst
ガンマ補正に使用されるガンマ値を取得する。有効な値は 0 より大きく、256 を超えてはならない。

[戻り値]
型: FLOAT ガンマ補正に使用されるガンマ値を返す。有効な値は 0 より大きく、256 を超えてはならない。

[備考]
ガンマ値は、多くのモニタの非線形な輝度応答を補正するためのガンマ補正に使用される。


%index
IDWriteRenderingParams_GetEnhancedContrast
レンダリングパラメータオブジェクトの強調コントラストプロパティを取得する。有効な値は 0 以上である。
%prm
this
this : [comobj] IDWriteRenderingParams インターフェースの COM オブジェクト変数
%inst
レンダリングパラメータオブジェクトの強調コントラストプロパティを取得する。有効な値は 0 以上である。

[戻り値]
型: FLOAT コントラスト強調の量を返す。有効な値は 0 以上である。

[備考]
強調コントラストはテキストの暗さを増す量で、典型的には 0 から 1 の範囲を取る。0 はコントラスト強調なしを意味する。


%index
IDWriteRenderingParams_GetClearTypeLevel
レンダリングパラメータオブジェクトの ClearType レベルを取得する。
%prm
this
this : [comobj] IDWriteRenderingParams インターフェースの COM オブジェクト変数
%inst
レンダリングパラメータオブジェクトの ClearType レベルを取得する。

[戻り値]
型: FLOAT レンダリングパラメータオブジェクトの ClearType レベル。

[備考]
ClearType レベルは ClearType
の量、すなわち各ピクセルの赤・緑・青サブピクセルがどの程度別個に扱われるかを表す。有効値は 0 (ClearType
なし、グレースケールアンチエイリアスと等価) から 1 (フル ClearType) までの範囲である。


%index
IDWriteRenderingParams_GetPixelGeometry
レンダリングパラメータオブジェクトのピクセルジオメトリを取得する。
%prm
this
this : [comobj] IDWriteRenderingParams インターフェースの COM オブジェクト変数
%inst
レンダリングパラメータオブジェクトのピクセルジオメトリを取得する。

[戻り値]
型: DWRITE_PIXEL_GEOMETRY レンダリングパラメータオブジェクトで使用されるピクセルジオメトリの種別を示す値。


%index
IDWriteRenderingParams_GetRenderingMode
レンダリングパラメータオブジェクトのレンダリングモードを取得する。
%prm
this
this : [comobj] IDWriteRenderingParams インターフェースの COM オブジェクト変数
%inst
レンダリングパラメータオブジェクトのレンダリングモードを取得する。

[戻り値]
型: DWRITE_RENDERING_MODE レンダリングパラメータオブジェクトのレンダリングモードを示す値。

[備考]
デフォルトでレンダリングモードは DWRITE_RENDERING_MODE_DEFAULT
で初期化されており、これはフォントとサイズに基づいて自動的にレンダリングモードが決定されることを意味する。指定したフォント、サイズ、レンダリングパラメータオブジェクトに対する推奨レンダリングモードを判定するには
IDWriteFontFace::GetRecommendedRenderingMode メソッドを使用する。


%index
IDWriteTextAnalysisSink_SetScriptAnalysis
指定したテキスト範囲に対するスクリプト分析を報告する。
%prm
this, textPosition, textLength, scriptAnalysis
this : [comobj] IDWriteTextAnalysisSink インターフェースの COM オブジェクト変数
textPosition : [int] 型: UINT32 報告を開始する位置。
textLength : [int] 型: UINT32 報告対象範囲の UTF16 単位数。
scriptAnalysis : [var] 型: const DWRITE_SCRIPT_ANALYSIS* 書記系スクリプトの 0 基準インデックス表現と、テキストの追加シェイピングが必要かどうかを示す値を含む構造体へのポインタ。
%inst
指定したテキスト範囲に対するスクリプト分析を報告する。

[戻り値]
型: HRESULT 成功コード、または分析を停止するためのエラーコード。


%index
IDWriteTextAnalysisSink_SetLineBreakpoints
指定位置から各文字に対する改行機会を設定する。
%prm
this, textPosition, textLength, lineBreakpoints
this : [comobj] IDWriteTextAnalysisSink インターフェースの COM オブジェクト変数
textPosition : [int] 型: UINT32 報告を開始するテキスト位置。
textLength : [int] 型: UINT32 報告対象範囲の UTF16 単位数。
lineBreakpoints : [var] 型: DWRITE_LINE_BREAKPOINT* 開始位置から指定範囲の末尾までの各文字に設定される改行条件を含む構造体へのポインタ。
%inst
指定位置から各文字に対する改行機会を設定する。

[戻り値]
型: HRESULT 成功コード、または分析を停止するためのエラーコード。


%index
IDWriteTextAnalysisSink_SetBidiLevel
範囲に対して双方向レベルを設定する。ラン変化 (明示的または解決された暗黙的) ごとに 1 度だけ呼ばれる。
%prm
this, textPosition, textLength, explicitLevel, resolvedLevel
this : [comobj] IDWriteTextAnalysisSink インターフェースの COM オブジェクト変数
textPosition : [int] 型: UINT32 報告を開始する位置。
textLength : [int] 型: UINT32 報告対象範囲の UTF16 単位数。
explicitLevel : [int] 型: UINT8 段落の読み取り方向および埋め込み制御コード RLE/RLO/LRE/LRO/PDF から決定される明示レベル。これは追加のルールが適用される前に決定される。
resolvedLevel : [int] 型: UINT8 明示レベルと文字の自然な方向性を考慮し、すべての Bidi ルールを適用した後の最終的な暗黙レベル。
%inst
範囲に対して双方向レベルを設定する。ラン変化 (明示的または解決された暗黙的) ごとに 1 度だけ呼ばれる。

[戻り値]
型: HRESULT 成功コード、または分析を停止するためのエラーコード。


%index
IDWriteTextAnalysisSink_SetNumberSubstitution
テキスト分析の影響を受けるテキスト範囲に対して数字置換を設定する。
%prm
this, textPosition, textLength, numberSubstitution
this : [comobj] IDWriteTextAnalysisSink インターフェースの COM オブジェクト変数
textPosition : [int] 型: UINT32 報告を開始する位置。
textLength : [int] 型: UINT32 報告対象範囲の UTF16 単位数。
numberSubstitution : [comobj] 型: IDWriteNumberSubstitution* 指定ロケールに対する適切な数字と数値句読点を保持するオブジェクト。このオブジェクトは IDWriteFactory::CreateNumberSubstitution で生成する。
%inst
テキスト分析の影響を受けるテキスト範囲に対して数字置換を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextAnalysisSource_GetTextAtPosition
指定したテキスト位置から始まるテキストブロックを取得する。
%prm
this, textPosition, textString, textLength
this : [comobj] IDWriteTextAnalysisSource インターフェースの COM オブジェクト変数
textPosition : [int] 型: UINT32 取得する部分の先頭位置。位置はすべて UTF16 コード単位であり、文字単位ではないため、補助文字が使用されている場合に影響する。
textString : [var] 型: const WCHAR** このメソッドが返るとき、テキスト分析から取得されるテキストブロックを表す文字配列のアドレスを格納する。
textLength : [int] 型: UINT32* このメソッドが返るとき、取得したチャンクの UTF16 単位数を格納する。返される長さはブロックの長さではなく、指定位置からブロック末尾までの残りの長さである。たとえば 100 単位のブロック内の 75 単位目の位置を問い合わせた場合は 25 を返す。
%inst
指定したテキスト位置から始まるテキストブロックを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
NULL を返すとテキストの終端 (最終文字の次の位置)
を示す。この関数は連続する各ブロックに対して繰り返し呼び出され、バッキングストア上の複数の断片化したブロックを仮想的な連続文字列として結びつける。アプリケーションはバッキングストアの一部のみをマップする疎なテキストコンテンツを実装できるが、分析関数に渡された範囲内のテキストは必ずマップしなければならない。


%index
IDWriteTextAnalysisSource_GetTextBeforePosition
指定した位置の直前にあるテキストブロックを取得する。
%prm
this, textPosition, textString, textLength
this : [comobj] IDWriteTextAnalysisSource インターフェースの COM オブジェクト変数
textPosition : [int] 型: UINT32 取得対象のテキストブロックの末尾位置の直後の位置。
textString : [var] 型: const WCHAR** このメソッドが返るとき、指定範囲のテキストブロックを表す文字配列へのポインタのアドレスを格納する。テキスト範囲は textPosition からブロック先頭までとなる。
textLength : [int] 型: UINT32* 取得したブロックの UTF16 単位数。返される長さは指定位置からブロック先頭までの長さである。
%inst
指定した位置の直前にあるテキストブロックを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
NULL は、textPosition が 0 であるか、textPosition
がテキストコンテンツ全長より大きいか、問い合わせた位置がアプリケーションのバッキングストアにマップされていないため、指定位置にチャンクがないことを示す。アプリケーションはバッキングストアの一部のみをマップする疎なテキストコンテンツを実装できるが、分析関数に渡された範囲内のテキストは必ずマップしなければならない。


%index
IDWriteTextAnalysisSource_GetParagraphReadingDirection
段落の読み取り方向を取得する。
%prm
this
this : [comobj] IDWriteTextAnalysisSource インターフェースの COM オブジェクト変数
%inst
段落の読み取り方向を取得する。

[戻り値]
型: DWRITE_READING_DIRECTION 現在の段落の読み取り方向。


%index
IDWriteTextAnalysisSource_GetLocaleName
テキスト分析の影響を受ける範囲におけるロケール名を取得する。
%prm
this, textPosition, textLength, localeName
this : [comobj] IDWriteTextAnalysisSource インターフェースの COM オブジェクト変数
textPosition : [int] 型: UINT32 調査するテキスト位置。
textLength : [int] 型: UINT32* テキスト分析の影響を受けるテキストの、次に異なるロケールまでの長さを格納する。
localeName : [var] 型: const WCHAR** テキスト分析の影響を受けるテキストからロケール名を受け取る文字配列へのポインタのアドレスを格納する。文字配列はヌル終端である。
%inst
テキスト分析の影響を受ける範囲におけるロケール名を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
localeName ポインタは次の呼び出しまで、または分析が返るまで有効でなければならない。


%index
IDWriteTextAnalysisSource_GetNumberSubstitution
テキスト分析の影響を受けるテキスト範囲から数字置換を取得する。
%prm
this, textPosition, textLength, numberSubstitution
this : [comobj] IDWriteTextAnalysisSource インターフェースの COM オブジェクト変数
textPosition : [int] 型: UINT32 報告を開始する位置。
textLength : [int] 型: UINT32* テキスト範囲のうち、次に異なる数字置換までに残っているテキストの長さ (文字数) を格納する。
numberSubstitution : [comobj] 型: IDWriteNumberSubstitution** IDWriteFactory::CreateNumberSubstitution で生成されたオブジェクトで、指定ロケールに対する適切な数字と数値句読点を保持する、そのオブジェクトへのポインタのアドレスを格納する。
%inst
テキスト分析の影響を受けるテキスト範囲から数字置換を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
実装は参照カウントをインクリメントした数字置換を返すべきであり、分析は処理を終えた時点で (次の呼び出しの前もしくは返る前に)
それを解放する。ただしシンクコールバックはその後も保持することができる。


%index
IDWriteTextAnalyzer_AnalyzeScript
テキスト範囲をスクリプト境界について解析し、ソースからテキスト属性を読み取ってシンクコールバック SetScript に Unicode スクリプト ID を報告する。
%prm
this, analysisSource, textPosition, textLength, analysisSink
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
analysisSource : [comobj] 型: IDWriteTextAnalysisSource* 解析対象のソースオブジェクトへのポインタ。
textPosition : [int] 型: UINT32 ソースオブジェクト内での解析開始テキスト位置。
textLength : [int] 型: UINT32 解析するテキストの長さ。
analysisSink : [comobj] 型: IDWriteTextAnalysisSink* テキスト解析結果を受け取るシンクコールバックオブジェクトへのポインタ。
%inst
テキスト範囲をスクリプト境界について解析し、ソースからテキスト属性を読み取ってシンクコールバック SetScript に Unicode
スクリプト ID を報告する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteTextAnalyzer_AnalyzeBidi
テキスト範囲をスクリプトの方向性について解析し、ソースから属性を読み取ってシンクコールバック SetBidiLevel にレベルを報告する。
%prm
this, analysisSource, textPosition, textLength, analysisSink
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
analysisSource : [comobj] 型: IDWriteTextAnalysisSource* 解析対象のソースオブジェクトへのポインタ。
textPosition : [int] 型: UINT32 ソースオブジェクト内での解析開始テキスト位置。
textLength : [int] 型: UINT32 解析するテキストの長さ。
analysisSink : [comobj] 型: IDWriteTextAnalysisSink* テキスト解析結果を受け取るシンクコールバックオブジェクトへのポインタ。
%inst
テキスト範囲をスクリプトの方向性について解析し、ソースから属性を読み取ってシンクコールバック SetBidiLevel
にレベルを報告する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
この関数は複数の段落を扱えるが、テキスト範囲を段落の途中で恣意的に分割すべきではない。Bidi
アルゴリズムは段落全体に適用することが前提のため、分割すると返されるレベルが誤りになる可能性がある。


%index
IDWriteTextAnalyzer_AnalyzeNumberSubstitution
テキスト範囲を数字置換が適用可能な区間について解析し、ソースから属性を読み取ってシンクコールバック SetNumberSubstitution に置換可能な範囲を報告する。
%prm
this, analysisSource, textPosition, textLength, analysisSink
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
analysisSource : [comobj] 型: IDWriteTextAnalysisSource* 解析対象のソースオブジェクト。
textPosition : [int] 型: UINT32 ソースオブジェクト内での開始位置。
textLength : [int] 型: UINT32 解析する長さ。
analysisSink : [comobj] 型: IDWriteTextAnalysisSink* テキスト解析結果を受け取るシンクコールバックオブジェクトへのポインタ。
%inst
テキスト範囲を数字置換が適用可能な区間について解析し、ソースから属性を読み取ってシンクコールバック
SetNumberSubstitution に置換可能な範囲を報告する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]

この関数は異なる数字置換を持つ複数の範囲を扱えるが、テキスト範囲を数字の途中で恣意的に分割すべきではない。分割すると、数字が個別に扱われ、間にある句読点が翻訳されない。


%index
IDWriteTextAnalyzer_AnalyzeLineBreakpoints
テキスト範囲を改行可能箇所について解析し、ソースから属性を読み取ってシンクコールバック SetLineBreakpoints に改行可能箇所を報告する。
%prm
this, analysisSource, textPosition, textLength, analysisSink
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
analysisSource : [comobj] 型: IDWriteTextAnalysisSource* 解析対象のソースオブジェクトへのポインタ。
textPosition : [int] 型: UINT32 ソースオブジェクト内での解析開始テキスト位置。
textLength : [int] 型: UINT32 解析するテキストの長さ。
analysisSink : [comobj] 型: IDWriteTextAnalysisSink* テキスト解析結果を受け取るシンクコールバックオブジェクトへのポインタ。
%inst
テキスト範囲を改行可能箇所について解析し、ソースから属性を読み取ってシンクコールバック SetLineBreakpoints
に改行可能箇所を報告する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]

この関数は複数段落を扱えるが、指定したテキスト範囲が完結した単位として扱える場合を除き、テキスト範囲を段落の途中で恣意的に分割すべきではない。そうでないと、最初と最後の文字に対して返されるプロパティが不適切に改行を許可する可能性がある。


%index
IDWriteTextAnalyzer_GetGlyphs
入力テキスト文字列を解析し、フォントと書記系のレンダリング規則に従ってグリフおよび関連するグリフデータの集合にマッピングする。
%prm
this, textString, textLength, fontFace, isSideways, isRightToLeft, scriptAnalysis, localeName, numberSubstitution, features, featureRangeLengths, featureRanges, maxGlyphCount, clusterMap, textProps, glyphIndices, glyphProps, actualGlyphCount
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
textString : [wstr] 型: const WCHAR* グリフに変換する文字の配列。
textLength : [int] 型: UINT32 textString の長さ。
fontFace : [comobj] 型: IDWriteFontFace* 出力グリフの元となるフォントフェイス。
isSideways : [int] 型: BOOL テキストを縦書きで描画することを意図している場合に TRUE を設定するブールフラグ。
isRightToLeft : [int] 型: BOOL 右から左方向のテキストの場合に TRUE を設定するブールフラグ。
scriptAnalysis : [var] 型: const DWRITE_SCRIPT_ANALYSIS* AnalyzeScript 呼び出しから得られるスクリプト解析結果へのポインタ。
localeName : [wstr] 型: const WCHAR* グリフを選択する際に使用するロケール。例えば同じ文字でも ja-jp と zh-chs では異なるグリフにマッピングされる場合がある。NULL の場合はスクリプトに基づく既定のマッピングが使用される。
numberSubstitution : [comobj] 型: IDWriteNumberSubstitution* AnalyzeNumberSubstitution の結果に基づき、数字および関連する数値文字に対して適切なグリフを選択する任意の数字置換へのポインタ。NULL を渡すと、置換は不要であり、数字に対して基本グリフを使用することを示す。
features : [var] 型: const DWRITE_TYPOGRAPHIC_FEATURES** 各フィーチャー範囲で使用するタイポグラフィフィーチャーの集合へのポインタの配列。
featureRangeLengths : [var] 型: const UINT32* 各フィーチャー範囲の長さ (文字数)。すべての長さの合計は textLength と等しくなるべきである。
featureRanges : [int] 型: UINT32 フィーチャー範囲の数。
maxGlyphCount : [int] 型: UINT32 返却可能なグリフの最大数。
clusterMap : [int] 型: UINT16* メソッドが戻る際、文字範囲からグリフ範囲へのマッピングを格納する。
textProps : [var] 型: DWRITE_SHAPING_TEXT_PROPERTIES* メソッドが戻る際、各文字のシェーピングプロパティを格納する構造体の配列へのポインタを格納する。
glyphIndices : [int] 型: UINT16* 出力グリフインデックス。
glyphProps : [var] 型: DWRITE_SHAPING_GLYPH_PROPERTIES* メソッドが戻る際、各出力グリフのシェーピングプロパティを格納する構造体の配列へのポインタを格納する。
actualGlyphCount : [int] 型: UINT32* メソッドが戻る際、呼び出しが成功した場合に返されたグリフの実数を格納する。
%inst
入力テキスト文字列を解析し、フォントと書記系のレンダリング規則に従ってグリフおよび関連するグリフデータの集合にマッピングする。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
文字からグリフへのマッピングは一般に多対多である。グリフ単位の出力バッファに対する推奨見積もりは (3 * textLength / 2
+ 16) だが、これで十分である保証はない。actualGlyphCount
パラメータの値は呼び出しが成功した場合にのみ有効である。maxGlyphCount
が十分でない場合、HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER)
が返される。アプリケーションはより大きなバッファを確保して再試行すべきである。


%index
IDWriteTextAnalyzer_GetGlyphPlacements
GetGlyphs メソッドから出力されたグリフを、フォントと書記系のレンダリング規則に従って配置する。
%prm
this, textString, clusterMap, textProps, textLength, glyphIndices, glyphProps, glyphCount, fontFace, fontEmSize, isSideways, isRightToLeft, scriptAnalysis, localeName, features, featureRangeLengths, featureRanges, glyphAdvances, glyphOffsets
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
textString : [wstr] 型: const WCHAR* グリフの元となった元の文字列を格納する文字配列。
clusterMap : [int] 型: const UINT16* 文字範囲からグリフ範囲へのマッピングへのポインタ。これは GetGlyphs により返される。
textProps : [var] 型: DWRITE_SHAPING_TEXT_PROPERTIES* 各文字のシェーピングプロパティを格納する構造体の配列へのポインタ。この構造体は GetGlyphs により返される。
textLength : [int] 型: UINT32 textString のテキスト長。
glyphIndices : [int] 型: const UINT16* GetGlyphs により返されたグリフインデックスの配列。
glyphProps : [var] 型: const DWRITE_SHAPING_GLYPH_PROPERTIES* GetGlyphs により返された各グリフのシェーピングプロパティを格納する構造体の配列へのポインタ。
glyphCount : [int] 型: UINT32 GetGlyphs から返されたグリフ数。
fontFace : [comobj] 型: IDWriteFontFace* 出力グリフの元となるフォントフェイスへのポインタ。
fontEmSize : [float] 型: FLOAT 論理フォントサイズ (DIP 単位)。
isSideways : [int] 型: BOOL テキストを縦書きで描画することを意図している場合に TRUE を設定するブールフラグ。
isRightToLeft : [int] 型: BOOL 右から左方向のテキストの場合に TRUE を設定するブールフラグ。
scriptAnalysis : [var] 型: const DWRITE_SCRIPT_ANALYSIS* AnalyzeScript 呼び出しから得られるスクリプト解析結果へのポインタ。
localeName : [wstr] 型: const WCHAR* グリフを選択する際に使用するロケールを格納する文字配列。例えば、同じ文字でも ja-jp と zh-chs では異なるグリフにマッピングされる場合がある。NULL の場合はスクリプトに基づく既定のマッピングが使用される。
features : [var] 型: const DWRITE_TYPOGRAPHIC_FEATURES** 各フィーチャー範囲で使用するタイポグラフィフィーチャーの集合へのポインタの配列。
featureRangeLengths : [var] 型: const UINT32* 各フィーチャー範囲の長さ (文字数)。すべての長さの合計は textLength と等しくなるべきである。
featureRanges : [int] 型: UINT32 フィーチャー範囲の数。
glyphAdvances : [float] 型: FLOAT* メソッドが戻る際、各グリフのアドバンス幅を格納する。
glyphOffsets : [var] 型: DWRITE_GLYPH_OFFSET* メソッドが戻る際、各グリフの原点のオフセットを格納する。
%inst
GetGlyphs メソッドから出力されたグリフを、フォントと書記系のレンダリング規則に従って配置する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IDWriteTextAnalyzer_GetGdiCompatibleGlyphPlacements
GetGlyphs メソッドから出力されたグリフを、フォントと書記系のレンダリング規則に従って配置する。
%prm
this, textString, clusterMap, textProps, textLength, glyphIndices, glyphProps, glyphCount, fontFace, fontEmSize, pixelsPerDip, transform, useGdiNatural, isSideways, isRightToLeft, scriptAnalysis, localeName, features, featureRangeLengths, featureRanges, glyphAdvances, glyphOffsets
this : [comobj] IDWriteTextAnalyzer インターフェースの COM オブジェクト変数
textString : [wstr] 型: **const WCHAR\*** グリフの元となった元の文字列を格納する文字配列。
clusterMap : [int] 型: **const UINT16\*** 文字範囲からグリフ範囲へのマッピングへのポインタ。これは [**GetGlyphs**](/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs) により返される。
textProps : [var] 型: **[**DWRITE\_SHAPING\_TEXT\_PROPERTIES**](/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_text_properties)\*** 各文字のシェーピングプロパティを格納する構造体の配列へのポインタ。この構造体は [**GetGlyphs**](/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs) により返される。
textLength : [int] 型: **UINT32** *textString* のテキスト長。
glyphIndices : [int] 型: **const UINT16\*** [**GetGlyphs**](/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs) により返されたグリフインデックスの配列。
glyphProps : [var] 型: **const [**DWRITE\_SHAPING\_GLYPH\_PROPERTIES**](/windows/win32/api/dwrite/ns-dwrite-dwrite_shaping_glyph_properties)\*** [**GetGlyphs**](/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs) により返された各グリフのシェーピングプロパティを格納する構造体の配列へのポインタ。
glyphCount : [int] 型: **UINT32** [**GetGlyphs**](/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-getglyphs) から返されたグリフ数。
fontFace : [comobj] 型: **[**IDWriteFontFace**](/windows/win32/api/dwrite/nn-dwrite-idwritefontface)\*** 出力グリフの元となるフォントフェイスへのポインタ。
fontEmSize : [float] 型: **FLOAT** 論理フォントサイズ (DIP 単位)。
pixelsPerDip : [float] 型: **FLOAT** DIP あたりの物理ピクセル数。
transform : [var] 型: **const [**DWRITE\_MATRIX**](/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix)\*** グリフおよびその位置に適用する任意のトランスフォーム。このトランスフォームは、フォントサイズと *pixelsPerDip* による拡大縮小の後に適用される。
useGdiNatural : [int] 型: **BOOL** **FALSE** の場合、メトリクスは GDI エイリアステキストと同じになる。**TRUE** の場合、メトリクスは **CLEARTYPE\_NATURAL\_QUALITY** で作成されたフォントを用いて GDI が計測したテキストと同じになる。
isSideways : [int] 型: **BOOL** テキストを縦書きで描画することを意図している場合に **TRUE** を設定するブールフラグ。
isRightToLeft : [int] 型: **BOOL** 右から左方向のテキストの場合に **TRUE** を設定するブールフラグ。
scriptAnalysis : [var] 型: **const [**DWRITE\_SCRIPT\_ANALYSIS**](/windows/win32/api/dwrite/ns-dwrite-dwrite_script_analysis)\*** [**AnalyzeScript**](/windows/win32/api/dwrite/nf-dwrite-idwritetextanalyzer-analyzescript) 呼び出しから得られるスクリプト解析結果へのポインタ。
localeName : [wstr] 型: **const WCHAR\*** グリフを選択する際に使用するロケールを格納する文字配列。例えば、同じ文字でも ja-jp と zh-chs では異なるグリフにマッピングされる場合がある。**NULL** の場合はスクリプトに基づく既定のマッピングが使用される。
features : [var] 型: **const [**DWRITE\_TYPOGRAPHIC\_FEATURES**](/windows/win32/api/dwrite/ns-dwrite-dwrite_typographic_features)\*\*** 各フィーチャー範囲で使用するタイポグラフィフィーチャーの集合へのポインタの配列。
featureRangeLengths : [var] 型: **const UINT32\*** 各フィーチャー範囲の長さ (文字数)。すべての長さの合計は *textLength* と等しくなるべきである。
featureRanges : [int] 型: **UINT32** フィーチャー範囲の数。
glyphAdvances : [float] 型: **FLOAT\*** メソッドが戻る際、各グリフのアドバンス幅を格納する。
glyphOffsets : [var] 型: **[**DWRITE\_GLYPH\_OFFSET**](/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_offset)\*** メソッドが戻る際、各グリフの原点のオフセットを格納する。
%inst
GetGlyphs メソッドから出力されたグリフを、フォントと書記系のレンダリング規則に従って配置する。

[戻り値]
型: **HRESULT** このメソッドが成功した場合は **S\_OK** を返す。そうでない場合は **HRESULT**
エラーコードを返す。


%index
IDWriteTextFormat_SetTextAlignment
IDWriteTextFormat インターフェースのレイアウトボックスの先頭側と末尾側の端に対する、段落内のテキストの配置を設定する。
%prm
this, textAlignment
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
textAlignment : [int] 型: DWRITE_TEXT_ALIGNMENT 段落に設定する DWRITE_TEXT_ALIGNMENT 型のテキスト配置オプション。詳細は備考を参照。
%inst
IDWriteTextFormat インターフェースのレイアウトボックスの先頭側と末尾側の端に対する、段落内のテキストの配置を設定する。

[戻り値]
型: HRESULT このメソッドは次のいずれかの値を返す。
（以下省略）

[備考]
テキストはレイアウトボックスの先頭側または末尾側の端に揃えるか、中央揃えにできる。次の図は、配置をそれぞれ
DWRITE_TEXT_ALIGNMENT_LEADING、DWRITE_TEXT_ALIGNMENT_CENTER、DWRITE_TEXT_ALIGNMENT_TRAILING
に設定したテキストを示している。
（以下省略）


%index
IDWriteTextFormat_SetParagraphAlignment
レイアウトボックスの上下端に対する段落の配置オプションを設定する。
%prm
this, paragraphAlignment
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
paragraphAlignment : [int] 型: DWRITE_PARAGRAPH_ALIGNMENT 段落に設定する段落配置オプション。詳細は DWRITE_PARAGRAPH_ALIGNMENT を参照。
%inst
レイアウトボックスの上下端に対する段落の配置オプションを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteTextFormat_SetWordWrapping
ワードラップオプションを設定する。
%prm
this, wordWrapping
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
wordWrapping : [int] 型: DWRITE_WORD_WRAPPING 段落に設定するワードラップオプション。詳細は DWRITE_WORD_WRAPPING を参照。
%inst
ワードラップオプションを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteTextFormat_SetReadingDirection
段落の読み取り方向を設定する。
%prm
this, readingDirection
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
readingDirection : [int] 型: DWRITE_READING_DIRECTION 段落のテキスト読み取り方向 (たとえば、アラビア語のような右から左に読む言語向けには DWRITE_READING_DIRECTION_RIGHT_TO_LEFT)。
%inst
段落の読み取り方向を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
読み取り方向とフロー方向は常に互いに 90 度直交するように設定する必要がある。さもないと、Draw や GetMetrics
などのレイアウト関数を使用した際に DWRITE_E_FLOWDIRECTIONCONFLICTS
エラーが発生する。したがって、垂直の読み取り方向 (たとえば
DWRITE_READING_DIRECTION_TOP_TO_BOTTOM) を設定する場合、SetFlowDirection
を使用してフロー方向も適切に (たとえば DWRITE_FLOW_DIRECTION_RIGHT_TO_LEFT に)
設定する必要がある。


%index
IDWriteTextFormat_SetFlowDirection
段落のフロー方向を設定する。
%prm
this, flowDirection
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
flowDirection : [int] 型: DWRITE_FLOW_DIRECTION 段落のフロー方向。詳細は DWRITE_FLOW_DIRECTION を参照。
%inst
段落のフロー方向を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteTextFormat_SetIncrementalTabStop
隣接する 2 つのタブストップ間に固定距離を設定する。
%prm
this, incrementalTabStop
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
incrementalTabStop : [float] 型: FLOAT 隣接する 2 つのタブストップ間の固定距離。
%inst
隣接する 2 つのタブストップ間に固定距離を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteTextFormat_SetTrimming
レイアウト幅をオーバーフローするテキストのトリミングオプションを設定する。
%prm
this, trimmingOptions, trimmingSign
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
trimmingOptions : [var] 型: const DWRITE_TRIMMING* テキストトリミングオプション。
trimmingSign : [comobj] 型: IDWriteInlineObject* アプリケーション定義の省略記号。このパラメータは NULL でもよい。詳細は IDWriteInlineObject を参照。
%inst
レイアウト幅をオーバーフローするテキストのトリミングオプションを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteTextFormat_SetLineSpacing
行間を設定する。
%prm
this, lineSpacingMethod, lineSpacing, baseline
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
lineSpacingMethod : [int] 型: DWRITE_LINE_SPACING_METHOD 行の高さの決定方法を指定する。詳細は DWRITE_LINE_SPACING_METHOD を参照。
lineSpacing : [float] 型: FLOAT 行の高さ、つまりあるベースラインから別のベースラインまでの距離。
baseline : [float] 型: FLOAT 行頭からベースラインまでの距離。lineSpacing に対する妥当な比率は 80 パーセントである。
%inst
行間を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
デフォルトの方法では、間隔は内容のみに依存する。一様な間隔の場合、指定された行の高さが内容を上書きする。


%index
IDWriteTextFormat_GetTextAlignment
レイアウトボックスの先頭側と末尾側の端に対するテキストの配置オプションを取得する。
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
レイアウトボックスの先頭側と末尾側の端に対するテキストの配置オプションを取得する。

[戻り値]
型: DWRITE_TEXT_ALIGNMENT 現在の段落のテキスト配置オプションを返す。


%index
IDWriteTextFormat_GetParagraphAlignment
レイアウトボックスの上下端に対する段落の配置オプションを取得する。
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
レイアウトボックスの上下端に対する段落の配置オプションを取得する。

[戻り値]
型: DWRITE_PARAGRAPH_ALIGNMENT 現在の段落配置オプションを示す値。


%index
IDWriteTextFormat_GetWordWrapping
ワードラップオプションを取得する。
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
ワードラップオプションを取得する。

[戻り値]
型: DWRITE_WORD_WRAPPING ワードラップオプションを返す。詳細は DWRITE_WORD_WRAPPING を参照。


%index
IDWriteTextFormat_GetReadingDirection
段落内のテキストの現在の読み取り方向を取得する。
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
段落内のテキストの現在の読み取り方向を取得する。

[戻り値]
型: DWRITE_READING_DIRECTION 段落内のテキストの現在の読み取り方向を示す値。


%index
IDWriteTextFormat_GetFlowDirection
テキスト行が流れる方向を取得する。
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
テキスト行が流れる方向を取得する。

[戻り値]
型: DWRITE_FLOW_DIRECTION
親コンテナ内でテキスト行が流れる方向。たとえば、DWRITE_FLOW_DIRECTION_TOP_TO_BOTTOM
はテキスト行が上から下へ配置されることを示す。


%index
IDWriteTextFormat_GetIncrementalTabStop
インクリメンタルタブストップ位置を取得する。
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
インクリメンタルタブストップ位置を取得する。

[戻り値]
型: FLOAT インクリメンタルタブストップの値。


%index
IDWriteTextFormat_GetTrimming
レイアウトボックスからオーバーフローするテキストのトリミングオプションを取得する。
%prm
this, trimmingOptions, trimmingSign
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
trimmingOptions : [var] 型: DWRITE_TRIMMING* このメソッドが返るときに、オーバーフローテキストのトリミングオプションを保持する DWRITE_TRIMMING 構造体へのポインタを格納する。
trimmingSign : [comobj] 型: IDWriteInlineObject** このメソッドが返るときに、トリミング省略記号へのポインタのアドレスを格納する。このパラメータは NULL でもよい。
%inst
レイアウトボックスからオーバーフローするテキストのトリミングオプションを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteTextFormat_GetLineSpacing
複数行のテキスト段落に設定された行間調整を取得する。(IDWriteTextFormat.GetLineSpacing)
%prm
this, lineSpacingMethod, lineSpacing, baseline
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
lineSpacingMethod : [var] 型: DWRITE_LINE_SPACING_METHOD* 行の高さの決定方法を示す値。
lineSpacing : [float] 型: FLOAT* このメソッドが返るときに、行の高さ、つまりあるベースラインから別のベースラインまでの距離を格納する。
baseline : [float] 型: FLOAT* このメソッドが返るときに、行頭からベースラインまでの距離を格納する。lineSpacing に対する妥当な比率は 80 パーセントである。
%inst
複数行のテキスト段落に設定された行間調整を取得する。(IDWriteTextFormat.GetLineSpacing)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteTextFormat_GetFontCollection
現在のフォントコレクションを取得する。
%prm
this, fontCollection
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
fontCollection : [comobj] 型: IDWriteFontCollection** このメソッドが返るときに、現在のテキストに使用されているフォントコレクションへのポインタのアドレスを格納する。
%inst
現在のフォントコレクションを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteTextFormat_GetFontFamilyNameLength
フォントファミリ名の長さを取得する。
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
フォントファミリ名の長さを取得する。

[戻り値]
型: UINT32 文字配列のサイズ (終端の NULL 文字を含まない文字数)。


%index
IDWriteTextFormat_GetFontFamilyName
フォントファミリ名のコピーを取得する。
%prm
this, fontFamilyName, nameSize
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
fontFamilyName : [wstr] 型: WCHAR* このメソッドが返るときに、現在のフォントファミリ名を受け取る、null 終端の文字配列へのポインタを格納する。この配列に確保するバッファは、少なくとも nameSize 要素分のサイズが必要である。
nameSize : [int] 型: UINT32 fontFamilyName 文字配列のサイズ (終端の NULL 文字を含む文字数)。fontFamilyName のサイズを調べるには GetFontFamilyNameLength を使用する。
%inst
フォントファミリ名のコピーを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteTextFormat_GetFontWeight
テキストのフォントウェイトを取得する。
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
テキストのフォントウェイトを取得する。

[戻り値]
型: DWRITE_FONT_WEIGHT ウェイトの種類 (normal、bold、black など) を示す値。


%index
IDWriteTextFormat_GetFontStyle
テキストのフォントスタイルを取得する。
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
テキストのフォントスタイルを取得する。

[戻り値]
型: DWRITE_FONT_STYLE フォントスタイルの種類 (slope、incline など) を示す値。


%index
IDWriteTextFormat_GetFontStretch
テキストのフォントストレッチを取得する。
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
テキストのフォントストレッチを取得する。

[戻り値]
型: DWRITE_FONT_STRETCH フォントストレッチの種類 (normal、condensed など) を示す値。


%index
IDWriteTextFormat_GetFontSize
フォントサイズを DIP 単位で取得する。
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
フォントサイズを DIP 単位で取得する。

[戻り値]
型: FLOAT 現在のフォントサイズ (DIP 単位)。


%index
IDWriteTextFormat_GetLocaleNameLength
ロケール名の長さを取得する。
%prm
this
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
%inst
ロケール名の長さを取得する。

[戻り値]
型: UINT32 文字配列のサイズ (終端の NULL 文字を含まない文字数)。


%index
IDWriteTextFormat_GetLocaleName
ロケール名のコピーを取得する。
%prm
this, localeName, nameSize
this : [comobj] IDWriteTextFormat インターフェースの COM オブジェクト変数
localeName : [wstr] 型: WCHAR* 現在のロケール名を受け取る文字配列を格納する。
nameSize : [int] 型: UINT32 文字配列のサイズ (終端の NULL 文字を含む文字数)。ロケール名の文字配列のサイズを取得するには GetLocaleNameLength を使用する。
%inst
ロケール名のコピーを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_SetTextAlignment
IDWriteTextLayout::SetTextAlignment (vtable slot 3)
%prm
this, textAlignment
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
textAlignment : [int] 
%inst


%index
IDWriteTextLayout_SetParagraphAlignment
IDWriteTextLayout::SetParagraphAlignment (vtable slot 4)
%prm
this, paragraphAlignment
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
paragraphAlignment : [int] 
%inst


%index
IDWriteTextLayout_SetWordWrapping
IDWriteTextLayout::SetWordWrapping (vtable slot 5)
%prm
this, wordWrapping
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
wordWrapping : [int] 
%inst


%index
IDWriteTextLayout_SetReadingDirection
IDWriteTextLayout::SetReadingDirection (vtable slot 6)
%prm
this, readingDirection
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
readingDirection : [int] 
%inst


%index
IDWriteTextLayout_SetFlowDirection
IDWriteTextLayout::SetFlowDirection (vtable slot 7)
%prm
this, flowDirection
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
flowDirection : [int] 
%inst


%index
IDWriteTextLayout_SetIncrementalTabStop
IDWriteTextLayout::SetIncrementalTabStop (vtable slot 8)
%prm
this, incrementalTabStop
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
incrementalTabStop : [float] 
%inst


%index
IDWriteTextLayout_SetTrimming
IDWriteTextLayout::SetTrimming (vtable slot 9)
%prm
this, trimmingOptions, trimmingSign
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
trimmingOptions : [var] 
trimmingSign : [comobj] 
%inst


%index
IDWriteTextLayout_SetLineSpacing
IDWriteTextLayout::SetLineSpacing (vtable slot 10)
%prm
this, lineSpacingMethod, lineSpacing, baseline
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
lineSpacingMethod : [int] 
lineSpacing : [float] 
baseline : [float] 
%inst


%index
IDWriteTextLayout_GetTextAlignment
IDWriteTextLayout::GetTextAlignment (vtable slot 11)
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst


%index
IDWriteTextLayout_GetParagraphAlignment
IDWriteTextLayout::GetParagraphAlignment (vtable slot 12)
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst


%index
IDWriteTextLayout_GetWordWrapping
IDWriteTextLayout::GetWordWrapping (vtable slot 13)
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst


%index
IDWriteTextLayout_GetReadingDirection
IDWriteTextLayout::GetReadingDirection (vtable slot 14)
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst


%index
IDWriteTextLayout_GetFlowDirection
IDWriteTextLayout::GetFlowDirection (vtable slot 15)
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst


%index
IDWriteTextLayout_GetIncrementalTabStop
IDWriteTextLayout::GetIncrementalTabStop (vtable slot 16)
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst


%index
IDWriteTextLayout_GetTrimming
IDWriteTextLayout::GetTrimming (vtable slot 17)
%prm
this, trimmingOptions, trimmingSign
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
trimmingOptions : [var] 
trimmingSign : [comobj] 
%inst


%index
IDWriteTextLayout_GetLineSpacing
IDWriteTextLayout::GetLineSpacing (vtable slot 18)
%prm
this, lineSpacingMethod, lineSpacing, baseline
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
lineSpacingMethod : [var] 
lineSpacing : [float] 
baseline : [float] 
%inst


%index
IDWriteTextLayout_GetFontCollection
指定した位置のテキストに関連付けられたフォントコレクションを取得する。
%prm
this, fontCollection
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontCollection : [comobj] 型: IDWriteFontCollection** 現在のフォントコレクションへのポインタのアドレスが格納される。
%inst
指定した位置のテキストに関連付けられたフォントコレクションを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetFontFamilyNameLength
現在の位置にあるフォントファミリ名の長さを取得する。
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
現在の位置にあるフォントファミリ名の長さを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetFontFamilyName
指定した位置のテキストのフォントファミリ名をコピーする。
%prm
this, fontFamilyName, nameSize
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontFamilyName : [wstr] 型: WCHAR* このメソッドが返るとき、現在のフォントファミリ名を受け取る文字配列が格納される。このパラメータ用の領域は呼び出し側で確保しなければならない。
nameSize : [int] 型: UINT32 終端 NULL 文字を含む、文字数単位での文字配列のサイズ。
%inst
指定した位置のテキストのフォントファミリ名をコピーする。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetFontWeight
指定した位置のテキストのフォントウェイトを取得する。
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
指定した位置のテキストのフォントウェイトを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetFontStyle
指定した位置のテキストのフォントスタイル (傾斜とも呼ばれる) を取得する。
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
指定した位置のテキストのフォントスタイル (傾斜とも呼ばれる) を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetFontStretch
指定した位置のテキストのフォントストレッチを取得する。
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
指定した位置のテキストのフォントストレッチを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetFontSize
指定した位置のテキストのフォント em 高さを取得する。
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
指定した位置のテキストのフォント em 高さを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetLocaleNameLength
指定した位置のテキストのロケール名の長さを取得する。
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
指定した位置のテキストのロケール名の長さを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetLocaleName
指定した位置のテキストのロケール名を取得する。
%prm
this, localeName, nameSize
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
localeName : [wstr] 型: WCHAR* このメソッドが返るとき、現在のロケール名を受け取る文字配列が格納される。
nameSize : [int] 型: UINT32 終端 NULL 文字を含む、文字数単位での文字配列のサイズ。
%inst
指定した位置のテキストのロケール名を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_SetMaxWidth
レイアウトの最大幅を設定する。
%prm
this, maxWidth
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
maxWidth : [float] 型: FLOAT レイアウトボックスの最大幅を示す値。
%inst
レイアウトの最大幅を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_SetMaxHeight
レイアウトの最大高さを設定する。
%prm
this, maxHeight
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
maxHeight : [float] 型: FLOAT レイアウトボックスの最大高さを示す値。
%inst
レイアウトの最大高さを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_SetFontCollection
フォントコレクションを設定する。
%prm
this, fontCollection, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontCollection : [comobj] 型: IDWriteFontCollection* 設定するフォントコレクション。
textRange : [int] 型: DWRITE_TEXT_RANGE この変更が適用されるテキスト範囲。
%inst
フォントコレクションを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_SetFontFamilyName
指定したテキスト範囲内のテキストに対してヌル終端のフォントファミリ名を設定する。
%prm
this, fontFamilyName, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontFamilyName : [wstr] 型: const WCHAR* textRange で指定された範囲内のテキスト文字列全体に適用されるフォントファミリ名。
textRange : [int] 型: DWRITE_TEXT_RANGE この変更が適用されるテキスト範囲。
%inst
指定したテキスト範囲内のテキストに対してヌル終端のフォントファミリ名を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_SetFontWeight
DWRITE_TEXT_RANGE 構造体で指定したテキスト範囲内のテキストに対してフォントウェイトを設定する。
%prm
this, fontWeight, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontWeight : [int] 型: DWRITE_FONT_WEIGHT textRange で指定された範囲内のテキストに設定するフォントウェイト。
textRange : [int] 型: DWRITE_TEXT_RANGE この変更が適用されるテキスト範囲。
%inst
DWRITE_TEXT_RANGE 構造体で指定したテキスト範囲内のテキストに対してフォントウェイトを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
フォントウェイトは DWRITE_FONT_WEIGHT 列挙型で提供される定義済みフォントウェイト値のいずれか、または 1 から 999
の整数に設定できる。この範囲外の値はメソッドを失敗させ、E_INVALIDARG の戻り値となる。次の図は Palatino
Linotype 書体の Normal と UltraBold ウェイトの例を示している。
（以下省略）


%index
IDWriteTextLayout_SetFontStyle
DWRITE_TEXT_RANGE 構造体で指定したテキスト範囲内のテキストに対してフォントスタイルを設定する。
%prm
this, fontStyle, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontStyle : [int] 型: DWRITE_FONT_STYLE textRange で指定された範囲内のテキストに設定するフォントスタイル。
textRange : [int] 型: DWRITE_TEXT_RANGE この変更が適用されるテキスト範囲。
%inst
DWRITE_TEXT_RANGE 構造体で指定したテキスト範囲内のテキストに対してフォントスタイルを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
フォントスタイルは Normal、Italic、Oblique のいずれかに設定できる。次の図は Palatino フォントの 3
種類のスタイルを示している。詳細は DWRITE_FONT_STYLE を参照。
（以下省略）


%index
IDWriteTextLayout_SetFontStretch
指定したテキスト範囲内のテキストに対してフォントストレッチを設定する。
%prm
this, fontStretch, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontStretch : [int] 型: DWRITE_FONT_STRETCH textRange で指定された範囲内のテキストに対するフォントストレッチの種類を示す値。
textRange : [int] 型: DWRITE_TEXT_RANGE この変更が適用されるテキスト範囲。
%inst
指定したテキスト範囲内のテキストに対してフォントストレッチを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_SetFontSize
指定したテキスト範囲内のテキストに対して DIP 単位のフォントサイズを設定する。
%prm
this, fontSize, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
fontSize : [float] 型: FLOAT textRange で指定された範囲内のテキストに設定するフォントサイズ (DIP 単位)。
textRange : [int] 型: DWRITE_TEXT_RANGE この変更が適用されるテキスト範囲。
%inst
指定したテキスト範囲内のテキストに対して DIP 単位のフォントサイズを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_SetUnderline
指定したテキスト範囲内のテキストに対して下線を設定する。
%prm
this, hasUnderline, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
hasUnderline : [int] 型: BOOL 指定したテキスト範囲内で下線が有効かどうかを示すブール値フラグ。
textRange : [int] 型: DWRITE_TEXT_RANGE この変更が適用されるテキスト範囲。
%inst
指定したテキスト範囲内のテキストに対して下線を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_SetStrikethrough
指定したテキスト範囲内のテキストに対して取り消し線を設定する。
%prm
this, hasStrikethrough, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
hasStrikethrough : [int] 型: BOOL textRange で指定された範囲内で取り消し線が有効かどうかを示すブール値フラグ。
textRange : [int] 型: DWRITE_TEXT_RANGE この変更が適用されるテキスト範囲。
%inst
指定したテキスト範囲内のテキストに対して取り消し線を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_SetDrawingEffect
アプリケーション定義の描画エフェクトを設定する。
%prm
this, drawingEffect, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
drawingEffect : [int] 型: IUnknown* 範囲に適用されるアプリケーション定義の描画エフェクト。このデータオブジェクトは最終レンダリングのためにアプリケーションの描画コールバックに渡される。
textRange : [int] 型: DWRITE_TEXT_RANGE この変更が適用されるテキスト範囲。
%inst
アプリケーション定義の描画エフェクトを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
ID2D1RenderTarget::DrawTextLayout を使ってテキストを描画する場合、色やグラデーションブラシなどの
ID2D1Brush
を描画エフェクトとして設定でき、そのブラシは指定したテキスト範囲の描画に使用される。この描画エフェクトは指定された範囲に関連付けられ、描画時に範囲が描画されるときコールバックを通じてアプリケーションに渡される。


%index
IDWriteTextLayout_SetInlineObject
インラインオブジェクトを設定する。
%prm
this, inlineObject, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
inlineObject : [comobj] 型: IDWriteInlineObject* アプリケーション定義のインラインオブジェクト。
textRange : [int] 型: DWRITE_TEXT_RANGE この変更が適用されるテキスト範囲。
%inst
インラインオブジェクトを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]

アプリケーションはこの関数を呼び出して、特定の範囲に対するアプリケーション定義のインラインオブジェクトを記述するプロパティセットを指定できる。このインラインオブジェクトは指定された範囲に適用され、範囲が描画されるときに
DrawInlineObject コールバックを通じてアプリケーションに渡される。その範囲内の任意のテキストは抑制される。


%index
IDWriteTextLayout_SetTypography
指定したテキスト範囲内のテキストに対してフォントタイポグラフィ機能を設定する。
%prm
this, typography, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
typography : [comobj] 型: IDWriteTypography* フォントタイポグラフィ設定へのポインタ。
textRange : [int] 型: DWRITE_TEXT_RANGE この変更が適用されるテキスト範囲。
%inst
指定したテキスト範囲内のテキストに対してフォントタイポグラフィ機能を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_SetLocaleName
指定したテキスト範囲内のテキストに対してロケール名を設定する。
%prm
this, localeName, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
localeName : [wstr] 型: const WCHAR* ヌル終端のロケール名文字列。
textRange : [int] 型: DWRITE_TEXT_RANGE この変更が適用されるテキスト範囲。
%inst
指定したテキスト範囲内のテキストに対してロケール名を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetMaxWidth
レイアウトの最大幅を取得する。
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
レイアウトの最大幅を取得する。

[戻り値]
型: FLOAT レイアウトの最大幅を返す。


%index
IDWriteTextLayout_GetMaxHeight
レイアウトの最大高さを取得する。
%prm
this
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
%inst
レイアウトの最大高さを取得する。

[戻り値]
型: FLOAT レイアウトの最大高さ。


%index
IDWriteTextLayout_GetFontCollection
指定した位置のテキストに関連付けられたフォントコレクションを取得する。
%prm
this, currentPosition, fontCollection, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 調査するテキストの位置。
fontCollection : [comobj] 型: IDWriteFontCollection** 現在のフォントコレクションへのポインタのアドレスが格納される。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲。つまり、そのランは下線を含め、指定位置とまったく同じ書式を持つ。
%inst
指定した位置のテキストに関連付けられたフォントコレクションを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetFontFamilyNameLength
現在の位置にあるフォントファミリ名の長さを取得する。
%prm
this, currentPosition, nameLength, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 現在のテキスト位置。
nameLength : [int] 型: UINT32* このメソッドが返るとき、終端 NULL 文字を含まない、文字数単位でのフォントファミリ名を格納する文字配列のサイズが格納される。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲。つまり、そのランはフォントファミリを含め、指定位置とまったく同じ書式を持つ。
%inst
現在の位置にあるフォントファミリ名の長さを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetFontFamilyName
指定した位置のテキストのフォントファミリ名をコピーする。
%prm
this, currentPosition, fontFamilyName, nameSize, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 調べるテキストの位置。
fontFamilyName : [wstr] 型: WCHAR* このメソッドが返るとき、現在のフォントファミリ名を受け取る文字配列が格納される。このパラメータ用の領域は呼び出し側で確保しなければならない。
nameSize : [int] 型: UINT32 終端 NULL 文字を含む、文字数単位での文字配列のサイズ。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲。つまり、そのランはフォントファミリ名を含め、指定位置とまったく同じ書式を持つ。
%inst
指定した位置のテキストのフォントファミリ名をコピーする。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetFontWeight
指定した位置のテキストのフォントウェイトを取得する。
%prm
this, currentPosition, fontWeight, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 調査するテキストの位置。
fontWeight : [var] 型: DWRITE_FONT_WEIGHT* このメソッドが返るとき、指定位置に適用されているフォントウェイトの種類を示す値が格納される。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲。つまり、そのランはフォントウェイトを含め、指定位置とまったく同じ書式を持つ。
%inst
指定した位置のテキストのフォントウェイトを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetFontStyle
指定した位置のテキストのフォントスタイル (傾斜とも呼ばれる) を取得する。
%prm
this, currentPosition, fontStyle, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 調査するテキストの位置。
fontStyle : [var] 型: DWRITE_FONT_STYLE* このメソッドが返るとき、指定位置に適用されているフォントスタイル (傾斜または傾きとも呼ばれる) の種類を示す値が格納される。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲。つまり、そのランはフォントスタイルを含め、指定位置とまったく同じ書式を持つ。
%inst
指定した位置のテキストのフォントスタイル (傾斜とも呼ばれる) を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetFontStretch
指定した位置のテキストのフォントストレッチを取得する。
%prm
this, currentPosition, fontStretch, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 調査するテキストの位置。
fontStretch : [var] 型: DWRITE_FONT_STRETCH* このメソッドが返るとき、指定位置に適用されているフォントストレッチ (幅とも呼ばれる) の種類を示す値が格納される。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲。つまり、そのランはフォントストレッチを含め、指定位置とまったく同じ書式を持つ。
%inst
指定した位置のテキストのフォントストレッチを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetFontSize
指定した位置のテキストのフォント em 高さを取得する。
%prm
this, currentPosition, fontSize, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 調査するテキストの位置。
fontSize : [float] 型: FLOAT* このメソッドが返るとき、指定位置のテキストのフォントサイズが em 単位で格納される。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲。つまり、そのランはフォントサイズを含め、指定位置とまったく同じ書式を持つ。
%inst
指定した位置のテキストのフォント em 高さを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetUnderline
指定した位置のテキストに下線が存在するかを取得する。
%prm
this, currentPosition, hasUnderline, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 現在のテキスト位置。
hasUnderline : [var] 型: BOOL* currentPosition で示される位置に下線が存在するかどうかを示すブール値フラグ。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲。つまり、そのランは下線を含め、指定位置とまったく同じ書式を持つ。
%inst
指定した位置のテキストに下線が存在するかを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetStrikethrough
指定した位置のテキストに取り消し線が存在するかを取得する。
%prm
this, currentPosition, hasStrikethrough, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 調査するテキストの位置。
hasStrikethrough : [var] 型: BOOL* currentPosition で示される位置に取り消し線が存在するかどうかを示すブール値フラグ。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲が格納される。つまり、そのランは取り消し線を含め、指定位置とまったく同じ書式を持つ。
%inst
指定した位置のテキストに取り消し線が存在するかを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetDrawingEffect
指定したテキスト位置にあるアプリケーション定義の描画エフェクトを取得する。
%prm
this, currentPosition, drawingEffect, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 描画エフェクトを取得するテキストの位置。
drawingEffect : [int] 型: IUnknown** このメソッドが返るとき、現在のアプリケーション定義の描画エフェクトへのポインタのアドレスが格納される。通常、このエフェクトはグリフ描画で使用される前景ブラシである。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲が格納される。つまり、そのランは描画エフェクトを含め、指定位置とまったく同じ書式を持つ。
%inst
指定したテキスト位置にあるアプリケーション定義の描画エフェクトを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetInlineObject
指定した位置のインラインオブジェクトを取得する。
%prm
this, currentPosition, inlineObject, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 指定したテキスト位置。
inlineObject : [comobj] 型: IDWriteInlineObject** アプリケーション定義のインラインオブジェクトが格納される。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲。つまり、そのランはインラインオブジェクトを含め、指定位置とまったく同じ書式を持つ。
%inst
指定した位置のインラインオブジェクトを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetTypography
指定した位置のテキストのタイポグラフィ設定を取得する。
%prm
this, currentPosition, typography, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 調査するテキストの位置。
typography : [comobj] 型: IDWriteTypography** このメソッドが返るとき、現在のタイポグラフィ設定へのポインタのアドレスが格納される。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲。つまり、そのランはタイポグラフィを含め、指定位置とまったく同じ書式を持つ。
%inst
指定した位置のテキストのタイポグラフィ設定を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetLocaleNameLength
指定した位置のテキストのロケール名の長さを取得する。
%prm
this, currentPosition, nameLength, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 調査するテキストの位置。
nameLength : [int] 型: UINT32* 終端 NULL 文字を含まない、文字数単位での文字配列のサイズ。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲。つまり、そのランはロケール名を含め、指定位置とまったく同じ書式を持つ。
%inst
指定した位置のテキストのロケール名の長さを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetLocaleName
指定した位置のテキストのロケール名を取得する。
%prm
this, currentPosition, localeName, nameSize, textRange
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
currentPosition : [int] 型: UINT32 調査するテキストの位置。
localeName : [wstr] 型: WCHAR* このメソッドが返るとき、現在のロケール名を受け取る文字配列が格納される。
nameSize : [int] 型: UINT32 終端 NULL 文字を含む、文字数単位での文字配列のサイズ。
textRange : [var] 型: DWRITE_TEXT_RANGE* currentPosition で指定された位置のテキストと同じ書式を持つテキスト範囲。つまり、そのランはロケール名を含め、指定位置とまったく同じ書式を持つ。
%inst
指定した位置のテキストのロケール名を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_Draw
指定したクライアント描画コンテキストを使用してテキストを描画する。
%prm
this, clientDrawingContext, renderer, originX, originY
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 型: void* アプリケーション定義の描画コンテキスト。
renderer : [comobj] 型: IDWriteTextRenderer* テキスト文字列の各部分を描画するために使用するコールバック関数セットへのポインタ。
originX : [float] 型: FLOAT レイアウトの左端の x 座標。
originY : [float] 型: FLOAT レイアウトの上端の y 座標。
%inst
指定したクライアント描画コンテキストを使用してテキストを描画する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
このメソッドでテキストを描画するには、アプリケーションが IDWriteFactory::CreateTextLayout を使って
textLayout オブジェクトを作成する必要がある。textLayout オブジェクトを取得した後、アプリケーションは
IDWriteTextLayout::Draw メソッドを呼び出してテキスト、装飾、およびインラインオブジェクトを描画する。実際の描画は
textRenderer 引数として渡されたコールバックインターフェイスを通じて行われ、そこで対応する DrawGlyphRun API
が呼び出される。IDWriteTextLayout に対して SetReadingDirection で
DWRITE_READING_DIRECTION_TOP_TO_BOTTOM (または下から上)
を使って縦書きの読み取り方向を設定した場合、IDWriteTextRenderer1
を実装したインターフェイスを渡さなければならない。そうでなければ元の IDWriteTextRenderer
インターフェイスが横書きテキストのみをサポートしていたため、DWRITE_E_TEXTRENDERERINCOMPATIBLE
エラーが発生する。


%index
IDWriteTextLayout_GetLineMetrics
テキスト文字列の個々のテキスト行に関する情報を取得する。
%prm
this, lineMetrics, maxLineCount, actualLineCount
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
lineMetrics : [var] 型: DWRITE_LINE_METRICS* このメソッドが返るとき、個々のテキスト行のさまざまな計算済み長さ値を含む構造体配列へのポインタが格納される。
maxLineCount : [int] 型: UINT32 lineMetrics 配列の最大サイズ。
actualLineCount : [int] 型: UINT32* このメソッドが返るとき、必要な lineMetrics 配列の実サイズが格納される。
%inst
テキスト文字列の個々のテキスト行に関する情報を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
maxLineCount
が十分な大きさでない場合、HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) と等価な
E_NOT_SUFFICIENT_BUFFER が返され、*actualLineCount に必要な行数が設定される。


%index
IDWriteTextLayout_GetMetrics
書式設定された文字列の全体的なメトリックを取得する。(IDWriteTextLayout.GetMetrics)
%prm
this, textMetrics
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
textMetrics : [var] 型: DWRITE_TEXT_METRICS* このメソッドが返るとき、書式設定後のテキストおよび関連コンテンツの計測距離が格納される。
%inst
書式設定された文字列の全体的なメトリックを取得する。(IDWriteTextLayout.GetMetrics)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_GetOverhangMetrics
レイアウトおよびそこに含まれるテキストグリフやインラインオブジェクトを含むすべてのオブジェクトのはみ出し量 (DIP 単位) を返す。
%prm
this, overhangs
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
overhangs : [var] 型: **[**DWRITE\_OVERHANG\_METRICS**](/windows/win32/api/dwrite/ns-dwrite-dwrite_overhang_metrics)\*** レイアウトの外側にはみ出した可視範囲 (DIP 単位)。
%inst
レイアウトおよびそこに含まれるテキストグリフやインラインオブジェクトを含むすべてのオブジェクトのはみ出し量 (DIP 単位) を返す。

[戻り値]
型: **HRESULT** このメソッドが成功した場合は **S\_OK** を返す。失敗した場合は **HRESULT**
エラーコードを返す。

[備考]
下線や取り消し線は実際にはレンダラによってさまざまなスタイルで描画できるため、ブラックボックスの決定には寄与しない。


%index
IDWriteTextLayout_GetClusterMetrics
各グリフクラスタの論理プロパティと計測値を取得する。
%prm
this, clusterMetrics, maxClusterCount, actualClusterCount
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
clusterMetrics : [var] 型: DWRITE_CLUSTER_METRICS* このメソッドが返るとき、グリフクラスタの改行位置や総送り幅などのメトリックが格納される。
maxClusterCount : [int] 型: UINT32 clusterMetrics 配列の最大サイズ。
actualClusterCount : [int] 型: UINT32* このメソッドが返るとき、必要な clusterMetrics 配列の実サイズが格納される。
%inst
各グリフクラスタの論理プロパティと計測値を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
maxClusterCount
が十分な大きさでない場合、HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER) と等価な
E_NOT_SUFFICIENT_BUFFER が返され、actualClusterCount に必要なクラスタ数が設定される。


%index
IDWriteTextLayout_DetermineMinWidth
単語全体の文字間で緊急改行が発生することなく、レイアウトに設定可能な最小幅を決定する。
%prm
this, minWidth
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
minWidth : [float] 型: **FLOAT\*** 最小幅。
%inst
単語全体の文字間で緊急改行が発生することなく、レイアウトに設定可能な最小幅を決定する。

[戻り値]
型: **HRESULT** このメソッドが成功した場合は **S\_OK** を返す。失敗した場合は **HRESULT**
エラーコードを返す。


%index
IDWriteTextLayout_HitTestPoint
アプリケーションはレイアウトボックスの左上位置を基準とした特定のピクセル位置を渡してこの関数を呼び出し、ヒットテストが発生したテキスト文字列に対応するヒットテストメトリックに関する情報を取得する。
%prm
this, pointX, pointY, isTrailingHit, isInside, hitTestMetrics
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
pointX : [float] 型: FLOAT レイアウトボックスの左上位置を基準にしたヒットテスト対象のピクセル位置 X。
pointY : [float] 型: FLOAT レイアウトボックスの左上位置を基準にしたヒットテスト対象のピクセル位置 Y。
isTrailingHit : [var] 型: BOOL* ヒットテスト位置が文字の先頭側か末尾側かを示す出力フラグ。出力の *isInside が FALSE に設定されている場合、この値は出力された hitTestMetrics->textPosition の値に従って設定され、ヒットテスト位置に最も近い端を表す。
isInside : [var] 型: BOOL* ヒットテスト位置がテキスト文字列内にあるかどうかを示す出力フラグ。FALSE の場合、テキストの端に最も近い位置が返される。
hitTestMetrics : [var] 型: DWRITE_HIT_TEST_METRICS* ヒットテスト位置を完全に囲む出力ジオメトリ。出力の *isInside が FALSE に設定されている場合、この構造体はヒットテスト位置に最も近い端を囲むジオメトリを表す。
%inst

アプリケーションはレイアウトボックスの左上位置を基準とした特定のピクセル位置を渡してこの関数を呼び出し、ヒットテストが発生したテキスト文字列に対応するヒットテストメトリックに関する情報を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_HitTestTextPosition
アプリケーションはテキスト位置と位置の論理側を与えて、この関数を呼び出しレイアウトボックスの左上を基準としたピクセル位置を取得する。
%prm
this, textPosition, isTrailingHit, pointX, pointY, hitTestMetrics
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
textPosition : [int] 型: UINT32 ピクセル位置を取得するために使用するテキスト位置。
isTrailingHit : [int] 型: BOOL ピクセル位置が指定したテキスト位置の先頭側か末尾側かを示すブール値フラグ。
pointX : [float] 型: FLOAT* このメソッドが返るとき、レイアウトボックスの左上位置を基準にした出力ピクセル位置 X が格納される。
pointY : [float] 型: FLOAT* このメソッドが返るとき、レイアウトボックスの左上位置を基準にした出力ピクセル位置 Y が格納される。
hitTestMetrics : [var] 型: DWRITE_HIT_TEST_METRICS* このメソッドが返るとき、指定したテキスト位置を完全に囲む出力ジオメトリが格納される。
%inst
アプリケーションはテキスト位置と位置の論理側を与えて、この関数を呼び出しレイアウトボックスの左上を基準としたピクセル位置を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextLayout_HitTestTextRange
アプリケーションはこの関数を呼び出して、テキスト位置の範囲に対応するヒットテストメトリックのセットを取得する。主な用途の一つはテキスト文字列のハイライト選択の実装である。
%prm
this, textPosition, textLength, originX, originY, hitTestMetrics, maxHitTestMetricsCount, actualHitTestMetricsCount
this : [comobj] IDWriteTextLayout インターフェースの COM オブジェクト変数
textPosition : [int] 型: UINT32 指定範囲の最初のテキスト位置。
textLength : [int] 型: UINT32 指定範囲の位置数。
originX : [float] 型: FLOAT レイアウトボックスの左端にある原点ピクセル位置 X。このオフセットは返されるヒットテストメトリックに加算される。
originY : [float] 型: FLOAT レイアウトボックスの上端にある原点ピクセル位置 Y。このオフセットは返されるヒットテストメトリックに加算される。
hitTestMetrics : [var] 型: DWRITE_HIT_TEST_METRICS* このメソッドが返るとき、指定した位置範囲を完全に囲む出力ジオメトリのバッファへのポインタが格納される。このバッファは少なくとも maxHitTestMetricsCount 以上の大きさが必要である。
maxHitTestMetricsCount : [int] 型: UINT32 hitTestMetrics のバッファメモリに保持できるボックスの最大個数。
actualHitTestMetricsCount : [int] 型: UINT32* hitTestMetrics のバッファメモリに保持されるジオメトリの実際の個数。
%inst

アプリケーションはこの関数を呼び出して、テキスト位置の範囲に対応するヒットテストメトリックのセットを取得する。主な用途の一つはテキスト文字列のハイライト選択の実装である。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTextRenderer_IsPixelSnappingDisabled
IDWriteTextRenderer::IsPixelSnappingDisabled (vtable slot 3)
%prm
this, clientDrawingContext, isDisabled
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 
isDisabled : [var] 
%inst


%index
IDWriteTextRenderer_GetCurrentTransform
IDWriteTextRenderer::GetCurrentTransform (vtable slot 4)
%prm
this, clientDrawingContext, transform
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 
transform : [var] 
%inst


%index
IDWriteTextRenderer_GetPixelsPerDip
IDWriteTextRenderer::GetPixelsPerDip (vtable slot 5)
%prm
this, clientDrawingContext, pixelsPerDip
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 
pixelsPerDip : [float] 
%inst


%index
IDWriteTextRenderer_DrawGlyphRun
IDWriteTextLayout::Draw は、グリフランを描画するようクライアントに指示するためにこの関数を呼び出す。(IDWriteTextRenderer.DrawGlyphRun)
%prm
this, clientDrawingContext, baselineOriginX, baselineOriginY, measuringMode, glyphRun, glyphRunDescription, clientDrawingEffect
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 型: void* IDWriteTextLayout::Draw に渡されたアプリケーション定義の描画コンテキスト。
baselineOriginX : [float] 型: FLOAT グリフランのベースライン原点のピクセル位置 (X 座標)。
baselineOriginY : [float] 型: FLOAT グリフランのベースライン原点のピクセル位置 (Y 座標)。
measuringMode : [int] 型: DWRITE_MEASURING_MODE ラン内のグリフの計測方式。他のプロパティと組み合わせてレンダリングモードを決定するために使用される。
glyphRun : [int] 型: const DWRITE_GLYPH_RUN* 描画するグリフランのインスタンスへのポインタ。
glyphRunDescription : [var] 型: const DWRITE_GLYPH_RUN_DESCRIPTION* このランに関連付けられた文字のプロパティを保持するグリフラン記述インスタンスへのポインタ。
clientDrawingEffect : [int] 型: IUnknown* 描画するグリフに対するアプリケーション定義の描画効果。通常この引数は、テキスト内部を塗りつぶす前景ブラシなどの効果を表す。
%inst
IDWriteTextLayout::Draw
は、グリフランを描画するようクライアントに指示するためにこの関数を呼び出す。(IDWriteTextRenderer.DrawGlyphRun)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
IDWriteTextLayout::Draw
関数は、描画するグリフに関するすべての情報を引数としてこのコールバック関数を呼び出す。アプリケーションはこのコールバックを実装し、呼び出しの大部分を
Direct2D などの下位プラットフォームのグラフィックス API に委譲して描画コンテキスト上にグリフを描画する。GDI
を使用するアプリケーションは、IDWriteBitmapRenderTarget::DrawGlyphRun
メソッドを用いてこのコールバックを実装できる。


%index
IDWriteTextRenderer_DrawUnderline
IDWriteTextLayout::Draw は、下線を描画するようクライアントに指示するためにこの関数を呼び出す。(IDWriteTextRenderer.DrawUnderline)
%prm
this, clientDrawingContext, baselineOriginX, baselineOriginY, underline, clientDrawingEffect
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 型: void* IDWriteTextLayout::Draw に渡されたアプリケーション定義の描画コンテキスト。
baselineOriginX : [float] 型: FLOAT 下線が適用されるランのベースライン原点のピクセル位置 (X 座標)。
baselineOriginY : [float] 型: FLOAT 下線が適用されるランのベースライン原点のピクセル位置 (Y 座標)。
underline : [var] 型: const DWRITE_UNDERLINE* 下線の論理情報を含む構造体へのポインタ。
clientDrawingEffect : [int] 型: IUnknown* 下線に適用するアプリケーション定義の効果。通常この引数は、行の内部を塗りつぶす前景ブラシなどの効果を表す。
%inst
IDWriteTextLayout::Draw
は、下線を描画するようクライアントに指示するためにこの関数を呼び出す。(IDWriteTextRenderer.DrawUnderline)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
書式属性の変化の仕方により、1
本の下線が複数の呼び出しに分割される場合がある。下線内でフォントサイズやスタイルが変化した場合、太さとオフセットは文字に応じて重み付け平均される。適切な描画開始ピクセル位置を得るには、ベースラインに
underline::offset を加算する。そうしないとテキストとの間に隙間が生じない。x
座標はテキストの方向性にかかわらず常に左側として渡される。これは描画を簡略化し、隙間や二重スタンプのアルファブレンドを引き起こす可能性のある丸め誤差を減らす。アルファの重なりを避けるために、端点を最も近いデバイスピクセルに丸めること。


%index
IDWriteTextRenderer_DrawStrikethrough
IDWriteTextLayout::Draw は、取り消し線を描画するようクライアントに指示するためにこの関数を呼び出す。(IDWriteTextRenderer.DrawStrikethrough)
%prm
this, clientDrawingContext, baselineOriginX, baselineOriginY, strikethrough, clientDrawingEffect
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 型: void* IDWriteTextLayout::Draw に渡されたアプリケーション定義の描画コンテキスト。
baselineOriginX : [float] 型: FLOAT 取り消し線が適用されるランのベースライン原点のピクセル位置 (X 座標)。
baselineOriginY : [float] 型: FLOAT 取り消し線が適用されるランのベースライン原点のピクセル位置 (Y 座標)。
strikethrough : [var] 型: const DWRITE_STRIKETHROUGH* 取り消し線の論理情報を含む構造体へのポインタ。
clientDrawingEffect : [int] 型: IUnknown* 取り消し線に適用するアプリケーション定義の効果。通常この引数は、行の内部を塗りつぶす前景ブラシなどの効果を表す。
%inst
IDWriteTextLayout::Draw
は、取り消し線を描画するようクライアントに指示するためにこの関数を呼び出す。(IDWriteTextRenderer.DrawStrikethrough)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
書式属性の変化の仕方により、1
本の取り消し線が複数の呼び出しに分割される場合がある。取り消し線はフォントサイズやスタイルの変化をまたいで平均化されない。適切な描画開始ピクセル位置を得るには、ベースラインに
strikethrough::offset を加算する。下線と同様に、テキストの方向性にかかわらず x 座標は常に左側として渡される。


%index
IDWriteTextRenderer_DrawInlineObject
IDWriteTextLayout::Draw はインラインオブジェクトを描画する必要があるときにこのアプリケーションコールバックを呼び出す。(IDWriteTextRenderer.DrawInlineObject)
%prm
this, clientDrawingContext, originX, originY, inlineObject, isSideways, isRightToLeft, clientDrawingEffect
this : [comobj] IDWriteTextRenderer インターフェースの COM オブジェクト変数
clientDrawingContext : [intptr] 型: void* IDWriteTextLayout::Draw に渡されたアプリケーション定義の描画コンテキスト。
originX : [float] 型: FLOAT インラインオブジェクトの左上隅の X 座標。
originY : [float] 型: FLOAT インラインオブジェクトの左上隅の Y 座標。
inlineObject : [comobj] 型: IDWriteInlineObject* IDWriteTextFormat::SetInlineObject で設定したアプリケーション定義のインラインオブジェクト。
isSideways : [int] 型: BOOL オブジェクトのベースラインが行のベースライン軸に沿って走るかどうかを示すブーリアンフラグ。
isRightToLeft : [int] 型: BOOL オブジェクトが右から左へのコンテキストにあるかどうかを示すブーリアンフラグ。描画時に通常の画像を反転したほうがよいことをヒントする。
clientDrawingEffect : [int] 型: IUnknown* 描画するグリフに対するアプリケーション定義の描画効果。通常この引数は、行の内部を塗りつぶす前景ブラシなどの効果を表す。
%inst
IDWriteTextLayout::Draw
はインラインオブジェクトを描画する必要があるときにこのアプリケーションコールバックを呼び出す。(IDWriteTextRenderer.DrawInlineObject)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IDWriteTypography_AddFontFeature
OpenType フォント機能を追加する。
%prm
this, fontFeature
this : [comobj] IDWriteTypography インターフェースの COM オブジェクト変数
fontFeature : [int] 型: DWRITE_FONT_FEATURE 追加するフォント機能の OpenType 名識別子と実行パラメータを保持する構造体。
%inst
OpenType フォント機能を追加する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IDWriteTypography_GetFontFeatureCount
現在のフォントの OpenType フォント機能の数を取得する。
%prm
this
this : [comobj] IDWriteTypography インターフェースの COM オブジェクト変数
%inst
現在のフォントの OpenType フォント機能の数を取得する。

[戻り値]
型: UINT32 現在のテキストフォーマットのフォント機能の数。

[備考]
テキストの 1 つのランは複数のタイポグラフィ機能と関連付けることができる。IDWriteTypography
オブジェクトはこれらのフォント機能の一覧を保持する。


%index
IDWriteTypography_GetFontFeature
指定したインデックスにあるフォント機能を取得する。
%prm
this, fontFeatureIndex, fontFeature
this : [comobj] IDWriteTypography インターフェースの COM オブジェクト変数
fontFeatureIndex : [int] 型: UINT32 取得するフォント機能の 0 起点のインデックス。
fontFeature : [var] 型: DWRITE_FONT_FEATURE* このメソッドが返るとき、指定したインデックスにあるフォント機能を格納する。
%inst
指定したインデックスにあるフォント機能を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
テキストの 1 つのランは複数のタイポグラフィ機能と関連付けることができる。IDWriteTypography
オブジェクトはこれらのフォント機能の一覧を保持する。


%index
IDXGIAdapter_SetPrivateData
IDXGIAdapter::SetPrivateData (vtable slot 3)
%prm
this, Name, DataSize, pData
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIAdapter_SetPrivateDataInterface
IDXGIAdapter::SetPrivateDataInterface (vtable slot 4)
%prm
this, Name, pUnknown
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGIAdapter_GetPrivateData
IDXGIAdapter::GetPrivateData (vtable slot 5)
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIAdapter_GetParent
IDXGIAdapter::GetParent (vtable slot 6)
%prm
this, riid, ppParent
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGIAdapter_EnumOutputs
アダプタ (ビデオカード) の出力を列挙する。
%prm
this, Output, ppOutput
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
Output : [int] 型: UINT 出力のインデックス。
ppOutput : [comobj] 型: IDXGIOutput** Output パラメータで指定された位置にある IDXGIOutput インターフェースへのポインタのアドレス。
%inst
アダプタ (ビデオカード) の出力を列挙する。

[戻り値]
型: HRESULT 成功または失敗を示すコード (DXGI_ERROR を参照)。インデックスが出力数を超えている場合は
DXGI_ERROR_NOT_FOUND が返される。アダプタが D3D_DRIVER_TYPE_WARP
を使って作成されたデバイスから取得された場合、アダプタは出力を持たないため DXGI_ERROR_NOT_FOUND が返される。

[備考]
注意 セッション 0 のプロセスからこの API を呼び出すと DXGI_ERROR_NOT_CURRENTLY_AVAILABLE
が返される。EnumOutputs メソッドが成功し、ppOutput
パラメータに出力インターフェースへのポインタのアドレスを格納すると、EnumOutputs
はその出力インターフェースの参照カウントをインクリメントする。メモリリークを避けるため、出力インターフェースの使用を終えたら
Release メソッドを呼び出して参照カウントをデクリメントすること。EnumOutputs
はまずデスクトッププライマリが表示されている出力を返す。この出力はインデックス 0 に対応する。次に EnumOutputs
は他の出力を返す。


%index
IDXGIAdapter_GetDesc
アダプタ (またはビデオカード) の DXGI 1.0 用の説明を取得する。
%prm
this
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
%inst
アダプタ (またはビデオカード) の DXGI 1.0 用の説明を取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、pDesc パラメータが NULL の場合は E_INVALIDARG を返す。

[備考]
グラフィックスアプリは、Windows ディスプレイドライバモデル (WDDM)
ドライバを持つシステム上で正確なグラフィックスメモリ値を取得するために DXGI API を利用できる。以下はその主要な手順である。
（以下省略）


%index
IDXGIAdapter_CheckInterfaceSupport
システムがあるグラフィックスコンポーネント用のデバイスインターフェースをサポートしているかを確認する。
%prm
this, InterfaceName, pUMDVersion
this : [comobj] IDXGIAdapter インターフェースの COM オブジェクト変数
InterfaceName : [var] 型: REFGUID サポートを確認するデバイスバージョンのインターフェースの GUID。通常は __uuidof(IDXGIDevice) を指定し、これは Direct3D 9 UMD (ユーザモードドライバ) バイナリのバージョン番号を返す。WDDM 2.3 以降、ドライバパッケージ内のすべてのドライバコンポーネント (D3D9、D3D11、D3D12) は単一のバージョン番号を共有することが要求されているため、これは使用している API に関係なくドライババージョンを取得する良い方法である。
pUMDVersion : [int64] 型: LARGE_INTEGER* InterfaceName のユーザモードドライババージョン。これはインターフェースがサポートされている場合のみ返され、それ以外の場合 NULL となる。
%inst
システムがあるグラフィックスコンポーネント用のデバイスインターフェースをサポートしているかを確認する。

[戻り値]
型: HRESULT S_OK はインターフェースがサポートされていることを示し、それ以外は DXGI_ERROR_UNSUPPORTED
が返される (詳細は DXGI_ERROR を参照)。

[備考]
注意 CheckInterfaceSupport は Direct3D 10.x
インターフェースがサポートされているかを確認する目的でのみ、また Windows Vista SP1
以降のオペレーティングシステム上でのみ使用できる。Direct3D 11.x 以降のバージョンのインターフェースのサポートを
CheckInterfaceSupport で確認しようとすると DXGI_ERROR_UNSUPPORTED が返される。したがって
CheckInterfaceSupport
を使ってはならない。代わりに、特定のインターフェースをオペレーティングシステムがサポートしているかを確認するには、そのインターフェースを実際に作成してみる。たとえば
ID3D11Device::CreateBlendState メソッドの呼び出しが失敗する場合、オペレーティングシステムは
ID3D11BlendState インターフェースをサポートしていない。


%index
IDXGIDevice_SetPrivateData
IDXGIDevice::SetPrivateData (vtable slot 3)
%prm
this, Name, DataSize, pData
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIDevice_SetPrivateDataInterface
IDXGIDevice::SetPrivateDataInterface (vtable slot 4)
%prm
this, Name, pUnknown
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGIDevice_GetPrivateData
IDXGIDevice::GetPrivateData (vtable slot 5)
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIDevice_GetParent
IDXGIDevice::GetParent (vtable slot 6)
%prm
this, riid, ppParent
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGIDevice_GetAdapter
指定デバイスのアダプタを返す。
%prm
this, pAdapter
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
pAdapter : [comobj] 型: IDXGIAdapter** アダプタへの IDXGIAdapter インターフェースポインタのアドレス。このパラメータは NULL であってはならない。
%inst
指定デバイスのアダプタを返す。

[戻り値]
型: HRESULT 成功した場合は S_OK を返す。それ以外の場合は失敗を示す DXGI_ERROR
のいずれかを返す。pAdapter パラメータが NULL の場合は E_INVALIDARG を返す。

[備考]
GetAdapter
メソッドが成功すると、アダプタインターフェースの参照カウントがインクリメントされる。メモリリークを避けるために、使用し終えたら必ずインターフェースを解放すること。


%index
IDXGIDevice_CreateSurface
サーフェスを返す。このメソッドは内部で使用されるものであり、アプリケーションから直接呼び出してはならない。
%prm
this, pDesc, NumSurfaces, Usage, pSharedResource, ppSurface
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
pDesc : [var] 型: const DXGI_SURFACE_DESC* サーフェスを記述する DXGI_SURFACE_DESC 構造体へのポインタ。
NumSurfaces : [int] 型: UINT 生成するサーフェスの数。
Usage : [int] 型: DXGI_USAGE サーフェスの使用目的を指定する DXGI_USAGE フラグ。
pSharedResource : [var] 型: const DXGI_SHARED_RESOURCE* 共有リソースのビューを開くために必要な情報を含む DXGI_SHARED_RESOURCE 構造体へのオプションのポインタ。
ppSurface : [comobj] 型: IDXGISurface** 最初に生成されたサーフェスへの IDXGISurface インターフェースポインタのアドレス。
%inst
サーフェスを返す。このメソッドは内部で使用されるものであり、アプリケーションから直接呼び出してはならない。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外はエラーコードを返す。エラーコードの一覧は DXGI_ERROR を参照。

[備考]
CreateSurface メソッドは、1
つ以上のデバイス間でデータを交換するためのバッファを生成する。内部で使用されるものであり、直接呼び出してはならない。ランタイムはサーフェスを表す
Direct3D リソースオブジェクトを生成する際に自動的に IDXGISurface インターフェースを生成する。たとえば
ID3D11Device::CreateTexture2D や ID3D10Device::CreateTexture2D で 2D
テクスチャを生成するときに、ランタイムは IDXGISurface インターフェースを生成する。2D テクスチャサーフェスを表す
IDXGISurface インターフェースを取得するには、ID3D11Texture2D::QueryInterface または
ID3D10Texture2D::QueryInterface を呼び出す。この呼び出しには IDXGISurface
の識別子を渡す必要がある。2D テクスチャが MIP マップレベルを 1
つしか持たず、かつテクスチャ配列でない場合、QueryInterface は成功して IDXGISurface
インターフェースポインタへのポインタを返す。それ以外の場合、QueryInterface は失敗し、IDXGISurface
へのポインタを返さない。


%index
IDXGIDevice_QueryResourceResidency
リソース配列の常駐状態を取得する。
%prm
this, ppResources, pResidencyStatus, NumResources
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
ppResources : [int] 型: IUnknown* IDXGIResource インターフェースの配列。
pResidencyStatus : [var] 型: DXGI_RESIDENCY* DXGI_RESIDENCY フラグの配列。各要素は ppResources 配列の対応する要素の常駐状態を表す。
NumResources : [int] 型: UINT ppResources 引数配列と pResidencyStatus 引数配列内のリソース数。
%inst
リソース配列の常駐状態を取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返す。それ以外の場合は
DXGI_ERROR_DEVICE_REMOVED、E_INVALIDARG、または E_POINTER を返す (詳細は Common
HRESULT Values および WinError.h を参照)。

[備考]
pResidencyStatus 引数配列が返す情報は、QueryResourceResidency
メソッドが呼ばれた時点での常駐状態を表す。
注: 常駐状態は絶えず変化する。デバイス削除状態で QueryResourceResidency
メソッドを呼ぶと、pResidencyStatus 引数は
DXGI_RESIDENCY_RESIDENT_IN_SHARED_MEMORY フラグを返す。注:
このメソッドは無視できないオーバーヘッドを伴うため、毎フレーム呼び出してはならない。


%index
IDXGIDevice_SetGPUThreadPriority
GPU スレッド優先度を設定する。
%prm
this, Priority
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
Priority : [int] 型: INT 要求する GPU スレッド優先度を指定する値。値は -7 から 7 の範囲 (両端含む) で、0 が通常優先度を表す。
%inst
GPU スレッド優先度を設定する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返す。それ以外の場合、Priority パラメータが不正なら E_INVALIDARG
を返す。

[備考]
Priority パラメータの値は次のように機能する。
（以下省略）


%index
IDXGIDevice_GetGPUThreadPriority
GPU スレッド優先度を取得する。
%prm
this, pPriority
this : [comobj] IDXGIDevice インターフェースの COM オブジェクト変数
pPriority : [int] 型: INT* 現在の GPU スレッド優先度を示す値を受け取る変数へのポインタ。値は -7 から 7 の範囲 (両端含む) で、0 が通常優先度を表す。
%inst
GPU スレッド優先度を取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返す。それ以外の場合、pPriority が NULL なら E_POINTER
を返す。


%index
IDXGIDeviceSubObject_SetPrivateData
IDXGIDeviceSubObject::SetPrivateData (vtable slot 3)
%prm
this, Name, DataSize, pData
this : [comobj] IDXGIDeviceSubObject インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIDeviceSubObject_SetPrivateDataInterface
IDXGIDeviceSubObject::SetPrivateDataInterface (vtable slot 4)
%prm
this, Name, pUnknown
this : [comobj] IDXGIDeviceSubObject インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGIDeviceSubObject_GetPrivateData
IDXGIDeviceSubObject::GetPrivateData (vtable slot 5)
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGIDeviceSubObject インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIDeviceSubObject_GetParent
IDXGIDeviceSubObject::GetParent (vtable slot 6)
%prm
this, riid, ppParent
this : [comobj] IDXGIDeviceSubObject インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGIDeviceSubObject_GetDevice
デバイスを取得する。
%prm
this, riid, ppDevice
this : [comobj] IDXGIDeviceSubObject インターフェースの COM オブジェクト変数
riid : [var] 型: REFIID デバイスの参照 ID。
ppDevice : [int] 型: void** デバイスへのポインタのアドレス。
%inst
デバイスを取得する。

[戻り値]
型: HRESULT 成功または失敗を示すコード (DXGI_ERROR を参照)。

[備考]
返されるインターフェース型は、デバイスが公開している任意のインターフェースであり得る。たとえば pDevice という
IDXGIDevice* であってもよく、その場合 REFIID は __uuidof(pDevice) を呼び出すことで得られる。


%index
IDXGIFactory_SetPrivateData
IDXGIFactory::SetPrivateData (vtable slot 3)
%prm
this, Name, DataSize, pData
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIFactory_SetPrivateDataInterface
IDXGIFactory::SetPrivateDataInterface (vtable slot 4)
%prm
this, Name, pUnknown
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGIFactory_GetPrivateData
IDXGIFactory::GetPrivateData (vtable slot 5)
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIFactory_GetParent
IDXGIFactory::GetParent (vtable slot 6)
%prm
this, riid, ppParent
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGIFactory_EnumAdapters
アダプタ (ビデオカード) を列挙する。
%prm
this, Adapter, ppAdapter
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
Adapter : [int] 型: UINT 列挙するアダプタのインデックス。
ppAdapter : [comobj] 型: IDXGIAdapter** Adapter パラメータで指定した位置にある IDXGIAdapter インターフェースへのポインタのアドレス。このパラメータは NULL であってはならない。
%inst
アダプタ (ビデオカード) を列挙する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返す。インデックスがローカルシステムのアダプタ数以上の場合は
DXGI_ERROR_NOT_FOUND を、ppAdapter パラメータが NULL の場合は
DXGI_ERROR_INVALID_CALL を返す。

[備考]

ファクトリを生成すると、ファクトリはシステム内で利用可能なアダプタ集合を列挙する。したがってシステム内のアダプタを変更した場合は、IDXGIFactory
オブジェクトを破棄して再生成しなければならない。システム内のアダプタ数は、ディスプレイカードの追加・取り外しや、ラップトップのドック・アンドックに伴って変化する。EnumAdapters
メソッドが成功し ppAdapter パラメータにアダプタインターフェースへのポインタのアドレスが格納されると、EnumAdapters
はアダプタインターフェースの参照カウントをインクリメントする。アダプタインターフェースの使用が終わったら、ポインタを破棄する前に
Release メソッドを呼んで参照カウントを減らすこと。EnumAdapters
はまずデスクトッププライマリが表示される出力を持つアダプタを返す。このアダプタはインデックス 0
に対応する。次に他の出力を持つアダプタを返し、最後に出力を持たないアダプタを返す。


%index
IDXGIFactory_MakeWindowAssociation
DXGI がアプリケーションのメッセージキューを監視して Alt+Enter キーシーケンス (アプリケーションをウィンドウ表示とフルスクリーンの間で切り替える) を検出することを許可する。
%prm
this, WindowHandle, Flags
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
WindowHandle : [intptr] 型: HWND 監視対象のウィンドウのハンドル。このパラメータは NULL にできるが、その場合は *Flags* も 0 でなければならない。
Flags : [int] 型: UINT
%inst
DXGI がアプリケーションのメッセージキューを監視して Alt+Enter キーシーケンス
(アプリケーションをウィンドウ表示とフルスクリーンの間で切り替える) を検出することを許可する。

[戻り値]
型: HRESULT WindowHandle が無効な場合は DXGI_ERROR_INVALID_CALL、または
E_OUTOFMEMORY。

[備考]
注: このAPIをセッション 0 プロセスで呼び出すと DXGI_ERROR_NOT_CURRENTLY_AVAILABLE
を返す。WindowHandle と Flags
の組み合わせにより、以前に関連付けられたウィンドウのウィンドウメッセージ監視を停止するよう DXGI
に指示する。アプリケーションがフルスクリーンモードに切り替わる際、DXGI
は現在のバックバッファサイズ以上で最も小さいサポート解像度をフルスクリーン解像度として選択する。アプリケーションはウィンドウ表示からフルスクリーンへの切り替えをより効率的にするためにいくつかの調整ができる。たとえば
WM_SIZE
メッセージ到達時に、未処理のスワップチェーンバックバッファをすべて解放し、IDXGISwapChain::ResizeBuffers
を呼び、そのあとバックバッファを取得し直すべきである。こうすることでスワップチェーンにバックバッファをリサイズしたり、フルスクリーンフリップ動作を可能にするために再生成したりする機会を与える。この手順を実行しない場合、DXGI
はフルスクリーン /
ウィンドウの遷移を行うが、バックバッファのサイズが正しくないためにストレッチ動作を強いられる可能性があり、効率が低下することがある。ストレッチが不要な場合でも、バックバッファがフロントバッファと直接交換可能でない可能性があるため、提示が最適でなくなる場合がある。したがって、WM_SIZE
はフルスクリーン遷移中に常に送信されるので、WM_SIZE における ResizeBuffers
呼び出しは常に推奨される。ウィンドウ表示中にアプリケーションは任意で、描画に適したサイズにウィンドウクライアント領域のサイズを制限できる。完全に柔軟なアプリケーションはそのような制限をかけないが、UI
要素やその他の設計上の事情からその柔軟性は受け入れがたい場合がある。フルスクリーン解像度にマッチするサイズにウィンドウクライアント領域を制限したい場合、WM_SIZING
を捕捉し、IDXGIOutput::FindClosestMatchingMode
と比較するとよい。マッチするモードが見つかればリサイズを許可する (IDXGIOutput は
IDXGISwapChain::GetContainingOutput
で取得できる。デスクトップトポロジに以降の変更がなければ、Alt+Enter
が捕捉されそのスワップチェーンに対してフルスクリーンモードが開始されたときに選ばれるのと同じ出力となる)。モード変更や Alt+Enter
を自分で処理したいアプリケーションは、スワップチェーン生成後に DXGI_MWA_NO_WINDOW_CHANGES フラグで
MakeWindowAssociation を呼ぶべきである。WindowHandle 引数が非 NULL の場合、DXGI
ランタイムが特定の対象 HWND
のすべてのスワップチェーンについてアプリケーションのメッセージキューを処理しないことを指定する。スワップチェーン生成後に
DXGI_MWA_NO_WINDOW_CHANGES フラグを付けて MakeWindowAssociation を呼ぶことで、DXGI
がアプリケーションによるウィンドウモード変更や Alt+Enter
の処理に干渉しないことを保証できる。**MakeWindowAssociation** メソッドは、対象 HWND
スワップチェーンに関連付けられたファクトリオブジェクトに対して呼び出す必要がある。これはスワップチェーンに対して
[IDXGIObject::GetParent](/windows/win32/api/dxgi/nf-dxgi-idxgiobject-getparent)
メソッドを呼び出してファクトリを特定することで保証できる。以下はそのコード例である。
（以下省略）


%index
IDXGIFactory_GetWindowAssociation
ユーザーがフルスクリーンへの切り替えを制御するためのウィンドウを取得する。
%prm
this, pWindowHandle
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
pWindowHandle : [var] 型: HWND* ウィンドウハンドルへのポインタ。
%inst
ユーザーがフルスクリーンへの切り替えを制御するためのウィンドウを取得する。

[戻り値]
型: HRESULT 成功または失敗を示すコードを返す。S_OK は成功を示す。pWindowHandle が NULL で渡された場合は
DXGI_ERROR_INVALID_CALL を示す。

[備考]
注: このAPIをセッション 0 プロセスで呼び出すと DXGI_ERROR_NOT_CURRENTLY_AVAILABLE を返す。


%index
IDXGIFactory_CreateSwapChain
スワップチェーンを生成する。
%prm
this, pDevice, pDesc, ppSwapChain
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
pDevice : [int] 型: IUnknown* Direct3D 11 およびそれ以前の Direct3D の場合はスワップチェーン用の Direct3D デバイスへのポインタ。Direct3D 12 の場合はダイレクトコマンドキュー (ID3D12CommandQueue を参照) へのポインタ。このパラメータは NULL にできない。
pDesc : [var] 型: DXGI_SWAP_CHAIN_DESC* スワップチェーンの記述を含む DXGI_SWAP_CHAIN_DESC 構造体へのポインタ。このパラメータは NULL にできない。
ppSwapChain : [comobj] 型: IDXGISwapChain** CreateSwapChain が生成するスワップチェーンの IDXGISwapChain インターフェースへのポインタを受け取る変数へのポインタ。
%inst
スワップチェーンを生成する。

[戻り値]
型: HRESULT
pDesc または ppSwapChain が NULL の場合は
DXGI_ERROR_INVALID_CALL、フルスクリーンモードを要求したが利用できない場合は
DXGI_STATUS_OCCLUDED、または
E_OUTOFMEMORY。渡されたデバイスの種類に応じた他のエラーコードも返される場合がある。

[備考]
注: このAPIをセッション 0 プロセスで呼び出すと DXGI_ERROR_NOT_CURRENTLY_AVAILABLE
を返す。フルスクリーンモードでのスワップチェーン生成を試みたがフルスクリーンモードが利用できない場合、スワップチェーンはウィンドウモードで生成され
DXGI_STATUS_OCCLUDED が返される。バッファの幅または高さが 0
の場合、サイズはスワップチェーン記述の出力ウィンドウサイズから推測される。スワップチェーン生成時に対象の出力を明示的に選択できないため、フルスクリーンスワップチェーンは生成しないことを推奨する。スワップチェーンのサイズと出力ウィンドウのサイズが一致しないと提示性能が低下しうる。サイズを一致させる方法は
2 通りある。
（以下省略）


%index
IDXGIFactory_CreateSoftwareAdapter
ソフトウェアアダプタを表すアダプタインターフェースを生成する。
%prm
this, Module, ppAdapter
this : [comobj] IDXGIFactory インターフェースの COM オブジェクト変数
Module : [intptr] 型: HMODULE ソフトウェアアダプタ DLL のハンドル。HMODULE は GetModuleHandle または LoadLibrary で取得できる。
ppAdapter : [comobj] 型: IDXGIAdapter** アダプタへのポインタのアドレス (IDXGIAdapter を参照)。
%inst
ソフトウェアアダプタを表すアダプタインターフェースを生成する。

[戻り値]
型: HRESULT 成功または失敗を示すリターンコード。

[備考]
ソフトウェアアダプタはデバイスドライバインターフェースの全体を実装した DLL であり、必要に応じて Windows
のカーネルモードグラフィックスコンポーネントのエミュレーションも実装する。ソフトウェアアダプタ実装の詳細は Windows Vista
Driver Development Kit
を参照。これは極めて複雑な開発作業であり、一般の読者には推奨しない。このメソッドを呼び出すとモジュールの参照カウントは 1
増加する。参照カウントは FreeLibrary を呼ぶことで減らすことができる。典型的な呼び出し手順は、LoadLibrary
を呼び、そのハンドルを CreateSoftwareAdapter に渡し、直後に DLL に対して FreeLibrary
を呼び、DLL の HMODULE のことは忘れる、というものである。ソフトウェアアダプタは破棄される際に FreeLibrary
を呼び出すため、DLL の寿命はアダプタが所有することになり、アプリケーションはその後の寿命管理から解放される。


%index
IDXGIObject_SetPrivateData
アプリケーション定義データをオブジェクトに設定し、そのデータを GUID に関連付ける。
%prm
this, Name, DataSize, pData
this : [comobj] IDXGIObject インターフェースの COM オブジェクト変数
Name : [var] 型: REFGUID データを識別する GUID。この GUID を GetPrivateData の呼び出しで使用してデータを取得する。
DataSize : [int] 型: UINT オブジェクトデータのサイズ。
pData : [intptr] 型: const void* オブジェクトデータへのポインタ。
%inst
アプリケーション定義データをオブジェクトに設定し、そのデータを GUID に関連付ける。

[戻り値]
型: HRESULT DXGI_ERROR の値のいずれかを返す。

[備考]
SetPrivateData は指定されたデータのコピーを作成し、オブジェクトとともに格納する。SetPrivateData
がオブジェクトに格納するプライベートデータは、関連付けられた Direct3D オブジェクトが格納するプライベートデータ (例えば
Microsoft Direct3D 11 デバイスが ID3D11Device::SetPrivateData で、または
Direct3D 11 子デバイスが ID3D11DeviceChild::SetPrivateData で格納するもの)
と同じ記憶領域を占有する。デバッグレイヤーはオブジェクトインターフェースポインタ一覧をフレンドリ名付きで出力してメモリリークを報告する。既定のフレンドリ名は
"<unnamed>"
である。どのオブジェクトインターフェースポインタがリークの原因になったかを特定できるようにフレンドリ名を設定できる。フレンドリ名を設定するには、SetPrivateData
メソッドと D3Dcommon.h にある既知のプライベートデータ GUID (WKPDID_D3DDebugObjectName)
を使用する。たとえば pContext にフレンドリ名 My name を付与するには次のコードを使用する。
（以下省略）


%index
IDXGIObject_SetPrivateDataInterface
オブジェクトのプライベートデータにインターフェースを設定する。
%prm
this, Name, pUnknown
this : [comobj] IDXGIObject インターフェースの COM オブジェクト変数
Name : [var] 型: REFGUID インターフェースを識別する GUID。
pUnknown : [int] 型: const IUnknown* 設定するインターフェース。
%inst
オブジェクトのプライベートデータにインターフェースを設定する。

[戻り値]
型: HRESULT 次の DXGI_ERROR のいずれかを返す。

[備考]

このAPIはインターフェースポインタをオブジェクトに関連付ける。インターフェースが設定されるとその参照カウントがインクリメントされる。データが
(同じ GUID で SPD または SPDI を再度呼び出して) 上書きされるか、オブジェクトが破棄されたときに、::Release()
が呼ばれインターフェースの参照カウントがデクリメントされる。


%index
IDXGIObject_GetPrivateData
オブジェクトのデータへのポインタを取得する。
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGIObject インターフェースの COM オブジェクト変数
Name : [var] 型: REFGUID データを識別する GUID。
pDataSize : [int] 型: UINT* データのサイズ。
pData : [intptr] 型: void* データへのポインタ。
%inst
オブジェクトのデータへのポインタを取得する。

[戻り値]
型: HRESULT 次の DXGI_ERROR のいずれかを返す。

[備考]
返されたデータが IUnknown またはその派生クラスへのポインタであり、以前に
IDXGIObject::SetPrivateDataInterface で設定されたものである場合、ポインタを解放する前に
::Release() を呼び出して参照カウントを減らさなければならない。GetPrivateData の Name パラメータに
GUID_DeviceType を渡すことで、ディスプレイアダプタオブジェクト
(IDXGIAdapter、IDXGIAdapter1、IDXGIAdapter2)
からデバイス種別を取得できる。ディスプレイアダプタが生成されたデバイスの種別を取得するには、
（以下省略）


%index
IDXGIObject_GetParent
オブジェクトの親を取得する。
%prm
this, riid, ppParent
this : [comobj] IDXGIObject インターフェースの COM オブジェクト変数
riid : [var] 型: REFIID 要求するインターフェースの ID。
ppParent : [int] 型: void** 親オブジェクトへのポインタのアドレス。
%inst
オブジェクトの親を取得する。

[戻り値]
型: HRESULT DXGI_ERROR の値のいずれかを返す。


%index
IDXGIOutput_SetPrivateData
IDXGIOutput::SetPrivateData (vtable slot 3)
%prm
this, Name, DataSize, pData
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIOutput_SetPrivateDataInterface
IDXGIOutput::SetPrivateDataInterface (vtable slot 4)
%prm
this, Name, pUnknown
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGIOutput_GetPrivateData
IDXGIOutput::GetPrivateData (vtable slot 5)
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGIOutput_GetParent
IDXGIOutput::GetParent (vtable slot 6)
%prm
this, riid, ppParent
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGIOutput_GetDesc
出力の説明を取得する。
%prm
this
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
%inst
出力の説明を取得する。

[戻り値]
型: HRESULT 成功または失敗を示すコードを返す。成功した場合は S_OK、pDesc に NULL が渡された場合は
DXGI_ERROR_INVALID_CALL。

[備考]
高 DPI デスクトップでは、アプリが高 DPI 対応としてマークされていない限り、GetDesc は仮想化された画面サイズを返す。DPI
対応 Win32 アプリの作成については、High DPI を参照。


%index
IDXGIOutput_GetDisplayModeList
要求されたフォーマットとその他の入力オプションに一致するディスプレイモードを取得する。(IDXGIOutput.GetDisplayModeList)
%prm
this, EnumFormat, Flags, pNumModes, pDesc
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
EnumFormat : [int] 型: DXGI_FORMAT カラーフォーマット (DXGI_FORMAT を参照)。
Flags : [int] 型: UINT 含めるモードのオプション (DXGI_ENUM_MODES を参照)。スケーリングが必要なディスプレイモードを公開するには DXGI_ENUM_MODES_SCALING を指定する必要がある。スケーリングが不要でディスプレイ出力に直接対応するセンタリングモードはデフォルトで列挙される。
pNumModes : [int] 型: UINT* pDesc を NULL に設定すると、pNumModes はフォーマットとオプションに一致するディスプレイモードの数を返す。それ以外の場合、pNumModes は pDesc に返されたディスプレイモードの数を返す。
pDesc : [var] 型: DXGI_MODE_DESC* ディスプレイモードのリストへのポインタ (DXGI_MODE_DESC を参照)。ディスプレイモードの数を取得するには NULL に設定する。
%inst

要求されたフォーマットとその他の入力オプションに一致するディスプレイモードを取得する。(IDXGIOutput.GetDisplayModeList)

[戻り値]
型: HRESULT 次の DXGI_ERROR
のいずれかを返す。このメソッドの呼び出し直後に利用可能なディスプレイモードが変更される場合があり、その場合は
DXGI_ERROR_MORE_DATA が返される
(すべてのディスプレイモードを格納する十分な領域がない場合)。GetDisplayModeList がリモートデスクトップサービス
(旧称ターミナルサービス) セッションから呼び出された場合、DXGI_ERROR_NOT_CURRENTLY_AVAILABLE
が返される。

[備考]

一般的に、ウィンドウモードからフルスクリーンモードに切り替えるとき、スワップチェーンはスワップチェーンの解像度、色深度、リフレッシュレートを満たす
(またはそれを上回る) ディスプレイモードを自動的に選択する。ディスプレイモードをより細かく制御するには、この API
を使用してモニタの能力に対して検証されたディスプレイモードのセット、またはデスクトップに一致するすべてのモードを取得する
(デスクトップ設定がモニタに対して検証されない場合)。示されているとおり、この API は 2
回呼び出されるように設計されている。最初に利用可能なモードの数を取得し、2 回目にモードの説明を返す。
（以下省略）


%index
IDXGIOutput_FindClosestMatchingMode
要求されたディスプレイモードに最も近いディスプレイモードを検索する。(IDXGIOutput.FindClosestMatchingMode)
%prm
this, pModeToMatch, pClosestMatch, pConcernedDevice
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pModeToMatch : [var] 型: const DXGI_MODE_DESC* 望ましいディスプレイモード (DXGI_MODE_DESC を参照)。DXGI_MODE_DESC のメンバは未指定にでき、そのメンバに対する優先順位がないことを示す。Width または Height の値が 0 はその値が未指定であることを示す。Width または Height のいずれかが 0 の場合、両方とも 0 でなければならない。RefreshRate の分子と分母が 0 は未指定であることを示す。DXGI_MODE_DESC の他のメンバは、メンバが未指定であることを示す列挙値を持つ。pConcernedDevice が NULL の場合、Format を DXGI_FORMAT_UNKNOWN にすることはできない。
pClosestMatch : [var] 型: DXGI_MODE_DESC* pModeToMatch に最も近いモード。
pConcernedDevice : [int] 型: IUnknown* Direct3D デバイスインターフェースへのポインタ。このパラメータが NULL の場合、フォーマットが pModeToMatch と一致するモードのみが返される。それ以外の場合は、デバイスがスキャンアウト用にサポートしているフォーマットのみが返される。各機能レベルでデバイスがスキャンアウト用にサポートしているフォーマットの詳細:
%inst

要求されたディスプレイモードに最も近いディスプレイモードを検索する。(IDXGIOutput.FindClosestMatchingMode)

[戻り値]
型: HRESULT 次の DXGI_ERROR のいずれかを返す。

[備考]
FindClosestMatchingMode は IDXGIOutput1::FindClosestMatchingMode1
と同様に動作するが、FindClosestMatchingMode
はモノラルディスプレイモードのみを考慮する点が異なる。IDXGIOutput1::FindClosestMatchingMode1
は、pModeToMatch が指す DXGI_MODE_DESC1 構造体の Stereo
メンバを設定した場合のみステレオモードを考慮し、Stereo が設定されていない場合はモノラルモードのみを考慮する。
IDXGIOutput1::FindClosestMatchingMode1
はステレオモードのみまたはモノラルモードのみを含む一致したディスプレイモードセットを返す。FindClosestMatchingMode
は入力モードをモノラルとして指定したかのように動作する。


%index
IDXGIOutput_WaitForVBlank
次の垂直ブランクが発生するまでスレッドを停止する。
%prm
this
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
%inst
次の垂直ブランクが発生するまでスレッドを停止する。

[戻り値]
型: HRESULT 次の DXGI_ERROR のいずれかを返す。

[備考]
垂直ブランクは、次のフレームの描画を開始するためにラスターが右下隅から左上隅に移動するときに発生する。


%index
IDXGIOutput_TakeOwnership
出力の所有権を取得する。
%prm
this, pDevice, Exclusive
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pDevice : [int] 型: IUnknown* デバイス (ID3D10Device など) の IUnknown インターフェースへのポインタ。
Exclusive : [int] 型: BOOL 他のスレッドやアプリケーションがデバイスの所有権を取得できるようにするには TRUE、そうでない場合は FALSE に設定する。
%inst
出力の所有権を取得する。

[戻り値]
型: HRESULT DXGI_ERROR 値のいずれかを返す。

[備考]
出力を使い終わったら IDXGIOutput::ReleaseOwnership を呼び出す。TakeOwnership
はアプリケーションから直接呼び出すべきではない。結果が予測できないからである。これはフルスクリーン遷移時に DXGI
スワップチェーンオブジェクトによって暗黙的に呼び出されるものであり、スワップチェーンメソッドの代わりに使用すべきではない。Windows
ストアアプリの注意点 Windows ストアアプリが TakeOwnership
を使用すると、DXGI_ERROR_NOT_CURRENTLY_AVAILABLE で失敗する。


%index
IDXGIOutput_ReleaseOwnership
出力の所有権を解放する。
%prm
this
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
%inst
出力の所有権を解放する。

[備考]
スワップチェーンを使用していない場合は、IDXGIOutput::TakeOwnership を呼び出して出力にアクセスし、終了したら
IDXGIOutput::ReleaseOwnership
を呼び出して解放する。スワップチェーンを使用するアプリケーションは、通常これらのメソッドを呼び出さない。


%index
IDXGIOutput_GetGammaControlCapabilities
ガンマコントロール能力の説明を取得する。
%prm
this, pGammaCaps
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pGammaCaps : [var] 型: DXGI_GAMMA_CONTROL_CAPABILITIES* ガンマコントロール能力の説明へのポインタ (DXGI_GAMMA_CONTROL_CAPABILITIES を参照)。
%inst
ガンマコントロール能力の説明を取得する。

[戻り値]
型: HRESULT DXGI_ERROR 値のいずれかを返す。

[備考]
注 このメソッドの呼び出しはフルスクリーンモード時のみサポートされる。
ガンマ補正の使用方法については、Using gamma correction を参照。


%index
IDXGIOutput_SetGammaControl
ガンマコントロールを設定する。
%prm
this, pArray
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pArray : [var] 型: const DXGI_GAMMA_CONTROL* 設定するガンマカーブを記述する DXGI_GAMMA_CONTROL 構造体へのポインタ。
%inst
ガンマコントロールを設定する。

[戻り値]
型: HRESULT DXGI_ERROR 値のいずれかを返す。

[備考]
注 このメソッドの呼び出しはフルスクリーンモード時のみサポートされる。
ガンマ補正の使用方法については、Using gamma correction を参照。


%index
IDXGIOutput_GetGammaControl
ガンマコントロール設定を取得する。
%prm
this, pArray
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pArray : [var] 型: DXGI_GAMMA_CONTROL* ガンマコントロール設定の配列 (DXGI_GAMMA_CONTROL を参照)。
%inst
ガンマコントロール設定を取得する。

[戻り値]
型: HRESULT DXGI_ERROR 値のいずれかを返す。

[備考]
注 このメソッドの呼び出しはフルスクリーンモード時のみサポートされる。
ガンマ補正の使用方法については、Using gamma correction を参照。


%index
IDXGIOutput_SetDisplaySurface
ディスプレイモードを変更する。
%prm
this, pScanoutSurface
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pScanoutSurface : [comobj] 型: IDXGISurface* 画面に画像をレンダリングするために使用するサーフェスへのポインタ (IDXGISurface を参照)。サーフェスはバックバッファ (DXGI_USAGE_BACKBUFFER) として作成されている必要がある。
%inst
ディスプレイモードを変更する。

[戻り値]
型: HRESULT DXGI_ERROR 値のいずれかを返す。

[備考]
IDXGIOutput::SetDisplaySurface
はアプリケーションから直接呼び出すべきではない。結果が予測できないからである。これはフルスクリーン遷移時に DXGI
スワップチェーンオブジェクトによって暗黙的に呼び出されるものであり、スワップチェーンメソッドの代わりに使用すべきではない。このメソッドは
IDXGIOutput::TakeOwnership と IDXGIOutput::ReleaseOwnership
の呼び出しの間でのみ呼び出されるべきである。Windows ストアアプリの注意点 Windows ストアアプリが
SetDisplaySurface を使用すると、DXGI_ERROR_NOT_CURRENTLY_AVAILABLE で失敗する。


%index
IDXGIOutput_GetDisplaySurfaceData
現在のディスプレイサーフェスのコピーを取得する。
%prm
this, pDestination
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pDestination : [comobj] 型: IDXGISurface* 対象のサーフェス (IDXGISurface を参照) へのポインタ。
%inst
現在のディスプレイサーフェスのコピーを取得する。

[戻り値]
型: HRESULT DXGI_ERROR 値のいずれかを返す。

[備考]
IDXGIOutput::GetDisplaySurfaceData
は、出力がフルスクリーンモードのときにのみ呼び出すことができる。メソッドが成功した場合、DXGI
は対象のサーフェスを埋める。対象サーフェス用の領域を確保するために出力のサイズ (幅と高さ) を取得するには
IDXGIOutput::GetDesc を使用する。これはターゲットモニタの回転に関係なく真である。グラフィックスコンポーネント
(Direct3D 10 など) によって作成された対象サーフェスは、CPU 書き込み権限 (D3D10_CPU_ACCESS_WRITE
を参照) を持って作成する必要がある。その他のサーフェスは、CPU 読み書き権限 (D3D10_CPU_ACCESS_READ_WRITE
を参照) を持って作成する必要がある。このメソッドは、対象サーフェスに合うようにサーフェスデータを変更する
(拡大、縮小、フォーマット変換、回転)。拡大と縮小はポイントサンプリングで実行される。


%index
IDXGIOutput_GetFrameStatistics
最近レンダリングされたフレームに関する統計情報を取得する。
%prm
this, pStats
this : [comobj] IDXGIOutput インターフェースの COM オブジェクト変数
pStats : [var] 型: DXGI_FRAME_STATISTICS* フレーム統計情報へのポインタ (DXGI_FRAME_STATISTICS を参照)。
%inst
最近レンダリングされたフレームに関する統計情報を取得する。

[戻り値]
型: HRESULT この関数が成功した場合は S_OK を返す。それ以外の場合は DXGI_ERROR_INVALID_CALL
を返す可能性がある。

[備考]
この API は IDXGISwapChain::GetFrameStatistics と類似している。
注 このメソッドの呼び出しはフルスクリーンモード時のみサポートされる。


%index
IDXGISurface_SetPrivateData
IDXGISurface::SetPrivateData (vtable slot 3)
%prm
this, Name, DataSize, pData
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGISurface_SetPrivateDataInterface
IDXGISurface::SetPrivateDataInterface (vtable slot 4)
%prm
this, Name, pUnknown
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGISurface_GetPrivateData
IDXGISurface::GetPrivateData (vtable slot 5)
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGISurface_GetParent
IDXGISurface::GetParent (vtable slot 6)
%prm
this, riid, ppParent
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGISurface_GetDevice
IDXGISurface::GetDevice (vtable slot 7)
%prm
this, riid, ppDevice
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
riid : [var] 
ppDevice : [int] 
%inst


%index
IDXGISurface_GetDesc
サーフェスの説明を取得する。
%prm
this
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
%inst
サーフェスの説明を取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外の場合は DXGI_ERROR
トピックで説明されているエラーコードのいずれかを返す。


%index
IDXGISurface_Map
サーフェスに含まれるデータへのポインタを取得し、サーフェスへの GPU アクセスを拒否する。
%prm
this, pLockedRect, MapFlags
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
pLockedRect : [var] 型: DXGI_MAPPED_RECT* サーフェスデータへのポインタ (DXGI_MAPPED_RECT を参照)。
MapFlags : [int] 型: UINT CPU の読み書きフラグ。これらのフラグは論理 OR で組み合わせることができる。
%inst
サーフェスに含まれるデータへのポインタを取得し、サーフェスへの GPU アクセスを拒否する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外の場合は DXGI_ERROR
トピックで説明されているエラーコードのいずれかを返す。

[備考]
CPU からサーフェスにアクセスするには IDXGISurface::Map を使用する。マップしたサーフェスを解放し (GPU
からのアクセスを許可し) たい場合は IDXGISurface::Unmap を呼び出す。


%index
IDXGISurface_Unmap
IDXGISurface::Map で取得したサーフェスへのポインタを無効化し、リソースへの GPU アクセスを再び有効にする。
%prm
this
this : [comobj] IDXGISurface インターフェースの COM オブジェクト変数
%inst
IDXGISurface::Map で取得したサーフェスへのポインタを無効化し、リソースへの GPU アクセスを再び有効にする。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外の場合は DXGI_ERROR
トピックで説明されているエラーコードのいずれかを返す。


%index
IDXGISwapChain_SetPrivateData
IDXGISwapChain::SetPrivateData (vtable slot 3)
%prm
this, Name, DataSize, pData
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
Name : [var] 
DataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGISwapChain_SetPrivateDataInterface
IDXGISwapChain::SetPrivateDataInterface (vtable slot 4)
%prm
this, Name, pUnknown
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
Name : [var] 
pUnknown : [int] 
%inst


%index
IDXGISwapChain_GetPrivateData
IDXGISwapChain::GetPrivateData (vtable slot 5)
%prm
this, Name, pDataSize, pData
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
Name : [var] 
pDataSize : [int] 
pData : [intptr] 
%inst


%index
IDXGISwapChain_GetParent
IDXGISwapChain::GetParent (vtable slot 6)
%prm
this, riid, ppParent
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
riid : [var] 
ppParent : [int] 
%inst


%index
IDXGISwapChain_GetDevice
IDXGISwapChain::GetDevice (vtable slot 7)
%prm
this, riid, ppDevice
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
riid : [var] 
ppDevice : [int] 
%inst


%index
IDXGISwapChain_Present
レンダリングされた画像をユーザーに表示する。
%prm
this, SyncInterval, Flags
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
SyncInterval : [int] 型: UINT フレームのプレゼンテーションを垂直ブランクとどのように同期するかを指定する整数。
Flags : [int] 型: UINT スワップチェーンのプレゼンテーションオプションを含む整数値。これらのオプションは DXGI_PRESENT 定数で定義されている。
%inst
レンダリングされた画像をユーザーに表示する。

[戻り値]
型: HRESULT 戻り値には次が含まれる: S_OK、DXGI_ERROR_DEVICE_RESET または
DXGI_ERROR_DEVICE_REMOVED (DXGI_ERROR を参照)、DXGI_STATUS_OCCLUDED
(DXGI_STATUS を参照)、または D3DDDIERR_DEVICEREMOVED。注
ビデオカードがコンピュータから物理的に取り外されたか、ビデオカードのドライバアップグレードが発生した場合、Present メソッドは
DXGI_ERROR_DEVICE_REMOVED または D3DDDIERR_DEVICEREMOVED のいずれかを返す可能性がある。

[備考]
Direct3D 11.1 以降では、IDXGISwapChain1::Present1
の使用を検討すること。これにより、スワップチェーンプレゼンテーションでダーティ矩形とスクロール矩形を使用でき、メモリ帯域幅、ひいてはシステム電力の使用を削減できる。スワップチェーンプレゼンテーションでのダーティ矩形とスクロール矩形の使用については、Using
dirty rectangles and the scroll rectangle in swap chain presentation
を参照。フルスクリーンアプリケーションでスワップチェーンバッファを反転する際の最適なパフォーマンスについては、Full-Screen
Application Performance Hints を参照。Present
の呼び出しはレンダースレッドをメッセージポンプスレッドで待機させる可能性があるため、複数のスレッドを使用するアプリケーションでこのメソッドを呼び出す際は注意すること。詳細は
Multithreading Considerations を参照。
（以下省略）


%index
IDXGISwapChain_GetBuffer
スワップチェーンのバックバッファの 1 つにアクセスする。
%prm
this, Buffer, riid, ppSurface
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
Buffer : [int] 型: UINT 0 ベースのバッファインデックス。スワップチェーンのスワップエフェクトが DXGI_SWAP_EFFECT_DISCARD の場合、このメソッドは最初のバッファにのみアクセスできる。この状況ではインデックスを 0 に設定する。スワップチェーンのスワップエフェクトが DXGI_SWAP_EFFECT_SEQUENTIAL または DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL の場合、スワップチェーンのインデックス 0 のバッファのみが読み書き可能である。インデックスが 0 より大きいスワップチェーンのバッファは読み取りのみ可能であるため、そのようなバッファに対して IDXGIResource::GetUsage メソッドを呼び出すと、DXGI_USAGE_READ_ONLY フラグが設定されている。
riid : [var] 型: REFIID バッファを操作するために使用するインターフェースの型。
ppSurface : [int] 型: void** バックバッファインターフェースへのポインタ。
%inst
スワップチェーンのバックバッファの 1 つにアクセスする。

[戻り値]
型: HRESULT 次の DXGI_ERROR のいずれかを返す。


%index
IDXGISwapChain_SetFullscreenState
ディスプレイ状態をウィンドウまたはフルスクリーンに設定する。
%prm
this, Fullscreen, pTarget
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
Fullscreen : [int] 型: BOOL ディスプレイ状態をウィンドウまたはフルスクリーンに設定するかどうかを指定するブール値。フルスクリーンの場合は TRUE、ウィンドウの場合は FALSE。
pTarget : [comobj] 型: [in, optional] IDXGIOutput* Fullscreen パラメータに TRUE を渡してディスプレイ状態をフルスクリーンに設定する場合、スワップチェーンを含む出力ターゲットの IDXGIOutput インターフェースへのポインタをこのパラメータにオプションで設定できる。このパラメータを NULL に設定した場合、DXGI はスワップチェーンのデバイスと出力ウィンドウの配置に基づいて出力を選択する。Fullscreen に FALSE を渡す場合は、このパラメータを NULL に設定する必要がある。
%inst
ディスプレイ状態をウィンドウまたはフルスクリーンに設定する。

[戻り値]
型: HRESULT このメソッドは次のいずれかの値を返す。- **S_OK**
アクションが成功し、スワップチェーンが要求された状態に置かれた場合。-
**DXGI_ERROR_NOT_CURRENTLY_AVAILABLE**
アクションが失敗した場合。このエラーが返された場合、アプリケーションはウィンドウモードで実行を続け、後でフルスクリーンモードへの切り替えを試みることができる。ウィンドウモードのスワップチェーンがフルスクリーンモードに切り替えられない理由は多数ある。例:
- アプリケーションがターミナルサーバ上で実行されている。- 出力ウィンドウが遮蔽されている。-
出力ウィンドウがキーボードフォーカスを持っていない。- 別のアプリケーションがすでにフルスクリーンモードにある。-
**DXGI_STATUS_MODE_CHANGE_IN_PROGRESS** この API
が呼び出されたときにフルスクリーン/ウィンドウモードの遷移が発生している場合に返される。-
メモリ不足やその他の予期しないエラーが発生した場合の他のエラーコード。これらのコードはハードで継続不可能なエラーとして扱われる場合がある。

[備考]
DXGI
はエンドユーザーまたはシステムの要求に応じてスワップチェーンのディスプレイ状態を変更する場合がある。ウィンドウのスワップチェーンを作成し、SetFullscreenState
を介してエンドユーザーがスワップチェーンをフルスクリーンに変更できるようにすることを推奨する。つまり、スワップチェーンを強制的にフルスクリーンにするために
DXGI_SWAP_CHAIN_DESC の Windowed メンバを FALSE
に設定しないこと。ただし、スワップチェーンをフルスクリーンとして作成する場合、サポートされていないディスプレイモードで作成されたスワップチェーンはディスプレイが真っ暗になりエンドユーザーが何も見られなくなる可能性があるため、サポートされているディスプレイモードのリストもエンドユーザーに提供すること。また、エンドユーザーがディスプレイモードを変更できるようにする場合、タイムアウト確認画面やその他のフォールバックメカニズムを用意することを推奨する。Windows
ストアアプリの注意点 Windows ストアアプリが SetFullscreenState
を呼び出してディスプレイ状態をフルスクリーンに設定すると、SetFullscreenState は
DXGI_ERROR_NOT_CURRENTLY_AVAILABLE
で失敗する。IDXGIFactory2::CreateSwapChainForComposition で作成したスワップチェーンに対しては
SetFullscreenState
を呼び出せない。フリッププレゼンテーションモデルでは、ディスプレイ状態をフルスクリーンに遷移した後、IDXGISwapChain1::Present1
の呼び出しが成功するように ResizeBuffers を呼び出す必要がある。


%index
IDXGISwapChain_GetFullscreenState
フルスクリーンモードに関連する状態を取得する。
%prm
this, pFullscreen, ppTarget
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
pFullscreen : [var] 型: BOOL* 次のいずれかの値を持つブール値へのポインタ:
ppTarget : [comobj] 型: IDXGIOutput** モードがフルスクリーンの場合は出力ターゲット (IDXGIOutput を参照) へのポインタ。それ以外の場合は NULL。
%inst
フルスクリーンモードに関連する状態を取得する。

[戻り値]
型: HRESULT 次の DXGI_ERROR のいずれかを返す。

[備考]
スワップチェーンがフルスクリーンモードの場合、ターゲット出力へのポインタが返され、その参照カウントがインクリメントされる。


%index
IDXGISwapChain_GetDesc
スワップチェーンの説明を取得する。
%prm
this
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
%inst
スワップチェーンの説明を取得する。

[戻り値]
型: HRESULT 次の DXGI_ERROR のいずれかを返す。


%index
IDXGISwapChain_ResizeBuffers
スワップチェーンのバックバッファサイズ、フォーマット、バッファ数を変更する。これはアプリケーションウィンドウがリサイズされたときに呼び出すべきである。
%prm
this, BufferCount, Width, Height, NewFormat, SwapChainFlags
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
BufferCount : [int] 型: UINT スワップチェーン内のバッファ数 (すべてのバックバッファとフロントバッファを含む)。この数は、スワップチェーンを作成したときのバッファ数とは異なる場合がある。この数は DXGI_MAX_SWAP_CHAIN_BUFFERS を超えることはできない。スワップチェーン内の既存のバッファ数を維持するには、この数を 0 に設定する。フリッププレゼンテーションモデルでは 2 つ未満のバッファを指定することはできない。
Width : [int] 型: UINT バックバッファの新しい幅。0 を指定すると、DXGI はターゲットウィンドウのクライアント領域の幅を使用する。コンポジションサーフェス用のスワップチェーンを作成するために IDXGIFactory2::CreateSwapChainForComposition メソッドを呼び出した場合、幅を 0 として指定することはできない。
Height : [int] 型: UINT バックバッファの新しい高さ。0 を指定すると、DXGI はターゲットウィンドウのクライアント領域の高さを使用する。コンポジションサーフェス用のスワップチェーンを作成するために IDXGIFactory2::CreateSwapChainForComposition メソッドを呼び出した場合、高さを 0 として指定することはできない。
NewFormat : [int] 型: DXGI_FORMAT バックバッファの新しいフォーマット用の DXGI_FORMAT 型の値。バックバッファの既存のフォーマットを維持するには、この値を DXGI_FORMAT_UNKNOWN に設定する。フリッププレゼンテーションモデルは、ビットブロック転送 (bitblt) モデルよりも制限されたフォーマットセットをサポートする。
SwapChainFlags : [int] 型: UINT ビット単位の OR 演算で組み合わされる DXGI_SWAP_CHAIN_FLAG 型の値の組み合わせ。結果の値はスワップチェーンの動作のオプションを指定する。
%inst

スワップチェーンのバックバッファサイズ、フォーマット、バッファ数を変更する。これはアプリケーションウィンドウがリサイズされたときに呼び出すべきである。

[戻り値]
型: HRESULT 成功した場合は S_OK を、それ以外の場合はエラーコードを返す。エラーコードのリストについては
DXGI_ERROR を参照。

[備考]
バックバッファに対する未解決のすべての参照を解放しない限り、スワップチェーンのサイズを変更することはできない。ResizeBuffers
が成功するためには、バックバッファに対するすべての直接および間接的な参照を解放する必要がある。
直接参照は、リソースに対して AddRef を呼び出した後にアプリケーションが保持する。

間接参照は、リソースのビュー、リソースのビューをデバイスコンテキストにバインドすること、リソースを使用したコマンドリスト、そのリソースのビューを使用したコマンドリスト、リソースを使用した別のコマンドリストを実行したコマンドリストなどが保持する。
ResizeBuffers
を呼び出す前に、アプリケーションがリソース、リソースに対するビュー、リソースまたはビューを使用するコマンドリストに対するすべての参照を解放し
(適切な回数の Release
を呼び出して)、リソースもビューもデバイスコンテキストにバインドされていないことを確認すること。すべての参照が解放されたことを確認するために
ID3D11DeviceContext::ClearState
を使用できる。ビューが遅延コンテキストにバインドされている場合、部分的に構築されたコマンドリストも破棄する必要がある
(ID3D11DeviceContext::ClearState、続いて
ID3D11DeviceContext::FinishCommandList、その後コマンドリストに対して Release
を呼び出すことで)。ResizeBuffers を呼び出した後は、IDXGISwapChain::GetBuffer
経由でインターフェースを再照会できる。
DXGI_SWAP_CHAIN_FLAG_GDI_COMPATIBLE で作成したスワップチェーンの場合、ResizeBuffers
を呼び出す前に、スワップチェーンのバックバッファサーフェスに対して IDXGISurface1::ReleaseDC
も呼び出して、未解決の GDI デバイスコンテキスト (DC) が開いていないことを確認すること。
クライアントウィンドウがリサイズされたとき (つまり、アプリケーションが WM_SIZE メッセージを受信したとき) に
ResizeBuffers を呼び出すことを推奨する。
Windows 8 と Windows 7 の IDXGISwapChain::ResizeBuffers
の唯一の違いは、DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL または
DXGI_SWAP_EFFECT_FLIP_DISCARD
値を設定して作成したフリッププレゼンテーションモデルのスワップチェーンに関するものである。Windows 8
では、フルスクリーンモードとウィンドウモードの間の遷移を実現するには ResizeBuffers を呼び出す必要がある。そうしないと、次の
IDXGISwapChain::Present メソッドの呼び出しが失敗する。


%index
IDXGISwapChain_ResizeTarget
出力ターゲットをリサイズする。
%prm
this, pNewTargetParameters
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
pNewTargetParameters : [var] 型: const DXGI_MODE_DESC* モードを記述する DXGI_MODE_DESC 構造体へのポインタ。新しい幅、高さ、フォーマット、ターゲットのリフレッシュレートを指定する。フォーマットが DXGI_FORMAT_UNKNOWN の場合、ResizeTarget は既存のフォーマットを使用する。このメソッドはスレッドセーフではないため、スワップチェーンがフルスクリーンモードのときにのみ DXGI_FORMAT_UNKNOWN を使用することを推奨する。
%inst
出力ターゲットをリサイズする。

[戻り値]
型: HRESULT 成功または失敗を示すコードを返す。この API
が呼び出されたときにフルスクリーン/ウィンドウモードの遷移が発生している場合は
DXGI_STATUS_MODE_CHANGE_IN_PROGRESS が返される。追加の DXGI エラーコードについては
DXGI_ERROR を参照。

[備考]
ResizeTarget
は、スワップチェーンがウィンドウモードの場合はターゲットウィンドウをリサイズし、スワップチェーンがフルスクリーンモードの場合はターゲット出力のディスプレイモードを変更する。したがって、アプリは、スワップチェーンのディスプレイモードを知らずに、(SetWindowPos
のような Microsoft Win32 API ではなく) ResizeTarget
を呼び出してターゲットウィンドウをリサイズできる。Windows ストアアプリが ResizeTarget
を呼び出すと、DXGI_ERROR_NOT_CURRENTLY_AVAILABLE
で失敗する。IDXGIFactory2::CreateSwapChainForComposition で作成したスワップチェーンに対しては
ResizeTarget を呼び出せない。ResizeBuffers のみがバックバッファを変更できるため、アプリは
ResizeTarget の呼び出し後も IDXGISwapChain::ResizeBuffers
を呼び出す必要がある。ただし、ResizeBuffers
を呼び出すウィンドウリサイズ処理を実装しているアプリでは、ウィンドウリサイズ処理がアプリが必要とすることを実現するため、ResizeTarget
の呼び出し後に明示的に ResizeBuffers を呼び出す必要はない。


%index
IDXGISwapChain_GetContainingOutput
ターゲットウィンドウのクライアント領域の大半を含む出力 (ディスプレイモニタ) を取得する。
%prm
this, ppOutput
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
ppOutput : [comobj] 型: IDXGIOutput** 出力インターフェースへのポインタ (IDXGIOutput を参照)。
%inst
ターゲットウィンドウのクライアント領域の大半を含む出力 (ディスプレイモニタ) を取得する。

[戻り値]
型: HRESULT 次の DXGI_ERROR のいずれかを返す。

[備考]

メソッドが成功した場合、出力インターフェースが埋められ、その参照カウントがインクリメントされる。使い終わったらメモリリークを防ぐためにインターフェースを必ず解放すること。出力はスワップチェーンのデバイスが作成されたアダプタにも所有される。IDXGIFactory2::CreateSwapChainForComposition
で作成したスワップチェーンに対しては GetContainingOutput
を呼び出せない。そのようなスワップチェーンに対応する出力を判別するには、IDXGIFactory::EnumAdapters
を呼び出してから IDXGIAdapter::EnumOutputs
を呼び出して利用可能なすべての出力を列挙する必要がある。次に、CoreWindow::Bounds
の境界を、DXGI_OUTPUT_DESC1::DesktopCoordinates または
DXGI_OUTPUT_DESC::DesktopCoordinates
によって報告される各出力のデスクトップ座標と交差させる必要がある。


%index
IDXGISwapChain_GetFrameStatistics
最後のレンダーフレームに関するパフォーマンス統計情報を取得する。
%prm
this, pStats
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
pStats : [var] 型: DXGI_FRAME_STATISTICS* フレーム統計情報用の DXGI_FRAME_STATISTICS 構造体へのポインタ。
%inst
最後のレンダーフレームに関するパフォーマンス統計情報を取得する。

[戻り値]
型: HRESULT DXGI_ERROR 値のいずれかを返す。

[備考]
ビットブロック転送 (bitblt) プレゼンテーションモデルを使用し、かつウィンドウモードで描画するスワップチェーンに対して
GetFrameStatistics を使用することはできない。GetFrameStatistics
は、フリッププレゼンテーションモデルを使用するか、フルスクリーンモードで描画するスワップチェーンに対してのみ使用できる。スワップチェーンがフリッププレゼンテーションモデルを使用するように指定するには、DXGI_SWAP_CHAIN_DESC1
構造体の SwapEffect メンバに DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL
値を設定する。複数モニタのシナリオや他のフルスクリーンアプリが実行されているシナリオでは、統計情報の信頼性が低い。


%index
IDXGISwapChain_GetLastPresentCount
IDXGISwapChain::Present または IDXGISwapChain1::Present1 が呼び出された回数を取得する。
%prm
this, pLastPresentCount
this : [comobj] IDXGISwapChain インターフェースの COM オブジェクト変数
pLastPresentCount : [int] 型: UINT* 呼び出し回数を受け取る変数へのポインタ。
%inst
IDXGISwapChain::Present または IDXGISwapChain1::Present1 が呼び出された回数を取得する。

[戻り値]
型: HRESULT DXGI_ERROR 値のいずれかを返す。

[備考]
フレームのプレゼンテーション統計情報については DXGI_FRAME_STATISTICS を参照。


%index
IEnumFORMATETC_Next
列挙シーケンスから指定した数のアイテムを取得する。(IEnumFORMATETC.Next)
%prm
this, celt, rgelt, pceltFetched
this : [comobj] IEnumFORMATETC インターフェースの COM オブジェクト変数
celt : [int] 取得するアイテム数。シーケンスに残っているアイテム数が要求より少ない場合、残りの要素を取得する。
rgelt : [var] 列挙されたアイテムの配列。列挙子がメモリの確保を行い、呼び出し側が解放する責任を負う。celt が 1 より大きい場合、呼び出し側は解放すべきポインターの数を知るために pceltFetched に NULL 以外のポインターを渡さなければならない。
pceltFetched : [var] 取得されたアイテム数。このパラメーターは常に要求されたアイテム数以下になる。celt が 1 の場合、このパラメーターは NULL でもよい。
%inst
列挙シーケンスから指定した数のアイテムを取得する。(IEnumFORMATETC.Next)

[戻り値]
メソッドが要求された数のアイテムを取得した場合、戻り値は S_OK。そうでなければ S_FALSE。


%index
IEnumFORMATETC_Skip
列挙シーケンス内で指定した数のアイテムをスキップする。(IEnumFORMATETC.Skip)
%prm
this, celt
this : [comobj] IEnumFORMATETC インターフェースの COM オブジェクト変数
celt : [int] スキップするアイテム数。
%inst
列挙シーケンス内で指定した数のアイテムをスキップする。(IEnumFORMATETC.Skip)

[戻り値]
メソッドが要求された数のアイテムをスキップした場合、戻り値は S_OK。そうでなければ S_FALSE。


%index
IEnumFORMATETC_Reset
列挙シーケンスを先頭にリセットする。(IEnumFORMATETC.Reset)
%prm
this
this : [comobj] IEnumFORMATETC インターフェースの COM オブジェクト変数
%inst
列挙シーケンスを先頭にリセットする。(IEnumFORMATETC.Reset)

[戻り値]
成功時は S_OK を返す。

[備考]

リセット操作完了後に同じオブジェクトの集合が列挙される保証はない。静的なコレクションは先頭にリセットされるが、ディレクトリ内のファイルなど一部のコレクションではこの条件を保証するのが高コストになる。


%index
IEnumFORMATETC_Clone
現在の列挙子と同じ列挙状態を持つ新しい列挙子を作成する。(IEnumFORMATETC.Clone)
%prm
this, ppenum
this : [comobj] IEnumFORMATETC インターフェースの COM オブジェクト変数
ppenum : [comobj] 列挙オブジェクトへのインターフェースポインターを受け取る IEnumFORMATETC ポインター変数のアドレス。メソッドが失敗した場合、この出力変数の値は未定義。
%inst
現在の列挙子と同じ列挙状態を持つ新しい列挙子を作成する。(IEnumFORMATETC.Clone)

[戻り値]
成功時は S_OK を返す。その他の値には以下のものが含まれる。
（以下省略）


%index
IEnumMoniker_Next
列挙シーケンスから指定された数の項目を取得する。(IEnumMoniker.Next)
%prm
this, celt, rgelt, pceltFetched
this : [comobj] IEnumMoniker インターフェースの COM オブジェクト変数
celt : [int] 取得する項目数。残り項目数が要求した数より少ない場合、このメソッドは残りの要素を取得する。
rgelt : [comobj] 列挙された項目の配列。列挙子は AddRef を呼び出す責任を負い、呼び出し側は列挙された各ポインタに対して Release を呼び出す責任を負う。celt が 1 より大きい場合、解放すべきポインタ数を知るために pceltFetched に NULL でないポインタを渡さなければならない。
pceltFetched : [var] 取得された項目数。このパラメータは常に要求された項目数以下になる。celt が 1 の場合、このパラメータは NULL でもよい。
%inst
列挙シーケンスから指定された数の項目を取得する。(IEnumMoniker.Next)

[戻り値]
メソッドが要求された項目数を取得した場合、戻り値は S_OK である。それ以外の場合は S_FALSE となる。


%index
IEnumMoniker_Skip
列挙シーケンス内の指定された数の項目をスキップする。(IEnumMoniker.Skip)
%prm
this, celt
this : [comobj] IEnumMoniker インターフェースの COM オブジェクト変数
celt : [int] スキップする項目数。
%inst
列挙シーケンス内の指定された数の項目をスキップする。(IEnumMoniker.Skip)

[戻り値]
メソッドが要求された数の項目をスキップした場合、戻り値は S_OK である。それ以外の場合は S_FALSE となる。


%index
IEnumMoniker_Reset
列挙シーケンスを先頭にリセットする。(IEnumMoniker.Reset)
%prm
this
this : [comobj] IEnumMoniker インターフェースの COM オブジェクト変数
%inst
列挙シーケンスを先頭にリセットする。(IEnumMoniker.Reset)

[戻り値]
成功時は S_OK を返す。

[備考]

リセット操作の完了後に同じオブジェクト集合が列挙される保証はない。静的なコレクションは先頭にリセットされるが、ディレクトリ内のファイルなど一部のコレクションでは、その条件を保証することは高コストになり得る。


%index
IEnumMoniker_Clone
現在の列挙状態と同じ状態を持つ新しい列挙子を作成する。(IEnumMoniker.Clone)
%prm
this, ppenum
this : [comobj] IEnumMoniker インターフェースの COM オブジェクト変数
ppenum : [comobj] 列挙オブジェクトへのインターフェースポインタを受け取る IEnumMoniker ポインタ変数のアドレス。メソッドが失敗した場合、この出力変数の値は未定義である。
%inst
現在の列挙状態と同じ状態を持つ新しい列挙子を作成する。(IEnumMoniker.Clone)

[戻り値]
成功時は S_OK を返す。その他の値として以下のものがあり得る。
（以下省略）


%index
IEnumShellItems_Next
列挙から 1 つ以上の IShellItem インターフェースの配列を取得する。
%prm
this, celt, rgelt, pceltFetched
this : [comobj] IEnumShellItems インターフェースの COM オブジェクト変数
celt : [int] 型: ULONG rgelt パラメータが参照する配列内の要素数。
rgelt : [comobj] 型: IShellItem** 列挙された項目を受け取る IShellItem インターフェースへのポインタの配列のアドレス。呼び出し側のアプリケーションは IUnknown::Release を呼び出して IShellItem インターフェースを解放する責任を負う。
pceltFetched : [var] 型: ULONG* 正常に取得された IShellItem インターフェースの数を受け取る値へのポインタ。このカウントは celt パラメータで指定した値より小さくなることがある。celt が 1 の場合に限り入力時に NULL を指定できる。これはその場合、メソッドは 1 項目を取得して S_OK を返すか、項目を 0 個取得して S_FALSE を返すかのいずれかしかないからである。
%inst
列挙から 1 つ以上の IShellItem インターフェースの配列を取得する。

[戻り値]
型: HRESULT このメソッドは次のいずれかの値を返すことができる。
（以下省略）


%index
IEnumShellItems_Skip
列挙内の指定された数の IShellItem インターフェースをスキップする。インターフェースを取得する際に使用する。
%prm
this, celt
this : [comobj] IEnumShellItems インターフェースの COM オブジェクト変数
celt : [int] 型: ULONG スキップする IShellItem インターフェースの数。
%inst
列挙内の指定された数の IShellItem インターフェースをスキップする。インターフェースを取得する際に使用する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IEnumShellItems_Reset
列挙内の取得済み IShellItem インターフェースの内部カウントをリセットする。
%prm
this
this : [comobj] IEnumShellItems インターフェースの COM オブジェクト変数
%inst
列挙内の取得済み IShellItem インターフェースの内部カウントをリセットする。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IEnumShellItems_Clone
現在の列挙のコピーを取得する。
%prm
this, ppenum
this : [comobj] IEnumShellItems インターフェースの COM オブジェクト変数
ppenum : [comobj] 型: IEnumShellItems** この列挙のコピーを受け取るポインタのアドレス。
%inst
現在の列挙のコピーを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IEnumSTATDATA_Next
列挙シーケンスから指定された数の項目を取得する。(IEnumSTATDATA.Next)
%prm
this, celt, rgelt, pceltFetched
this : [comobj] IEnumSTATDATA インターフェースの COM オブジェクト変数
celt : [int] 取得する項目数。残り項目数が要求した数より少ない場合、このメソッドは残りの要素を取得する。
rgelt : [int] 列挙された項目の配列。列挙子はメモリの確保責任を負い、呼び出し側はそれを解放する責任を負う。celt が 1 より大きい場合、解放すべきポインタ数を知るために pceltFetched に NULL でないポインタを渡さなければならない。
pceltFetched : [var] 取得された項目数。このパラメータは常に要求された項目数以下になる。celt が 1 の場合、このパラメータは NULL でもよい。
%inst
列挙シーケンスから指定された数の項目を取得する。(IEnumSTATDATA.Next)

[戻り値]
メソッドが要求された項目数を取得した場合、戻り値は S_OK である。それ以外の場合は S_FALSE となる。


%index
IEnumSTATDATA_Skip
列挙シーケンス内の指定された数の項目をスキップする。(IEnumSTATDATA.Skip)
%prm
this, celt
this : [comobj] IEnumSTATDATA インターフェースの COM オブジェクト変数
celt : [int] スキップする項目数。
%inst
列挙シーケンス内の指定された数の項目をスキップする。(IEnumSTATDATA.Skip)

[戻り値]
メソッドが要求された数の項目をスキップした場合、戻り値は S_OK である。それ以外の場合は S_FALSE となる。


%index
IEnumSTATDATA_Reset
列挙シーケンスを先頭にリセットする。(IEnumSTATDATA.Reset)
%prm
this
this : [comobj] IEnumSTATDATA インターフェースの COM オブジェクト変数
%inst
列挙シーケンスを先頭にリセットする。(IEnumSTATDATA.Reset)

[戻り値]
成功時は S_OK を返す。

[備考]

リセット操作の完了後に同じオブジェクト集合が列挙される保証はない。静的なコレクションは先頭にリセットされるが、ディレクトリ内のファイルなど一部のコレクションでは、その条件を保証することは高コストになり得る。


%index
IEnumSTATDATA_Clone
現在の列挙状態と同じ状態を持つ新しい列挙子を作成する。(IEnumSTATDATA.Clone)
%prm
this, ppenum
this : [comobj] IEnumSTATDATA インターフェースの COM オブジェクト変数
ppenum : [comobj] 列挙オブジェクトへのインターフェースポインタを受け取る IEnumSTATDATA ポインタ変数へのポインタ。メソッドが失敗した場合、この出力変数の値は未定義である。
%inst
現在の列挙状態と同じ状態を持つ新しい列挙子を作成する。(IEnumSTATDATA.Clone)

[戻り値]
成功時は S_OK を返す。その他の値として以下のものがあり得る。
（以下省略）


%index
IEnumString_Next
IEnumString::Next (objidlbase.h) メソッドは、列挙シーケンスから指定された数の項目を取得する。
%prm
this, celt, rgelt, pceltFetched
this : [comobj] IEnumString インターフェースの COM オブジェクト変数
celt : [int] 取得する項目数。残り項目数が要求した数より少ない場合、このメソッドは残りの要素を取得する。
rgelt : [var] 列挙された項目の配列。列挙子はメモリの確保責任を負い、呼び出し側はそれを解放する責任を負う。celt が 1 より大きい場合、解放すべきポインタ数を知るために pceltFetched に NULL でないポインタを渡さなければならない。
pceltFetched : [var] 取得された項目数。このパラメータは常に要求された項目数以下になる。
%inst
IEnumString::Next (objidlbase.h) メソッドは、列挙シーケンスから指定された数の項目を取得する。

[戻り値]
メソッドが要求された項目数を取得した場合、戻り値は S_OK である。それ以外の場合は S_FALSE となる。


%index
IEnumString_Skip
IEnumString::Skip (objidlbase.h) メソッドは、列挙シーケンス内の指定された数の項目をスキップする。
%prm
this, celt
this : [comobj] IEnumString インターフェースの COM オブジェクト変数
celt : [int] スキップする項目数。
%inst
IEnumString::Skip (objidlbase.h) メソッドは、列挙シーケンス内の指定された数の項目をスキップする。

[戻り値]
メソッドが要求された数の項目をスキップした場合、戻り値は S_OK である。それ以外の場合は S_FALSE となる。


%index
IEnumString_Reset
IEnumString::Reset (objidlbase.h) メソッドは、列挙シーケンスを先頭にリセットする。
%prm
this
this : [comobj] IEnumString インターフェースの COM オブジェクト変数
%inst
IEnumString::Reset (objidlbase.h) メソッドは、列挙シーケンスを先頭にリセットする。

[戻り値]
戻り値は S_OK である。

[備考]

リセット操作の完了後に同じオブジェクト集合が列挙される保証はない。静的なコレクションは先頭にリセットされるが、ディレクトリ内のファイルなど一部のコレクションでは、その条件を保証することは高コストになり得る。


%index
IEnumString_Clone
IEnumString::Clone (objidlbase.h) メソッドは、現在の列挙状態と同じ状態を持つ新しい列挙子を作成する。
%prm
this, ppenum
this : [comobj] IEnumString インターフェースの COM オブジェクト変数
ppenum : [comobj] クローンされた列挙オブジェクトへのポインタ。
%inst
IEnumString::Clone (objidlbase.h) メソッドは、現在の列挙状態と同じ状態を持つ新しい列挙子を作成する。

[戻り値]
このメソッドは標準の戻り値 E_INVALIDARG、E_OUTOFMEMORY、E_UNEXPECTED、S_OK を返すことができる。


%index
IEnumUnknown_Next
IEnumUnknown::Next (objidlbase.h) メソッドは、列挙シーケンスから指定された数の項目を取得する。
%prm
this, celt, rgelt, pceltFetched
this : [comobj] IEnumUnknown インターフェースの COM オブジェクト変数
celt : [int] 取得する項目数。残り項目数が要求した数より少ない場合、このメソッドは残りの要素を取得する。
rgelt : [int] 列挙された項目の配列。列挙子は AddRef を呼び出す責任を負い、呼び出し側は列挙された各ポインタに対して Release を呼び出す責任を負う。celt が 1 より大きい場合、解放すべきポインタ数を知るために pceltFetched に NULL でないポインタを渡さなければならない。
pceltFetched : [var] 取得された項目数。このパラメータは常に要求された項目数以下になる。
%inst
IEnumUnknown::Next (objidlbase.h) メソッドは、列挙シーケンスから指定された数の項目を取得する。

[戻り値]
メソッドが要求された項目数を取得した場合、戻り値は S_OK である。それ以外の場合は S_FALSE となる。


%index
IEnumUnknown_Skip
IEnumUnknown::Skip (objidlbase.h) メソッドは、列挙シーケンス内の指定された数の項目をスキップする。
%prm
this, celt
this : [comobj] IEnumUnknown インターフェースの COM オブジェクト変数
celt : [int] スキップする項目数。
%inst
IEnumUnknown::Skip (objidlbase.h) メソッドは、列挙シーケンス内の指定された数の項目をスキップする。

[戻り値]
メソッドが要求された数の項目をスキップした場合、戻り値は S_OK である。それ以外の場合は S_FALSE となる。


%index
IEnumUnknown_Reset
IEnumUnknown::Reset (objidlbase.h) メソッドは、列挙シーケンスを先頭にリセットする。
%prm
this
this : [comobj] IEnumUnknown インターフェースの COM オブジェクト変数
%inst
IEnumUnknown::Reset (objidlbase.h) メソッドは、列挙シーケンスを先頭にリセットする。

[戻り値]
戻り値は S_OK である。

[備考]

リセット操作の完了後に同じオブジェクト集合が列挙される保証はない。静的なコレクションは先頭にリセットされるが、ディレクトリ内のファイルなど一部のコレクションでは、その条件を保証することは高コストになり得る。


%index
IEnumUnknown_Clone
IEnumUnknown::Clone (objidlbase.h) メソッドは、現在の列挙状態と同じ状態を持つ新しい列挙子を作成する。
%prm
this, ppenum
this : [comobj] IEnumUnknown インターフェースの COM オブジェクト変数
ppenum : [comobj] クローンされた列挙オブジェクトへのポインタ。
%inst
IEnumUnknown::Clone (objidlbase.h) メソッドは、現在の列挙状態と同じ状態を持つ新しい列挙子を作成する。

[戻り値]
このメソッドは標準の戻り値 E_INVALIDARG、E_OUTOFMEMORY、E_UNEXPECTED、S_OK を返すことができる。


%index
IErrorLog_AddError
指定したプロパティに対するエラーをエラーログに追加する。
%prm
this, pszPropName, pExcepInfo
this : [comobj] IErrorLog インターフェースの COM オブジェクト変数
pszPropName : [wstr] 読み取るプロパティの名前のアドレス。NULL は指定できない。
pExcepInfo : [int] [EXCEPINFO](ns-oaidl-excepinfo.md) 構造体の配列へのポインタ。
%inst
指定したプロパティに対するエラーをエラーログに追加する。


%index
IFileDialog_Show
IFileDialog::Show (vtable slot 3)
%prm
this, hwndOwner
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
hwndOwner : [intptr] 
%inst


%index
IFileDialog_SetFileTypes
ダイアログが開く、または保存できるファイルタイプを設定する。
%prm
this, cFileTypes, rgFilterSpec
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
cFileTypes : [int] 型: UINT rgFilterSpec で指定された配列の要素数。
rgFilterSpec : [var] 型: const COMDLG_FILTERSPEC* 各要素がファイルタイプを表す COMDLG_FILTERSPEC 構造体の配列へのポインター。
%inst
ダイアログが開く、または保存できるファイルタイプを設定する。

[戻り値]
型: HRESULT メソッドが成功した場合 S_OK を返す。そうでなければ以下を含む HRESULT エラーコードを返す。
（以下省略）

[備考]

オープンダイアログを使用する場合、ここで宣言したファイルタイプはビューのフィルターに使われる。セーブダイアログを使用する場合、これらの値はファイル名に追加されるファイル名拡張子を決定する。このメソッドはダイアログを表示する前に呼び出さなければならず、ダイアログインスタンスごとに
1 回しか呼び出せない。コモンアイテムダイアログボックスが表示された後はファイルタイプを変更できない。


%index
IFileDialog_SetFileTypeIndex
ダイアログで選択状態として表示されるファイルタイプを設定する。
%prm
this, iFileType
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
iFileType : [int] 型: UINT IFileDialog::SetFileTypes の cFileTypes パラメーターに渡されたファイルタイプ配列におけるファイルタイプのインデックス。注意 これは 0 ベースではなく 1 ベースのインデックスである。
%inst
ダイアログで選択状態として表示されるファイルタイプを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
このメソッドはダイアログが表示される前に呼び出さなければならない。


%index
IFileDialog_GetFileTypeIndex
現在選択されているファイルタイプを取得する。
%prm
this, piFileType
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
piFileType : [int] 型: UINT* IFileDialog::SetFileTypes の cFileTypes パラメーターに渡されたファイルタイプ配列における、選択中のファイルタイプのインデックスを受け取る UINT 値へのポインター。注意 これは 0 ベースではなく 1 ベースのインデックスである。
%inst
現在選択されているファイルタイプを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
IFileDialog::GetFileTypeIndex はダイアログが開いている間でも、閉じられた後でも呼び出せる。


%index
IFileDialog_Advise
ダイアログから送られるイベントを待ち受けるイベントハンドラーを割り当てる。
%prm
this, pfde, pdwCookie
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pfde : [comobj] 型: IFileDialogEvents* ダイアログからのイベントを受け取る IFileDialogEvents 実装へのポインター。
pdwCookie : [int] 型: DWORD* このイベントハンドラーを識別する値を受け取る DWORD へのポインター。クライアントはダイアログの使用を終えたら、この値を指定して IFileDialog::Unadvise メソッドを呼び出さなければならない。
%inst
ダイアログから送られるイベントを待ち受けるイベントハンドラーを割り当てる。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_Unadvise
IFileDialog::Advise メソッドで取り付けたイベントハンドラーを取り除く。
%prm
this, dwCookie
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
dwCookie : [int] 型: DWORD イベントハンドラーを表す DWORD 値。この値は IFileDialog::Advise メソッドの pdwCookie パラメーターから取得する。
%inst
IFileDialog::Advise メソッドで取り付けたイベントハンドラーを取り除く。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_SetOptions
ダイアログの動作を制御するフラグを設定する。
%prm
this, fos
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
fos : [int] 型: FILEOPENDIALOGOPTIONS 1 つまたは複数の FILEOPENDIALOGOPTIONS 値。
%inst
ダイアログの動作を制御するフラグを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
一般にこのメソッドは IFileDialog::GetOptions
で取得した値を受け取り、適切なフラグを設定してオプションを追加または削除するように変更するために使用すべきである。


%index
IFileDialog_GetOptions
ダイアログの動作を制御するために設定されている現在のフラグを取得する。
%prm
this, pfos
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pfos : [var] 型: FILEOPENDIALOGOPTIONS* このメソッドが正常に戻ったとき、FILEOPENDIALOGOPTIONS の 1 つまたは複数の値の組み合わせを指す。
%inst
ダイアログの動作を制御するために設定されている現在のフラグを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_SetDefaultFolder
最近使用したフォルダーの値が利用できない場合に既定として使用するフォルダーを設定する。
%prm
this, psi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* フォルダーを表すインターフェースへのポインター。
%inst
最近使用したフォルダーの値が利用できない場合に既定として使用するフォルダーを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_SetFolder
ダイアログが開かれる際に、直前のユーザー操作に関わらず常に選択されるフォルダーを設定する。
%prm
this, psi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* フォルダーを表すインターフェースへのポインター。
%inst
ダイアログが開かれる際に、直前のユーザー操作に関わらず常に選択されるフォルダーを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このフォルダーは「最近使用した」フォルダーを上書きする。ダイアログ表示中にこのメソッドが呼び出されると、ダイアログは指定したフォルダーへナビゲートする。一般にこのメソッドの使用は推奨されない。ダイアログボックスを表示する前に
SetFolder
を呼び出すと、ユーザーが直近に保存したり開いたりした場所が表示されない。この動作を必要とする非常に具体的な理由がない限り、これは望ましいユーザー体験とは言えず、避けるべきである。ほとんどの場合
IFileDialog::SetDefaultFolder の方が適している。Windows 7 以降、psi
を介して指定したフォルダーのパスが既知フォルダーの既定パスである場合、ダイアログではその既知フォルダーの現在のパスが使用される。そのパスは
psi
で指定されたものとは異なる場合がある。例えば既知フォルダーがリダイレクトされているなどである。既知フォルダーがライブラリ（仮想フォルダーのドキュメント・ミュージック・ピクチャー・ビデオ）である場合、ダイアログではライブラリのパスが使用される。指定したライブラリが非表示（Windows
8.1 以降の既定ではそうなっている）の場合、ダイアログではライブラリの既定の保存場所（ドキュメントライブラリに対する Microsoft
OneDrive
ドキュメントフォルダーなど）が使用される。これらのマッピングのため、ダイアログで使用されるフォルダー位置は、このメソッドを呼び出したときに指定したものとは完全には一致しない場合がある。


%index
IFileDialog_GetFolder
ダイアログで現在選択されているフォルダー、またはダイアログが現在表示されていない場合はダイアログが開かれた際に選択されるフォルダーを取得する。
%prm
this, ppsi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 型: IShellItem** フォルダーを表すインターフェースへのポインターのアドレス。
%inst

ダイアログで現在選択されているフォルダー、またはダイアログが現在表示されていない場合はダイアログが開かれた際に選択されるフォルダーを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
呼び出し側アプリケーションは取得した IShellItem が不要になったら解放する責任を負う。


%index
IFileDialog_GetCurrentSelection
ダイアログにおけるユーザーの現在の選択を取得する。
%prm
this, ppsi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 型: IShellItem** ダイアログで現在選択されているアイテムを表すインターフェースへのポインターのアドレス。このアイテムはビューウィンドウで選択されているファイルやフォルダー、またはユーザーがダイアログの編集ボックスに入力した内容である場合がある。後者の場合は現在のスレッドをブロックする可能性のある解析操作（ユーザーによるキャンセル可）が必要になることがある。
%inst
ダイアログにおけるユーザーの現在の選択を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
呼び出し側アプリケーションは取得した IShellItem が不要になったら解放する責任を負う。


%index
IFileDialog_SetFileName
ダイアログが開かれたときにファイル名編集ボックスに表示されるファイル名を設定する。
%prm
this, pszName
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszName : [wstr] 型: LPCWSTR ファイル名へのポインター。
%inst
ダイアログが開かれたときにファイル名編集ボックスに表示されるファイル名を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_GetFileName
ダイアログのファイル名編集ボックスに現在入力されているテキストを取得する。
%prm
this, pszName
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszName : [var] 型: WCHAR** このメソッドが正常に戻ったときにテキストを受け取るバッファへのポインターのアドレス。
%inst
ダイアログのファイル名編集ボックスに現在入力されているテキストを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
ファイル名編集ボックスのテキストは、ユーザーが選択したアイテムを必ずしも反映しない。ユーザーが選択したアイテムを取得するには
IFileDialog::GetResult を使用する。呼び出し側アプリケーションは取得したバッファを CoTaskMemFree
関数で解放する責任を負う。


%index
IFileDialog_SetTitle
ダイアログのタイトルを設定する。
%prm
this, pszTitle
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszTitle : [wstr] 型: LPCWSTR タイトルテキストを含むバッファへのポインター。
%inst
ダイアログのタイトルを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_SetOkButtonLabel
[開く] または [保存] ボタンのテキストを設定する。
%prm
this, pszText
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszText : [wstr] 型: LPCWSTR ボタンテキストを含むバッファへのポインター。
%inst
[開く] または [保存] ボタンのテキストを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_SetFileNameLabel
ファイル名編集ボックスの隣のラベルのテキストを設定する。
%prm
this, pszLabel
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszLabel : [wstr] 型: LPCWSTR ラベルテキストを含むバッファへのポインター。
%inst
ファイル名編集ボックスの隣のラベルのテキストを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialog_GetResult
ダイアログでユーザーが行った選択を取得する。
%prm
this, ppsi
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 型: IShellItem** ユーザーの選択を表す IShellItem へのポインターのアドレス。
%inst
ダイアログでユーザーが行った選択を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
IFileDialog::GetResult はダイアログが閉じられた後、または OnFileOk
イベント処理中に呼び出せる。それ以外のタイミングで呼び出すと失敗する。複数のアイテムが選択された場合、このメソッドは失敗する。複数アイテムの場合は
GetResults を呼び出す。
IFileDialog::GetResult で結果を取得できるようにするには、Show は成功コードを返していなければならない。


%index
IFileDialog_AddPlace
ユーザーがアイテムを開く、または保存するのに利用可能な場所のリストにフォルダーを追加する。
%prm
this, psi, fdap
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* ユーザーに利用可能にするフォルダーを表す IShellItem へのポインター。フォルダー以外は指定できない。
fdap : [int] 型: FDAP リスト内でフォルダーを配置する位置を指定する。FDAP を参照。
%inst
ユーザーがアイテムを開く、または保存するのに利用可能な場所のリストにフォルダーを追加する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
SHSetTemporaryPropertyForItem を使って psi パラメーターが表すアイテムに一時的な
PKEY_ItemNameDisplay プロパティを設定できる。このプロパティの値はアイテムの UI 名の代わりに使われる。


%index
IFileDialog_SetDefaultExtension
ファイル名に追加する既定の拡張子を設定する。
%prm
this, pszDefaultExtension
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pszDefaultExtension : [wstr] 型: LPCWSTR 拡張子テキストを含むバッファへのポインター。この文字列には先頭のピリオドを含めない。例えば「jpg」は正しく、「.jpg」は正しくない。
%inst
ファイル名に追加する既定の拡張子を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
ダイアログを表示する前にこのメソッドを呼び出した場合、ユーザーが新しいファイルタイプを選択すると（SetFileTypes
を参照）、ダイアログは既定の拡張子を自動的に更新する。


%index
IFileDialog_Close
ダイアログを閉じる。
%prm
this, hr
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
hr : [intptr] 型: HRESULT 選択が行われる前にダイアログが閉じられたことを示すために Show が返すコード。
%inst
ダイアログを閉じる。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
アプリケーションはダイアログが開いている間にコールバックメソッドや関数からこのメソッドを呼び出せる。ダイアログは閉じられ、Show
メソッドは hr で指定された HRESULT を返す。このメソッドが呼び出された場合、IFileDialog::GetResult や
GetResults メソッドで利用可能な結果は存在せず、呼び出すと失敗する。


%index
IFileDialog_SetClientGuid
呼び出し側アプリケーションがダイアログの永続化状態に GUID を関連付けられるようにする。
%prm
this, guid
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
guid : [var] 型: REFGUID このダイアログ状態に関連付ける GUID。
%inst
呼び出し側アプリケーションがダイアログの永続化状態に GUID を関連付けられるようにする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

ダイアログの状態には直近に訪れたフォルダーやダイアログの位置とサイズなどが含まれる。通常この状態は実行可能ファイル名をもとに永続化される。GUID
を指定することで、アプリケーションは同じアプリケーション内でダイアログのバージョンごとに異なる永続化状態を持てる（インポートダイアログとオープンダイアログなど）。
IFileDialog::SetClientGuid はダイアログオブジェクト作成直後に呼び出すべきである。


%index
IFileDialog_ClearClientData
ダイアログに永続化されたすべての状態情報をクリアするよう指示する。
%prm
this
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
%inst
ダイアログに永続化されたすべての状態情報をクリアするよう指示する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
永続化された情報はアプリケーションまたは GUID に関連付けることができる。IFileDialog::SetClientGuid
を使って GUID が設定されていた場合、その GUID が永続化された情報のクリアに使われる。


%index
IFileDialog_SetFilter
SetFilter は Windows 7 以降では使用できなくなった。
%prm
this, pFilter
this : [comobj] IFileDialog インターフェースの COM オブジェクト変数
pFilter : [comobj] 型: IShellItemFilter* 設定する IShellItemFilter へのポインター。
%inst
SetFilter は Windows 7 以降では使用できなくなった。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

アプリケーションがダイアログボックスのビューから特定のアイテムを取り除く特別なフィルタリングを行う必要がある場合にこのメソッドを使用できる。通常ビューに含まれる各アイテムに対して
IncludeItem が呼び出される。GetEnumFlagsForItem
は使用されない。ファイルタイプでフィルタリングする場合は、IShellItemFilter
を適用するよりもアイテム数の多いフォルダーで性能が良い可能性があるため、IFileDialog::SetFileTypes
を使用するべきである。


%index
IFileDialogEvents_OnFileOk
ダイアログが結果とともに返ろうとする直前に呼び出される。
%prm
this, pfd
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
%inst
ダイアログが結果とともに返ろうとする直前に呼び出される。

[戻り値]
型: HRESULT 実装は、ダイアログの現在の結果を受け入れる場合は S_OK を、拒否する場合は S_FALSE
を返すべきである。S_FALSE の場合、ダイアログは開いたままとなる。

[備考]
このメソッドが呼び出された時点で IFileDialog::GetResult および GetResults
メソッドが呼び出せる。アプリケーションはこのコールバックメソッドを使って、ダイアログが閉じる前に追加の検証を行ったり、ダイアログが閉じるのを阻止したりできる。ダイアログが閉じるのを阻止する場合、アプリケーションは原因を示す
UI を表示すべきである。UI の親 HWND を取得するには IFileDialog::QueryInterface 経由で
IOleWindow インターフェースを取得し、IOleWindow::GetWindow
を呼び出す。アプリケーションはこのメソッドを使ってファイルのオープンや保存にまつわるすべての処理を行うこともできる。


%index
IFileDialogEvents_OnFolderChanging
IFileDialogEvents::OnFolderChange の前に呼び出される。実装者が特定の場所へのナビゲーションを阻止できるようにする。
%prm
this, pfd, psiFolder
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
psiFolder : [comobj] 型: IShellItem* ダイアログがこれからナビゲートしようとしているフォルダーを表すインターフェースへのポインター。
%inst
IFileDialogEvents::OnFolderChange
の前に呼び出される。実装者が特定の場所へのナビゲーションを阻止できるようにする。

[戻り値]
型: HRESULT 成功時は S_OK、そうでなければエラー値を返す。戻り値が S_OK または E_NOTIMPL
の場合はフォルダー変更を続行できることを示す。

[備考]
呼び出し側アプリケーションはこのコールバック内で IFileDialog::SetFolder
を呼び出すことで、ナビゲーションを別のフォルダーへリダイレクトできる。実際のナビゲーションは
IFileDialogEvents::OnFolderChanging
が戻るまで行われない。呼び出し側アプリケーションが単に特定のフォルダーへのナビゲーションを阻止する場合、制限の理由を説明する UI
を表示するべきである。UI の親 HWND を取得するには IFileDialog 経由で IOleWindow
インターフェースを取得し、IOleWindow::GetWindow を呼び出す。


%index
IFileDialogEvents_OnFolderChange
ユーザーが新しいフォルダーへナビゲートしたときに呼び出される。
%prm
this, pfd
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
%inst
ユーザーが新しいフォルダーへナビゲートしたときに呼び出される。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
IFileDialogEvents::OnFolderChange はダイアログが開かれたときに呼び出される。


%index
IFileDialogEvents_OnSelectionChange
ユーザーがダイアログのビューで選択を変更したときに呼び出される。
%prm
this, pfd
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
%inst
ユーザーがダイアログのビューで選択を変更したときに呼び出される。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IFileDialogEvents_OnShareViolation
オープンまたはセーブ操作から発生する共有違反に対応できるようにする。
%prm
this, pfd, psi, pResponse
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
psi : [comobj] 型: IShellItem* 共有違反を起こしたアイテムを表すインターフェースへのポインター。
pResponse : [var] 型: FDE_SHAREVIOLATION_RESPONSE* 共有違反への応答を示す FDE_SHAREVIOLATION_RESPONSE 列挙子の値へのポインター。
%inst
オープンまたはセーブ操作から発生する共有違反に対応できるようにする。

[戻り値]
型: HRESULT 実装者はこのメソッドが実装されていない場合 E_NOTIMPL を返すべきである。そうでなければ S_OK
または適切なエラーコードを返す。

[備考]
このメソッドが呼び出される前に、IFileDialog::SetOptions で FOS_SHAREAWARE
フラグを設定しておかなければならない。共有違反は、ダイアログがファイルをテストした時点とアプリケーションがファイルを開いた時点の間にそのファイルがロックされる可能性があるため、アプリケーションがファイルを開こうとしたときに発生し得る。


%index
IFileDialogEvents_OnTypeChange
ダイアログが開かれたときに初期の選択ファイルタイプをアプリケーションに通知するために呼び出される。
%prm
this, pfd
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
%inst
ダイアログが開かれたときに初期の選択ファイルタイプをアプリケーションに通知するために呼び出される。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
このメソッドはダイアログが開かれたときにアプリケーションへ最初に選ばれたファイルタイプを通知するために呼び出される。アプリケーションの
IFileDialogEvents
内にタイプ変更に応答するコードがあれば、それに応じて応答できる。例えば特定のコントロールを隠すことができる。初期のファイルタイプはアプリケーションが制御しており、独自のチェックを行える。そのため便宜上このメソッドが提供されている。


%index
IFileDialogEvents_OnOverwrite
セーブダイアログからユーザーがファイルを上書きすることを選択したときに呼び出される。
%prm
this, pfd, psi, pResponse
this : [comobj] IFileDialogEvents インターフェースの COM オブジェクト変数
pfd : [comobj] 型: IFileDialog* ダイアログを表すインターフェースへのポインター。
psi : [comobj] 型: IShellItem* 上書きされるアイテムを表すインターフェースへのポインター。
pResponse : [var] 型: FDE_OVERWRITE_RESPONSE* 潜在的な上書き動作への応答を示す FDE_OVERWRITE_RESPONSE 列挙子の値へのポインター。
%inst
セーブダイアログからユーザーがファイルを上書きすることを選択したときに呼び出される。

[戻り値]
型: HRESULT 実装者はこのメソッドが実装されていない場合 E_NOTIMPL を返すべきである。そうでなければ S_OK
または適切なエラーコードを返す。

[備考]
このメソッドが呼び出される前に、IFileDialog::SetOptions で FOS_OVERWRITEPROMPT
フラグを設定しておかなければならない。


%index
IFileOpenDialog_Show
IFileOpenDialog::Show (vtable slot 3)
%prm
this, hwndOwner
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
hwndOwner : [intptr] 
%inst


%index
IFileOpenDialog_SetFileTypes
IFileOpenDialog::SetFileTypes (vtable slot 4)
%prm
this, cFileTypes, rgFilterSpec
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
cFileTypes : [int] 
rgFilterSpec : [var] 
%inst


%index
IFileOpenDialog_SetFileTypeIndex
IFileOpenDialog::SetFileTypeIndex (vtable slot 5)
%prm
this, iFileType
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
iFileType : [int] 
%inst


%index
IFileOpenDialog_GetFileTypeIndex
IFileOpenDialog::GetFileTypeIndex (vtable slot 6)
%prm
this, piFileType
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
piFileType : [int] 
%inst


%index
IFileOpenDialog_Advise
IFileOpenDialog::Advise (vtable slot 7)
%prm
this, pfde, pdwCookie
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pfde : [comobj] 
pdwCookie : [int] 
%inst


%index
IFileOpenDialog_Unadvise
IFileOpenDialog::Unadvise (vtable slot 8)
%prm
this, dwCookie
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
dwCookie : [int] 
%inst


%index
IFileOpenDialog_SetOptions
IFileOpenDialog::SetOptions (vtable slot 9)
%prm
this, fos
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
fos : [int] 
%inst


%index
IFileOpenDialog_GetOptions
IFileOpenDialog::GetOptions (vtable slot 10)
%prm
this, pfos
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pfos : [var] 
%inst


%index
IFileOpenDialog_SetDefaultFolder
IFileOpenDialog::SetDefaultFolder (vtable slot 11)
%prm
this, psi
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
psi : [comobj] 
%inst


%index
IFileOpenDialog_SetFolder
IFileOpenDialog::SetFolder (vtable slot 12)
%prm
this, psi
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
psi : [comobj] 
%inst


%index
IFileOpenDialog_GetFolder
IFileOpenDialog::GetFolder (vtable slot 13)
%prm
this, ppsi
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 
%inst


%index
IFileOpenDialog_GetCurrentSelection
IFileOpenDialog::GetCurrentSelection (vtable slot 14)
%prm
this, ppsi
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 
%inst


%index
IFileOpenDialog_SetFileName
IFileOpenDialog::SetFileName (vtable slot 15)
%prm
this, pszName
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pszName : [wstr] 
%inst


%index
IFileOpenDialog_GetFileName
IFileOpenDialog::GetFileName (vtable slot 16)
%prm
this, pszName
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pszName : [var] 
%inst


%index
IFileOpenDialog_SetTitle
IFileOpenDialog::SetTitle (vtable slot 17)
%prm
this, pszTitle
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pszTitle : [wstr] 
%inst


%index
IFileOpenDialog_SetOkButtonLabel
IFileOpenDialog::SetOkButtonLabel (vtable slot 18)
%prm
this, pszText
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pszText : [wstr] 
%inst


%index
IFileOpenDialog_SetFileNameLabel
IFileOpenDialog::SetFileNameLabel (vtable slot 19)
%prm
this, pszLabel
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pszLabel : [wstr] 
%inst


%index
IFileOpenDialog_GetResult
IFileOpenDialog::GetResult (vtable slot 20)
%prm
this, ppsi
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 
%inst


%index
IFileOpenDialog_AddPlace
IFileOpenDialog::AddPlace (vtable slot 21)
%prm
this, psi, fdap
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
psi : [comobj] 
fdap : [int] 
%inst


%index
IFileOpenDialog_SetDefaultExtension
IFileOpenDialog::SetDefaultExtension (vtable slot 22)
%prm
this, pszDefaultExtension
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pszDefaultExtension : [wstr] 
%inst


%index
IFileOpenDialog_Close
IFileOpenDialog::Close (vtable slot 23)
%prm
this, hr
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
hr : [intptr] 
%inst


%index
IFileOpenDialog_SetClientGuid
IFileOpenDialog::SetClientGuid (vtable slot 24)
%prm
this, guid
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
guid : [var] 
%inst


%index
IFileOpenDialog_ClearClientData
IFileOpenDialog::ClearClientData (vtable slot 25)
%prm
this
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
%inst


%index
IFileOpenDialog_SetFilter
IFileOpenDialog::SetFilter (vtable slot 26)
%prm
this, pFilter
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
pFilter : [comobj] 
%inst


%index
IFileOpenDialog_GetResults
複数選択を許可するダイアログでユーザーが行った選択を取得する。
%prm
this, ppenum
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
ppenum : [comobj] 型: IShellItemArray** ダイアログで選択されたアイテムにアクセスするための IShellItemArray へのポインターのアドレス。
%inst
複数選択を許可するダイアログでユーザーが行った選択を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
このメソッドは選択が単一アイテムか複数アイテムかに関わらず使用できる。IFileOpenDialog::GetResults
はダイアログが閉じられた後、または IFileDialogEvents::OnFileOk
イベント処理中に呼び出せる。それ以外のタイミングで呼び出すと失敗する。
IFileOpenDialog::GetResults で結果を取得できるようにするには、Show
は成功コードを返していなければならない。


%index
IFileOpenDialog_GetSelectedItems
ダイアログで現在選択されているアイテムを取得する。これらのアイテムはビュー内で選択されているものや、ファイル名編集ボックスで選択されているテキストである場合がある。
%prm
this, ppsai
this : [comobj] IFileOpenDialog インターフェースの COM オブジェクト変数
ppsai : [comobj] 型: IShellItemArray** 選択されたアイテムにアクセスするための IShellItemArray へのポインターのアドレス。
%inst

ダイアログで現在選択されているアイテムを取得する。これらのアイテムはビュー内で選択されているものや、ファイル名編集ボックスで選択されているテキストである場合がある。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このメソッドは単一アイテム選択にも複数アイテム選択にも使用できる。ユーザーがファイル名フィールドに新しいテキストを入力している場合、この操作は時間がかかる可能性がある。アプリケーションがこのメソッドを呼び出すと、アプリケーションはファイル名フィールドのテキストを解析する。例えばネットワーク共有の場合、この操作にはある程度時間がかかることがある。ただしこの操作は
UI をブロックしない。ユーザーは操作を停止でき、その結果 IFileOpenDialog::GetSelectedItems
は失敗コードを返すことになる。


%index
IFileOperationProgressSink_StartOperations
特定のファイル操作が実行される前に、呼び出し側が実装したアクションを実行する。
%prm
this
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
%inst
特定のファイル操作が実行される前に、呼び出し側が実装したアクションを実行する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
StartOperations は、PerformOperations の後に呼び出される
IFileOperationProgressSink
メソッドのうち最初のものである。ファイル操作が開始される前に必要なセットアップや初期化を行うために使用できる。


%index
IFileOperationProgressSink_FinishOperations
IFileOperation 呼び出しによる最後の操作の完了後に、呼び出し側が実装したアクションを実行する。
%prm
this, hrResult
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
hrResult : [intptr] 型: HRESULT 最後に実行された操作の戻り値。これは単に操作をキューに入れるだけの IFileOperation メソッドが返す HRESULT ではなく、コピー、削除、移動などの実際の操作の結果である点に注意。
%inst
IFileOperation 呼び出しによる最後の操作の完了後に、呼び出し側が実装したアクションを実行する。

[戻り値]
型: HRESULT 未使用。


%index
IFileOperationProgressSink_PreRenameItem
各項目の名前変更処理が開始される前に、呼び出し側が実装したアクションを実行する。
%prm
this, dwFlags, psiItem, pszNewName
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] 型: DWORD 操作を制御するフラグを含むビット値。フラグの説明は TRANSFER_SOURCE_FLAGS を参照のこと。
psiItem : [comobj] 型: IShellItem* 名前変更対象の項目を指定する IShellItem へのポインタ。
pszNewName : [wstr] 型: LPCWSTR 項目の新しい表示名へのポインタ。これは null 終端 Unicode 文字列である。
%inst
各項目の名前変更処理が開始される前に、呼び出し側が実装したアクションを実行する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外はエラー値を返す。エラー値の場合、名前変更操作と
IFileOperation の呼び出しから保留中の後続の操作はすべてキャンセルされる。


%index
IFileOperationProgressSink_PostRenameItem
各項目の名前変更処理が完了した後に、呼び出し側が実装したアクションを実行する。
%prm
this, dwFlags, psiItem, pszNewName, hrRename, psiNewlyCreated
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] 型: DWORD 名前変更操作中に使用されたフラグを含むビット値。名前変更操作中に設定または変更され得る値もある。フラグの説明は TRANSFER_SOURCE_FLAGS を参照のこと。
psiItem : [comobj] 型: IShellItem* 名前変更前の項目を指定する IShellItem へのポインタ。
pszNewName : [wstr] 型: LPCWSTR 項目の新しい表示名へのポインタ。これは null 終端 Unicode 文字列である。名前衝突やその他の命名規則により、要求した名前とは異なる場合がある点に注意。
hrRename : [intptr] 型: HRESULT 名前変更操作の戻り値。これは単に名前変更操作をキューに入れるだけの RenameItem が返す HRESULT ではなく、実際の名前変更操作の結果である点に注意。
psiNewlyCreated : [comobj] 型: IShellItem* 新しい名前を持つ項目を表す IShellItem へのポインタ。
%inst
各項目の名前変更処理が完了した後に、呼び出し側が実装したアクションを実行する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外はエラー値を返す。エラー値の場合、IFileOperation
の呼び出しから保留中の後続の操作はすべてキャンセルされる。


%index
IFileOperationProgressSink_PreMoveItem
各項目の移動処理が開始される前に、呼び出し側が実装したアクションを実行する。
%prm
this, dwFlags, psiItem, psiDestinationFolder, pszNewName
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] 型: DWORD 操作を制御するフラグを含むビット値。フラグの説明は TRANSFER_SOURCE_FLAGS を参照のこと。
psiItem : [comobj] 型: IShellItem* 移動対象の項目を指定する IShellItem へのポインタ。
psiDestinationFolder : [comobj] 型: IShellItem* 移動された項目を保持する移動先フォルダを指定する IShellItem へのポインタ。
pszNewName : [wstr] 型: LPCWSTR 新しい場所での項目の新しい名前へのポインタ。これは null 終端 Unicode 文字列であり、NULL を指定できる。NULL の場合、移動先の項目名はコピー元と同じになる。
%inst
各項目の移動処理が開始される前に、呼び出し側が実装したアクションを実行する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外はエラー値を返す。エラー値の場合、移動操作と IFileOperation
の呼び出しから保留中の後続の操作はすべてキャンセルされる。


%index
IFileOperationProgressSink_PostMoveItem
各項目の移動処理が完了した後に、呼び出し側が実装したアクションを実行する。
%prm
this, dwFlags, psiItem, psiDestinationFolder, pszNewName, hrMove, psiNewlyCreated
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] 型: DWORD 移動操作中に使用されたフラグを含むビット値。移動操作中に設定または変更され得る値もある。フラグの説明は TRANSFER_SOURCE_FLAGS を参照のこと。
psiItem : [comobj] 型: IShellItem* 移動元の項目を指定する IShellItem へのポインタ。
psiDestinationFolder : [comobj] 型: IShellItem* 移動された項目を含む移動先フォルダを指定する IShellItem へのポインタ。
pszNewName : [wstr] 型: LPCWSTR 移動後に項目に与えられた名前へのポインタ。これは null 終端 Unicode 文字列である。名前衝突やその他の命名規則により、要求した名前とは異なる場合がある点に注意。
hrMove : [intptr] 型: HRESULT 移動操作の戻り値。これは単に移動操作をキューに入れるだけの MoveItem が返す HRESULT ではなく、実際の移動の結果である点に注意。
psiNewlyCreated : [comobj] 型: IShellItem* 新しい場所に移動された項目を表す IShellItem へのポインタ。
%inst
各項目の移動処理が完了した後に、呼び出し側が実装したアクションを実行する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外はエラー値を返す。エラー値の場合、IFileOperation
の呼び出しから保留中の後続の操作はすべてキャンセルされる。


%index
IFileOperationProgressSink_PreCopyItem
各項目のコピー処理が開始される前に、呼び出し側が実装したアクションを実行する。
%prm
this, dwFlags, psiItem, psiDestinationFolder, pszNewName
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] 型: DWORD 操作を制御するフラグを含むビット値。フラグの説明は TRANSFER_SOURCE_FLAGS を参照のこと。
psiItem : [comobj] 型: IShellItem* コピー元の項目を指定する IShellItem へのポインタ。
psiDestinationFolder : [comobj] 型: IShellItem* 項目のコピーを保持する移動先フォルダを指定する IShellItem へのポインタ。
pszNewName : [wstr] 型: LPCWSTR コピー後の項目に付ける新しい名前へのポインタ。これは null 終端 Unicode 文字列であり、NULL を指定できる。NULL の場合、移動先の項目名はコピー元と同じになる。
%inst
各項目のコピー処理が開始される前に、呼び出し側が実装したアクションを実行する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外はエラー値を返す。エラー値の場合、コピー操作と
IFileOperation の呼び出しから保留中の後続の操作はすべてキャンセルされる。


%index
IFileOperationProgressSink_PostCopyItem
各項目のコピー処理が完了した後に、呼び出し側が実装したアクションを実行する。
%prm
this, dwFlags, psiItem, psiDestinationFolder, pszNewName, hrCopy, psiNewlyCreated
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] 型: DWORD コピー操作中に使用されたフラグを含むビット値。コピー操作中に設定または変更され得る値もある。フラグの説明は TRANSFER_SOURCE_FLAGS を参照のこと。
psiItem : [comobj] 型: IShellItem* コピー元の項目を指定する IShellItem へのポインタ。
psiDestinationFolder : [comobj] 型: IShellItem* 項目のコピー先フォルダを指定する IShellItem へのポインタ。
pszNewName : [wstr] 型: LPCWSTR コピー後に項目に与えられた新しい名前へのポインタ。これは null 終端 Unicode 文字列である。名前衝突やその他の命名規則により、要求した名前とは異なる場合がある点に注意。
hrCopy : [intptr] 型: HRESULT コピー操作の戻り値。これは単にコピー操作をキューに入れるだけの CopyItem が返す HRESULT ではなく、実際のコピーの結果である点に注意。
psiNewlyCreated : [comobj] 型: IShellItem* 項目の新しいコピーを表す IShellItem へのポインタ。
%inst
各項目のコピー処理が完了した後に、呼び出し側が実装したアクションを実行する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外はエラー値を返す。エラー値の場合、IFileOperation
の呼び出しから保留中の後続の操作はすべてキャンセルされる。


%index
IFileOperationProgressSink_PreDeleteItem
各項目の削除処理が開始される前に、呼び出し側が実装したアクションを実行する。
%prm
this, dwFlags, psiItem
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] 型: DWORD 操作を制御するフラグを含むビット値。フラグの説明は TRANSFER_SOURCE_FLAGS を参照のこと。
psiItem : [comobj] 型: IShellItem* 削除対象の項目を指定する IShellItem へのポインタ。
%inst
各項目の削除処理が開始される前に、呼び出し側が実装したアクションを実行する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外はエラー値を返す。エラー値の場合、削除操作と IFileOperation
の呼び出しから保留中の後続の操作はすべてキャンセルされる。


%index
IFileOperationProgressSink_PostDeleteItem
各項目の削除処理が完了した後に、呼び出し側が実装したアクションを実行する。
%prm
this, dwFlags, psiItem, hrDelete, psiNewlyCreated
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] 型: DWORD 削除操作中に使用されたフラグを含むビット値。削除操作中に設定または変更され得る値もある。フラグの説明は TRANSFER_SOURCE_FLAGS を参照のこと。
psiItem : [comobj] 型: IShellItem* 削除された項目を指定する IShellItem へのポインタ。
hrDelete : [intptr] 型: HRESULT 削除操作の戻り値。これは単に削除操作をキューに入れるだけの DeleteItem が返す HRESULT ではなく、実際の削除の結果である点に注意。
psiNewlyCreated : [comobj] 型: IShellItem* ごみ箱に入った削除済み項目を指定する IShellItem へのポインタ。項目が完全に削除された場合、この値は NULL となる。
%inst
各項目の削除処理が完了した後に、呼び出し側が実装したアクションを実行する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外はエラー値を返す。エラー値の場合、IFileOperation
の呼び出しから保留中の後続の操作はすべてキャンセルされる。


%index
IFileOperationProgressSink_PreNewItem
新しい項目を作成する処理が開始される前に、呼び出し側が実装したアクションを実行する。
%prm
this, dwFlags, psiDestinationFolder, pszNewName
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] 型: DWORD 操作を制御するフラグを含むビット値。フラグの説明は TRANSFER_SOURCE_FLAGS を参照のこと。
psiDestinationFolder : [comobj] 型: IShellItem* 新しい項目を格納する移動先フォルダを指定する IShellItem へのポインタ。
pszNewName : [wstr] 型: LPCWSTR 新しい項目のファイル名 (例: Newfile.txt) へのポインタ。これは null 終端 Unicode 文字列である。
%inst
新しい項目を作成する処理が開始される前に、呼び出し側が実装したアクションを実行する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外はエラー値を返す。エラー値の場合、この操作と IFileOperation
の呼び出しから保留中の後続の操作はすべてキャンセルされる。


%index
IFileOperationProgressSink_PostNewItem
新しい項目が作成された後に、呼び出し側が実装したアクションを実行する。
%prm
this, dwFlags, psiDestinationFolder, pszNewName, pszTemplateName, dwFileAttributes, hrNew, psiNewItem
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
dwFlags : [int] 型: DWORD 作成操作中に使用されたフラグを含むビット値。作成操作中に設定または変更され得る値もある。フラグの説明は TRANSFER_SOURCE_FLAGS を参照のこと。
psiDestinationFolder : [comobj] 型: IShellItem* 新しい項目が追加された移動先フォルダを指定する IShellItem へのポインタ。
pszNewName : [wstr] 型: LPCWSTR 新しい項目のファイル名 (例: Newfile.txt) へのポインタ。これは null 終端 Unicode 文字列である。
pszTemplateName : [wstr] 型: LPCWSTR 新しい項目の元となるテンプレートファイルの名前 (例: Excel9.xls) へのポインタ。次のいずれかの場所に格納される。
dwFileAttributes : [int] 型: DWORD 新しい項目に適用されるファイル属性。GetFileAttributes にある値のうちの 1 つ以上。
hrNew : [intptr] 型: HRESULT 作成操作の戻り値。これは単に作成操作をキューに入れるだけの NewItem が返す HRESULT ではなく、実際の作成の結果である点に注意。
psiNewItem : [comobj] 型: IShellItem* 新しい項目を表す IShellItem へのポインタ。
%inst
新しい項目が作成された後に、呼び出し側が実装したアクションを実行する。

[戻り値]
型: HRESULT 成功した場合は S_OK を返し、それ以外はエラー値を返す。エラー値の場合、IFileOperation
の呼び出しから保留中の後続の操作はすべてキャンセルされる。


%index
IFileOperationProgressSink_UpdateProgress
全作業量に対して、現在までに完了した作業量の見積もりを提供する。
%prm
this, iWorkTotal, iWorkSoFar
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
iWorkTotal : [int] 型: UINT 完了すべき作業量の見積もり。
iWorkSoFar : [int] 型: UINT iWorkTotal のうち、これまでに完了した分。
%inst
全作業量に対して、現在までに完了した作業量の見積もりを提供する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
iWorkTotal および iWorkSoFar
の値は、完了すべき作業量と既に完了した量の「ポイント」または見積もりである。特定の単位で指定されるわけではないが、プロセス全体にかかる時間にほぼ比例するようにすべきである。例えば、小さなファイル
1 個のコピーを 2 ポイント、大きなファイルを 10 ポイントとみなすことができる。小さなファイル 5 個と大きなファイル 1
個をコピーするプロセスで、小さなファイルのうち 4 個を完了した場合、iWorkSoFar は 8 ポイント (4 × 2 =
8)、iWorkTotal は 20 ポイント (5 × 2 + 10 = 20) となり、見積もりは 20 ポイント中 8 ポイント
(40%) 完了となる。


%index
IFileOperationProgressSink_ResetTimer
サポートされていない。(IFileOperationProgressSink.ResetTimer)
%prm
this
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
%inst
サポートされていない。(IFileOperationProgressSink.ResetTimer)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
このメソッドは E_NOTIMPL ではなく S_OK を返すべきである。


%index
IFileOperationProgressSink_PauseTimer
サポートされていない。(IFileOperationProgressSink.PauseTimer)
%prm
this
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
%inst
サポートされていない。(IFileOperationProgressSink.PauseTimer)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
このメソッドは E_NOTIMPL ではなく S_OK を返すべきである。


%index
IFileOperationProgressSink_ResumeTimer
サポートされていない。(IFileOperationProgressSink.ResumeTimer)
%prm
this
this : [comobj] IFileOperationProgressSink インターフェースの COM オブジェクト変数
%inst
サポートされていない。(IFileOperationProgressSink.ResumeTimer)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
このメソッドは E_NOTIMPL ではなく S_OK を返すべきである。


%index
IFileSaveDialog_Show
IFileSaveDialog::Show (vtable slot 3)
%prm
this, hwndOwner
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
hwndOwner : [intptr] 
%inst


%index
IFileSaveDialog_SetFileTypes
IFileSaveDialog::SetFileTypes (vtable slot 4)
%prm
this, cFileTypes, rgFilterSpec
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
cFileTypes : [int] 
rgFilterSpec : [var] 
%inst


%index
IFileSaveDialog_SetFileTypeIndex
IFileSaveDialog::SetFileTypeIndex (vtable slot 5)
%prm
this, iFileType
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
iFileType : [int] 
%inst


%index
IFileSaveDialog_GetFileTypeIndex
IFileSaveDialog::GetFileTypeIndex (vtable slot 6)
%prm
this, piFileType
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
piFileType : [int] 
%inst


%index
IFileSaveDialog_Advise
IFileSaveDialog::Advise (vtable slot 7)
%prm
this, pfde, pdwCookie
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pfde : [comobj] 
pdwCookie : [int] 
%inst


%index
IFileSaveDialog_Unadvise
IFileSaveDialog::Unadvise (vtable slot 8)
%prm
this, dwCookie
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
dwCookie : [int] 
%inst


%index
IFileSaveDialog_SetOptions
IFileSaveDialog::SetOptions (vtable slot 9)
%prm
this, fos
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
fos : [int] 
%inst


%index
IFileSaveDialog_GetOptions
IFileSaveDialog::GetOptions (vtable slot 10)
%prm
this, pfos
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pfos : [var] 
%inst


%index
IFileSaveDialog_SetDefaultFolder
IFileSaveDialog::SetDefaultFolder (vtable slot 11)
%prm
this, psi
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
psi : [comobj] 
%inst


%index
IFileSaveDialog_SetFolder
IFileSaveDialog::SetFolder (vtable slot 12)
%prm
this, psi
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
psi : [comobj] 
%inst


%index
IFileSaveDialog_GetFolder
IFileSaveDialog::GetFolder (vtable slot 13)
%prm
this, ppsi
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 
%inst


%index
IFileSaveDialog_GetCurrentSelection
IFileSaveDialog::GetCurrentSelection (vtable slot 14)
%prm
this, ppsi
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 
%inst


%index
IFileSaveDialog_SetFileName
IFileSaveDialog::SetFileName (vtable slot 15)
%prm
this, pszName
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pszName : [wstr] 
%inst


%index
IFileSaveDialog_GetFileName
IFileSaveDialog::GetFileName (vtable slot 16)
%prm
this, pszName
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pszName : [var] 
%inst


%index
IFileSaveDialog_SetTitle
IFileSaveDialog::SetTitle (vtable slot 17)
%prm
this, pszTitle
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pszTitle : [wstr] 
%inst


%index
IFileSaveDialog_SetOkButtonLabel
IFileSaveDialog::SetOkButtonLabel (vtable slot 18)
%prm
this, pszText
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pszText : [wstr] 
%inst


%index
IFileSaveDialog_SetFileNameLabel
IFileSaveDialog::SetFileNameLabel (vtable slot 19)
%prm
this, pszLabel
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pszLabel : [wstr] 
%inst


%index
IFileSaveDialog_GetResult
IFileSaveDialog::GetResult (vtable slot 20)
%prm
this, ppsi
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
ppsi : [comobj] 
%inst


%index
IFileSaveDialog_AddPlace
IFileSaveDialog::AddPlace (vtable slot 21)
%prm
this, psi, fdap
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
psi : [comobj] 
fdap : [int] 
%inst


%index
IFileSaveDialog_SetDefaultExtension
IFileSaveDialog::SetDefaultExtension (vtable slot 22)
%prm
this, pszDefaultExtension
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pszDefaultExtension : [wstr] 
%inst


%index
IFileSaveDialog_Close
IFileSaveDialog::Close (vtable slot 23)
%prm
this, hr
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
hr : [intptr] 
%inst


%index
IFileSaveDialog_SetClientGuid
IFileSaveDialog::SetClientGuid (vtable slot 24)
%prm
this, guid
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
guid : [var] 
%inst


%index
IFileSaveDialog_ClearClientData
IFileSaveDialog::ClearClientData (vtable slot 25)
%prm
this
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
%inst


%index
IFileSaveDialog_SetFilter
IFileSaveDialog::SetFilter (vtable slot 26)
%prm
this, pFilter
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pFilter : [comobj] 
%inst


%index
IFileSaveDialog_SetSaveAsItem
名前を付けて保存ダイアログで最初のエントリーとして使用されるアイテムを設定する。
%prm
this, psi
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* アイテムを表す IShellItem へのポインター。
%inst
名前を付けて保存ダイアログで最初のエントリーとして使用されるアイテムを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

アイテムの名前がファイル名編集ボックスに表示され、それを含むフォルダーがビューで開かれる。これは一般に、アプリケーションが既に存在するアイテムを保存する際に使用する。新規アイテムの場合は
IFileDialog::SetFileName を使用する。


%index
IFileSaveDialog_SetProperties
保存されるアイテムに使用される既定値を定義するプロパティストアを提供する。
%prm
this, pStore
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pStore : [comobj] 型: IPropertyStore* 関連するメタデータを含むプロパティストアを表すインターフェースへのポインター。
%inst
保存されるアイテムに使用される既定値を定義するプロパティストアを提供する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このメソッドはダイアログを開く前、および表示中ならいつでも呼び出せる。アイテムに固有のプロパティがある場合、ダイアログを表示する前にそれらのプロパティを渡してこのメソッドを呼び出すべきである。名前を付けて保存を使用する際、アプリケーションは保存するアイテムのプロパティをセーブダイアログに提供すべきである。これらのプロパティは、元のアイテムから
GPS_HANDLERPROPERTIESONLY フラグを指定して GetPropertyStore
を呼び出すことで取得する。ダイアログが閉じられた後に保存済みアイテムのプロパティ（ユーザーによって変更されている可能性がある）を取得するには、IFileSaveDialog::GetProperties
を呼び出す。プロパティ収集を有効にし、セーブダイアログに表示するプロパティを指示するには
IFileSaveDialog::SetCollectedProperties を使用する。


%index
IFileSaveDialog_SetCollectedProperties
セーブダイアログで収集されるプロパティを指定する。
%prm
this, pList, fAppendDefault
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
pList : [comobj] 型: IPropertyDescriptionList* 収集するプロパティのリストを表すインターフェースへのポインター。このパラメーターは NULL でもよい。
fAppendDefault : [int] 型: BOOL pList で指定されたプロパティに加えて、現在選択中のファイルタイプの既定プロパティを表示する場合は TRUE。pList で指定されたプロパティのみを表示する場合は FALSE。
%inst
セーブダイアログで収集されるプロパティを指定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
呼び出し側アプリケーションは PSGetPropertyDescriptionListFromString
関数を使って「prop:Comments;Subject;」のような文字列から IPropertyDescriptionList
を構築できる。プロパティスキーマの詳細については Property Schemas
を参照。IFileSaveDialog::SetCollectedProperties
はダイアログが表示される前、および表示中ならいつでも呼び出せる。選択されたファイルタイプに応じて異なるプロパティを収集したい場合は、OnTypeChange
に応じて IFileSaveDialog::SetCollectedProperties を呼び出せる。注意
既定では、セーブダイアログでプロパティは収集されない。


%index
IFileSaveDialog_GetProperties
保存済みアイテムまたは保存処理中のアイテムのプロパティ値のセットを取得する。
%prm
this, ppStore
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
ppStore : [comobj] 型: IPropertyStore** プロパティ値を受け取る IPropertyStore へのポインターのアドレス。
%inst
保存済みアイテムまたは保存処理中のアイテムのプロパティ値のセットを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このメソッドはダイアログ表示中に呼び出して、メタデータ収集ペインの現在の値のセットを取得できる。ダイアログが閉じられた後にも呼び出して最終的な値のセットを取得できる。IFileSaveDialog::SetCollectedProperties
の呼び出しによってプロパティ収集が有効化されていない限り、このメソッドの呼び出しは失敗する。


%index
IFileSaveDialog_ApplyProperties
シェルのコピーエンジンを使って一連のプロパティをアイテムに適用する。
%prm
this, psi, pStore, hwnd, pSink
this : [comobj] IFileSaveDialog インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* 保存されるファイルを表す IShellItem へのポインター。通常これは GetResult で取得したアイテムである。
pStore : [comobj] 型: IPropertyStore* ファイルに適用されるプロパティ値を表す IPropertyStore へのポインター。これは IFileSaveDialog::GetProperties が返したプロパティストアでもよい。
hwnd : [intptr] 型: HWND アプリケーションウィンドウのハンドル。
pSink : [comobj] 型: IFileOperationProgressSink* 呼び出し側アプリケーションがプロパティの書き込み進捗の通知を受けたい場合に使用できる任意の IFileOperationProgressSink へのポインター。この値は NULL でもよい。
%inst
シェルのコピーエンジンを使って一連のプロパティをアイテムに適用する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このメソッドは、アプリケーションがプロパティ収集を有効にしている（IFileSaveDialog::SetCollectedProperties）が、プロパティ自体を保存済みファイルに永続化していない場合に使用すべきである。注意
psi で指定したアイテムが表すファイルは、IFileSaveDialog::ApplyProperties
の呼び出し前に物理ストレージ上に存在していなければならない。つまり事前にどこかで保存されている必要がある。


%index
IModalWindow_Show
モーダルウィンドウを起動する。
%prm
this, hwndOwner
this : [comobj] IModalWindow インターフェースの COM オブジェクト変数
hwndOwner : [intptr] 型: HWND オーナーウィンドウのハンドル。この値は NULL でもよい。
%inst
モーダルウィンドウを起動する。

[戻り値]
型: HRESULT メソッドが成功した場合 S_OK を返す。そうでなければ以下を含む HRESULT エラーコードを返す。
（以下省略）


%index
IMoniker_GetClassID
IMoniker::GetClassID (vtable slot 3)
%prm
this, pClassID
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pClassID : [var] 
%inst


%index
IMoniker_IsDirty
IMoniker::IsDirty (vtable slot 4)
%prm
this
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
%inst


%index
IMoniker_Load
IMoniker::Load (vtable slot 5)
%prm
this, pStm
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pStm : [comobj] 
%inst


%index
IMoniker_Save
IMoniker::Save (vtable slot 6)
%prm
this, pStm, fClearDirty
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pStm : [comobj] 
fClearDirty : [int] 
%inst


%index
IMoniker_GetSizeMax
IMoniker::GetSizeMax (vtable slot 7)
%prm
this, pcbSize
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pcbSize : [int64] 
%inst


%index
IMoniker_BindToObject
指定したオブジェクトにバインドする。バインド処理では、オブジェクトを検索し、必要であれば実行状態に遷移させ、識別されたオブジェクトの指定インターフェースへのポインタを呼び出し側に提供する。
%prm
this, pbc, pmkToLeft, riidResult, ppvResult
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] このバインド操作で使用するバインドコンテキストオブジェクトの IBindCtx インターフェースへのポインタ。バインドコンテキストは、バインド処理中にバインドされたオブジェクトをキャッシュし、バインドコンテキストを使用するすべての操作に適用されるパラメータを含み、モニカー実装がその環境について情報を取得するための手段を提供する。
pmkToLeft : [comobj] モニカーが複合モニカーの一部である場合、このモニカーの左側にあるモニカーへのポインタ。このパラメータは主にモニカー実装者が複合モニカーの各構成要素間の連携を可能にするために使用する。モニカークライアントは NULL を指定すべきである。
riidResult : [var] クライアントがモニカーの識別するオブジェクトとの通信に使用したいインターフェースの IID。
ppvResult : [int] riid で要求されたインターフェースポインタを受け取るポインタ変数のアドレス。呼び出しが成功すると、*ppvResult にはモニカーが識別するオブジェクトに対する要求インターフェースポインタが格納される。成功時、実装はモニカーに対して AddRef を呼び出さなければならない。呼び出し側は Release を呼び出す責任がある。エラーが発生した場合、*ppvResult は NULL であるべきである。
%inst

指定したオブジェクトにバインドする。バインド処理では、オブジェクトを検索し、必要であれば実行状態に遷移させ、識別されたオブジェクトの指定インターフェースへのポインタを呼び出し側に提供する。

[戻り値]
このメソッドは、標準の戻り値 E_OUTOFMEMORY および E_UNEXPECTED のほか、以下の値を返す場合がある。
（以下省略）

[備考]
BindToObject
はモニカーの主機能を実装する。すなわち、モニカーが識別するオブジェクトを特定し、そのインターフェースのいずれかへのポインタを返す。呼び出し側への注意:
モニカーを 2 つのオブジェクト間の永続的な接続として使用している場合は、BindToObject
を呼び出すことで接続をアクティブ化する。通常は以下のプロセスで BindToObject を呼び出す。
（以下省略）


%index
IMoniker_BindToStorage
指定したオブジェクトのストレージにバインドする。IMoniker::BindToObject メソッドとは異なり、このメソッドはモニカーが識別するオブジェクトをアクティブ化しない。
%prm
this, pbc, pmkToLeft, riid, ppvObj
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] このバインド操作で使用するバインドコンテキストオブジェクトの IBindCtx インターフェースへのポインタ。バインドコンテキストは、バインド処理中にバインドされたオブジェクトをキャッシュし、バインドコンテキストを使用するすべての操作に適用されるパラメータを含み、モニカー実装がその環境について情報を取得するための手段を提供する。
pmkToLeft : [comobj] モニカーが複合モニカーの一部である場合、このモニカーの左側にあるモニカーへのポインタ。このパラメータは主にモニカー実装者が複合モニカーの各構成要素間の連携を可能にするために使用する。モニカークライアントは NULL を指定すべきである。
riid : [var] 要求するストレージインターフェースの識別子への参照であり、ppvObj に返されるポインタの型となる。一般的に要求されるストレージインターフェースには IStorage、IStream、および ILockBytes がある。
ppvObj : [int] riid で要求されたインターフェースポインタを受け取るポインタ変数のアドレス。呼び出しが成功すると、*ppvObj にはモニカーが識別するオブジェクトのストレージに対する要求インターフェースポインタが格納される。成功時、実装はストレージに対して AddRef を呼び出さなければならない。呼び出し側は Release を呼び出す責任がある。エラーが発生した場合、*ppvObj は NULL であるべきである。
%inst
指定したオブジェクトのストレージにバインドする。IMoniker::BindToObject
メソッドとは異なり、このメソッドはモニカーが識別するオブジェクトをアクティブ化しない。

[戻り値]
このメソッドは、標準の戻り値 E_UNEXPECTED のほか、以下の値を返す場合がある。
（以下省略）

[備考]
BindToObject と BindToStorage
の間には重要な違いがある。例えば、スプレッドシートオブジェクトを識別するモニカーがある場合、BindToObject
を呼び出すとスプレッドシートオブジェクト自体にアクセスできるが、BindToStorage
を呼び出すとスプレッドシートが置かれているストレージオブジェクトにアクセスできる。呼び出し側への注意: COM
のモニカークラスのいずれもバインド処理でこのメソッドを呼び出さないが、新しいモニカークラスの実装ではこれを呼び出すことが適切な場合がある。pmkToLeft
パラメータで識別されるオブジェクトからの情報を必要とし、アクティブ化せずにそのオブジェクトの永続ストレージから取得できる場合、BindToObject
の実装内で本メソッドを呼び出すことができる。例えば、コンテナをアクティブ化せずにアクティブ化できるオブジェクトを識別するモニカーであれば、このメソッドが有用である。識別するオブジェクトのストレージを読み取れるクライアントもこのメソッドを呼び出せる。実装者への注意:
実装は現在のモニカーが識別するオブジェクトの永続ストレージを特定し、目的のインターフェースポインタを返すべきである。モニカーの種類によっては擬似オブジェクト
(自身の永続ストレージを持たず、コンテナの内部状態の一部を成すオブジェクト。例: スプレッドシート内のセル範囲)
を表す。このような種類のオブジェクトをモニカークラスが識別する場合、BindToStorage の実装は MK_E_NOSTORAGE
エラーを返すべきである。バインドコンテキストの BIND_OPTS 構造体に BINDFLAGS_JUSTTESTEXISTENCE
フラグが指定されている場合、実装は ppvObj に NULL を返すこともできる
(ただし、フラグを無視して完全なバインド操作を実行してもよい)。実装固有の注意:
（以下省略）


%index
IMoniker_Reduce
モニカーを最も単純な形式に簡約する。
%prm
this, pbc, dwReduceHowFar, ppmkToLeft, ppmkReduced
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] このバインド操作で使用するバインドコンテキストの IBindCtx インターフェースへのポインタ。バインドコンテキストは、バインド処理中にバインドされたオブジェクトをキャッシュし、バインドコンテキストを使用するすべての操作に適用されるパラメータを含み、モニカー実装がその環境について情報を取得するための手段を提供する。
dwReduceHowFar : [int] このモニカーをどこまで簡約するかを指定する。このパラメータは MKRREDUCE 列挙型の値のいずれかでなければならない。
ppmkToLeft : [comobj] 入力時、このモニカーの左側にあるモニカーへのインターフェースポインタを保持する IMoniker ポインタ変数へのポインタ。このパラメータは主にモニカー実装者が複合モニカーの各構成要素間の連携を可能にするために使用する。モニカークライアントは通常 NULL を渡せばよい。戻り時、*ppmkToLeft は通常 NULL に設定され、元の左側モニカーに変更がないことを示す。まれに、*ppmkToLeft がモニカーを示し、元の左側モニカーを破棄し、*ppmkToLeft から返されるモニカーが置き換えとなることを示す。このような状況では、実装はこのモニカーの左側にあった古いモニカーに対して Release を呼び出さなければならず、返される新しいモニカーに対して AddRef を呼び出さなければならない。呼び出し側は後でそれを解放しなければならない。エラーが発生した場合、実装はインターフェースポインタを変更しないままにするか、NULL に設定できる。
ppmkReduced : [comobj] このモニカーの簡約形へのインターフェースポインタを受け取る IMoniker ポインタ変数へのポインタ。エラー発生時やモニカーが何もない状態まで簡約された場合は NULL になり得る。このモニカーが簡約できない場合、*ppmkReduced は単にこのモニカーに設定され、戻り値は MK_S_REDUCED_TO_SELF となる。*ppmkReduced が非 NULL の場合、実装は新しいモニカーに対して AddRef を呼び出さなければならない。呼び出し側は Release を呼び出す責任がある。(これは *ppmkReduced がこのモニカー自体に設定されている場合でも同様である。)
%inst
モニカーを最も単純な形式に簡約する。

[戻り値]
このメソッドは、標準の戻り値 E_OUTOFMEMORY および E_UNEXPECTED のほか、以下の値を返す場合がある。
（以下省略）

[備考]
このメソッドは次の用途のために用意されている。
（以下省略）


%index
IMoniker_ComposeWith
現在のモニカーと指定したモニカーを結合して、新しい複合モニカーを作成する。
%prm
this, pmkRight, fOnlyIfNotGeneric, ppmkComposite
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pmkRight : [comobj] このモニカーの末尾に合成するモニカーの IMoniker インターフェースへのポインタ。
fOnlyIfNotGeneric : [int] TRUE の場合、呼び出し側は非汎用合成を要求しており、pmkRight が汎用複合以外の方法でこのモニカーと合成できるモニカークラスの場合にのみ操作を続行すべきである。FALSE の場合、必要であれば汎用複合を作成できる。多くの呼び出し側はこのパラメータに FALSE を指定すべきである。
ppmkComposite : [comobj] 複合モニカーポインタを受け取る IMoniker ポインタ変数へのポインタ。成功時、実装は結果のモニカーに対して AddRef を呼び出さなければならない。呼び出し側は Release を呼び出す責任がある。エラーが発生した場合、またはモニカー同士の合成結果が何もない場合 (例えば、アンチモニカーを項目モニカーやファイルモニカーと合成する場合)、*ppmkComposite は NULL に設定すべきである。
%inst
現在のモニカーと指定したモニカーを結合して、新しい複合モニカーを作成する。

[戻り値]
このメソッドは、標準の戻り値 E_OUTOFMEMORY および E_UNEXPECTED のほか、以下の値を返す場合がある。
（以下省略）

[備考]
2 つのモニカーを結合することを合成と呼ぶ。同じクラスの 2
つのモニカーは、非汎用合成と呼ばれる方法で結合できることがある。例えば、不完全なパスを表すファイルモニカーと相対パスを表すファイルモニカーを結合し、完全なパスを表す単一のファイルモニカーを形成できる。特定のモニカークラスに対する非汎用合成は、そのクラスの
ComposeWith の実装でのみ処理できる。クラスを問わず 2
つのモニカーを結合することを汎用合成と呼び、CreateGenericComposite
関数の呼び出しで実現できる。モニカーの合成は結合則が成り立つ。すなわち、A、B、C がモニカーのとき、Comp()
を合成操作として、Comp( Comp( A, B ), C ) は常に Comp( A, Comp( B, C ) )
と等しい。呼び出し側への注意: 2
つのモニカーを結合するには、最初のモニカーに非汎用合成を行う機会を与えるため、CreateGenericComposite 関数ではなく
ComposeWith
を呼び出すべきである。項目モニカーを用いて自身のオブジェクトを識別するオブジェクトは、そのオブジェクトの位置を完全に識別するモニカーを提供するため
ComposeWith
を呼び出すだろう。これは、例えば、ドキュメントの一部へのリンクをサポートするサーバや、ドキュメント内の埋め込みオブジェクトへのリンクをサポートするコンテナに適用される。このような状況では、次のようにする。
（以下省略）


%index
IMoniker_Enum
複合モニカーのコンポーネント用の列挙子へのポインタを取得する。
%prm
this, fForward, ppenumMoniker
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
fForward : [int] TRUE の場合、モニカーを左から右へ列挙する。FALSE の場合は右から左へ列挙する。
ppenumMoniker : [comobj] モニカーの列挙子オブジェクトへのインターフェースポインタを受け取る IEnumMoniker ポインタ変数へのポインタ。成功時、実装は列挙子オブジェクトに対して AddRef を呼び出さなければならない。呼び出し側は Release を呼び出す責任がある。エラーが発生した場合、またはモニカーに列挙可能なコンポーネントが存在しない場合、実装は *ppenumMoniker を NULL に設定する。
%inst
複合モニカーのコンポーネント用の列挙子へのポインタを取得する。

[戻り値]
このメソッドは、標準の戻り値 E_OUTOFMEMORY、E_UNEXPECTED、および S_OK を返す場合がある。

[備考]
このメソッドは、モニカーのコンポーネントを列挙できる列挙子への IEnumMoniker
ポインタを提供しなければならない。例えば、汎用複合モニカーに対する IMoniker::Enum
メソッドの実装は、その複合を構成する個々のモニカーを判別できる列挙子を作成する。一方、ファイルモニカーに対する
IMoniker::Enum メソッドは、パス内の各コンポーネントを表すモニカーを返す列挙子を作成する。呼び出し側への注意:
複合モニカーを構成するコンポーネントを調べるためにこのメソッドを呼び出す。実装者への注意:
新しいモニカークラスに判別可能な内部構造がない場合、このメソッドの実装では単に S_OK を返し ppenumMoniker を NULL
に設定すればよい。実装固有の注意:
（以下省略）


%index
IMoniker_IsEqual
このモニカーが指定したモニカーと同一かどうかを判定する。
%prm
this, pmkOtherMoniker
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pmkOtherMoniker : [comobj] 比較対象となるモニカー (このメソッドが呼び出されるモニカーと比較されるもの) の IMoniker インターフェースへのポインタ。
%inst
このモニカーが指定したモニカーと同一かどうかを判定する。

[戻り値]
このメソッドは、2 つのモニカーが同一であることを示すために S_OK を返し、それ以外は S_FALSE を返す。

[備考]
以前の実行中オブジェクトテーブル (ROT) の実装はこのメソッドを呼び出していた。現在の ROT の実装は代わりに IROTData
インターフェースを使用する。呼び出し側への注意: 2
つのモニカーが同一かどうかを判定するためにこのメソッドを呼び出す。モニカーの簡約形は非簡約形とは異なるものとみなされる。簡約モニカーは最も具体的な形であるため、IsEqual
を呼び出す前に IMoniker::Reduce メソッドを呼び出すべきである。IsEqual は、2 つのモニカーが簡約前には
S_FALSE を返し、簡約後には S_OK を返すことがある。実装者への注意:
実装は比較を行う前に現在のモニカーを簡約すべきではない。簡約済みモニカーを比較するために IMoniker::Reduce
を呼び出すのは呼び出し側の責任である。等しいと比較される 2 つのモニカーは IMoniker::Hash
で同じ値にハッシュされなければならない。実装固有の注意:
（以下省略）


%index
IMoniker_Hash
モニカーの内部状態を用いてハッシュ値を作成する。
%prm
this, pdwHash
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pdwHash : [int] ハッシュ値を受け取る変数へのポインタ。
%inst
モニカーの内部状態を用いてハッシュ値を作成する。

[戻り値]
ハッシュ値が正常に取得できたことを示すため、このメソッドは S_OK を返す。

[備考]
呼び出し側への注意:
このメソッドが返す値を使用してモニカーのハッシュテーブルを保守できる。ハッシュ値はテーブル内のハッシュバケットを決定する。このようなテーブルから指定のモニカーを検索するには、そのハッシュ値を計算し、そのハッシュバケット内のモニカーと
IMoniker::IsEqual で比較する。実装者への注意:
ハッシュ値はモニカーの生存期間中一定でなければならない。IMoniker::IsEqual で等しいと比較される 2
つのモニカーは同じ値にハッシュされなければならない。モニカーをマーシャリングしアンマーシャリングしても、そのハッシュ値に影響があってはならない。したがって、IMoniker::Hash
の実装は、モニカーのメモリアドレスではなく内部状態のみに依存すべきである。実装固有の注意:
（以下省略）


%index
IMoniker_IsRunning
このモニカーが識別するオブジェクトが現在ロードされ実行中かどうかを判定する。
%prm
this, pbc, pmkToLeft, pmkNewlyRunning
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] このバインド操作で使用するバインドコンテキストの IBindCtx インターフェースへのポインタ。バインドコンテキストは、バインド処理中にバインドされたオブジェクトをキャッシュし、バインドコンテキストを使用するすべての操作に適用されるパラメータを含み、モニカー実装がその環境について情報を取得するための手段を提供する。
pmkToLeft : [comobj] このモニカーが複合の一部である場合、このモニカーの左側にあるモニカーの IMoniker インターフェースへのポインタ。このパラメータは主にモニカー実装者が複合モニカーの各構成要素間の連携を可能にするために使用する。モニカークライアントは通常 NULL を渡せばよい。
pmkNewlyRunning : [comobj] 実行中オブジェクトテーブル (ROT) に最後に追加されたモニカーの IMoniker インターフェースへのポインタ。NULL でもよい。非 NULL の場合、実装は pmkNewlyRunning に対して現在のモニカーを渡して IMoniker::IsEqual を呼び出した結果を返すことができる。このパラメータは、単に ROT を検索するよりも効率的な IsRunning の実装を可能にするために用意されているが、実装は害なく pmkNewlyRunning を無視することを選べる。
%inst
このモニカーが識別するオブジェクトが現在ロードされ実行中かどうかを判定する。

[戻り値]
このメソッドは、標準の戻り値 E_UNEXPECTED のほか、以下の値を返す場合がある。
（以下省略）

[備考]
呼び出し側への注意:
モニカーが識別するオブジェクトからサービスを要求する際に速度が重要な場合、オブジェクトが既に実行中である場合にのみそれらのサービスを必要とすることがある
(オブジェクトを実行状態にロードすることは時間がかかる可能性があるため)。このような状況では、IsRunning
を呼び出してオブジェクトが実行中かどうかを判定すべきである。リンクオブジェクト内に保存されたモニカーの場合、IsRunning
は主に既定ハンドラの IOleLink::BindIfRunning の実装から呼び出される。実装者への注意: ROT
へのポインタを取得するには、実装は pbc パラメータに対して IBindCtx::GetRunningObjectTable
を呼び出すべきである。その後、IRunningObjectTable::IsRunning
を呼び出して、モニカーが識別するオブジェクトが実行中かどうかを判定できる。モニカーが識別するオブジェクトは、実行開始時に ROT
に自身を登録している必要がある。実装固有の注意:
（以下省略）


%index
IMoniker_GetTimeOfLastChange
このモニカーが識別するオブジェクトが最後に変更された時刻を取得する。
%prm
this, pbc, pmkToLeft, pFileTime
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] このバインド操作で使用するバインドコンテキストへのポインタ。バインドコンテキストは、バインド処理中にバインドされたオブジェクトをキャッシュし、バインドコンテキストを使用するすべての操作に適用されるパラメータを含み、モニカー実装がその環境について情報を取得するための手段を提供する。詳細は IBindCtx を参照のこと。
pmkToLeft : [comobj] モニカーが複合モニカーの一部である場合、このモニカーの左側にあるモニカーへのポインタ。このパラメータは主にモニカー実装者が複合モニカーの各構成要素間の連携を可能にするために使用する。モニカークライアントは NULL を渡すべきである。
pFileTime : [var] 最終変更時刻を受け取る FILETIME 構造体へのポインタ。{0xFFFFFFFF,0x7FFFFFFF} という値はエラーを示す (例えば、時間制限を超過した、情報が利用できない、など)。
%inst
このモニカーが識別するオブジェクトが最後に変更された時刻を取得する。

[戻り値]
このメソッドは、標準の戻り値 E_OUTOFMEMORY のほか、以下の値を返す場合がある。
（以下省略）

[備考]
正確には、返される時刻はそれ以降変更がないことを COM
が確認できる最も早い時刻であり、したがってオブジェクトの実際の最終変更時刻よりも後になる場合がある。呼び出し側への注意:
モニカーが識別するオブジェクトから返された情報をキャッシュしている場合、その情報が最新であることを確認したくなるだろう。そのためには、GetTimeOfLastChange
を呼び出し、返された時刻と最後にオブジェクトから情報を取得した時刻を比較すればよい。
リンクオブジェクト内に保存されたモニカーの場合、GetTimeOfLastChange は主に既定ハンドラの
IOleObject::IsUpToDate の実装から呼び出される。コンテナアプリケーションは
IOleObject::IsUpToDate を呼び出して、リンクオブジェクト (またはリンクオブジェクトを含む埋め込みオブジェクト)
が実際にバインドすることなく最新かどうかを判定する。これにより、ユーザーがドキュメントを開いた際に、どのリンクオブジェクトを更新する必要があるかを素早く判定できる。アプリケーションはドキュメント内のすべてのリンクオブジェクトをバインドする代わりに、更新が必要なもののみ
(ユーザーに確認した上で) バインドできる。実装者への注意:
リンクオブジェクトの場合、このメソッドはユーザーが複合ドキュメントを最初に開く際に呼び出されるため、この操作を素早く実行することが重要である。したがって、GetTimeOfLastChange
の実装はオブジェクトにバインドすべきではない。加えて、実装はバインドコンテキスト内のデッドラインパラメータをチェックし、指定時間までに操作を完了できない場合は
MK_E_EXCEEDEDDEADLINE を返すべきである。以下は実装で使用できる戦略の例である。
（以下省略）


%index
IMoniker_Inverse
このモニカーの逆となるモニカーを作成する。このモニカーまたは類似構造のモニカーの右側に合成すると、モニカーは何もない状態に合成される。
%prm
this, ppmk
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
ppmk : [comobj] このモニカーの逆となるモニカーへのインターフェースポインタを受け取る IMoniker ポインタ変数のアドレス。成功時、実装は新しい逆モニカーに対して AddRef を呼び出さなければならない。呼び出し側は Release を呼び出す責任がある。エラーが発生した場合、実装は *ppmk を NULL に設定すべきである。
%inst
このモニカーの逆となるモニカーを作成する。このモニカーまたは類似構造のモニカーの右側に合成すると、モニカーは何もない状態に合成される。

[戻り値]
このメソッドは、標準の戻り値 E_OUTOFMEMORY のほか、以下の値を返す場合がある。
（以下省略）

[備考]
モニカーの逆は、MS-DOS ファイルシステムの ".." ディレクトリに類似している。".."
ディレクトリは他の任意のディレクトリ名の逆として機能する。ディレクトリ名に ".."
を追加すると空のパスになるからである。同様に、モニカーの逆は通常は同じクラスのすべてのモニカーの逆でもある。ただし、異なるクラスのモニカーの逆であるとは限らない。複合モニカーの逆は、元のモニカーのコンポーネントの逆を逆順に並べた複合である。例えば、A
の逆を Inv( A )、A、B、C の複合を Comp( A, B, C ) とすると、Inv( Comp( A, B, C ) ) は
Comp( Inv( C ), Inv( B ), Inv( A ) )
と等しい。すべてのモニカーに逆があるわけではない。アンチモニカーなど、それ自体が逆であるモニカーの多くは逆を持たない。逆を持たないモニカーでは、それが識別するオブジェクトの内側から外側の他のオブジェクトへの相対モニカーを形成できない。呼び出し側への注意:
モニカーを使用して別のオブジェクトを特定しているオブジェクトは、通常、自身が使用しているモニカーのクラスを知らない。モニカーの逆を取得するには、使用中のモニカーがアンチモニカーを自身の逆と見なしているかどうか確信が持てないため、CreateAntiMoniker
関数ではなく常に IMoniker::Inverse を呼び出すべきである。
Inverse メソッドは、相対モニカーの構築を助けるため、IMoniker::RelativePathTo
メソッドの実装からも呼び出される。実装者への注意: モニカーに内部構造がない場合、IMoniker::Inverse
の実装内でアンチモニカーを取得するために CreateAntiMoniker
関数を呼び出すことができる。IMoniker::ComposeWith の実装では、Inverse
の実装で提供した逆をチェックする必要がある。実装固有の注意:
（以下省略）


%index
IMoniker_CommonPrefixWith
このモニカーが指定したモニカーと共有する接頭部に基づいて、新しいモニカーを作成する。
%prm
this, pmkOther, ppmkPrefix
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pmkOther : [comobj] このモニカーと比較して共通の接頭部があるかを判定するための、別のモニカーの IMoniker インターフェースへのポインタ。
ppmkPrefix : [comobj] このモニカーと pmkOther の共通接頭部となるモニカーへのインターフェースポインタを受け取る IMoniker* ポインタ変数のアドレス。成功時、実装は結果のモニカーに対して AddRef を呼び出さなければならない。呼び出し側は Release を呼び出す責任がある。エラーが発生した場合、または共通接頭部が存在しない場合は、実装は *ppmkPrefix を NULL に設定すべきである。
%inst
このモニカーが指定したモニカーと共有する接頭部に基づいて、新しいモニカーを作成する。

[戻り値]
このメソッドは、標準の戻り値 E_OUTOFMEMORY のほか、以下の値を返す場合がある。
（以下省略）

[備考]
CommonPrefixWith
は、このモニカーオブジェクトのモニカーと別のモニカーの共通接頭部からなる新しいモニカーを作成する。例えば、一方のモニカーがパス
"c:\projects\secret\art\pict1.bmp" を表し、他方が
"c:\projects\secret\docs\chap1.txt" を表す場合、これら 2 つのモニカーの共通接頭部は
"c:\projects\secret" を表すモニカーとなる。呼び出し側への注意: CommonPrefixWith メソッドは主に
IMoniker::RelativePathTo
メソッドの実装で呼び出される。モニカーを使用してオブジェクトを特定するクライアントがこのメソッドを呼び出す必要はほとんどない。
このメソッドは、pmkOther
とこのモニカーの両方が絶対モニカーである場合にのみ呼び出すこと。絶対モニカーとは、ファイルモニカー、または最左コンポーネントが絶対パスを表すファイルモニカーである汎用複合モニカーのことである。相対モニカーに対しては意味のある結果が得られないため、本メソッドを呼び出してはならない。実装者への注意:
実装はまず、pmkOther が自分が認識しており特別な処理を提供できるクラス (例えばこのモニカーと同じクラスの場合)
のモニカーかどうかを判定すべきである。そうであれば、2 つのモニカーの共通接頭部を判定すべきである。そうでなければ、両方のモニカーを
MonikerCommonPrefixWith 関数に渡すべきであり、これは汎用ケースを正しく処理する。
実装固有の注意:
（以下省略）


%index
IMoniker_RelativePathTo
このモニカーと指定したモニカーの間の相対モニカーを作成する。
%prm
this, pmkOther, ppmkRelPath
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pmkOther : [comobj] 相対パスを取る対象となるモニカーの IMoniker インターフェースへのポインタ。
ppmkRelPath : [comobj] 相対モニカーへのインターフェースポインタを受け取る IMoniker ポインタ変数へのポインタ。成功時、実装は新しいモニカーに対して AddRef を呼び出さなければならない。呼び出し側は Release を呼び出す責任がある。エラーが発生した場合、実装は *ppmkRelPath を NULL に設定する。
%inst
このモニカーと指定したモニカーの間の相対モニカーを作成する。

[戻り値]
このメソッドは、標準の戻り値 E_OUTOFMEMORY および E_UNEXPECTED のほか、以下の値を返す場合がある。
（以下省略）

[備考]
相対モニカーは相対パス ("..\backup" など) に類似している。例えば、あるモニカーがパス
"c:\projects\secret\art\pict1.bmp" を表し、別のモニカーが
"c:\projects\secret\docs\chap1.txt" を表すとする。最初のモニカーに対して RelativePathTo
を呼び出し、2 番目のモニカーを pmkOther パラメータとして渡すと、パス "..\docs\chap1.txt"
を表す相対モニカーが作成される。呼び出し側への注意: モニカークライアントは通常 RelativePathTo
を呼び出す必要はない。このメソッドは主にリンクオブジェクト用の既定ハンドラから呼び出される。リンクオブジェクトは、リンクソースを識別するために絶対モニカーと相対モニカーの両方を保持する。(これにより、ユーザーがコンテナとソースの両方のファイルを含むディレクトリツリーを移動した場合でもリンク追跡が可能になる。)
既定ハンドラはこのメソッドを呼び出して、コンテナドキュメントからリンクソースへの相対モニカーを作成する。(すなわち、コンテナドキュメントを識別するモニカーに対して
RelativePathTo を呼び出し、リンクソースを識別するモニカーを pmkOther パラメータとして渡す。) もし
RelativePathTo を呼び出す場合は、絶対モニカー
(例えばファイルモニカー、または最左コンポーネントが絶対パスを表すファイルモニカーである複合モニカー)
に対してのみ呼び出すこと。相対モニカーに対してはこのメソッドを呼び出してはならない。実装者への注意: RelativePathTo
の実装はまず、pmkOther が自分が認識しており特別な処理を提供できるクラス (例えばこのモニカーと同じクラスの場合)
のモニカーかどうかを判定すべきである。そうであれば、実装は相対パスを判定すべきである。そうでなければ、両方のモニカーを
MonikerRelativePathTo
関数に渡すべきである。これは汎用ケースを正しく処理する。相対パスを判定する最初のステップは、このモニカーと pmkOther
の共通接頭部を判定することである。次のステップは、このモニカーと pmkOther をそれぞれ 2 つの部分に分割することである。仮に
(P, myTail) と (P, otherTail) とする (P は共通接頭部)。正しい相対パスは myTail の逆と
otherTail の合成である。すなわち、Comp() を合成操作、Inv() を逆操作とすると、Comp( Inv( myTail
), otherTail ) となる。モニカーの種類によっては、IMoniker::Inverse メソッドで myTail
の逆を構築できない。例えば、ファイルモニカーは逆としてアンチモニカーを返すが、その RelativePathTo メソッドは myTail
の逆を構築するために、それぞれパス ".." を表す 1 つ以上のファイルモニカーを使用しなければならない。実装固有の注意:
（以下省略）


%index
IMoniker_GetDisplayName
モニカーの表示名を取得する。
%prm
this, pbc, pmkToLeft, ppszDisplayName
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] この操作で使用するバインドコンテキストの IBindCtx インターフェースへのポインタ。バインドコンテキストは、バインド処理中にバインドされたオブジェクトをキャッシュし、バインドコンテキストを使用するすべての操作に適用されるパラメータを含み、モニカー実装がその環境について情報を取得するための手段を提供する。
pmkToLeft : [comobj] モニカーが複合モニカーの一部である場合、このモニカーの左側にあるモニカーへのポインタ。このパラメータは主にモニカー実装者が複合モニカーの各構成要素間の連携を可能にするために使用する。モニカークライアントは NULL を渡すべきである。
ppszDisplayName : [var] モニカーの表示名文字列へのポインタを受け取るポインタ変数のアドレス。実装は ppszDisplayName に返す文字列を IMalloc::Alloc を用いて割り当てる必要があり、呼び出し側はそれを解放するために IMalloc::Free を呼び出す責任がある。呼び出し側と本メソッドの実装は共に CoGetMalloc が返す COM タスクアロケータを使用する。エラーが発生した場合、実装は *ppszDisplayName を NULL に設定しなければならない。
%inst
モニカーの表示名を取得する。

[戻り値]
このメソッドは、標準の戻り値 E_OUTOFMEMORY のほか、以下の値を返す場合がある。
（以下省略）

[備考]
GetDisplayName
はモニカーを表示可能な形式で表現した文字列を提供する。表示名はモニカーの内部状態の完全な表現ではなく、単にユーザーが読める形式である。その結果、2
つの異なるモニカーが同じ表示名を持つことも (まれだが) ありうる。モニカーの表示名を MkParseDisplayName
関数に渡した場合に元のモニカーに戻せる保証はないが、戻せない場合はまれである。呼び出し側への注意:
モニカーの表示名を取得する操作はコストが高い場合がある。効率のため、GetDisplayName
の最初の呼び出しに成功した結果をキャッシュし、繰り返し呼び出すのを避けるとよい。実装者への注意:
表示名が変わらないモニカークラスを記述する場合は、単純に表示名をキャッシュし、要求時にキャッシュ済みの名前を返せばよい。表示名が時間の経過とともに変わる可能性がある場合、現在の表示名を取得するためにはオブジェクトのストレージにアクセスするか、オブジェクトにバインドする必要があるかもしれず、いずれもコストが高い操作になりうる。その場合、GetDisplayName
の実装は、バインドコンテキストの BIND_OPTS 構造体で指定された時間までに名前を取得できないとき
MK_E_EXCEEDEDDEADLINE を返すべきである。汎用複合モニカーの一部となることを意図したモニカーは、先行するデリミタ
('\' 等) を表示名の一部として含めるべきである。例えば、項目モニカーが返す表示名には、CreateItemMoniker
関数で作成時に指定したデリミタが含まれる。ファイルモニカーの表示名にはデリミタは含まれない。ファイルモニカーは常に複合の最左コンポーネントになるためである。実装固有の注意:
（以下省略）


%index
IMoniker_ParseDisplayName
表示名をモニカーに変換する。
%prm
this, pbc, pmkToLeft, pszDisplayName, pchEaten, ppmkOut
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pbc : [comobj] このバインド操作で使用するバインドコンテキストの IBindCtx インターフェースへのポインタ。バインドコンテキストは、バインド処理中にバインドされたオブジェクトをキャッシュし、バインドコンテキストを使用するすべての操作に適用されるパラメータを含み、モニカー実装がその環境について情報を取得するための手段を提供する。
pmkToLeft : [comobj] ここまでに表示名から構築されたモニカーの IMoniker インターフェースへのポインタ。
pszDisplayName : [wstr] 解析の残りの表示名。
pchEaten : [int] このステップで消費された pszDisplayName 中の文字数を受け取る変数へのポインタ。
ppmkOut : [comobj] pszDisplayName から構築されたモニカーへのインターフェースポインタを受け取る IMoniker ポインタ変数へのポインタ。成功時、実装は新しいモニカーに対して AddRef を呼び出さなければならない。呼び出し側は Release を呼び出す責任がある。エラーが発生した場合、実装は *ppmkOut を NULL に設定する。
%inst
表示名をモニカーに変換する。

[戻り値]
このメソッドは、標準の戻り値 E_OUTOFMEMORY および E_UNEXPECTED のほか、以下の値を返す場合がある。
（以下省略）

[備考]
呼び出し側への注意: モニカークライアントは通常 ParseDisplayName
を直接呼び出さない。代わりに、表示名をモニカーに変換したい場合は MkParseDisplayName 関数を呼び出す
(例えば、コンテナアプリケーションのリンクダイアログボックスの実装、またはドキュメント外のオブジェクトへの参照をサポートするマクロ言語の実装)。その関数はまず、表示名の最初の部分を自身で解析する。次に、作成したばかりのモニカーに対して
ParseDisplayName
を呼び出し、表示名の残りを渡して、新しいモニカーを受け取る。このステップが表示名全体が解析されるまで繰り返される。実装者への注意:
モニカークラスが特定種類のオブジェクトのみを指定するように設計されている場合、この解析を自身で行えるかもしれない。そうでなければ、ここまでのモニカー
(すなわち pmkToLeft とこのモニカーの合成) が識別するオブジェクトから IParseDisplayName
インターフェースポインタを取得し、IParseDisplayName::ParseDisplayName
を呼び出した結果を返さなければならない。IParseDisplayName ポインタを取得する戦略はいくつかある。
（以下省略）


%index
IMoniker_IsSystemMoniker
このモニカーがシステム提供のモニカークラスのいずれかに該当するかどうかを判定する。
%prm
this, pdwMksys
this : [comobj] IMoniker インターフェースの COM オブジェクト変数
pdwMksys : [int] MKSYS 列挙型の値のいずれかを受け取る変数へのポインタ。COM モニカークラスのいずれかを指す。このパラメータは NULL にできない。
%inst
このモニカーがシステム提供のモニカークラスのいずれかに該当するかどうかを判定する。

[戻り値]
このメソッドは、モニカーがシステムモニカーであることを示すために S_OK を返し、それ以外は S_FALSE を返す。

[備考]
呼び出し側への注意: MKSYS
列挙型には将来新しい値が定義される可能性があるため、関心のある値ごとに明示的にテストすべきである。実装者への注意: このメソッドの実装は
MKSYS_NONE を返さなければならない。自身のモニカーを識別するために (例えば、IMoniker::ComposeWith
の実装で) この関数を使用することはできない。代わりに、モニカーの IPersist::GetClassID
の実装を使用するか、QueryInterface を使用して自身のプライベートインターフェースをテストするべきである。実装固有の注意:
（以下省略）


%index
IPersist_GetClassID
オブジェクトのクラス識別子 (CLSID) を取得する。
%prm
this, pClassID
this : [comobj] IPersist インターフェースの COM オブジェクト変数
pClassID : [var] 戻り時に CLSID を受け取る場所へのポインター。CLSID はグローバル一意識別子 (GUID) であり、オブジェクトデータを操作するコードを定義するオブジェクトクラスを一意に表す。
%inst
オブジェクトのクラス識別子 (CLSID) を取得する。

[戻り値]
メソッドが成功した場合、戻り値は S_OK。そうでなければ E_FAIL。

[備考]
GetClassID メソッドはオブジェクトのクラス識別子 (CLSID)
を取得する。これは後の操作でオブジェクト固有のコードを呼び出し側のコンテキストにロードするために使われる。呼び出し側へのメモ
コンテナーアプリケーションは、あるクラスを別のクラスとして扱っているオブジェクトの元の CLSID
を取得するためにこのメソッドを呼び出すことがある。このような呼び出しは、ユーザーがオブジェクトの保存を必要とする編集操作を行ったときに必要になる。コンテナーが
treat-as CLSID
で保存した場合、元のアプリケーションはオブジェクトを編集できなくなる。通常このような場合、コンテナーは必要なステップをすべて実行する
OleSave
ヘルパー関数を呼び出す。そのため、このメソッドを直接呼び出す必要のあるコンテナーアプリケーションはほとんどない。例外は特定のオブジェクトに対してオブジェクトハンドラーを提供するコンテナーである。特に、コンテナーアプリケーションはオブジェクトの
CLSID を取得してそれを使ってレジストリからクラス固有の情報を取得するべきではない。代わりに IOleObject および
IDataObject インターフェースを使用して、オブジェクトから直接クラス固有の情報を取得すべきである。実装者へのメモ
通常このメソッドの実装はオブジェクトに対する定数 CLSID を単に提供する。ただしオブジェクトの TreatAs
レジストリキーがエミュレーションをサポートするアプリケーションによって設定されている（つまりオブジェクトを別クラスのものとして扱っている）場合、GetClassID
の呼び出しは TreatAs キーで指定された CLSID を提供しなければならない。エミュレーションの詳細については
CoTreatAsClass を参照。オブジェクトが実行状態にあるとき、既定ハンドラーは GetClassID
の実装を呼び出し、それをオブジェクト内の実装に委譲する。オブジェクトが実行中でないとき、既定ハンドラーは代わりに ReadClassStg
関数を呼び出してオブジェクトのストレージに保存された CLSID
を読み取る。オブジェクト用のカスタムハンドラーを書く場合、このメソッドを既定ハンドラーの実装に単純に委譲したいこともあるだろう（OleCreateDefaultHandler
を参照）。
URL モニカに関する注意 このメソッドは CLSID_StdURLMoniker を返す。


%index
IPersistFile_GetClassID
IPersistFile::GetClassID (vtable slot 3)
%prm
this, pClassID
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
pClassID : [var] 
%inst


%index
IPersistFile_IsDirty
オブジェクトが最後に現在のファイルに保存されて以来変更されたかどうかを判定する。
%prm
this
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
%inst
オブジェクトが最後に現在のファイルに保存されて以来変更されたかどうかを判定する。

[戻り値]
オブジェクトが変更されたことを示すには S_OK を返す。そうでなければ S_FALSE を返す。

[備考]
このメソッドはオブジェクトを閉じる前に保存する必要があるかどうかを判定するのに使用する。オブジェクトのダーティフラグは
IPersistFile::Save メソッド内で条件付きでクリアされる。呼び出し側へのメモ OLE は IsDirty
を呼び出さない。アプリケーションがオブジェクトをファイルに保存している場合を除いて、これを呼び出すことはない。エラー戻りコードはオブジェクトが変更されたことの指標として扱うべきである。このメソッドが明示的に
S_FALSE を返さない限り、オブジェクトは保存が必要と想定するべきである。実装者へのメモ
内包オブジェクトを持たないオブジェクトは、単に自身のダーティフラグを確認して適切な結果を返せばよい。1
つ以上の内包オブジェクトを持つコンテナーは、最後に保存されて以来いずれかの内包オブジェクトが変更されたときに設定される内部ダーティフラグを保持しなければならない。そのためにコンテナーは
IAdviseSink インターフェースを実装してアドバイスシンクを保持するべきである。次にコンテナーはデータ変更通知のために
IDataObject::DAdvise を呼び出して各リンクまたは埋め込みを登録できる。こうするとコンテナーは
IAdviseSink::OnDataChange
通知を受け取ったときに内部ダーティフラグを設定できる。コンテナーがデータ変更通知を登録しない場合、IPersistFile::IsDirty
の実装は各内包オブジェクトに対して IPersistStorage::IsDirty
を呼び出して変更されたかどうかを判定する。コンテナーは保存するたびにダーティフラグをクリアできる。ただしオブジェクトが保存されたファイルが保存後に現在の作業ファイルであり続ける場合に限る。したがってダーティフラグは成功した保存または名前を付けて保存操作後にはクリアされるが、「コピーを別名で保存...」操作後にはクリアされない。


%index
IPersistFile_Load
指定したファイルを開き、その内容からオブジェクトを初期化する。
%prm
this, pszFileName, dwMode
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
pszFileName : [wstr] 開くファイルの絶対パス。
dwMode : [int] ファイルを開くときに使用するアクセスモード。取り得る値は STGM 列挙子から来る。必要に応じてより制限的なアクセス権を追加してよいため、メソッドはこの値を提案として扱える。dwMode が 0 の場合、実装はユーザーがファイルを開くときに使われる既定のアクセス権で開くべきである。
%inst
指定したファイルを開き、その内容からオブジェクトを初期化する。

[戻り値]
このメソッドは以下の値を返すことがある。
（以下省略）

[備考]
IPersistFile::Load
は指定されたファイルからオブジェクトを読み込む。このメソッドは初期化のみ行い、エンドユーザーにオブジェクトを表示するわけではない。ユーザーが
[ファイルを開く] コマンドを選択したときに行われることとは等価ではない。呼び出し側へのメモ ファイルモニカの BindToObject
メソッドは、モニカのバインド操作中（リンクされたオブジェクトが実行されるとき）にオブジェクトを読み込むためにこのメソッドを呼び出す。通常、アプリケーションがこのメソッドを直接呼び出すことはない。実装者へのメモ
ファイルを開くのに必要な情報はアプリケーションによって大きく異なるため、このメソッドを実装するオブジェクト自身が pszFileName
パラメーターで指定されたファイルを開かなければならない。これは IPersistStorage::Load および
IPersistStream::Load
と異なる。それらでは呼び出し側がストレージやストリームを開き、開かれたストレージまたはストリームポインターをロードされたオブジェクトに渡す。通常
OLE 複合ファイルを使用するアプリケーションの場合、IPersistFile::Load の実装は単に StgOpenStorage
関数を呼び出して指定されたファイル内のストレージオブジェクトを開けばよい。その後通常の初期化を進められる。ストレージオブジェクトを使用しないアプリケーションは通常のファイルを開く手順を実行できる。オブジェクトが読み込まれたら、実装はオブジェクトをランニングオブジェクトテーブルに登録するべきである（IRunningObjectTable::Register
を参照）。


%index
IPersistFile_Save
オブジェクトのコピーを指定したファイルに保存する。
%prm
this, pszFileName, fRemember
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
pszFileName : [wstr] オブジェクトが保存されるファイルの絶対パス。pszFileName が NULL の場合、オブジェクトは現在のファイル（存在する場合）にデータを保存するべきである。
fRemember : [int] pszFileName パラメーターを現在の作業ファイルとして使用するかどうかを示す。TRUE の場合、pszFileName が現在のファイルとなり、オブジェクトは保存後にダーティフラグをクリアするべきである。FALSE の場合、この保存操作は「コピーを別名で保存...」操作である。この場合、現在のファイルは変更されず、オブジェクトはダーティフラグをクリアするべきでない。pszFileName が NULL の場合、実装は fRemember フラグを無視するべきである。
%inst
オブジェクトのコピーを指定したファイルに保存する。

[戻り値]
オブジェクトが正常に保存された場合、戻り値は S_OK。そうでなければ
S_FALSE。このメソッドはさまざまなストレージエラーを返すこともある。

[備考]
このメソッドは 3 通りの方法で指定したファイルにオブジェクトを保存するために呼び出せる。
実装者は呼び出し側が要求している保存操作の種類を判断しなければならない。pszFileName パラメーターが NULL の場合は
Save が要求されている。pszFileName パラメーターが NULL でない場合、fRemember パラメーターの値を使って
Save As と Save a Copy As を区別する。Save または Save As
操作では、IPersistFile::Save は保存後に内部ダーティフラグをクリアし、任意のアドバイザリ接続に
IAdviseSink::OnSave 通知を送る（IOleAdviseHolder::SendOnSave
も参照）。また、これらの操作ではオブジェクトは IPersistFile::SaveCompleted 呼び出しを受け取るまで
NoScribble モードになる。NoScribble モードではオブジェクトはファイルに書き込んではならない。Save As
シナリオでは、実装は任意のアドバイザリ接続に IAdviseSink::OnRename
通知を送るべきである（IOleAdviseHolder::SendOnRename も参照）。Save a Copy As
シナリオでは、実装は保存後に内部ダーティフラグをクリアしない。呼び出し側へのメモ OLE は IPersistFile::Save
を呼び出さない。通常、アプリケーションはオブジェクトを直接ファイルに保存している場合を除いてこれを呼び出さない。それは一般にエンドユーザーに任されている。


%index
IPersistFile_SaveCompleted
オブジェクトに自身のファイルへ書き込み可能であることを通知する。
%prm
this, pszFileName
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
pszFileName : [wstr] 以前にオブジェクトが保存されたファイルの絶対パス。
%inst
オブジェクトに自身のファイルへ書き込み可能であることを通知する。

[戻り値]
このメソッドは常に S_OK を返す。

[備考]
SaveCompleted は IPersistFile::Save
の呼び出しが完了し、保存されたファイルが現在の作業ファイルになったとき（Save または Save As
操作で保存された場合）に呼び出される。Save の呼び出しによりオブジェクトは NoScribble
モードに置かれ、ファイルに書き込めない。SaveCompleted
が呼び出されるとオブジェクトは通常モードに戻り、ファイルへの書き込みが可能になる。呼び出し側へのメモ OLE は
SaveCompleted
メソッドを呼び出さない。通常、アプリケーションはオブジェクトを直接ファイルに保存している場合を除いてこれを呼び出さない。それは一般にエンドユーザーに任されている。


%index
IPersistFile_GetCurFile
オブジェクトに関連付けられたファイルの現在の名前を取得する。現在の作業ファイルがない場合は、オブジェクトの既定の保存プロンプトを取得する。
%prm
this, ppszFileName
this : [comobj] IPersistFile インターフェースの COM オブジェクト変数
ppszFileName : [var] 現在のファイルのパス、または既定のファイル名プロンプト（例えば *.txt）。エラーが発生した場合 ppszFileName は NULL に設定される。
%inst
オブジェクトに関連付けられたファイルの現在の名前を取得する。現在の作業ファイルがない場合は、オブジェクトの既定の保存プロンプトを取得する。

[戻り値]
このメソッドは以下の値を返すことがある。
（以下省略）

[備考]
このメソッドは ppszFileName パラメーターで返される文字列のメモリを IMalloc::Alloc
メソッドを使って確保する。呼び出し側は IMalloc::Free
メソッドを呼び出して文字列を解放する責任がある。呼び出し側とこのメソッドの双方は CoGetMalloc の呼び出しで取得できる OLE
タスクアロケーターを使用する。ppszFileName で返されるファイル名は、ドキュメントがロードされたときに
IPersistFile::Load の呼び出しで指定されたものである。あるいはドキュメントが別のファイルに保存された場合は
IPersistFile::SaveCompleted
で指定されたものである。オブジェクトに現在の作業ファイルがない場合は、[名前を付けて保存]
ダイアログボックスに表示する既定のプロンプトを提供すべきである。例えばワードプロセッサオブジェクトの既定の保存プロンプトは「*.txt」などになる。呼び出し側へのメモ
OLE は GetCurFile
メソッドを呼び出さない。アプリケーションがこのインターフェースの保存メソッドも呼び出している場合を除いて、このメソッドを呼び出すことはない。オブジェクトを保存する際、IPersistFile::Save
を呼び出す前にこのメソッドを呼び出して、オブジェクトに関連付けられたファイルがあるかどうかを判定できる。このメソッドが S_OK
を返した場合、IPersistFile::Save を filename が NULL かつ fRemember パラメーターが TRUE
で呼び出して、オブジェクトに現在のファイルに自身を保存するよう指示できる。このメソッドが S_FALSE を返した場合は
ppszFileName
パラメーターで返された保存プロンプトを使ってエンドユーザーにファイル名の提供を求め、ユーザーが入力したファイル名を指定して
IPersistFile::Save を呼び出して名前を付けて保存操作を行える。


%index
IPersistStream_GetClassID
IPersistStream::GetClassID (vtable slot 3)
%prm
this, pClassID
this : [comobj] IPersistStream インターフェースの COM オブジェクト変数
pClassID : [var] 
%inst


%index
IPersistStream_IsDirty
オブジェクトが最後にストリームへ保存されてから変更されたかどうかを判定する。(IPersistStream.IsDirty)
%prm
this
this : [comobj] IPersistStream インターフェースの COM オブジェクト変数
%inst
オブジェクトが最後にストリームへ保存されてから変更されたかどうかを判定する。(IPersistStream.IsDirty)

[戻り値]
オブジェクトが変更されたことを示すために、このメソッドは S_OK を返す。それ以外の場合は S_FALSE を返す。

[備考]
オブジェクトを閉じる前に保存すべきかどうかを判定するためにこのメソッドを使用する。オブジェクトのダーティフラグは
IPersistStream::Save メソッド内で条件付きでクリアされる。呼び出し側への注意
エラーの戻り値はオブジェクトが変更されたことを示すものとして扱うべきである。このメソッドが明示的に S_FALSE
を返さない限り、オブジェクトを保存しなければならないと仮定すること。OLE が提供するモニカインターフェースの
IPersistStream::IsDirty メソッドの OLE 提供実装は、内部状態が決して変化しないため常に S_FALSE
を返すことに注意。


%index
IPersistStream_Load
以前に保存されたストリームからオブジェクトを初期化する。(IPersistStream.Load)
%prm
this, pStm
this : [comobj] IPersistStream インターフェースの COM オブジェクト変数
pStm : [comobj] オブジェクトをロードするストリームへの IStream ポインタ。
%inst
以前に保存されたストリームからオブジェクトを初期化する。(IPersistStream.Load)

[戻り値]
このメソッドは次の値を返すことができる。
（以下省略）

[備考]
このメソッドは関連付けられたストリームからオブジェクトをロードする。シークポインタは直近の IPersistStream::Save
メソッド時と同じ位置に設定される。このメソッドはストリームに対してシークと読み取りができるが、書き込みはできない。呼び出し側への注意
IPersistStream::Load を直接呼び出す代わりに、通常は OleLoadFromStream
関数を呼び出す。これは次の処理を行う。
（以下省略）


%index
IPersistStream_Save
オブジェクトを指定されたストリームに保存する。(IPersistStream.Save)
%prm
this, pStm, fClearDirty
this : [comobj] IPersistStream インターフェースの COM オブジェクト変数
pStm : [comobj] オブジェクトを保存するストリームへの IStream ポインタ。
fClearDirty : [int] 保存完了後にダーティフラグをクリアするかどうかを示す。TRUE ならフラグをクリアし、FALSE ならそのまま残す。
%inst
オブジェクトを指定されたストリームに保存する。(IPersistStream.Save)

[戻り値]
このメソッドは次の値を返すことができる。
（以下省略）

[備考]
IPersistStream::Save
はオブジェクトを指定されたストリームへ保存し、オブジェクトがダーティフラグをリセットすべきかどうかを示す。シークポインタはオブジェクトがデータの書き込みを開始すべきストリーム内の位置に置かれる。オブジェクトはデータを書き込むために
ISequentialStream::Write
メソッドを呼び出す。終了時にはシークポインタはオブジェクトデータの直後に位置していなければならない。エラーが返った場合のシークポインタの位置は未定義である。呼び出し側への注意
IPersistStream::Save を直接呼び出す代わりに、通常は OleSaveToStream
ヘルパー関数を呼び出す。これは次の処理を行う。
（以下省略）


%index
IPersistStream_GetSizeMax
オブジェクトを保存するために必要なストリームのサイズを取得する。(IPersistStream.GetSizeMax)
%prm
this, pcbSize
this : [comobj] IPersistStream インターフェースの COM オブジェクト変数
pcbSize : [int64] このオブジェクトを保存するために必要なストリームのバイト単位のサイズ。
%inst
オブジェクトを保存するために必要なストリームのサイズを取得する。(IPersistStream.GetSizeMax)

[戻り値]
サイズが正常に取得できたことを示すために、このメソッドは S_OK を返す。

[備考]
このメソッドはオブジェクトを保存するために必要なサイズを返す。IPersistStream::Save
メソッドを呼び出す前にこのメソッドを呼び出してサイズを確認し、必要なバッファを準備できる。実装者への注意 GetSizeMax
の実装は必要なサイズを保守的に見積もるべきである。なぜなら呼び出し側が拡張不可能なストリームを使って
IPersistStream::Save を呼び出す可能性があるからである。URL Moniker に関する注意 このメソッドは、後続の
IPersistStream::Save 呼び出しで必要となるストリームの最大バイト数を取得する。この値は
sizeof(ULONG)==4 に sizeof(WCHAR)*n を加えたもので、n は NULL
ターミネータを含む完全または部分的な URL 文字列の長さである。


%index
IPropertyBag2_Read
IPropertyBag2::Read (vtable slot 3)
%prm
this, cProperties, pPropBag, pErrLog, pvarValue, phrError
this : [comobj] IPropertyBag2 インターフェースの COM オブジェクト変数
cProperties : [int] 
pPropBag : [var] 
pErrLog : [comobj] 
pvarValue : [int] 
phrError : [var] 
%inst


%index
IPropertyBag2_Write
IPropertyBag2::Write (vtable slot 4)
%prm
this, cProperties, pPropBag, pvarValue
this : [comobj] IPropertyBag2 インターフェースの COM オブジェクト変数
cProperties : [int] 
pPropBag : [var] 
pvarValue : [int] 
%inst


%index
IPropertyBag2_CountProperties
IPropertyBag2::CountProperties (vtable slot 5)
%prm
this, pcProperties
this : [comobj] IPropertyBag2 インターフェースの COM オブジェクト変数
pcProperties : [int] 
%inst


%index
IPropertyBag2_GetPropertyInfo
IPropertyBag2::GetPropertyInfo (vtable slot 6)
%prm
this, iProperty, cProperties, pPropBag, pcProperties
this : [comobj] IPropertyBag2 インターフェースの COM オブジェクト変数
iProperty : [int] 
cProperties : [int] 
pPropBag : [var] 
pcProperties : [int] 
%inst


%index
IPropertyBag2_LoadObject
IPropertyBag2::LoadObject (vtable slot 7)
%prm
this, pstrName, dwHint, pUnkObject, pErrLog
this : [comobj] IPropertyBag2 インターフェースの COM オブジェクト変数
pstrName : [wstr] 
dwHint : [int] 
pUnkObject : [int] 
pErrLog : [comobj] 
%inst


%index
IPropertyDescriptionList_GetCount
プロパティリストに含まれるプロパティの数を取得する。
%prm
this, pcElem
this : [comobj] IPropertyDescriptionList インターフェースの COM オブジェクト変数
pcElem : [int] 型: UINT* このメソッドが戻ると、プロパティ数へのポインターが格納される。
%inst
プロパティリストに含まれるプロパティの数を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IPropertyDescriptionList_GetAt
プロパティ記述リスト内の指定したインデックスのプロパティ記述を取得する。
%prm
this, iElem, riid, ppv
this : [comobj] IPropertyDescriptionList インターフェースの COM オブジェクト変数
iElem : [int] 型: UINT リスト文字列内のプロパティの番号。
riid : [var] 型: REFIID 要求するプロパティ記述インターフェースの IID への参照。通常は IID_IPropertyDescription。
ppv : [int] 型: void** このメソッドが戻ると、riid で要求されたインターフェースポインターが格納される。通常これは IPropertyDescription。
%inst
プロパティ記述リスト内の指定したインデックスのプロパティ記述を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
riid と ppv のパラメーターをまとめるには objbase.h で定義された IID_PPV_ARGS
マクロを使うことが推奨される。このマクロは ppv が指すインターフェースに基づいて正しい IID
を提供するため、コーディングミスの可能性を排除できる。


%index
IPropertyStore_GetCount
ファイルに付与されているプロパティの数を返す。
%prm
this, cProps
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
cProps : [int] プロパティ数を示す値へのポインター。
%inst
ファイルに付与されているプロパティの数を返す。

[戻り値]
IPropertyStore::GetCount メソッドは成功時、ファイルにプロパティが 1 つも付与されていない場合でも S_OK
を返す。その他のコードはエラーコードである。

[備考]
IPropertyStore は IPropertyStore::GetCount および IPropertyStore::GetAt
メソッド経由でプロパティキーの配列に対する抽象化を提供する。この配列内のプロパティキーは、IPropertyStore
が現在格納しているプロパティを表す。GetCount が成功した場合、cProps
が指す値は配列内のプロパティキーの個数である。呼び出し側は iProp が cProps より小さい値に対する
IPropertyStore::GetAt の呼び出しが成功することを期待できる。E_OUTOFMEMORY
などの失敗の場合は、cProps を 0 に設定するべきである。エラーはプロパティストアの作成時または初期化時に検出することが望ましい。


%index
IPropertyStore_GetAt
アイテムのプロパティ配列からプロパティキーを取得する。
%prm
this, iProp, pkey
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
iProp : [int] PROPERTYKEY 構造体の配列内のプロパティキーのインデックス。これは 0 ベースのインデックスである。
pkey : [var] TBD
%inst
アイテムのプロパティ配列からプロパティキーを取得する。

[戻り値]
IPropertyStore::GetAt メソッドは成功時に S_OK を返す。その他のコードはエラーコードとみなす必要がある。

[備考]
なし


%index
IPropertyStore_GetValue
特定のプロパティのデータを取得する。
%prm
this, key, pv
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
key : [var] TBD
pv : [int] IPropertyStore::GetValue メソッドが正常に戻った後、このパラメーターはプロパティに関するデータを含む PROPVARIANT 構造体を指す。
%inst
特定のプロパティのデータを取得する。

[戻り値]
成功した場合は S_OK または INPLACE_S_TRUNCATED
を返す。そうでなければエラー値を返す。INPLACE_S_TRUNCATED は返された PROPVARIANT
がより正準な形式に変換されたことを示す。例えば文字列値の前後の空白をトリミングした場合などである。戻り値を確認するには
INPLACE_S_TRUNCATED を成功コードとして扱う SUCCEEDED マクロを使用しなければならない。SUCCEEDED
マクロは Winerror.h で定義されている。

[備考]
key で参照される PROPERTYKEY がプロパティストアに存在しない場合、このメソッドは S_OK を返し、pv が指す構造体の
vt メンバーは VT_EMPTY に設定される。


%index
IPropertyStore_SetValue
プロパティ値を設定するか、既存の値を置き換えるか、または削除する。
%prm
this, key, propvar
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
key : [var] TBD
propvar : [int] TBD
%inst
プロパティ値を設定するか、既存の値を置き換えるか、または削除する。

[戻り値]
IPropertyStore::SetValue メソッドは以下のいずれかを返すことがある。
（以下省略）

[備考]
IPropertyStore::SetValue
は現在のプロパティストアインスタンスにのみ影響する。プロパティハンドラーはプロパティ変更をメモリ内のデータ構造に蓄積することで
IPropertyStore::SetValue を実装する。プロパティ変更は IPropertyStore::Commit
が呼び出されたときにのみストリームに書き込まれる。読み取り専用のプロパティストアで IPropertyStore::Commit
が呼び出された場合、プロパティハンドラーはそれを検知して STG_E_ACCESSDENIED を返す。SetValue
の結果として値が追加または削除された場合、以降の IPropertyStore::GetCount および
IPropertyStore::GetAt による列挙はその変更を反映し、以降の IPropertyStore::SetValue
の呼び出しは変更後の値を反映する。新しいプロパティの追加 key
が指すプロパティ値がストアに存在しない場合、IPropertyStore::SetValue
はその値をストアに追加する。既存のプロパティ値の置換 key
が指すプロパティ値が既にストアに存在する場合、格納されている値は置き換えられる。既存のプロパティの削除
プロパティストアから値を削除するには、pv が指す構造体の vt メンバーを VT_EMPTY
に設定する。その値が存在しない場合は何もせず、メソッドは S_OK を返す。


%index
IPropertyStore_Commit
変更が行われた後に、その変更を保存する。
%prm
this
this : [comobj] IPropertyStore インターフェースの COM オブジェクト変数
%inst
変更が行われた後に、その変更を保存する。

[戻り値]
IPropertyStore::Commit メソッドは以下のいずれかを返す。
（以下省略）

[備考]
Commit
メソッドが戻る前に、このメソッドで使用するために初期化されていたファイルストリームまたはパスを解放する。そのため、Commit
が戻った後は IPropertyStore のメソッドは成功しなくなり、E_FAIL を返す。プロパティハンドラーは、Commit
プロセスが異常終了したりエラーに遭遇したりしても、プロパティ変更が有効な出力先ファイルに反映されるよう保証しなければならない。


%index
IRunningObjectTable_Register
ランニングオブジェクトテーブル (ROT) にオブジェクトとそれを識別するモニカーを登録する。
%prm
this, grfFlags, punkObject, pmkObjectName, pdwRegister
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
grfFlags : [int] ROT の punkObject への参照が弱参照か強参照かを指定し、ROT のエントリを通じたオブジェクトへのアクセスを制御する。詳細は Remarks セクションを参照。
punkObject : [int] 実行中として登録されるオブジェクトへのポインタ。
pmkObjectName : [comobj] punkObject を識別するモニカーへのポインタ。
pdwRegister : [int] IRunningObjectTable::Revoke や IRunningObjectTable::NoteChangeTime の後続呼び出しで使用できる、この ROT エントリの識別子。呼び出し側はこのパラメータに NULL を指定できない。エラーが発生した場合、*pdwRegister は 0 に設定される。
%inst
ランニングオブジェクトテーブル (ROT) にオブジェクトとそれを識別するモニカーを登録する。

[戻り値]
このメソッドは標準の戻り値 E_INVALIDARG、E_OUTOFMEMORY、および次の値を返すことがある。
（以下省略）

[備考]
このメソッドは、オブジェクトへのポインタを、そのオブジェクトを識別するモニカーの下に登録する。モニカーは
IRunningObjectTable::GetObject
によってテーブルが検索される際のキーとして使用される。オブジェクトが登録されるとき、ROT は常にオブジェクトに対して AddRef
を呼ぶ。弱参照登録 (ROTFLAGS_REGISTRATIONKEEPSALIVE が未設定) の場合、ROT
はオブジェクトへの最後の強参照が解放されたときにオブジェクトを解放する。強参照登録
(ROTFLAGS_REGISTRATIONKEEPSALIVE が設定) の場合、ROT
は登録が明示的に取り消されるまでオブジェクトが破棄されるのを防ぐ。LocalService または RunAs
として登録されたサーバは、Register 呼び出しで ROTFLAGS_ALLOWANYCLIENT
フラグを設定して任意のクライアントからの接続を許可できる。このビットを設定するサーバは、実行ファイル用の AppID
を参照するレジストリの AppID セクションに実行ファイル名が登録されている必要がある。"activate as activator"
サーバ (LocalService や RunAs として登録されていないもの) は Register
呼び出しでこのフラグを設定してはならない。サービスのインストールの詳細は Installing as a Service
Application を参照。同じモニカーで 2
つ目のオブジェクトを登録したり、同じモニカーで同じオブジェクトを再登録したりすると、ROT には 2 つのエントリが作られる。この場合
Register は MK_S_MONIKERALREADYREGISTERED を返す。重複するエントリでも pdwRegister
の識別子が異なるため、Register の各呼び出しには対応する IRunningObjectTable::Revoke
の呼び出しが必要である。重複登録の問題点は、その後 IRunningObjectTable::IsRunning
でそのモニカーを指定したときにどのオブジェクトが返されるかを決定する方法がないことである。呼び出し側への注意 モニカープロバイダ
(他者がアクセスできるよう、自身のオブジェクトを識別するモニカーを配布する側) の場合、オブジェクトが実行を開始したときに
Register
メソッドを呼んでオブジェクトを登録する必要がある。ロード中にオブジェクトがリネームされた場合もこのメソッドを呼ぶ必要がある。
最も一般的なモニカープロバイダは複合ドキュメントのリンクソースである。これには自ドキュメント (またはその一部)
へのリンクをサポートするサーバアプリケーションや、ドキュメント内の埋め込みへのリンクをサポートするコンテナアプリケーションが含まれる。リンクをサポートしないサーバアプリケーションも、ROT
を用いて埋め込みへのリンクをサポートするコンテナアプリケーションと協調することができる。
サーバアプリケーションを書いている場合、オブジェクトが実行を開始したとき (典型的には IOleObject::DoVerb の実装内で)
そのオブジェクトを ROT に登録すべきである。オブジェクトは完全なモニカーで登録しなければならず、これには
IOleClientSite::GetMoniker
を使ってコンテナドキュメントのモニカーを取得する必要がある。コンテナドキュメントがリネームされた際に呼ばれる
IOleObject::SetMoniker
の実装内でも、オブジェクトを取り消して再登録すべきである。埋め込みへのリンクをサポートするコンテナアプリケーションを書いている場合、ドキュメントがロードされたときに
ROT に登録すべきである。ドキュメントがリネームされた場合は ROT
での取り消し・再登録を行い、ドキュメント内の埋め込みオブジェクトに対して IOleObject::SetMoniker
を呼んで再登録の機会を与えるべきである。ROT
に登録したオブジェクトは、実行されなくなったときやそのモニカーが変更されたときに明示的に取り消す必要がある。システムが自動的に ROT
からエントリを削除する方法はないため、この取り消しは重要である。pdwRegister
を介して書き込まれた識別子をキャッシュし、IRunningObjectTable::Revoke
呼び出しに渡して登録を取り消す必要がある。強参照登録の場合、登録が取り消されると強参照が解放される。Windows Server 2003
以降では、予期しないサーバの問題により古いエントリが ROT に残っている場合、COM が自動的にそれらの古いエントリを ROT
から削除する。システムの Register 実装は、登録前にモニカーが完全に簡約化されていることを保証するために
pmkObjectName パラメータに対して IMoniker::Reduce を呼び出す。1
つのオブジェクトが複数の完全に簡約化されたモニカーで知られる場合、それらすべてのモニカーで登録するべきである。


%index
IRunningObjectTable_Revoke
IRunningObjectTable::Register 呼び出しで以前に登録されたエントリをランニングオブジェクトテーブル (ROT) から削除する。
%prm
this, dwRegister
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
dwRegister : [int] 取り消す ROT エントリの識別子。
%inst
IRunningObjectTable::Register 呼び出しで以前に登録されたエントリをランニングオブジェクトテーブル (ROT)
から削除する。

[戻り値]
このメソッドは標準の戻り値 E_INVALIDARG および S_OK を返すことがある。

[備考]
このメソッドは IRunningObjectTable::Register
の呼び出しの効果を取り消し、モニカーとそのモニカーで識別されるオブジェクトへのポインタの両方を削除する。呼び出し側への注意
モニカープロバイダ (他者がアクセスできるよう、自身のオブジェクトを識別するモニカーを配布する側)
は、実行を停止する際にオブジェクトの登録を取り消すために Revoke メソッドを呼ばなければならない。事前に
IRunningObjectTable::Register を呼び、そのメソッドが返した識別子を保存しておき、Revoke
呼び出し時にその識別子を使用する必要がある。最も一般的なモニカープロバイダは複合ドキュメントのリンクソースである。これには自ドキュメント
(またはその一部)
へのリンクをサポートするサーバアプリケーションや、ドキュメント内の埋め込みへのリンクをサポートするコンテナアプリケーションが含まれる。リンクをサポートしないサーバアプリケーションも、ROT
を用いて埋め込みへのリンクをサポートするコンテナアプリケーションと協調することができる。コンテナアプリケーションを書いている場合、ドキュメントが閉じられるときにその登録を取り消さなければならない。リネームされて再登録する前にもドキュメントの登録を取り消さなければならない。

サーバアプリケーションを書いている場合、オブジェクトが閉じられるときにその登録を取り消さなければならない。コンテナドキュメントがリネームされたときにオブジェクトを再登録する前にも、その登録を取り消さなければならない
(IOleObject::SetMoniker を参照)。


%index
IRunningObjectTable_IsRunning
指定したモニカーで識別されるオブジェクトが現在実行中かどうかを判定する。
%prm
this, pmkObjectName
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
pmkObjectName : [comobj] モニカー上の IMoniker インターフェースへのポインタ。
%inst
指定したモニカーで識別されるオブジェクトが現在実行中かどうかを判定する。

[戻り値]
オブジェクトが実行状態にある場合、戻り値は TRUE、そうでない場合は FALSE である。

[備考]
このメソッドはオブジェクトが実行中かどうかを単純に示す。実行中のオブジェクトへのポインタを取得するには
IRunningObjectTable::GetObject メソッドを使用する。呼び出し側への注意 一般に IsRunning
メソッドを呼ぶのは、独自のモニカークラスを書いている場合 (すなわち IMoniker インターフェースを実装している場合)
のみである。通常は IMoniker::IsRunning の実装内から呼び出す。ただし、これを行うのは
IMoniker::IsRunning の pmkToLeft パラメータが NULL の場合に限る。そうでない場合は、代わりに
pmkToLeft パラメータに対して IMoniker::IsRunning を呼ぶべきである。


%index
IRunningObjectTable_GetObject
指定したモニカーで識別されるオブジェクトが実行中かどうかを判定し、実行中であればそのオブジェクトへのポインタを取得する。
%prm
this, pmkObjectName, ppunkObject
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
pmkObjectName : [comobj] モニカー上の IMoniker インターフェースへのポインタ。
ppunkObject : [int] 実行中のオブジェクトへのインターフェースポインタを受け取る IUnknown ポインタ変数へのポインタ。成功時には実装はオブジェクトに対して AddRef を呼ぶ。Release を呼ぶのは呼び出し側の責任である。オブジェクトが実行中でないか、エラーが発生した場合、実装は *ppunkObject を NULL に設定する。
%inst
指定したモニカーで識別されるオブジェクトが実行中かどうかを判定し、実行中であればそのオブジェクトへのポインタを取得する。

[戻り値]
このメソッドは次の値を返すことがある。
（以下省略）

[備考]
このメソッドは pmkObjectName で指定されたモニカーを ROT 内で確認する。そのモニカーが以前に
IRunningObjectTable::Register
呼び出しで登録されていた場合、このメソッドはその時に登録されたポインタを返す。呼び出し側への注意 一般に
IRunningObjectTable::GetObject メソッドを呼ぶのは、独自のモニカークラスを書いている場合 (すなわち
IMoniker インターフェースを実装している場合) のみである。通常は IMoniker::BindToObject
の実装内から呼び出す。ただしすべての IMoniker::BindToObject
実装がこのメソッドを呼ぶ必要があるわけではない。モニカーにプレフィックス (IMoniker::BindToObject の非 NULL
pmkToLeft パラメータで示される) があると想定される場合、ROT を確認すべきではない。理由は、ROT
には完全なモニカーのみが登録されるからであり、プレフィックス付きモニカーは合成の一部であって完全ではないためである。この場合モニカーは代わりに、プレフィックスで識別されるオブジェクト
(例: 自分のモニカーで識別されるオブジェクトのコンテナ) にサービスを要求すべきである。


%index
IRunningObjectTable_NoteChangeTime
実行中のオブジェクトが最後に変更された時刻を記録する。オブジェクトは事前にランニングオブジェクトテーブル (ROT) に登録されていなければならない。このメソッドは最終変更時刻を ROT に保存する。
%prm
this, dwRegister, pfiletime
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
dwRegister : [int] 変更されたオブジェクトの ROT エントリの識別子。この値は以前に IRunningObjectTable::Register が返したものである。
pfiletime : [var] オブジェクトの最終変更時刻を含む FILETIME 構造体へのポインタ。
%inst
実行中のオブジェクトが最後に変更された時刻を記録する。オブジェクトは事前にランニングオブジェクトテーブル (ROT)
に登録されていなければならない。このメソッドは最終変更時刻を ROT に保存する。

[戻り値]
このメソッドは標準の戻り値 E_INVALIDARG および S_OK を返すことがある。

[備考]
このメソッドで記録された時刻は IRunningObjectTable::GetTimeOfLastChange
を呼び出すことで取得できる。呼び出し側への注意 モニカープロバイダ
(他者がアクセスできるよう、自身のオブジェクトを識別するモニカーを配布する側) は、自身のオブジェクトが変更されるたびに
NoteChangeTime メソッドを呼び出さなければならない。事前に IRunningObjectTable::Register
を呼び、そのメソッドが返した識別子を保存しておき、NoteChangeTime 呼び出し時にその識別子を使用する必要がある。
最も一般的なモニカープロバイダは複合ドキュメントのリンクソースである。これには自ドキュメント (またはその一部)
へのリンクをサポートするサーバアプリケーションや、ドキュメント内の埋め込みへのリンクをサポートするコンテナアプリケーションが含まれる。リンクをサポートしないサーバアプリケーションも、ROT
を用いて埋め込みへのリンクをサポートするコンテナアプリケーションと協調することができる。
オブジェクトが最初に ROT に登録されると、ROT は登録されるモニカーに対して
IMoniker::GetTimeOfLastChange を呼んで得た値を最終変更時刻として記録する。


%index
IRunningObjectTable_GetTimeOfLastChange
オブジェクトが最後に変更された時刻を取得する。
%prm
this, pmkObjectName, pfiletime
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
pmkObjectName : [comobj] モニカー上の IMoniker インターフェースへのポインタ。
pfiletime : [var] オブジェクトの最終変更時刻を受け取る FILETIME 構造体へのポインタ。
%inst
オブジェクトが最後に変更された時刻を取得する。

[戻り値]
このメソッドは次の値を返すことがある。
（以下省略）

[備考]
このメソッドは、このオブジェクトについて IRunningObjectTable::NoteChangeTime
呼び出しで最後に報告された変更時刻を返す。NoteChangeTime
が以前に呼ばれていない場合、このメソッドはオブジェクトが登録された際に記録された時刻を返す。このメソッドは、2 つのオブジェクト間の接続
(片方がもう片方を識別するモニカーを保持している)
が最新かどうかを確認できるよう提供されている。たとえば、一方のオブジェクトがもう一方のオブジェクトに関するキャッシュ情報を保持している場合、このメソッドを使ってキャッシュが最後に更新されてからオブジェクトが変更されたかどうかを確認できる。IMoniker::GetTimeOfLastChange
を参照。呼び出し側への注意 一般に GetTimeOfLastChange を呼ぶのは、独自のモニカークラスを書いている場合 (すなわち
IMoniker インターフェースを実装している場合) のみである。通常は IMoniker::GetTimeOfLastChange
の実装内から呼び出す。ただし、これを行うのは IMoniker::GetTimeOfLastChange の pmkToLeft
パラメータが NULL の場合に限る。そうでない場合は、代わりに pmkToLeft パラメータに対して
IMoniker::GetTimeOfLastChange を呼ぶべきである。


%index
IRunningObjectTable_EnumRunning
ランニングオブジェクトテーブル (ROT) に現在登録されているすべてのオブジェクトのモニカーを列挙できる列挙子へのポインタを生成して返す。
%prm
this, ppenumMoniker
this : [comobj] IRunningObjectTable インターフェースの COM オブジェクト変数
ppenumMoniker : [comobj] ROT 用の新しい列挙子へのインターフェースポインタを受け取る IEnumMoniker ポインタ変数へのポインタ。成功時には実装は列挙子に対して AddRef を呼ぶ。Release を呼ぶのは呼び出し側の責任である。エラーが発生した場合、実装は *ppenumMoniker を NULL に設定する。
%inst
ランニングオブジェクトテーブル (ROT)
に現在登録されているすべてのオブジェクトのモニカーを列挙できる列挙子へのポインタを生成して返す。

[戻り値]
このメソッドは標準の戻り値 E_OUTOFMEMORY および S_OK を返すことがある。

[備考]
IRunningObjectTable::EnumRunning は、列挙子オブジェクトに対する IEnumMoniker
インターフェースへのポインタを生成して返さなければならない。その後、標準の列挙子メソッドを呼び出してレジストリに現在登録されているモニカーを列挙できる。この列挙子は、列挙子生成後に
ROT へ登録されたモニカーの列挙には使用できない。EnumRunning
メソッドは主にアラートオブジェクトテーブルを実装するためシステムが使用することを想定している。OLE 2
にはアラートオブジェクトテーブルの実装は含まれていないことに注意。


%index
ISequentialStream_Read
現在のシークポインタから始めて、指定された数のバイトをストリームオブジェクトからメモリへ読み取る。
%prm
this, pv, cb, pcbRead
this : [comobj] ISequentialStream インターフェースの COM オブジェクト変数
pv : [intptr] ストリームデータの読み込み先となるバッファへのポインタ。
cb : [int] ストリームオブジェクトから読み取るデータのバイト数。
pcbRead : [var] ストリームオブジェクトから実際に読み取られたバイト数を受け取る ULONG 変数へのポインタ。注意 読み取られたバイト数は 0 になることもある。
%inst
現在のシークポインタから始めて、指定された数のバイトをストリームオブジェクトからメモリへ読み取る。

[戻り値]
このメソッドは以下のいずれかの値を返すことができる。 | 戻りコード | 説明 |
|----------------|---------------| |S_OK |
要求されたデータがすべてストリームオブジェクトから正常に読み取られた。*cb* で要求したバイト数と *pcbRead*
で返されたバイト数が同じである。| |S_FALSE | *pcbRead* で返された値が *cb*
で要求したバイト数より少ない。これはストリームの末尾に達したことを示す。読み取られたバイト数は *pv*
バッファのうちどれだけが埋められたかを示す。| |E_PENDING | 非同期ストレージのみ:
読み取るべきデータの一部または全部が現在利用不可である。| |STG_E_ACCESSDENIED |
呼び出し側がこのストリームオブジェクトを読み取るのに必要な権限を持っていない。| |STG_E_INVALIDPOINTER |
ポインタ値の 1 つが無効である。| |STG_E_REVERTED | トランザクションツリー内でその上位の revert
操作によりオブジェクトが無効化された。|

[備考]
このメソッドはこのストリームオブジェクトからメモリへバイトを読み取る。ストリームオブジェクトは STGM_READ
モードで開かれていなければならない。このメソッドは実際に読み取ったバイト数だけシークポインタを進める。実際に読み取られたバイト数は
pcbRead パラメータでも返される。呼び出し側への注意
エラーが発生したり読み取り操作中にストリームの末尾に達したりした場合、実際に読み取られるバイト数は要求したバイト数より少なくなることがある。返されるバイト数は常に要求したバイト数と比較すべきである。返されるバイト数が要求より少ない場合、通常は
Read
メソッドがストリームの末尾を超えて読み取ろうとしたことを意味する。アプリケーションはストリーム終端での読み取りに対するエラー戻り値と
S_OK 戻り値の両方を扱うべきである。


%index
ISequentialStream_Write
現在のシークポインタから始めて、指定された数のバイトをストリームオブジェクトへ書き込む。
%prm
this, pv, cb, pcbWritten
this : [comobj] ISequentialStream インターフェースの COM オブジェクト変数
pv : [intptr] ストリームに書き込むデータを含むバッファへのポインタ。cb が 0 であってもこのパラメータには有効なポインタを指定しなければならない。
cb : [int] ストリームに書き込もうとするデータのバイト数。この値は 0 でもよい。
pcbWritten : [var] このメソッドが、ストリームオブジェクトへ実際に書き込んだバイト数を書き込む ULONG 変数へのポインタ。呼び出し側はこのポインタを NULL に設定でき、その場合このメソッドは実際に書き込まれたバイト数を提供しない。
%inst
現在のシークポインタから始めて、指定された数のバイトをストリームオブジェクトへ書き込む。

[戻り値]
このメソッドは以下のいずれかの値を返すことができる。 | 戻りコード | 説明 |
|----------------|---------------| |S_OK |
データがストリームオブジェクトへ正常に書き込まれた。| |E_PENDING | 非同期ストレージのみ:
書き込むべきデータの一部または全部が現在利用不可である。| |STG_E_MEDIUMFULL |
ストレージデバイスに残り容量がないため書き込み操作に失敗した。| |STG_E_ACCESSDENIED |
呼び出し側がこのストリームオブジェクトへ書き込むのに必要な権限を持っていない。| |STG_E_CANTSAVE |
不適切なアクセスや空き容量不足以外の理由でデータを書き込めない。| |STG_E_INVALIDPOINTER | ポインタ値の 1
つが無効である。cb が 0 でも *pv* パラメータには有効なポインタを含めなければならない。| |STG_E_REVERTED |
トランザクションツリー内でその上位の revert 操作によりオブジェクトが無効化された。| |STG_E_WRITEFAULT |
ディスクエラーにより書き込み操作に失敗した。シンプルモード (STGM_SIMPLE フラグを使用)
で開かれたストリームへ書き込もうとした場合にもこの値が返される。|

[備考]
ISequentialStream::Write
は指定されたデータをストリームオブジェクトへ書き込む。シークポインタは実際に書き込まれたバイト数だけ進められる。実際に書き込まれたバイト数は
pcbWritten パラメータで返される。バイト数が 0
の場合、書き込み操作は何の効果も持たない。シークポインタが現在ストリームの末尾を超えており、バイト数が 0
でない場合、このメソッドはストリームのサイズをシークポインタまで拡大し、シークポインタの位置から指定されたバイトを書き込む。ストリームに書き込まれた埋め草バイトは特定の値で初期化されない。これは
MS-DOS FAT ファイルシステムでのファイル末尾の動作と同じである。バイト数が 0
でかつシークポインタがストリーム末尾を超えている場合、このメソッドはストリームをシークポインタまで拡大するための埋め草バイトを作成しない。この場合、ストリームのサイズを拡大して埋め草バイトを書き込むには
IStream::SetSize メソッドを呼び出さなければならない。エラーが発生しても pcbWritten
パラメータが値を持つことがある。COM
提供の実装ではストリームオブジェクトはスパースではなく、すべての埋め草バイトは最終的にディスク上に割り当てられストリームに紐付けられる。


%index
IShellItem_BindToHandler
ハンドラー ID (BHID) で指定したアイテム用のハンドラーにバインドする。
%prm
this, pbc, bhid, riid, ppv
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
pbc : [comobj] 型: IBindCtx* バインドコンテキストオブジェクト上の IBindCtx インターフェースへのポインター。オプションのパラメーターをハンドラーに渡すのに使用する。バインドコンテキストの内容はハンドラー固有である。例えば BHID_Stream へバインドする際、バインドコンテキストの STGM フラグは望むアクセスモード（read または read/write）を示す。
bhid : [var] 型: REFGUID
riid : [var] 型: REFIID 取得するオブジェクト型の IID。
ppv : [int] 型: void** このメソッドが戻ると、rbhid で指定されたハンドラーが返す riid 型のポインターを含む。
%inst
ハンドラー ID (BHID) で指定したアイテム用のハンドラーにバインドする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellItem_GetParent
IShellItem オブジェクトの親を取得する。
%prm
this, ppsi
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
ppsi : [comobj] 型: IShellItem** IShellItem インターフェースの親へのポインターのアドレス。
%inst
IShellItem オブジェクトの親を取得する。

[戻り値]
型: HRESULT 成功した場合は S_OK、そうでなければエラー値を返す。


%index
IShellItem_GetDisplayName
IShellItem オブジェクトの表示名を取得する。
%prm
this, sigdnName, ppszName
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
sigdnName : [int] 型: SIGDN 名前の見た目を示す SIGDN 値の 1 つ。
ppszName : [var] 型: LPWSTR* この関数が正常に戻ったときに、取得した表示名へのポインターのアドレスを受け取る値。
%inst
IShellItem オブジェクトの表示名を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
ppszName が指す文字列は不要になったら呼び出し側が解放する責任を負う。メモリを解放するには *ppszName に対して
CoTaskMemFree を呼び出す。


%index
IShellItem_GetAttributes
IShellItem オブジェクトの、要求された属性のセットを取得する。
%prm
this, sfgaoMask, psfgaoAttribs
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
sfgaoMask : [int] 型: SFGAOF 取得する属性を指定する。SFGAO 値の 1 つ以上の組み合わせ。取得する属性を決定するにはビット単位の OR 演算子を使用する。
psfgaoAttribs : [var] 型: SFGAOF* このメソッドが正常に戻ったときに要求された属性を受け取る値へのポインター。SFGAO 値の 1 つ以上の組み合わせ。sfgaoMask で指定された属性のみが返され、その他の属性値は未定義である。
%inst
IShellItem オブジェクトの、要求された属性のセットを取得する。

[戻り値]
型: HRESULT 返された属性が sfgaoMask で要求されたものと完全に一致する場合は S_OK、完全に一致しない場合は
S_FALSE、そうでなければ標準 COM エラー値を返す。


%index
IShellItem_Compare
2 つの IShellItem オブジェクトを比較する。
%prm
this, psi, hint, piOrder
this : [comobj] IShellItem インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* 既存の IShellItem オブジェクトと比較する IShellItem オブジェクトへのポインター。
hint : [int] 型: SICHINTF 比較方法を決定する SICHINTF 値の 1 つ。このパラメーターが取り得る値は SICHINTF を参照。
piOrder : [int] 型: int* 比較結果を受け取るパラメーター。2 つのアイテムが同じ場合は 0、異なる場合は 0 以外になる。
%inst
2 つの IShellItem オブジェクトを比較する。

[戻り値]
型: HRESULT アイテムが同じ場合は S_OK、異なる場合は S_FALSE、そうでなければエラー値を返す。

[備考]
2 番目のパラメーターで使用するデータ型 SICHINTF は次のように定義される。
（以下省略)


%index
IShellItemArray_BindToHandler
指定したハンドラーを介してオブジェクトにバインドする。
%prm
this, pbc, bhid, riid, ppvOut
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
pbc : [comobj] 型: IBindCtx* バインドコンテキストオブジェクト上の IBindCtx インターフェースへのポインター。
bhid : [var] 型: REFGUID
riid : [var] 型: REFIID 取得するオブジェクト型の IID。
ppvOut : [int] 型: void** このメソッドが戻ると、rbhid で指定されたハンドラーが返す、riid で指定したオブジェクトを含む。
%inst
指定したハンドラーを介してオブジェクトにバインドする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellItemArray_GetPropertyStore
プロパティストアを取得する。
%prm
this, flags, riid, ppv
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
flags : [int] 型: GETPROPERTYSTOREFLAGS GETPROPERTYSTOREFLAGS 定数の 1 つ。
riid : [var] 型: REFIID 取得するオブジェクト型の IID。
ppv : [int] 型: void** このメソッドが戻ると、riid で要求されたインターフェースポインターを含む。通常これは IPropertyStore または IPropertyStoreCapabilities。
%inst
プロパティストアを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このメソッドは、シェルアイテム配列内のすべてのアイテムから集約したプロパティを提供する読み取り専用のプロパティストアを取得するのに使用する。シェルアイテム配列に複数のアイテムがある場合、結果のプロパティストアは各プロパティごとに決まるルールに従って各アイテムの値を集約する。プロパティストアから読み取られた値は、CoerceToCanonicalValue
で説明されているとおり、集約前に正準形式に強制変換される。IPropertyStore::GetValue
の呼び出しからの出力は以下のように算出される。
（以下省略）


%index
IShellItemArray_GetPropertyDescriptionList
シェルアイテム配列内のアイテムのプロパティ記述リストを取得する。
%prm
this, keyType, riid, ppv
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
keyType : [var] 型: REFPROPERTYKEY 取得するプロパティリストを指定する PROPERTYKEY 構造体への参照。
riid : [var] 型: REFIID 取得するオブジェクト型の IID。
ppv : [int] 型: void** このメソッドが戻ると、riid で要求されたインターフェースを含む。通常これは IPropertyDescriptionList。
%inst
シェルアイテム配列内のアイテムのプロパティ記述リストを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
この関数は一連のシェルアイテムに適用可能なプロパティのリストを決定するのに使用する。リストの型は PROPERTYKEY
構造体で指定する。サポートされるリスト型には以下のものが含まれる（ただしこれに限らない）。
（以下省略）


%index
IShellItemArray_GetAttributes
IShellItemArray に含まれるアイテムのセットの属性を取得する。
%prm
this, AttribFlags, sfgaoMask, psfgaoAttribs
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
AttribFlags : [int] 型: SIATTRIBFLAGS
sfgaoMask : [int] 型: SFGAOF 要求する特定の属性を指定するマスク。1 つ以上の SFGAO 値のビット単位 OR。
psfgaoAttribs : [var] 型: SFGAOF* このメソッドが正常に戻ったときに、要求された属性の値を含むビットマップ。
%inst
IShellItemArray に含まれるアイテムのセットの属性を取得する。

[戻り値]
型: HRESULT 返された属性が sfgaoMask で要求されたものと完全に一致する場合は S_OK、完全に一致しない場合は
S_FALSE、そうでなければ標準 COM エラー値を返す。

[備考]

シェルアイテム配列は個々の属性が決定された後にそれらをキャッシュする。このメソッドが属性情報を収集するために配列を走査する際、通常はある属性の値が不可逆的に決定された時点でその属性の調査を停止する。例えば
SIATTRIBFLAGS_AND フラグが設定されている場合、あるアイテムで属性が設定されていない（値が 0）と判明した時点で、AND
演算の結果は必ず 0
となるため、その属性について他のアイテムを調べ続ける必要がなくなる。したがって、最終的な属性セットは配列内の最初の数アイテムのみを調べて算出されることが多く、最終値を取得するために必要なのはそれだけである。配列内のすべてのアイテムを調べる必要がある場合は
SIATTRIBFLAGS_ALLITEMS
フラグを設定する。ただしこれはメソッドの戻りを大きく遅くする可能性があるため、理由なく使用してはならない。


%index
IShellItemArray_GetCount
指定した IShellItem 配列内のアイテム数を取得する。
%prm
this, pdwNumItems
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
pdwNumItems : [int] 型: DWORD* このメソッドが戻ると、IShellItemArray 内のアイテム数を含む。
%inst
指定した IShellItem 配列内のアイテム数を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellItemArray_GetItemAt
IShellItemArray 内の指定したインデックスのアイテムを取得する。
%prm
this, dwIndex, ppsi
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
dwIndex : [int] 型: DWORD IShellItemArray 内で要求する IShellItem のインデックス。
ppsi : [comobj] 型: IShellItem** このメソッドが戻ると、要求された IShellItem ポインターを含む。
%inst
IShellItemArray 内の指定したインデックスのアイテムを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
要求されたインデックスが IShellItemArray の範囲外の場合、この関数は E_FAIL を返す。


%index
IShellItemArray_EnumItems
配列内のアイテムの列挙子を取得する。
%prm
this, ppenumShellItems
this : [comobj] IShellItemArray インターフェースの COM オブジェクト変数
ppenumShellItems : [comobj] 型: IEnumShellItems** このメソッドが戻ると、配列内のシェルアイテムを列挙する IEnumShellItems ポインターを含む。
%inst
配列内のアイテムの列挙子を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellItemFilter_IncludeItem
指定したシェルアイテムをビューへの含有対象として設定する。
%prm
this, psi
this : [comobj] IShellItemFilter インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* ビューに含めるシェルアイテムへのポインター。
%inst
指定したシェルアイテムをビューへの含有対象として設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
ホストはフォルダー内の各アイテムに対してこのメソッドを呼び出す。アイテムをビューに含めるために列挙する場合は S_OK
を返す。ビューに含めないようにするには S_FALSE を返す。


%index
IShellItemFilter_GetEnumFlagsForItem
クライアントがシェルアイテム内のどのクラスのオブジェクトをビューに含めるために列挙するかを指定できるようにする。
%prm
this, psi, pgrfFlags
this : [comobj] IShellItemFilter インターフェースの COM オブジェクト変数
psi : [comobj] 型: IShellItem* SHCONTF 列挙フラグを取得するシェルアイテムへのポインター。
pgrfFlags : [int] 型: SHCONTF* 指定したシェルアイテムについて、ビューへ含めるために列挙するオブジェクトのクラスを指定する SHCONTF 列挙フラグへのポインター。
%inst
クライアントがシェルアイテム内のどのクラスのオブジェクトをビューに含めるために列挙するかを指定できるようにする。

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellLinkW_GetPath
シェルリンクオブジェクトのターゲットのパスとファイル名を取得する。(Unicode)
%prm
this, pszFile, cch, pfd, fFlags
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszFile : [wstr] 型: LPTSTR シェルリンクオブジェクトのターゲットのパスとファイル名を受け取るバッファのアドレス。
cch : [int] 型: int pszFile パラメーターが指すバッファのサイズ（文字数）。終端 null 文字を含む。返される最大パスサイズは MAX_PATH。このパラメーターは一般に ARRAYSIZE(pszFile) を呼び出すことで設定される。ARRAYSIZE マクロは Winnt.h で定義されている。
pfd : [var] 型: WIN32_FIND_DATA* シェルリンクオブジェクトのターゲットに関する情報を受け取る WIN32_FIND_DATA 構造体へのポインター。このパラメーターが NULL の場合、追加情報は返されない。
fFlags : [int] 型: DWORD
%inst
シェルリンクオブジェクトのターゲットのパスとファイル名を取得する。(Unicode)

[戻り値]
型: HRESULT 操作が成功し、有効なパスが取得できた場合は S_OK を返す。操作は成功したがパスが取得できなかった場合は
S_FALSE を返し、pszFile は空となる。そうでなければ標準 HRESULT エラー値のいずれかを返す。


%index
IShellLinkW_GetIDList
シェルリンクオブジェクトのターゲットのアイテム識別子リストを取得する。(Unicode)
%prm
this, ppidl
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
ppidl : [comobj] 型: PIDLIST_ABSOLUTE* このメソッドが戻ると PIDL のアドレスを含む。
%inst
シェルリンクオブジェクトのターゲットのアイテム識別子リストを取得する。(Unicode)

[戻り値]
型: HRESULT 操作が成功し、1 つ以上の有効な PIDL が取得できた場合は S_OK を返す。操作は成功したが PIDL
が取得できなかった場合は S_FALSE を返し、ppidl は NULL に設定される。そうでなければ標準のエラー値を返す。


%index
IShellLinkW_SetIDList
シェルリンクオブジェクトのアイテム識別子リスト (PIDL) へのポインターを設定する。(Unicode)
%prm
this, pidl
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pidl : [comobj] 型: PCIDLIST_ABSOLUTE オブジェクトの完全修飾 PIDL。
%inst
シェルリンクオブジェクトのアイテム識別子リスト (PIDL) へのポインターを設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

このメソッドは、コントロールパネルアプリケーション、プリンター、または別のコンピューターのようなファイルでないオブジェクトへのシェルリンクを設定する必要があるときに便利である。


%index
IShellLinkW_GetDescription
シェルリンクオブジェクトの説明文字列を取得する。(Unicode)
%prm
this, pszName, cch
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszName : [wstr] 型: LPTSTR 説明文字列を受け取るバッファへのポインター。
cch : [int] 型: int pszName パラメーターが指すバッファにコピーする最大文字数。
%inst
シェルリンクオブジェクトの説明文字列を取得する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
Windows 2000 以降では pszName に返される文字列の最大長は INFOTIPSIZE である。Windows 2000
より前のシステムでは、文字列のサイズは MAX_PATH により制限される。


%index
IShellLinkW_SetDescription
シェルリンクオブジェクトの説明を設定する。説明はアプリケーションが定義する任意の文字列でよい。(Unicode)
%prm
this, pszName
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszName : [wstr] 型: LPCTSTR 新しい説明文字列を含むバッファへのポインター。
%inst
シェルリンクオブジェクトの説明を設定する。説明はアプリケーションが定義する任意の文字列でよい。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
Windows 2000 以降では pszName で指定する文字列は INFOTIPSIZE 以下でなければならない。Windows
2000 より前のシステムでは、文字列のサイズは MAX_PATH により制限される。


%index
IShellLinkW_GetWorkingDirectory
シェルリンクオブジェクトの作業ディレクトリ名を取得する。(Unicode)
%prm
this, pszDir, cch
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszDir : [wstr] 型: LPTSTR 作業ディレクトリ名を受け取るバッファのアドレス。
cch : [int] 型: int pszDir パラメーターが指すバッファにコピーする最大文字数。このパラメーターで指定した最大値より長い場合、作業ディレクトリ名は切り詰められる。
%inst
シェルリンクオブジェクトの作業ディレクトリ名を取得する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellLinkW_SetWorkingDirectory
シェルリンクオブジェクトの作業ディレクトリ名を設定する。(Unicode)
%prm
this, pszDir
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszDir : [wstr] 型: LPCTSTR 新しい作業ディレクトリ名を含むバッファのアドレス。
%inst
シェルリンクオブジェクトの作業ディレクトリ名を設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

作業ディレクトリはターゲットが作業ディレクトリを必要としない限り省略可能である。例えば、アプリケーションが異なるディレクトリにあるテンプレートを使用する
Microsoft Word
ドキュメントへのシェルリンクを作成する場合、アプリケーションはこのメソッドを使って作業ディレクトリを設定する。


%index
IShellLinkW_GetArguments
シェルリンクオブジェクトに関連付けられたコマンドライン引数を取得する。(Unicode)
%prm
this, pszArgs, cch
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszArgs : [wstr] 型: LPTSTR このメソッドが正常に戻ったときにコマンドライン引数を受け取るバッファへのポインター。
cch : [int] 型: int pszArgs パラメーターが提供するバッファにコピーできる最大文字数。Unicode 文字列の場合、文字列の最大長に制限はない。ANSI 文字列の場合、返される文字列の最大長は Windows のバージョンによって異なる。Windows 2000 より前は MAX_PATH、Windows 2000 以降は INFOTIPSIZE（Commctrl.h で定義）。
%inst
シェルリンクオブジェクトに関連付けられたコマンドライン引数を取得する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
Windows 7
以降では、提供されたバッファが十分な大きさでない場合にこのメソッドは黙って文字列を切り詰めることがあるため、このメソッドよりも
IPropertyStore 経由で（PKEY_Link_Arguments
値を使って）引数文字列を取得することが推奨される。IPropertyStore は適切なサイズの文字列を確保する。


%index
IShellLinkW_SetArguments
シェルリンクオブジェクトのコマンドライン引数を設定する。(Unicode)
%prm
this, pszArgs
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszArgs : [wstr] 型: LPCTSTR 新しいコマンドライン引数を含むバッファへのポインター。Unicode 文字列の場合、文字列の最大長に制限はない。ANSI 文字列の場合、返される文字列の最大長は Windows のバージョンによって異なる。Windows 2000 より前は MAX_PATH、Windows 2000 以降は INFOTIPSIZE（Commctrl.h で定義）。
%inst
シェルリンクオブジェクトのコマンドライン引数を設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
このメソッドは、コンパイラーのように特別なフラグを引数として取るアプリケーションへのリンクを作成するときに便利である。


%index
IShellLinkW_GetHotkey
シェルリンクオブジェクトのキーボードショートカット（ホットキー）を取得する。(Unicode)
%prm
this, pwHotkey
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pwHotkey : [int] 型: WORD*
%inst
シェルリンクオブジェクトのキーボードショートカット（ホットキー）を取得する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellLinkW_SetHotkey
シェルリンクオブジェクトのキーボードショートカット（ホットキー）を設定する。(Unicode)
%prm
this, wHotkey
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
wHotkey : [int] 型: WORD 新しいキーボードショートカット。下位バイトに仮想キーコードが、上位バイトに修飾フラグが格納される。修飾フラグは IShellLink::GetHotkey メソッドの説明で指定された値の組み合わせでよい。
%inst
シェルリンクオブジェクトのキーボードショートカット（ホットキー）を設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
キーボードショートカットを設定すると、特定のキーの組み合わせを押すことでユーザーがオブジェクトをアクティブ化できるようになる。


%index
IShellLinkW_GetShowCmd
シェルリンクオブジェクトの表示コマンドを取得する。(Unicode)
%prm
this, piShowCmd
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
piShowCmd : [var] 型: int* コマンドへのポインター。以下のコマンドがサポートされる。
%inst
シェルリンクオブジェクトの表示コマンドを取得する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
表示コマンドは対応するオブジェクトの初期表示状態を設定するのに使用する。これは ShowWindow に記載されている SW_xxx 値の
1 つ。


%index
IShellLinkW_SetShowCmd
シェルリンクオブジェクトの表示コマンドを設定する。表示コマンドはウィンドウの初期表示状態を設定する。(Unicode)
%prm
this, iShowCmd
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
iShowCmd : [int] 型: int コマンド。SetShowCmd は以下の ShowWindow コマンドのいずれかを受け取る。
%inst
シェルリンクオブジェクトの表示コマンドを設定する。表示コマンドはウィンドウの初期表示状態を設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellLinkW_GetIconLocation
シェルリンクオブジェクトのアイコンの位置（パスとインデックス）を取得する。(Unicode)
%prm
this, pszIconPath, cch, piIcon
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszIconPath : [wstr] 型: LPTSTR アイコンを含むファイルのパスを受け取るバッファのアドレス。
cch : [int] 型: int pszIconPath パラメーターが指すバッファにコピーする最大文字数。
piIcon : [int] 型: int* アイコンのインデックスを受け取る値のアドレス。
%inst
シェルリンクオブジェクトのアイコンの位置（パスとインデックス）を取得する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellLinkW_SetIconLocation
シェルリンクオブジェクトのアイコンの位置（パスとインデックス）を設定する。(Unicode)
%prm
this, pszIconPath, iIcon
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszIconPath : [wstr] 型: LPCTSTR アイコンを含むファイルのパスを格納するバッファのアドレス。
iIcon : [int] 型: int アイコンのインデックス。
%inst
シェルリンクオブジェクトのアイコンの位置（パスとインデックス）を設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IShellLinkW_SetRelativePath
シェルリンクオブジェクトへの相対パスを設定する。(Unicode)
%prm
this, pszPathRel, dwReserved
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszPathRel : [wstr] 型: LPCTSTR ショートカット解決の基準となるショートカットファイルの完全修飾パスを含むバッファのアドレス。フォルダー名ではなくファイル名でなければならない。
dwReserved : [int] 型: DWORD 予約済み。このパラメーターには 0 を設定する。
%inst
シェルリンクオブジェクトへの相対パスを設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]

クライアントはリンクがターゲットとともに移動される可能性があり、絶対パスが無効になる場合に、相対リンクを定義することがある。SetRelativePath
メソッドは、ターゲットと相対パスとの間の共通のパスプレフィックスに基づいてリンク解決プロセスがターゲットを見つけるのを助けるのに使える。解決プロセスを支援するため、クライアントはリンク作成プロセスの一部として相対パスを設定するべきである。


%index
IShellLinkW_Resolve
シェルリンクのターゲットが移動または名前変更されていても、それを見つけようと試みる。(Unicode)
%prm
this, hwnd, fFlags
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
hwnd : [intptr] 型: HWND シェルがダイアログボックスの親として使用するウィンドウへのハンドル。シェルリンクの解決中に追加情報をユーザーに求める必要がある場合、シェルはダイアログボックスを表示する。
fFlags : [int] 型: DWORD
%inst
シェルリンクのターゲットが移動または名前変更されていても、それを見つけようと試みる。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。

[備考]
リンク作成後、ターゲットの名前や場所が変わることがある。IShellLink::Resolve
メソッドは最初にリンクに関連付けられたパスを取得する。オブジェクトがその場所にもう存在しないか名前が変更されている場合、Resolve
はそれを見つけようと試みる。成功し、次の条件が満たされている場合、リンクオブジェクトがロードされたファイルはリンクオブジェクトの新しい状態を反映するように更新される。
（以下省略）


%index
IShellLinkW_SetPath
シェルリンクオブジェクトのターゲットのパスとファイル名を設定する。(Unicode)
%prm
this, pszFile
this : [comobj] IShellLinkW インターフェースの COM オブジェクト変数
pszFile : [wstr] 型: LPCTSTR 新しいパスを含むバッファのアドレス。
%inst
シェルリンクオブジェクトのターゲットのパスとファイル名を設定する。(Unicode)

[戻り値]
型: HRESULT このメソッドが成功した場合 S_OK を返す。そうでなければ HRESULT エラーコードを返す。


%index
IStream_Read
IStream::Read (vtable slot 3)
%prm
this, pv, cb, pcbRead
this : [comobj] IStream インターフェースの COM オブジェクト変数
pv : [intptr] 
cb : [int] 
pcbRead : [var] 
%inst


%index
IStream_Write
IStream::Write (vtable slot 4)
%prm
this, pv, cb, pcbWritten
this : [comobj] IStream インターフェースの COM オブジェクト変数
pv : [intptr] 
cb : [int] 
pcbWritten : [var] 
%inst


%index
IStream_Seek
シークポインタを新しい位置に変更する。新しい位置は、ストリームの先頭、ストリームの末尾、または現在のシークポインタからの相対位置である。
%prm
this, dlibMove, dwOrigin, plibNewPosition
this : [comobj] IStream インターフェースの COM オブジェクト変数
dlibMove : [int64] dwOrigin パラメータで示される位置に加算される変位。dwOrigin が STREAM_SEEK_SET の場合、これは符号付き値ではなく符号なし値として解釈される。
dwOrigin : [int] dlibMove で指定された変位の起点。起点は、ファイルの先頭 (STREAM_SEEK_SET)、現在のシークポインタ (STREAM_SEEK_CUR)、またはファイルの末尾 (STREAM_SEEK_END) のいずれかにできる。値の詳細については STREAM_SEEK 列挙を参照。
plibNewPosition : [var] このメソッドが、ストリームの先頭からの新しいシークポインタの値を書き込む位置へのポインタ。このポインタを NULL に設定できる。その場合、このメソッドは新しいシークポインタを提供しない。
%inst
シークポインタを新しい位置に変更する。新しい位置は、ストリームの先頭、ストリームの末尾、または現在のシークポインタからの相対位置である。

[戻り値]
このメソッドは次のいずれかの値を返す。 | リターンコード | 説明 |
|----------------|---------------| |S_OK | シークポインタが正常に調整された。|
|E_PENDING | 非同期ストレージのみ: ストリームデータの一部または全部が現在利用できない。 |
|STG_E_INVALIDPOINTER | *plibNewPosition*
が読み取られないため、*plibNewPosition* が無効なメモリを指していることを示す。|
|STG_E_INVALIDFUNCTION | *dwOrigin* パラメータに無効な値が含まれているか、*dlibMove*
パラメータに不正なオフセット値が含まれている。たとえば、シークポインタの結果が負のオフセット値である。| |STG_E_REVERTED
| トランザクションツリーの上位の revert 操作によりオブジェクトが無効化された。|

[備考]
IStream::Seek
はシークポインタを変更し、ストリームオブジェクト内の異なる位置で後続の読み書き操作を実行できるようにする。ストリームの先頭より前にシークすることはエラーである。ただし、ストリームの末尾を超えてシークすることはエラーではない。ストリームの末尾を超えてシークすることは、後続の書き込み操作に有用である。書き込みが完了する直前にストリームのバイト範囲が新しいシーク位置まで拡張されるからである。dwOrigin
パラメータを STREAM_SEEK_CUR に、dlibMove パラメータを 0
に設定してこのメソッドを呼び出すことで、シークポインタを変更せずにシークポインタの現在の値を取得することもできる。現在のシークポインタは
plibNewPosition パラメータで返される。


%index
IStream_SetSize
ストリームオブジェクトのサイズを変更する。
%prm
this, libNewSize
this : [comobj] IStream インターフェースの COM オブジェクト変数
libNewSize : [int64] ストリームの新しいサイズ (バイト単位) を指定する。
%inst
ストリームオブジェクトのサイズを変更する。

[戻り値]
このメソッドは次のいずれかの値を返す。 | リターンコード | 説明 |
|----------------|---------------| |S_OK | ストリームオブジェクトのサイズが正常に変更された。|
|E_PENDING | 非同期ストレージのみ: ストリームのデータの一部または全部が現在利用できない。|
|STG_E_MEDIUMFULL | ストレージデバイスに空き容量がないため、ストリームサイズが変更されない。|
|STG_E_INVALIDFUNCTION | *libNewSize*
パラメータの値が実装によってサポートされていない。すべてのストリームが 232
バイトを超えるサイズをサポートするわけではない。ストリームが 232 バイトを超えるサイズをサポートしない場合、*libNewSize*
の上位 DWORD データ型は 0 でなければならない。0 でない場合、実装は STG_E_INVALIDFUNCTION
を返す可能性がある。一般に、IStream インターフェースの COM ベースの実装は 232
バイトを超えるストリームをサポートしない。| |STG_E_REVERTED | トランザクションツリーの上位の revert
操作によりオブジェクトが無効化された。|

[備考]
IStream::SetSize
はストリームオブジェクトのサイズを変更する。このメソッドを呼び出してストリーム用の領域を事前に確保する。libNewSize
パラメータが現在のストリームサイズよりも大きい場合、ストリームは指定されたサイズに拡張され、間の領域は未定義の値のバイトで埋められる。この操作は、シークポインタが現在のストリームの末尾を超えている場合の
ISequentialStream::Write メソッドに似ている。libNewSize
パラメータが現在のストリームよりも小さい場合、ストリームは指定されたサイズに切り詰められる。シークポインタはストリームサイズの変更の影響を受けない。IStream::SetSize
の呼び出しは、連続した大きな領域を取得する効果的な方法である。


%index
IStream_CopyTo
ストリームの現在のシークポインタから別のストリームの現在のシークポインタへ、指定されたバイト数をコピーする。
%prm
this, pstm, cb, pcbRead, pcbWritten
this : [comobj] IStream インターフェースの COM オブジェクト変数
pstm : [comobj] 宛先ストリームへのポインタ。pstm が指すストリームは、新しいストリームでもソースストリームのクローンでもよい。
cb : [int64] ソースストリームからコピーするバイト数。
pcbRead : [var] このメソッドがソースから実際に読み取ったバイト数を書き込む位置へのポインタ。このポインタを NULL に設定できる。その場合、このメソッドは実際に読み取ったバイト数を提供しない。
pcbWritten : [var] このメソッドが宛先に実際に書き込んだバイト数を書き込む位置へのポインタ。このポインタを NULL に設定できる。その場合、このメソッドは実際に書き込んだバイト数を提供しない。
%inst
ストリームの現在のシークポインタから別のストリームの現在のシークポインタへ、指定されたバイト数をコピーする。

[戻り値]
このメソッドは次のいずれかの値を返す。 | リターンコード | 説明 |
|----------------|---------------| |S_OK | ストリームオブジェクトが正常にコピーされた。|
|E_PENDING | 非同期ストレージのみ: コピー対象のデータの一部または全部が現在利用できない。 |
|STG_E_INVALIDPOINTER | ポインタパラメータの 1 つの値が無効である。| |STG_E_MEDIUMFULL |
ストレージデバイスに空き容量がないため、ストリームがコピーされない。| |STG_E_REVERTED | トランザクションツリーの上位の
revert 操作によりオブジェクトが無効化された。|

[備考]
CopyTo メソッドは、指定されたバイトを 1
つのストリームから別のストリームにコピーする。ストリームを自分自身にコピーするのにも使用できる。各ストリームインスタンスのシークポインタは、読み書きされたバイト数だけ調整される。このメソッドは、ISequentialStream::Read
を使用して cb バイトをメモリに読み込み、即座に ISequentialStream::Write
を使用して宛先ストリームに書き込むのと等価であるが、IStream::CopyTo
の方が効率的である。宛先ストリームは、IStream::Clone
メソッドを呼び出して作成したソースストリームのクローンでもよい。IStream::CopyTo
がエラーを返した場合、ソースまたは宛先のシークポインタが有効であると仮定してはならない。さらに、pcbRead と pcbWritten
の値は返されても意味を持たない。IStream::CopyTo
が成功した場合、実際に読み書きされたバイト数は同じである。現在のシークポインタからソースの残りをコピーするには、cb パラメータに最大の
large integer 値を指定する。シークポインタがストリームの先頭にある場合、この操作はストリーム全体をコピーする。


%index
IStream_Commit
Commit メソッドは、トランザクションモードで開かれたストリームオブジェクトに対する変更が親ストレージに反映されることを保証する。
%prm
this, grfCommitFlags
this : [comobj] IStream インターフェースの COM オブジェクト変数
grfCommitFlags : [int] ストリームオブジェクトの変更がコミットされる方法を制御する。これらの値の定義については STGC 列挙を参照。
%inst
Commit メソッドは、トランザクションモードで開かれたストリームオブジェクトに対する変更が親ストレージに反映されることを保証する。

[戻り値]
このメソッドは次のいずれかの値を返す。 | リターンコード | 説明 |
|----------------|---------------| |S_OK |
ストリームオブジェクトの変更が親レベルに正常にコミットされた。| |E_PENDING | 非同期ストレージのみ:
ストリームのデータの一部または全部が現在利用できない。 | |STG_E_MEDIUMFULL |
ストレージデバイスの空き容量不足のためコミット操作が失敗した。| |STG_E_REVERTED | トランザクションツリーの上位の
revert 操作によりオブジェクトが無効化された。|

[備考]
Commit
メソッドは、トランザクションモードで開かれたストリームオブジェクトに対する変更が親ストレージに反映されることを保証する。ストリームが開かれてから、または最後にコミットされてから行われた変更が親ストレージオブジェクトに反映される。親がトランザクションモードで開かれている場合、親は後で
revert
する可能性があり、このストリームオブジェクトへの変更がロールバックされる。複合ファイル実装ではトランザクションモードでのストリームの開放はサポートされないため、このメソッドはメモリバッファをフラッシュする以外にほとんど効果がない。詳細は
IStream - Compound File Implementation
を参照。ストリームが直接モードで開かれている場合、このメソッドはメモリバッファが基礎となるストレージオブジェクトにフラッシュされていることを保証する。これは従来のファイルシステムのフラッシュによく似ている。IStream::Commit
メソッドは、IStream インターフェースの実装が基礎となるファイルシステム API
のラッパである直接モードのストリームに対して有用である。この場合、IStream::Commit
はファイルシステムのフラッシュ呼び出しに接続される。


%index
IStream_Revert
Revert メソッドは、最後の IStream::Commit 呼び出し以降にトランザクション付きストリームに対して行われたすべての変更を破棄する。直接モードで開かれたストリームと、IStream::Revert の COM 複合ファイル実装を使用するストリームでは、このメソッドには効果がない。
%prm
this
this : [comobj] IStream インターフェースの COM オブジェクト変数
%inst
Revert メソッドは、最後の IStream::Commit
呼び出し以降にトランザクション付きストリームに対して行われたすべての変更を破棄する。直接モードで開かれたストリームと、IStream::Revert
の COM 複合ファイル実装を使用するストリームでは、このメソッドには効果がない。

[戻り値]
このメソッドは次のいずれかの値を返す。 | リターンコード | 説明 |
|----------------|---------------| |S_OK | ストリームが以前のバージョンに正常に戻された。|
|E_PENDING | 非同期ストレージのみ: ストリームのデータの一部または全部が現在利用できない。 |

[備考]
Revert メソッドは、最後のコミット操作以降にトランザクション付きストリームに対して行われた変更を破棄する。


%index
IStream_LockRegion
LockRegion メソッドはストリーム内の指定されたバイト範囲へのアクセスを制限する。
%prm
this, libOffset, cb, dwLockType
this : [comobj] IStream インターフェースの COM オブジェクト変数
libOffset : [int64] 範囲の先頭のバイトオフセットを指定する整数。
cb : [int64] 制限する範囲の長さ (バイト単位) を指定する整数。
dwLockType : [int] 範囲へのアクセスに対して要求される制限を指定する。
%inst
LockRegion メソッドはストリーム内の指定されたバイト範囲へのアクセスを制限する。

[戻り値]
このメソッドは次のいずれかの値を返す。 | リターンコード | 説明 |
|----------------|---------------| |S_OK | 指定されたバイト範囲がロックされた。|
|E_PENDING | 非同期ストレージのみ: ストリームのデータの一部または全部が現在利用できない。 |
|STG_E_INVALIDFUNCTION | ロックがまったくサポートされないか、要求された特定のタイプのロックがサポートされない。|
|STG_E_LOCKVIOLATION | 要求されたロックはサポートされているが、既存のロックのため許可できない。|
|STG_E_REVERTED | トランザクションツリーの上位の revert 操作によりオブジェクトが無効化された。|

[備考]

ストリームのバイト範囲は拡張できる。ストリームの拡張範囲をロックすることは、実際にはストリームの一部であるデータを変更せずに、ストリームの異なるインスタンス間の通信方法として有用である。3
つのタイプのロックがサポートされる: 他のライタを除外するロック、他のリーダまたはライタを除外するロック、指定された範囲に対するロックを
1 つの要求者のみが取得できるロック。これは通常、他の 2 つのロックタイプの 1
つのエイリアスである。指定されたストリームインスタンスは、最初の 2
つのタイプのいずれか、または両方をサポートする場合がある。ロックタイプは LOCKTYPE 列挙の値を使用して dwLockType
で指定する。IStream::LockRegion でロックされた領域は、後で libOffset、cb、dwLockType
パラメータにまったく同じ値を指定して IStream::UnlockRegion
を呼び出して明示的にロック解除する必要がある。ストリームが解放される前に領域をロック解除する必要がある。隣接する 2
つの領域を別々にロックして、1 回のロック解除呼び出しでロック解除することはできない。呼び出し側への注意
サポートされるロックのタイプはオプションで、IStream の異なる実装で異なる場合があるため、STG_E_INVALIDFUNCTION
エラーに対処するコードを提供する必要がある。LockRegion
メソッドは複合ファイル実装には効果がない。実装が範囲ロックをサポートしないからである。実装者への注意
このメソッドのサポートはストリームオブジェクトの実装に対してオプションである。基礎となるファイルシステムによってサポートされない可能性があるからである。サポートされるロックのタイプもオプションである。要求されたタイプのロックがサポートされない場合、STG_E_INVALIDFUNCTION
エラーが返される。


%index
IStream_UnlockRegion
UnlockRegion メソッドは、IStream::LockRegion で以前に制限されたバイト範囲のアクセス制限を削除する。
%prm
this, libOffset, cb, dwLockType
this : [comobj] IStream インターフェースの COM オブジェクト変数
libOffset : [int64] 範囲の先頭のバイトオフセットを指定する。
cb : [int64] 制限する範囲の長さ (バイト単位) を指定する。
dwLockType : [int] 範囲に以前に設定されたアクセス制限を指定する。
%inst
UnlockRegion メソッドは、IStream::LockRegion で以前に制限されたバイト範囲のアクセス制限を削除する。

[戻り値]
このメソッドは次のいずれかの値を返す。 | リターンコード | 説明 |
|----------------|---------------| |S_OK | バイト範囲がロック解除された。|
|E_PENDING | 非同期ストレージのみ: ストリームのデータの一部または全部が現在利用できない。|
|STG_E_INVALIDFUNCTION | ロックがまったくサポートされないか、要求された特定のタイプのロックがサポートされない。|
|STG_E_LOCKVIOLATION | 要求されたロック解除操作を許可できない。| |STG_E_REVERTED |
トランザクションツリーの上位の revert 操作によりオブジェクトが無効化された。|

[備考]
IStream::UnlockRegion は、IStream::LockRegion
メソッドで以前にロックされた領域をロック解除する。ロックされた領域は、後で libOffset、cb、dwLockType
パラメータにまったく同じ値を指定して IStream::UnlockRegion
を呼び出して明示的にロック解除する必要がある。ストリームが解放される前に領域をロック解除する必要がある。隣接する 2
つの領域を別々にロックして、1 回のロック解除呼び出しでロック解除することはできない。


%index
IStream_Stat
Stat メソッドは、このストリームの STATSTG 構造体を取得する。
%prm
this, pstatstg, grfStatFlag
this : [comobj] IStream インターフェースの COM オブジェクト変数
pstatstg : [var] このメソッドがこのストリームオブジェクトに関する情報を配置する STATSTG 構造体へのポインタ。
grfStatFlag : [int] このメソッドが STATSTG 構造体のメンバの一部を返さないように指定し、メモリ確保操作を節約する。値は STATFLAG 列挙から取得される。
%inst
Stat メソッドは、このストリームの STATSTG 構造体を取得する。

[戻り値]
このメソッドは次のいずれかの値を返す。 | リターンコード | 説明 |
|----------------|---------------| |S_OK | STATSTG
構造体が指定された位置に正常に返された。| |E_PENDING | 非同期ストレージのみ:
ストリームのデータの一部または全部が現在利用できない。 | |STG_E_ACCESSDENIED |
呼び出し側にこのストレージオブジェクトの統計情報にアクセスするための十分な権限がない。|
|STG_E_INSUFFICIENTMEMORY | メモリ不足のため STATSTG 構造体が返されなかった。|
|STG_E_INVALIDFLAG | *grfStateFlag* パラメータの値が有効でない。|
|STG_E_INVALIDPOINTER | *pStatStg* ポインタが有効でない。| |STG_E_REVERTED |
トランザクションツリーの上位の revert 操作によりオブジェクトが無効化された。|

[備考]
IStream::Stat は、この開いているストリームに関する情報を含む STATSTG
構造体へのポインタを取得する。このストリームが構造化ストレージ内にあり、IStorage::EnumElements
が呼び出されると、IEnumSTATSTG インターフェースを持つ列挙オブジェクトが作成され、それぞれに関連付けられた STATSTG
構造体を通じてストレージとストリームを列挙するために呼び出すことができる。


%index
IStream_Clone
Clone メソッドは、元のストリームと同じバイトを参照する独自のシークポインタを持つ新しいストリームオブジェクトを作成する。
%prm
this, ppstm
this : [comobj] IStream インターフェースの COM オブジェクト変数
ppstm : [comobj] 成功した場合、新しいストリームオブジェクトの IStream ポインタの位置へのポインタ。エラーが発生した場合、このパラメータは NULL になる。
%inst
Clone メソッドは、元のストリームと同じバイトを参照する独自のシークポインタを持つ新しいストリームオブジェクトを作成する。

[戻り値]
このメソッドは次のいずれかの値を返す。 | リターンコード | 説明 |
|----------------|---------------| |S_OK | ストリームが正常にクローンされた。|
|E_PENDING | 非同期ストレージのみ: ストリームのデータの一部または全部が現在利用できない。 |
|STG_E_INSUFFICIENTMEMORY | メモリ不足のためストリームがクローンされなかった。|
|STG_E_INVALIDPOINTER | ppStm ポインタが有効でない。| |STG_E_REVERTED |
トランザクションツリーの上位の revert 操作によりオブジェクトが無効化された。|

[備考]
Clone
メソッドは、同じバイトにアクセスするが別のシークポインタを使用する新しいストリームオブジェクトを作成する。新しいストリームオブジェクトはソースストリームオブジェクトと同じデータを参照する。一方のオブジェクトに書き込まれた変更は、もう一方にもただちに反映される。範囲ロックはストリームオブジェクト間で共有される。クローンされたストリームインスタンスのシークポインタの初期設定は、クローン操作時の元のストリームのシークポインタの現在の設定と同じである。


%index
IWICBitmap_GetSize
IWICBitmap::GetSize (vtable slot 3)
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICBitmap_GetPixelFormat
IWICBitmap::GetPixelFormat (vtable slot 4)
%prm
this, pPixelFormat
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICBitmap_GetResolution
IWICBitmap::GetResolution (vtable slot 5)
%prm
this, pDpiX, pDpiY
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICBitmap_CopyPalette
IWICBitmap::CopyPalette (vtable slot 6)
%prm
this, pIPalette
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICBitmap_CopyPixels
IWICBitmap::CopyPixels (vtable slot 7)
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICBitmap_Lock
ビットマップの矩形領域へのアクセスを提供する。
%prm
this, prcLock, flags, ppILock
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
prcLock : [var] 型: const WICRect* アクセスする矩形。
flags : [int] 型: DWORD ロックに対して取得したいアクセスモード。読み取り、書き込み、または読み書き両用のアクセスを示す WICBitmapLockFlags のビット単位の組み合わせ。
ppILock : [comobj] 型: IWICBitmapLock** ロックされたメモリ位置を受け取るポインタ。
%inst
ビットマップの矩形領域へのアクセスを提供する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
ロックは書き込みについては排他的だが、読み取りについては共有可能である。IWICBitmap が書き込み用にロックされている間は
CopyPixels を呼び出すことはできない。ロックは排他的なので、それを行うとエラーが返される。


%index
IWICBitmap_SetPalette
パレットを変更するためのアクセスを提供する。
%prm
this, pIPalette
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
pIPalette : [comobj] 型: IWICPalette* 変換に使用するパレット。
%inst
パレットを変更するためのアクセスを提供する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmap_SetResolution
画像の物理解像度を変更する。
%prm
this, dpiX, dpiY
this : [comobj] IWICBitmap インターフェースの COM オブジェクト変数
dpiX : [double] 型: double 水平方向の解像度。
dpiY : [double] 型: double 垂直方向の解像度。
%inst
画像の物理解像度を変更する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]

このメソッドはビットマップに格納された実際のピクセルやサンプルには影響しない。代わりに、サンプリングレートの解釈が変更される。これはたとえば、幅
96 ピクセルの 96 DPI 画像は 1 インチであることを意味する。物理解像度を 48 DPI に変更すると、ビットマップは 2
インチ幅とみなされるが、ピクセル数は同じである。解像度が REAL_EPSILON (1.192092896e-07F)
未満の場合、エラーコード WINCODEC_ERR_INVALIDPARAMETER が返される。


%index
IWICBitmapClipper_GetSize
IWICBitmapClipper::GetSize (vtable slot 3)
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmapClipper インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICBitmapClipper_GetPixelFormat
IWICBitmapClipper::GetPixelFormat (vtable slot 4)
%prm
this, pPixelFormat
this : [comobj] IWICBitmapClipper インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICBitmapClipper_GetResolution
IWICBitmapClipper::GetResolution (vtable slot 5)
%prm
this, pDpiX, pDpiY
this : [comobj] IWICBitmapClipper インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICBitmapClipper_CopyPalette
IWICBitmapClipper::CopyPalette (vtable slot 6)
%prm
this, pIPalette
this : [comobj] IWICBitmapClipper インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICBitmapClipper_CopyPixels
IWICBitmapClipper::CopyPixels (vtable slot 7)
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICBitmapClipper インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICBitmapClipper_Initialize
指定したパラメータでビットマップクリッパーを初期化する。
%prm
this, pISource, prc
this : [comobj] IWICBitmapClipper インターフェースの COM オブジェクト変数
pISource : [comobj] 型: IWICBitmapSource* 入力となるビットマップソース。
prc : [var] 型: const WICRect* 切り抜く対象となるビットマップソース上の矩形。
%inst
指定したパラメータでビットマップクリッパーを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IWICBitmapCodecInfo_GetComponentType
IWICBitmapCodecInfo::GetComponentType (vtable slot 3)
%prm
this, pType
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pType : [var] 
%inst


%index
IWICBitmapCodecInfo_GetCLSID
IWICBitmapCodecInfo::GetCLSID (vtable slot 4)
%prm
this, pclsid
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pclsid : [var] 
%inst


%index
IWICBitmapCodecInfo_GetSigningStatus
IWICBitmapCodecInfo::GetSigningStatus (vtable slot 5)
%prm
this, pStatus
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pStatus : [int] 
%inst


%index
IWICBitmapCodecInfo_GetAuthor
IWICBitmapCodecInfo::GetAuthor (vtable slot 6)
%prm
this, cchAuthor, wzAuthor, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchAuthor : [int] 
wzAuthor : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapCodecInfo_GetVendorGUID
IWICBitmapCodecInfo::GetVendorGUID (vtable slot 7)
%prm
this, pguidVendor
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pguidVendor : [var] 
%inst


%index
IWICBitmapCodecInfo_GetVersion
IWICBitmapCodecInfo::GetVersion (vtable slot 8)
%prm
this, cchVersion, wzVersion, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchVersion : [int] 
wzVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapCodecInfo_GetSpecVersion
IWICBitmapCodecInfo::GetSpecVersion (vtable slot 9)
%prm
this, cchSpecVersion, wzSpecVersion, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchSpecVersion : [int] 
wzSpecVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapCodecInfo_GetFriendlyName
IWICBitmapCodecInfo::GetFriendlyName (vtable slot 10)
%prm
this, cchFriendlyName, wzFriendlyName, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchFriendlyName : [int] 
wzFriendlyName : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapCodecInfo_GetContainerFormat
コーデックに関連付けられたコンテナ GUID を取得する。
%prm
this, pguidContainerFormat
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] 型: GUID* コンテナ GUID を受け取る。
%inst
コーデックに関連付けられたコンテナ GUID を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapCodecInfo_GetPixelFormats
コーデックがサポートするピクセルフォーマットを取得する。
%prm
this, cFormats, pguidPixelFormats, pcActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cFormats : [int] 型: UINT pguidPixelFormats 配列のサイズ。必要な配列サイズを判別するために、最初の呼び出しでは 0 を使用する。
pguidPixelFormats : [var] 型: GUID* サポートされているピクセルフォーマットを受け取る。必要な配列サイズを判別するために、最初の呼び出しでは NULL を使用する。
pcActual : [int] 型: UINT* サポートされているすべてのピクセルフォーマットを取得するために必要な配列サイズ。
%inst
コーデックがサポートするピクセルフォーマットを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
このメソッドの使用パターンは 2 回の呼び出しプロセスである。最初の呼び出しでは、cFormats を 0
に、pguidPixelFormats を NULL
に設定して呼び出すことで、サポートされているすべてのピクセルフォーマットを取得するために必要な配列サイズを取得する。この呼び出しは
pcActual に必要な配列サイズを設定する。必要な配列サイズが判明したら、pguidPixelFormats
を適切なサイズの配列に設定して GetPixelFormats を 2 回目に呼び出すと、ピクセルフォーマットが取得される。


%index
IWICBitmapCodecInfo_GetColorManagementVersion
コーデックがサポートするカラーマネジメントバージョン番号を取得する。
%prm
this, cchColorManagementVersion, wzColorManagementVersion, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchColorManagementVersion : [int] 型: UINT バージョンバッファのサイズ。必要なバッファサイズを判別するために、最初の呼び出しでは 0 を使用する。
wzColorManagementVersion : [wstr] 型: WCHAR* カラーマネジメントバージョン番号を受け取る。必要なバッファサイズを判別するために、最初の呼び出しでは NULL を使用する。
pcchActual : [int] 型: UINT* 完全なカラーマネジメントバージョン番号を取得するために必要な実際のバッファサイズ。
%inst
コーデックがサポートするカラーマネジメントバージョン番号を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
このメソッドの使用パターンは 2 回の呼び出しプロセスである。最初の呼び出しでは、cchColorManagementVersion を
0 に、wzColorManagementVersion を NULL
に設定して呼び出すことで、完全なカラーマネジメントバージョン番号を取得するために必要なバッファサイズを取得する。この呼び出しは
pcchActual
に必要なバッファサイズを設定する。必要なバッファサイズが判明したら、cchColorManagementVersion
をバッファサイズに、wzColorManagementVersion を適切なサイズのバッファに設定して
GetColorManagementVersion を 2 回目に呼び出すと、ピクセルフォーマットが取得される。


%index
IWICBitmapCodecInfo_GetDeviceManufacturer
コーデックに関連付けられたデバイス製造元名を取得する。
%prm
this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchDeviceManufacturer : [int] 型: UINT デバイス製造元名のサイズ。必要なバッファサイズを判別するために、最初の呼び出しでは 0 を使用する。
wzDeviceManufacturer : [wstr] 型: WCHAR* デバイス製造元名を受け取る。必要なバッファサイズを判別するために、最初の呼び出しでは NULL を使用する。
pcchActual : [int] 型: UINT* デバイス製造元名を取得するために必要な実際のバッファサイズ。
%inst
コーデックに関連付けられたデバイス製造元名を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
このメソッドの使用パターンは 2 回の呼び出しプロセスである。最初の呼び出しでは、cchDeviceManufacturer を 0
に、wzDeviceManufacturer を NULL に設定して呼び出すことで、必要なバッファサイズを取得する。この呼び出しは
pcchActual に必要なバッファサイズを設定する。必要なバッファサイズが判明したら、cchDeviceManufacturer
をバッファサイズに、wzDeviceManufacturer を適切なサイズのバッファに設定して
GetDeviceManufacturer を 2 回目に呼び出すと、ピクセルフォーマットが取得される。


%index
IWICBitmapCodecInfo_GetDeviceModels
コーデックに関連付けられたカンマ区切りのデバイスモデルのリストを取得する。
%prm
this, cchDeviceModels, wzDeviceModels, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchDeviceModels : [int] 型: UINT デバイスモデルバッファのサイズ。必要なバッファサイズを判別するために、最初の呼び出しでは 0 を使用する。
wzDeviceModels : [wstr] 型: WCHAR* コーデックに関連付けられたカンマ区切りのデバイスモデル名のリストを受け取る。必要なバッファサイズを判別するために、最初の呼び出しでは NULL を使用する。
pcchActual : [int] 型: UINT* すべてのデバイスモデル名を取得するために必要な実際のバッファサイズ。
%inst
コーデックに関連付けられたカンマ区切りのデバイスモデルのリストを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
このメソッドの使用パターンは 2 回の呼び出しプロセスである。最初の呼び出しでは、cchDeviceModels を 0
に、wzDeviceModels を NULL に設定して呼び出すことで、必要なバッファサイズを取得する。この呼び出しは
pcchActual に必要なバッファサイズを設定する。必要なバッファサイズが判明したら、cchDeviceModels
をバッファサイズに、wzDeviceModels を適切なサイズのバッファに設定して GetDeviceModels を 2
回目に呼び出すと、ピクセルフォーマットが取得される。


%index
IWICBitmapCodecInfo_GetMimeTypes
コーデックに関連付けられた MIME タイプのカンマ区切りシーケンスを取得する。
%prm
this, cchMimeTypes, wzMimeTypes, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchMimeTypes : [int] 型: UINT MIME タイプバッファのサイズ。必要なバッファサイズを判別するために、最初の呼び出しでは 0 を使用する。
wzMimeTypes : [wstr] 型: WCHAR* コーデックに関連付けられた MIME タイプを受け取る。必要なバッファサイズを判別するために、最初の呼び出しでは NULL を使用する。
pcchActual : [int] 型: UINT* コーデックに関連付けられたすべての MIME タイプを取得するために必要な実際のバッファサイズ。
%inst
コーデックに関連付けられた MIME タイプのカンマ区切りシーケンスを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
このメソッドの使用パターンは 2 回の呼び出しプロセスである。最初の呼び出しでは、cchMimeTypes を 0
に、wzMimeTypes を NULL に設定して呼び出すことで、必要なバッファサイズを取得する。この呼び出しは pcchActual
に必要なバッファサイズを設定する。必要なバッファサイズが判明したら、cchMimeTypes をバッファサイズに、wzMimeTypes
を適切なサイズのバッファに設定して GetMimeTypes を 2 回目に呼び出すと、ピクセルフォーマットが取得される。


%index
IWICBitmapCodecInfo_GetFileExtensions
コーデックに関連付けられたファイル名拡張子のカンマ区切りリストを取得する。
%prm
this, cchFileExtensions, wzFileExtensions, pcchActual
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
cchFileExtensions : [int] 型: UINT ファイル名拡張子バッファのサイズ。必要なバッファサイズを判別するために、最初の呼び出しでは 0 を使用する。
wzFileExtensions : [wstr] 型: WCHAR* コーデックに関連付けられたカンマ区切りのファイル名拡張子のリストを受け取る。必要なバッファサイズを判別するために、最初の呼び出しでは NULL を使用する。
pcchActual : [int] 型: UINT* コーデックに関連付けられたすべてのファイル名拡張子を取得するために必要な実際のバッファサイズ。
%inst
コーデックに関連付けられたファイル名拡張子のカンマ区切りリストを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
画像エンコーダのデフォルトの拡張子は、返される拡張子のリストの最初の項目である。このメソッドの使用パターンは 2
回の呼び出しプロセスである。最初の呼び出しでは、cchFileExtensions を 0 に、wzFileExtensions を
NULL に設定して呼び出すことで、必要なバッファサイズを取得する。この呼び出しは pcchActual
に必要なバッファサイズを設定する。必要なバッファサイズが判明したら、cchFileExtensions
をバッファサイズに、wzFileExtensions を適切なサイズのバッファに設定して GetFileExtensions を 2
回目に呼び出すと、ピクセルフォーマットが取得される。


%index
IWICBitmapCodecInfo_DoesSupportAnimation
コーデックがアニメーションをサポートするかどうかを示す値を取得する。
%prm
this, pfSupportAnimation
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pfSupportAnimation : [var] 型: BOOL* コーデックがタイミング情報付きの画像をサポートする場合は TRUE、そうでない場合は FALSE を受け取る。
%inst
コーデックがアニメーションをサポートするかどうかを示す値を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapCodecInfo_DoesSupportChromakey
コーデックがクロマキーをサポートするかどうかを示す値を取得する。
%prm
this, pfSupportChromakey
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pfSupportChromakey : [var] 型: BOOL* コーデックがクロマキーをサポートする場合は TRUE、そうでない場合は FALSE を受け取る。
%inst
コーデックがクロマキーをサポートするかどうかを示す値を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapCodecInfo_DoesSupportLossless
コーデックがロスレスフォーマットをサポートするかどうかを示す値を取得する。
%prm
this, pfSupportLossless
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pfSupportLossless : [var] 型: BOOL* コーデックがロスレスフォーマットをサポートする場合は TRUE、そうでない場合は FALSE を受け取る。
%inst
コーデックがロスレスフォーマットをサポートするかどうかを示す値を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapCodecInfo_DoesSupportMultiframe
コーデックがマルチフレーム画像をサポートするかどうかを示す値を取得する。
%prm
this, pfSupportMultiframe
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
pfSupportMultiframe : [var] 型: BOOL* コーデックがマルチフレーム画像をサポートする場合は TRUE、そうでない場合は FALSE を受け取る。
%inst
コーデックがマルチフレーム画像をサポートするかどうかを示す値を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapCodecInfo_MatchesMimeType
指定された MIME タイプがコーデックの MIME タイプと一致するかどうかを示す値を取得する。
%prm
this, wzMimeType, pfMatches
this : [comobj] IWICBitmapCodecInfo インターフェースの COM オブジェクト変数
wzMimeType : [wstr] 型: LPCWSTR 比較する MIME タイプ。
pfMatches : [var] 型: BOOL* MIME タイプが一致する場合は TRUE、そうでない場合は FALSE を受け取る。
%inst
指定された MIME タイプがコーデックの MIME タイプと一致するかどうかを示す値を取得する。

[戻り値]
型: HRESULT このメソッドは次のいずれかの値を返す。
（以下省略）

[備考]
注 Windows 提供のコーデックはこのメソッドを実装しておらず、E_NOTIMPL を返す。


%index
IWICBitmapDecoder_QueryCapability
指定されたストリームに基づいてデコーダの能力を取得する。
%prm
this, pIStream, pdwCapability
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
pIStream : [comobj] 型: IStream* デコーダの能力を取得するストリーム。
pdwCapability : [int] 型: DWORD* デコーダの WICBitmapDecoderCapabilities。
%inst
指定されたストリームに基づいてデコーダの能力を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
カスタムデコーダの実装は、指定された IStream
の現在の位置を保存し、提供されたストリームに対して提供できる能力を判断するために必要な情報を読み取り、ストリーム位置を復元すべきである。


%index
IWICBitmapDecoder_Initialize
提供されたストリームでデコーダを初期化する。
%prm
this, pIStream, cacheOptions
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
pIStream : [comobj] 型: IStream* 初期化に使用するストリーム。ストリームには、IWICBitmapFrameDecode インターフェースの CopyPixels メソッド (GetFrame を参照) が呼び出されるたびにデコードされるエンコードされたピクセルが含まれる。
cacheOptions : [int] 型: WICDecodeOptions 初期化に使用する WICDecodeOptions。
%inst
提供されたストリームでデコーダを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapDecoder_GetContainerFormat
画像のコンテナフォーマットを取得する。
%prm
this, pguidContainerFormat
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] 型: GUID* 画像のコンテナフォーマット GUID を受け取るポインタ。
%inst
画像のコンテナフォーマットを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapDecoder_GetDecoderInfo
画像の IWICBitmapDecoderInfo を取得する。
%prm
this, ppIDecoderInfo
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
ppIDecoderInfo : [comobj] 型: IWICBitmapDecoderInfo** IWICBitmapDecoderInfo へのポインタを受け取るポインタ。
%inst
画像の IWICBitmapDecoderInfo を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapDecoder_CopyPalette
デコーダの IWICPalette をコピーする。
%prm
this, pIPalette
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
pIPalette : [comobj] 型: IWICPalette* デコーダのグローバルパレットがコピーされる IWICPalette。CopyPalette を呼び出す前に CreatePalette を使用して宛先パレットを作成する。
%inst
デコーダの IWICPalette をコピーする。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
CopyPalette はグローバルパレット (画像内のすべてのフレームに適用されるパレット)
が存在する場合はそれを返し、存在しない場合は WINCODEC_ERR_PALETTEUNAVAILABLE
を返す。画像にグローバルパレットがない場合でも、フレームレベルのパレットを持つ可能性があり、IWICBitmapFrameDecode::CopyPalette
を使用して取得できる。


%index
IWICBitmapDecoder_GetMetadataQueryReader
デコーダからメタデータクエリリーダを取得する。
%prm
this, ppIMetadataQueryReader
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
ppIMetadataQueryReader : [comobj] 型: IWICMetadataQueryReader** デコーダの IWICMetadataQueryReader へのポインタを受け取る。
%inst
デコーダからメタデータクエリリーダを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
画像フォーマットがコンテナレベルのメタデータをサポートしない場合、これは
WINCODEC_ERR_UNSUPPORTEDOPERATION を返す。コンテナレベルのメタデータをサポートする Windows
提供の画像フォーマットは GIF のみである。代わりに
IWICBitmapFrameDecode::GetMetadataQueryReader を使用すること。


%index
IWICBitmapDecoder_GetPreview
サポートされている場合、プレビュー画像を取得する。
%prm
this, ppIBitmapSource
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
ppIBitmapSource : [comobj] 型: IWICBitmapSource** サポートされている場合、プレビュービットマップへのポインタを受け取る。
%inst
サポートされている場合、プレビュー画像を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
すべてのフォーマットがプレビューをサポートするわけではない。プレビューをサポートするのはネイティブの Microsoft Windows
Digital Photo (WDP) コーデックのみである。


%index
IWICBitmapDecoder_GetColorContexts
画像の IWICColorContext オブジェクトを取得する。
%prm
this, cCount, ppIColorContexts, pcActualCount
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
cCount : [int] 型: UINT 取得するカラーコンテキストの数。この値は ppIColorContexts に利用可能なサイズと同じか、それより小さくなければならない。
ppIColorContexts : [comobj] 型: IWICColorContext** IWICColorContext へのポインタを受け取るポインタ。
pcActualCount : [int] 型: UINT* 画像に含まれるカラーコンテキストの数を受け取るポインタ。
%inst
画像の IWICColorContext オブジェクトを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapDecoder_GetThumbnail
存在する場合、画像のビットマップサムネイルを取得する。
%prm
this, ppIThumbnail
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
ppIThumbnail : [comobj] 型: IWICBitmapSource** サムネイルの IWICBitmapSource へのポインタを受け取る。
%inst
存在する場合、画像のビットマップサムネイルを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
返されるサムネイルは任意のサイズになり得るため、呼び出し側はサムネイルを希望のサイズにスケーリングする必要がある。サムネイルをサポートする
Windows 提供の画像フォーマットは JPEG、TIFF、JPEG-XR のみである。サムネイルが利用できない場合、これは
WINCODEC_ERR_CODECNOTHUMBNAIL を返す。


%index
IWICBitmapDecoder_GetFrameCount
画像内のフレームの総数を取得する。
%prm
this, pCount
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
pCount : [int] 型: UINT* 画像内のフレームの総数を受け取るポインタ。
%inst
画像内のフレームの総数を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapDecoder_GetFrame
画像の指定されたフレームを取得する。
%prm
this, index, ppIBitmapFrame
this : [comobj] IWICBitmapDecoder インターフェースの COM オブジェクト変数
index : [int] 型: UINT 取得する特定のフレーム。
ppIBitmapFrame : [comobj] 型: IWICBitmapFrameDecode** IWICBitmapFrameDecode へのポインタを受け取るポインタ。
%inst
画像の指定されたフレームを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapDecoderInfo_GetComponentType
IWICBitmapDecoderInfo::GetComponentType (vtable slot 3)
%prm
this, pType
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pType : [var] 
%inst


%index
IWICBitmapDecoderInfo_GetCLSID
IWICBitmapDecoderInfo::GetCLSID (vtable slot 4)
%prm
this, pclsid
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pclsid : [var] 
%inst


%index
IWICBitmapDecoderInfo_GetSigningStatus
IWICBitmapDecoderInfo::GetSigningStatus (vtable slot 5)
%prm
this, pStatus
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pStatus : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetAuthor
IWICBitmapDecoderInfo::GetAuthor (vtable slot 6)
%prm
this, cchAuthor, wzAuthor, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchAuthor : [int] 
wzAuthor : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetVendorGUID
IWICBitmapDecoderInfo::GetVendorGUID (vtable slot 7)
%prm
this, pguidVendor
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pguidVendor : [var] 
%inst


%index
IWICBitmapDecoderInfo_GetVersion
IWICBitmapDecoderInfo::GetVersion (vtable slot 8)
%prm
this, cchVersion, wzVersion, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchVersion : [int] 
wzVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetSpecVersion
IWICBitmapDecoderInfo::GetSpecVersion (vtable slot 9)
%prm
this, cchSpecVersion, wzSpecVersion, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchSpecVersion : [int] 
wzSpecVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetFriendlyName
IWICBitmapDecoderInfo::GetFriendlyName (vtable slot 10)
%prm
this, cchFriendlyName, wzFriendlyName, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchFriendlyName : [int] 
wzFriendlyName : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetContainerFormat
IWICBitmapDecoderInfo::GetContainerFormat (vtable slot 11)
%prm
this, pguidContainerFormat
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] 
%inst


%index
IWICBitmapDecoderInfo_GetPixelFormats
IWICBitmapDecoderInfo::GetPixelFormats (vtable slot 12)
%prm
this, cFormats, pguidPixelFormats, pcActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cFormats : [int] 
pguidPixelFormats : [var] 
pcActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetColorManagementVersion
IWICBitmapDecoderInfo::GetColorManagementVersion (vtable slot 13)
%prm
this, cchColorManagementVersion, wzColorManagementVersion, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchColorManagementVersion : [int] 
wzColorManagementVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetDeviceManufacturer
IWICBitmapDecoderInfo::GetDeviceManufacturer (vtable slot 14)
%prm
this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchDeviceManufacturer : [int] 
wzDeviceManufacturer : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetDeviceModels
IWICBitmapDecoderInfo::GetDeviceModels (vtable slot 15)
%prm
this, cchDeviceModels, wzDeviceModels, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchDeviceModels : [int] 
wzDeviceModels : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetMimeTypes
IWICBitmapDecoderInfo::GetMimeTypes (vtable slot 16)
%prm
this, cchMimeTypes, wzMimeTypes, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchMimeTypes : [int] 
wzMimeTypes : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_GetFileExtensions
IWICBitmapDecoderInfo::GetFileExtensions (vtable slot 17)
%prm
this, cchFileExtensions, wzFileExtensions, pcchActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cchFileExtensions : [int] 
wzFileExtensions : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapDecoderInfo_DoesSupportAnimation
IWICBitmapDecoderInfo::DoesSupportAnimation (vtable slot 18)
%prm
this, pfSupportAnimation
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pfSupportAnimation : [var] 
%inst


%index
IWICBitmapDecoderInfo_DoesSupportChromakey
IWICBitmapDecoderInfo::DoesSupportChromakey (vtable slot 19)
%prm
this, pfSupportChromakey
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pfSupportChromakey : [var] 
%inst


%index
IWICBitmapDecoderInfo_DoesSupportLossless
IWICBitmapDecoderInfo::DoesSupportLossless (vtable slot 20)
%prm
this, pfSupportLossless
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pfSupportLossless : [var] 
%inst


%index
IWICBitmapDecoderInfo_DoesSupportMultiframe
IWICBitmapDecoderInfo::DoesSupportMultiframe (vtable slot 21)
%prm
this, pfSupportMultiframe
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pfSupportMultiframe : [var] 
%inst


%index
IWICBitmapDecoderInfo_MatchesMimeType
IWICBitmapDecoderInfo::MatchesMimeType (vtable slot 22)
%prm
this, wzMimeType, pfMatches
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
wzMimeType : [wstr] 
pfMatches : [var] 
%inst


%index
IWICBitmapDecoderInfo_GetPatterns
デコーダがサポートするファイルパターンシグネチャを取得する。
%prm
this, cbSizePatterns, pPatterns, pcPatterns, pcbPatternsActual
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
cbSizePatterns : [int] 型: UINT pPatterns 配列の配列サイズ。
pPatterns : [var] 型: WICBitmapPattern* デコーダがサポートする WICBitmapPattern オブジェクトのリストを受け取る。
pcPatterns : [var] 型: UINT* デコーダがサポートするパターン数を受け取る。
pcbPatternsActual : [int] 型: UINT* デコーダがサポートするすべてのパターンシグネチャを取得するために必要な実際のバッファサイズを受け取る。
%inst
デコーダがサポートするファイルパターンシグネチャを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
すべてのパターンシグネチャを取得するには、まず pPatterns を NULL
に設定してこのメソッドを呼び出し、必要な実際のバッファサイズを pcbPatternsActual
から取得する。必要なサイズが分かったら、そのサイズのバッファを確保し、確保したバッファを使って GetPatterns を再度呼び出す。


%index
IWICBitmapDecoderInfo_MatchesPattern
コーデックが指定したストリーム内のパターンを認識するかどうかを示す値を取得する。
%prm
this, pIStream, pfMatches
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
pIStream : [comobj] 型: IStream* パターンマッチを行うストリーム。
pfMatches : [var] 型: BOOL* パターンが一致する場合は TRUE、そうでない場合は FALSE を受け取るポインタ。
%inst
コーデックが指定したストリーム内のパターンを認識するかどうかを示す値を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapDecoderInfo_CreateInstance
IWICBitmapDecoder の新しいインスタンスを作成する。
%prm
this, ppIBitmapDecoder
this : [comobj] IWICBitmapDecoderInfo インターフェースの COM オブジェクト変数
ppIBitmapDecoder : [comobj] 型: IWICBitmapDecoder** IWICBitmapDecoder の新しいインスタンスへのポインタを受け取るポインタ。
%inst
IWICBitmapDecoder の新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapEncoder_Initialize
ビットをどこへエンコードするかをエンコーダに伝える IStream でエンコーダを初期化する。
%prm
this, pIStream, cacheOption
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
pIStream : [comobj] 型: IStream* 出力ストリーム。
cacheOption : [int] 型: WICBitmapEncoderCacheOption 初期化時に使用する WICBitmapEncoderCacheOption。
%inst
ビットをどこへエンコードするかをエンコーダに伝える IStream でエンコーダを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IWICBitmapEncoder_GetContainerFormat
エンコーダのコンテナフォーマットを取得する。
%prm
this, pguidContainerFormat
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] 型: GUID* エンコーダのコンテナフォーマット GUID を受け取るポインタ。
%inst
エンコーダのコンテナフォーマットを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IWICBitmapEncoder_GetEncoderInfo
エンコーダの IWICBitmapEncoderInfo を取得する。
%prm
this, ppIEncoderInfo
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
ppIEncoderInfo : [comobj] 型: IWICBitmapEncoderInfo** IWICBitmapEncoderInfo へのポインタを受け取るポインタ。
%inst
エンコーダの IWICBitmapEncoderInfo を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IWICBitmapEncoder_SetColorContexts
エンコーダに IWICColorContext オブジェクトを設定する。
%prm
this, cCount, ppIColorContext
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
cCount : [int] 型: UINT 設定する IWICColorContext の数。
ppIColorContext : [comobj] 型: IWICColorContext** エンコーダに設定するカラーコンテキストを保持する IWICColorContext ポインタへのポインタ。
%inst
エンコーダに IWICColorContext オブジェクトを設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IWICBitmapEncoder_SetPalette
画像のグローバルパレットを設定する。
%prm
this, pIPalette
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
pIPalette : [comobj] 型: IWICPalette* グローバルパレットとして使用する IWICPalette。
%inst
画像のグローバルパレットを設定する。

[戻り値]
型: HRESULT 成功した場合は S_OK を、それ以外の場合はエラー値を返す。
エンコーダがこの機能をサポートしていない場合は WINCODEC_ERR_UNSUPPORTEDOPERATION を返す。

[備考]
オプションのグローバルパレットをサポートするのは GIF
画像のみであり、画像にフレームを追加する前にグローバルパレットを設定する必要がある。パレットを設定する必要があるのはインデックスのピクセルフォーマットの場合のみである。


%index
IWICBitmapEncoder_SetThumbnail
画像のグローバルサムネイルを設定する。
%prm
this, pIThumbnail
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
pIThumbnail : [comobj] 型: IWICBitmapSource* グローバルサムネイルとして設定する IWICBitmapSource。
%inst
画像のグローバルサムネイルを設定する。

[戻り値]
型: HRESULT 成功した場合は S_OK を、それ以外の場合はエラー値を返す。
エンコーダがこの機能をサポートしていない場合は WINCODEC_ERR_UNSUPPORTEDOPERATION を返す。


%index
IWICBitmapEncoder_SetPreview
画像のグローバルプレビューを設定する。
%prm
this, pIPreview
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
pIPreview : [comobj] 型: IWICBitmapSource* グローバルプレビューとして使用する IWICBitmapSource。
%inst
画像のグローバルプレビューを設定する。

[戻り値]
型: HRESULT 成功した場合は S_OK を、それ以外の場合はエラー値を返す。
エンコーダがこの機能をサポートしていない場合は WINCODEC_ERR_UNSUPPORTEDOPERATION を返す。


%index
IWICBitmapEncoder_CreateNewFrame
新しい IWICBitmapFrameEncode インスタンスを生成する。
%prm
this, ppIFrameEncode, ppIEncoderOptions
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
ppIFrameEncode : [comobj] 型: IWICBitmapFrameEncode** 新しい IWICBitmapFrameEncode インスタンスへのポインタを受け取るポインタ。
ppIEncoderOptions : [comobj] 型: IPropertyBag2** オプション。後続のフレーム初期化で使用する名前付きプロパティを受け取る。Remarks を参照。
%inst
新しい IWICBitmapFrameEncode インスタンスを生成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
ppIEncoderOptions パラメータは、エンコーダオプションを指定するために使用できる IPropertyBag2
を受け取るのに使える。これは ppIEncoderOptions に NULL の IPropertyBag2
ポインタへのポインタを渡すことで行う。返される IPropertyBag2
は、指定フォーマットで利用可能なすべてのエンコーダオプションが既定値で初期化されている。既定以外のエンコーディング動作を指定するには、必要なエンコーダオプションを
IPropertyBag2 に設定して IWICBitmapFrameEncode::Initialize に渡す。注: 初期化済みの
IPropertyBag2 へのポインタを渡してはならない。ポインタは上書きされ、元の IPropertyBag2 は解放されない。
エンコーダオプションを指定しないのであれば、ppIEncoderOptions に NULL
を渡してもよい。エンコーダオプションの設定例は Encoding Overview
を参照。複数フレームのエンコードをサポートするフォーマット (例えば TIFF、JPEG-XR) では、一度に 1
フレームしか扱えない。つまり CreateNewFrame を再度呼ぶ前に IWICBitmapFrameEncode::Commit
を呼ぶ必要がある。


%index
IWICBitmapEncoder_Commit
画像に対するすべての変更をコミットしてストリームを閉じる。
%prm
this
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
%inst
画像に対するすべての変更をコミットしてストリームを閉じる。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
画像を確定するには、フレームの Commit とエンコーダの Commit の両方を呼び出す必要がある。ただしエンコーダの Commit
メソッドはすべてのフレームがコミットされた後にのみ呼び出すこと。エンコーダがコミットされた後は、再初期化したり別のストリームで再利用したりすることはできない。たとえば
IWICImagingFactory::CreateEncoder などで新しいエンコーダインターフェースを生成する必要がある。
エンコーダの Commit が成功するためには、少なくとも IWICBitmapEncoder::Initialize を呼び、さらに
IWICBitmapFrameEncode::WriteSource か
IWICBitmapFrameEncode::WritePixels のいずれかを呼ばなければならない。
IWICBitmapFrameEncode::WriteSource
は画像データのエンコードに必要なすべてのパラメータを指定する。IWICBitmapFrameEncode::WritePixels
を使用する場合は、IWICBitmapFrameEncode::SetSize、IWICBitmapFrameEncode::SetPixelFormat、および
(ピクセルフォーマットがインデックスの場合) IWICBitmapFrameEncode::SetPalette も呼び出す必要がある。


%index
IWICBitmapEncoder_GetMetadataQueryWriter
エンコーダ用のメタデータクエリライタを取得する。
%prm
this, ppIMetadataQueryWriter
this : [comobj] IWICBitmapEncoder インターフェースの COM オブジェクト変数
ppIMetadataQueryWriter : [comobj] 型: IWICMetadataQueryWriter** このメソッドが返るとき、エンコーダのメタデータクエリライタへのポインタを格納する。
%inst
エンコーダ用のメタデータクエリライタを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IWICBitmapEncoderInfo_GetComponentType
IWICBitmapEncoderInfo::GetComponentType (vtable slot 3)
%prm
this, pType
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pType : [var] 
%inst


%index
IWICBitmapEncoderInfo_GetCLSID
IWICBitmapEncoderInfo::GetCLSID (vtable slot 4)
%prm
this, pclsid
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pclsid : [var] 
%inst


%index
IWICBitmapEncoderInfo_GetSigningStatus
IWICBitmapEncoderInfo::GetSigningStatus (vtable slot 5)
%prm
this, pStatus
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pStatus : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetAuthor
IWICBitmapEncoderInfo::GetAuthor (vtable slot 6)
%prm
this, cchAuthor, wzAuthor, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchAuthor : [int] 
wzAuthor : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetVendorGUID
IWICBitmapEncoderInfo::GetVendorGUID (vtable slot 7)
%prm
this, pguidVendor
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pguidVendor : [var] 
%inst


%index
IWICBitmapEncoderInfo_GetVersion
IWICBitmapEncoderInfo::GetVersion (vtable slot 8)
%prm
this, cchVersion, wzVersion, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchVersion : [int] 
wzVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetSpecVersion
IWICBitmapEncoderInfo::GetSpecVersion (vtable slot 9)
%prm
this, cchSpecVersion, wzSpecVersion, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchSpecVersion : [int] 
wzSpecVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetFriendlyName
IWICBitmapEncoderInfo::GetFriendlyName (vtable slot 10)
%prm
this, cchFriendlyName, wzFriendlyName, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchFriendlyName : [int] 
wzFriendlyName : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetContainerFormat
IWICBitmapEncoderInfo::GetContainerFormat (vtable slot 11)
%prm
this, pguidContainerFormat
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] 
%inst


%index
IWICBitmapEncoderInfo_GetPixelFormats
IWICBitmapEncoderInfo::GetPixelFormats (vtable slot 12)
%prm
this, cFormats, pguidPixelFormats, pcActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cFormats : [int] 
pguidPixelFormats : [var] 
pcActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetColorManagementVersion
IWICBitmapEncoderInfo::GetColorManagementVersion (vtable slot 13)
%prm
this, cchColorManagementVersion, wzColorManagementVersion, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchColorManagementVersion : [int] 
wzColorManagementVersion : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetDeviceManufacturer
IWICBitmapEncoderInfo::GetDeviceManufacturer (vtable slot 14)
%prm
this, cchDeviceManufacturer, wzDeviceManufacturer, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchDeviceManufacturer : [int] 
wzDeviceManufacturer : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetDeviceModels
IWICBitmapEncoderInfo::GetDeviceModels (vtable slot 15)
%prm
this, cchDeviceModels, wzDeviceModels, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchDeviceModels : [int] 
wzDeviceModels : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetMimeTypes
IWICBitmapEncoderInfo::GetMimeTypes (vtable slot 16)
%prm
this, cchMimeTypes, wzMimeTypes, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchMimeTypes : [int] 
wzMimeTypes : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_GetFileExtensions
IWICBitmapEncoderInfo::GetFileExtensions (vtable slot 17)
%prm
this, cchFileExtensions, wzFileExtensions, pcchActual
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
cchFileExtensions : [int] 
wzFileExtensions : [wstr] 
pcchActual : [int] 
%inst


%index
IWICBitmapEncoderInfo_DoesSupportAnimation
IWICBitmapEncoderInfo::DoesSupportAnimation (vtable slot 18)
%prm
this, pfSupportAnimation
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pfSupportAnimation : [var] 
%inst


%index
IWICBitmapEncoderInfo_DoesSupportChromakey
IWICBitmapEncoderInfo::DoesSupportChromakey (vtable slot 19)
%prm
this, pfSupportChromakey
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pfSupportChromakey : [var] 
%inst


%index
IWICBitmapEncoderInfo_DoesSupportLossless
IWICBitmapEncoderInfo::DoesSupportLossless (vtable slot 20)
%prm
this, pfSupportLossless
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pfSupportLossless : [var] 
%inst


%index
IWICBitmapEncoderInfo_DoesSupportMultiframe
IWICBitmapEncoderInfo::DoesSupportMultiframe (vtable slot 21)
%prm
this, pfSupportMultiframe
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
pfSupportMultiframe : [var] 
%inst


%index
IWICBitmapEncoderInfo_MatchesMimeType
IWICBitmapEncoderInfo::MatchesMimeType (vtable slot 22)
%prm
this, wzMimeType, pfMatches
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
wzMimeType : [wstr] 
pfMatches : [var] 
%inst


%index
IWICBitmapEncoderInfo_CreateInstance
新しい IWICBitmapEncoder インスタンスを作成する。
%prm
this, ppIBitmapEncoder
this : [comobj] IWICBitmapEncoderInfo インターフェースの COM オブジェクト変数
ppIBitmapEncoder : [comobj] 型: IWICBitmapEncoder** 新しい IWICBitmapEncoder インスタンスへのポインタを受け取るポインタ。
%inst
新しい IWICBitmapEncoder インスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IWICBitmapFlipRotator_GetSize
IWICBitmapFlipRotator::GetSize (vtable slot 3)
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmapFlipRotator インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICBitmapFlipRotator_GetPixelFormat
IWICBitmapFlipRotator::GetPixelFormat (vtable slot 4)
%prm
this, pPixelFormat
this : [comobj] IWICBitmapFlipRotator インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICBitmapFlipRotator_GetResolution
IWICBitmapFlipRotator::GetResolution (vtable slot 5)
%prm
this, pDpiX, pDpiY
this : [comobj] IWICBitmapFlipRotator インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICBitmapFlipRotator_CopyPalette
IWICBitmapFlipRotator::CopyPalette (vtable slot 6)
%prm
this, pIPalette
this : [comobj] IWICBitmapFlipRotator インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICBitmapFlipRotator_CopyPixels
IWICBitmapFlipRotator::CopyPixels (vtable slot 7)
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICBitmapFlipRotator インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICBitmapFlipRotator_Initialize
指定したパラメータでビットマップ反転回転処理を初期化する。
%prm
this, pISource, options
this : [comobj] IWICBitmapFlipRotator インターフェースの COM オブジェクト変数
pISource : [comobj] 型: IWICBitmapSource* 入力となるビットマップソース。
options : [int] 型: WICBitmapTransformOptions 画像を反転または回転させるための WICBitmapTransformOptions。
%inst
指定したパラメータでビットマップ反転回転処理を初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IWICBitmapFrameDecode_GetSize
IWICBitmapFrameDecode::GetSize (vtable slot 3)
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICBitmapFrameDecode_GetPixelFormat
IWICBitmapFrameDecode::GetPixelFormat (vtable slot 4)
%prm
this, pPixelFormat
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICBitmapFrameDecode_GetResolution
IWICBitmapFrameDecode::GetResolution (vtable slot 5)
%prm
this, pDpiX, pDpiY
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICBitmapFrameDecode_CopyPalette
IWICBitmapFrameDecode::CopyPalette (vtable slot 6)
%prm
this, pIPalette
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICBitmapFrameDecode_CopyPixels
IWICBitmapFrameDecode::CopyPixels (vtable slot 7)
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICBitmapFrameDecode_GetMetadataQueryReader
フレームのメタデータクエリリーダーを取得する。
%prm
this, ppIMetadataQueryReader
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
ppIMetadataQueryReader : [comobj] 型: IWICMetadataQueryReader** このメソッドが返るとき、フレームのメタデータクエリリーダーへのポインタを格納する。
%inst
フレームのメタデータクエリリーダーを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
1 フレームのみを持つ画像フォーマット (JPG、PNG、JPEG-XR)
では、最初のフレームのフレームレベルクエリリーダーがすべての画像メタデータへのアクセスに使用され、デコーダレベルのクエリリーダーは使用されない。複数フレームを持つフォーマット
(GIF、TIFF) では、特定フレームに固有のメタデータへのアクセスに、そのフレームのフレームレベルクエリリーダーが使用される。GIF
の場合はデコーダレベルのメタデータリーダーも存在する。デコーダがメタデータをサポートしない場合 (BMP、ICO)、これは
WINCODEC_ERR_UNSUPPORTEDOPERATION を返す。


%index
IWICBitmapFrameDecode_GetColorContexts
画像フレームに関連付けられた IWICColorContext を取得する。
%prm
this, cCount, ppIColorContexts, pcActualCount
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
cCount : [int] 型: UINT 取得するカラーコンテキストの数。この値は ppIColorContexts に確保されたサイズ以下でなければならない。
ppIColorContexts : [comobj] 型: IWICColorContext** IWICColorContext オブジェクトへのポインタを受け取るポインタ。
pcActualCount : [int] 型: UINT* 画像フレームに含まれるカラーコンテキストの数を受け取るポインタ。
%inst
画像フレームに関連付けられた IWICColorContext を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
ppIColorContexts に NULL を、cCount に 0 を渡すと、このメソッドは画像内のカラーコンテキストの総数を
pcActualCount に返す。
ppIColorContexts 配列は有効なデータで満たさなければならない。配列内の各 IWICColorContext* は
IWICImagingFactory::CreateColorContext で作成されたものでなければならない。


%index
IWICBitmapFrameDecode_GetThumbnail
コーデックがサポートしている場合、フレームの小さなプレビューを取得する。
%prm
this, ppIThumbnail
this : [comobj] IWICBitmapFrameDecode インターフェースの COM オブジェクト変数
ppIThumbnail : [comobj] 型: IWICBitmapSource** サムネイルの IWICBitmapSource へのポインタを受け取るポインタ。
%inst
コーデックがサポートしている場合、フレームの小さなプレビューを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
すべてのフォーマットがサムネイルをサポートしているわけではない。Joint Photographic Experts Group
(JPEG)、Tagged Image File Format (TIFF)、および Microsoft Windows Digital
Photo (WDP) はサムネイルをサポートする。実装者への注意 コーデックがサムネイルをサポートしない場合は E_NOTIMPL
ではなく WINCODEC_ERROR_CODECNOTHUMBNAIL を返すこと。


%index
IWICBitmapFrameEncode_Initialize
指定されたプロパティを使用してフレームエンコーダを初期化する。
%prm
this, pIEncoderOptions
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
pIEncoderOptions : [comobj] 型: IPropertyBag2* IWICBitmapFrameEncode の初期化に使用するプロパティのセット。
%inst
指定されたプロパティを使用してフレームエンコーダを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
エンコーディングオプションが不要な場合は、pIEncoderOptions に NULL
を渡す。それ以外の場合は、IWICBitmapEncoder::CreateNewFrame で提供された IPropertyBag2
を更新された値で渡す。
Windows 提供のコーデックでサポートされるエンコーディングオプションの完全なリストについては、Native WIC Codecs
を参照。


%index
IWICBitmapFrameEncode_SetSize
フレームの出力画像の寸法を設定する。
%prm
this, uiWidth, uiHeight
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
uiWidth : [int] 型: UINT 出力画像の幅。
uiHeight : [int] 型: UINT 出力画像の高さ。
%inst
フレームの出力画像の寸法を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapFrameEncode_SetResolution
出力画像の物理解像度を設定する。
%prm
this, dpiX, dpiY
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
dpiX : [double] 型: double 水平解像度の値。
dpiY : [double] 型: double 垂直解像度の値。
%inst
出力画像の物理解像度を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
Windows Imaging Component (WIC) は DPI
解像度値の結果として特別な処理を行わない。たとえば、IWICBitmapSource::CopyPixels から返されるデータは DPI
でスケーリングされない。アプリは DPI 解像度を処理する必要がある。


%index
IWICBitmapFrameEncode_SetPixelFormat
エンコーダに指定されたピクセルフォーマットの使用を要求する。
%prm
this, pPixelFormat
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
pPixelFormat : [var] 型: WICPixelFormatGUID* 入力時は要求されたピクセルフォーマット GUID。出力時はエンコーダがサポートする最も近いピクセルフォーマット GUID。これは要求されたフォーマットとは異なる場合がある。ピクセルフォーマット GUID のリストについては Native Pixel Formats を参照。
%inst
エンコーダに指定されたピクセルフォーマットの使用を要求する。

[戻り値]
型: HRESULT 戻り値には次が含まれる。
（以下省略）

[備考]
エンコーダは要求されたピクセルフォーマットをサポートしない場合がある。サポートしない場合、SetPixelFormat は
pPixelFormat
が指すメモリブロックに最も近い一致を返す。返されたピクセルフォーマットが要求されたフォーマットと一致しない場合、IWICFormatConverter
オブジェクトを使用してピクセルデータを変換する必要がある。


%index
IWICBitmapFrameEncode_SetColorContexts
指定された数の IWICColorContext プロファイルをフレームに設定する。
%prm
this, cCount, ppIColorContext
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
cCount : [int] 型: UINT 設定する IWICColorContext プロファイルの数。
ppIColorContext : [comobj] 型: IWICColorContext** フレームに設定するカラーコンテキストプロファイルを含む IWICColorContext ポインタへのポインタ。
%inst
指定された数の IWICColorContext プロファイルをフレームに設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
（以下省略）


%index
IWICBitmapFrameEncode_SetPalette
インデックス付きピクセルフォーマット用の IWICPalette を設定する。
%prm
this, pIPalette
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
pIPalette : [comobj] 型: IWICPalette* インデックス付きピクセルフォーマットに使用する IWICPalette。エンコーダがサポートするピクセルフォーマットを反映するためにパレットを変更する場合がある。
%inst
インデックス付きピクセルフォーマット用の IWICPalette を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]

このメソッドは、ピクセルフォーマットが非インデックスピクセルフォーマットに設定されたフレームで呼び出されても失敗しない。ターゲットピクセルフォーマットが非インデックスフォーマットの場合、パレットは無視される。グローバルパレットを設定するために
IWICBitmapEncoder::SetPalette
を既に呼び出している場合、このメソッドは現在のフレームに対してそのパレットをオーバーライドする。パレットは
WritePixels/WriteSource の最初の呼び出し前に指定する必要がある。そうすることで、WriteSource
はソース画像をエンコーダのピクセルフォーマットに変換する際に指定されたパレットを使用する。パレットが指定されていない場合、WriteSource
の最初の呼び出し時にパレットが生成される。


%index
IWICBitmapFrameEncode_SetThumbnail
コーデックがサポートする場合、フレームのサムネイルを設定する。
%prm
this, pIThumbnail
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
pIThumbnail : [comobj] 型: IWICBitmapSource* サムネイルとして使用するビットマップソース。
%inst
コーデックがサポートする場合、フレームのサムネイルを設定する。

[戻り値]
型: HRESULT 成功した場合は S_OK を、それ以外の場合はエラー値を返す。
エンコーダがこの機能をサポートしない場合は WINCODEC_ERR_UNSUPPORTEDOPERATION を返す。

[備考]
WritePixels または WriteSource を呼び出す前に SetThumbnail
を呼び出すことを推奨する。WritePixels または WriteSource の呼び出し後に SetThumbnail
を呼び出した場合、サムネイルはエンコードされたファイルに追加されない。
（以下省略）


%index
IWICBitmapFrameEncode_WritePixels
呼び出し側が提供したバッファから IWICBitmapFrameEncode オブジェクトにスキャンラインデータをコピーする。
%prm
this, lineCount, cbStride, cbBufferSize, pbPixels
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
lineCount : [int] 型: UINT エンコードする行数。
cbStride : [int] 型: UINT 画像ピクセルのストライド。
cbBufferSize : [int] 型: UINT ピクセルバッファのサイズ。
pbPixels : [int] 型: BYTE* ピクセルバッファへのポインタ。
%inst
呼び出し側が提供したバッファから IWICBitmapFrameEncode オブジェクトにスキャンラインデータをコピーする。

[戻り値]
型: HRESULT 戻り値には次が含まれる。
（以下省略）

[備考]
連続する WritePixels 呼び出しは、出力画像の順次的なスキャンラインアクセスであると仮定される。


%index
IWICBitmapFrameEncode_WriteSource
ビットマップソースをエンコードする。
%prm
this, pIBitmapSource, prc
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
pIBitmapSource : [comobj] 型: IWICBitmapSource* エンコードするビットマップソース。
prc : [var] 型: WICRect* ビットマップソースのサイズ矩形。
%inst
ビットマップソースをエンコードする。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
WriteSource を呼び出す前に SetSize を呼び出していない場合、prc が NULL でなければ prc
で与えられたサイズが使用される。それ以外の場合は、pIBitmapSource で与えられた IWICBitmapSource
のサイズが使用される。WriteSource を呼び出す前に SetPixelFormat
を呼び出していない場合、pIBitmapSource で与えられた IWICBitmapSource
のピクセルフォーマットが使用される。WriteSource を呼び出す前に SetResolution
を呼び出していない場合、pIBitmapSource のピクセルフォーマットが使用される。WriteSource を呼び出す前に
SetPalette を呼び出しておらず、ターゲットピクセルフォーマットがインデックス付きで、pIBitmapSource
のピクセルフォーマットがエンコーダフレームのピクセルフォーマットと一致する場合、pIBitmapSource
のピクセルフォーマットが使用される。GIF
画像をエンコードする際に、グローバルパレットが設定されており、フレームレベルのパレットがユーザーまたはカスタム独立系ソフトウェアベンダ
(ISV) GIF コーデックによって直接設定されていない場合、pIBitmapSource
がフレームレベルのパレットを持っていても、WriteSource はグローバルパレットを使用してフレームをエンコードする。Windows
Vista 以降、累積されたソース矩形の高さの合計が SetSize で設定された値と同じである限り、WriteSource
を繰り返し呼び出すことができる。Windows 8.1 以降、ソース矩形は SetSize
で設定された寸法以上である必要がある。ソース矩形の幅が SetSize
の幅を超える場合、右側の余分なピクセルは無視される。ソース矩形の高さが残りの未使用の高さを超える場合、底部の余分なスキャンラインは無視される。


%index
IWICBitmapFrameEncode_Commit
フレームを画像にコミットする。
%prm
this
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
%inst
フレームを画像にコミットする。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
フレームの Commit が呼び出された後は、IWICBitmapFrameEncode
オブジェクトおよびそれから作成されたオブジェクトを使用したり再初期化したりできない。
画像を確定するには、フレームの Commit とエンコーダの Commit の両方を呼び出す必要がある。ただし、エンコーダの Commit
メソッドはすべてのフレームがコミットされた後にのみ呼び出すこと。


%index
IWICBitmapFrameEncode_GetMetadataQueryWriter
エンコーダフレームのメタデータクエリライタを取得する。
%prm
this, ppIMetadataQueryWriter
this : [comobj] IWICBitmapFrameEncode インターフェースの COM オブジェクト変数
ppIMetadataQueryWriter : [comobj] 型: IWICMetadataQueryWriter** このメソッドが返るときに、エンコーダフレームのメタデータクエリライタへのポインタを格納する。
%inst
エンコーダフレームのメタデータクエリライタを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
フレームにメタデータを設定する場合、IWICBitmapFrameEncode::WritePixels または
IWICBitmapFrameEncode::WriteSource を使用してフレームに画像ピクセルを書き込む前にこれを行う必要がある。


%index
IWICBitmapLock_GetSize
ロックされた矩形の幅と高さをピクセル単位で取得する。
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmapLock インターフェースの COM オブジェクト変数
puiWidth : [int] 型: UINT* ロックされた矩形の幅を受け取るポインタ。
puiHeight : [int] 型: UINT* ロックされた矩形の高さを受け取るポインタ。
%inst
ロックされた矩形の幅と高さをピクセル単位で取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapLock_GetStride
メモリのストライド値へのアクセスを提供する。
%prm
this, pcbStride
this : [comobj] IWICBitmapLock インターフェースの COM オブジェクト変数
pcbStride : [int] 型: UINT*
%inst
メモリのストライド値へのアクセスを提供する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
ストライド値はビットマップではなく IWICBitmapLock に固有である点に注意。たとえば、同じビットマップの同じ矩形に対する 2
回連続のロックは、内部実装によって異なるポインタとストライド値を返すことがある。


%index
IWICBitmapLock_GetDataPointer
ロックされた矩形の左上ピクセルへのポインタを取得する。
%prm
this, pcbBufferSize, ppbData
this : [comobj] IWICBitmapLock インターフェースの COM オブジェクト変数
pcbBufferSize : [int] 型: UINT* バッファのサイズを受け取るポインタ。
ppbData : [var] 型: BYTE** ロックされた矩形の左上ピクセルへのポインタを受け取るポインタ。
%inst
ロックされた矩形の左上ピクセルへのポインタを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
このメソッドが提供するポインタはロック自体の有効期間外で使用してはならない。GetDataPointer はマルチスレッドアパートメント
(MTA) のアプリケーションでは利用できない。


%index
IWICBitmapLock_GetPixelFormat
ロックされたピクセル領域のピクセルフォーマットを取得する。これを使ってロック領域のピクセルあたりバイト数を計算できる。
%prm
this, pPixelFormat
this : [comobj] IWICBitmapLock インターフェースの COM オブジェクト変数
pPixelFormat : [var] 型: WICPixelFormatGUID* ロックされた領域のピクセルフォーマット GUID を受け取るポインタ。
%inst
ロックされたピクセル領域のピクセルフォーマットを取得する。これを使ってロック領域のピクセルあたりバイト数を計算できる。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICBitmapScaler_GetSize
IWICBitmapScaler::GetSize (vtable slot 3)
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmapScaler インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICBitmapScaler_GetPixelFormat
IWICBitmapScaler::GetPixelFormat (vtable slot 4)
%prm
this, pPixelFormat
this : [comobj] IWICBitmapScaler インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICBitmapScaler_GetResolution
IWICBitmapScaler::GetResolution (vtable slot 5)
%prm
this, pDpiX, pDpiY
this : [comobj] IWICBitmapScaler インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICBitmapScaler_CopyPalette
IWICBitmapScaler::CopyPalette (vtable slot 6)
%prm
this, pIPalette
this : [comobj] IWICBitmapScaler インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICBitmapScaler_CopyPixels
IWICBitmapScaler::CopyPixels (vtable slot 7)
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICBitmapScaler インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICBitmapScaler_Initialize
指定されたパラメータでビットマップスケーラを初期化する。
%prm
this, pISource, uiWidth, uiHeight, mode
this : [comobj] IWICBitmapScaler インターフェースの COM オブジェクト変数
pISource : [comobj] 型: IWICBitmapSource* 入力のビットマップソース。
uiWidth : [int] 型: UINT 出力先の幅。
uiHeight : [int] 型: UINT 出力先の高さ。
mode : [int] 型: WICBitmapInterpolationMode 拡大縮小時に使用する WICBitmapInterpolationMode。
%inst
指定されたパラメータでビットマップスケーラを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
IWICBitmapScaler
は複数回初期化できない。たとえばマルチフレーム画像のすべてのフレームをスケーリングする場合、フレームごとに新しい
IWICBitmapScaler を作成して初期化する必要がある。


%index
IWICBitmapSource_GetSize
ビットマップのピクセル幅と高さを取得する。
%prm
this, puiWidth, puiHeight
this : [comobj] IWICBitmapSource インターフェースの COM オブジェクト変数
puiWidth : [int] 型: UINT* ビットマップのピクセル幅を受け取るポインタ。
puiHeight : [int] 型: UINT* ビットマップのピクセル高さを受け取るポインタ。
%inst
ビットマップのピクセル幅と高さを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IWICBitmapSource_GetPixelFormat
ビットマップソースのピクセルフォーマットを取得する。
%prm
this, pPixelFormat
this : [comobj] IWICBitmapSource インターフェースの COM オブジェクト変数
pPixelFormat : [var] 型: WICPixelFormatGUID* ビットマップが保持されているピクセルフォーマット GUID を受け取る。利用可能なピクセルフォーマット一覧は Native Pixel Formats を参照。
%inst
ビットマップソースのピクセルフォーマットを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]

このメソッドが返すピクセルフォーマットは、必ずしも画像が実際に格納されているピクセルフォーマットと同じではない。コーデックがストレージのピクセルフォーマットから出力のピクセルフォーマットへ変換を行う場合がある。


%index
IWICBitmapSource_GetResolution
ピクセルと物理世界の計測値の間のサンプリングレートを取得する。
%prm
this, pDpiX, pDpiY
this : [comobj] IWICBitmapSource インターフェースの COM オブジェクト変数
pDpiX : [double] 型: double* x 軸の dpi 解像度を受け取るポインタ。
pDpiY : [double] 型: double* y 軸の dpi 解像度を受け取るポインタ。
%inst
ピクセルと物理世界の計測値の間のサンプリングレートを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
GIF や ICO のような一部のフォーマットは DPI を完全にはサポートしない。GIF の場合、このメソッドは (96.0,
96.0) をベース DPI としてアスペクト比から DPI 値を計算する。ICO フォーマットは DPI
をまったくサポートしないので、ICO 画像に対しては常に (96.0, 96.0) を返す。
さらに、WIC 自身は画像内の DPI
値に基づいて画像を変換しない。返された解像度に基づいて画像を変換するかどうかは呼び出し側次第である。


%index
IWICBitmapSource_CopyPalette
インデックスピクセルフォーマットのカラーテーブルを取得する。
%prm
this, pIPalette
this : [comobj] IWICBitmapSource インターフェースの COM オブジェクト変数
pIPalette : [comobj] 型: IWICPalette* IWICPalette。CreatePalette メソッドでパレットを生成できる。
%inst
インデックスピクセルフォーマットのカラーテーブルを取得する。

[戻り値]
型: HRESULT 次のいずれかの値を返す。
（以下省略）

[備考]
IWICBitmapSource が IWICBitmapFrameDecode
の場合、フレームレベルのパレットが利用できないときはこの関数が画像のグローバルパレットを返すことがある。グローバルパレットは
CopyPalette メソッドでも取得できる。


%index
IWICBitmapSource_CopyPixels
オブジェクトにピクセルを生成するよう指示する。
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICBitmapSource インターフェースの COM オブジェクト変数
prc : [var] 型: const WICRect* コピーする矩形。NULL を指定するとビットマップ全体を指定したことになる。
cbStride : [int] 型: UINT ビットマップのストライド。
cbBufferSize : [int] 型: UINT バッファのサイズ。
pbBuffer : [int] 型: BYTE* バッファへのポインタ。
%inst
オブジェクトにピクセルを生成するよう指示する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
CopyPixels は実際の処理を起動する 2 つの主要な画像処理ルーチンの 1 つであり (もう 1 つは
Lock)、オブジェクトに自身のアルゴリズムに従ってピクセルを生成するよう指示する。処理内容は、ディスク上の JPEG
の一部をデコードしたり、メモリブロックをコピーしたり、複雑なグラデーションを解析的に計算したりとさまざまである。アルゴリズムは、このインターフェースを実装するオブジェクトに完全に依存する。
呼び出し側は prc パラメータで処理対象の関心矩形 (ROI) を制限できる。ROI
の部分矩形はビットマップの境界内に完全に含まれていなければならない。NULL の ROI を指定するとビットマップ全体が返される。
呼び出し側はメモリ管理を担当し、コピー結果を受け取る出力バッファ (pbBuffer) とそのサイズ (cbBufferSize)
を用意する必要がある。cbStride パラメータは出力バッファ内で垂直方向に隣接する 2
つのピクセル間のバイト数を定義する。呼び出し側は、ビットマップの幅・高さ・ピクセルフォーマットおよびコピーメソッドに与えた部分矩形に基づき、呼び出しを完了するのに十分なバッファがあることを保証する必要がある。
呼び出し側が JPEG のように高価な IWICBitmapSource からの多数のコピーを行う必要がある場合は、先にメモリ上の
IWICBitmap を生成しておくことを推奨する。
コーデック開発者向けの注意 呼び出される側は出力バッファの各行の先頭 (prc->Width*bitsperpixel+7)/8
バイトのみに書き込むべきである (この場合「行」は連続する cbStride バイトを指す)。


%index
IWICColorContext_InitializeFromFilename
指定されたファイルからカラーコンテキストを初期化する。
%prm
this, wzFilename
this : [comobj] IWICColorContext インターフェースの COM オブジェクト変数
wzFilename : [wstr] 型: LPCWSTR ファイルの名前。
%inst
指定されたファイルからカラーコンテキストを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
カラーコンテキストは一度初期化すると再初期化できない。


%index
IWICColorContext_InitializeFromMemory
メモリブロックからカラーコンテキストを初期化する。
%prm
this, pbBuffer, cbBufferSize
this : [comobj] IWICColorContext インターフェースの COM オブジェクト変数
pbBuffer : [int] 型: const BYTE* IWICColorContext の初期化に使用するバッファ。
cbBufferSize : [int] 型: UINT pbBuffer バッファのサイズ。
%inst
メモリブロックからカラーコンテキストを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
カラーコンテキストは一度初期化すると再初期化できない。


%index
IWICColorContext_InitializeFromExifColorSpace
Exchangeable Image File (EXIF) カラースペースを用いてカラーコンテキストを初期化する。
%prm
this, value
this : [comobj] IWICColorContext インターフェースの COM オブジェクト変数
value : [int] 型: UINT EXIF カラースペースの値。
%inst
Exchangeable Image File (EXIF) カラースペースを用いてカラーコンテキストを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
カラーコンテキストは一度初期化するとに再初期化できない。


%index
IWICColorContext_GetType
カラーコンテキストの種別を取得する。(IWICColorContext.GetType)
%prm
this, pType
this : [comobj] IWICColorContext インターフェースの COM オブジェクト変数
pType : [var] 型: WICColorContextType* カラーコンテキストの WICColorContextType を受け取るポインタ。
%inst
カラーコンテキストの種別を取得する。(IWICColorContext.GetType)

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IWICColorContext_GetProfileBytes
カラーコンテキストプロファイルを取得する。
%prm
this, cbBuffer, pbBuffer, pcbActual
this : [comobj] IWICColorContext インターフェースの COM オブジェクト変数
cbBuffer : [int] 型: UINT pbBuffer バッファのサイズ。
pbBuffer : [int] 型: BYTE* カラーコンテキストプロファイルを受け取るポインタ。
pcbActual : [int] 型: UINT* カラーコンテキストプロファイル全体を取得するのに必要な実際のバッファサイズを受け取るポインタ。
%inst
カラーコンテキストプロファイルを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
コンテキスト種別が WICColorContextProfile の場合のみ使用する。
pbBuffer を NULL にしてこのメソッドを呼び出すと、pcbActual に必要なバッファサイズが返される。


%index
IWICColorContext_GetExifColorSpace
Exchangeable Image File (EXIF) カラースペースのカラーコンテキストを取得する。
%prm
this, pValue
this : [comobj] IWICColorContext インターフェースの COM オブジェクト変数
pValue : [int] 型: UINT* EXIF カラースペースのカラーコンテキストを受け取るポインタ。
%inst
Exchangeable Image File (EXIF) カラースペースのカラーコンテキストを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
このメソッドは IWICColorContext::GetType が WICColorContextExifColorSpace
を示す場合にのみ使用すること。


%index
IWICColorTransform_GetSize
IWICColorTransform::GetSize (vtable slot 3)
%prm
this, puiWidth, puiHeight
this : [comobj] IWICColorTransform インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICColorTransform_GetPixelFormat
IWICColorTransform::GetPixelFormat (vtable slot 4)
%prm
this, pPixelFormat
this : [comobj] IWICColorTransform インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICColorTransform_GetResolution
IWICColorTransform::GetResolution (vtable slot 5)
%prm
this, pDpiX, pDpiY
this : [comobj] IWICColorTransform インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICColorTransform_CopyPalette
IWICColorTransform::CopyPalette (vtable slot 6)
%prm
this, pIPalette
this : [comobj] IWICColorTransform インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICColorTransform_CopyPixels
IWICColorTransform::CopyPixels (vtable slot 7)
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICColorTransform インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICColorTransform_Initialize
IWICColorTransform を IWICBitmapSource で初期化し、ある IWICColorContext から別の IWICColorContext へ変換する。
%prm
this, pIBitmapSource, pIContextSource, pIContextDest, pixelFmtDest
this : [comobj] IWICColorTransform インターフェースの COM オブジェクト変数
pIBitmapSource : [comobj] 型: IWICBitmapSource* カラー変換の初期化に使用するビットマップソース。
pIContextSource : [comobj] 型: IWICColorContext* 変換元のカラーコンテキスト。
pIContextDest : [comobj] 型: IWICColorContext* 変換先のカラーコンテキスト。
pixelFmtDest : [var] 型: REFWICPixelFormatGUID 目的のピクセルフォーマットの GUID。このパラメータはネイティブの WIC ピクセルフォーマットの一部に限定される。一覧については Remarks を参照。
%inst
IWICColorTransform を IWICBitmapSource で初期化し、ある IWICColorContext から別の
IWICColorContext へ変換する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
pIContextSource および pixelFmtDest パラメータで現在サポートされているフォーマットは次のとおり。
（以下省略）


%index
IWICComponentInfo_GetComponentType
コンポーネントの WICComponentType を取得する。
%prm
this, pType
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
pType : [var] 型: WICComponentType* WICComponentType を受け取るポインタ。
%inst
コンポーネントの WICComponentType を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICComponentInfo_GetCLSID
コンポーネントのクラス識別子 (CLSID) を取得する。
%prm
this, pclsid
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
pclsid : [var] 型: CLSID* コンポーネントの CLSID を受け取るポインタ。
%inst
コンポーネントのクラス識別子 (CLSID) を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICComponentInfo_GetSigningStatus
コンポーネントの署名ステータスを取得する。
%prm
this, pStatus
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
pStatus : [int] 型: DWORD* コンポーネントの WICComponentSigning ステータスを受け取るポインタ。
%inst
コンポーネントの署名ステータスを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
署名は WIC では使用されない。したがって、すべてのコンポーネントは WICComponentSigned
となる。この関数は、コンポーネントにバイナリコンポーネントがないか、レジストリの無効化されたコンポーネントリストに追加されているかを判断するために使用できる。


%index
IWICComponentInfo_GetAuthor
コンポーネントの作者名を取得する。
%prm
this, cchAuthor, wzAuthor, pcchActual
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
cchAuthor : [int] 型: UINT wzAuthor バッファのサイズ。
wzAuthor : [wstr] 型: WCHAR* コンポーネントの作者名を受け取るポインタ。文字列のロケールは、コーデックがインストール時にレジストリに書き込んだ値に依存する。組み込みコンポーネントの場合、これらの文字列は常に英語である。
pcchActual : [int] 型: UINT* コンポーネントの作者名の実際の長さを受け取るポインタ。作者名はオプションである。コンポーネントによって作者名が指定されていない場合、返される長さは 0 である。
%inst
コンポーネントの作者名を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
cchAuthor が 0 で wzAuthor が NULL の場合、必要なバッファサイズが pccchActual に返される。


%index
IWICComponentInfo_GetVendorGUID
ベンダ GUID を取得する。
%prm
this, pguidVendor
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
pguidVendor : [var] 型: GUID* コンポーネントのベンダ GUID を受け取るポインタ。
%inst
ベンダ GUID を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICComponentInfo_GetVersion
コンポーネントのバージョンを取得する。
%prm
this, cchVersion, wzVersion, pcchActual
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
cchVersion : [int] 型: UINT wzVersion バッファのサイズ。
wzVersion : [wstr] 型: WCHAR* コンポーネントのバージョンのカルチャ非依存文字列を受け取るポインタ。
pcchActual : [int] 型: UINT* コンポーネントのバージョンの実際の長さを受け取るポインタ。バージョンはオプションである。コンポーネントによって値が指定されていない場合、返される長さは 0 である。
%inst
コンポーネントのバージョンを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
ピクセルフォーマット (バージョンを持たない) を除き、すべての組み込みコンポーネントは "1.0.0.0" を返す。cchAuthor
が 0 で wzAuthor が NULL の場合、必要なバッファサイズが pccchActual に返される。


%index
IWICComponentInfo_GetSpecVersion
コンポーネントの仕様バージョンを取得する。
%prm
this, cchSpecVersion, wzSpecVersion, pcchActual
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
cchSpecVersion : [int] 型: UINT wzSpecVersion バッファのサイズ。
wzSpecVersion : [wstr] 型: WCHAR* このメソッドが返るときに、コンポーネントの仕様バージョンのカルチャ非依存文字列を含む。バージョン形式は NN.NN.NN.NN である。
pcchActual : [int] 型: UINT* コンポーネントの仕様バージョンの実際の長さを受け取るポインタ。仕様バージョンはオプションである。コンポーネントによって値が指定されていない場合、返される長さは 0 である。
%inst
コンポーネントの仕様バージョンを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
ピクセルフォーマット (仕様バージョンを持たない) を除き、すべての組み込みコンポーネントは "1.0.0.0"
を返す。cchAuthor が 0 で wzAuthor が NULL の場合、必要なバッファサイズが pccchActual
に返される。


%index
IWICComponentInfo_GetFriendlyName
コンポーネントのフレンドリ名 (人間が読める表示名) を取得する。
%prm
this, cchFriendlyName, wzFriendlyName, pcchActual
this : [comobj] IWICComponentInfo インターフェースの COM オブジェクト変数
cchFriendlyName : [int] 型: UINT wzFriendlyName バッファのサイズ。
wzFriendlyName : [wstr] 型: WCHAR* コンポーネントのフレンドリ名を受け取るポインタ。文字列のロケールは、コーデックがインストール時にレジストリに書き込んだ値に依存する。組み込みコンポーネントの場合、これらの文字列は常に英語である。
pcchActual : [int] 型: UINT* コンポーネントのフレンドリ名の実際の長さを受け取るポインタ。
%inst
コンポーネントのフレンドリ名 (人間が読める表示名) を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
cchFriendlyName が 0 で wzFriendlyName が NULL の場合、必要なバッファサイズが
pccchActual に返される。


%index
IWICFastMetadataEncoder_Commit
画像ストリームに対するメタデータの変更を確定する。
%prm
this
this : [comobj] IWICFastMetadataEncoder インターフェースの COM オブジェクト変数
%inst
画像ストリームに対するメタデータの変更を確定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
コミットが失敗して WINCODEC_ERR_STREAMNOTAVAILABLE を返した場合、画像デコーダが
WICDecodeMetadataCacheOnDemand オプションでロードされていることを確認すること。デコーダが
WICDecodeMetadataCacheOnLoad
オプションで作成されている場合、高速メタデータエンコーダはサポートされない。何らかの理由でコミットが失敗した場合、新しいメタデータを画像に確実に追加するには画像を再エンコードする必要がある。


%index
IWICFastMetadataEncoder_GetMetadataQueryWriter
高速メタデータエンコーディング用のメタデータクエリライタを取得する。
%prm
this, ppIMetadataQueryWriter
this : [comobj] IWICFastMetadataEncoder インターフェースの COM オブジェクト変数
ppIMetadataQueryWriter : [comobj] 型: IWICMetadataQueryWriter** このメソッドが返るとき、高速メタデータエンコーダのメタデータクエリライタへのポインタを格納する。
%inst
高速メタデータエンコーディング用のメタデータクエリライタを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICFormatConverter_GetSize
IWICFormatConverter::GetSize (vtable slot 3)
%prm
this, puiWidth, puiHeight
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
puiWidth : [int] 
puiHeight : [int] 
%inst


%index
IWICFormatConverter_GetPixelFormat
IWICFormatConverter::GetPixelFormat (vtable slot 4)
%prm
this, pPixelFormat
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
pPixelFormat : [var] 
%inst


%index
IWICFormatConverter_GetResolution
IWICFormatConverter::GetResolution (vtable slot 5)
%prm
this, pDpiX, pDpiY
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
pDpiX : [double] 
pDpiY : [double] 
%inst


%index
IWICFormatConverter_CopyPalette
IWICFormatConverter::CopyPalette (vtable slot 6)
%prm
this, pIPalette
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
pIPalette : [comobj] 
%inst


%index
IWICFormatConverter_CopyPixels
IWICFormatConverter::CopyPixels (vtable slot 7)
%prm
this, prc, cbStride, cbBufferSize, pbBuffer
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
prc : [var] 
cbStride : [int] 
cbBufferSize : [int] 
pbBuffer : [int] 
%inst


%index
IWICFormatConverter_Initialize
フォーマットコンバータを初期化する。
%prm
this, pISource, dstFormat, dither, pIPalette, alphaThresholdPercent, paletteTranslate
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
pISource : [comobj] 型: IWICBitmapSource* 変換する入力ビットマップ。
dstFormat : [var] 型: REFWICPixelFormatGUID 変換先のピクセルフォーマット GUID。
dither : [int] 型: WICBitmapDitherType 変換時に使用する WICBitmapDitherType。
pIPalette : [comobj] 型: IWICPalette* 変換時に使用するパレット。
alphaThresholdPercent : [double] 型: double 変換時に使用するアルファしきい値。
paletteTranslate : [int] 型: WICBitmapPaletteType 変換時に使用するパレット変換種別。
%inst
フォーマットコンバータを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
事前定義のパレットがない場合は、まずパレットを作成する必要がある。InitializeFromBitmap
を使ってパレットオブジェクトを作成し、それを他のパラメータと一緒に渡す。
dither、pIPalette、alphaThresholdPercent、paletteTranslate
はビット深度を低減するフォーマットへ変換する際の色損失を緩和するために使用される。これらの設定が不要な変換では、次のパラメータ値を使用すべきである:
dither は WICBitmapDitherTypeNone、pIPalette は
NULL、alphaThresholdPercent は 0.0f、paletteTranslate は
WICBitmapPaletteTypeCustom。
順序付きディザを使用する基本アルゴリズムでは、WICBitmapPaletteType
列挙体で定義された固定パレットを特定の順序で必要とする。多くの場合、出力に実際に提供されるパレットは順序が異なるか、実際の色に微妙な差異がある。これは
Microsoft Windows のパレットを使う場合に当てはまり、Windows
のバージョン間で僅かな違いがある。これに対応するため、フォーマットコンバータにパレットとパレット変換が与えられる。pIPalette
は実際に使用される変換先パレットで、paletteTranslate
は固定パレットである。変換が完了すると、最近傍色マッチングアルゴリズムを使って、固定パレットから pIPalette
内の実際の色へ色がマッピングされる。pIPalette 内の色が paletteTranslate
の色に近くない場合、マッピングは望ましくない結果を生むことがある。WICBitmapDitherTypeOrdered4x4 は、8
ビットフォーマットから 5 または 6
ビットフォーマットへの変換において、色データを正確に変換する方法がないため有用である。WICBitmapDitherTypeErrorDiffusion
は誤差拡散アルゴリズムを選択し、任意のパレットと併用できる。任意のパレットを与える場合は paletteTranslate に
WICBitmapPaletteCustom
を渡すべきである。誤差拡散は順序付きディザリングアルゴリズムよりも優れた結果を提供することが多く、特に IWICPalette
上の最適化されたパレット生成機能と組み合わせると効果的である。Portable Network Graphics (PNG)
のようにアルファチャンネルを持つビットマップを 8bpp
に変換する際、アルファチャンネルは通常無視される。元のビットマップで透明だったピクセルは、それぞれのフォーマットで透明と黒の両方がピクセル値
0 を持つため、最終出力では黒になる。8bpp のコンテンツの中にはアルファカラーを含むものがあり、たとえば Graphics
Interchange Format (GIF)
フォーマットでは単一のパレットエントリを透明色として使用できる。このようなコンテンツに対して alphaThresholdPercent
はどの透明度パーセンテージを透明色にマッピングするかを指定する。アルファ値はピクセルの不透明度（透明度ではなく）に直接比例するため、alphaThresholdPercent
はどの不透明度レベルを完全に透明な色にマッピングするかを示す。たとえば 9.8% は、アルファ値が 25
未満のピクセルが透明色にマッピングされることを意味する。値 100%
は、完全に不透明でないすべてのピクセルを透明色にマッピングする。なおパレットには透明色が含まれているべきである。なければ「透明」色は 0
に最も近い色 (多くの場合は黒) になる。


%index
IWICFormatConverter_CanConvert
変換元のピクセルフォーマットを変換先のピクセルフォーマットに変換可能かを判定する。
%prm
this, srcPixelFormat, dstPixelFormat, pfCanConvert
this : [comobj] IWICFormatConverter インターフェースの COM オブジェクト変数
srcPixelFormat : [var] 型: REFWICPixelFormatGUID 変換元のピクセルフォーマット。
dstPixelFormat : [var] 型: REFWICPixelFormatGUID 変換先のピクセルフォーマット。
pfCanConvert : [var] 型: BOOL* 変換元のピクセルフォーマットを変換先のピクセルフォーマットに変換できるかを示す値を受け取るポインタ。
%inst
変換元のピクセルフォーマットを変換先のピクセルフォーマットに変換可能かを判定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateDecoderFromFilename
指定したファイルに基づいて IWICBitmapDecoder クラスの新しいインスタンスを作成する。
%prm
this, wzFilename, pguidVendor, dwDesiredAccess, metadataOptions
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
wzFilename : [wstr] 型: LPCWSTR 作成または開くオブジェクトの名前を指定する null 終端文字列へのポインタ。
pguidVendor : [var] 型: const GUID* 優先デコーダベンダーの GUID。優先ベンダーがない場合は NULL を使用する。
dwDesiredAccess : [int] 型: DWORD オブジェクトへのアクセス種別。読み取り、書き込み、またはその両方を指定できる。
metadataOptions : [int] 型: WICDecodeOptions デコーダ作成時に使用する WICDecodeOptions。
%inst
指定したファイルに基づいて IWICBitmapDecoder クラスの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateDecoderFromStream
指定した IStream に基づいて IWICBitmapDecoder クラスの新しいインスタンスを作成する。
%prm
this, pIStream, pguidVendor, metadataOptions
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
pIStream : [comobj] 型: IStream* デコーダの作成元となるストリーム。
pguidVendor : [var] 型: const GUID* 優先デコーダベンダーの GUID。優先ベンダーがない場合は NULL を使用する。
metadataOptions : [int] 型: WICDecodeOptions デコーダ作成時に使用する WICDecodeOptions。
%inst
指定した IStream に基づいて IWICBitmapDecoder クラスの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateDecoderFromFileHandle
指定したファイルハンドルに基づいて IWICBitmapDecoder の新しいインスタンスを作成する。
%prm
this, hFile, pguidVendor, metadataOptions
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
hFile : [int] 型: ULONG_PTR デコーダを作成するためのファイルハンドル。
pguidVendor : [var] 型: const GUID* 優先デコーダベンダーの GUID。優先ベンダーがない場合は NULL を使用する。
metadataOptions : [int] 型: WICDecodeOptions デコーダ作成時に使用する WICDecodeOptions。
%inst
指定したファイルハンドルに基づいて IWICBitmapDecoder の新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
このメソッドを使用してデコーダを作成した場合、ファイルハンドルはデコーダの生存期間中有効なままでなければならない。


%index
IWICImagingFactory_CreateComponentInfo
指定したコンポーネントクラス識別子 (CLSID) に対する IWICComponentInfo クラスの新しいインスタンスを作成する。
%prm
this, clsidComponent, ppIInfo
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
clsidComponent : [var] 型: REFCLSID 目的のコンポーネントの CLSID。
ppIInfo : [comobj] 型: IWICComponentInfo** 新しい IWICComponentInfo へのポインタを受け取るポインタ。
%inst
指定したコンポーネントクラス識別子 (CLSID) に対する IWICComponentInfo クラスの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateDecoder
IWICBitmapDecoder の新しいインスタンスを作成する。
%prm
this, guidContainerFormat, pguidVendor
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
guidContainerFormat : [var] 型: REFGUID 目的のコンテナ形式の GUID。
pguidVendor : [var] 型: const GUID* 優先エンコーダベンダーの GUID。
%inst
IWICBitmapDecoder の新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
インストールされている WIC 対応エンコーダによっては、guidContainerFormat と pguidVendor
の両方に対して他の値が利用可能な場合もある。列挙される値は、オペレーティングシステムが標準でサポートするものである。


%index
IWICImagingFactory_CreateEncoder
IWICBitmapEncoder クラスの新しいインスタンスを作成する。
%prm
this, guidContainerFormat, pguidVendor
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
guidContainerFormat : [var] 型: REFGUID 目的のコンテナ形式の GUID。
pguidVendor : [var] 型: const GUID* 優先エンコーダベンダーの GUID。
%inst
IWICBitmapEncoder クラスの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
インストールされている WIC 対応エンコーダによっては、guidContainerFormat と pguidVendor
の両方に対して他の値が利用可能な場合もある。列挙される値は、オペレーティングシステムが標準でサポートするものである。


%index
IWICImagingFactory_CreatePalette
IWICPalette クラスの新しいインスタンスを作成する。
%prm
this, ppIPalette
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIPalette : [comobj] 型: IWICPalette** 新しい IWICPalette へのポインタを受け取るポインタ。
%inst
IWICPalette クラスの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateFormatConverter
IWICFormatConverter クラスの新しいインスタンスを作成する。
%prm
this, ppIFormatConverter
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIFormatConverter : [comobj] 型: IWICFormatConverter** 新しい IWICFormatConverter へのポインタを受け取るポインタ。
%inst
IWICFormatConverter クラスの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateBitmapScaler
IWICBitmapScaler の新しいインスタンスを作成する。
%prm
this, ppIBitmapScaler
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIBitmapScaler : [comobj] 型: IWICBitmapScaler** 新しい IWICBitmapScaler へのポインタを受け取るポインタ。
%inst
IWICBitmapScaler の新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateBitmapClipper
IWICBitmapClipper オブジェクトの新しいインスタンスを作成する。
%prm
this, ppIBitmapClipper
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIBitmapClipper : [comobj] 型: IWICBitmapClipper** 新しい IWICBitmapClipper へのポインタを受け取るポインタ。
%inst
IWICBitmapClipper オブジェクトの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateBitmapFlipRotator
IWICBitmapFlipRotator オブジェクトの新しいインスタンスを作成する。
%prm
this, ppIBitmapFlipRotator
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIBitmapFlipRotator : [comobj] 型: IWICBitmapFlipRotator** 新しい IWICBitmapFlipRotator へのポインタを受け取るポインタ。
%inst
IWICBitmapFlipRotator オブジェクトの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateStream
IWICStream クラスの新しいインスタンスを作成する。
%prm
this, ppIWICStream
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIWICStream : [comobj] 型: IWICStream** 新しい IWICStream へのポインタを受け取るポインタ。
%inst
IWICStream クラスの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateColorContext
IWICColorContext クラスの新しいインスタンスを作成する。
%prm
this, ppIWICColorContext
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIWICColorContext : [comobj] 型: IWICColorContext** 新しい IWICColorContext へのポインタを受け取るポインタ。
%inst
IWICColorContext クラスの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateColorTransformer
IWICColorTransform クラスの新しいインスタンスを作成する。
%prm
this, ppIWICColorTransform
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
ppIWICColorTransform : [comobj] 型: IWICColorTransform** 新しい IWICColorTransform へのポインタを受け取るポインタ。
%inst
IWICColorTransform クラスの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateBitmap
IWICBitmap オブジェクトを作成する。
%prm
this, uiWidth, uiHeight, pixelFormat, option, ppIBitmap
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
uiWidth : [int] 型: UINT 新しいビットマップの幅。
uiHeight : [int] 型: UINT 新しいビットマップの高さ。
pixelFormat : [var] 型: REFWICPixelFormatGUID 新しいビットマップのピクセルフォーマット。
option : [int] 型: WICBitmapCreateCacheOption 新しいビットマップのキャッシュ作成オプション。WICBitmapCreateCacheOption 列挙型の値のいずれかを指定できる。
ppIBitmap : [comobj] 型: IWICBitmap** 新しいビットマップへのポインタを受け取るポインタ。
%inst
IWICBitmap オブジェクトを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateBitmapFromSource
IWICBitmapSource から IWICBitmap を作成する。
%prm
this, pIBitmapSource, option, ppIBitmap
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
pIBitmapSource : [comobj] 型: IWICBitmapSource* ビットマップの作成元となる IWICBitmapSource。
option : [int] 型: WICBitmapCreateCacheOption 新しいビットマップのキャッシュオプション。WICBitmapCreateCacheOption 列挙型の値のいずれかを指定できる。
ppIBitmap : [comobj] 型: IWICBitmap** 新しいビットマップへのポインタを受け取るポインタ。
%inst
IWICBitmapSource から IWICBitmap を作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateBitmapFromSourceRect
IWICBitmapSource の指定した矩形から IWICBitmap を作成する。
%prm
this, pIBitmapSource, x, y, width, height, ppIBitmap
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
pIBitmapSource : [comobj] 型: IWICBitmapSource* ビットマップの作成元となる IWICBitmapSource。
x : [int] 型: UINT 矩形の左上隅の水平座標。
y : [int] 型: UINT 矩形の左上隅の垂直座標。
width : [int] 型: UINT 矩形および新しいビットマップの幅。
height : [int] 型: UINT 矩形および新しいビットマップの高さ。
ppIBitmap : [comobj] 型: IWICBitmap** 新しいビットマップへのポインタを受け取るポインタ。
%inst
IWICBitmapSource の指定した矩形から IWICBitmap を作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
ソースよりも大きな矩形を指定すると、結果は未定義となる。このメソッドはキャッシュオプション WICBitmapCacheOnLoad
と同様に、常にソース画像の独立したコピーを作成する。


%index
IWICImagingFactory_CreateBitmapFromMemory
メモリブロックから IWICBitmap を作成する。
%prm
this, uiWidth, uiHeight, pixelFormat, cbStride, cbBufferSize, pbBuffer, ppIBitmap
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
uiWidth : [int] 型: UINT 新しいビットマップの幅。
uiHeight : [int] 型: UINT 新しいビットマップの高さ。
pixelFormat : [var] 型: REFWICPixelFormatGUID 新しいビットマップのピクセルフォーマット。有効なピクセルフォーマットについては Native Pixel Formats を参照のこと。
cbStride : [int] 型: UINT pbBuffer 内の連続するスキャンライン間のバイト数。
cbBufferSize : [int] 型: UINT pbBuffer のサイズ。
pbBuffer : [int] 型: BYTE* ビットマップを作成するために使用するバッファ。
ppIBitmap : [comobj] 型: IWICBitmap** 新しいビットマップへのポインタを受け取るポインタ。
%inst
メモリブロックから IWICBitmap を作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
作成する IWICBitmap のサイズは、pbBuffer
内の画像サイズ以下でなければならない。作成されるビットマップのストライドは、指定した幅や高さに関係なくソースデータのストライドと等しくなる。pixelFormat
パラメータは入力データと出力ビットマップ両方のピクセルフォーマットを定義する。


%index
IWICImagingFactory_CreateBitmapFromHBITMAP
ビットマップハンドルから IWICBitmap を作成する。
%prm
this, hBitmap, hPalette, options, ppIBitmap
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
hBitmap : [intptr] 型: HBITMAP ビットマップの作成元となるビットマップハンドル。
hPalette : [int] 型: HPALETTE ビットマップ作成に使用するパレットハンドル。
options : [int] 型: WICBitmapAlphaChannelOption ビットマップ作成時のアルファチャンネルオプション。
ppIBitmap : [comobj] 型: IWICBitmap** 新しいビットマップへのポインタを受け取るポインタ。
%inst
ビットマップハンドルから IWICBitmap を作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
パレットを持たないビットマップの場合、hPalette パラメータには NULL を指定する。


%index
IWICImagingFactory_CreateBitmapFromHICON
アイコンハンドルから IWICBitmap を作成する。
%prm
this, hIcon, ppIBitmap
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
hIcon : [intptr] 型: HICON 新しいビットマップの作成元となるアイコンハンドル。
ppIBitmap : [comobj] 型: IWICBitmap** 新しいビットマップへのポインタを受け取るポインタ。
%inst
アイコンハンドルから IWICBitmap を作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateComponentEnumerator
指定したコンポーネント種類の IEnumUnknown オブジェクトを作成する。
%prm
this, componentTypes, options, ppIEnumUnknown
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
componentTypes : [int] 型: DWORD 列挙する WICComponentType の種類。
options : [int] 型: DWORD 指定したコンポーネント種類を列挙するために使用する WICComponentEnumerateOptions。
ppIEnumUnknown : [comobj] 型: IEnumUnknown** 新しいコンポーネント列挙子へのポインタを受け取るポインタ。
%inst
指定したコンポーネント種類の IEnumUnknown オブジェクトを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
コンポーネント種類は個別に列挙しなければならない。コンポーネント種類と WICAllComponents の組み合わせはサポートされない。


%index
IWICImagingFactory_CreateFastMetadataEncoderFromDecoder
指定した IWICBitmapDecoder に基づいて高速メタデータエンコーダの新しいインスタンスを作成する。
%prm
this, pIDecoder, ppIFastEncoder
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
pIDecoder : [comobj] 型: IWICBitmapDecoder* 高速メタデータエンコーダの作成元となるデコーダ。
ppIFastEncoder : [comobj] 型: IWICFastMetadataEncoder** メソッドが戻る際、新しい IWICFastMetadataEncoder へのポインタを格納する。
%inst
指定した IWICBitmapDecoder に基づいて高速メタデータエンコーダの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
Windows
提供のコーデックはデコーダレベルでの高速メタデータエンコーディングをサポートしておらず、フレームレベルでのみサポートしている。フレームから高速メタデータエンコーダを作成するには
CreateFastMetadataEncoderFromFrameDecode を参照のこと。


%index
IWICImagingFactory_CreateFastMetadataEncoderFromFrameDecode
指定した画像フレームに基づいて高速メタデータエンコーダの新しいインスタンスを作成する。
%prm
this, pIFrameDecoder, ppIFastEncoder
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
pIFrameDecoder : [comobj] 型: IWICBitmapFrameDecode* IWICFastMetadataEncoder の作成元となる IWICBitmapFrameDecode。
ppIFastEncoder : [comobj] 型: IWICFastMetadataEncoder** メソッドが戻る際、新しい高速メタデータエンコーダへのポインタを格納する。
%inst
指定した画像フレームに基づいて高速メタデータエンコーダの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。

[備考]
高速メタデータエンコーディングでサポートされるメタデータ形式の一覧は WIC Metadata Overview を参照のこと。


%index
IWICImagingFactory_CreateQueryWriter
クエリライターの新しいインスタンスを作成する。
%prm
this, guidMetadataFormat, pguidVendor, ppIQueryWriter
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
guidMetadataFormat : [var] 型: REFGUID 目的のメタデータ形式の GUID。
pguidVendor : [var] 型: const GUID* 優先メタデータライターベンダーの GUID。優先ベンダーがない場合は NULL を使用する。
ppIQueryWriter : [comobj] 型: IWICMetadataQueryWriter** メソッドが戻る際、新しい IWICMetadataQueryWriter へのポインタを格納する。
%inst
クエリライターの新しいインスタンスを作成する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICImagingFactory_CreateQueryWriterFromReader
指定したクエリリーダーに基づいてクエリライターの新しいインスタンスを作成する。クエリライターにはクエリリーダー由来のメタデータが事前に投入される。
%prm
this, pIQueryReader, pguidVendor, ppIQueryWriter
this : [comobj] IWICImagingFactory インターフェースの COM オブジェクト変数
pIQueryReader : [comobj] 型: IWICMetadataQueryReader* IWICMetadataQueryWriter の作成元となる IWICMetadataQueryReader。
pguidVendor : [var] 型: const GUID* 優先メタデータライターベンダーの GUID。優先ベンダーがない場合は NULL を使用する。
ppIQueryWriter : [comobj] 型: IWICMetadataQueryWriter** メソッドが戻る際、新しいメタデータライターへのポインタを格納する。
%inst

指定したクエリリーダーに基づいてクエリライターの新しいインスタンスを作成する。クエリライターにはクエリリーダー由来のメタデータが事前に投入される。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。そうでない場合は HRESULT エラーコードを返す。


%index
IWICMetadataQueryReader_GetContainerFormat
メタデータクエリリーダーのコンテナフォーマットを取得する。
%prm
this, pguidContainerFormat
this : [comobj] IWICMetadataQueryReader インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] 型: GUID* コンテナフォーマット GUID を受け取るポインタ。
%inst
メタデータクエリリーダーのコンテナフォーマットを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICMetadataQueryReader_GetLocation
ルートメタデータブロックからの現在のパスを取得する。
%prm
this, cchMaxLength, wzNamespace, pcchActualLength
this : [comobj] IWICMetadataQueryReader インターフェースの COM オブジェクト変数
cchMaxLength : [int] 型: UINT wzNamespace バッファの長さ。
wzNamespace : [wstr] 型: WCHAR* 現在の名前空間の場所を受け取るポインタ。
pcchActualLength : [int] 型: UINT* 現在の名前空間の場所を取得するために必要な実際のバッファ長。
%inst
ルートメタデータブロックからの現在のパスを取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
wzNamespace に NULL を渡すと、GetLocation は cchMaxLength
を無視し、パスを格納するために必要なバッファ長を pcchActualLength が指す変数に返す。

クエリリーダーがメタデータ階層の最上位に対して相対的である場合は単一文字の文字列を返す。クエリリーダーがネストされたメタデータブロックに対して相対的である場合、このメソッドは現在のクエリリーダーへのパスを返す。


%index
IWICMetadataQueryReader_GetMetadataByName
メタデータクエリ式で識別されるメタデータブロックまたは項目を取得する。
%prm
this, wzName, pvarValue
this : [comobj] IWICMetadataQueryReader インターフェースの COM オブジェクト変数
wzName : [wstr] 型: LPCWSTR 要求するメタデータブロックまたは項目へのクエリ式。
pvarValue : [int] 型: PROPVARIANT* このメソッドが返るとき、要求されたメタデータブロックまたは項目を格納する。
%inst
メタデータクエリ式で識別されるメタデータブロックまたは項目を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
GetMetadataByName
は埋め込みメタデータにアクセスするためにメタデータクエリ式を使用する。メタデータクエリ言語の詳細については Metadata Query
Language Overview
を参照。同じクエリ式で表される複数のブロックや項目が存在する場合、最初に見つかったメタデータブロックまたは項目が返される。


%index
IWICMetadataQueryReader_GetEnumerator
メタデータ階層内の現在の相対位置にあるすべてのメタデータ項目の列挙子を取得する。
%prm
this, ppIEnumString
this : [comobj] IWICMetadataQueryReader インターフェースの COM オブジェクト変数
ppIEnumString : [comobj] 型: IEnumString** 現在の IWICMetadataQueryReader で使用できるクエリ文字列を含む列挙子の IEnumString インターフェースへのポインタを受け取る変数へのポインタ。
%inst
メタデータ階層内の現在の相対位置にあるすべてのメタデータ項目の列挙子を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
取得される列挙子は、階層内の現在のレベルにあるメタデータブロックおよび項目のクエリ文字列のみを含む。


%index
IWICMetadataQueryWriter_GetContainerFormat
IWICMetadataQueryWriter::GetContainerFormat (vtable slot 3)
%prm
this, pguidContainerFormat
this : [comobj] IWICMetadataQueryWriter インターフェースの COM オブジェクト変数
pguidContainerFormat : [var] 
%inst


%index
IWICMetadataQueryWriter_GetLocation
IWICMetadataQueryWriter::GetLocation (vtable slot 4)
%prm
this, cchMaxLength, wzNamespace, pcchActualLength
this : [comobj] IWICMetadataQueryWriter インターフェースの COM オブジェクト変数
cchMaxLength : [int] 
wzNamespace : [wstr] 
pcchActualLength : [int] 
%inst


%index
IWICMetadataQueryWriter_GetMetadataByName
IWICMetadataQueryWriter::GetMetadataByName (vtable slot 5)
%prm
this, wzName, pvarValue
this : [comobj] IWICMetadataQueryWriter インターフェースの COM オブジェクト変数
wzName : [wstr] 
pvarValue : [int] 
%inst


%index
IWICMetadataQueryWriter_GetEnumerator
IWICMetadataQueryWriter::GetEnumerator (vtable slot 6)
%prm
this, ppIEnumString
this : [comobj] IWICMetadataQueryWriter インターフェースの COM オブジェクト変数
ppIEnumString : [comobj] 
%inst


%index
IWICMetadataQueryWriter_SetMetadataByName
特定の場所にメタデータ項目を設定する。
%prm
this, wzName, pvarValue
this : [comobj] IWICMetadataQueryWriter インターフェースの COM オブジェクト変数
wzName : [wstr] 型: LPCWSTR メタデータ項目の名前。
pvarValue : [int] 型: const PROPVARIANT* 設定するメタデータ。
%inst
特定の場所にメタデータ項目を設定する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
SetMetadataByName はメタデータを操作するためにメタデータクエリ式を使用する。メタデータクエリ言語の詳細については
Metadata Query Language Overview
を参照。設定する値がネストされたメタデータブロックである場合は、バリアント型 VT_UNKNOWN を使用し、pvarValue
を新しいメタデータブロックの IWICMetadataQueryWriter
を指すようにする。相対位置は指定されないため、メタデータ項目の順序はクエリライタの裁量に委ねられる。


%index
IWICMetadataQueryWriter_RemoveMetadataByName
メタデータクエリ式を用いて特定の場所からメタデータ項目を削除する。
%prm
this, wzName
this : [comobj] IWICMetadataQueryWriter インターフェースの COM オブジェクト変数
wzName : [wstr] 型: LPCWSTR 削除するメタデータ項目の名前。
%inst
メタデータクエリ式を用いて特定の場所からメタデータ項目を削除する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
RemoveMetadataByName はメタデータを削除するためにメタデータクエリ式を使用する。メタデータクエリ言語の詳細については
Metadata Query Language Overview
を参照。メタデータ項目がメタデータブロックである場合、それはメタデータ階層から削除される。


%index
IWICPalette_InitializePredefined
WICBitmapPaletteType で指定された事前定義パレットの 1 つにパレットを初期化し、オプションで透明な色を追加する。
%prm
this, ePaletteType, fAddTransparentColor
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
ePaletteType : [int] 型: WICBitmapPaletteType 望ましい事前定義パレット型。
fAddTransparentColor : [int] 型: BOOL パレットに追加するオプションの透明な色。透明な色が不要な場合は 0 を使用する。グレースケールまたは白黒パレットに初期化する場合は、このパラメータを FALSE に設定する。
%inst
WICBitmapPaletteType で指定された事前定義パレットの 1 つにパレットを初期化し、オプションで透明な色を追加する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
透明な色がパレットに追加されると、パレットはもはや事前定義ではなくなり、WICBitmapPaletteTypeCustom
として返される。256 エントリ未満のパレットの場合、透明エントリはパレットの末尾に追加される (つまり、16 色パレットは 17
色パレットになる)。256 色のパレットの場合、透明パレットエントリは事前定義パレットの最後のエントリを置き換える。


%index
IWICPalette_InitializeCustom
提供されたカスタムカラーエントリでパレットを初期化する。
%prm
this, pColors, cCount
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pColors : [int] 型: WICColor* カラー配列へのポインタ。
cCount : [int] 型: UINT pColors 内の色の数。
%inst
提供されたカスタムカラーエントリでパレットを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
透明な色が必要な場合は、カスタムエントリの一部として提供する。パレットに透明な値を追加するには、そのアルファ値を 0
(0x00RRGGBB) にする必要がある。
エントリ数は 256 に制限されている。


%index
IWICPalette_InitializeFromBitmap
参照ビットマップに基づいて計算された最適化された値を使用してパレットを初期化する。
%prm
this, pISurface, cCount, fAddTransparentColor
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pISurface : [comobj] 型: IWICBitmapSource* ソースビットマップへのポインタ。
cCount : [int] 型: UINT パレットを初期化する色の数。
fAddTransparentColor : [int] 型: BOOL 透明な色を追加するかどうかを示す値。
%inst
参照ビットマップに基づいて計算された最適化された値を使用してパレットを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]

結果のパレットには、参照ビットマップに存在する色を最もよく表す指定された数の色が含まれる。アルゴリズムは参照ビットマップの各ピクセルの不透明な
RGB カラー値で動作するため、アルファ値は無視される。透明な色が必要な場合は、fAddTransparentColor パラメータを
TRUE に設定すると、最適化された色が 1 つ少なく計算され、colorCount が削減され、完全に透明なカラーエントリが追加される。


%index
IWICPalette_InitializeFromPalette
指定されたパレットに基づいてパレットを初期化する。
%prm
this, pIPalette
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pIPalette : [comobj] 型: IWICPalette* ソースパレットへのポインタ。
%inst
指定されたパレットに基づいてパレットを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICPalette_GetType
パレットを記述する WICBitmapPaletteType を取得する。
%prm
this, pePaletteType
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pePaletteType : [var] 型: WICBitmapPaletteType* ビットマップのパレット型を受け取るポインタ。
%inst
パレットを記述する WICBitmapPaletteType を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
WICBitmapPaletteCustom は、InitializeCustom と InitializeFromBitmap
の両方から初期化されたパレットに使用される。最適化されたパレットとカスタムパレットの間に区別はない。


%index
IWICPalette_GetColorCount
カラーテーブル内の色の数を取得する。
%prm
this, pcCount
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pcCount : [int] 型: UINT* カラーテーブル内の色の数を受け取るポインタ。
%inst
カラーテーブル内の色の数を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICPalette_GetColors
提供されたカラー配列を内部カラーテーブルの色で埋める。カラー配列は GetColorCount からの戻り結果に従ってサイズを決めるべきである。
%prm
this, cCount, pColors, pcActualColors
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
cCount : [int] 型: UINT pColors 配列のサイズ。
pColors : [int] 型: WICColor* パレットの色を受け取るポインタ。
pcActualColors : [int] 型: UINT* パレットの色を取得するために必要な実際のサイズ。
%inst
提供されたカラー配列を内部カラーテーブルの色で埋める。カラー配列は GetColorCount
からの戻り結果に従ってサイズを決めるべきである。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。


%index
IWICPalette_IsBlackWhite
パレットが白黒であるかどうかを記述する値を取得する。
%prm
this, pfIsBlackWhite
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pfIsBlackWhite : [var] 型: BOOL* パレットが白黒であるかどうかを示すブール値を受け取る変数へのポインタ。TRUE はパレットが白黒であることを示し、そうでない場合は FALSE。
%inst
パレットが白黒であるかどうかを記述する値を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
パレットが白黒とみなされるのは、ちょうど 2 つのエントリを含み、1 つが完全な黒 (0xFF000000)、もう 1 つが完全な白
(0xFFFFFFF) である場合のみである。


%index
IWICPalette_IsGrayscale
パレットがグレースケールであるかどうかを記述する値を取得する。
%prm
this, pfIsGrayscale
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pfIsGrayscale : [var] 型: BOOL* パレットがグレースケールであるかどうかを示すブール値を受け取る変数へのポインタ。TRUE はパレットがグレースケールであることを示し、そうでない場合は FALSE。
%inst
パレットがグレースケールであるかどうかを記述する値を取得する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
パレットがグレースケールとみなされるのは、すべてのエントリのアルファ値が 0xFF で、赤、緑、青の値が一致する場合のみである。


%index
IWICPalette_HasAlpha
パレットに不透明でないエントリ (アルファが 1 未満のエントリ) が含まれているかどうかを示す。
%prm
this, pfHasAlpha
this : [comobj] IWICPalette インターフェースの COM オブジェクト変数
pfHasAlpha : [var] 型: BOOL* パレットに透明な色が含まれている場合は TRUE、そうでない場合は FALSE を受け取るポインタ。
%inst
パレットに不透明でないエントリ (アルファが 1 未満のエントリ) が含まれているかどうかを示す。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。それ以外の場合は HRESULT エラーコードを返す。

[備考]
さまざまな画像フォーマットがアルファをさまざまな方法でサポートする。PNG
は部分的に透明なパレットエントリをサポートすることで完全なアルファサポートを持つ。GIF は色をアルファなしで 24bpp
として保存するが、1 つのパレットエントリを完全に透明として指定できる。パレットに複数の完全に透明なエントリ (0x00RRGGBB)
がある場合、GIF は最後のエントリを透明インデックスとして使用する。


%index
IWICStream_Read
IWICStream::Read (vtable slot 3)
%prm
this, pv, cb, pcbRead
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pv : [intptr] 
cb : [int] 
pcbRead : [var] 
%inst


%index
IWICStream_Write
IWICStream::Write (vtable slot 4)
%prm
this, pv, cb, pcbWritten
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pv : [intptr] 
cb : [int] 
pcbWritten : [var] 
%inst


%index
IWICStream_Seek
IWICStream::Seek (vtable slot 5)
%prm
this, dlibMove, dwOrigin, plibNewPosition
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
dlibMove : [int64] 
dwOrigin : [int] 
plibNewPosition : [var] 
%inst


%index
IWICStream_SetSize
IWICStream::SetSize (vtable slot 6)
%prm
this, libNewSize
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
libNewSize : [int64] 
%inst


%index
IWICStream_CopyTo
IWICStream::CopyTo (vtable slot 7)
%prm
this, pstm, cb, pcbRead, pcbWritten
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pstm : [comobj] 
cb : [int64] 
pcbRead : [var] 
pcbWritten : [var] 
%inst


%index
IWICStream_Commit
IWICStream::Commit (vtable slot 8)
%prm
this, grfCommitFlags
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
grfCommitFlags : [int] 
%inst


%index
IWICStream_Revert
IWICStream::Revert (vtable slot 9)
%prm
this
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
%inst


%index
IWICStream_LockRegion
IWICStream::LockRegion (vtable slot 10)
%prm
this, libOffset, cb, dwLockType
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
libOffset : [int64] 
cb : [int64] 
dwLockType : [int] 
%inst


%index
IWICStream_UnlockRegion
IWICStream::UnlockRegion (vtable slot 11)
%prm
this, libOffset, cb, dwLockType
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
libOffset : [int64] 
cb : [int64] 
dwLockType : [int] 
%inst


%index
IWICStream_Stat
IWICStream::Stat (vtable slot 12)
%prm
this, pstatstg, grfStatFlag
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pstatstg : [var] 
grfStatFlag : [int] 
%inst


%index
IWICStream_Clone
IWICStream::Clone (vtable slot 13)
%prm
this, ppstm
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
ppstm : [comobj] 
%inst


%index
IWICStream_InitializeFromIStream
別のストリームからストリームを初期化する。アクセス権は元のストリームから継承される。
%prm
this, pIStream
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pIStream : [comobj] 型: IStream* 初期化に使用するストリーム。
%inst
別のストリームからストリームを初期化する。アクセス権は元のストリームから継承される。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。


%index
IWICStream_InitializeFromFilename
特定のファイルからストリームを初期化する。
%prm
this, wzFileName, dwDesiredAccess
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
wzFileName : [wstr] 型: LPCWSTR ストリームの初期化に使用するファイル。
dwDesiredAccess : [int] 型: DWORD 望むファイルアクセスモード。
%inst
特定のファイルからストリームを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
IWICStream インターフェースのメソッドはファイル共有オプションを提供しない。画像用の共有ファイルストリームを生成するには
SHCreateStreamOnFileEx 関数を使用する。このストリームは CreateDecoderFromStream メソッドで
IWICBitmapDecoder を生成するために使用できる。


%index
IWICStream_InitializeFromMemory
メモリブロックをストリームとして扱うようにストリームを初期化する。ストリームはバッファサイズを超えて拡張できない。
%prm
this, pbBuffer, cbBufferSize
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pbBuffer : [int] 型: BYTE* ストリームの初期化に使用するバッファへのポインタ。
cbBufferSize : [int] 型: DWORD バッファのサイズ。
%inst
メモリブロックをストリームとして扱うようにストリームを初期化する。ストリームはバッファサイズを超えて拡張できない。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]
可能な限りこのメソッドの使用は避けるべきである。InitializeFromMemory
を使用する場合、メモリブロックがストリームの寿命を通じて有効であることを呼び出し側が保証する必要がある。回避策として、IStream
を生成して InitializeFromIStream を使用し IWICStream
を生成する方法がある。拡張可能なメモリストリームが必要な場合は CreateStreamOnHGlobal を使用する。


%index
IWICStream_InitializeFromIStreamRegion
別のストリームのサブストリームとしてストリームを初期化する。
%prm
this, pIStream, ulOffset, ulMaxSize
this : [comobj] IWICStream インターフェースの COM オブジェクト変数
pIStream : [comobj] 型: IStream* 入力ストリームへのポインタ。
ulOffset : [int64] 型: ULARGE_INTEGER 新しいストリームを生成するために使用するストリームオフセット。
ulMaxSize : [int64] 型: ULARGE_INTEGER ストリームの最大サイズ。
%inst
別のストリームのサブストリームとしてストリームを初期化する。

[戻り値]
型: HRESULT このメソッドが成功した場合は S_OK を返す。失敗した場合は HRESULT エラーコードを返す。

[備考]

このストリームは元のストリームとは独立した自身のストリーム位置で機能するが、特定の領域に制限される。すべてのシーク位置は部分領域を基準とする。推奨はしないが、同じ範囲に書き込み可能な複数のサブストリームを重ね合わせることも許される。

