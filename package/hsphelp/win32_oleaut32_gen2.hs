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
Frees resources on the server side when called by RPC stub files. (BSTR_UserFree)
%group
Win32 oleaut32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
Frees resources on the server side when called by RPC stub files.
(BSTR_UserFree)


%index
BSTR_UserFree64
Frees resources on the server side when called by RPC stub files. (BSTR_UserFree64)
%group
Win32 oleaut32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
Frees resources on the server side when called by RPC stub files.
(BSTR_UserFree64)


%index
BSTR_UserMarshal
Marshals a BSTR object into the RPC buffer. (BSTR_UserMarshal)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
Marshals a BSTR object into the RPC buffer. (BSTR_UserMarshal)

[戻り値]
The value obtained from the returned HRESULT value is S_OK.


%index
BSTR_UserMarshal64
Marshals a BSTR object into the RPC buffer. (BSTR_UserMarshal64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
Marshals a BSTR object into the RPC buffer. (BSTR_UserMarshal64)

[戻り値]
The value obtained from the returned HRESULT value is S_OK.


%index
BSTR_UserSize
Calculates the wire size of the BSTR object, and gets its handle and data. (BSTR_UserSize)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
Calculates the wire size of the BSTR object, and gets its handle and
data. (BSTR_UserSize)

[戻り値]
The value obtained from the returned HRESULT value is S_OK.


%index
BSTR_UserSize64
Calculates the wire size of the BSTR object, and gets its handle and data. (BSTR_UserSize64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
Calculates the wire size of the BSTR object, and gets its handle and
data. (BSTR_UserSize64)

[戻り値]
The value obtained from the returned HRESULT value is S_OK.


%index
BSTR_UserUnmarshal
Unmarshals a BSTR object from the RPC buffer. (BSTR_UserUnmarshal)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
Unmarshals a BSTR object from the RPC buffer. (BSTR_UserUnmarshal)

[戻り値]
The value obtained from the returned HRESULT value is one of the
following.
This doc was truncated.


%index
BSTR_UserUnmarshal64
Unmarshals a BSTR object from the RPC buffer. (BSTR_UserUnmarshal64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
Unmarshals a BSTR object from the RPC buffer. (BSTR_UserUnmarshal64)

[戻り値]
The value obtained from the returned HRESULT value is one of the
following.
This doc was truncated.


%index
BstrFromVector
Returns a BSTR, assigning each element of the vector to a character in the BSTR.
%group
Win32 oleaut32
%prm
psa, pbstr
psa : [var] The vector to be converted to a BSTR.
pbstr : [var] A BSTR, each character of which is assigned to an element from the vector.
%inst
Returns a BSTR, assigning each element of the vector to a character
in the BSTR.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
ClearCustData
Releases memory used to hold the custom data item.
%group
Win32 oleaut32
%prm
pCustData
pCustData : [var] The custom data item to be released.
%inst
Releases memory used to hold the custom data item.


%index
CreateDispTypeInfo
Creates simplified type information for use in an implementation of IDispatch.
%group
Win32 oleaut32
%prm
pidata, lcid, pptinfo
pidata : [var] The interface description that this type information describes.
lcid : [int] The locale identifier for the names used in the type information.
pptinfo : [var] On return, pointer to a type information implementation for use in DispGetIDsOfNames and DispInvoke.
%inst
Creates simplified type information for use in an implementation of
IDispatch.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
You can construct type information at run time by using
CreateDispTypeInfo and an INTERFACEDATA structure that describes the
object being exposed. The type information returned by this function
is primarily designed to automate the implementation of IDispatch.
CreateDispTypeInfo does not return all of the type information
described in Type Description Interfaces. The argument pidata is not
a complete description of an interface. It does not include Help
information, comments, optional parameters, and other type
information that is useful in different contexts. Accordingly, the
recommended method for providing type information about an object is
to describe the object using the Object Description Language (ODL),
and to compile the object description into a type library using the
Microsoft Interface Definition Language (MIDL) compiler. To use type
information from a type library, use the LoadTypeLib and
GetTypeInfoOfGuid functions instead of CreateDispTypeInfo. For more
information Type Description Interfaces.


%index
CreateErrorInfo
Creates an instance of a generic error object.
%group
Win32 oleaut32
%prm
pperrinfo
pperrinfo : [var] A system-implemented generic error object.
%inst
Creates an instance of a generic error object.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function returns a pointer to a generic error object, which you
can use with QueryInterface on ICreateErrorInfo to set its contents.
You can then pass the resulting object to SetErrorInfo. The generic
error object implements both ICreateErrorInfo and IErrorInfo.


%index
CreateStdDispatch
Creates a standard implementation of the IDispatch interface through a single function call. This simplifies exposing objects through Automation.
%group
Win32 oleaut32
%prm
punkOuter, pvThis, ptinfo, ppunkStdDisp
punkOuter : [var] The object's IUnknown implementation.
pvThis : [intptr] The object to expose.
ptinfo : [var] The type information that describes the exposed object.
ppunkStdDisp : [var] The private unknown for the object that implements the IDispatch interface QueryInterface call. This pointer is null if the function fails.
%inst
Creates a standard implementation of the IDispatch interface through
a single function call. This simplifies exposing objects through
Automation.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
You can use CreateStdDispatch when creating an object instead of
implementing the IDispatch member functions for the object. However,
the implementation that CreateStdDispatch creates has these
limitations:
This doc was truncated.


%index
CreateTypeLib
Provides access to a new object instance that supports the ICreateTypeLib interface.
%group
Win32 oleaut32
%prm
syskind, szFile, ppctlib
syskind : [int] The target operating system for which to create a type library.
szFile : [wstr] The name of the file to create.
ppctlib : [var] The ICreateTypeLib interface.
%inst
Provides access to a new object instance that supports the
ICreateTypeLib interface.

[戻り値]
This doc was truncated.

[備考]
CreateTypeLib sets its output parameter (ppctlib) to point to a newly
created object that supports the ICreateTypeLib interface.


%index
CreateTypeLib2
Creates a type library in the current file format.
%group
Win32 oleaut32
%prm
syskind, szFile, ppctlib
syskind : [int] The target operating system for which to create a type library.
szFile : [wstr] The name of the file to create.
ppctlib : [var] The ICreateTypeLib2 interface.
%inst
Creates a type library in the current file format.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
DispCallFunc
Low-level helper for Invoke that provides machine independence for customized Invoke. (DispCallFunc)
%group
Win32 oleaut32
%prm
pvInstance, oVft, cc, vtReturn, cActuals, prgvt, prgpvarg, pvargResult
pvInstance : [intptr] An instance of the interface described by this type description.
oVft : [int] For FUNC_VIRTUAL functions, specifies the offset in the VTBL.
cc : [int] The calling convention. One of the CALLCONV values, such as CC_STDCALL.
vtReturn : [int] The variant type of the function return value. Use VT_EMPTY to represent void.
cActuals : [int] The number of function parameters.
prgvt : [var] An array of variant types of the function parameters.
prgpvarg : [var] The function parameters.
pvargResult : [var] The function result.
%inst
Low-level helper for Invoke that provides machine independence for
customized Invoke. (DispCallFunc)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
DispGetIDsOfNames
Low-level helper for Invoke that provides machine independence for customized Invoke. (DispGetIDsOfNames)
%group
Win32 oleaut32
%prm
ptinfo, rgszNames, cNames, rgdispid
ptinfo : [var] The type information for an interface. This type information is specific to one interface and language code, so it is not necessary to pass an interface identifier (IID) or LCID to this function.
rgszNames : [var] An array of name strings that can be the same array passed to DispInvoke in the DISPPARAMS structure. If cNames is greater than 1, the first name is interpreted as a method name, and subsequent names are interpreted as parameters to that method.
cNames : [int] The number of elements in rgszNames.
rgdispid : [var] An array of DISPIDs to be filled in by this function. The first ID corresponds to the method name. Subsequent IDs are interpreted as parameters to the method.
%inst
Low-level helper for Invoke that provides machine independence for
customized Invoke. (DispGetIDsOfNames)

[戻り値]
This doc was truncated.


%index
DispGetParam
Retrieves a parameter from the DISPPARAMS structure, checking both named parameters and positional parameters, and coerces the parameter to the specified type.
%group
Win32 oleaut32
%prm
pdispparams, position, vtTarg, pvarResult, puArgErr
pdispparams : [var] The parameters passed to Invoke.
position : [int] The position of the parameter in the parameter list. DispGetParam starts at the end of the array, so if position is 0, the last parameter in the array is returned.
vtTarg : [int] The type the argument should be coerced to.
pvarResult : [var] the variant to pass the parameter into.
puArgErr : [var] On return, the index of the argument that caused a DISP_E_TYPEMISMATCH error. This pointer is returned to Invoke to indicate the position of the argument in DISPPARAMS that caused the error.
%inst
Retrieves a parameter from the DISPPARAMS structure, checking both
named parameters and positional parameters, and coerces the parameter
to the specified type.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
The output parameter pvarResult must be a valid variant. Any existing
contents are released in the standard way. The contents of the
variant are freed with VariantFree. If you have used DispGetParam to
get the right side of a property put operation, the second parameter
should be DISPID_PROPERTYPUT. For example:
This doc was truncated.


%index
DispInvoke
Automatically calls member functions on an interface, given the type information for the interface.
%group
Win32 oleaut32
%prm
_this, ptinfo, dispidMember, wFlags, pparams, pvarResult, pexcepinfo, puArgErr
_this : [intptr] An implementation of the IDispatch interface described by ptinfo.
ptinfo : [var] The type information that describes the interface.
dispidMember : [int] The member to be invoked. Use GetIDsOfNames or the object's documentation to obtain the DISPID.
wFlags : [int] Flags describing the context of the Invoke call.
pparams : [var] Pointer to a structure containing an array of arguments, an array of argument DISPIDs for named arguments, and counts for number of elements in the arrays.
pvarResult : [var] Pointer to where the result is to be stored, or Null if the caller expects no result. This argument is ignored if DISPATCH_PROPERTYPUT or DISPATCH_PROPERTYPUTREF is specified.
pexcepinfo : [var] Pointer to a structure containing exception information. This structure should be filled in if DISP_E_EXCEPTION is returned.
puArgErr : [var] The index within rgvarg of the first argument that has an error. Arguments are stored in pdispparams->rgvarg in reverse order, so the first argument is the one with the highest index in the array. This parameter is returned only when the resulting return value is DISP_E_TYPEMISMATCH or DISP_E_PARAMNOTFOUND.
%inst
Automatically calls member functions on an interface, given the type
information for the interface.

[戻り値]
This doc was truncated.

[備考]
The parameter _this is a pointer to an implementation of the
interface that is being deferred to. DispInvoke builds a stack frame,
coerces parameters using standard coercion rules, pushes them on the
stack, and then calls the correct member function in the VTBL.


%index
DosDateTimeToVariantTime
Converts the MS-DOS representation of time to the date and time representation stored in a variant.
%group
Win32 oleaut32
%prm
wDosDate, wDosTime, pvtime
wDosDate : [int] The MS-DOS date to convert. The valid range of MS-DOS dates is January 1, 1980, to December 31, 2099, inclusive.
wDosTime : [int] The MS-DOS time to convert.
pvtime : [var] The converted time.
%inst
Converts the MS-DOS representation of time to the date and time
representation stored in a variant.

[戻り値]
The function returns TRUE on success and FALSE otherwise.

[備考]
MS-DOS records file dates and times as packed 16-bit values. An
MS-DOS date has the following format.
This doc was truncated.


%index
GetActiveObject
Retrieves a pointer to a running object that has been registered with OLE.
%group
Win32 oleaut32
%prm
rclsid, pvReserved, ppunk
rclsid : [var] The class identifier (CLSID) of the active object from the OLE registration database.
pvReserved : [intptr] Reserved for future use. Must be null.
ppunk : [var] The requested active object.
%inst
Retrieves a pointer to a running object that has been registered with
OLE.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
GetAltMonthNames
Retrieves the secondary (alternate) month names.
%group
Win32 oleaut32
%prm
lcid, prgp
lcid : [int] The locale identifier to be used in retrieving the alternate month names.
prgp : [var] An array of pointers to strings containing the alternate month names.
%inst
Retrieves the secondary (alternate) month names.

[戻り値]
The function returns TRUE on success and FALSE otherwise.

[備考]
Useful for Hijri, Polish and Russian alternate month names.


%index
GetErrorInfo
Obtains the error information pointer set by the previous call to SetErrorInfo in the current logical thread.
%group
Win32 oleaut32
%prm
dwReserved, pperrinfo
dwReserved : [int] Reserved for future use. Must be zero.
pperrinfo : [var] An error object.
%inst
Obtains the error information pointer set by the previous call to
SetErrorInfo in the current logical thread.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function returns a pointer to the most recently set IErrorInfo
pointer in the current logical thread. It transfers ownership of the
error object to the caller, and clears the error state for the
thread. Making a COM call that goes through a proxy-stub will clear
any existing error object for the calling thread. A called object
should not make any such calls after calling SetErrorInfo and before
returning. The caller should not make any such calls after the call
returns and before calling GetErrorInfo. As a rule of thumb, an
interface method should return as soon as possible after calling
SetErrorInfo, and the caller should call GetErrorInfo as soon as
possible after the call returns.


%index
GetRecordInfoFromGuids
Returns a pointer to the IRecordInfo interface for a UDT by passing the GUID of the type information without having to load the type library.
%group
Win32 oleaut32
%prm
rGuidTypeLib, uVerMajor, uVerMinor, lcid, rGuidTypeInfo, ppRecInfo
rGuidTypeLib : [var] The GUID of the type library containing the UDT.
uVerMajor : [int] The major version number of the type library of the UDT.
uVerMinor : [int] The minor version number of the type library of the UDT.
lcid : [int] The locale ID of the caller.
rGuidTypeInfo : [var] The GUID of the typeinfo that describes the UDT.
ppRecInfo : [var] The IRecordInfo interface.
%inst
Returns a pointer to the IRecordInfo interface for a UDT by passing
the GUID of the type information without having to load the type
library.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
A pointer to IRecordInfo can be serialized by writing out the GUIDs
and version numbers and deserialized by loading the information and
passing it to GetRecordInfoFromGuids.


%index
GetRecordInfoFromTypeInfo
Returns a pointer to the IRecordInfo interface of the UDT by passing its type information.
%group
Win32 oleaut32
%prm
pTypeInfo, ppRecInfo
pTypeInfo : [var] The type information of a record.
ppRecInfo : [var] The IRecordInfo interface.
%inst
Returns a pointer to the IRecordInfo interface of the UDT by passing
its type information.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
LHashValOfNameSys
Computes a hash value for a name. (LHashValOfNameSys)
%group
Win32 oleaut32
%prm
syskind, lcid, szName
syskind : [int] The SYSKIND of the target operating system.
lcid : [int] The LCID for the string.
szName : [wstr] The string whose hash value is to be computed.
%inst
Computes a hash value for a name. (LHashValOfNameSys)

[戻り値]
A hash value that represents the passed-in name.


%index
LPSAFEARRAY_UserFree
Frees resources on the server side when called by RPC stub files. (LPSAFEARRAY_UserFree)
%group
Win32 oleaut32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
Frees resources on the server side when called by RPC stub files.
(LPSAFEARRAY_UserFree)


%index
LPSAFEARRAY_UserFree64
Frees resources on the server side when called by RPC stub files. (LPSAFEARRAY_UserFree64)
%group
Win32 oleaut32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
Frees resources on the server side when called by RPC stub files.
(LPSAFEARRAY_UserFree64)


%index
LPSAFEARRAY_UserMarshal
Marshals data from the specified SAFEARRAY object to the user's RPC buffer on the client or server side. (LPSAFEARRAY_UserMarshal)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
Marshals data from the specified SAFEARRAY object to the user's RPC
buffer on the client or server side. (LPSAFEARRAY_UserMarshal)

[戻り値]
The value obtained from the returned HRESULT value is one of the
following.
This doc was truncated.


%index
LPSAFEARRAY_UserMarshal64
Marshals data from the specified SAFEARRAY object to the user's RPC buffer on the client or server side. (LPSAFEARRAY_UserMarshal64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
Marshals data from the specified SAFEARRAY object to the user's RPC
buffer on the client or server side. (LPSAFEARRAY_UserMarshal64)

[戻り値]
The value obtained from the returned HRESULT value is one of the
following.
This doc was truncated.


%index
LPSAFEARRAY_UserSize
Calculates the wire size of the SAFEARRAY object, and gets its handle and data. (LPSAFEARRAY_UserSize)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
Calculates the wire size of the SAFEARRAY object, and gets its handle
and data. (LPSAFEARRAY_UserSize)

[戻り値]
The value obtained from the returned HRESULT value is S_OK.


%index
LPSAFEARRAY_UserSize64
Calculates the wire size of the SAFEARRAY object, and gets its handle and data. (LPSAFEARRAY_UserSize64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
Calculates the wire size of the SAFEARRAY object, and gets its handle
and data. (LPSAFEARRAY_UserSize64)

[戻り値]
The value obtained from the returned HRESULT value is S_OK.


%index
LPSAFEARRAY_UserUnmarshal
Unmarshals a SAFEARRAY object from the RPC buffer. (LPSAFEARRAY_UserUnmarshal)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
Unmarshals a SAFEARRAY object from the RPC buffer.
(LPSAFEARRAY_UserUnmarshal)

[戻り値]
The value obtained from the returned HRESULT value is one of the
following.
This doc was truncated.


%index
LPSAFEARRAY_UserUnmarshal64
Unmarshals a SAFEARRAY object from the RPC buffer. (LPSAFEARRAY_UserUnmarshal64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
Unmarshals a SAFEARRAY object from the RPC buffer.
(LPSAFEARRAY_UserUnmarshal64)

[戻り値]
The value obtained from the returned HRESULT value is one of the
following.
This doc was truncated.


%index
LoadRegTypeLib
Uses registry information to load a type library.
%group
Win32 oleaut32
%prm
rguid, wVerMajor, wVerMinor, lcid, pptlib
rguid : [var] The GUID of the library.
wVerMajor : [int] The major version of the library.
wVerMinor : [int] The minor version of the library.
lcid : [int] The national language code of the library.
pptlib : [var] The loaded type library.
%inst
Uses registry information to load a type library.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
The function LoadRegTypeLib defers to LoadTypeLib to load the file.
LoadRegTypeLib compares the requested version numbers against those
found in the system registry, and takes one of the following actions:
This doc was truncated.


%index
LoadTypeLib
Loads and registers a type library.
%group
Win32 oleaut32
%prm
szFile, pptlib
szFile : [wstr] The name of the file from which the method should attempt to load a type library.
pptlib : [var] The loaded type library.
%inst
Loads and registers a type library.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
The function LoadTypeLib loads a type library (usually created with
MkTypLib) that is stored in the specified file. If szFile specifies
only a file name without any path, LoadTypeLib searches for the file
and proceeds as follows:
This doc was truncated.


%index
LoadTypeLibEx
Loads a type library and (optionally) registers it in the system registry. ?.
%group
Win32 oleaut32
%prm
szFile, regkind, pptlib
szFile : [wstr] The type library file.
regkind : [int] Identifies the kind of registration to perform for the type library based on the following flags: DEFAULT, REGISTER and NONE. REGKIND_DEFAULT simply calls LoadTypeLib and registration occurs based on the LoadTypeLib registration rules. REGKIND_NONE calls LoadTypeLib without the registration process enabled. REGKIND_REGISTER calls LoadTypeLib followed by RegisterTypeLib, which registers the type library. To unregister the type library, use UnRegisterTypeLib.
pptlib : [var] The type library.
%inst
Loads a type library and (optionally) registers it in the system
registry. .

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
Enables programmers to specify whether or not the type library should
be loaded.


%index
OaBuildVersion
Retrieves the build version of OLE Automation.
%group
Win32 oleaut32
%prm

%inst
Retrieves the build version of OLE Automation.

[戻り値]
The build number.


%index
OaEnablePerUserTLibRegistration
Enables the RegisterTypeLib function to override default registry mappings under Windows Vista Service Pack 1 (SP1), Windows Server 2008, and later operating system versions.
%group
Win32 oleaut32
%prm

%inst
Enables the RegisterTypeLib function to override default registry
mappings under Windows Vista Service Pack 1 (SP1), Windows Server
2008, and later operating system versions.

[備考]
Consider the following scenario: You are running an application on a
computer that is running Windows Vista SP1 or later. In your
application, you have overridden the HKEY_CLASSES_ROOT registry
subtree and mapped it to another registry subtree. (For example,
perhaps you mapped HKEY_CLASSES_ROOT to HKEY_CURRENT_USER.) You then
attempt to register a type library by calling RegisterTypeLib, and
you receive an "access denied" error message. Additionally,
RegisterTypeLib returns the TYPE_E_REGISTRYACCESS (0x8002801c) value.
This problem occurs if User Account Control (UAC) is enabled, and the
application is running under a limited user account.
You can resolve this problem in one of two ways:
This doc was truncated.


%index
OleCreateFontIndirect
Creates and initializes a standard font object using an initial description of the font's properties in a FONTDESC structure.
%group
Win32 oleaut32
%prm
lpFontDesc, riid, lplpvObj
lpFontDesc : [var] Address of a caller-allocated, FONTDESC structure containing the initial state of the font. This value must not be NULL.
riid : [var] Reference to the identifier of the interface describing the type of interface pointer to return in lplpvObj.
lplpvObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, this parameter contains the requested interface pointer on the newly created font object. If successful, the caller is responsible to call Release through this interface pointer when the new object is no longer needed. If unsuccessful, the value of is set to NULL.
%inst
Creates and initializes a standard font object using an initial
description of the font's properties in a FONTDESC structure.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.


%index
OleCreatePictureIndirect
Creates a new picture object initialized according to a PICTDESC structure.
%group
Win32 oleaut32
%prm
lpPictDesc, riid, fOwn, lplpvObj
lpPictDesc : [var] Pointer to a caller-allocated structure containing the initial state of the picture. The specified structure can be NULL to create an uninitialized object, in the event the picture needs to initialize via IPersistStream::Load.
riid : [var] Reference to the identifier of the interface describing the type of interface pointer to return in lplpvObj.
fOwn : [int] If TRUE, the picture object is to destroy its picture when the object is destroyed. If FALSE, the caller is responsible for destroying the picture.
lplpvObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, this parameter contains the requested interface pointer on the newly created object. If the call is successful, the caller is responsible for calling Release through this interface pointer when the new object is no longer needed. If the call fails, the value is set to NULL.
%inst
Creates a new picture object initialized according to a PICTDESC
structure.

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The fOwn parameter indicates whether the picture is to own the GDI
picture handle for the picture it contains, so that the picture
object will destroy its picture when the object itself is destroyed.
The function returns an interface pointer to the new picture object
specified by the caller in the riid parameter. A QueryInterface is
built into this call. The caller is responsible for calling Release
through the interface pointer returned.


%index
OleCreatePropertyFrame
Invokes a new property frame, that is, a property sheet dialog box, whose parent is hwndOwner, where the dialog is positioned at the point (x,y) in the parent window and has the caption lpszCaption.
%group
Win32 oleaut32
%prm
hwndOwner, x, y, lpszCaption, cObjects, ppUnk, cPages, pPageClsID, lcid, dwReserved, pvReserved
hwndOwner : [intptr] Handle to the parent window of the resulting property sheet dialog box.
x : [int] Reserved. Horizontal position for the dialog box relative to hwndOwner.
y : [int] Reserved. Vertical position for the dialog box relative to hwndOwner.
lpszCaption : [wstr] Pointer to the string used for the caption of the dialog box.
cObjects : [int] Number of object pointers passed in ppUnk.
ppUnk : [var] An array of IUnknown pointers on the objects for which this property sheet is being invoked. The number of elements in the array is specified by cObjects. These pointers are passed to each property page through IPropertyPage::SetObjects.
cPages : [int] Number of property pages specified in pPageCIsID.
pPageClsID : [var] Array of size cPages containing the CLSIDs of each property page to display in the property sheet.
lcid : [int] Locale identifier to use for the property sheet. Property pages can retrieve this identifier through IPropertyPageSite::GetLocaleID.
dwReserved : [int] Reserved for future use; must be zero.
pvReserved : [intptr] Reserved for future use; must be NULL.
%inst
Invokes a new property frame, that is, a property sheet dialog box,
whose parent is hwndOwner, where the dialog is positioned at the
point (x,y) in the parent window and has the caption lpszCaption.

[戻り値]
This function supports the standard return values E_INVALIDARG,
E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following:
This doc was truncated.

[備考]
The property pages to be displayed are identified with pPageClsID,
which is an array of cPages CLSID values. The objects that are
affected by this property sheet are identified in ppUnk, an array of
size cObjects containing IUnknown pointers. This function always
creates a modal dialog box and does not return until the dialog box
is closed.


%index
OleCreatePropertyFrameIndirect
Creates a property frame, that is, a property sheet dialog box, based on a structure (OCPFIPARAMS) that contains the parameters, rather than specifying separate parameters as when calling OleCreatePropertyFrame.
%group
Win32 oleaut32
%prm
lpParams
lpParams : [var] Pointer to the caller-allocated structure containing the creation parameters for the dialog box.
%inst
Creates a property frame, that is, a property sheet dialog box, based
on a structure (OCPFIPARAMS) that contains the parameters, rather
than specifying separate parameters as when calling
OleCreatePropertyFrame.

[戻り値]
This function supports the standard return values E_INVALIDARG,
E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following:
This doc was truncated.

[備考]
Besides cbStructSize (the size of the structure) and
dispIDInitialProperty, all of the members of the OCPFIPARAMS
structure have the same semantics as the parameters for
OleCreatePropertyFrame. When dispIDInitialProperty is DISPID_UNKNOWN,
the behavior of the two functions is identical. Working in
conjunction with IPerPropertyBrowsing and IPropertyPage2,
dispIDInitialProperty allows the caller to specify which single
property should be highlighted when the dialog box is made visible.
This feature is not available when using OleCreatePropertyFrame. To
determine the page and property to show initially, the property frame
will do the following:
This doc was truncated.


%index
OleIconToCursor
Converts an icon to a cursor.
%group
Win32 oleaut32
%prm
hinstExe, hIcon
hinstExe : [intptr] This parameter is ignored.
hIcon : [intptr] A handle to the icon to be converted.
%inst
Converts an icon to a cursor.

[戻り値]
The function returns a handle to the new cursor object. The caller is
responsible for deleting this cursor with the DestroyCursor function.
If the conversion could not be completed, the return value is NULL.

[備考]
This function calls the CopyCursor function.


%index
OleLoadPicture
Creates a new picture object and initializes it from the contents of a stream. This is equivalent to calling OleCreatePictureIndirect with NULL as the first parameter, followed by a call to IPersistStream::Load. (OleLoadPicture)
%group
Win32 oleaut32
%prm
lpstream, lSize, fRunmode, riid, lplpvObj
lpstream : [var] Pointer to the stream that contains the picture's data.
lSize : [int] The number of bytes that should be read from the stream, or zero if the entire stream should be read.
fRunmode : [int] The opposite of the initial value of the KeepOriginalFormat property. If TRUE, KeepOriginalFormat is set to FALSE and vice-versa.
riid : [var] Reference to the identifier of the interface describing the type of interface pointer to return in ppvObj.
lplpvObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the storage of the object identified by the moniker. If *ppvObj is non-NULL, this function calls IUnknown::AddRef on the interface; it is the caller's responsibility to call IUnknown::Release. If an error occurs, *ppvObj is set to NULL.
%inst
Creates a new picture object and initializes it from the contents of
a stream. This is equivalent to calling OleCreatePictureIndirect with
NULL as the first parameter, followed by a call to
IPersistStream::Load. (OleLoadPicture)

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The stream must be in BMP (bitmap), WMF (metafile), or ICO (icon)
format. A picture object created using OleLoadPicture always has
ownership of its internal resources (fOwn==TRUE is implied).


%index
OleLoadPictureEx
Creates a new picture object and initializes it from the contents of a stream. This is equivalent to calling OleCreatePictureIndirect with NULL as the first parameter, followed by a call to IPersistStream::Load. (OleLoadPictureEx)
%group
Win32 oleaut32
%prm
lpstream, lSize, fRunmode, riid, xSizeDesired, ySizeDesired, dwFlags, lplpvObj
lpstream : [var] Pointer to the stream that contains the picture's data.
lSize : [int] The number of bytes that should be read from the stream, or zero if the entire stream should be read.
fRunmode : [int] The opposite of the initial value of the KeepOriginalFormat property. If TRUE, KeepOriginalFormat is set to FALSE and vice versa.
riid : [var] Reference to the identifier of the interface describing the type of interface pointer to return in ppvObj.
xSizeDesired : [int] Desired width of icon or cursor. Valid values are 16, 32, and 48. Pass LP_DEFAULT to both size parameters to use system default size.
ySizeDesired : [int] Desired height of icon or cursor. Valid values are 16, 32, and 48. Pass LP_DEFAULT to both size parameters to use system default size.
dwFlags : [int] Desired color depth for icon or cursor. Values are LP_MONOCHROME (monochrome), LP_VGACOLOR (16 colors), LP_COLOR (256 colors), or LP_DEFAULT (selects best depth for current display).
lplpvObj : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvObj contains the requested interface pointer on the storage of the object identified by the moniker. If *ppvObj is non-NULL, this function calls IUnknown::AddRef on the interface; it is the caller's responsibility to call IUnknown::Release. If an error occurs, *ppvObj is set to NULL.
%inst
Creates a new picture object and initializes it from the contents of
a stream. This is equivalent to calling OleCreatePictureIndirect with
NULL as the first parameter, followed by a call to
IPersistStream::Load. (OleLoadPictureEx)

[戻り値]
This function returns S_OK on success. Other possible values include
the following.
This doc was truncated.

[備考]
The stream must be in BMP (bitmap), WMF (metafile), or ICO (icon)
format. A picture object created using OleLoadPictureEx always has
ownership of its internal resources (fOwn==TRUE is implied). In
addition to allowing specification of icon or cursor size,
OleLoadPictureEx supports loading of color cursors.


%index
OleLoadPictureFile
Creates an IPictureDisp object from a picture file on disk.
%group
Win32 oleaut32
%prm
varFileName, lplpdispPicture
varFileName : [var] The path and name of the picture file to load.
lplpdispPicture : [var] The location that receives a pointer to the IPictureDisp object.
%inst
Creates an IPictureDisp object from a picture file on disk.

[戻り値]
This method returns standard COM error codes in addition to the
following values.
This doc was truncated.

[備考]
Recognized graphic formats include bitmap (.bmp), JPEG (.jpg), GIF
(.gif), and PGN (.png) files.


%index
OleLoadPictureFileEx
Loads a picture from a file.
%group
Win32 oleaut32
%prm
varFileName, xSizeDesired, ySizeDesired, dwFlags, lplpdispPicture
varFileName : [var] The path and name of the picture file to load.
xSizeDesired : [int] The desired length for the picture to be displayed.
ySizeDesired : [int] The desired height for the picture to be displayed.
dwFlags : [int] The desired color depth for the icon or cursor. Together with the desired size it is used to select the best matching image.
lplpdispPicture : [var] The location that receives a pointer to the picture.
%inst
Loads a picture from a file.

[戻り値]
This method returns standard COM error codes in addition to the
following values.
This doc was truncated.

[備考]
Recognized graphic formats include bitmap (.bmp), JPEG (.jpg), GIF
(.gif), and PGN (.png) files.


%index
OleLoadPicturePath
Creates a new picture object and initializes it from the contents of a stream. This is equivalent to calling OleCreatePictureIndirect(NULL, ...) followed by IPersistStream::Load.
%group
Win32 oleaut32
%prm
szURLorPath, punkCaller, dwReserved, clrReserved, riid, ppvRet
szURLorPath : [wstr] The path or URL to the file you want to open.
punkCaller : [var] Points to IUnknown for COM aggregation.
dwReserved : [int] Reserved.
clrReserved : [int] The color you want to reserve to be transparent.
riid : [var] Reference to the identifier of the interface describing the type of interface pointer to return in ppvRet.
ppvRet : [var] Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *ppvRet contains the requested interface pointer on the storage of the object identified by the moniker. If *ppvRet is non-NULL, this function calls IUnknown::AddRef on the interface; it is the caller's responsibility to call IUnknown::Release. If an error occurs, *ppvRet is set to NULL.
%inst
Creates a new picture object and initializes it from the contents of
a stream. This is equivalent to calling
OleCreatePictureIndirect(NULL, ...) followed by IPersistStream::Load.

[戻り値]
This function supports the standard return values E_OUTOFMEMORY and
E_UNEXPECTED, as well as the following:
This doc was truncated.

[備考]
The stream must be in BMP (bitmap), JPEG, WMF (metafile), ICO (icon),
or GIF format.


%index
OleSavePictureFile
Saves a picture to a file.
%group
Win32 oleaut32
%prm
lpdispPicture, bstrFileName
lpdispPicture : [var] Points to the IPictureDisp picture object.
bstrFileName : [int] The name of the file to save the picture to.
%inst
Saves a picture to a file.

[戻り値]
This method returns standard COM error codes in addition to the
following values.
This doc was truncated.


%index
OleTranslateColor
Converts an OLE_COLOR type to a COLORREF.
%group
Win32 oleaut32
%prm
clr, hpal, lpcolorref
clr : [int] The OLE color to be converted into a COLORREF.
hpal : [intptr] Palette used as a basis for the conversion.
lpcolorref : [var] Pointer to the caller's variable that receives the converted COLORREF result. This parameter can be NULL, indicating that the caller wants only to verify that a converted color exists.
%inst
Converts an OLE_COLOR type to a COLORREF.

[戻り値]
This function supports the standard return values E_INVALIDARG and
E_UNEXPECTED, as well as the following value.
This doc was truncated.

[備考]
The following table describes the color conversion.
This doc was truncated.


%index
QueryPathOfRegTypeLib
Retrieves the path of a registered type library.
%group
Win32 oleaut32
%prm
guid, wMaj, wMin, lcid, lpbstrPathName
guid : [var] The GUID of the library.
wMaj : [int] The major version number of the library.
wMin : [int] The minor version number of the library.
lcid : [int] The national language code for the library.
lpbstrPathName : [var] The type library name.
%inst
Retrieves the path of a registered type library.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Returns the fully qualified file name that is specified for the type
library in the registry. The caller allocates the BSTR that is passed
in, and must free it after use.


%index
RegisterActiveObject
Registers an object as the active object for its class.
%group
Win32 oleaut32
%prm
punk, rclsid, dwFlags, pdwRegister
punk : [var] The active object.
rclsid : [var] The CLSID of the active object.
dwFlags : [int] Flags controlling registration of the object. Possible values are ACTIVEOBJECT_STRONG and ACTIVEOBJECT_WEAK.
pdwRegister : [var] Receives a handle. This handle must be passed to RevokeActiveObject to end the object's active status.
%inst
Registers an object as the active object for its class.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The RegisterActiveObject function registers the object to which punk
points as the active object for the class denoted by rclsid.
Registration causes the object to be listed in the running object
table (ROT) of OLE, a globally accessible lookup table that keeps
track of objects that are currently running on the computer. (For
more information about the running object table, see the COM
Programmer's Reference.) The dwFlags parameter specifies the strength
or weakness of the registration, which affects the way the object is
shut down. In general, ActiveX objects should behave in the following
manner:
This doc was truncated.


%index
RegisterTypeLib
Adds information about a type library to the system registry.
%group
Win32 oleaut32
%prm
ptlib, szFullPath, szHelpDir
ptlib : [var] The type library.
szFullPath : [wstr] The fully qualified path specification for the type library.
szHelpDir : [wstr] The directory in which the Help file for the library being registered can be found. This parameter can be null.
%inst
Adds information about a type library to the system registry.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function can be used during application initialization to
register the application's type library correctly. When
RegisterTypeLib is called to register a type library, both the minor
and major version numbers are registered in hexadecimal.
In addition to filling in a complete registry entry under the type
library key, RegisterTypeLib adds entries for each of the
dispinterfaces and Automation-compatible interfaces, including dual
interfaces. This information is required to create instances of these
interfaces. Coclasses are not registered (that is, RegisterTypeLib
does not write any values to the CLSID key of the coclass).


%index
RegisterTypeLibForUser
Registers a type library for use by the calling user.
%group
Win32 oleaut32
%prm
ptlib, szFullPath, szHelpDir
ptlib : [var] The type library.
szFullPath : [wstr] The fully qualified path specification for the type library.
szHelpDir : [wstr] The directory in which the Help file for the library being registered can be found. This parameter can be null.
%inst
Registers a type library for use by the calling user.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
RegisterTypeLibForUser has functionality identical to RegisterTypeLib
except that type library is registered for use only by the calling
user identity.


%index
RevokeActiveObject
Ends an object's status as active.
%group
Win32 oleaut32
%prm
dwRegister, pvReserved
dwRegister : [int] A handle previously returned by RegisterActiveObject.
pvReserved : [intptr] Reserved for future use. Must be null.
%inst
Ends an object's status as active.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
SafeArrayAccessData
Increments the lock count of an array, and retrieves a pointer to the array data.
%group
Win32 oleaut32
%prm
psa, ppvData
psa : [var] An array descriptor created by SafeArrayCreate.
ppvData : [var] The array data.
%inst
Increments the lock count of an array, and retrieves a pointer to the
array data.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
After calling SafeArrayAccessData, you must call the
SafeArrayUnaccessData function to unlock the array.


%index
SafeArrayAddRef
Increases the pinning reference count of the descriptor for the specified safe array by one, and may increase the pinning reference count of the data for the specified safe array by one if that data was dynamically allocated, as determined by the descriptor of the safe array.
%group
Win32 oleaut32
%prm
psa, ppDataToRelease
psa : [var] The safe array for which the pinning reference count of the descriptor should increase. While that count remains greater than 0, the memory for the descriptor is prevented from being freed by calls to the SafeArrayDestroy or SafeArrayDestroyDescriptor functions.
ppDataToRelease : [var] Returns the safe array data for which a pinning reference was added, if SafeArrayAddRef also added  a pinning reference for the  safe array data.  This parameter is NULL if SafeArrayAddRef did not add a pinning reference for the safe array data. SafeArrayAddRef does not add a pinning reference for the safe array data if that safe array data was not dynamically allocated.
%inst
Increases the pinning reference count of the descriptor for the
specified safe array by one, and may increase the pinning reference
count of the data for the specified safe array by one if that data
was dynamically allocated, as determined by the descriptor of the
safe array.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Safe arrays have not traditionally had a reference count. All
existing usage of safe arrays will continue to work with no changes.
The SafeArrayAddRef, SafeArrayReleaseData, SafeArrayReleaseDescriptor
functions add the ability to use reference counting to pin the safe
array into memory before calling from an untrusted script into an
IDispatch method that may not expect the script to free that memory
before the method returns, so that the script cannot force the code
for that method into accessing memory that has been freed. After such
a method safely returns, the pinning references should be released.
You can release the pinning references by calling the following
functions:
This doc was truncated.


%index
SafeArrayAllocData
Allocates memory for a safe array, based on a descriptor created with SafeArrayAllocDescriptor.
%group
Win32 oleaut32
%prm
psa
psa : [var] A safe array descriptor created by SafeArrayAllocDescriptor.
%inst
Allocates memory for a safe array, based on a descriptor created with
SafeArrayAllocDescriptor.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
SafeArrayAllocDescriptor
Allocates memory for a safe array descriptor.
%group
Win32 oleaut32
%prm
cDims, ppsaOut
cDims : [int] The number of dimensions of the array.
ppsaOut : [var] The safe array descriptor.
%inst
Allocates memory for a safe array descriptor.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function allows the creation of safe arrays that contain
elements with data types other than those provided by
SafeArrayCreate. After creating an array descriptor using
SafeArrayAllocDescriptor, set the element size in the array
descriptor, a call SafeArrayAllocData to allocate memory for the
array elements.


%index
SafeArrayAllocDescriptorEx
Creates a safe array descriptor for an array of any valid variant type, including VT_RECORD, without allocating the array data.
%group
Win32 oleaut32
%prm
vt, cDims, ppsaOut
vt : [int] The variant type.
cDims : [int] The number of dimensions in the array.
ppsaOut : [var] The safe array descriptor.
%inst
Creates a safe array descriptor for an array of any valid variant
type, including VT_RECORD, without allocating the array data.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
Because SafeArrayAllocDescriptor does not take a VARTYPE, it is not
possible to use it to create the safe array descriptor for an array
of records. The SafeArrayAllocDescriptorEx is used to allocate a safe
array descriptor for an array of records of the given dimensions.


%index
SafeArrayCopy
Creates a copy of an existing safe array.
%group
Win32 oleaut32
%prm
psa, ppsaOut
psa : [var] A safe array descriptor created by SafeArrayCreate.
ppsaOut : [var] The safe array descriptor.
%inst
Creates a copy of an existing safe array.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
SafeArrayCopy calls the string or variant manipulation functions if
the array to copy contains either of these data types. If the array
being copied contains object references, the reference counts for the
objects are incremented.


%index
SafeArrayCopyData
Copies the source array to the specified target array after releasing any resources in the target array.
%group
Win32 oleaut32
%prm
psaSource, psaTarget
psaSource : [var] The safe array to copy.
psaTarget : [var] The target safe array.
%inst
Copies the source array to the specified target array after releasing
any resources in the target array.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
SafeArrayCreate
Creates a new array descriptor, allocates and initializes the data for the array, and returns a pointer to the new array descriptor.
%group
Win32 oleaut32
%prm
vt, cDims, rgsabound
vt : [int] The base type of the array (the VARTYPE of each element of the array). The VARTYPE is restricted to a subset of the variant types. Neither the VT_ARRAY nor the VT_BYREF flag can be set. VT_EMPTY and VT_NULL are not valid base types for the array. All other types are legal.
cDims : [int] The number of dimensions in the array. The number cannot be changed after the array is created.
rgsabound : [var] A vector of bounds (one for each dimension) to allocate for the array.
%inst
Creates a new array descriptor, allocates and initializes the data
for the array, and returns a pointer to the new array descriptor.

[戻り値]
A safe array descriptor, or null if the array could not be created.


%index
SafeArrayCreateEx
Creates and returns a safe array descriptor from the specified VARTYPE, number of dimensions and bounds.
%group
Win32 oleaut32
%prm
vt, cDims, rgsabound, pvExtra
vt : [int] The base type or the VARTYPE of each element of the array. The FADF_RECORD flag can be set for a variant type VT_RECORD, The FADF_HAVEIID flag can be set for VT_DISPATCH or VT_UNKNOWN, and FADF_HAVEVARTYPE can be set for all other VARTYPEs.
cDims : [int] The number of dimensions in the array.
rgsabound : [var] A vector of bounds (one for each dimension) to allocate for the array.
pvExtra : [intptr] the type information of the user-defined type, if you are creating a safe array of user-defined types. If the vt parameter is VT_RECORD, then pvExtra will be a pointer to an IRecordInfo describing the record. If the vt parameter is VT_DISPATCH or VT_UNKNOWN, then pvExtra will contain a pointer to a GUID representing the type of interface being passed to the array.
%inst
Creates and returns a safe array descriptor from the specified
VARTYPE, number of dimensions and bounds.

[戻り値]
A safe array descriptor, or null if the array could not be created.

[備考]
If the VARTYPE is VT_RECORD then SafeArraySetRecordInfo is called. If
the VARTYPE is VT_DISPATCH or VT_UNKNOWN then the elements of the
array must contain interfaces of the same type. Part of the process
of marshaling this array to other processes does include generating
the proxy/stub code of the IID pointed to by the pvExtra parameter.
To actually pass heterogeneous interfaces one will need to specify
either IID_IUnknown or IID_IDispatch in pvExtra and provide some
other means for the caller to identify how to query for the actual
interface.


%index
SafeArrayCreateVector
Creates a one-dimensional array. A safe array created with SafeArrayCreateVector is a fixed size, so the constant FADF_FIXEDSIZE is always set.
%group
Win32 oleaut32
%prm
vt, lLbound, cElements
vt : [int] The base type of the array (the VARTYPE of each element of the array). The VARTYPE is restricted to a subset of the variant types. Neither the VT_ARRAY nor the VT_BYREF flag can be set. VT_EMPTY and VT_NULL are not valid base types for the array. All other types are legal.
lLbound : [int] The lower bound for the array. This parameter can be negative.
cElements : [int] The number of elements in the array.
%inst
Creates a one-dimensional array. A safe array created with
SafeArrayCreateVector is a fixed size, so the constant FADF_FIXEDSIZE
is always set.

[戻り値]
A safe array descriptor, or null if the array could not be created.


%index
SafeArrayCreateVectorEx
Creates and returns a one-dimensional safe array of the specified VARTYPE and bounds.
%group
Win32 oleaut32
%prm
vt, lLbound, cElements, pvExtra
vt : [int] The base type of the array (the VARTYPE of each element of the array). The FADF_RECORD flag can be set for VT_RECORD. The FADF_HAVEIID can be set for VT_DISPATCH or VT_UNKNOWN and FADF_HAVEVARTYPE can be set for all other types.
lLbound : [int] The lower bound for the array. This parameter can be negative.
cElements : [int] The number of elements in the array.
pvExtra : [intptr] The type information of the user-defined type, if you are creating a safe array of user-defined types. If the vt parameter is VT_RECORD, then pvExtra will be a pointer to an IRecordInfo describing the record. If the vt parameter is VT_DISPATCH or VT_UNKNOWN, then pvExtra will contain a pointer to a GUID representing the type of interface being passed to the array.
%inst
Creates and returns a one-dimensional safe array of the specified
VARTYPE and bounds.

[戻り値]
A safe array descriptor, or null if the array could not be created.


%index
SafeArrayDestroy
Destroys an existing array descriptor and all of the data in the array.
%group
Win32 oleaut32
%prm
psa
psa : [var] An array descriptor created by SafeArrayCreate.
%inst
Destroys an existing array descriptor and all of the data in the
array.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
Safe arrays of variant will have the VariantClear function called on
each member and safe arrays of BSTR will have the SysFreeString
function called on each element. IRecordInfo::RecordClear will be
called to release object references and other values of a record
without deallocating the record.


%index
SafeArrayDestroyData
Destroys all the data in the specified safe array.
%group
Win32 oleaut32
%prm
psa
psa : [var] A safe array descriptor.
%inst
Destroys all the data in the specified safe array.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function is typically used when freeing safe arrays that contain
elements with data types other than variants. If objects are stored
in the array, Release is called on each object in the array. Safe
arrays of variant will have the VariantClear function called on each
member and safe arrays of BSTR will have the SysFreeString function
called on each element. IRecordInfo::RecordClear will be called to
release object references and other values of a record without
deallocating the record.


%index
SafeArrayDestroyDescriptor
Destroys the descriptor of the specified safe array.
%group
Win32 oleaut32
%prm
psa
psa : [var] A safe array descriptor.
%inst
Destroys the descriptor of the specified safe array.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function is typically used to destroy the descriptor of a safe
array that contains elements with data types other than variants.
Destroying the array descriptor does not destroy the elements in the
array. Before destroying the array descriptor, call
SafeArrayDestroyData to free the elements.


%index
SafeArrayGetDim
Gets the number of dimensions in the array.
%group
Win32 oleaut32
%prm
psa
psa : [var] An array descriptor created by SafeArrayCreate.
%inst
Gets the number of dimensions in the array.

[戻り値]
The number of dimensions in the array.


%index
SafeArrayGetElement
Retrieves a single element of the array.
%group
Win32 oleaut32
%prm
psa, rgIndices, pv
psa : [var] An array descriptor created by SafeArrayCreate.
rgIndices : [var] A vector of indexes for each dimension of the array. The right-most (least significant) dimension is rgIndices[0]. The left-most dimension is stored at rgIndices[psa->cDims ? 1].
pv : [intptr] The element of the array.
%inst
Retrieves a single element of the array.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function calls SafeArrayLock and SafeArrayUnlock automatically,
before and after retrieving the element. The caller must provide a
storage area of the correct size to receive the data. If the data
element is a string, object, or variant, the function copies the
element in the correct way.


%index
SafeArrayGetElemsize
Gets the size of an element.
%group
Win32 oleaut32
%prm
psa
psa : [var] An array descriptor created by SafeArrayCreate.
%inst
Gets the size of an element.

[戻り値]
The size of an element in a safe array, in bytes.


%index
SafeArrayGetIID
Gets the GUID of the interface contained within the specified safe array.
%group
Win32 oleaut32
%prm
psa, pguid
psa : [var] An array descriptor created by SafeArrayCreate.
pguid : [var] The GUID of the interface.
%inst
Gets the GUID of the interface contained within the specified safe
array.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
SafeArrayGetLBound
Gets the lower bound for any dimension of the specified safe array.
%group
Win32 oleaut32
%prm
psa, nDim, plLbound
psa : [var] An array descriptor created by SafeArrayCreate.
nDim : [int] The array dimension for which to get the lower bound.
plLbound : [var] The lower bound.
%inst
Gets the lower bound for any dimension of the specified safe array.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
SafeArrayGetRecordInfo
Retrieves the IRecordInfo interface of the UDT contained in the specified safe array.
%group
Win32 oleaut32
%prm
psa, prinfo
psa : [var] An array descriptor created by SafeArrayCreate.
prinfo : [var] The IRecordInfo interface.
%inst
Retrieves the IRecordInfo interface of the UDT contained in the
specified safe array.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
SafeArrayGetUBound
Gets the upper bound for any dimension of the specified safe array.
%group
Win32 oleaut32
%prm
psa, nDim, plUbound
psa : [var] An array descriptor created by SafeArrayCreate.
nDim : [int] The array dimension for which to get the upper bound.
plUbound : [var] The upper bound.
%inst
Gets the upper bound for any dimension of the specified safe array.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
SafeArrayGetVartype
Gets the VARTYPE stored in the specified safe array.
%group
Win32 oleaut32
%prm
psa, pvt
psa : [var] An array descriptor created by SafeArrayCreate.
pvt : [var] The VARTYPE.
%inst
Gets the VARTYPE stored in the specified safe array.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
If FADF_HAVEVARTYPE is set, SafeArrayGetVartype returns the VARTYPE
stored in the array descriptor. If FADF_RECORD is set, it returns
VT_RECORD; if FADF_DISPATCH is set, it returns VT_DISPATCH; and if
FADF_UNKNOWN is set, it returns VT_UNKNOWN. SafeArrayGetVartype can
fail to return VT_UNKNOWN for SAFEARRAY types that are based on
IUnknown. Callers should additionally check whether the SAFEARRAY
type's fFeatures field has the FADF_UNKNOWN flag set.


%index
SafeArrayLock
Increments the lock count of an array, and places a pointer to the array data in pvData of the array descriptor.
%group
Win32 oleaut32
%prm
psa
psa : [var] An array descriptor created by SafeArrayCreate.
%inst
Increments the lock count of an array, and places a pointer to the
array data in pvData of the array descriptor.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
The pointer in the array descriptor is valid until the
SafeArrayUnlock function is called. Calls to SafeArrayLock can be
nested, in which case an equal number of calls to SafeArrayUnlock are
required. An array cannot be deleted while it is locked.


%index
SafeArrayPtrOfIndex
Gets a pointer to an array element.
%group
Win32 oleaut32
%prm
psa, rgIndices, ppvData
psa : [var] An array descriptor created by SafeArrayCreate.
rgIndices : [var] An array of index values that identify an element of the array. All indexes for the element must be specified.
ppvData : [var] The array element.
%inst
Gets a pointer to an array element.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
The array should be locked before SafeArrayPtrOfIndex is called.
Failing to lock the array can cause unpredictable results.


%index
SafeArrayPutElement
Stores the data element at the specified location in the array.
%group
Win32 oleaut32
%prm
psa, rgIndices, pv
psa : [var] An array descriptor created by SafeArrayCreate.
rgIndices : [var] A vector of indexes for each dimension of the array. The right-most (least significant) dimension is rgIndices[0]. The left-most dimension is stored at rgIndices[psa->cDims ? 1].
pv : [intptr] The data to assign to the array. The variant types VT_DISPATCH, VT_UNKNOWN, and VT_BSTR are pointers, and do not require another level of indirection.
%inst
Stores the data element at the specified location in the array.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function automatically calls SafeArrayLock and SafeArrayUnlock
before and after assigning the element. If the data element is a
string, object, or variant, the function copies it correctly when the
safe array is destroyed. If the existing element is a string, object,
or variant, it is cleared correctly. If the data element is a
VT_DISPATCH or VT_UNKNOWN, AddRef is called to increment the object's
reference count. Note Multiple locks can be on an array. Elements can
be put into an array while the array is locked by other operations.
For an example that demonstrates calling SafeArrayPutElement, see the
COM Fundamentals Lines sample (CLines::Add in Lines.cpp).


%index
SafeArrayRedim
Changes the right-most (least significant) bound of the specified safe array.
%group
Win32 oleaut32
%prm
psa, psaboundNew
psa : [var] A safe array descriptor.
psaboundNew : [var] A new safe array bound structure that contains the new array boundary. You can change only the least significant dimension of an array.
%inst
Changes the right-most (least significant) bound of the specified
safe array.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
If you reduce the bound of an array, SafeArrayRedim deallocates the
array elements outside the new array boundary. If the bound of an
array is increased, SafeArrayRedim allocates and initializes the new
array elements. The data is preserved for elements that exist in both
the old and new array.


%index
SafeArrayReleaseData
Decreases the pinning reference count for the specified safe array data by one. When that count reaches 0, the memory for that data is no longer prevented from being freed.
%group
Win32 oleaut32
%prm
pData
pData : [intptr] The safe array data for which the pinning reference count should decrease.
%inst
Decreases the pinning reference count for the specified safe array
data by one. When that count reaches 0, the memory for that data is
no longer prevented from being freed.

[備考]
A call to the SafeArrayReleaseData function should match every
previous call to the SafeArrayAddRef function that returned a
non-null value in the ppDataToRelease parameter.


%index
SafeArrayReleaseDescriptor
Decreases the pinning reference count for the descriptor of the specified safe array by one. When that count reaches 0, the memory for that descriptor is no longer prevented from being freed.
%group
Win32 oleaut32
%prm
psa
psa : [var] The safe array for which the pinning reference count of the descriptor should decrease.
%inst
Decreases the pinning reference count for the descriptor of the
specified safe array by one. When that count reaches 0, the memory
for that descriptor is no longer prevented from being freed.

[備考]
A call to the SafeArrayReleaseDescriptor function should match every
previous call to the SafeArrayAddRef function.


%index
SafeArraySetIID
Sets the GUID of the interface for the specified safe array.
%group
Win32 oleaut32
%prm
psa, guid
psa : [var] The safe array descriptor.
guid : [var] The IID.
%inst
Sets the GUID of the interface for the specified safe array.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
SafeArraySetRecordInfo
Sets the record info in the specified safe array.
%group
Win32 oleaut32
%prm
psa, prinfo
psa : [var] The array descriptor.
prinfo : [var] The record info.
%inst
Sets the record info in the specified safe array.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
SafeArrayUnaccessData
Decrements the lock count of an array, and invalidates the pointer retrieved by SafeArrayAccessData.
%group
Win32 oleaut32
%prm
psa
psa : [var] An array descriptor created by SafeArrayCreate.
%inst
Decrements the lock count of an array, and invalidates the pointer
retrieved by SafeArrayAccessData.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
SafeArrayUnlock
Decrements the lock count of an array so it can be freed or resized.
%group
Win32 oleaut32
%prm
psa
psa : [var] An array descriptor created by SafeArrayCreate.
%inst
Decrements the lock count of an array so it can be freed or resized.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function is called after access to the data in an array is
finished.


%index
SetErrorInfo
Sets the error information object for the current logical thread of execution.
%group
Win32 oleaut32
%prm
dwReserved, perrinfo
dwReserved : [int] Reserved for future use. Must be zero.
perrinfo : [var] An error object.
%inst
Sets the error information object for the current logical thread of
execution.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
This function releases the existing error information object, if one
exists, and sets the pointer to perrinfo. Use this function after
creating an error object that associates the object with the current
logical thread of execution. If the property or method that calls
SetErrorInfo is called by DispInvoke, then DispInvoke will fill the
EXCEPINFO parameter with the values specified in the error
information object. DispInvoke will return DISP_E_EXCEPTION when the
property or method returns a failure return value for DispInvoke
Virtual function table (VTBL) binding controllers that do not use
IDispatch::Invoke can get the error information object by using
GetErrorInfo. This allows an object that supports a dual interface to
use SetErrorInfo, regardless of whether the client uses VTBL binding
or IDispatch.
When a cross apartment call is made COM clears out any error object.
Making a COM call that goes through a proxy-stub will clear any
existing error object for the calling thread. A called object should
not make any such calls after calling SetErrorInfo and before
returning. The caller should not make any such calls after the call
returns and before calling GetErrorInfo. As a rule of thumb, an
interface method should return as soon as possible after calling
SetErrorInfo, and the caller should call GetErrorInfo as soon as
possible after the call returns.
Entering the COM modal message loop will clear any existing error
object. A called object should not enter a message loop after calling
SetErrorInfo.


%index
SysAddRefString
Increases the pinning reference count for the specified string by one.
%group
Win32 oleaut32
%prm
bstrString
bstrString : [int] The string for which the pinning reference count should increase. While that count remains greater than 0, the memory for the string is prevented from being freed by calls to the SysFreeString function.
%inst
Increases the pinning reference count for the specified string by
one.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Strings with the BSTR data type have not traditionally had a
reference count. All existing usage of these strings will continue to
work with no changes. The SysAddRefString and SysReleaseString
functions add the ability to use reference counting to pin the string
into memory before calling from an untrusted script into an IDispatch
method that may not expect the script to free that memory before the
method returns, so that the script cannot force the code for that
method into accessing memory that has been freed. After such a method
safely returns, the pinning references should be released by calling
SysReleaseString.


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
Takes an ANSI string as input, and returns a BSTR that contains an ANSI string. Does not perform any ANSI-to-Unicode translation.
%group
Win32 oleaut32
%prm
psz, len
psz : [str] The string to copy, or NULL to keep the string uninitialized.
len : [int] The number of bytes to copy. A null character is placed afterwards, allocating a total of len plus the size of OLECHAR bytes.
%inst
Takes an ANSI string as input, and returns a BSTR that contains an
ANSI string. Does not perform any ANSI-to-Unicode translation.

[戻り値]
A copy of the string, or NULL if there is insufficient memory to
complete the operation.

[備考]
This function is provided to create BSTRs that contain binary data.
You can use this type of BSTR only in situations where it will not be
translated from ANSI to Unicode, or vice versa. For example, do not
use these BSTRs between a 16-bit and a 32-bit application running on
a 32-bit Windows system. The OLE 16-bit to 32-bit (and 32-bit to
16-bit) interoperability layer will translate the BSTR and corrupt
the binary data. The preferred method of passing binary data is to
use a SAFEARRAY of VT_UI1, which will not be translated by OLE. If
psz is Null, a string of the requested length is allocated, but not
initialized. The string psz can contain embedded null characters, and
does not need to end with a Null. Free the returned string later with
SysFreeString.


%index
SysAllocStringLen
Allocates a new string, copies the specified number of characters from the passed string, and appends a null-terminating character.
%group
Win32 oleaut32
%prm
strIn, ui
strIn : [wstr] The input string.
ui : [int] The number of characters to copy. A null character is placed afterwards, allocating a total of ui plus one characters.
%inst
Allocates a new string, copies the specified number of characters
from the passed string, and appends a null-terminating character.

[戻り値]
A copy of the string, or NULL if there is insufficient memory to
complete the operation.

[備考]
The string can contain embedded null characters and does not need to
end with a NULL. Free the returned string later with SysFreeString.
If strIn is not NULL, then the memory allocated to strIn must be at
least ui characters long. Note This function does not convert a char
* string into a Unicode BSTR.


%index
SysReAllocString
Reallocates a previously allocated string to be the size of a second string and copies the second string into the reallocated memory.
%group
Win32 oleaut32
%prm
pbstr, psz
pbstr : [var] The previously allocated string.
psz : [wstr] The string to copy.
%inst
Reallocates a previously allocated string to be the size of a second
string and copies the second string into the reallocated memory.

[戻り値]
This doc was truncated.

[備考]
The address passed in psz cannot be part of the string passed in
pbstr, or unexpected results may occur. If pbstr is NULL, there will
be an access violation and the program will crash. It is your
responsibility to protect this function against NULL pointers.


%index
SysReAllocStringLen
Creates a new BSTR containing a specified number of characters from an old BSTR, and frees the old BSTR.
%group
Win32 oleaut32
%prm
pbstr, psz, len
pbstr : [var] The previously allocated string.
psz : [wstr] The string from which to copy len characters, or NULL to keep the string uninitialized.
len : [int] The number of characters to copy. A null character is placed afterward, allocating a total of len plus one characters.
%inst
Creates a new BSTR containing a specified number of characters from
an old BSTR, and frees the old BSTR.

[戻り値]
This doc was truncated.

[備考]
Allocates a new string, copies len characters from the passed string
into it, and then appends a null character. Frees the BSTR referenced
currently by pbstr, and resets pbstr to point to the new BSTR. If psz
is null, a string of length len is allocated but not initialized. The
psz string can contain embedded null characters and does not need to
end with a null. If this function is passed a NULL pointer, there
will be an access violation and the program will crash. It is your
responsibility to protect this function against NULL pointers.


%index
SysReleaseString
Decreases the pinning reference count for the specified string by one. When that count reaches 0, the memory for that string is no longer prevented from being freed.
%group
Win32 oleaut32
%prm
bstrString
bstrString : [int] The string for which the  pinning reference count should decrease.
%inst
Decreases the pinning reference count for the specified string by
one. When that count reaches 0, the memory for that string is no
longer prevented from being freed.

[備考]
A call to the SysReleaseString function should match every previous
call to the SysAddRefString function.


%index
SysStringByteLen
Returns the length (in bytes) of a BSTR.
%group
Win32 oleaut32
%prm
bstr
bstr : [int] A previously allocated string.
%inst
Returns the length (in bytes) of a BSTR.

[戻り値]
The number of bytes in bstr, not including the terminating null
character. If bstr is null the return value is zero.

[備考]
The returned value may be different from strlen(bstr) if the BSTR
contains embedded null characters. This function always returns the
number of bytes specified in the len parameter of the
SysAllocStringByteLen function used to allocate the BSTR.


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
Converts a system time to a variant representation.
%group
Win32 oleaut32
%prm
lpSystemTime, pvtime
lpSystemTime : [var] The system time.
pvtime : [var] The variant time.
%inst
Converts a system time to a variant representation.

[戻り値]
The function returns TRUE on success and FALSE otherwise.

[備考]
A variant time is stored as an 8-byte real value (double),
representing a date between January 1, 100 and December 31, 9999,
inclusive. The value 2.0 represents January 1, 1900; 3.0 represents
January 2, 1900, and so on. Adding 1 to the value increments the date
by a day. The fractional part of the value represents the time of
day. Therefore, 2.5 represents noon on January 1, 1900; 3.25
represents 6:00 A.M. on January 2, 1900, and so on. Negative numbers
represent dates prior to December 30, 1899. The variant time resolves
to one second. Any milliseconds in the input date are ignored. >
[!NOTE] > When working with variant time, be mindful of the
additional day added in leap years, which might produce unexpected
results if unhandled. For more information, see [leap year
readiness](https://techcommunity.microsoft.com/t5/azure-developer-community-blog/it-s-2020-is-your-code-ready-for-leap-day/ba-p/1157279).
The SYSTEMTIME structure is useful for the following reasons:
This doc was truncated.


%index
UnRegisterTypeLib
Removes type library information from the system registry. Use this API to allow applications to properly uninstall themselves.
%group
Win32 oleaut32
%prm
libID, wVerMajor, wVerMinor, lcid, syskind
libID : [var] The GUID of the type library.
wVerMajor : [int] The major version of the type library.
wVerMinor : [int] The minor version of the type library.
lcid : [int] The locale identifier.
syskind : [int] The target operating system.
%inst
Removes type library information from the system registry. Use this
API to allow applications to properly uninstall themselves.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
In-process objects typically call this API from DllUnregisterServer.


%index
UnRegisterTypeLibForUser
Removes type library information that was registered by using RegisterTypeLibForUser.
%group
Win32 oleaut32
%prm
libID, wMajorVerNum, wMinorVerNum, lcid, syskind
libID : [var] The GUID of the library.
wMajorVerNum : [int] The major version of the type library.
wMinorVerNum : [int] The minor version of the type library.
lcid : [int] The locale identifier.
syskind : [int] The target operating system.
%inst
Removes type library information that was registered by using
RegisterTypeLibForUser.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
Use UnRegisterTypeLibForUser to remove type library information for
type libraries that were registered using the RegisterTypeLibForUser
function.


%index
VARIANT_UserFree
Frees resources on the server side when called by RPC stub files. (VARIANT_UserFree)
%group
Win32 oleaut32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
Frees resources on the server side when called by RPC stub files.
(VARIANT_UserFree)


%index
VARIANT_UserFree64
Frees resources on the server side when called by RPC stub files. (VARIANT_UserFree64)
%group
Win32 oleaut32
%prm
param0, param1
param0 : [var] 
param1 : [var] 
%inst
Frees resources on the server side when called by RPC stub files.
(VARIANT_UserFree64)


%index
VARIANT_UserMarshal
Marshals a VARIANT object into the RPC buffer. (VARIANT_UserMarshal)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
Marshals a VARIANT object into the RPC buffer. (VARIANT_UserMarshal)

[戻り値]
The value obtained from the returned HRESULT value is one of the
following.
This doc was truncated.


%index
VARIANT_UserMarshal64
Marshals a VARIANT object into the RPC buffer. (VARIANT_UserMarshal64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
Marshals a VARIANT object into the RPC buffer.
(VARIANT_UserMarshal64)

[戻り値]
The value obtained from the returned HRESULT value is one of the
following.
This doc was truncated.


%index
VARIANT_UserSize
Calculates the wire size of the VARIANT object, and gets its handle and data. (VARIANT_UserSize)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
Calculates the wire size of the VARIANT object, and gets its handle
and data. (VARIANT_UserSize)

[戻り値]
The value obtained from the returned HRESULT value is S_OK.


%index
VARIANT_UserSize64
Calculates the wire size of the VARIANT object, and gets its handle and data. (VARIANT_UserSize64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [int] 
param2 : [var] 
%inst
Calculates the wire size of the VARIANT object, and gets its handle
and data. (VARIANT_UserSize64)

[戻り値]
The value obtained from the returned HRESULT value is S_OK.


%index
VARIANT_UserUnmarshal
Unmarshals a VARIANT object from the RPC buffer. (VARIANT_UserUnmarshal)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
Unmarshals a VARIANT object from the RPC buffer.
(VARIANT_UserUnmarshal)

[戻り値]
The value obtained from the returned HRESULT value is one of the
following.
This doc was truncated.


%index
VARIANT_UserUnmarshal64
Unmarshals a VARIANT object from the RPC buffer. (VARIANT_UserUnmarshal64)
%group
Win32 oleaut32
%prm
param0, param1, param2
param0 : [var] 
param1 : [var] 
param2 : [var] 
%inst
Unmarshals a VARIANT object from the RPC buffer.
(VARIANT_UserUnmarshal64)

[戻り値]
The value obtained from the returned HRESULT value is one of the
following.
This doc was truncated.


%index
VarAbs
Returns the absolute value of a variant.
%group
Win32 oleaut32
%prm
pvarIn, pvarResult
pvarIn : [var] The variant.
pvarResult : [var] The result variant.
%inst
Returns the absolute value of a variant.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarAdd
Returns the sum of two variants.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
pvarResult : [var] The result variant.
%inst
Returns the sum of two variants.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function operates as follows.
This doc was truncated.


%index
VarAnd
Performs a bitwise And operation between two variants of any integral type.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
pvarResult : [var] The result variant.
%inst
Performs a bitwise And operation between two variants of any integral
type.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function operates as follows.
This doc was truncated.


%index
VarBoolFromCy
Converts a currency value to a Boolean value.
%group
Win32 oleaut32
%prm
cyIn, pboolOut
cyIn : [var] The value to convert.
pboolOut : [var] The resulting value.
%inst
Converts a currency value to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromDate
Converts a date value to a Boolean value.
%group
Win32 oleaut32
%prm
dateIn, pboolOut
dateIn : [double] The value to convert.
pboolOut : [var] The resulting value.
%inst
Converts a date value to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromDec
Converts a decimal value to a Boolean value.
%group
Win32 oleaut32
%prm
pdecIn, pboolOut
pdecIn : [var] The value to convert.
pboolOut : [var] The resulting value.
%inst
Converts a decimal value to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromDisp
Converts the default property of an IDispatch instance to a Boolean value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, pboolOut
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
pboolOut : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to a Boolean
value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromI1
Converts a char value to a Boolean value.
%group
Win32 oleaut32
%prm
cIn, pboolOut
cIn : [int] The value to convert.
pboolOut : [var] The resulting value.
%inst
Converts a char value to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromI2
Converts a short value to a Boolean value.
%group
Win32 oleaut32
%prm
sIn, pboolOut
sIn : [int] The value to convert.
pboolOut : [var] The resulting value.
%inst
Converts a short value to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromI4
Converts a long value to a Boolean value.
%group
Win32 oleaut32
%prm
lIn, pboolOut
lIn : [int] The value to convert.
pboolOut : [var] The resulting value.
%inst
Converts a long value to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromI8
Converts an 8-byte integer value to a Boolean value.
%group
Win32 oleaut32
%prm
i64In, pboolOut
i64In : [int64] The value to convert.
pboolOut : [var] The resulting value.
%inst
Converts an 8-byte integer value to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromR4
Converts a float value to a Boolean value.
%group
Win32 oleaut32
%prm
fltIn, pboolOut
fltIn : [float] The value to convert.
pboolOut : [var] The resulting value.
%inst
Converts a float value to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromR8
Converts a double value to a Boolean value.
%group
Win32 oleaut32
%prm
dblIn, pboolOut
dblIn : [double] The value to convert.
pboolOut : [var] The resulting value.
%inst
Converts a double value to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromStr
Converts an OLECHAR string to a Boolean value.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pboolOut
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pboolOut : [var] The resulting value.
%inst
Converts an OLECHAR string to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromUI1
Converts an unsigned char value to a Boolean value.
%group
Win32 oleaut32
%prm
bIn, pboolOut
bIn : [int] The value to convert.
pboolOut : [var] The resulting value.
%inst
Converts an unsigned char value to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromUI2
Converts an unsigned short value to a Boolean value.
%group
Win32 oleaut32
%prm
uiIn, pboolOut
uiIn : [int] The value to convert.
pboolOut : [var] The resulting value.
%inst
Converts an unsigned short value to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromUI4
Converts an unsigned long value to a Boolean value.
%group
Win32 oleaut32
%prm
ulIn, pboolOut
ulIn : [int] The value to convert.
pboolOut : [var] The resulting value.
%inst
Converts an unsigned long value to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBoolFromUI8
Converts an 8-byte unsigned integer value to a Boolean value.
%group
Win32 oleaut32
%prm
i64In, pboolOut
i64In : [int64] The value to convert.
pboolOut : [var] The resulting value.
%inst
Converts an 8-byte unsigned integer value to a Boolean value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrCat
Concatenates two variants of type BSTR and returns the resulting BSTR.
%group
Win32 oleaut32
%prm
bstrLeft, bstrRight, pbstrResult
bstrLeft : [int] The first variant.
bstrRight : [int] The second variant.
pbstrResult : [var] The result.
%inst
Concatenates two variants of type BSTR and returns the resulting
BSTR.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarBstrCmp
Compares two variants of type BSTR.
%group
Win32 oleaut32
%prm
bstrLeft, bstrRight, lcid, dwFlags
bstrLeft : [int] The first variant.
bstrRight : [int] The second variant.
lcid : [int] The locale identifier of the program to determine whether UNICODE or ANSI strings are being used.
dwFlags : [int] The following are compare results flags.
%inst
Compares two variants of type BSTR.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function will not compare arrays or records.


%index
VarBstrFromBool
Converts a Boolean value to a BSTR value.
%group
Win32 oleaut32
%prm
boolIn, lcid, dwFlags, pbstrOut
boolIn : [int] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pbstrOut : [var] The resulting value.
%inst
Converts a Boolean value to a BSTR value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromCy
Converts a currency value to a BSTR value.
%group
Win32 oleaut32
%prm
cyIn, lcid, dwFlags, pbstrOut
cyIn : [var] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pbstrOut : [var] The resulting value.
%inst
Converts a currency value to a BSTR value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromDate
Converts a date value to a BSTR value.
%group
Win32 oleaut32
%prm
dateIn, lcid, dwFlags, pbstrOut
dateIn : [double] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pbstrOut : [var] The resulting value.
%inst
Converts a date value to a BSTR value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromDec
Converts a decimal value to a BSTR value.
%group
Win32 oleaut32
%prm
pdecIn, lcid, dwFlags, pbstrOut
pdecIn : [var] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pbstrOut : [var] The resulting value.
%inst
Converts a decimal value to a BSTR value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromDisp
Converts the default property of an IDispatch instance to a BSTR value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, dwFlags, pbstrOut
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] Reserved. Set to zero.
pbstrOut : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to a BSTR
value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromI1
Converts a char value to a BSTR value.
%group
Win32 oleaut32
%prm
cIn, lcid, dwFlags, pbstrOut
cIn : [int] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] Reserved. Set to zero.
pbstrOut : [var] The resulting value.
%inst
Converts a char value to a BSTR value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromI2
Converts a short value to a BSTR value.
%group
Win32 oleaut32
%prm
iVal, lcid, dwFlags, pbstrOut
iVal : [int] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] Reserved. Set to zero.
pbstrOut : [var] The resulting value.
%inst
Converts a short value to a BSTR value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromI4
Converts a long value to a BSTR value.
%group
Win32 oleaut32
%prm
lIn, lcid, dwFlags, pbstrOut
lIn : [int] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] Reserved. Set to zero.
pbstrOut : [var] The resulting value.
%inst
Converts a long value to a BSTR value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromI8
Converts an 8-byte unsigned integer value to a BSTR value. (VarBstrFromI8)
%group
Win32 oleaut32
%prm
i64In, lcid, dwFlags, pbstrOut
i64In : [int64] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] Reserved. Set to zero.
pbstrOut : [var] The resulting value.
%inst
Converts an 8-byte unsigned integer value to a BSTR value.
(VarBstrFromI8)

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromR4
Converts a float value to a BSTR value.
%group
Win32 oleaut32
%prm
fltIn, lcid, dwFlags, pbstrOut
fltIn : [float] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pbstrOut : [var] The resulting value.
%inst
Converts a float value to a BSTR value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromR8
Converts a double value to a BSTR value.
%group
Win32 oleaut32
%prm
dblIn, lcid, dwFlags, pbstrOut
dblIn : [double] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pbstrOut : [var] The resulting value.
%inst
Converts a double value to a BSTR value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromUI1
Converts an unsigned char value to a BSTR value.
%group
Win32 oleaut32
%prm
bVal, lcid, dwFlags, pbstrOut
bVal : [int] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pbstrOut : [var] The resulting value.
%inst
Converts an unsigned char value to a BSTR value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromUI2
Converts an unsigned short value to a BSTR value.
%group
Win32 oleaut32
%prm
uiIn, lcid, dwFlags, pbstrOut
uiIn : [int] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pbstrOut : [var] The resulting value.
%inst
Converts an unsigned short value to a BSTR value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromUI4
Converts an unsigned long value to a BSTR value.
%group
Win32 oleaut32
%prm
ulIn, lcid, dwFlags, pbstrOut
ulIn : [int] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] Reserved. Set to zero.
pbstrOut : [var] The resulting value.
%inst
Converts an unsigned long value to a BSTR value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarBstrFromUI8
Converts an 8-byte unsigned integer value to a BSTR value. (VarBstrFromUI8)
%group
Win32 oleaut32
%prm
ui64In, lcid, dwFlags, pbstrOut
ui64In : [int64] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] Reserved. Set to zero.
pbstrOut : [var] The resulting value.
%inst
Converts an 8-byte unsigned integer value to a BSTR value.
(VarBstrFromUI8)

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCat
Concatenates two variants and returns the result.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
pvarResult : [var] The result variant.
%inst
Concatenates two variants and returns the result.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function operates as follows.
This doc was truncated.


%index
VarCmp
Compares two variants.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, lcid, dwFlags
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
lcid : [int] The locale identifier.
dwFlags : [int] The compare results option.
%inst
Compares two variants.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
The function only compares the value of the variant types. It
compares strings, integers, and floating points, but not arrays or
records. NORM_IGNOREWIDTH causes VarCmp to ignore the difference
between half-width and full-width characters, as the following
example demonstrates: "Ｃａｔ"== "cat" The full-width form is a
formatting distinction used in Chinese and Japanese scripts.


%index
VarCyAbs
Retrieves the absolute value of a variant of type currency.
%group
Win32 oleaut32
%prm
cyIn, pcyResult
cyIn : [var] The currency variant.
pcyResult : [var] The resulting variant.
%inst
Retrieves the absolute value of a variant of type currency.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarCyAdd
Adds two variants of type currency.
%group
Win32 oleaut32
%prm
cyLeft, cyRight, pcyResult
cyLeft : [var] The first variant.
cyRight : [var] The second variant.
pcyResult : [var] The resulting variant.
%inst
Adds two variants of type currency.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarCyCmp
Compares two variants of type currency.
%group
Win32 oleaut32
%prm
cyLeft, cyRight
cyLeft : [var] The first variant.
cyRight : [var] The second variant.
%inst
Compares two variants of type currency.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyCmpR8
Compares a variant of type currency with a value of type double.
%group
Win32 oleaut32
%prm
cyLeft, dblRight
cyLeft : [var] The first variant.
dblRight : [double] The second variant.
%inst
Compares a variant of type currency with a value of type double.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFix
Retrieves the integer portion of a variant of type currency. (VarCyFix)
%group
Win32 oleaut32
%prm
cyIn, pcyResult
cyIn : [var] The currency variant.
pcyResult : [var] The resulting variant. If the variant is negative, then the first negative integer greater than or equal to the variant is returned.
%inst
Retrieves the integer portion of a variant of type currency.
(VarCyFix)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarCyFromBool
Converts a Boolean value to a currency value.
%group
Win32 oleaut32
%prm
boolIn, pcyOut
boolIn : [int] The value to convert.
pcyOut : [var] The resulting value.
%inst
Converts a Boolean value to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromDate
Converts a date value to a currency value.
%group
Win32 oleaut32
%prm
dateIn, pcyOut
dateIn : [double] The value to convert.
pcyOut : [var] The resulting value.
%inst
Converts a date value to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromDec
Converts a decimal value to a currency value.
%group
Win32 oleaut32
%prm
pdecIn, pcyOut
pdecIn : [var] The value to convert.
pcyOut : [var] The resulting value.
%inst
Converts a decimal value to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromDisp
Converts the default property of an IDispatch instance to a currency value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, pcyOut
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
pcyOut : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to a currency
value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromI1
Converts a char value to a currency value.
%group
Win32 oleaut32
%prm
cIn, pcyOut
cIn : [int] The value to convert.
pcyOut : [var] The resulting value.
%inst
Converts a char value to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromI2
Converts a short value to a currency value.
%group
Win32 oleaut32
%prm
sIn, pcyOut
sIn : [int] The value to convert.
pcyOut : [var] The resulting value.
%inst
Converts a short value to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromI4
Converts a long value to a currency value.
%group
Win32 oleaut32
%prm
lIn, pcyOut
lIn : [int] The value to convert.
pcyOut : [var] The resulting value.
%inst
Converts a long value to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromI8
Converts an 8-byte integer value to a currency value.
%group
Win32 oleaut32
%prm
i64In, pcyOut
i64In : [int64] The value to convert.
pcyOut : [var] The resulting value.
%inst
Converts an 8-byte integer value to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromR4
Converts a float value to a currency value.
%group
Win32 oleaut32
%prm
fltIn, pcyOut
fltIn : [float] The value to convert.
pcyOut : [var] The resulting value.
%inst
Converts a float value to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromR8
Converts a double value to a currency value.
%group
Win32 oleaut32
%prm
dblIn, pcyOut
dblIn : [double] The value to convert.
pcyOut : [var] The resulting value.
%inst
Converts a double value to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromStr
Converts an OLECHAR string to a currency value.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pcyOut
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One of more of the following flags.
pcyOut : [var] The resulting value.
%inst
Converts an OLECHAR string to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromUI1
Converts an unsigned char value to a currency value.
%group
Win32 oleaut32
%prm
bIn, pcyOut
bIn : [int] The value to convert.
pcyOut : [var] The resulting value.
%inst
Converts an unsigned char value to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromUI2
Converts an unsigned short value to a currency value.
%group
Win32 oleaut32
%prm
uiIn, pcyOut
uiIn : [int] The value to convert.
pcyOut : [var] The resulting value.
%inst
Converts an unsigned short value to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromUI4
Converts an unsigned long value to a currency value.
%group
Win32 oleaut32
%prm
ulIn, pcyOut
ulIn : [int] The value to convert.
pcyOut : [var] The resulting value.
%inst
Converts an unsigned long value to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyFromUI8
Converts an 8-byte unsigned integer value to a currency value.
%group
Win32 oleaut32
%prm
ui64In, pcyOut
ui64In : [int64] The value to convert.
pcyOut : [var] The resulting value.
%inst
Converts an 8-byte unsigned integer value to a currency value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarCyInt
Retrieves the integer portion of a variant of type currency. (VarCyInt)
%group
Win32 oleaut32
%prm
cyIn, pcyResult
cyIn : [var] The currency variant.
pcyResult : [var] The resulting variant. If the variant is negative then the first negative integer less than or equal to the variant is returned.
%inst
Retrieves the integer portion of a variant of type currency.
(VarCyInt)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarCyMul
Multiplies two variants of type currency.
%group
Win32 oleaut32
%prm
cyLeft, cyRight, pcyResult
cyLeft : [var] The first variant
cyRight : [var] The second variant.
pcyResult : [var] The resulting variant.
%inst
Multiplies two variants of type currency.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
If any of the fields of cyLeft or cyRight is left uninitialized, it
may default to a large value causing DISP_E_OVERFLOW.


%index
VarCyMulI4
Multiplies a currency value by a 32-bit integer.
%group
Win32 oleaut32
%prm
cyLeft, lRight, pcyResult
cyLeft : [var] The first variant.
lRight : [int] The second variant.
pcyResult : [var] The resulting variant.
%inst
Multiplies a currency value by a 32-bit integer.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarCyMulI8
Multiplies a currency value by a 64-bit integer.
%group
Win32 oleaut32
%prm
cyLeft, lRight, pcyResult
cyLeft : [var] The first variant.
lRight : [int64] The second variant.
pcyResult : [var] The resulting variant.
%inst
Multiplies a currency value by a 64-bit integer.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarCyNeg
Performs a logical negation on a variant of type currency.
%group
Win32 oleaut32
%prm
cyIn, pcyResult
cyIn : [var] The variant to negate.
pcyResult : [var] The resulting variant.
%inst
Performs a logical negation on a variant of type currency.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarCyRound
Rounds a variant of type currency to the specified number of decimal places.
%group
Win32 oleaut32
%prm
cyIn, cDecimals, pcyResult
cyIn : [var] The variant to round.
cDecimals : [int] The number of currency decimals.
pcyResult : [var] The resulting variant.
%inst
Rounds a variant of type currency to the specified number of decimal
places.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarCySub
Subtracts two variants of type currency.
%group
Win32 oleaut32
%prm
cyLeft, cyRight, pcyResult
cyLeft : [var] The first variant.
cyRight : [var] The second variant.
pcyResult : [var] The resulting variant.
%inst
Subtracts two variants of type currency.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarDateFromBool
Converts a Boolean value to a date value.
%group
Win32 oleaut32
%prm
boolIn, pdateOut
boolIn : [int] The value to convert.
pdateOut : [var] The resulting value.
%inst
Converts a Boolean value to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromCy
Converts a currency value to a date value.
%group
Win32 oleaut32
%prm
cyIn, pdateOut
cyIn : [var] The value to convert.
pdateOut : [var] The resulting value.
%inst
Converts a currency value to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromDec
Converts a decimal value to a date value.
%group
Win32 oleaut32
%prm
pdecIn, pdateOut
pdecIn : [var] The value to convert.
pdateOut : [var] The resulting value.
%inst
Converts a decimal value to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromDisp
Converts the default property of an IDispatch instance to a date value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, pdateOut
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
pdateOut : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to a date
value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromI1
Converts a char value to a date value.
%group
Win32 oleaut32
%prm
cIn, pdateOut
cIn : [int] The value to convert.
pdateOut : [var] The resulting value.
%inst
Converts a char value to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromI2
Converts a short value to a date value.
%group
Win32 oleaut32
%prm
sIn, pdateOut
sIn : [int] The value to convert.
pdateOut : [var] The resulting value.
%inst
Converts a short value to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromI4
Converts a long value to a date value.
%group
Win32 oleaut32
%prm
lIn, pdateOut
lIn : [int] The value to convert.
pdateOut : [var] The resulting value.
%inst
Converts a long value to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromI8
Converts an 8-byte unsigned integer value to a date value.
%group
Win32 oleaut32
%prm
i64In, pdateOut
i64In : [int64] The value to convert.
pdateOut : [var] The resulting value.
%inst
Converts an 8-byte unsigned integer value to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromR4
Converts a float value to a date value.
%group
Win32 oleaut32
%prm
fltIn, pdateOut
fltIn : [float] The value to convert.
pdateOut : [var] The resulting value.
%inst
Converts a float value to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromR8
Converts a double value to a date value.
%group
Win32 oleaut32
%prm
dblIn, pdateOut
dblIn : [double] The value to convert.
pdateOut : [var] The resulting value.
%inst
Converts a double value to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromStr
Converts an OLECHAR string to a date value.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pdateOut
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pdateOut : [var] The resulting value.
%inst
Converts an OLECHAR string to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromUI1
Converts an unsigned char value to a date value.
%group
Win32 oleaut32
%prm
bIn, pdateOut
bIn : [int] The value to convert.
pdateOut : [var] The resulting value.
%inst
Converts an unsigned char value to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromUI2
Converts an unsigned short value to a date value.
%group
Win32 oleaut32
%prm
uiIn, pdateOut
uiIn : [int] The value to convert.
pdateOut : [var] The resulting value.
%inst
Converts an unsigned short value to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromUI4
Converts an unsigned long value to a date value.
%group
Win32 oleaut32
%prm
ulIn, pdateOut
ulIn : [int] The value to convert.
pdateOut : [var] The resulting value.
%inst
Converts an unsigned long value to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromUI8
Converts an 8-byte unsigned value to a date value.
%group
Win32 oleaut32
%prm
ui64In, pdateOut
ui64In : [int64] The value to convert.
pdateOut : [var] The resulting value.
%inst
Converts an 8-byte unsigned value to a date value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDateFromUdate
Converts a time and date converted from MS-DOS format to variant format. (VarDateFromUdate)
%group
Win32 oleaut32
%prm
pudateIn, dwFlags, pdateOut
pudateIn : [var] The unpacked date.
dwFlags : [int] VAR_VALIDDATE if the date is valid.
pdateOut : [var] The packed date.
%inst
Converts a time and date converted from MS-DOS format to variant
format. (VarDateFromUdate)

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
The UDATE structure is used with VarDateFromUdate,
VarDateFromUdateEx, and VarUdateFromDate. It represents an unpacked
date.
This doc was truncated.


%index
VarDateFromUdateEx
Converts a time and date converted from MS-DOS format to variant format. (VarDateFromUdateEx)
%group
Win32 oleaut32
%prm
pudateIn, lcid, dwFlags, pdateOut
pudateIn : [var] The unpacked date.
lcid : [int] The locale identifier.
dwFlags : [int] VAR_VALIDDATE if the date is valid.
pdateOut : [var] The packed date.
%inst
Converts a time and date converted from MS-DOS format to variant
format. (VarDateFromUdateEx)

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
The UDATE structure is used with VarDateFromUdateEx,
VarDateFromUdate, and VarUdateFromDate. It represents an unpacked
date.
This doc was truncated.


%index
VarDecAbs
Retrieves the absolute value of a variant of type decimal.
%group
Win32 oleaut32
%prm
pdecIn, pdecResult
pdecIn : [var] The first variant.
pdecResult : [var] The second variant.
%inst
Retrieves the absolute value of a variant of type decimal.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarDecAdd
Adds two variants of type decimal.
%group
Win32 oleaut32
%prm
pdecLeft, pdecRight, pdecResult
pdecLeft : [var] The first variant.
pdecRight : [var] The second variant.
pdecResult : [var] The resulting variant.
%inst
Adds two variants of type decimal.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarDecCmp
Compares two variants of type decimal.
%group
Win32 oleaut32
%prm
pdecLeft, pdecRight
pdecLeft : [var] The first variant.
pdecRight : [var] The second variant.
%inst
Compares two variants of type decimal.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecCmpR8
Compares a variant of type decimal with the a value of type double.
%group
Win32 oleaut32
%prm
pdecLeft, dblRight
pdecLeft : [var] The first variant.
dblRight : [double] The second variant.
%inst
Compares a variant of type decimal with the a value of type double.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecDiv
Divides two variants of type decimal.
%group
Win32 oleaut32
%prm
pdecLeft, pdecRight, pdecResult
pdecLeft : [var] The first decimal variant.
pdecRight : [var] The second decimal variant.
pdecResult : [var] The resulting decimal variant.
%inst
Divides two variants of type decimal.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarDecFix
Retrieves the integer portion of a variant of type decimal. (VarDecFix)
%group
Win32 oleaut32
%prm
pdecIn, pdecResult
pdecIn : [var] The decimal variant.
pdecResult : [var] The resulting variant. If the variant is negative, then the first negative integer greater than or equal to the variant is returned.
%inst
Retrieves the integer portion of a variant of type decimal.
(VarDecFix)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarDecFromBool
Converts a Boolean value to a decimal value.
%group
Win32 oleaut32
%prm
boolIn, pdecOut
boolIn : [int] The value to convert.
pdecOut : [var] The resulting value.
%inst
Converts a Boolean value to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromCy
Converts a currency value to a decimal value.
%group
Win32 oleaut32
%prm
cyIn, pdecOut
cyIn : [var] The value to convert.
pdecOut : [var] The resulting value.
%inst
Converts a currency value to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromDate
Converts a date value to a decimal value.
%group
Win32 oleaut32
%prm
dateIn, pdecOut
dateIn : [double] The value to convert.
pdecOut : [var] The resulting value.
%inst
Converts a date value to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromDisp
Converts the default property of an IDispatch instance to a decimal value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, pdecOut
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
pdecOut : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to a decimal
value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromI1
Converts a char value to a decimal value.
%group
Win32 oleaut32
%prm
cIn, pdecOut
cIn : [int] The value to convert.
pdecOut : [var] The resulting value.
%inst
Converts a char value to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromI2
Converts a short value to a decimal value.
%group
Win32 oleaut32
%prm
uiIn, pdecOut
uiIn : [int] The value to convert.
pdecOut : [var] The resulting value.
%inst
Converts a short value to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromI4
Converts a long value to a decimal value.
%group
Win32 oleaut32
%prm
lIn, pdecOut
lIn : [int] The value to convert.
pdecOut : [var] The resulting value.
%inst
Converts a long value to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromI8
Converts an 8-byte integer value to a decimal value.
%group
Win32 oleaut32
%prm
i64In, pdecOut
i64In : [int64] The value to convert.
pdecOut : [var] The resulting value.
%inst
Converts an 8-byte integer value to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromR4
Converts a float value to a decimal value.
%group
Win32 oleaut32
%prm
fltIn, pdecOut
fltIn : [float] The value to convert.
pdecOut : [var] The resulting value.
%inst
Converts a float value to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromR8
Converts a double value to a decimal value.
%group
Win32 oleaut32
%prm
dblIn, pdecOut
dblIn : [double] The value to convert.
pdecOut : [var] The resulting value.
%inst
Converts a double value to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromStr
Converts an OLECHAR string to a decimal value.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pdecOut
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pdecOut : [var] The resulting value.
%inst
Converts an OLECHAR string to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromUI1
Converts an unsigned char value to a decimal value.
%group
Win32 oleaut32
%prm
bIn, pdecOut
bIn : [int] The value to convert.
pdecOut : [var] The resulting value.
%inst
Converts an unsigned char value to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromUI2
Converts an unsigned short value to a decimal value.
%group
Win32 oleaut32
%prm
uiIn, pdecOut
uiIn : [int] The value to convert.
pdecOut : [var] The resulting value.
%inst
Converts an unsigned short value to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromUI4
Converts an unsigned long value to a decimal value.
%group
Win32 oleaut32
%prm
ulIn, pdecOut
ulIn : [int] The value to convert.
pdecOut : [var] The resulting value.
%inst
Converts an unsigned long value to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecFromUI8
Converts an 8-byte unsigned integer value to a decimal value.
%group
Win32 oleaut32
%prm
ui64In, pdecOut
ui64In : [int64] The value to convert.
pdecOut : [var] The resulting value.
%inst
Converts an 8-byte unsigned integer value to a decimal value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarDecInt
Retrieves the integer portion of a variant of type decimal. (VarDecInt)
%group
Win32 oleaut32
%prm
pdecIn, pdecResult
pdecIn : [var] The decimal variant.
pdecResult : [var] The resulting variant. If the variant is negative, then the first negative integer less than or equal to the variant is returned.
%inst
Retrieves the integer portion of a variant of type decimal.
(VarDecInt)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarDecMul
Multiplies two variants of type decimal.
%group
Win32 oleaut32
%prm
pdecLeft, pdecRight, pdecResult
pdecLeft : [var] The first variant.
pdecRight : [var] The second variant.
pdecResult : [var] The resulting variant.
%inst
Multiplies two variants of type decimal.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarDecNeg
Performs logical negation on a variant of type decimal.
%group
Win32 oleaut32
%prm
pdecIn, pdecResult
pdecIn : [var] The variant to negate.
pdecResult : [var] The resulting variant.
%inst
Performs logical negation on a variant of type decimal.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarDecRound
Rounds a variant of type decimal to the specified number of decimal places.
%group
Win32 oleaut32
%prm
pdecIn, cDecimals, pdecResult
pdecIn : [var] The variant to round.
cDecimals : [int] The number of decimal places.
pdecResult : [var] The resulting variant.
%inst
Rounds a variant of type decimal to the specified number of decimal
places.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarDecSub
Subtracts two variants of type decimal.
%group
Win32 oleaut32
%prm
pdecLeft, pdecRight, pdecResult
pdecLeft : [var] The first variant.
pdecRight : [var] The second variant.
pdecResult : [var] The resulting variant.
%inst
Subtracts two variants of type decimal.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarDiv
Returns the result from dividing two variants.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
pvarResult : [var] The result variant.
%inst
Returns the result from dividing two variants.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function operates as follows.
This doc was truncated.


%index
VarEqv
Performs a bitwise equivalence on two variants.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
pvarResult : [var] The result variant.
%inst
Performs a bitwise equivalence on two variants.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
If each bit in pvarLeft is equal to the corresponding bit in
pvarRight then TRUE is returned. Otherwise FALSE is returned.


%index
VarFix
Returns the integer portion of a variant. (VarFix)
%group
Win32 oleaut32
%prm
pvarIn, pvarResult
pvarIn : [var] The variant.
pvarResult : [var] The result variant.
%inst
Returns the integer portion of a variant. (VarFix)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
If the variant is negative, then the first negative integer greater
than or equal to the variant is returned.


%index
VarFormat
Formats a variant into string form by parsing a format string.
%group
Win32 oleaut32
%prm
pvarIn, pstrFormat, iFirstDay, iFirstWeek, dwFlags, pbstrOut
pvarIn : [var] The variant.
pstrFormat : [wstr] The format string. For example "mm-dd-yy".
iFirstDay : [int] First day of the week.
iFirstWeek : [int] First week of the year.
dwFlags : [int] Flags that control the formatting process. The only flags that can be set are VAR_CALENDAR_HIJRI or VAR_FORMAT_NOSUBSTITUTE.
pbstrOut : [var] The formatted string that represents the variant.
%inst
Formats a variant into string form by parsing a format string.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function uses the user's default locale while calling
VarTokenizeFormatString and VarFormatFromTokens.


%index
VarFormatCurrency
Formats a variant containing currency values into a string form.
%group
Win32 oleaut32
%prm
pvarIn, iNumDig, iIncLead, iUseParens, iGroup, dwFlags, pbstrOut
pvarIn : [var] The variant.
iNumDig : [int] The number of digits to pad to after the decimal point. Specify -1 to use the system default value.
iIncLead : [int] Specifies whether to include the leading digit on numbers.
iUseParens : [int] Specifies whether negative numbers should use parentheses.
iGroup : [int] Specifies whether thousands should be grouped. For example 10,000 versus 10000. Note??Regular numbers and currencies have separate system defaults for all the above options.
dwFlags : [int] VAR_CALENDAR_HIJRI is the only flag that can be set.
pbstrOut : [var] The formatted string that represents the variant.
%inst
Formats a variant containing currency values into a string form.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function uses the user's default locale while calling
VarTokenizeFormatString and VarFormatFromTokens.


%index
VarFormatDateTime
Formats a variant containing named date and time information into a string.
%group
Win32 oleaut32
%prm
pvarIn, iNamedFormat, dwFlags, pbstrOut
pvarIn : [var] The variant containing the value to format.
iNamedFormat : [int] The named date formats are as follows.
dwFlags : [int] VAR_CALENDAR_HIJRI is the only flag that can be set.
pbstrOut : [var] Receives the formatted string that represents the variant.
%inst
Formats a variant containing named date and time information into a
string.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function uses the user's default locale while calling
VarTokenizeFormatString and VarFormatFromTokens.


%index
VarFormatFromTokens
Takes a tokenized format string and applies it to a variant to produce a formatted output string.
%group
Win32 oleaut32
%prm
pvarIn, pstrFormat, pbTokCur, dwFlags, pbstrOut, lcid
pvarIn : [var] The variant containing the value to format.
pstrFormat : [wstr] The original format string.
pbTokCur : [var] The tokenized format string from VarTokenizeFormatString.
dwFlags : [int] The only flags that can be set are VAR_CALENDAR_HIJRI or VAR_FORMAT_NOSUBSTITUTE.
pbstrOut : [var] The formatted output string.
lcid : [int] The locale to use for the formatted output string.
%inst
Takes a tokenized format string and applies it to a variant to
produce a formatted output string.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
The locale lcid controls the formatted output string.


%index
VarFormatNumber
Formats a variant containing numbers into a string form.
%group
Win32 oleaut32
%prm
pvarIn, iNumDig, iIncLead, iUseParens, iGroup, dwFlags, pbstrOut
pvarIn : [var] The variant containing the value to format.
iNumDig : [int] The number of digits to pad to after the decimal point. Specify -1 to use the system default value.
iIncLead : [int] Specifies whether to include the leading digit on numbers.
iUseParens : [int] Specifies whether negative numbers should use parentheses.
iGroup : [int] Specifies whether thousands should be grouped. For example 10,000 versus 10000. Note??Regular numbers and currencies have separate system defaults for all the above options.
dwFlags : [int] VAR_CALENDAR_HIJRI is the only flag that can be set.
pbstrOut : [var] Points to the formatted string that represents the variant.
%inst
Formats a variant containing numbers into a string form.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function uses the user's default locale while calling
VarTokenizeFormatString and VarFormatFromTokens.


%index
VarFormatPercent
Formats a variant containing percentages into a string form.
%group
Win32 oleaut32
%prm
pvarIn, iNumDig, iIncLead, iUseParens, iGroup, dwFlags, pbstrOut
pvarIn : [var] The variant containing the value to format.
iNumDig : [int] The number of digits to pad to after the decimal point. Specify -1 to use the system default value.
iIncLead : [int] Specifies whether to include the leading digit on numbers.
iUseParens : [int] Specifies whether negative numbers should use parentheses.
iGroup : [int] Specifies whether thousands should be grouped. For example 10,000 versus 10000. Note??Regular numbers and currencies have separate system defaults for all the above options.
dwFlags : [int] VAR_CALENDAR_HIJRI is the only flag that can be set.
pbstrOut : [var] Receives the formatted string that represents the variant.
%inst
Formats a variant containing percentages into a string form.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function uses the user's default locale while calling
VarTokenizeFormatString and VarFormatFromTokens.


%index
VarI1FromBool
Converts a Boolean value to a char value.
%group
Win32 oleaut32
%prm
boolIn, pcOut
boolIn : [int] The value to convert.
pcOut : [str] The resulting value.
%inst
Converts a Boolean value to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromCy
Converts a currency value to a char value.
%group
Win32 oleaut32
%prm
cyIn, pcOut
cyIn : [var] The value to convert.
pcOut : [str] The resulting value.
%inst
Converts a currency value to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromDate
Converts a date value to a char value.
%group
Win32 oleaut32
%prm
dateIn, pcOut
dateIn : [double] The value to convert.
pcOut : [str] The resulting value.
%inst
Converts a date value to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromDec
Converts a decimal value to a char value.
%group
Win32 oleaut32
%prm
pdecIn, pcOut
pdecIn : [var] The value to convert.
pcOut : [str] The resulting value.
%inst
Converts a decimal value to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromDisp
Converts the default property of an IDispatch instance to a char value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, pcOut
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
pcOut : [str] The resulting value.
%inst
Converts the default property of an IDispatch instance to a char
value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromI2
Converts a short value to a char value.
%group
Win32 oleaut32
%prm
uiIn, pcOut
uiIn : [int] The value to convert.
pcOut : [str] The resulting value.
%inst
Converts a short value to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromI4
Converts a long value to a char value.
%group
Win32 oleaut32
%prm
lIn, pcOut
lIn : [int] The value to convert.
pcOut : [str] The resulting value.
%inst
Converts a long value to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromI8
Converts an 8-byte integer value to a char value.
%group
Win32 oleaut32
%prm
i64In, pcOut
i64In : [int64] The value to convert.
pcOut : [str] The resulting value.
%inst
Converts an 8-byte integer value to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromR4
Converts a float value to a char value.
%group
Win32 oleaut32
%prm
fltIn, pcOut
fltIn : [float] The value to convert.
pcOut : [str] The resulting value.
%inst
Converts a float value to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromR8
Converts a double value to a char value.
%group
Win32 oleaut32
%prm
dblIn, pcOut
dblIn : [double] The value to convert.
pcOut : [str] The resulting value.
%inst
Converts a double value to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromStr
Converts an OLECHAR string to a char value.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pcOut
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pcOut : [str] The resulting value.
%inst
Converts an OLECHAR string to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromUI1
Converts an unsigned char value to a char value.
%group
Win32 oleaut32
%prm
bIn, pcOut
bIn : [int] The value to convert.
pcOut : [str] The resulting value.
%inst
Converts an unsigned char value to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromUI2
Converts an unsigned short value to a char value.
%group
Win32 oleaut32
%prm
uiIn, pcOut
uiIn : [int] The value to convert.
pcOut : [str] The resulting value.
%inst
Converts an unsigned short value to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromUI4
Converts an unsigned long value to a char value.
%group
Win32 oleaut32
%prm
ulIn, pcOut
ulIn : [int] The value to convert.
pcOut : [str] The resulting value.
%inst
Converts an unsigned long value to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI1FromUI8
Converts an 8-byte unsigned integer value to a char value.
%group
Win32 oleaut32
%prm
i64In, pcOut
i64In : [int64] The value to convert.
pcOut : [str] The resulting value.
%inst
Converts an 8-byte unsigned integer value to a char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromBool
Converts a Boolean value to a short value.
%group
Win32 oleaut32
%prm
boolIn, psOut
boolIn : [int] The value to convert.
psOut : [var] The resulting value.
%inst
Converts a Boolean value to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromCy
Converts a currency value to a short value.
%group
Win32 oleaut32
%prm
cyIn, psOut
cyIn : [var] The value to convert.
psOut : [var] The resulting value.
%inst
Converts a currency value to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromDate
Converts a date value to a short value.
%group
Win32 oleaut32
%prm
dateIn, psOut
dateIn : [double] The value to convert.
psOut : [var] The resulting value.
%inst
Converts a date value to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromDec
Converts a decimal value to a short value.
%group
Win32 oleaut32
%prm
pdecIn, psOut
pdecIn : [var] The value to convert.
psOut : [var] The resulting value.
%inst
Converts a decimal value to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromDisp
Converts the default property of an IDispatch instance to a short value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, psOut
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
psOut : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to a short
value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromI1
Converts a char value to a short value.
%group
Win32 oleaut32
%prm
cIn, psOut
cIn : [int] The value to convert.
psOut : [var] The resulting value.
%inst
Converts a char value to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromI4
Converts a long value to a short value.
%group
Win32 oleaut32
%prm
lIn, psOut
lIn : [int] The value to convert.
psOut : [var] The resulting value.
%inst
Converts a long value to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromI8
Converts an 8-byte integer value to a short value.
%group
Win32 oleaut32
%prm
i64In, psOut
i64In : [int64] The value to convert.
psOut : [var] The resulting value.
%inst
Converts an 8-byte integer value to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromR4
Converts a float value to a short value.
%group
Win32 oleaut32
%prm
fltIn, psOut
fltIn : [float] The value to convert.
psOut : [var] The resulting value.
%inst
Converts a float value to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromR8
Converts a double value to a short value.
%group
Win32 oleaut32
%prm
dblIn, psOut
dblIn : [double] The value to convert.
psOut : [var] The resulting value.
%inst
Converts a double value to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromStr
Converts an OLECHAR string to a short value.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, psOut
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
psOut : [var] The resulting value.
%inst
Converts an OLECHAR string to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromUI1
Converts an unsigned char value to a short value.
%group
Win32 oleaut32
%prm
bIn, psOut
bIn : [int] The value to convert.
psOut : [var] The resulting value.
%inst
Converts an unsigned char value to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromUI2
Converts an unsigned short value to a short value.
%group
Win32 oleaut32
%prm
uiIn, psOut
uiIn : [int] The value to convert.
psOut : [var] The resulting value.
%inst
Converts an unsigned short value to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromUI4
Converts an unsigned long value to a short value.
%group
Win32 oleaut32
%prm
ulIn, psOut
ulIn : [int] The value to convert.
psOut : [var] The resulting value.
%inst
Converts an unsigned long value to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI2FromUI8
Converts an 8-byte unsigned integer value to a short value.
%group
Win32 oleaut32
%prm
ui64In, psOut
ui64In : [int64] The value to convert.
psOut : [var] The resulting value.
%inst
Converts an 8-byte unsigned integer value to a short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromBool
Converts a Boolean value to a long value.
%group
Win32 oleaut32
%prm
boolIn, plOut
boolIn : [int] The value to convert.
plOut : [var] The resulting value.
%inst
Converts a Boolean value to a long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromCy
Converts a currency value to a long value.
%group
Win32 oleaut32
%prm
cyIn, plOut
cyIn : [var] The value to convert.
plOut : [var] The resulting value.
%inst
Converts a currency value to a long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromDate
Converts a date value to a long value.
%group
Win32 oleaut32
%prm
dateIn, plOut
dateIn : [double] The value to convert.
plOut : [var] The resulting value.
%inst
Converts a date value to a long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromDec
Converts a decimal value to a long value.
%group
Win32 oleaut32
%prm
pdecIn, plOut
pdecIn : [var] The value to convert.
plOut : [var] The resulting value.
%inst
Converts a decimal value to a long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromDisp
Converts the default property of an IDispatch instance to a long value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, plOut
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
plOut : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to a long
value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromI1
Converts a char value to a long value.
%group
Win32 oleaut32
%prm
cIn, plOut
cIn : [int] The value to convert.
plOut : [var] The resulting value.
%inst
Converts a char value to a long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromI2
Converts a short value to a long value.
%group
Win32 oleaut32
%prm
sIn, plOut
sIn : [int] The value to convert.
plOut : [var] The resulting value.
%inst
Converts a short value to a long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromI8
Converts an 8-byte integer value to a long value.
%group
Win32 oleaut32
%prm
i64In, plOut
i64In : [int64] The value to convert.
plOut : [var] The resulting value.
%inst
Converts an 8-byte integer value to a long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromR4
Converts a float value to a long value.
%group
Win32 oleaut32
%prm
fltIn, plOut
fltIn : [float] The value to convert.
plOut : [var] The resulting value.
%inst
Converts a float value to a long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromR8
Converts a double value to a long value.
%group
Win32 oleaut32
%prm
dblIn, plOut
dblIn : [double] The value to convert.
plOut : [var] The resulting value.
%inst
Converts a double value to a long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromStr
Converts an OLECHAR string to a long value.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, plOut
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
plOut : [var] The resulting value.
%inst
Converts an OLECHAR string to a long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromUI1
Converts an unsigned char value to a long value.
%group
Win32 oleaut32
%prm
bIn, plOut
bIn : [int] The value to convert.
plOut : [var] The resulting value.
%inst
Converts an unsigned char value to a long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromUI2
Converts an unsigned short value to a long value.
%group
Win32 oleaut32
%prm
uiIn, plOut
uiIn : [int] The value to convert.
plOut : [var] The resulting value.
%inst
Converts an unsigned short value to a long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromUI4
Converts an unsigned long value to a long value.
%group
Win32 oleaut32
%prm
ulIn, plOut
ulIn : [int] The value to convert.
plOut : [var] The resulting value.
%inst
Converts an unsigned long value to a long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI4FromUI8
Converts an 8-byte unsigned integer value to a long.
%group
Win32 oleaut32
%prm
ui64In, plOut
ui64In : [int64] The value to convert.
plOut : [var] The resulting value.
%inst
Converts an 8-byte unsigned integer value to a long.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromBool
Converts a Boolean value to an 8-byte integer value.
%group
Win32 oleaut32
%prm
boolIn, pi64Out
boolIn : [int] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a Boolean value to an 8-byte integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromCy
Converts a currency value to an 8-byte integer value.
%group
Win32 oleaut32
%prm
cyIn, pi64Out
cyIn : [var] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a currency value to an 8-byte integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromDate
Converts a date value to an 8-byte integer value.
%group
Win32 oleaut32
%prm
dateIn, pi64Out
dateIn : [double] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a date value to an 8-byte integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromDec
Converts a decimal value to an 8-byte integer value.
%group
Win32 oleaut32
%prm
pdecIn, pi64Out
pdecIn : [var] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a decimal value to an 8-byte integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromDisp
Converts the default property of an IDispatch instance to an 8-byte integer value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, pi64Out
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
pi64Out : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to an 8-byte
integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromI1
Converts a char value to an 8-byte integer value.
%group
Win32 oleaut32
%prm
cIn, pi64Out
cIn : [int] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a char value to an 8-byte integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromI2
Converts a short value to an 8-byte integer value.
%group
Win32 oleaut32
%prm
sIn, pi64Out
sIn : [int] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a short value to an 8-byte integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromR4
Converts a float value to an 8-byte integer value.
%group
Win32 oleaut32
%prm
fltIn, pi64Out
fltIn : [float] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a float value to an 8-byte integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromR8
Converts a double value to an 8-byte integer value.
%group
Win32 oleaut32
%prm
dblIn, pi64Out
dblIn : [double] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a double value to an 8-byte integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromStr
Converts an OLECHAR string to an 8-byte integer value.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pi64Out
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pi64Out : [var] The resulting value.
%inst
Converts an OLECHAR string to an 8-byte integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromUI1
Onverts an unsigned byte value to an 8-byte integer value.
%group
Win32 oleaut32
%prm
bIn, pi64Out
bIn : [int] The value to convert.
pi64Out : [var] The resulting value.
%inst
Onverts an unsigned byte value to an 8-byte integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromUI2
Converts an unsigned short value to an 8-byte integer value.
%group
Win32 oleaut32
%prm
uiIn, pi64Out
uiIn : [int] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts an unsigned short value to an 8-byte integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromUI4
Converts an unsigned long value to an 8-byte integer value.
%group
Win32 oleaut32
%prm
ulIn, pi64Out
ulIn : [int] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts an unsigned long value to an 8-byte integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarI8FromUI8
Converts an unsigned 8-byte integer value to an 8-byte integer value.
%group
Win32 oleaut32
%prm
ui64In, pi64Out
ui64In : [int64] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts an unsigned 8-byte integer value to an 8-byte integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarIdiv
Converts two variants of any type to integers then returns the result from dividing them.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
pvarResult : [var] The result variant.
%inst
Converts two variants of any type to integers then returns the result
from dividing them.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function operates as follows.
This doc was truncated.


%index
VarImp
Performs a bitwise implication on two variants.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
pvarResult : [var] The result variant.
%inst
Performs a bitwise implication on two variants.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function operates as follows.
This doc was truncated.


%index
VarInt
Returns the integer portion of a variant. (VarInt)
%group
Win32 oleaut32
%prm
pvarIn, pvarResult
pvarIn : [var] The variant.
pvarResult : [var] The result variant.
%inst
Returns the integer portion of a variant. (VarInt)

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
If the variant is negative, then the first negative integer less than
or equal to the variant is returned.


%index
VarMod
Divides two variants and returns only the remainder.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
pvarResult : [var] The result variant.
%inst
Divides two variants and returns only the remainder.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarMonthName
Returns a string containing the localized month name.
%group
Win32 oleaut32
%prm
iMonth, fAbbrev, dwFlags, pbstrOut
iMonth : [int] Represents the month, as a number from 1 to 12.
fAbbrev : [int] If zero then the full (non-abbreviated) month name is used. If non-zero, then the abbreviation for the month name is used.
dwFlags : [int] VAR_CALENDAR_HIJRI is the only flag that can be set.
pbstrOut : [var] Receives the formatted string that represents the variant.
%inst
Returns a string containing the localized month name.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarMul
Returns the result from multiplying two variants.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
pvarResult : [var] The result variant.
%inst
Returns the result from multiplying two variants.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function operates as follows.
This doc was truncated.


%index
VarNeg
Performs logical negation on a variant.
%group
Win32 oleaut32
%prm
pvarIn, pvarResult
pvarIn : [var] The variant.
pvarResult : [var] The result variant.
%inst
Performs logical negation on a variant.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarNot
Performs the bitwise not negation operation on a variant.
%group
Win32 oleaut32
%prm
pvarIn, pvarResult
pvarIn : [var] The variant.
pvarResult : [var] The result variant.
%inst
Performs the bitwise not negation operation on a variant.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function operates as follows.
This doc was truncated.


%index
VarNumFromParseNum
Converts parsed results to a variant.
%group
Win32 oleaut32
%prm
pnumprs, rgbDig, dwVtBits, pvar
pnumprs : [var] The parsed results. The cDig member of this argument specifies the number of digits present in rgbDig.
rgbDig : [var] The values of the digits. The cDig field of pnumprs contains the number of digits.
dwVtBits : [int] One bit set for each type that is acceptable as a return value (in many cases, just one bit).
pvar : [var] The variant result.
%inst
Converts parsed results to a variant.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
For rounding decimal numbers, the digit array must be at least one
digit longer than the maximum required for data types. The maximum
number of digits required for the DECIMAL data type is 29, so the
digit array must have room for 30 digits. There must also be enough
digits to accept the number in octal, if that parsing options is
selected. (Hexadecimal and octal numbers are limited by
VarNumFromParseNum to the magnitude of an unsigned long [32 bits], so
they need 11 octal digits.)


%index
VarOr
Performs a logical disjunction on two variants.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
pvarResult : [var] The result variant.
%inst
Performs a logical disjunction on two variants.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function operates as follows.
This doc was truncated.


%index
VarParseNumFromStr
Parses a string, and creates a type-independent description of the number it represents.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pnumprs, rgbDig
strIn : [wstr] The input string to convert.
lcid : [int] The locale identifier.
dwFlags : [int] Enables the caller to control parsing, therefore defining the acceptable syntax of a number. If this field is set to zero, the input string must contain nothing but decimal digits. Setting each defined flag bit enables parsing of that syntactic feature. Standard Automation parsing (for example, as used by VarI2FromStr) has all flags set (NUMPRS_STD).
pnumprs : [var] The parsed results.
rgbDig : [var] The values for the digits in the range 0?7, 0?9, or 0?15, depending on whether the number is octal, decimal, or hexadecimal. All leading zeros have been stripped off. For decimal numbers, trailing zeros are also stripped off, unless the number is zero, in which case a single zero digit will be present.
%inst
Parses a string, and creates a type-independent description of the
number it represents.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarPow
Returns the result of performing the power function with two variants.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
pvarResult : [var] The result variant.
%inst
Returns the result of performing the power function with two
variants.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
Returns the result of pvarLeft to the power of pvarRight.


%index
VarR4CmpR8
Compares two variants of types float and double.
%group
Win32 oleaut32
%prm
fltLeft, dblRight
fltLeft : [float] The first variant.
dblRight : [double] The second variant.
%inst
Compares two variants of types float and double.

[戻り値]
The function returns the following as a SUCCESS HRESULT.
This doc was truncated.


%index
VarR4FromBool
Converts a Boolean value to a float value.
%group
Win32 oleaut32
%prm
boolIn, pfltOut
boolIn : [int] The value to convert.
pfltOut : [var] The resulting value.
%inst
Converts a Boolean value to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromCy
Converts a currency value to a float value.
%group
Win32 oleaut32
%prm
cyIn, pfltOut
cyIn : [var] The value to convert.
pfltOut : [var] The resulting value.
%inst
Converts a currency value to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromDate
Converts a date value to a float value.
%group
Win32 oleaut32
%prm
dateIn, pfltOut
dateIn : [double] The value to convert.
pfltOut : [var] The resulting value.
%inst
Converts a date value to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromDec
Converts a decimal value to a float value.
%group
Win32 oleaut32
%prm
pdecIn, pfltOut
pdecIn : [var] The value to convert.
pfltOut : [var] The resulting value.
%inst
Converts a decimal value to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromDisp
Converts the default property of an IDispatch instance to a float value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, pfltOut
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
pfltOut : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to a float
value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromI1
Onverts a char value to a float value.
%group
Win32 oleaut32
%prm
cIn, pfltOut
cIn : [int] The value to convert.
pfltOut : [var] The resulting value.
%inst
Onverts a char value to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromI2
Converts a short value to a float value.
%group
Win32 oleaut32
%prm
sIn, pfltOut
sIn : [int] The value to convert.
pfltOut : [var] The resulting value.
%inst
Converts a short value to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromI4
Converts a long value to a float value.
%group
Win32 oleaut32
%prm
lIn, pfltOut
lIn : [int] The value to convert.
pfltOut : [var] The resulting value.
%inst
Converts a long value to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromI8
Converts an 8-byte integer value to a float value.
%group
Win32 oleaut32
%prm
i64In, pfltOut
i64In : [int64] The value to convert.
pfltOut : [var] The resulting value.
%inst
Converts an 8-byte integer value to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromR8
Converts a double value to a float value.
%group
Win32 oleaut32
%prm
dblIn, pfltOut
dblIn : [double] The value to convert.
pfltOut : [var] The resulting value.
%inst
Converts a double value to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromStr
Converts an OLECHAR string to a float value.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pfltOut
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pfltOut : [var] The resulting value.
%inst
Converts an OLECHAR string to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromUI1
Converts an unsigned char value to a float value.
%group
Win32 oleaut32
%prm
bIn, pfltOut
bIn : [int] The value to convert.
pfltOut : [var] The resulting value.
%inst
Converts an unsigned char value to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromUI2
Converts an unsigned short value to a float value.
%group
Win32 oleaut32
%prm
uiIn, pfltOut
uiIn : [int] The value to convert.
pfltOut : [var] The resulting value.
%inst
Converts an unsigned short value to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromUI4
Converts an unsigned long value to a float value.
%group
Win32 oleaut32
%prm
ulIn, pfltOut
ulIn : [int] The value to convert.
pfltOut : [var] The resulting value.
%inst
Converts an unsigned long value to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR4FromUI8
Converts an unsigned 8-byte integer value to a float value.
%group
Win32 oleaut32
%prm
ui64In, pfltOut
ui64In : [int64] The value to convert.
pfltOut : [var] The resulting value.
%inst
Converts an unsigned 8-byte integer value to a float value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromBool
Converts a Boolean value to a double value.
%group
Win32 oleaut32
%prm
boolIn, pdblOut
boolIn : [int] The value to convert.
pdblOut : [var] The resulting value.
%inst
Converts a Boolean value to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromCy
Converts a currency value to a double value.
%group
Win32 oleaut32
%prm
cyIn, pdblOut
cyIn : [var] The value to convert.
pdblOut : [var] The resulting value.
%inst
Converts a currency value to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromDate
Converts a date value to a double value.
%group
Win32 oleaut32
%prm
dateIn, pdblOut
dateIn : [double] The value to convert.
pdblOut : [var] The resulting value.
%inst
Converts a date value to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromDec
Converts a decimal value to a double value.
%group
Win32 oleaut32
%prm
pdecIn, pdblOut
pdecIn : [var] The value to convert.
pdblOut : [var] The resulting value.
%inst
Converts a decimal value to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromDisp
Converts the default property of an IDispatch instance to a double value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, pdblOut
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
pdblOut : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to a double
value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromI1
Converts a char value to a double value.
%group
Win32 oleaut32
%prm
cIn, pdblOut
cIn : [int] The value to convert.
pdblOut : [var] The resulting value.
%inst
Converts a char value to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromI2
Converts a short value to a double value.
%group
Win32 oleaut32
%prm
sIn, pdblOut
sIn : [int] The value to convert.
pdblOut : [var] The resulting value.
%inst
Converts a short value to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromI4
Converts a long value to a double value.
%group
Win32 oleaut32
%prm
lIn, pdblOut
lIn : [int] The value to convert.
pdblOut : [var] The resulting value.
%inst
Converts a long value to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromI8
Converts an 8-byte integer value to a double value.
%group
Win32 oleaut32
%prm
i64In, pdblOut
i64In : [int64] The value to convert.
pdblOut : [var] The resulting value.
%inst
Converts an 8-byte integer value to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromR4
Converts a float value to a double value.
%group
Win32 oleaut32
%prm
fltIn, pdblOut
fltIn : [float] The value to convert.
pdblOut : [var] The resulting value.
%inst
Converts a float value to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromStr
Converts an OLECHAR string to a double value.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pdblOut
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pdblOut : [var] The resulting value.
%inst
Converts an OLECHAR string to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromUI1
Converts an unsigned char value to a double value.
%group
Win32 oleaut32
%prm
bIn, pdblOut
bIn : [int] The value to convert.
pdblOut : [var] The resulting value.
%inst
Converts an unsigned char value to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromUI2
Converts an unsigned short value to a double value.
%group
Win32 oleaut32
%prm
uiIn, pdblOut
uiIn : [int] The value to convert.
pdblOut : [var] The resulting value.
%inst
Converts an unsigned short value to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromUI4
Converts an unsigned long value to a double value.
%group
Win32 oleaut32
%prm
ulIn, pdblOut
ulIn : [int] The value to convert.
pdblOut : [var] The resulting value.
%inst
Converts an unsigned long value to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8FromUI8
Converts an 8-byte unsigned integer value to a double value.
%group
Win32 oleaut32
%prm
ui64In, pdblOut
ui64In : [int64] The value to convert.
pdblOut : [var] The resulting value.
%inst
Converts an 8-byte unsigned integer value to a double value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarR8Pow
Performs the power function for variants of type double.
%group
Win32 oleaut32
%prm
dblLeft, dblRight, pdblResult
dblLeft : [double] The first variant.
dblRight : [double] The second variant.
pdblResult : [var] The result.
%inst
Performs the power function for variants of type double.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarR8Round
Rounds a variant of type double to the specified number of decimal places.
%group
Win32 oleaut32
%prm
dblIn, cDecimals, pdblResult
dblIn : [double] The variant.
cDecimals : [int] The number of decimal places.
pdblResult : [var] The result.
%inst
Rounds a variant of type double to the specified number of decimal
places.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarRound
Rounds a variant to the specified number of decimal places.
%group
Win32 oleaut32
%prm
pvarIn, cDecimals, pvarResult
pvarIn : [var] The variant.
cDecimals : [int] The number of decimal places.
pvarResult : [var] The result variant.
%inst
Rounds a variant to the specified number of decimal places.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.


%index
VarSub
Subtracts two variants.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
pvarResult : [var] The result variant.
%inst
Subtracts two variants.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function operates as follows.
This doc was truncated.


%index
VarTokenizeFormatString
Parses the actual format string into a series of tokens which can be used to format variants using VarFormatFromTokens.
%group
Win32 oleaut32
%prm
pstrFormat, rgbTok, cbTok, iFirstDay, iFirstWeek, lcid, pcbActual
pstrFormat : [wstr] The format string. For example "mm-dd-yy".
rgbTok : [var] The destination token buffer.
cbTok : [int] The size of the destination token buffer.
iFirstDay : [int] First day of the week.
iFirstWeek : [int] First week of the year.
lcid : [int] The locale to interpret format string in.
pcbActual : [var] Points to the integer which is set to the first generated token. This parameter can be NULL.
%inst
Parses the actual format string into a series of tokens which can be
used to format variants using VarFormatFromTokens.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
Parsing the format string once and then using it repeatedly is
usually faster than calling VarFormat repeatedly, because the latter
routine calls VarTokenizeFormatString for each call. The locale you
pass in controls how the format string is interpreted, not how the
actual output of VarFormatFromTokens looks.


%index
VarUI1FromBool
Converts a Boolean value to an unsigned char value.
%group
Win32 oleaut32
%prm
boolIn, pbOut
boolIn : [int] The value to convert.
pbOut : [var] The resulting value.
%inst
Converts a Boolean value to an unsigned char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromCy
Converts a currency value to an unsigned char value.
%group
Win32 oleaut32
%prm
cyIn, pbOut
cyIn : [var] The value to convert.
pbOut : [var] The resulting value.
%inst
Converts a currency value to an unsigned char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromDate
Converts a date value to an unsigned char value.
%group
Win32 oleaut32
%prm
dateIn, pbOut
dateIn : [double] The value to convert.
pbOut : [var] The resulting value.
%inst
Converts a date value to an unsigned char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromDec
Converts a decimal value to an unsigned char value.
%group
Win32 oleaut32
%prm
pdecIn, pbOut
pdecIn : [var] The value to convert.
pbOut : [var] The resulting value.
%inst
Converts a decimal value to an unsigned char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromDisp
Converts the default property of an IDispatch instance to an unsigned char value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, pbOut
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
pbOut : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to an unsigned
char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromI1
Converts a char value to an unsigned char value.
%group
Win32 oleaut32
%prm
cIn, pbOut
cIn : [int] The value to convert.
pbOut : [var] The resulting value.
%inst
Converts a char value to an unsigned char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromI2
Converts a short value to an unsigned char value.
%group
Win32 oleaut32
%prm
sIn, pbOut
sIn : [int] The value to convert.
pbOut : [var] The resulting value.
%inst
Converts a short value to an unsigned char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromI4
Converts a long value to an unsigned char value.
%group
Win32 oleaut32
%prm
lIn, pbOut
lIn : [int] The value to convert.
pbOut : [var] The resulting value.
%inst
Converts a long value to an unsigned char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromI8
Converts an 8-byte integer value to a byte value.
%group
Win32 oleaut32
%prm
i64In, pbOut
i64In : [int64] The value to convert.
pbOut : [var] The resulting value.
%inst
Converts an 8-byte integer value to a byte value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromR4
Converts a float value to an unsigned char value.
%group
Win32 oleaut32
%prm
fltIn, pbOut
fltIn : [float] The value to convert.
pbOut : [var] The resulting value.
%inst
Converts a float value to an unsigned char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromR8
Converts a double value to an unsigned char value.
%group
Win32 oleaut32
%prm
dblIn, pbOut
dblIn : [double] The value to convert.
pbOut : [var] The resulting value.
%inst
Converts a double value to an unsigned char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromStr
Converts an OLECHAR string to an unsigned char string.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pbOut
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pbOut : [var] The resulting value.
%inst
Converts an OLECHAR string to an unsigned char string.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromUI2
Converts an unsigned short value to an unsigned char value.
%group
Win32 oleaut32
%prm
uiIn, pbOut
uiIn : [int] The value to convert.
pbOut : [var] The resulting value.
%inst
Converts an unsigned short value to an unsigned char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromUI4
Converts an unsigned long value to an unsigned char value.
%group
Win32 oleaut32
%prm
ulIn, pbOut
ulIn : [int] The value to convert.
pbOut : [var] The resulting value.
%inst
Converts an unsigned long value to an unsigned char value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI1FromUI8
Converts an 8-byte unsigned integer value to a byte value.
%group
Win32 oleaut32
%prm
ui64In, pbOut
ui64In : [int64] The value to convert.
pbOut : [var] The resulting value.
%inst
Converts an 8-byte unsigned integer value to a byte value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromBool
Converts a Boolean value to an unsigned short value.
%group
Win32 oleaut32
%prm
boolIn, puiOut
boolIn : [int] The value to convert.
puiOut : [var] The resulting value.
%inst
Converts a Boolean value to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromCy
Converts a currency value to an unsigned short value.
%group
Win32 oleaut32
%prm
cyIn, puiOut
cyIn : [var] The value to convert.
puiOut : [var] The resulting value.
%inst
Converts a currency value to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromDate
Converts a date value to an unsigned short value.
%group
Win32 oleaut32
%prm
dateIn, puiOut
dateIn : [double] The value to convert.
puiOut : [var] The resulting value.
%inst
Converts a date value to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromDec
Converts a decimal value to an unsigned short value.
%group
Win32 oleaut32
%prm
pdecIn, puiOut
pdecIn : [var] The value to convert.
puiOut : [var] The resulting value.
%inst
Converts a decimal value to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromDisp
Converts the default property of an IDispatch instance to an unsigned short value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, puiOut
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
puiOut : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to an unsigned
short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromI1
Converts a char value to an unsigned short value.
%group
Win32 oleaut32
%prm
cIn, puiOut
cIn : [int] The value to convert.
puiOut : [var] The resulting value.
%inst
Converts a char value to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromI2
Converts a short value to an unsigned short value.
%group
Win32 oleaut32
%prm
uiIn, puiOut
uiIn : [int] The value to convert.
puiOut : [var] The resulting value.
%inst
Converts a short value to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromI4
Converts a long value to an unsigned short value.
%group
Win32 oleaut32
%prm
lIn, puiOut
lIn : [int] The value to convert.
puiOut : [var] The resulting value.
%inst
Converts a long value to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromI8
Converts an 8-byte integer value to an unsigned short value.
%group
Win32 oleaut32
%prm
i64In, puiOut
i64In : [int64] The value to convert.
puiOut : [var] The resulting value.
%inst
Converts an 8-byte integer value to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromR4
Converts a float value to an unsigned short value.
%group
Win32 oleaut32
%prm
fltIn, puiOut
fltIn : [float] The value to convert.
puiOut : [var] The resulting value.
%inst
Converts a float value to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromR8
Converts a double value to an unsigned short value.
%group
Win32 oleaut32
%prm
dblIn, puiOut
dblIn : [double] The value to convert.
puiOut : [var] The resulting value.
%inst
Converts a double value to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromStr
Converts an OLECHAR string to an unsigned short value.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, puiOut
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
puiOut : [var] The resulting value.
%inst
Converts an OLECHAR string to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromUI1
Converts an unsigned char value to an unsigned short value.
%group
Win32 oleaut32
%prm
bIn, puiOut
bIn : [int] The value to convert.
puiOut : [var] The resulting value.
%inst
Converts an unsigned char value to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromUI4
Converts an unsigned long value to an unsigned short value.
%group
Win32 oleaut32
%prm
ulIn, puiOut
ulIn : [int] The value to convert.
puiOut : [var] The resulting value.
%inst
Converts an unsigned long value to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI2FromUI8
Converts an 8-byte unsigned integer value to an unsigned short value.
%group
Win32 oleaut32
%prm
i64In, puiOut
i64In : [int64] The value to convert.
puiOut : [var] The resulting value.
%inst
Converts an 8-byte unsigned integer value to an unsigned short value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromBool
Converts a Boolean value to an unsigned long value.
%group
Win32 oleaut32
%prm
boolIn, pulOut
boolIn : [int] The value to convert.
pulOut : [var] The resulting value.
%inst
Converts a Boolean value to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromCy
Converts a currency value to an unsigned long value.
%group
Win32 oleaut32
%prm
cyIn, pulOut
cyIn : [var] The value to convert.
pulOut : [var] The resulting value.
%inst
Converts a currency value to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromDate
Converts a date value to an unsigned long value.
%group
Win32 oleaut32
%prm
dateIn, pulOut
dateIn : [double] The value to convert.
pulOut : [var] The resulting value.
%inst
Converts a date value to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromDec
Converts a decimal value to an unsigned long value.
%group
Win32 oleaut32
%prm
pdecIn, pulOut
pdecIn : [var] The value to convert.
pulOut : [var] The resulting value.
%inst
Converts a decimal value to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromDisp
Converts the default property of an IDispatch instance to an unsigned long value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, pulOut
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
pulOut : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to an unsigned
long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromI1
Converts a char value to an unsigned long value.
%group
Win32 oleaut32
%prm
cIn, pulOut
cIn : [int] The value to convert.
pulOut : [var] The resulting value.
%inst
Converts a char value to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromI2
Converts a short value to an unsigned long value.
%group
Win32 oleaut32
%prm
uiIn, pulOut
uiIn : [int] The value to convert.
pulOut : [var] The resulting value.
%inst
Converts a short value to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromI4
Converts a long value to an unsigned long value.
%group
Win32 oleaut32
%prm
lIn, pulOut
lIn : [int] The value to convert.
pulOut : [var] The resulting value.
%inst
Converts a long value to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromI8
Converts an 8-byte integer value to an unsigned long value.
%group
Win32 oleaut32
%prm
i64In, plOut
i64In : [int64] The value to convert.
plOut : [var] The resulting value.
%inst
Converts an 8-byte integer value to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromR4
Converts a float value to an unsigned long value.
%group
Win32 oleaut32
%prm
fltIn, pulOut
fltIn : [float] The value to convert.
pulOut : [var] The resulting value.
%inst
Converts a float value to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromR8
Converts a double value to an unsigned long value.
%group
Win32 oleaut32
%prm
dblIn, pulOut
dblIn : [double] The value to convert.
pulOut : [var] The resulting value.
%inst
Converts a double value to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromStr
Converts an OLECHAR string to an unsigned long value.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pulOut
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pulOut : [var] The resulting value.
%inst
Converts an OLECHAR string to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromUI1
Converts an unsigned char value to an unsigned long value.
%group
Win32 oleaut32
%prm
bIn, pulOut
bIn : [int] The value to convert.
pulOut : [var] The resulting value.
%inst
Converts an unsigned char value to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromUI2
Converts an unsigned short value to an unsigned long value.
%group
Win32 oleaut32
%prm
uiIn, pulOut
uiIn : [int] The value to convert.
pulOut : [var] The resulting value.
%inst
Converts an unsigned short value to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI4FromUI8
Converts an 8-byte unsigned integer value to an unsigned long value.
%group
Win32 oleaut32
%prm
ui64In, plOut
ui64In : [int64] The value to convert.
plOut : [var] The resulting value.
%inst
Converts an 8-byte unsigned integer value to an unsigned long value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromBool
Converts a VARIANT_BOOL value to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
boolIn, pi64Out
boolIn : [int] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a VARIANT_BOOL value to an 8-byte unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromCy
Converts a currency value to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
cyIn, pi64Out
cyIn : [var] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a currency value to an 8-byte unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromDate
Converts a date value to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
dateIn, pi64Out
dateIn : [double] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a date value to an 8-byte unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromDec
Converts a decimal value to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
pdecIn, pi64Out
pdecIn : [var] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a decimal value to an 8-byte unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromDisp
Converts the default property of an IDispatch instance to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
pdispIn, lcid, pi64Out
pdispIn : [var] The value to convert.
lcid : [int] The locale identifier.
pi64Out : [var] The resulting value.
%inst
Converts the default property of an IDispatch instance to an 8-byte
unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromI1
Converts a char value to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
cIn, pi64Out
cIn : [int] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a char value to an 8-byte unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromI2
Converts a short value to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
sIn, pi64Out
sIn : [int] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a short value to an 8-byte unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromI8
Converts an 8-byte integer value to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
ui64In, pi64Out
ui64In : [int64] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts an 8-byte integer value to an 8-byte unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromR4
Converts a float value to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
fltIn, pi64Out
fltIn : [float] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a float value to an 8-byte unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromR8
Converts a double value to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
dblIn, pi64Out
dblIn : [double] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a double value to an 8-byte unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromStr
Converts an OLECHAR string to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
strIn, lcid, dwFlags, pi64Out
strIn : [wstr] The value to convert.
lcid : [int] The locale identifier.
dwFlags : [int] One or more of the following flags.
pi64Out : [var] The resulting value.
%inst
Converts an OLECHAR string to an 8-byte unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromUI1
Converts a byte value to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
bIn, pi64Out
bIn : [int] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts a byte value to an 8-byte unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromUI2
Converts an unsigned short value to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
uiIn, pi64Out
uiIn : [int] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts an unsigned short value to an 8-byte unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUI8FromUI4
Converts an unsigned long value to an 8-byte unsigned integer value.
%group
Win32 oleaut32
%prm
ulIn, pi64Out
ulIn : [int] The value to convert.
pi64Out : [var] The resulting value.
%inst
Converts an unsigned long value to an 8-byte unsigned integer value.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarUdateFromDate
Converts a time and date converted from variant format to MS-DOS format.
%group
Win32 oleaut32
%prm
dateIn, dwFlags, pudateOut
dateIn : [double] The packed date.
dwFlags : [int] Set for alternative calendars such as Hijri, Polish and Russian.
pudateOut : [var] The unpacked date.
%inst
Converts a time and date converted from variant format to MS-DOS
format.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
The UDATE structure is used with VarDateFromUdate and
VarUdateFromDate. It represents an "unpacked" date.
This doc was truncated.


%index
VarWeekdayName
Returns a string containing the localized name of the weekday.
%group
Win32 oleaut32
%prm
iWeekday, fAbbrev, iFirstDay, dwFlags, pbstrOut
iWeekday : [int] The day of the week.
fAbbrev : [int] If zero then the full (non-abbreviated) weekday name is used. If non-zero, then the abbreviation for the weekday name is used.
iFirstDay : [int] First day of the week.
dwFlags : [int] VAR_CALENDAR_HIJRI is the only flag that can be set.
pbstrOut : [var] Receives the formatted string that represents the variant.
%inst
Returns a string containing the localized name of the weekday.

[戻り値]
This function can return one of these values.
This doc was truncated.


%index
VarXor
Performs a logical exclusion on two variants.
%group
Win32 oleaut32
%prm
pvarLeft, pvarRight, pvarResult
pvarLeft : [var] The first variant.
pvarRight : [var] The second variant.
pvarResult : [var] The result variant.
%inst
Performs a logical exclusion on two variants.

[戻り値]
If this function succeeds, it returns S_OK. Otherwise, it returns an
HRESULT error code.

[備考]
The function operates as follows.
This doc was truncated.


%index
VariantChangeType
Converts a variant from one type to another.
%group
Win32 oleaut32
%prm
pvargDest, pvarSrc, wFlags, vt
pvargDest : [var] The destination variant. If this is the same as pvarSrc, the variant will be converted in place.
pvarSrc : [var] The variant to convert.
wFlags : [int] Flags.
vt : [int] The type to convert to. If the return code is S_OK, the vt field of the *pvargDest is guaranteed to be equal to this value.
%inst
Converts a variant from one type to another.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
The VariantChangeType function handles coercions between the
fundamental types (including numeric-to-string and string-to-numeric
coercions). The pvarSrc argument is changed during the conversion
process. For example, if the source variant is of type VT_BOOL and
the destination is of type VT_UINT, the pvarSrc argument is first
converted to VT_I2 and then the conversion proceeds. A variant that
has VT_BYREF set is coerced to a value by obtaining the referenced
value. An object is coerced to a value by invoking the object's Value
property (DISPID_VALUE). Typically, the implementer of
IDispatch::Invoke determines which member is being accessed, and then
calls VariantChangeType to get the value of one or more arguments.
For example, if the IDispatch call specifies a SetTitle member that
takes one string argument, the implementer would call
VariantChangeType to attempt to coerce the argument to VT_BSTR. If
VariantChangeType does not return an error, the argument could then
be obtained directly from the bstrVal field of the VARIANTARG. If
VariantChangeType returns DISP_E_TYPEMISMATCH, the implementer would
set *puArgErr to 0 (indicating the argument in error) and return
DISP_E_TYPEMISMATCH from Invoke. Arrays of one type cannot be
converted to arrays of another type with this function. Note The type
of a VARIANTARG should not be changed in the rgvarg array in place.


%index
VariantChangeTypeEx
Converts a variant from one type to another, using an LCID.
%group
Win32 oleaut32
%prm
pvargDest, pvarSrc, lcid, wFlags, vt
pvargDest : [var] The destination variant. If this is the same as pvarSrc, the variant will be converted in place.
pvarSrc : [var] The variant to convert.
lcid : [int] The locale identifier. The LCID is useful when the type of the source or destination VARIANTARG is VT_BSTR, VT_DISPATCH, or VT_DATE.
wFlags : [int] Flags.
vt : [int] The type to convert to. If the return code is S_OK, the vt field of the *pvargDest is guaranteed to be equal to this value.
%inst
Converts a variant from one type to another, using an LCID.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
The VariantChangeTypeEx function handles coercions between the
fundamental types (including numeric-to-string and string-to-numeric
coercions). A variant that has VT_BYREF set is coerced to a value by
obtaining the referenced value. An object is coerced to a value by
invoking the object's Value property (DISPID_VALUE). Typically, the
implementer of IDispatch::Invoke determines which member is being
accessed, and then calls VariantChangeType to get the value of one or
more arguments. For example, if the IDispatch call specifies a
SetTitle member that takes one string argument, the implementer would
call VariantChangeTypeEx to attempt to coerce the argument to
VT_BSTR. If VariantChangeTypeEx does not return an error, the
argument could then be obtained directly from the bstrVal field of
the VARIANTARG. If VariantChangeTypeEx returns DISP_E_TYPEMISMATCH,
the implementer would set *puArgErr to 0 (indicating the argument in
error) and return DISP_E_TYPEMISMATCH from IDispatch::Invoke. Arrays
of one type cannot be converted to arrays of another type with this
function. Note The type of a VARIANTARG should not be changed in the
rgvarg array in place.


%index
VariantClear
Clears a variant.
%group
Win32 oleaut32
%prm
pvarg
pvarg : [var] The variant to clear.
%inst
Clears a variant.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
Use this function to clear variables of type VARIANTARG (or VARIANT)
before the memory containing the VARIANTARG is freed (as when a local
variable goes out of scope). The function clears a VARIANTARG by
setting the vt field to VT_EMPTY. The current contents of the
VARIANTARG are released first. If the vtfield is VT_BSTR, the string
is freed. If the vtfield is VT_DISPATCH, the object is released. If
the vt field has the VT_ARRAY bit set, the array is freed. If the
variant to be cleared is a COM object that is passed by reference,
the vtfield of the pvargparameter is VT_DISPATCH | VT_BYREF or
VT_UNKNOWN | VT_BYREF. In this case, VariantClear does not release
the object. Because the variant being cleared is a pointer to a
reference to an object, VariantClear has no way to determine if it is
necessary to release the object. It is therefore the responsibility
of the caller to release the object or not, as appropriate. In
certain cases, it may be preferable to clear a variant in code
without calling VariantClear. For example, you can change the type of
a VT_I4 variant to another type without calling this function.
Safearrays of BSTR will have SysFreeString called on each element not
VariantClear. However, you must call VariantClear if a VT_type is
received but cannot be handled. Safearrays of variant will also have
VariantClear called on each member. Using VariantClear in these cases
ensures that code will continue to work if Automation adds new
variant types in the future. Do not use VariantClear on uninitialized
variants; use VariantInit to initialize a new VARIANTARG or VARIANT.
Variants containing arrays with outstanding references cannot be
cleared. Attempts to do so will return an HRESULT containing
DISP_E_ARRAYISLOCKED.


%index
VariantCopy
Frees the destination variant and makes a copy of the source variant.
%group
Win32 oleaut32
%prm
pvargDest, pvargSrc
pvargDest : [var] The destination variant.
pvargSrc : [var] The source variant.
%inst
Frees the destination variant and makes a copy of the source variant.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
First, free any memory that is owned by pvargDest, such as
VariantClear (pvargDest must point to a valid initialized variant,
and not simply to an uninitialized memory location). Then pvargDest
receives an exact copy of the contents of pvargSrc. If pvargSrc is a
VT_BSTR, a copy of the string is made. If pvargSrcis a VT_ARRAY, the
entire array is copied. If pvargSrc is a VT_DISPATCH or VT_UNKNOWN,
AddRef is called to increment the object's reference count. If the
variant to be copied is a COM object that is passed by reference, the
vtfield of the pvargSrcparameter is VT_DISPATCH | VT_BYREF or
VT_UNKNOWN | VT_BYREF. In this case, VariantCopy does not increment
the reference count on the referenced object. Because the variant
being copied is a pointer to a reference to an object, VariantCopy
has no way to determine if it is necessary to increment the reference
count of the object. It is therefore the responsibility of the caller
to call IUnknown::AddRef on the object or not, as appropriate. Note
The VariantCopy method is not threadsafe.


%index
VariantCopyInd
Frees the destination variant and makes a copy of the source variant, performing the necessary indirection if the source is specified to be VT_BYREF.
%group
Win32 oleaut32
%prm
pvarDest, pvargSrc
pvarDest : [var] The destination variant.
pvargSrc : [var] The source variant.
%inst
Frees the destination variant and makes a copy of the source variant,
performing the necessary indirection if the source is specified to be
VT_BYREF.

[戻り値]
This function can return one of these values.
This doc was truncated.

[備考]
This function is useful when a copy of a variant is needed, and to
guarantee that it is not VT_BYREF, such as when handling arguments in
an implementation of IDispatch::Invoke. For example, if the source is
a (VT_BYREF | VT_I2), the destination will be a BYVAL | VT_I2. The
same is true for all legal VT_BYREF combinations, including
VT_VARIANT. If pvargSrc is (VT_BYREF | VT_VARIANT), and the contained
variant is VT_BYREF, the contained variant is also dereferenced. This
function frees any existing contents of pvarDest.


%index
VariantInit
Initializes a variant.
%group
Win32 oleaut32
%prm
pvarg
pvarg : [var] The variant to initialize.
%inst
Initializes a variant.

[備考]
The VariantInit function initializes the VARIANTARG by setting the vt
field to VT_EMPTY. Unlike VariantClear, this function does not
interpret the current contents of the VARIANTARG. Use VariantInit to
initialize new local variables of type VARIANTARG (or VARIANT).


%index
VariantTimeToDosDateTime
Converts the variant representation of a date and time to MS-DOS date and time values.
%group
Win32 oleaut32
%prm
vtime, pwDosDate, pwDosTime
vtime : [double] The variant time to convert.
pwDosDate : [var] Receives the converted MS-DOS date.
pwDosTime : [var] Receives the converted MS-DOS time
%inst
Converts the variant representation of a date and time to MS-DOS date
and time values.

[戻り値]
The function returns TRUE on success and FALSE otherwise.

[備考]
A variant time is stored as an 8-byte real value (double),
representing a date between January 1, 100 and December 31, 9999,
inclusive. The value 2.0 represents January 1, 1900; 3.0 represents
January 2, 1900, and so on. Adding 1 to the value increments the date
by a day. The fractional part of the value represents the time of
day. Therefore, 2.5 represents noon on January 1, 1900; 3.25
represents 6:00 A.M. on January 2, 1900, and so on. Negative numbers
represent the dates prior to December 30, 1899. For a description of
the MS-DOS date and time formats, see DosDateTimeToVariantTime. The
VariantTimeToDosDateTime function will accept invalid dates and try
to fix them when resolving to a VARIANT time. For example, an invalid
date such as 2/29/2001 will resolve to 3/1/2001. Only days are fixed,
so invalid month values result in an error being returned. Days are
checked to be between 1 and 31. Negative days and days greater than
31 results in an error. A day less than 31 but greater than the
maximum day in that month has the day promoted to the appropriate day
of the next month. A day equal to zero resolves as the last day of
the previous month. For example, an invalid dates such as 2/0/2001
will resolve to 1/31/2001.


%index
VariantTimeToSystemTime
Converts the variant representation of time to system time values.
%group
Win32 oleaut32
%prm
vtime, lpSystemTime
vtime : [double] The variant time to convert.
lpSystemTime : [var] Receives the system time.
%inst
Converts the variant representation of time to system time values.

[戻り値]
The function returns TRUE on success and FALSE otherwise.

[備考]
A variant time is stored as an 8-byte real value (double),
representing a date between January 1, 100 and December 31, 9999,
inclusive. The value 2.0 represents January 1, 1900; 3.0 represents
January 2, 1900, and so on. Adding 1 to the value increments the date
by a day. The fractional part of the value represents the time of
day. Therefore, 2.5 represents noon on January 1, 1900; 3.25
represents 6:00 A.M. on January 2, 1900, and so on. Negative numbers
represent the dates prior to December 30, 1899. Using the SYSTEMTIME
structure is useful because:
This doc was truncated.


%index
VectorFromBstr
Returns a vector, assigning each character in the BSTR to an element of the vector.
%group
Win32 oleaut32
%prm
bstr, ppsa
bstr : [int] The BSTR to be converted to a vector.
ppsa : [var] A one-dimensional safearray containing the characters in the BSTR.
%inst
Returns a vector, assigning each character in the BSTR to an element
of the vector.

[戻り値]
This function can return one of these values.
This doc was truncated.

