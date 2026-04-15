; ============================================================
;   avrt.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
AvQuerySystemResponsiveness
マルチメディアクラススケジューラサービスが使用するシステム応答性の設定を取得する。
%group
Win32 avrt
%prm
AvrtHandle, SystemResponsivenessValue
AvrtHandle : [intptr] タスクへのハンドル。このハンドルは AvSetMmThreadCharacteristics または AvSetMmMaxThreadCharacteristics 関数から返される。
SystemResponsivenessValue : [var] システム応答性の値。この値は 10 から 100 パーセントの範囲を取りうる。
%inst
マルチメディアクラススケジューラサービスが使用するシステム応答性の設定を取得する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
AvRevertMmThreadCharacteristics
スレッドが指定されたタスクに関連する作業をもはや行っていないことを示す。
%group
Win32 avrt
%prm
AvrtHandle
AvrtHandle : [intptr] タスクへのハンドル。このハンドルは AvSetMmThreadCharacteristics または AvSetMmMaxThreadCharacteristics 関数から返される。
%inst
スレッドが指定されたタスクに関連する作業をもはや行っていないことを示す。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
この関数は、ハンドルを生成するために AvSetMmThreadCharacteristics または
AvSetMmMaxThreadCharacteristics
を呼び出したのと同じスレッドから呼び出す必要がある。そうでない場合、関数は失敗する。


%index
AvRtCreateThreadOrderingGroup
スレッド順序付けグループを作成する。
%group
Win32 avrt
%prm
Context, Period, ThreadOrderingGuid, Timeout
Context : [intptr] コンテキストハンドルへのポインタ。
Period : [var] スレッド順序付けグループの周期を 100 ナノ秒単位で指定する値へのポインタ。スレッド順序付けグループ内の各スレッドはこの周期の間に 1 回実行される。すべてのスレッドが周期終了前に実行を完了した場合、周期の残りが経過するまでどのスレッドも待機し、その後再度実行される。このパラメータに指定可能な値はプラットフォームに依存するが、最小 500 マイクロ秒から最大 0x1FFFFFFFFFFFFFFF までの範囲を取りうる。このパラメータが 500 マイクロ秒未満の場合は 500 マイクロ秒に設定される。最大値を超える場合は 0x1FFFFFFFFFFFFFFF に設定される。
ThreadOrderingGuid : [var] 作成するスレッド順序付けグループの一意識別子へのポインタ。この値がスレッド順序付けサービス内で一意でない場合、関数は失敗する。入力時に識別子が GUID_NULL の場合、スレッド順序付けサービスが一意識別子を生成して返す。
Timeout : [var] タイムアウト値へのポインタ。グループ内のすべてのスレッドは Period と Timeout の合計時間内に実行を完了する必要がある。スレッドが周期 + タイムアウト間隔内に処理を完了しない場合、そのスレッドはスレッド順序付けグループから削除される。親スレッドが周期 + タイムアウト間隔内に処理を完了しない場合、スレッド順序付けグループは破棄される。このパラメータに指定可能な値はプラットフォームに依存するが、最小 500 マイクロ秒から最大 0x1FFFFFFFFFFFFFFF までの範囲を取りうる。500 マイクロ秒未満の場合は 500 マイクロ秒に設定される。最大値を超える場合は 0x1FFFFFFFFFFFFFFF に設定される。このパラメータが NULL または 0 の場合、既定値は Period の 5 倍となる。THREAD_ORDER_GROUP_INFINITE_TIMEOUT を指定した場合、グループは無限のタイムアウト間隔で作成される。これはデバッグ目的に有用である。
%inst
スレッド順序付けグループを作成する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。指定された識別子のスレッド順序付けグループが既に存在する場合、関数は失敗し、LastError を
ERROR_ALREADY_EXISTS に設定する。

[備考]
呼び出し元のスレッドが親スレッドとみなされる。各スレッド順序付けグループには 1 つの親スレッドが存在する。各親スレッドは 0
個以上の先行スレッドおよび 0
個以上の後続スレッドを持てる。クライアントスレッドはスレッド順序付けグループに参加でき、AvRtJoinThreadOrderingGroup
関数を使用して自身が先行か後続かを指定する。親スレッドは各周期の間に実行されるコードを、AvRtWaitOnThreadOrderingGroup
関数で制御されるループ内に配置する。スレッド順序付けグループを削除するには AvRtDeleteThreadOrderingGroup
関数を呼び出す。スレッドは複数のスレッド順序付けグループを作成でき、また複数のグループに参加できる。ただし、同一グループに複数回参加することはできない。


%index
AvRtCreateThreadOrderingGroupExW
スレッド順序付けグループを作成し、サーバースレッドをタスクに関連付ける。(Unicode)
%group
Win32 avrt
%prm
Context, Period, ThreadOrderingGuid, Timeout, TaskName
Context : [intptr] コンテキストハンドルへのポインタ。
Period : [var] スレッド順序付けグループの周期を 100 ナノ秒単位で指定する値へのポインタ。スレッド順序付けグループ内の各スレッドはこの周期の間に 1 回実行される。すべてのスレッドが周期終了前に実行を完了した場合、周期の残りが経過するまでどのスレッドも待機し、その後再度実行される。このパラメータに指定可能な値はプラットフォームに依存するが、最小 500 マイクロ秒から最大 0x1FFFFFFFFFFFFFFF までの範囲を取りうる。500 マイクロ秒未満の場合は 500 マイクロ秒に設定される。最大値を超える場合は 0x1FFFFFFFFFFFFFFF に設定される。
ThreadOrderingGuid : [var] 作成するスレッド順序付けグループの一意識別子へのポインタ。この値がスレッド順序付けサービス内で一意でない場合、関数は失敗する。入力時に識別子が GUID_NULL の場合、スレッド順序付けサービスが一意識別子を生成して返す。
Timeout : [var] タイムアウト値へのポインタ。グループ内のすべてのスレッドは Period と Timeout の合計時間内に実行を完了する必要がある。スレッドが周期 + タイムアウト間隔内に処理を完了しない場合、そのスレッドはスレッド順序付けグループから削除される。親スレッドが周期 + タイムアウト間隔内に処理を完了しない場合、スレッド順序付けグループは破棄される。このパラメータに指定可能な値はプラットフォームに依存するが、最小 500 マイクロ秒から最大 0x1FFFFFFFFFFFFFFF までの範囲を取りうる。500 マイクロ秒未満の場合は 500 マイクロ秒に設定される。最大値を超える場合は 0x1FFFFFFFFFFFFFFF に設定される。このパラメータが NULL または 0 の場合、既定値は Period の 5 倍となる。THREAD_ORDER_GROUP_INFINITE_TIMEOUT を指定した場合、グループは無限のタイムアウト間隔で作成される。これはデバッグ目的に有用である。
TaskName : [wstr] タスクの名前。
%inst
スレッド順序付けグループを作成し、サーバースレッドをタスクに関連付ける。(Unicode)

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。指定された識別子のスレッド順序付けグループが既に存在する場合、関数は失敗し、LastError を
ERROR_ALREADY_EXISTS に設定する。

[備考]
呼び出し元のスレッドが親スレッドとみなされる。各スレッド順序付けグループには 1 つの親スレッドが存在する。各親スレッドは 0
個以上の先行スレッドおよび 0
個以上の後続スレッドを持てる。クライアントスレッドはスレッド順序付けグループに参加でき、AvRtJoinThreadOrderingGroup
関数を使用して自身が先行か後続かを指定する。親スレッドは各周期の間に実行されるコードを、AvRtWaitOnThreadOrderingGroup
関数で制御されるループ内に配置する。スレッド順序付けグループを削除するには AvRtDeleteThreadOrderingGroup
関数を呼び出す。スレッドは複数のスレッド順序付けグループを作成でき、また複数のグループに参加できる。ただし、同一グループに複数回参加することはできない。スレッド順序付けグループの親スレッドおよびクライアントスレッドは高い優先度で実行される。しかし、グループを管理するサーバースレッドは通常優先度で実行される。そのため、他に高優先度のスレッドが実行されている場合には、あるクライアントスレッドから別のスレッドへの切り替えに遅延が生じることがある。この関数の
TaskName パラメータは、サーバースレッドに関連付けられるタスクを指定する。


%index
AvRtDeleteThreadOrderingGroup
呼び出し元が作成した指定のスレッド順序付けグループを削除する。コンテキスト情報を含むグループのリソースをクリーンアップして返る。
%group
Win32 avrt
%prm
Context
Context : [intptr] コンテキストハンドル。このハンドルはグループ作成時に AvRtCreateThreadOrderingGroup 関数から返される。
%inst
呼び出し元が作成した指定のスレッド順序付けグループを削除する。コンテキスト情報を含むグループのリソースをクリーンアップして返る。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
この関数はスレッド順序付けグループの親スレッドからのみ正常に呼び出すことができる。親スレッド以外がこの関数を呼び出すと、関数は失敗し
LastError は ERROR_INVALID_FUNCTION
になる。親スレッドがタイムアウトしこの関数を呼び出した場合、関数は失敗し LastError は
ERROR_INVALID_PARAMETER になる。


%index
AvRtJoinThreadOrderingGroup
クライアントスレッドをスレッド順序付けグループに参加させる。
%group
Win32 avrt
%prm
Context, ThreadOrderingGuid, Before
Context : [intptr] コンテキストハンドルへのポインタ。
ThreadOrderingGuid : [var] スレッド順序付けグループの一意識別子へのポインタ。
Before : [int] スレッドの順序。このパラメータが TRUE の場合、スレッドは親スレッドより前に実行される先行スレッドとなる。FALSE の場合、親スレッドの後に実行される後続スレッドとなる。
%inst
クライアントスレッドをスレッド順序付けグループに参加させる。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
スレッドは各周期の間に実行されるコードを、AvRtWaitOnThreadOrderingGroup
関数で制御されるループ内に配置する。スレッドは複数のスレッド順序付けグループを作成でき、複数のグループに参加できる。ただし、同一グループに複数回参加することはできない。グループに参加できるスレッド数は、利用可能なシステムリソースによってのみ制限される。


%index
AvRtLeaveThreadOrderingGroup
クライアントスレッドがスレッド順序付けグループから離脱できるようにする。
%group
Win32 avrt
%prm
Context
Context : [intptr] コンテキストハンドル。このハンドルは AvRtJoinThreadOrderingGroup 関数から返される。
%inst
クライアントスレッドがスレッド順序付けグループから離脱できるようにする。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]

スレッド順序付けグループの親スレッドは、自身をグループから除去すべきではない。スレッドがタイムアウトしこの関数を呼び出した場合、関数は失敗し
LastError は ERROR_INVALID_PARAMETER となる。


%index
AvRtWaitOnThreadOrderingGroup
スレッド順序付けグループのクライアントスレッドが実行すべきタイミングまで待機できるようにする。
%group
Win32 avrt
%prm
Context
Context : [intptr] コンテキストハンドル。このハンドルは AvRtCreateThreadOrderingGroup または AvRtJoinThreadOrderingGroup 関数から返される。
%inst
スレッド順序付けグループのクライアントスレッドが実行すべきタイミングまで待機できるようにする。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]

この関数から戻った後、スレッドは当該周期の処理を完了し、再度この関数を呼び出すべきである。グループ作成時に親スレッドが指定したタイムアウト間隔内にスレッドが処理を完了できなかった場合、そのスレッドはスレッド順序付けグループから削除される。従って、スレッドが処理ループを終えた後、次の
AvRtWaitOnThreadOrderingGroup 呼び出しは失敗し、LastError は
ERROR_ACCESS_DENIED となる。待機中にスレッド順序付けグループが削除された場合、この関数は最終的にタイムアウトし
ERROR_ACCESS_DENIED を返す。


%index
AvSetMmMaxThreadCharacteristicsW
呼び出し元スレッドを指定された複数のタスクに関連付ける。(Unicode)
%group
Win32 avrt
%prm
FirstTask, SecondTask, TaskIndex
FirstTask : [wstr] 実行する最初のタスクの名前。この名前は次のキーのサブキーの 1 つと一致していなければならない。HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks。
SecondTask : [wstr] 実行する 2 番目のタスクの名前。この名前は次のキーのサブキーの 1 つと一致していなければならない。HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks。
TaskIndex : [var] 一意のタスク識別子。この関数を最初に呼び出す時、この値は入力時に 0 でなければならない。インデックス値は出力時に返され、以降の呼び出しで入力として使用できる。
%inst
呼び出し元スレッドを指定された複数のタスクに関連付ける。(Unicode)

[戻り値]
関数が成功すると、タスクへのハンドルを返す。関数が失敗すると 0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。
以下は発生しうるエラーコードである。
このドキュメントは省略されている。

[備考]
タスクを実行するスレッドの結果として得られる特性は、最も高い優先度を持つタスクを反映する。タスクが完了したら
AvRevertMmThreadCharacteristics 関数を呼び出す。
> [!NOTE] > avrt.h ヘッダは AvSetMmMaxThreadCharacteristics
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立なエイリアスと中立でないコードを混在させると不一致が発生し、コンパイルエラーや実行時エラーの原因となりうる。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
AvSetMmThreadCharacteristicsW
呼び出し元スレッドを指定されたタスクに関連付ける。(Unicode)
%group
Win32 avrt
%prm
TaskName, TaskIndex
TaskName : [wstr] 実行するタスクの名前。この名前は次のキーのサブキーの 1 つと一致していなければならない。HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks。
TaskIndex : [var] 一意のタスク識別子。この関数を最初に呼び出す時、この値は入力時に 0 でなければならない。インデックス値は出力時に返され、以降の呼び出しで入力として使用できる。
%inst
呼び出し元スレッドを指定されたタスクに関連付ける。(Unicode)

[戻り値]
関数が成功すると、タスクへのハンドルを返す。関数が失敗すると 0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。
以下は発生しうるエラーコードである。
このドキュメントは省略されている。

[備考]
タスクが完了したら AvRevertMmThreadCharacteristics 関数を呼び出す。
> [!NOTE] > avrt.h ヘッダは AvSetMmThreadCharacteristics
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づいてこの関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング中立なエイリアスと中立でないコードを混在させると不一致が発生し、コンパイルエラーや実行時エラーの原因となりうる。詳細は
[Conventions for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes)
を参照のこと。


%index
AvSetMmThreadPriority
同じタスクを実行する他のスレッドに対する呼び出し元スレッドの優先度を調整する。
%group
Win32 avrt
%prm
AvrtHandle, Priority
AvrtHandle : [intptr] タスクへのハンドル。このハンドルは AvSetMmThreadCharacteristics または AvSetMmMaxThreadCharacteristics 関数から返される。
Priority : [int] 
%inst
同じタスクを実行する他のスレッドに対する呼び出し元スレッドの優先度を調整する。

[戻り値]
関数が成功すると、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。

