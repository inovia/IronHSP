; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   dll:    powrprof.dll
;   tool:   tools/cswin32_bridge/gen_from_cswin32.py
;   Do not edit by hand ? regenerate via the python script.
;   Needs hsp3net (intptr / NSTRUCT / wstr).
; ============================================================

#ifndef __powrprof_gen2_as__
#define global __powrprof_gen2_as__

; Shared NSTRUCT + #define constants for all win32 *_gen2.as
#include "win32_types_gen2.as"

;--- functions ---
#uselib "powrprof.dll"
; winmdroot.Foundation.NTSTATUS CallNtPowerInformation(winmdroot.System.Power.POWER_INFORMATION_LEVEL InformationLevel, [Optional] void* InputBuffer, uint InputBufferLength, [Optional] void* OutputBuffer, uint OutputBufferLength)
#cfunc global CallNtPowerInformation "CallNtPowerInformation" int, intptr, int, intptr, int

; winmdroot.Foundation.BOOLEAN CanUserWritePwrScheme()
#cfunc global CanUserWritePwrScheme "CanUserWritePwrScheme"

; winmdroot.Foundation.BOOLEAN DeletePwrScheme(uint uiID)
#cfunc global DeletePwrScheme "DeletePwrScheme" int

; winmdroot.Foundation.BOOLEAN DevicePowerClose()
#cfunc global DevicePowerClose "DevicePowerClose"

; winmdroot.Foundation.BOOLEAN DevicePowerEnumDevices(uint QueryIndex, uint QueryInterpretationFlags, uint QueryFlags, [Optional] byte* pReturnBuffer, uint* pBufferSize)
#cfunc global DevicePowerEnumDevices "DevicePowerEnumDevices" int, int, int, var, var

; winmdroot.Foundation.BOOLEAN DevicePowerOpen(uint DebugMask)
#cfunc global DevicePowerOpen "DevicePowerOpen" int

; uint DevicePowerSetDeviceState(winmdroot.Foundation.PCWSTR DeviceDescription, uint SetFlags, [Optional] void* SetData)
#cfunc global DevicePowerSetDeviceState "DevicePowerSetDeviceState" wstr, int, intptr

; winmdroot.Foundation.BOOLEAN EnumPwrSchemes(delegate *unmanaged[Stdcall]<uint,uint,global::Windows.Win32.Foundation.PWSTR,uint,global::Windows.Win32.Foundation.PWSTR,global::Windows.Win32.System.Power.POWER_POLICY*,global::Windows.Win32.Foundation.LPARAM,global::Windows.Win32.Foundation.BOOLEAN> lpfn, winmdroot.Foundation.LPARAM lParam)
#cfunc global EnumPwrSchemes "EnumPwrSchemes" int, intptr

; winmdroot.Foundation.BOOLEAN GetActivePwrScheme(uint* puiID)
#cfunc global GetActivePwrScheme "GetActivePwrScheme" var

; winmdroot.Foundation.BOOLEAN GetCurrentPowerPolicies(winmdroot.System.Power.GLOBAL_POWER_POLICY* pGlobalPowerPolicy, winmdroot.System.Power.POWER_POLICY* pPowerPolicy)
#cfunc global GetCurrentPowerPolicies "GetCurrentPowerPolicies" var, var

; winmdroot.Foundation.BOOLEAN GetPwrCapabilities(winmdroot.System.Power.SYSTEM_POWER_CAPABILITIES* lpspc)
#cfunc global GetPwrCapabilities "GetPwrCapabilities" var

; winmdroot.Foundation.BOOLEAN GetPwrDiskSpindownRange(uint* puiMax, uint* puiMin)
#cfunc global GetPwrDiskSpindownRange "GetPwrDiskSpindownRange" var, var

; winmdroot.Foundation.BOOLEAN IsAdminOverrideActive(winmdroot.System.Power.ADMINISTRATOR_POWER_POLICY* papp)
#cfunc global IsAdminOverrideActive "IsAdminOverrideActive" var

; winmdroot.Foundation.BOOLEAN IsPwrHibernateAllowed()
#cfunc global IsPwrHibernateAllowed "IsPwrHibernateAllowed"

; winmdroot.Foundation.BOOLEAN IsPwrShutdownAllowed()
#cfunc global IsPwrShutdownAllowed "IsPwrShutdownAllowed"

; winmdroot.Foundation.BOOLEAN IsPwrSuspendAllowed()
#cfunc global IsPwrSuspendAllowed "IsPwrSuspendAllowed"

; winmdroot.Foundation.WIN32_ERROR PowerCanRestoreIndividualDefaultPowerScheme(global::System.Guid* SchemeGuid)
#cfunc global PowerCanRestoreIndividualDefaultPowerScheme "PowerCanRestoreIndividualDefaultPowerScheme" var

; winmdroot.Foundation.WIN32_ERROR PowerCreatePossibleSetting(winmdroot.System.Registry.HKEY RootSystemPowerKey, global::System.Guid* SubGroupOfPowerSettingsGuid, global::System.Guid* PowerSettingGuid, uint PossibleSettingIndex)
#cfunc global PowerCreatePossibleSetting "PowerCreatePossibleSetting" intptr, var, var, int

; winmdroot.Foundation.WIN32_ERROR PowerCreateSetting(winmdroot.System.Registry.HKEY RootSystemPowerKey, global::System.Guid* SubGroupOfPowerSettingsGuid, global::System.Guid* PowerSettingGuid)
#cfunc global PowerCreateSetting "PowerCreateSetting" intptr, var, var

; winmdroot.Foundation.WIN32_ERROR PowerDeleteScheme(winmdroot.System.Registry.HKEY RootPowerKey, global::System.Guid* SchemeGuid)
#cfunc global PowerDeleteScheme "PowerDeleteScheme" intptr, var

; winmdroot.System.Power.POWER_PLATFORM_ROLE PowerDeterminePlatformRole()
#cfunc global PowerDeterminePlatformRole "PowerDeterminePlatformRole"

; winmdroot.System.Power.POWER_PLATFORM_ROLE PowerDeterminePlatformRoleEx(winmdroot.System.Power.POWER_PLATFORM_ROLE_VERSION Version)
#cfunc global PowerDeterminePlatformRoleEx "PowerDeterminePlatformRoleEx" int

; winmdroot.Foundation.WIN32_ERROR PowerDuplicateScheme(winmdroot.System.Registry.HKEY RootPowerKey, global::System.Guid* SourceSchemeGuid, global::System.Guid** DestinationSchemeGuid)
#cfunc global PowerDuplicateScheme "PowerDuplicateScheme" intptr, var, var

; winmdroot.Foundation.WIN32_ERROR PowerEnumerate(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SchemeGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, winmdroot.System.Power.POWER_DATA_ACCESSOR AccessFlags, uint Index, [Optional] byte* Buffer, uint* BufferSize)
#cfunc global PowerEnumerate "PowerEnumerate" intptr, var, var, int, int, var, var

; winmdroot.Foundation.WIN32_ERROR PowerGetActiveScheme(winmdroot.System.Registry.HKEY UserRootPowerKey, global::System.Guid** ActivePolicyGuid)
#cfunc global PowerGetActiveScheme "PowerGetActiveScheme" intptr, var

; winmdroot.Foundation.WIN32_ERROR PowerImportPowerScheme(winmdroot.System.Registry.HKEY RootPowerKey, winmdroot.Foundation.PCWSTR ImportFileNamePath, global::System.Guid** DestinationSchemeGuid)
#cfunc global PowerImportPowerScheme "PowerImportPowerScheme" intptr, wstr, var

; winmdroot.Foundation.BOOLEAN PowerIsSettingRangeDefined([Optional] global::System.Guid* SubKeyGuid, [Optional] global::System.Guid* SettingGuid)
#cfunc global PowerIsSettingRangeDefined "PowerIsSettingRangeDefined" var, var

; uint PowerOpenSystemPowerKey(winmdroot.System.Registry.HKEY* phSystemPowerKey, uint Access, winmdroot.Foundation.BOOL OpenExisting)
#cfunc global PowerOpenSystemPowerKey "PowerOpenSystemPowerKey" intptr, int, int

; uint PowerOpenUserPowerKey(winmdroot.System.Registry.HKEY* phUserPowerKey, uint Access, winmdroot.Foundation.BOOL OpenExisting)
#cfunc global PowerOpenUserPowerKey "PowerOpenUserPowerKey" intptr, int, int

; uint PowerReadACDefaultIndex(winmdroot.System.Registry.HKEY RootPowerKey, global::System.Guid* SchemePersonalityGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, global::System.Guid* PowerSettingGuid, uint* AcDefaultIndex)
#cfunc global PowerReadACDefaultIndex "PowerReadACDefaultIndex" intptr, var, var, var, var

; winmdroot.Foundation.WIN32_ERROR PowerReadACValue(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SchemeGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, [Optional] uint* Type, [Optional] byte* Buffer, [Optional] uint* BufferSize)
#cfunc global PowerReadACValue "PowerReadACValue" intptr, var, var, var, var, var, var

; winmdroot.Foundation.WIN32_ERROR PowerReadACValueIndex(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SchemeGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint* AcValueIndex)
#cfunc global PowerReadACValueIndex "PowerReadACValueIndex" intptr, var, var, var, var

; uint PowerReadDCDefaultIndex(winmdroot.System.Registry.HKEY RootPowerKey, global::System.Guid* SchemePersonalityGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, global::System.Guid* PowerSettingGuid, uint* DcDefaultIndex)
#cfunc global PowerReadDCDefaultIndex "PowerReadDCDefaultIndex" intptr, var, var, var, var

; winmdroot.Foundation.WIN32_ERROR PowerReadDCValue(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SchemeGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, [Optional] uint* Type, [Optional] byte* Buffer, uint* BufferSize)
#cfunc global PowerReadDCValue "PowerReadDCValue" intptr, var, var, var, var, var, var

; uint PowerReadDCValueIndex(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SchemeGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint* DcValueIndex)
#cfunc global PowerReadDCValueIndex "PowerReadDCValueIndex" intptr, var, var, var, var

; winmdroot.Foundation.WIN32_ERROR PowerReadDescription(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SchemeGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, [Optional] byte* Buffer, uint* BufferSize)
#cfunc global PowerReadDescription "PowerReadDescription" intptr, var, var, var, var, var

; winmdroot.Foundation.WIN32_ERROR PowerReadFriendlyName(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SchemeGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, [Optional] byte* Buffer, uint* BufferSize)
#cfunc global PowerReadFriendlyName "PowerReadFriendlyName" intptr, var, var, var, var, var

; winmdroot.Foundation.WIN32_ERROR PowerReadIconResourceSpecifier(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SchemeGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, [Optional] byte* Buffer, uint* BufferSize)
#cfunc global PowerReadIconResourceSpecifier "PowerReadIconResourceSpecifier" intptr, var, var, var, var, var

; winmdroot.Foundation.WIN32_ERROR PowerReadPossibleDescription(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint PossibleSettingIndex, [Optional] byte* Buffer, uint* BufferSize)
#cfunc global PowerReadPossibleDescription "PowerReadPossibleDescription" intptr, var, var, int, var, var

; winmdroot.Foundation.WIN32_ERROR PowerReadPossibleFriendlyName(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint PossibleSettingIndex, [Optional] byte* Buffer, uint* BufferSize)
#cfunc global PowerReadPossibleFriendlyName "PowerReadPossibleFriendlyName" intptr, var, var, int, var, var

; winmdroot.Foundation.WIN32_ERROR PowerReadPossibleValue(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, [Optional] uint* Type, uint PossibleSettingIndex, [Optional] byte* Buffer, uint* BufferSize)
#cfunc global PowerReadPossibleValue "PowerReadPossibleValue" intptr, var, var, var, int, var, var

; uint PowerReadSettingAttributes([Optional] global::System.Guid* SubGroupGuid, [Optional] global::System.Guid* PowerSettingGuid)
#cfunc global PowerReadSettingAttributes "PowerReadSettingAttributes" var, var

; winmdroot.Foundation.WIN32_ERROR PowerReadValueIncrement(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint* ValueIncrement)
#cfunc global PowerReadValueIncrement "PowerReadValueIncrement" intptr, var, var, var

; winmdroot.Foundation.WIN32_ERROR PowerReadValueMax(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint* ValueMaximum)
#cfunc global PowerReadValueMax "PowerReadValueMax" intptr, var, var, var

; winmdroot.Foundation.WIN32_ERROR PowerReadValueMin(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint* ValueMinimum)
#cfunc global PowerReadValueMin "PowerReadValueMin" intptr, var, var, var

; winmdroot.Foundation.WIN32_ERROR PowerReadValueUnitsSpecifier(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, [Optional] byte* Buffer, uint* BufferSize)
#cfunc global PowerReadValueUnitsSpecifier "PowerReadValueUnitsSpecifier" intptr, var, var, var, var

; winmdroot.Foundation.HRESULT PowerRegisterForEffectivePowerModeNotifications(uint Version, delegate *unmanaged[Stdcall]<global::Windows.Win32.System.Power.EFFECTIVE_POWER_MODE,void*,void> Callback, [Optional] void* Context, void** RegistrationHandle)
#cfunc global PowerRegisterForEffectivePowerModeNotifications "PowerRegisterForEffectivePowerModeNotifications" int, int, intptr, var

; winmdroot.Foundation.WIN32_ERROR PowerRegisterSuspendResumeNotification(winmdroot.UI.WindowsAndMessaging.REGISTER_NOTIFICATION_FLAGS Flags, winmdroot.Foundation.HANDLE Recipient, void** RegistrationHandle)
#cfunc global PowerRegisterSuspendResumeNotification "PowerRegisterSuspendResumeNotification" int, intptr, var

; winmdroot.Foundation.WIN32_ERROR PowerRemovePowerSetting(global::System.Guid* PowerSettingSubKeyGuid, global::System.Guid* PowerSettingGuid)
#cfunc global PowerRemovePowerSetting "PowerRemovePowerSetting" var, var

; uint PowerReplaceDefaultPowerSchemes()
#cfunc global PowerReplaceDefaultPowerSchemes "PowerReplaceDefaultPowerSchemes"

; winmdroot.Foundation.WIN32_ERROR PowerReportThermalEvent(winmdroot.System.Power.THERMAL_EVENT* Event)
#cfunc global PowerReportThermalEvent "PowerReportThermalEvent" var

; winmdroot.Foundation.WIN32_ERROR PowerRestoreDefaultPowerSchemes()
#cfunc global PowerRestoreDefaultPowerSchemes "PowerRestoreDefaultPowerSchemes"

; winmdroot.Foundation.WIN32_ERROR PowerRestoreIndividualDefaultPowerScheme(global::System.Guid* SchemeGuid)
#cfunc global PowerRestoreIndividualDefaultPowerScheme "PowerRestoreIndividualDefaultPowerScheme" var

; winmdroot.Foundation.WIN32_ERROR PowerSetActiveScheme(winmdroot.System.Registry.HKEY UserRootPowerKey, [Optional] global::System.Guid* SchemeGuid)
#cfunc global PowerSetActiveScheme "PowerSetActiveScheme" intptr, var

; winmdroot.Foundation.WIN32_ERROR PowerSettingAccessCheck(winmdroot.System.Power.POWER_DATA_ACCESSOR AccessFlags, [Optional] global::System.Guid* PowerGuid)
#cfunc global PowerSettingAccessCheck "PowerSettingAccessCheck" int, var

; winmdroot.Foundation.WIN32_ERROR PowerSettingAccessCheckEx(winmdroot.System.Power.POWER_DATA_ACCESSOR AccessFlags, [Optional] global::System.Guid* PowerGuid, winmdroot.System.Registry.REG_SAM_FLAGS AccessType)
#cfunc global PowerSettingAccessCheckEx "PowerSettingAccessCheckEx" int, var, int

; winmdroot.Foundation.WIN32_ERROR PowerSettingRegisterNotification(global::System.Guid* SettingGuid, winmdroot.UI.WindowsAndMessaging.REGISTER_NOTIFICATION_FLAGS Flags, winmdroot.Foundation.HANDLE Recipient, void** RegistrationHandle)
#cfunc global PowerSettingRegisterNotification "PowerSettingRegisterNotification" var, int, intptr, var

; winmdroot.Foundation.WIN32_ERROR PowerSettingUnregisterNotification(winmdroot.System.Power.HPOWERNOTIFY RegistrationHandle)
#cfunc global PowerSettingUnregisterNotification "PowerSettingUnregisterNotification" intptr

; winmdroot.Foundation.HRESULT PowerUnregisterFromEffectivePowerModeNotifications(void* RegistrationHandle)
#cfunc global PowerUnregisterFromEffectivePowerModeNotifications "PowerUnregisterFromEffectivePowerModeNotifications" intptr

; winmdroot.Foundation.WIN32_ERROR PowerUnregisterSuspendResumeNotification(winmdroot.System.Power.HPOWERNOTIFY RegistrationHandle)
#cfunc global PowerUnregisterSuspendResumeNotification "PowerUnregisterSuspendResumeNotification" intptr

; uint PowerWriteACDefaultIndex(winmdroot.System.Registry.HKEY RootSystemPowerKey, global::System.Guid* SchemePersonalityGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, global::System.Guid* PowerSettingGuid, uint DefaultAcIndex)
#cfunc global PowerWriteACDefaultIndex "PowerWriteACDefaultIndex" intptr, var, var, var, int

; winmdroot.Foundation.WIN32_ERROR PowerWriteACValueIndex(winmdroot.System.Registry.HKEY RootPowerKey, global::System.Guid* SchemeGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint AcValueIndex)
#cfunc global PowerWriteACValueIndex "PowerWriteACValueIndex" intptr, var, var, var, int

; uint PowerWriteDCDefaultIndex(winmdroot.System.Registry.HKEY RootSystemPowerKey, global::System.Guid* SchemePersonalityGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, global::System.Guid* PowerSettingGuid, uint DefaultDcIndex)
#cfunc global PowerWriteDCDefaultIndex "PowerWriteDCDefaultIndex" intptr, var, var, var, int

; uint PowerWriteDCValueIndex(winmdroot.System.Registry.HKEY RootPowerKey, global::System.Guid* SchemeGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint DcValueIndex)
#cfunc global PowerWriteDCValueIndex "PowerWriteDCValueIndex" intptr, var, var, var, int

; winmdroot.Foundation.WIN32_ERROR PowerWriteDescription(winmdroot.System.Registry.HKEY RootPowerKey, global::System.Guid* SchemeGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, byte* Buffer, uint BufferSize)
#cfunc global PowerWriteDescription "PowerWriteDescription" intptr, var, var, var, var, int

; winmdroot.Foundation.WIN32_ERROR PowerWriteFriendlyName(winmdroot.System.Registry.HKEY RootPowerKey, global::System.Guid* SchemeGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, byte* Buffer, uint BufferSize)
#cfunc global PowerWriteFriendlyName "PowerWriteFriendlyName" intptr, var, var, var, var, int

; winmdroot.Foundation.WIN32_ERROR PowerWriteIconResourceSpecifier(winmdroot.System.Registry.HKEY RootPowerKey, global::System.Guid* SchemeGuid, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, byte* Buffer, uint BufferSize)
#cfunc global PowerWriteIconResourceSpecifier "PowerWriteIconResourceSpecifier" intptr, var, var, var, var, int

; winmdroot.Foundation.WIN32_ERROR PowerWritePossibleDescription(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint PossibleSettingIndex, byte* Buffer, uint BufferSize)
#cfunc global PowerWritePossibleDescription "PowerWritePossibleDescription" intptr, var, var, int, var, int

; winmdroot.Foundation.WIN32_ERROR PowerWritePossibleFriendlyName(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint PossibleSettingIndex, byte* Buffer, uint BufferSize)
#cfunc global PowerWritePossibleFriendlyName "PowerWritePossibleFriendlyName" intptr, var, var, int, var, int

; winmdroot.Foundation.WIN32_ERROR PowerWritePossibleValue(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint Type, uint PossibleSettingIndex, byte* Buffer, uint BufferSize)
#cfunc global PowerWritePossibleValue "PowerWritePossibleValue" intptr, var, var, int, int, var, int

; winmdroot.Foundation.WIN32_ERROR PowerWriteSettingAttributes([Optional] global::System.Guid* SubGroupGuid, [Optional] global::System.Guid* PowerSettingGuid, uint Attributes)
#cfunc global PowerWriteSettingAttributes "PowerWriteSettingAttributes" var, var, int

; winmdroot.Foundation.WIN32_ERROR PowerWriteValueIncrement(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint ValueIncrement)
#cfunc global PowerWriteValueIncrement "PowerWriteValueIncrement" intptr, var, var, int

; winmdroot.Foundation.WIN32_ERROR PowerWriteValueMax(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint ValueMaximum)
#cfunc global PowerWriteValueMax "PowerWriteValueMax" intptr, var, var, int

; winmdroot.Foundation.WIN32_ERROR PowerWriteValueMin(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, uint ValueMinimum)
#cfunc global PowerWriteValueMin "PowerWriteValueMin" intptr, var, var, int

; winmdroot.Foundation.WIN32_ERROR PowerWriteValueUnitsSpecifier(winmdroot.System.Registry.HKEY RootPowerKey, [Optional] global::System.Guid* SubGroupOfPowerSettingsGuid, [Optional] global::System.Guid* PowerSettingGuid, byte* Buffer, uint BufferSize)
#cfunc global PowerWriteValueUnitsSpecifier "PowerWriteValueUnitsSpecifier" intptr, var, var, var, int

; winmdroot.Foundation.BOOLEAN ReadGlobalPwrPolicy(winmdroot.System.Power.GLOBAL_POWER_POLICY* pGlobalPowerPolicy)
#cfunc global ReadGlobalPwrPolicy "ReadGlobalPwrPolicy" var

; winmdroot.Foundation.BOOLEAN ReadProcessorPwrScheme(uint uiID, winmdroot.System.Power.MACHINE_PROCESSOR_POWER_POLICY* pMachineProcessorPowerPolicy)
#cfunc global ReadProcessorPwrScheme "ReadProcessorPwrScheme" int, var

; winmdroot.Foundation.BOOLEAN ReadPwrScheme(uint uiID, winmdroot.System.Power.POWER_POLICY* pPowerPolicy)
#cfunc global ReadPwrScheme "ReadPwrScheme" int, var

; winmdroot.Foundation.BOOLEAN SetActivePwrScheme(uint uiID, [Optional] winmdroot.System.Power.GLOBAL_POWER_POLICY* pGlobalPowerPolicy, [Optional] winmdroot.System.Power.POWER_POLICY* pPowerPolicy)
#cfunc global SetActivePwrScheme "SetActivePwrScheme" int, var, var

; winmdroot.Foundation.BOOLEAN SetSuspendState(winmdroot.Foundation.BOOLEAN bHibernate, winmdroot.Foundation.BOOLEAN bForce, winmdroot.Foundation.BOOLEAN bWakeupEventsDisabled)
#cfunc global SetSuspendState "SetSuspendState" int, int, int

; winmdroot.Foundation.BOOLEAN ValidatePowerPolicies([Optional] winmdroot.System.Power.GLOBAL_POWER_POLICY* pGlobalPowerPolicy, [Optional] winmdroot.System.Power.POWER_POLICY* pPowerPolicy)
#cfunc global ValidatePowerPolicies "ValidatePowerPolicies" var, var

; winmdroot.Foundation.BOOLEAN WriteGlobalPwrPolicy(winmdroot.System.Power.GLOBAL_POWER_POLICY* pGlobalPowerPolicy)
#cfunc global WriteGlobalPwrPolicy "WriteGlobalPwrPolicy" var

; winmdroot.Foundation.BOOLEAN WriteProcessorPwrScheme(uint uiID, winmdroot.System.Power.MACHINE_PROCESSOR_POWER_POLICY* pMachineProcessorPowerPolicy)
#cfunc global WriteProcessorPwrScheme "WriteProcessorPwrScheme" int, var

; winmdroot.Foundation.BOOLEAN WritePwrScheme(uint* puiID, winmdroot.Foundation.PCWSTR lpszSchemeName, winmdroot.Foundation.PCWSTR lpszDescription, winmdroot.System.Power.POWER_POLICY* lpScheme)
#cfunc global WritePwrScheme "WritePwrScheme" var, wstr, wstr, var

#endif
