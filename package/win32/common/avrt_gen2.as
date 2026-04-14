; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    avrt.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __avrt_gen2_as__
#define global __avrt_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "avrt.dll"
; winmdroot.Foundation.BOOL AvQuerySystemResponsiveness(winmdroot.Foundation.HANDLE AvrtHandle, uint* SystemResponsivenessValue)
#cfunc global AvQuerySystemResponsiveness "AvQuerySystemResponsiveness" intptr, var

; winmdroot.Foundation.BOOL AvRevertMmThreadCharacteristics(winmdroot.Foundation.HANDLE AvrtHandle)
#cfunc global AvRevertMmThreadCharacteristics "AvRevertMmThreadCharacteristics" intptr

; winmdroot.Foundation.BOOL AvRtCreateThreadOrderingGroup(winmdroot.Foundation.HANDLE* Context, long* Period, global::System.Guid* ThreadOrderingGuid, [Optional] long* Timeout)
#cfunc global AvRtCreateThreadOrderingGroup "AvRtCreateThreadOrderingGroup" intptr, var, var, var

; winmdroot.Foundation.BOOL AvRtCreateThreadOrderingGroupEx(winmdroot.Foundation.HANDLE* Context, long* Period, global::System.Guid* ThreadOrderingGuid, [Optional] long* Timeout, winmdroot.Foundation.PCWSTR TaskName)
#cfunc global AvRtCreateThreadOrderingGroupExW "AvRtCreateThreadOrderingGroupExW" intptr, var, var, var, wstr

; winmdroot.Foundation.BOOL AvRtDeleteThreadOrderingGroup(winmdroot.Foundation.HANDLE Context)
#cfunc global AvRtDeleteThreadOrderingGroup "AvRtDeleteThreadOrderingGroup" intptr

; winmdroot.Foundation.BOOL AvRtJoinThreadOrderingGroup(winmdroot.Foundation.HANDLE* Context, global::System.Guid* ThreadOrderingGuid, winmdroot.Foundation.BOOL Before)
#cfunc global AvRtJoinThreadOrderingGroup "AvRtJoinThreadOrderingGroup" intptr, var, int

; winmdroot.Foundation.BOOL AvRtLeaveThreadOrderingGroup(winmdroot.Foundation.HANDLE Context)
#cfunc global AvRtLeaveThreadOrderingGroup "AvRtLeaveThreadOrderingGroup" intptr

; winmdroot.Foundation.BOOL AvRtWaitOnThreadOrderingGroup(winmdroot.Foundation.HANDLE Context)
#cfunc global AvRtWaitOnThreadOrderingGroup "AvRtWaitOnThreadOrderingGroup" intptr

; winmdroot.Foundation.HANDLE AvSetMmMaxThreadCharacteristics(winmdroot.Foundation.PCWSTR FirstTask, winmdroot.Foundation.PCWSTR SecondTask, uint* TaskIndex)
#cfunc global AvSetMmMaxThreadCharacteristicsW "AvSetMmMaxThreadCharacteristicsW" wstr, wstr, var

; winmdroot.Foundation.HANDLE AvSetMmThreadCharacteristics(winmdroot.Foundation.PCWSTR TaskName, uint* TaskIndex)
#cfunc global AvSetMmThreadCharacteristicsW "AvSetMmThreadCharacteristicsW" wstr, var

; winmdroot.Foundation.BOOL AvSetMmThreadPriority(winmdroot.Foundation.HANDLE AvrtHandle, winmdroot.System.Threading.AVRT_PRIORITY Priority)
#cfunc global AvSetMmThreadPriority "AvSetMmThreadPriority" intptr, int

#endif
