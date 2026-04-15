; ============================================================
;   wmvcore.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
WMCreateBackupRestorer
WMCreateBackupRestorer 関数はバックアップリストアラーオブジェクトを作成する。
%group
Win32 wmvcore
%prm
pCallback, ppBackup
pCallback : [var] 新しいバックアップリストアラーオブジェクトが使用する OnStatus コールバックメソッドを含む IWMStatusCallback インターフェースへのポインタ。
ppBackup : [var] 新しく作成されたバックアップリストアラーオブジェクトの IWMLicenseBackup インターフェースへのポインタへのポインタ。
%inst
WMCreateBackupRestorer 関数はバックアップリストアラーオブジェクトを作成する。

[戻り値]
メソッドは HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。

[備考]
IWMLicenseBackup::QueryInterface を使用して IWMBackupRestoreProps
インターフェースへのポインタを取得する。


%index
WMCreateEditor
WMCreateEditor 関数はメタデータエディタオブジェクトを作成する。
%group
Win32 wmvcore
%prm
ppEditor
ppEditor : [var] 新しく作成されたメタデータエディタオブジェクトの IWMMetadataEditor インターフェースへのポインタへのポインタ。
%inst
WMCreateEditor 関数はメタデータエディタオブジェクトを作成する。

[戻り値]
メソッドは HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
WMCreateIndexer
WMCreateIndexer 関数はインデクサーオブジェクトを作成する。
%group
Win32 wmvcore
%prm
ppIndexer
ppIndexer : [var] 新しく作成されたインデクサーオブジェクトの IWMIndexer インターフェースへのポインタへのポインタ。
%inst
WMCreateIndexer 関数はインデクサーオブジェクトを作成する。

[戻り値]
メソッドは HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
WMCreateProfileManager
WMCreateProfileManager 関数はプロファイルマネージャオブジェクトを作成する。
%group
Win32 wmvcore
%prm
ppProfileManager
ppProfileManager : [var] 新しく作成されたプロファイルマネージャオブジェクトの IWMProfileManager インターフェースへのポインタへのポインタ。
%inst
WMCreateProfileManager 関数はプロファイルマネージャオブジェクトを作成する。

[戻り値]
メソッドは HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。

[備考]

プロファイルマネージャオブジェクトが作成されると、すべてのシステムプロファイルを解析する。使用するたびにプロファイルマネージャを作成・解放するとパフォーマンスに悪影響がある。プロファイルマネージャはアプリケーションで一度だけ作成し、不要になった時点で解放するのが望ましい。


%index
WMCreateReader
WMCreateReader 関数はリーダーオブジェクトを作成する。
%group
Win32 wmvcore
%prm
pUnkCert, dwRights, ppReader
pUnkCert : [var] この値は NULL に設定しなければならない。
dwRights : [int] 希望する操作を示す DWORD。このファイルに対して実行する操作を示す WMT_RIGHTS 列挙型の値のいずれかを設定する。複数の操作を行う場合、dwRights は WMT_RIGHTS の複数の値をビット OR で組み合わせた値でなければならない。
ppReader : [var] 新しく作成されたリーダーオブジェクトの IWMReader インターフェースへのポインタへのポインタ。
%inst
WMCreateReader 関数はリーダーオブジェクトを作成する。

[戻り値]
メソッドは HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。

[備考]
このオブジェクトが作成された後、IWMDRMReader::SetDRMProperty を DRM_Rights
プロパティで呼び出すことで、次に開くファイルに要求される権利を変更できる。このプロパティを使用する際、権利は DWORD
値ではなく文字列として指定する点に注意する。非 DRM コンテンツを読み取る場合、dwRights パラメータは 0
に設定してもよい。dwRights が 0
の状態で保護されたファイルを開くと、ライセンス関連のメタデータにはアクセスできるが、ファイル内のストリームからデータを読み取ることはできない。


%index
WMCreateSyncReader
WMCreateSyncReader 関数は同期リーダーオブジェクトを作成する。
%group
Win32 wmvcore
%prm
pUnkCert, dwRights, ppSyncReader
pUnkCert : [var] IUnknown インターフェースへのポインタ。この値は NULL に設定しなければならない。
dwRights : [int] 希望する操作を指定する DWORD。非 DRM コンテンツを再生する場合、または DRM 権利を持たないアプリケーションの場合、この値は 0 に設定できる。そうでない場合は、このファイルに対して実行する操作を示す WMT_RIGHTS 列挙型の値のいずれかでなければならない。複数の操作を行う場合、dwRights は WMT_RIGHTS の複数の値をビット OR で組み合わせた値でなければならない。
ppSyncReader : [var] 新しく作成された同期リーダーオブジェクトの IWMSyncReader インターフェースへのポインタへのポインタ。
%inst
WMCreateSyncReader 関数は同期リーダーオブジェクトを作成する。

[戻り値]
メソッドは HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
WMCreateWriter
WMCreateWriter 関数はライターオブジェクトを作成する。
%group
Win32 wmvcore
%prm
pUnkCert, ppWriter
pUnkCert : [var] IUnknown インターフェースへのポインタ。この値は使用されず、NULL に設定しなければならない。
ppWriter : [var] 新しく作成されたライターオブジェクトの IWMWriter インターフェースへのポインタへのポインタ。
%inst
WMCreateWriter 関数はライターオブジェクトを作成する。

[戻り値]
メソッドは HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
WMCreateWriterFileSink
WMCreateWriterFileSink 関数はライターファイルシンクオブジェクトを作成する。
%group
Win32 wmvcore
%prm
ppSink
ppSink : [var] 新しく作成されたライターファイルシンクオブジェクトの IWMWriterFileSink インターフェースへのポインタへのポインタ。
%inst
WMCreateWriterFileSink 関数はライターファイルシンクオブジェクトを作成する。

[戻り値]
メソッドは HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
WMCreateWriterNetworkSink
WMCreateWriterNetworkSink 関数はライターネットワークシンクオブジェクトを作成する。
%group
Win32 wmvcore
%prm
ppSink
ppSink : [var] 新しく作成されたライターネットワークシンクオブジェクトの IWMWriterNetworkSink インターフェースへのポインタへのポインタ。
%inst
WMCreateWriterNetworkSink 関数はライターネットワークシンクオブジェクトを作成する。

[戻り値]
メソッドは HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
WMCreateWriterPushSink
WMCreateWriterPushSink 関数はライタープッシュシンクオブジェクトを作成する。プッシュシンクは、配信のために他のメディアサーバーへストリーミングコンテンツを配送するのに使用される。
%group
Win32 wmvcore
%prm
ppSink
ppSink : [var] 新しく作成されたライタープッシュシンクオブジェクトの IWMWriterPushSink インターフェースへのポインタへのポインタ。
%inst
WMCreateWriterPushSink
関数はライタープッシュシンクオブジェクトを作成する。プッシュシンクは、配信のために他のメディアサーバーへストリーミングコンテンツを配送するのに使用される。

[戻り値]
メソッドは HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。


%index
WMIsContentProtected
WMIsContentProtected 関数はファイルに DRM 保護コンテンツが含まれているかをチェックする。この関数は、アプリケーションが保護されたファイルを迅速に識別するためのショートカットである。
%group
Win32 wmvcore
%prm
pwszFileName, pfIsProtected
pwszFileName : [wstr] DRM 保護コンテンツの有無をチェックするファイルの名前を含むワイド文字 NULL 終端文字列へのポインタ。
pfIsProtected : [var] ファイルが DRM 保護コンテンツを含む場合、関数から戻った時点で True に設定されるブール値へのポインタ。
%inst
WMIsContentProtected 関数はファイルに DRM
保護コンテンツが含まれているかをチェックする。この関数は、アプリケーションが保護されたファイルを迅速に識別するためのショートカットである。

[戻り値]
関数は HRESULT を返す。発生しうる値は次の表に示すものに限定されない。
このドキュメントは省略されている。

