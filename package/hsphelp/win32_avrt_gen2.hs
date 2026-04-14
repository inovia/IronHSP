; ============================================================
;   avrt.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
AvQuerySystemResponsiveness
Retrieves the system responsiveness setting used by the multimedia class scheduler service.
%group
Win32 avrt
%prm
AvrtHandle, SystemResponsivenessValue
AvrtHandle : [intptr] A handle to the task. This handle is returned by the AvSetMmThreadCharacteristics or AvSetMmMaxThreadCharacteristics function.
SystemResponsivenessValue : [var] The system responsiveness value. This value can range from 10 to 100 percent.
%inst
Retrieves the system responsiveness setting used by the multimedia
class scheduler service.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
AvRevertMmThreadCharacteristics
Indicates that a thread is no longer performing work associated with the specified task.
%group
Win32 avrt
%prm
AvrtHandle
AvrtHandle : [intptr] A handle to the task. This handle is returned by the AvSetMmThreadCharacteristics or AvSetMmMaxThreadCharacteristics function.
%inst
Indicates that a thread is no longer performing work associated with
the specified task.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
This function must be called from the same thread that called the
AvSetMmThreadCharacteristics or AvSetMmMaxThreadCharacteristics
function to create the handle. Otherwise, the function will fail.


%index
AvRtCreateThreadOrderingGroup
Creates a thread ordering group.
%group
Win32 avrt
%prm
Context, Period, ThreadOrderingGuid, Timeout
Context : [intptr] A pointer to a context handle.
Period : [var] A pointer to a value, in 100-nanosecond increments, that specifies the period for the thread ordering group. Each thread in the thread ordering group runs one time during this period. If all threads complete their execution before a period ends, all threads wait until the remainder of the period elapses before any are executed again. The possible values for this parameter depend on the platform, but this parameter can be as low as 500 microseconds or as high as 0x1FFFFFFFFFFFFFFF. If this parameter is less than 500 microseconds, then it is set to 500 microseconds. If this parameter is greater than the maximum, then it is set to 0x1FFFFFFFFFFFFFFF.
ThreadOrderingGuid : [var] A pointer to the unique identifier for the thread ordering group to be created. If this value is not unique to the thread ordering service, the function fails. If the identifier is GUID_NULL on input, the thread ordering service generates and returns a unique identifier.
Timeout : [var] A pointer to a time-out value. All threads within the group should complete their execution within Period plus Timeout. If a thread fails to complete its processing within the period plus this time-out interval, it is removed from the thread ordering group. If the parent fails to complete its processing within the period plus the time-out interval, the thread ordering group is destroyed. The possible values for this parameter depend on the platform, but can be as low as 500 microseconds or as high as 0x1FFFFFFFFFFFFFFF. If this parameter is less than 500 microseconds, then it is set to 500 microseconds. If this parameter is greater than the maximum, then it is set to 0x1FFFFFFFFFFFFFFF. If this parameter is NULL or 0, the default is five times the value of Period. If this parameter is THREAD_ORDER_GROUP_INFINITE_TIMEOUT, the group is created with an infinite time-out interval. This can be useful for debugging purposes.
%inst
Creates a thread ordering group.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. If a thread ordering group with the
specified identifier already exists, the function fails and sets the
last error to ERROR_ALREADY_EXISTS.

[備考]
The calling thread is considered to be the parent thread. Each thread
ordering group has one parent thread. Each parent thread can have
zero or more predecessor threads and zero or more successor threads.
A client thread can join a thread ordering group and specify whether
it is a predecessor or successor using the
AvRtJoinThreadOrderingGroup function. The parent thread encloses the
code to be executed during each period within a loop that is
controlled by the AvRtWaitOnThreadOrderingGroup function. To delete
the thread ordering group, call the AvRtDeleteThreadOrderingGroup
function. A thread can create more than one thread ordering group and
join more than one thread ordering group. However, a thread cannot
join the same thread ordering group more than one time.


%index
AvRtCreateThreadOrderingGroupExW
Creates a thread ordering group and associates the server thread with a task. (Unicode)
%group
Win32 avrt
%prm
Context, Period, ThreadOrderingGuid, Timeout, TaskName
Context : [intptr] A pointer to a context handle.
Period : [var] A pointer to a value, in 100-nanosecond increments, that specifies the period for the thread ordering group. Each thread in the thread ordering group runs one time during this period. If all threads complete their execution before a period ends, all threads wait until the remainder of the period elapses before any are executed again. The possible values for this parameter depend on the platform, but this parameter can be as low as 500 microseconds or as high as 0x1FFFFFFFFFFFFFFF. If this parameter is less than 500 microseconds, then it is set to 500 microseconds. If this parameter is greater than the maximum, then it is set to 0x1FFFFFFFFFFFFFFF.
ThreadOrderingGuid : [var] A pointer to the unique identifier for the thread ordering group to be created. If this value is not unique to the thread ordering service, the function fails. If the identifier is GUID_NULL on input, the thread ordering service generates and returns a unique identifier.
Timeout : [var] A pointer to a time-out value. All threads within the group should complete their execution within Period plus Timeout. If a thread fails to complete its processing within the period plus this time-out interval, it is removed from the thread ordering group. If the parent fails to complete its processing within the period plus the time-out interval, the thread ordering group is destroyed. The possible values for this parameter depend on the platform, but can be as low as 500 microseconds or as high as 0x1FFFFFFFFFFFFFFF. If this parameter is less than 500 microseconds, then it is set to 500 microseconds. If this parameter is greater than the maximum, then it is set to 0x1FFFFFFFFFFFFFFF. If this parameter is NULL or 0, the default is five times the value of Period. If this parameter is THREAD_ORDER_GROUP_INFINITE_TIMEOUT, the group is created with an infinite time-out interval. This can be useful for debugging purposes.
TaskName : [wstr] The name of the task.
%inst
Creates a thread ordering group and associates the server thread with
a task. (Unicode)

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError. If a thread ordering group with the
specified identifier already exists, the function fails and sets the
last error to ERROR_ALREADY_EXISTS.

[備考]
The calling thread is considered to be the parent thread. Each thread
ordering group has one parent thread. Each parent thread can have
zero or more predecessor threads and zero or more successor threads.
A client thread can join a thread ordering group and specify whether
it is a predecessor or successor using the
AvRtJoinThreadOrderingGroup function. The parent thread encloses the
code to be executed during each period within a loop that is
controlled by the AvRtWaitOnThreadOrderingGroup function. To delete
the thread ordering group, call the AvRtDeleteThreadOrderingGroup
function. A thread can create more than one thread ordering group and
join more than one thread ordering group. However, a thread cannot
join the same thread ordering group more than one time. The parent
and client threads of a thread ordering group run at high priorities.
However, the server thread that manages the thread ordering group
runs at normal priority. Therefore, there can be a delay switching
from one client thread to another if there are other high-priority
threads running. The TaskName parameter of this function specifies
the task to be associated with the server thread.


%index
AvRtDeleteThreadOrderingGroup
Deletes the specified thread ordering group created by the caller. It cleans up resources for the thread ordering group, including the context information, and returns.
%group
Win32 avrt
%prm
Context
Context : [intptr] A context handle. This handle is returned by the AvRtCreateThreadOrderingGroup function when creating the group.
%inst
Deletes the specified thread ordering group created by the caller. It
cleans up resources for the thread ordering group, including the
context information, and returns.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
This function can only be called successfully by the parent thread
for the thread ordering group. If a thread other than the parent
thread calls this function, the function fails with a last error code
of ERROR_INVALID_FUNCTION. If the parent thread times out and
attempts to call this function, the function fails with a last error
code of ERROR_INVALID_PARAMETER.


%index
AvRtJoinThreadOrderingGroup
Joins client threads to a thread ordering group.
%group
Win32 avrt
%prm
Context, ThreadOrderingGuid, Before
Context : [intptr] A pointer to a context handle.
ThreadOrderingGuid : [var] A pointer to the unique identifier for the thread ordering group.
Before : [int] The thread order. If this parameter is TRUE, the thread is a predecessor thread that is scheduled to run before the parent thread. If this parameter is FALSE, the thread is a successor thread that is scheduled to run after the parent thread.
%inst
Joins client threads to a thread ordering group.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The thread encloses the code to be executed during each period within
a loop that is controlled by the AvRtWaitOnThreadOrderingGroup
function. A thread can create more than one thread ordering group and
join more than one thread ordering group. However, a thread cannot
join the same thread ordering group more than one time. The number of
threads that can join a group is limited only by available system
resources.


%index
AvRtLeaveThreadOrderingGroup
Enables client threads to leave a thread ordering group.
%group
Win32 avrt
%prm
Context
Context : [intptr] A context handle. This handle is returned by the AvRtJoinThreadOrderingGroup function.
%inst
Enables client threads to leave a thread ordering group.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The parent thread for a thread ordering group should not remove
itself from the group. If a thread times out and attempts to call
this function, the function fails with a last error code of
ERROR_INVALID_PARAMETER.


%index
AvRtWaitOnThreadOrderingGroup
Enables client threads of a thread ordering group to wait until they should execute.
%group
Win32 avrt
%prm
Context
Context : [intptr] A context handle. This handle is returned by the AvRtCreateThreadOrderingGroup or AvRtJoinThreadOrderingGroup function.
%inst
Enables client threads of a thread ordering group to wait until they
should execute.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
When this function returns, the thread should complete its processing
for the period and then call the function again. If the thread fails
to complete its processing during the time-out interval specified by
the parent thread when creating the group, it is deleted from the
thread ordering group. Therefore, when the thread finishes its
processing loop, the next call to AvRtWaitOnThreadOrderingGroup fails
and the last error code is set to ERROR_ACCESS_DENIED. If the thread
ordering group is deleted during the wait, this function eventually
times out and return ERROR_ACCESS_DENIED.


%index
AvSetMmMaxThreadCharacteristicsW
Associates the calling thread with the specified tasks. (Unicode)
%group
Win32 avrt
%prm
FirstTask, SecondTask, TaskIndex
FirstTask : [wstr] The name of the first task to be performed. This name must match the name of one of the subkeys of the following key HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks.
SecondTask : [wstr] The name of the second task to be performed. This name must match the name of one of the subkeys of the following key HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks.
TaskIndex : [var] The unique task identifier. The first time this function is called, this value must be 0 on input. The index value is returned on output and can be used as input in subsequent calls.
%inst
Associates the calling thread with the specified tasks. (Unicode)

[戻り値]
If the function succeeds, it returns a handle to the task. If the
function fails, it returns 0. To retrieve extended error information,
call GetLastError.
The following are possible error codes.
This doc was truncated.

[備考]
The resulting characteristics of the thread performing the tasks
reflect the task with the highest priority. When the task is
completed, call the AvRevertMmThreadCharacteristics function.
> [!NOTE] > The avrt.h header defines AvSetMmMaxThreadCharacteristics
as an alias which automatically selects the ANSI or Unicode version
of this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
AvSetMmThreadCharacteristicsW
Associates the calling thread with the specified task. (Unicode)
%group
Win32 avrt
%prm
TaskName, TaskIndex
TaskName : [wstr] The name of the task to be performed. This name must match the name of one of the subkeys of the following key HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks.
TaskIndex : [var] The unique task identifier. The first time this function is called, this value must be 0 on input. The index value is returned on output and can be used as input in subsequent calls.
%inst
Associates the calling thread with the specified task. (Unicode)

[戻り値]
If the function succeeds, it returns a handle to the task. If the
function fails, it returns 0. To retrieve extended error information,
call GetLastError.
The following are possible error codes.
This doc was truncated.

[備考]
When the task is completed, call the AvRevertMmThreadCharacteristics
function.
> [!NOTE] > The avrt.h header defines AvSetMmThreadCharacteristics as
an alias which automatically selects the ANSI or Unicode version of
this function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
AvSetMmThreadPriority
Adjusts the thread priority of the calling thread relative to other threads performing the same task.
%group
Win32 avrt
%prm
AvrtHandle, Priority
AvrtHandle : [intptr] A handle to the task. This handle is returned by the AvSetMmThreadCharacteristics or AvSetMmMaxThreadCharacteristics function.
Priority : [int] 
%inst
Adjusts the thread priority of the calling thread relative to other
threads performing the same task.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

