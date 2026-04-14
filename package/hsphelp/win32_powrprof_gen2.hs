; ============================================================
;   powrprof.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
CallNtPowerInformation
Sets or retrieves power information.
%group
Win32 powrprof
%prm
InformationLevel, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength
InformationLevel : [int] The information level requested. This value indicates the specific power information to be set or retrieved. This parameter must be one of the following POWER_INFORMATION_LEVEL enumeration type values.
InputBuffer : [intptr] A pointer to an optional input buffer. The data type of this buffer depends on the information level requested in the InformationLevel parameter.
InputBufferLength : [int] The size of the input buffer, in bytes.
OutputBuffer : [intptr] A pointer to an optional output buffer. The data type of this buffer depends on the information level requested in the InformationLevel parameter. If the buffer is too small to contain the information, the function returns STATUS_BUFFER_TOO_SMALL.
OutputBufferLength : [int] The size of the output buffer, in bytes. Depending on the information level requested, this may be a variably sized buffer.
%inst
Sets or retrieves power information.

[戻り値]
If the function succeeds, the return value is STATUS_SUCCESS. If the
function fails, the return value can be one the following status
codes.
This doc was truncated.

[備考]
Changes made to the current system power policy using
CallNtPowerInformation are immediate, but they are not persistent;
that is, the changes are not stored as part of a power scheme. Any
changes to system power policy made with CallNtPowerInformation may
be overwritten by changes to a policy scheme made by the user in the
Power Options control panel program, or by subsequent calls to
WritePwrScheme, SetActivePwrScheme, or other power scheme functions.
For more information on using PowrProf.h, see Power Schemes.


%index
CanUserWritePwrScheme
Determines whether the current user has sufficient privilege to write a power scheme.
%group
Win32 powrprof
%prm

%inst
Determines whether the current user has sufficient privilege to write
a power scheme.

[戻り値]
If the current user has sufficient privilege to write a power scheme,
the function returns TRUE. If the function fails, the return value is
zero. To get extended error information, call GetLastError. Possible
error values include the following.
This doc was truncated.

[備考]
This function is useful if your application is impersonating a user.
For more information on using PowrProf.h, see Power Schemes.


%index
DeletePwrScheme
Deletes the specified power scheme.
%group
Win32 powrprof
%prm
uiID
uiID : [int] The index of the power scheme to be deleted.
%inst
Deletes the specified power scheme.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Applications can call DeletePwrScheme to permanently delete a power
scheme. An attempt to delete the currently active power scheme fails
with the last error set to ERROR_ACCESS_DENIED. For more information
on using PowrProf.h, see Power Schemes.


%index
DevicePowerClose
Frees all nodes in the device list and destroys the device list.
%group
Win32 powrprof
%prm

%inst
Frees all nodes in the device list and destroys the device list.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
DevicePowerEnumDevices
Enumerates devices on the system that meet the specified criteria.
%group
Win32 powrprof
%prm
QueryIndex, QueryInterpretationFlags, QueryFlags, pReturnBuffer, pBufferSize
QueryIndex : [int] The index of the requested device. For initial calls, this value should be zero.
QueryInterpretationFlags : [int] The criteria applied to the search results.
QueryFlags : [int] The query criteria.
pReturnBuffer : [var] Pointer to a buffer that receives the requested information.
pBufferSize : [var] The size, in bytes, of the return buffer.
%inst
Enumerates devices on the system that meet the specified criteria.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.

[備考]
The values of the QueryFlags parameter may be combined to query for
devices that support two or more criteria. For example; if
PDCAP_D3_SUPPORTED | PDCAP_D1_SUPPORTED is passed as the QueryFlags
parameter, the function will query for devices that support either D3
or D1. QueryFlags also may be combined with QueryInterpretationFlags
set to DEVICEPOWER_AND_OPERATION to produce a query of devices that
support all of the requested criteria. For example; if
PDCAP_D3_SUPPORTED | PDCAP_D1_SUPPORTED is passed as the QueryFlags
parameter and DEVICEPOWER_AND_OPERATION is passed as the
QueryInterpretationFlags parameter, the function will query devices
that support both D3 and D1.


%index
DevicePowerOpen
Initializes a device list by querying all the devices.
%group
Win32 powrprof
%prm
DebugMask
DebugMask : [int] Reserved; must be 0.
%inst
Initializes a device list by querying all the devices.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero.


%index
DevicePowerSetDeviceState
Modifies the specified data on the specified device.
%group
Win32 powrprof
%prm
DeviceDescription, SetFlags, SetData
DeviceDescription : [wstr] The name or hardware identifier string of the device to be modified.
SetFlags : [int] The properties of the device that are to be modified.
SetData : [intptr] Reserved, must be NULL.
%inst
Modifies the specified data on the specified device.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.


%index
EnumPwrSchemes
Enumerates all power schemes.
%group
Win32 powrprof
%prm
lpfn, lParam
lpfn : [int] A pointer to a callback function to be called for each power scheme enumerated. For more information, see Remarks.
lParam : [intptr] A user-defined value to be passed to the callback function.
%inst
Enumerates all power schemes.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
For each power scheme enumerated, the callback function is called
with the following parameters:
This doc was truncated.


%index
GetActivePwrScheme
Retrieves the index of the active power scheme.
%group
Win32 powrprof
%prm
puiID
puiID : [var] A pointer to a variable that receives the index of the active power scheme.
%inst
Retrieves the index of the active power scheme.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The active power scheme remains active until either the user sets a
new power scheme using the Power Options control panel program, or an
application calls the SetActivePwrScheme function. For more
information on using PowrProf.h, see Power Schemes.


%index
GetCurrentPowerPolicies
Retrieves the current system power policy settings.
%group
Win32 powrprof
%prm
pGlobalPowerPolicy, pPowerPolicy
pGlobalPowerPolicy : [var] A pointer to a GLOBAL_POWER_POLICY structure that receives the current global power policy settings.
pPowerPolicy : [var] A pointer to a POWER_POLICY structure that receives the power policy settings that are unique to the active power scheme.
%inst
Retrieves the current system power policy settings.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
To update the current power policy settings, call the
WriteGlobalPwrPolicy or WritePwrScheme functions. For more
information on using PowrProf.h, see Power Schemes.


%index
GetPwrCapabilities
Retrieves information about the system power capabilities.
%group
Win32 powrprof
%prm
lpspc
lpspc : [var] A pointer to a SYSTEM_POWER_CAPABILITIES structure that receives the information.
%inst
Retrieves information about the system power capabilities.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
This function retrieves detailed information about the current system
power management hardware resources and capabilities. This includes
information about the presence of hardware features such as power
buttons, lid switches, and batteries. Other details returned include
information about current power management capabilities and
configurations that can change dynamically, such as the minimum sleep
state currently supported, which may change as new drivers are
introduced into the system, or the presence of the system hibernation
file. This information is also available through the
CallNtPowerInformation function, using the SystemPowerCapabilities
level. For more information on using PowrProf.h, see Power Schemes.


%index
GetPwrDiskSpindownRange
Retrieves the disk spindown range.
%group
Win32 powrprof
%prm
puiMax, puiMin
puiMax : [var] The maximum disk spindown time, in seconds.
puiMin : [var] The minimum disk spindown time, in seconds.
%inst
Retrieves the disk spindown range.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Starting with Windows Vista, power management configuration of the
system's hard disk drives is controlled through the
GUID_DISK_SUBGROUP power settings subgroup. Use the PowerEnumerate
function to enumerate individual settings. For more information on
using PowrProf.h, see Power Schemes.


%index
IsAdminOverrideActive
(no summary)
%group
Win32 powrprof
%prm
papp
papp : [var] 
%inst



%index
IsPwrHibernateAllowed
Determines whether the computer supports hibernation.
%group
Win32 powrprof
%prm

%inst
Determines whether the computer supports hibernation.

[戻り値]
If the computer supports hibernation (power state S4) and the file
Hiberfil.sys is present on the system, the function returns TRUE.
Otherwise, the function returns FALSE.

[備考]
This information is also available through the CallNtPowerInformation
function. The value is returned in the SystemS4 member of the
SYSTEM_POWER_CAPABILITIES structure. For more information on using
PowrProf.h, see Power Schemes.


%index
IsPwrShutdownAllowed
Determines whether the computer supports the soft off power state.
%group
Win32 powrprof
%prm

%inst
Determines whether the computer supports the soft off power state.

[戻り値]
If the computer supports soft off (power state S5), the function
returns TRUE. Otherwise, the function returns FALSE.

[備考]
This information is also available through the CallNtPowerInformation
function. The value is returned in the SystemS5 member of the
SYSTEM_POWER_CAPABILITIES structure. Starting with Windows Vista,
computers must support the soft off power state. Therefore, this
function is relevant only to Windows Server 2003 and earlier
operating systems. For more information on using PowrProf.h, see
Power Schemes.


%index
IsPwrSuspendAllowed
Determines whether the computer supports the sleep states.
%group
Win32 powrprof
%prm

%inst
Determines whether the computer supports the sleep states.

[戻り値]
If the computer supports the sleep states (S1, S2, and S3), the
function returns TRUE. Otherwise, the function returns FALSE.

[備考]
This information is also available through the CallNtPowerInformation
function. Check the SystemS1, SystemS2, and SystemS3 members of the
SYSTEM_POWER_CAPABILITIES structure. For more information on using
PowrProf.h, see Power Schemes.


%index
PowerCanRestoreIndividualDefaultPowerScheme
Determines if the current user has access to the data for the specified power scheme so that it could be restored if necessary.
%group
Win32 powrprof
%prm
SchemeGuid
SchemeGuid : [var] The identifier of the power scheme.
%inst
Determines if the current user has access to the data for the
specified power scheme so that it could be restored if necessary.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerCreatePossibleSetting
Creates a possible setting value for a specified power setting.
%group
Win32 powrprof
%prm
RootSystemPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex
RootSystemPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting that is being created.
PossibleSettingIndex : [int] The zero-based index for the possible setting being created.
%inst
Creates a possible setting value for a specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerCreateSetting
Creates a setting value for a specified power setting.
%group
Win32 powrprof
%prm
RootSystemPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid
RootSystemPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting that is being created.
%inst
Creates a setting value for a specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerDeleteScheme
Deletes the specified power scheme from the database.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
%inst
Deletes the specified power scheme from the database.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerDeterminePlatformRole
Determines the computer role for Windows?7, Windows Server?2008?R2, Windows?Vista or Windows Server?2008.
%group
Win32 powrprof
%prm

%inst
Determines the computer role for Windows 7, Windows Server 2008 R2,
Windows Vista or Windows Server 2008.

[戻り値]
The return value is one of the values from the POWER_PLATFORM_ROLE
enumeration.

[備考]
This function reads the ACPI Fixed ACPI Description Table (FADT) to
determine the OEM preferred computer role. If that information is not
available, the function looks for a battery. If at least one battery
is available, the function returns PlatformRoleMobile. If no
batteries are available, the function returns PlatformRoleDesktop.
Note This API has a newer version. To query additional power platform
roles defined after Windows 7 and Windows Server 2008 R2, use
PowerDeterminePlatformRoleEx.


%index
PowerDeterminePlatformRoleEx
Determines the computer role for the specified platform.
%group
Win32 powrprof
%prm
Version
Version : [int] 
%inst
Determines the computer role for the specified platform.

[戻り値]
The return value is one of the values from the specified version of
the POWER_PLATFORM_ROLE enumeration.

[備考]
This function reads the ACPI Fixed ACPI Description Table (FADT) to
determine the OEM preferred computer role. If that information is not
available, the function looks for a battery. If at least one battery
is available, the function returns PlatformRoleMobile. If no
batteries are available, the function returns PlatformRoleDesktop.
If the OEM preferred computer role is not supported on the platform
specified by the caller, the function returns the closest supported
value. For example, calling the PowerDeterminePlatformRoleEx function
with a Version of POWER_PLATFORM_ROLE_V1 on a tablet device returns
PlatformRoleMobile.


%index
PowerDuplicateScheme
Duplicates an existing power scheme.
%group
Win32 powrprof
%prm
RootPowerKey, SourceSchemeGuid, DestinationSchemeGuid
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SourceSchemeGuid : [var] The identifier of the power scheme that is to be duplicated.
DestinationSchemeGuid : [var] The address of a pointer to a GUID. If the pointer contains NULL, the function allocates memory for a new GUID and puts the address of this memory in the pointer. The caller can free this memory using LocalFree.
%inst
Duplicates an existing power scheme.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.
This doc was truncated.


%index
PowerEnumerate
Enumerates the specified elements in a power scheme.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, AccessFlags, Index, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme. If this parameter is NULL, an enumeration of the power policies is returned.
SubGroupOfPowerSettingsGuid : [var] The subgroup of power settings.  If this parameter is NULL, an enumeration of settings under the PolicyGuid key is returned.
AccessFlags : [int] A set of flags that specifies what will be enumerated
Index : [int] The zero-based index of the scheme, subgroup, or setting that is being enumerated.
Buffer : [var] A pointer to a variable to receive the elements. If this parameter is NULL, the function retrieves the size of the buffer required.
BufferSize : [var] A pointer to a variable that on input contains the size of the buffer pointed to by the Buffer parameter. If the  Buffer parameter is NULL or if the BufferSize is not large enough, the function will return ERROR_MORE_DATA and the variable receives the required buffer size.
%inst
Enumerates the specified elements in a power scheme.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed. If the buffer size passed in the
BufferSize parameter is too small, or if the Buffer parameter is
NULL, ERROR_MORE_DATA will be returned and the DWORD pointed to by
the BufferSize parameter will be filled in with the required buffer
size.


%index
PowerGetActiveScheme
Retrieves the active power scheme and returns a GUID that identifies the scheme.
%group
Win32 powrprof
%prm
UserRootPowerKey, ActivePolicyGuid
UserRootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
ActivePolicyGuid : [var] A pointer that receives a pointer to a GUID structure. Use the LocalFree function to free this memory.
%inst
Retrieves the active power scheme and returns a GUID that identifies
the scheme.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerImportPowerScheme
Imports a power scheme from a file.
%group
Win32 powrprof
%prm
RootPowerKey, ImportFileNamePath, DestinationSchemeGuid
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
ImportFileNamePath : [wstr] The path to a power scheme backup file created by PowerCfg.Exe /Export.
DestinationSchemeGuid : [var] A pointer to a pointer to a GUID. If the pointer contains NULL, the function allocates memory for a new GUID and puts the address of this memory in the pointer. The caller can free this memory using LocalFree.
%inst
Imports a power scheme from a file.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerIsSettingRangeDefined
Queries whether the specified power setting represents a range of possible values.
%group
Win32 powrprof
%prm
SubKeyGuid, SettingGuid
SubKeyGuid : [var] The identifier of the subkey to search.
SettingGuid : [var] The identifier of the power setting to query.
%inst
Queries whether the specified power setting represents a range of
possible values.

[戻り値]
TRUE if the registry key specified by SubKeyGuid represents a single
power setting. If the registry key specified by SubKeyGuid represents
a range, this function returns FALSE.


%index
PowerOpenSystemPowerKey
(no summary)
%group
Win32 powrprof
%prm
phSystemPowerKey, Access, OpenExisting
phSystemPowerKey : [intptr] 
Access : [int] 
OpenExisting : [int] 
%inst



%index
PowerOpenUserPowerKey
(no summary)
%group
Win32 powrprof
%prm
phUserPowerKey, Access, OpenExisting
phUserPowerKey : [intptr] 
Access : [int] 
OpenExisting : [int] 
%inst



%index
PowerReadACDefaultIndex
Retrieves the default AC index of the specified power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SchemePersonalityGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, AcDefaultIndex
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemePersonalityGuid : [var] The identifier for the scheme personality for this power setting. A power setting can have different default values depending on the power scheme personality.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier for the single power setting.
AcDefaultIndex : [var] A pointer to a variable that receives the default AC index.
%inst
Retrieves the default AC index of the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerReadACValue
Retrieves the AC power value for the specified power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Type, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
Type : [var] A pointer to a variable that receives the type of data for the value. The possible values are listed in Registry Value Types. This parameter can be NULL and the type of data is not returned.
Buffer : [var] A pointer to a buffer that receives the data value. If this parameter is NULL, the BufferSize parameter receives the required buffer size.
BufferSize : [var] A pointer to a variable that contains the size of the buffer pointed to by the Buffer parameter. If the Buffer parameter is NULL, the function returns ERROR_SUCCESS and the variable receives the required buffer size. If the specified buffer size is not large enough to hold the requested data, the function returns  ERROR_MORE_DATA and the variable receives the required buffer size.
%inst
Retrieves the AC power value for the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed. If the buffer size specified by the
BufferSize parameter is too small, ERROR_MORE_DATA will be returned
and the DWORD pointed to by the BufferSize parameter will be filled
in with the required buffer size.


%index
PowerReadACValueIndex
Retrieves the AC index of the specified power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, AcValueIndex
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
AcValueIndex : [var] A pointer to a variable that receives the AC value index.
%inst
Retrieves the AC index of the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerReadDCDefaultIndex
Retrieves the default DC index of the specified power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SchemePersonalityGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DcDefaultIndex
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemePersonalityGuid : [var] The identifier of the scheme personality for this power setting. A power setting can have different default values depending on the power scheme personality.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
DcDefaultIndex : [var] A pointer to a variable that receives the default DC index.
%inst
Retrieves the default DC index of the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerReadDCValue
Retrieves the DC power value for the specified power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Type, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
Type : [var] A pointer to a variable that receives the type of data for the value. The possible values are listed in Registry Value Types. This parameter can be NULL and the type of data is not returned.
Buffer : [var] A pointer to a variable that receives the data value. If this parameter is NULL, the BufferSize parameter receives the required buffer size.
BufferSize : [var] A pointer to a variable that contains the size of the buffer pointed to by the Buffer parameter. If the Buffer parameter is NULL, the function returns ERROR_SUCCESS and the variable receives the required buffer size. If the specified buffer size is not large enough to hold the requested data, the function returns  ERROR_MORE_DATA and the variable receives the required buffer size.
%inst
Retrieves the DC power value for the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed. If the buffer size specified by the
BufferSize parameter is too small, ERROR_MORE_DATA will be returned
and the DWORD pointed to by the BufferSize parameter will be filled
in with the required buffer size.


%index
PowerReadDCValueIndex
Retrieves the DC value index of the specified power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DcValueIndex
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
SubGroupOfPowerSettingsGuid : [var] The identifier of the subgroup of power settings. Use NO_SUBGROUP_GUID to refer to the default power scheme.
PowerSettingGuid : [var] The identifier of the power setting.
DcValueIndex : [var] A pointer to a variable that receives the DC value index.
%inst
Retrieves the DC value index of the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerReadDescription
Retrieves the description for the specified power setting, subgroup, or scheme.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting that is being used.
Buffer : [var] A pointer to a buffer that receives the description. If this parameter is NULL, the BufferSize parameter receives the required buffer size. The strings returned are all wide (Unicode) strings.
BufferSize : [var] A pointer to a variable that contains the size of the buffer pointed to by the Buffer parameter. If the Buffer parameter is NULL, the function returns ERROR_SUCCESS and the variable receives the required buffer size. If the specified buffer size is not large enough to hold the requested data, the function returns  ERROR_MORE_DATA and the variable receives the required buffer size.
%inst
Retrieves the description for the specified power setting, subgroup,
or scheme.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed. If the buffer size specified by the
BufferSize parameter is too small, the function returns ERROR_SUCCESS
and the DWORD pointed to by the BufferSize parameter is filled in
with the required buffer size.


%index
PowerReadFriendlyName
Retrieves the friendly name for the specified power setting, subgroup, or scheme.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
SubGroupOfPowerSettingsGuid : [var] The subgroup of power settings. Use NO_SUBGROUP_GUID to refer to the default power scheme.
PowerSettingGuid : [var] The identifier of the power setting that is being used.
Buffer : [var] A pointer to a buffer that receives the friendly name. If this parameter is NULL, the BufferSize parameter receives the required buffer size. The strings returned are all wide (Unicode) strings.
BufferSize : [var] A pointer to a variable that contains the size of the buffer pointed to by the Buffer parameter. If the Buffer parameter is NULL, the function returns ERROR_SUCCESS and the variable receives the required buffer size. If the specified buffer size is not large enough to hold the requested data, the function returns  ERROR_MORE_DATA and the variable receives the required buffer size.
%inst
Retrieves the friendly name for the specified power setting,
subgroup, or scheme.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed. If the buffer size specified by the
BufferSize parameter is too small, ERROR_MORE_DATA will be returned
and the DWORD pointed to by the BufferSize parameter will be filled
in with the required buffer size.


%index
PowerReadIconResourceSpecifier
Retrieves the icon resource for the specified power setting, subgroup, or scheme.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
Buffer : [var] A pointer to a buffer that receives the icon resource. If this parameter is NULL, the BufferSize parameter receives the required buffer size.
BufferSize : [var] A pointer to a variable that contains the size of the buffer pointed to by the Buffer parameter. If the Buffer parameter is NULL, the function returns ERROR_SUCCESS and the variable receives the required buffer size. If the specified buffer size is not large enough to hold the requested data, the function returns  ERROR_MORE_DATA and the variable receives the required buffer size.
%inst
Retrieves the icon resource for the specified power setting,
subgroup, or scheme.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed. If the buffer size specified by the
BufferSize parameter is too small, ERROR_MORE_DATA will be returned
and the DWORD pointed to by the BufferSize parameter will be filled
in with the required buffer size.


%index
PowerReadPossibleDescription
Retrieves the description for one of the possible choices of a power setting value.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting that is being used.
PossibleSettingIndex : [int] The zero-based index for the possible setting.
Buffer : [var] A pointer to a buffer that receives the description. If this parameter is NULL, the BufferSize  parameter receives the required buffer size. The strings returned are all wide (Unicode) strings.
BufferSize : [var] A pointer to a variable that contains the size of the buffer pointed to by the Buffer parameter. If the Buffer parameter is NULL, the function returns ERROR_SUCCESS and the variable receives the required buffer size. If the specified buffer size is not large enough to hold the requested data, the function returns  ERROR_MORE_DATA and the variable receives the required buffer size.
%inst
Retrieves the description for one of the possible choices of a power
setting value.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed. If the buffer size specified by the
BufferSize parameter is too small, ERROR_MORE_DATA will be returned
and the DWORD pointed to by the BufferSize parameter will be filled
in with the required buffer size.


%index
PowerReadPossibleFriendlyName
Retrieves the friendly name for one of the possible choices of a power setting value.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
PossibleSettingIndex : [int] The zero-based index for the possible setting.
Buffer : [var] A pointer to a buffer that receives the friendly name. If this parameter is NULL, the BufferSize parameter receives the required buffer size. The strings returned are all wide (Unicode) strings.
BufferSize : [var] A pointer to a variable that contains the size of the buffer pointed to by the Buffer parameter. If the Buffer parameter is NULL, the function returns ERROR_SUCCESS and the variable receives the required buffer size. If the specified buffer size is not large enough to hold the requested data, the function returns ERROR_MORE_DATA and the variable receives the required buffer size.
%inst
Retrieves the friendly name for one of the possible choices of a
power setting value.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed. If the buffer size specified by the
BufferSize parameter is too small, ERROR_MORE_DATA will be returned
and the DWORD pointed to by the BufferSize parameter will be filled
in with the required buffer size.


%index
PowerReadPossibleValue
Retrieves the value for a possible value of a power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Type, PossibleSettingIndex, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
Type : [var] A pointer to a variable that receives the type of data for the value. The possible values are listed in Registry Value Types. This parameter can be NULL and the type of data is not returned.
PossibleSettingIndex : [int] The zero-based index of the possible setting.
Buffer : [var] A pointer to a buffer that receives the value. If this parameter is NULL, the BufferSize parameter receives the required buffer size.
BufferSize : [var] A pointer to a variable that contains the size of the buffer pointed to by the  Buffer parameter. If the Buffer parameter is NULL, the function returns ERROR_SUCCESS and the variable receives the required buffer size. If the specified buffer size is not large enough to hold the requested data, the function returns  ERROR_MORE_DATA and the variable receives the required buffer size.
%inst
Retrieves the value for a possible value of a power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed. If the buffer size specified by the
BufferSize parameter is too small, ERROR_MORE_DATA will be returned
and the DWORD pointed to by the BufferSize parameter will be filled
in with the required buffer size.


%index
PowerReadSettingAttributes
Returns the current attribute of the specified power setting.
%group
Win32 powrprof
%prm
SubGroupGuid, PowerSettingGuid
SubGroupGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting that is being used.
%inst
Returns the current attribute of the specified power setting.

[戻り値]
Returns the current power setting attributes of the specified power
setting. The attribute is a combination of the attributes of the
power setting and the attributes of its subgroup.
This doc was truncated.


%index
PowerReadValueIncrement
Retrieves the increment for valid values between the power settings minimum and maximum.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueIncrement
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting that is being used.
ValueIncrement : [var] A pointer to a variable that receives the increment for the specified power setting.
%inst
Retrieves the increment for valid values between the power settings
minimum and maximum.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerReadValueMax
Retrieves the maximum value for the specified power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueMaximum
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting that is being used.
ValueMaximum : [var] A pointer to a variable that receives the maximum for the specified power setting.
%inst
Retrieves the maximum value for the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerReadValueMin
Retrieves the minimum value for the specified power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueMinimum
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting that is being used.
ValueMinimum : [var] A pointer to a variable that receives the minimum value for the specified power setting.
%inst
Retrieves the minimum value for the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerReadValueUnitsSpecifier
Reads the string used to describe the units of a power setting that supports a range of values.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting that is being used.
Buffer : [var] A pointer to a buffer that receives the string. If this parameter is NULL, the BufferSize parameter receives the required buffer size. The strings returned are all wide (Unicode) strings.
BufferSize : [var] A pointer to a variable that contains the size of the buffer pointed to by the Buffer parameter. If the Buffer parameter is NULL, the function returns ERROR_SUCCESS and the variable receives the required buffer size. If the specified buffer size is not large enough to hold the requested data, the function returns  ERROR_MORE_DATA and the variable receives the required buffer size.
%inst
Reads the string used to describe the units of a power setting that
supports a range of values.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed. If the buffer size specified by the
BufferSize parameter is too small, ERROR_MORE_DATA will be returned
and the DWORD pointed to by the BufferSize parameter will be filled
in with the required buffer size.


%index
PowerRegisterForEffectivePowerModeNotifications
Registers a callback to receive effective power mode change notifications.
%group
Win32 powrprof
%prm
Version, Callback, Context, RegistrationHandle
Version : [int] Supplies the maximum effective power mode version the caller understands. If the effective power mode comes from a later version, it is reduced to a compatible version that is then passed to the callback. The following values can be passed in: - EFFECTIVE_POWER_MODE_V1 is available starting with Windows?10, version 1809 and tracks the performance power slider and battery saver states. - EFFECTIVE_POWER_MODE_V2 is available starting with Windows 10, version 1903 and tracks the performance power slider, battery saver, game mode and windows mixed reality power states.
Callback : [int] A pointer to the callback to call when the effective power mode changes. This will also be called once upon registration to supply the current mode. If multiple callbacks are registered using this API, those callbacks can be called concurrently.
Context : [intptr] Caller-specified opaque context.
RegistrationHandle : [var] A handle to the registration. Use this handle to unregister for notifications.
%inst
Registers a callback to receive effective power mode change
notifications.

[戻り値]
Returns S_OK (zero) if the call was successful, and a nonzero value
if the call failed.

[備考]
Immediately after registration, the callback will be invoked with the
current value of the power setting. If the registration occurs while
the power mode is changing, you may receive multiple callbacks; the
last callback is the most recent update.


%index
PowerRegisterSuspendResumeNotification
Registers to receive notification when the system is suspended or resumed.
%group
Win32 powrprof
%prm
Flags, Recipient, RegistrationHandle
Flags : [int] This parameter must be DEVICE_NOTIFY_CALLBACK.
Recipient : [intptr] This parameter is a pointer to a DEVICE_NOTIFY_SUBSCRIBE_PARAMETERS structure. In this case, the callback function is DeviceNotifyCallbackRoutine. When the Callback function executes, the  Type parameter is set indicating the type of event that occurred. Possible values include PBT_APMSUSPEND, PBT_APMRESUMESUSPEND, and PBT_APMRESUMEAUTOMATIC - see  Power Management Events for more info. The Setting parameter is not used with suspend/resume notifications.
RegistrationHandle : [var] A handle to the registration. Use this handle to unregister for notifications.
%inst
Registers to receive notification when the system is suspended or
resumed.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerRemovePowerSetting
Deletes the specified power setting.
%group
Win32 powrprof
%prm
PowerSettingSubKeyGuid, PowerSettingGuid
PowerSettingSubKeyGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting to be deleted.
%inst
Deletes the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerReplaceDefaultPowerSchemes
Replaces the default power schemes with the current user's power schemes.
%group
Win32 powrprof
%prm

%inst
Replaces the default power schemes with the current user's power
schemes.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
The caller must be a member of the local Administrators group.


%index
PowerReportThermalEvent
Notifies the operating system of thermal events.
%group
Win32 powrprof
%prm
Event
Event : [var] The thermal event structure, THERMAL_EVENT.
%inst
Notifies the operating system of thermal events.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Thermal managers call the PowerReportThermalEvent routine to notify
the operating system of a thermal event so that the event can be
recorded in the system event log. Before calling
PowerReportThermalEvent, the thermal manager sets the members of the
THERMAL_EVENT structure to describe the thermal event.


%index
PowerRestoreDefaultPowerSchemes
Replaces the power schemes for the system with default power schemes. All current power schemes and settings are deleted and replaced with the default system power schemes.
%group
Win32 powrprof
%prm

%inst
Replaces the power schemes for the system with default power schemes.
All current power schemes and settings are deleted and replaced with
the default system power schemes.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
The caller must be a member of the local Administrators group.


%index
PowerRestoreIndividualDefaultPowerScheme
Replaces a specific power scheme for the current user with one from the default user (stored in HKEY_USERS\.Default).
%group
Win32 powrprof
%prm
SchemeGuid
SchemeGuid : [var] The identifier of the power scheme.
%inst
Replaces a specific power scheme for the current user with one from
the default user (stored in HKEY_USERS\.Default).

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerSetActiveScheme
Sets the active power scheme for the current user.
%group
Win32 powrprof
%prm
UserRootPowerKey, SchemeGuid
UserRootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
%inst
Sets the active power scheme for the current user.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerSettingAccessCheck
Queries for a group policy override for specified power settings.
%group
Win32 powrprof
%prm
AccessFlags, PowerGuid
AccessFlags : [int] The type of access to check for group policy overrides.
PowerGuid : [var] The identifier of the power setting.
%inst
Queries for a group policy override for specified power settings.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.
This doc was truncated.


%index
PowerSettingAccessCheckEx
Queries for a group policy override for specified power settings and specifies the requested access for the setting.
%group
Win32 powrprof
%prm
AccessFlags, PowerGuid, AccessType
AccessFlags : [int] The type of access to check for group policy overrides.
PowerGuid : [var] The identifier of the power setting.
AccessType : [int] The type of security access for the setting. For more information, see Registry Key Security and Access Rights.
%inst
Queries for a group policy override for specified power settings and
specifies the requested access for the setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.
This doc was truncated.


%index
PowerSettingRegisterNotification
Registers to receive notification when a power setting changes.
%group
Win32 powrprof
%prm
SettingGuid, Flags, Recipient, RegistrationHandle
SettingGuid : [var] A GUID that represents the power setting.
Flags : [int] 
Recipient : [intptr] A handle to the recipient of the notifications.
RegistrationHandle : [var] A handle to the registration. Use this handle to unregister for notifications.
%inst
Registers to receive notification when a power setting changes.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Immediately after registration, the callback will be invoked with the
current value of the power setting. If the registration occurs while
the power setting is changing, you may receive multiple callbacks;
the last callback is the most recent update.


%index
PowerSettingUnregisterNotification
Cancels a registration to receive notification when a power setting changes.
%group
Win32 powrprof
%prm
RegistrationHandle
RegistrationHandle : [intptr] A handle to a registration obtained by calling the PowerSettingRegisterNotification function.
%inst
Cancels a registration to receive notification when a power setting
changes.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerUnregisterFromEffectivePowerModeNotifications
Unregisters from effective power mode change notifications. This function is intended to be called from cleanup code and will wait for all callbacks to complete before unregistering.
%group
Win32 powrprof
%prm
RegistrationHandle
RegistrationHandle : [intptr] The handle corresponding to a single power mode registration. This handle should have been saved by the caller after the call to PowerRegisterForEffectivePowerModeNotifications and passed in here.
%inst
Unregisters from effective power mode change notifications. This
function is intended to be called from cleanup code and will wait for
all callbacks to complete before unregistering.

[戻り値]
Returns S_OK (zero) if the call was successful, and a nonzero value
if the call failed.

[備考]
Immediately after registration, the callback will be invoked with the
current value of the power setting. If the registration occurs while
the power setting is changing, you may receive multiple callbacks;
the last callback is the most recent update.


%index
PowerUnregisterSuspendResumeNotification
Cancels a registration to receive notification when the system is suspended or resumed.
%group
Win32 powrprof
%prm
RegistrationHandle
RegistrationHandle : [intptr] A handle to a registration obtained by calling the PowerRegisterSuspendResumeNotification function.
%inst
Cancels a registration to receive notification when the system is
suspended or resumed.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.


%index
PowerWriteACDefaultIndex
Sets the default AC index of the specified power setting.
%group
Win32 powrprof
%prm
RootSystemPowerKey, SchemePersonalityGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DefaultAcIndex
RootSystemPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemePersonalityGuid : [var] The identifier of the scheme personality for this power setting. A power setting can have different default values depending on the power scheme personality.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
DefaultAcIndex : [int] The default AC index.
%inst
Sets the default AC index of the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Changes to the settings for the active power scheme do not take
effect until you call the PowerSetActiveScheme function.


%index
PowerWriteACValueIndex
Sets the AC value index of the specified power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, AcValueIndex
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
AcValueIndex : [int] The AC value index.
%inst
Sets the AC value index of the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Changes to the settings for the active power scheme do not take
effect until you call the PowerSetActiveScheme function.


%index
PowerWriteDCDefaultIndex
Sets the default DC index of the specified power setting.
%group
Win32 powrprof
%prm
RootSystemPowerKey, SchemePersonalityGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DefaultDcIndex
RootSystemPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemePersonalityGuid : [var] The identifier of the scheme personality for this power setting. A power setting can have different default values depending on the power scheme personality.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
DefaultDcIndex : [int] The default DC index.
%inst
Sets the default DC index of the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Changes to the settings for the active power scheme do not take
effect until you call the PowerSetActiveScheme function.


%index
PowerWriteDCValueIndex
Sets the DC index of the specified power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, DcValueIndex
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
DcValueIndex : [int] The DC value index.
%inst
Sets the DC index of the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Changes to the settings for the active power scheme do not take
effect until you call the PowerSetActiveScheme function.


%index
PowerWriteDescription
Sets the description for the specified power setting, subgroup, or scheme.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
Buffer : [var] The description, in wide (Unicode) characters.
BufferSize : [int] The size of the buffer pointed to by the Buffer parameter.
%inst
Sets the description for the specified power setting, subgroup, or
scheme.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
If the SchemeGuid parameter is not NULL but both the
SubGroupOfPowerSettingsGuid and PowerSettingGuid parameters are NULL,
the description of the power scheme will be set. If the SchemeGuid
and SubGroupOfPowerSettingsGuid parameters are not NULL and the
PowerSettingGuid parameter is NULL, the description of the subgroup
will be set. If the SchemeGuid, SubGroupOfPowerSettingsGuid, and
PowerSettingGuid parameters are not NULL, the description of the
power setting will be set. Changes to the settings for the active
power scheme do not take effect until you call the
PowerSetActiveScheme function.


%index
PowerWriteFriendlyName
Sets the friendly name for the specified power setting, subgroup, or scheme.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
Buffer : [var] The friendly name, in wide (Unicode) characters.
BufferSize : [int] The size of the friendly name specified by the Buffer parameter, including the terminating NULL character.
%inst
Sets the friendly name for the specified power setting, subgroup, or
scheme.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Changes to the settings for the active power scheme do not take
effect until you call the PowerSetActiveScheme function.


%index
PowerWriteIconResourceSpecifier
Sets the icon resource for the specified power setting, subgroup, or scheme.
%group
Win32 powrprof
%prm
RootPowerKey, SchemeGuid, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SchemeGuid : [var] The identifier of the power scheme.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
Buffer : [var] The icon resource.
BufferSize : [int] The size of the buffer pointed to by the Buffer parameter.
%inst
Sets the icon resource for the specified power setting, subgroup, or
scheme.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
If the SchemeGuid parameter is not NULL but both the
SubGroupOfPowerSettingsGuid and PowerSettingGuid parameters are NULL,
the friendly name of the power scheme will be set. If the SchemeGuid
and SubGroupOfPowerSettingsGuid parameters are not NULL and the
PowerSettingGuid parameter is NULL, the friendly name of the subgroup
will be set. If the SchemeGuid, SubGroupOfPowerSettingsGuid, and
PowerSettingGuid parameters are not NULL, the friendly name of the
power setting will be set. Changes to the settings for the active
power scheme do not take effect until you call the
PowerSetActiveScheme function.


%index
PowerWritePossibleDescription
Sets the description for one of the possible choices of a power setting value.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting that is being used.
PossibleSettingIndex : [int] The zero-based index for the possible setting.
Buffer : [var] The description, in wide (Unicode) characters.
BufferSize : [int] The size of the buffer pointed to by the Buffer parameter.
%inst
Sets the description for one of the possible choices of a power
setting value.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Changes to the settings for the active power scheme do not take
effect until you call the PowerSetActiveScheme function.


%index
PowerWritePossibleFriendlyName
Sets the friendly name for the specified possible setting of a power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, PossibleSettingIndex, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
PossibleSettingIndex : [int] The zero-based index for the possible setting.
Buffer : [var] The friendly name, in wide (Unicode) characters.
BufferSize : [int] The size of the buffer pointed to by the Buffer parameter.
%inst
Sets the friendly name for the specified possible setting of a power
setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Changes to the settings for the active power scheme do not take
effect until you call the PowerSetActiveScheme function.


%index
PowerWritePossibleValue
Sets the value for a possible value of a power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Type, PossibleSettingIndex, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
Type : [int] The type of data for the value. The possible values are listed in Registry Value Types.
PossibleSettingIndex : [int] The zero-based index for the possible setting.
Buffer : [var] The value for the possible setting.
BufferSize : [int] The size of the buffer pointed to by the Buffer parameter.
%inst
Sets the value for a possible value of a power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Changes to the settings for the active power scheme do not take
effect until you call the PowerSetActiveScheme function.


%index
PowerWriteSettingAttributes
Sets the power attributes of a power key.
%group
Win32 powrprof
%prm
SubGroupGuid, PowerSettingGuid, Attributes
SubGroupGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
Attributes : [int] The attributes to be associated with the specified power setting.
%inst
Sets the power attributes of a power key.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Changes to the settings for the active power scheme do not take
effect until you call the PowerSetActiveScheme function.


%index
PowerWriteValueIncrement
Sets the increment for valid values between the power settings minimum and maximum.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueIncrement
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
ValueIncrement : [int] The increment to be set.
%inst
Sets the increment for valid values between the power settings
minimum and maximum.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Changes to the settings for the active power scheme do not take
effect until you call the PowerSetActiveScheme function.


%index
PowerWriteValueMax
Sets the maximum value for the specified power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueMaximum
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
ValueMaximum : [int] The maximum value to be set.
%inst
Sets the maximum value for the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Changes to the settings for the active power scheme do not take
effect until you call the PowerSetActiveScheme function.


%index
PowerWriteValueMin
Sets the minimum value for the specified power setting.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, ValueMinimum
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
ValueMinimum : [int] The minimum value to be set.
%inst
Sets the minimum value for the specified power setting.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Changes to the settings for the active power scheme do not take
effect until you call the PowerSetActiveScheme function.


%index
PowerWriteValueUnitsSpecifier
Writes the string used to describe the units of a power setting that supports a range of values.
%group
Win32 powrprof
%prm
RootPowerKey, SubGroupOfPowerSettingsGuid, PowerSettingGuid, Buffer, BufferSize
RootPowerKey : [intptr] This parameter is reserved for future use and must be set to NULL.
SubGroupOfPowerSettingsGuid : [var] 
PowerSettingGuid : [var] The identifier of the power setting.
Buffer : [var] The units specifier, in wide (Unicode) characters.
BufferSize : [int] The size of the buffer pointed to by the Buffer parameter.
%inst
Writes the string used to describe the units of a power setting that
supports a range of values.

[戻り値]
Returns ERROR_SUCCESS (zero) if the call was successful, and a
nonzero value if the call failed.

[備考]
Changes to the settings for the active power scheme do not take
effect until you call the PowerSetActiveScheme function.


%index
ReadGlobalPwrPolicy
Retrieves the current global power policy settings.
%group
Win32 powrprof
%prm
pGlobalPowerPolicy
pGlobalPowerPolicy : [var] A pointer to a GLOBAL_POWER_POLICY structure that receives the information.
%inst
Retrieves the current global power policy settings.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The GLOBAL_POWER_POLICY structure contains policy settings that are
common to all power schemes. This structure contains both user and
computer policy settings. Starting with Windows Vista, use the
PowerEnumerate function to enumerate power settings for a specified
scheme and the power read functions to retrieve individual settings.
For more information on using PowrProf.h, see Power Schemes.


%index
ReadProcessorPwrScheme
Retrieves the processor power policy settings for the specified power scheme.
%group
Win32 powrprof
%prm
uiID, pMachineProcessorPowerPolicy
uiID : [int] The index of the power scheme to be read.
pMachineProcessorPowerPolicy : [var] A pointer to a MACHINE_PROCESSOR_POWER_POLICY structure that receives the processor power policy settings.
%inst
Retrieves the processor power policy settings for the specified power
scheme.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The MACHINE_PROCESSOR_POWER_POLICY structure contains processor power
policy settings for use while the system is running on AC power or
battery power. Starting with Windows Vista, power management
configuration of the system's processor is controlled through the
GUID_PROCESSOR_SETTINGS_SUBGROUP power settings subgroup. Use the
PowerEnumerate function to enumerate individual settings. For more
information on using PowrProf.h, see Power Schemes.


%index
ReadPwrScheme
Retrieves the power policy settings that are unique to the specified power scheme.
%group
Win32 powrprof
%prm
uiID, pPowerPolicy
uiID : [int] The index of the power scheme to be read.
pPowerPolicy : [var] A pointer to a POWER_POLICY structure that receives the power policy settings.
%inst
Retrieves the power policy settings that are unique to the specified
power scheme.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
If the power scheme specified does not exist, the function returns
FALSE. To retrieve information about the power policy settings
currently in use by the system, call the GetActivePwrScheme function.
To retrieve additional information about the current power policy
settings, call the CallNtPowerInformation function. Starting with
Windows Vista, use the PowerEnumerate function to enumerate power
settings for a specified scheme and the power read functions to
retrieve individual settings. For more information on using
PowrProf.h, see Power Schemes.


%index
SetActivePwrScheme
Sets the active power scheme.
%group
Win32 powrprof
%prm
uiID, pGlobalPowerPolicy, pPowerPolicy
uiID : [int] The index of the power scheme to be activated.
pGlobalPowerPolicy : [var] A pointer to an optional GLOBAL_POWER_POLICY structure, which provides global power policy settings to be merged with the power scheme when it becomes active.
pPowerPolicy : [var] A pointer to an optional POWER_POLICY structure, which provides power policy settings to be merged with the power scheme when it becomes active.
%inst
Sets the active power scheme.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
Use this function to make long-term changes to the system
configuration. To temporarily keep the system running while an
application is performing a task, use the SetThreadExecutionState
function. If the power scheme specified by uiID does not exist, the
function returns zero. If lpGlobalPowerPolicy is NULL, the function
uses the current global power policy settings set by
WriteGlobalPwrPolicy. Otherwise, the settings in the specified
structure replace the current global power policy settings. If
lpPowerPolicy is NULL, the function uses the current power policy
settings for the power scheme. Otherwise, the settings in the
specified structure replace the current power policy settings. For
more information on using PowrProf.h, see Power Schemes.


%index
SetSuspendState
Suspends the system by shutting power down. Depending on the Hibernate parameter, the system either enters a suspend (sleep) state or hibernation (S4).
%group
Win32 powrprof
%prm
bHibernate, bForce, bWakeupEventsDisabled
bHibernate : [int] If this parameter is TRUE, the system hibernates. If the parameter is FALSE, the system is suspended.
bForce : [int] This parameter has no effect.
bWakeupEventsDisabled : [int] If this parameter is TRUE, the system disables all wake events. If the parameter is FALSE, any system wake events remain enabled.
%inst
Suspends the system by shutting power down. Depending on the
Hibernate parameter, the system either enters a suspend (sleep) state
or hibernation (S4).

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The calling process must have the SE_SHUTDOWN_NAME privilege. To
enable the SE_SHUTDOWN_NAME privilege, use the AdjustTokenPrivileges
function. For more information, see Changing Privileges in a Token.
An application may use SetSuspendState to transition the system from
the working state to the standby (sleep), or optionally, hibernate
(S4) state. This function is similar to the SetSystemPowerState
function. For more information on using PowrProf.h, see Power
Schemes. For information about events that can wake the system, see
System Wake-up Events.


%index
ValidatePowerPolicies
(no summary)
%group
Win32 powrprof
%prm
pGlobalPowerPolicy, pPowerPolicy
pGlobalPowerPolicy : [var] 
pPowerPolicy : [var] 
%inst



%index
WriteGlobalPwrPolicy
Writes global power policy settings.
%group
Win32 powrprof
%prm
pGlobalPowerPolicy
pGlobalPowerPolicy : [var] A pointer to a GLOBAL_POWER_POLICY structure that contains the power policy settings to be written.
%inst
Writes global power policy settings.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
The function replaces any existing global power policy settings. Each
user has a separate global power scheme, which contains power policy
settings that apply to all power schemes for that user. Starting with
Windows Vista, use the PowerEnumerate function to enumerate power
settings for a specified scheme and the power write functions to
write individual settings. For more information on using PowrProf.h,
see Power Schemes.


%index
WriteProcessorPwrScheme
Writes processor power policy settings for the specified power scheme.
%group
Win32 powrprof
%prm
uiID, pMachineProcessorPowerPolicy
uiID : [int] The index of the power scheme to be written.
pMachineProcessorPowerPolicy : [var] A pointer to a MACHINE_PROCESSOR_POWER_POLICY structure that contains the power policy settings to be written.
%inst
Writes processor power policy settings for the specified power
scheme.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
This change does not affect the current system power policy. To apply
this change to the current system power policy, call the
SetActivePwrScheme function, using the index of this power scheme.
Starting with Windows Vista, power management configuration of the
system's processor is controlled through the
GUID_PROCESSOR_SETTINGS_SUBGROUP power settings subgroup. Use the
PowerEnumerate function to enumerate individual settings. For more
information on using PowrProf.h, see Power Schemes.


%index
WritePwrScheme
Writes policy settings that are unique to the specified power scheme.
%group
Win32 powrprof
%prm
puiID, lpszSchemeName, lpszDescription, lpScheme
puiID : [var] The index of the power scheme to be written. If a power scheme with the same index already exists, it is replaced. Otherwise, a new power scheme is created.
lpszSchemeName : [wstr] The name of the power scheme.
lpszDescription : [wstr] The description of the power scheme.
lpScheme : [var] A pointer to a POWER_POLICY structure that contains the power policy settings to be written.
%inst
Writes policy settings that are unique to the specified power scheme.

[戻り値]
If the function succeeds, the return value is nonzero. If the
function fails, the return value is zero. To get extended error
information, call GetLastError.

[備考]
This change does not affect the current system power policy. To apply
this change to the current system power policy, call the
SetActivePwrScheme function with the index of this power scheme.
Power policy schemes written using WritePwrScheme are permanently
stored in the system registry hives, and remain available for use in
the Power Options control panel program, or by subsequent calls to
the power scheme API. To permanently remove a power scheme from the
system, call the DeletePwrScheme function. For more information about
using PowrProf.h, see Power Schemes.

