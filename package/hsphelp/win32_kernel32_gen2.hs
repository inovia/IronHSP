; ============================================================
;   kernel32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CloseHandle
開いているオブジェクトのハンドルを閉じる。
%group
Win32 kernel32
%prm
hObject
hObject : [intptr] 開いているオブジェクトへの有効なハンドル。
%inst
開いているオブジェクトのハンドルを閉じる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError
を呼び出す。デバッガ配下で実行中のアプリケーションは、無効なハンドル値や疑似ハンドル値を受け取った場合に例外を投げる。これはハンドルを二重に閉じたり、FindClose
の代わりに FindFirstFile の戻り値を CloseHandle に渡した場合などに発生する。

[備考]
CloseHandle 関数は次のオブジェクトのハンドルを閉じる:
（以下省略）


%index
FreeLibrary
ロードされたダイナミックリンクライブラリ(DLL)モジュールを解放し、必要に応じて参照カウントを減少させる。
%group
Win32 kernel32
%prm
hLibModule
hLibModule : [intptr] ロード済みライブラリモジュールへのハンドル。LoadLibrary、LoadLibraryEx、GetModuleHandle、GetModuleHandleEx のいずれかがこのハンドルを返す。
%inst
ロードされたダイナミックリンクライブラリ(DLL)モジュールを解放し、必要に応じて参照カウントを減少させる。

[戻り値]
関数が成功した場合、戻り値は 0 以外。失敗した場合は 0。拡張エラー情報を得るには GetLastError を呼び出す。

[備考]

システムはロード済みモジュールごとにプロセス単位の参照カウントを保持する。プロセス初期化時のロード時動的リンクによってロードされたモジュールは参照カウントが
1 となる。モジュールの参照カウントは LoadLibrary 呼び出しごとに 1 増加する。LoadLibraryEx
による呼び出しでも、モジュールが初回ロードかつデータ/イメージファイルとしてロードされる場合を除いて参照カウントが増加する。FreeLibrary
または FreeLibraryAndExitThread を呼び出すたびに参照カウントが減少する。参照カウントが 0
になるかプロセスが終了するとモジュールはアドレス空間からアンロードされる。ライブラリモジュールのアンロード前、システムはモジュールの
DllMain 関数が存在する場合に DLL_PROCESS_DETACH
値でそれを呼び出し、現在のプロセスのために確保したリソースをクリーンアップする機会を与える。エントリポイント関数が戻った後、ライブラリモジュールはアドレス空間から削除される。DllMain
から FreeLibrary を呼ぶのは安全ではない。詳細は DllMain の Remarks を参照。FreeLibrary
の呼び出しは同じモジュールを使用する他のプロセスには影響しない。GetModuleHandle が返したハンドルで FreeLibrary
を呼ぶ際は注意が必要。GetModuleHandle は参照カウントを増加させないため、そのハンドルを FreeLibrary
に渡すとモジュールが早期にアンロードされる可能性がある。実行中の DLL
をアンロードして自身を終了させるスレッドは、FreeLibrary と ExitThread を個別に呼ぶのではなく
FreeLibraryAndExitThread を呼ぶこと。そうしないとレース条件が発生しうる。詳細は
FreeLibraryAndExitThread の Remarks を参照。

