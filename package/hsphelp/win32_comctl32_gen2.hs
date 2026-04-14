; ============================================================
;   comctl32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
ImageList_Destroy
イメージリストを破棄する。
%group
Win32 comctl32
%prm
himl
himl : [intptr] 型: HIMAGELIST 破棄するイメージリストへのハンドル。
%inst
イメージリストを破棄する。

[戻り値]
型: BOOL 成功した場合は 0 以外、それ以外は 0。


%index
DestroyPropertySheetPage
Destroys a property sheet page. An application must call this function for pages that have not been passed to the PropertySheet function.
%group
Win32 comctl32
%prm
param0
param0 : [intptr] 
%inst
Destroys a property sheet page. An application must call this
function for pages that have not been passed to the PropertySheet
function.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.


%index
CreateMappedBitmap
Creates a bitmap for use in a toolbar.
%group
Win32 comctl32
%prm
hInstance, idBitmap, wFlags, lpColorMap, iNumMaps
hInstance : [intptr] Type: HINSTANCE Handle to the module instance with the executable file that contains the bitmap resource.
idBitmap : [int] Type: INT_PTR Resource identifier of the bitmap resource.
wFlags : [int] Type: UINT Bitmap flag. This parameter can be zero or the following value:
lpColorMap : [var] Type: LPCOLORMAP Pointer to a COLORMAP structure that contains the color information needed to map the bitmaps. If this parameter is NULL, the function uses the default color map.
iNumMaps : [int] Type: int Number of color maps pointed to by lpColorMap.
%inst
Creates a bitmap for use in a toolbar.

[戻り値]
Type: HBITMAP Returns the handle to the bitmap if successful, or NULL
otherwise. To retrieve extended error information, call GetLastError.

[備考]
The function creates a new bitmap using the bitmap data and colors
specified by the bitmap resource and the color mapping information.
This function is fully supported only for images with color maps;
that is, images with 256 or fewer colors.


%index
CreatePropertySheetPageW
Creates a new page for a property sheet. (Unicode)
%group
Win32 comctl32
%prm
constPropSheetPagePointer
constPropSheetPagePointer : [var] Type: LPCPROPSHEETPAGE Pointer to a PROPSHEETPAGE structure that defines a page to be included in a property sheet.
%inst
Creates a new page for a property sheet. (Unicode)

[戻り値]
Type: HPROPSHEETPAGE Returns the handle to the new property page if
successful, or NULL otherwise.

[備考]
Note Before common controls version 7.0, this function did not
support visual styles. An application uses the PropertySheet function
to create a property sheet that includes the new page. If you are not
using the Aero wizard style (PSH_AEROWIZARD), the application can use
the PSM_ADDPAGE message to add the new page to an existing property
sheet. Windows 95: The system can support a maximum of 16,364 window
handles.
> [!NOTE] > The prsht.h header defines CreatePropertySheetPage as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CreateStatusWindowW
Creates a status window, which is typically used to display the status of an application. (Unicode)
%group
Win32 comctl32
%prm
style, lpszText, hwndParent, wID
style : [int] Type: LONG Window styles for the status window. This parameter must include the WS_CHILD style and should also include the WS_VISIBLE style.
lpszText : [wstr] Type: LPCTSTR Pointer to a null-terminated string that specifies the status text for the first part.
hwndParent : [intptr] Type: HWND handle to the parent window.
wID : [int] Type: UINT Control identifier for the status window. The window procedure uses this value to identify messages it sends to the parent window.
%inst
Creates a status window, which is typically used to display the
status of an application. (Unicode)

[戻り値]
Type: HWND Returns the handle to the status window if successful, or
NULL otherwise. To retrieve extended error information, call
GetLastError.

[備考]
The CreateStatusWindow function calls the CreateWindow function to
create the window. It passes the parameters to without modification
and sets the position, width, and height parameters to CreateWindow
default values.
> [!NOTE] > The commctrl.h header defines CreateStatusWindow as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
CreateUpDownControl
Creates an up-down control. Note:\_This function is obsolete. It is a 16 bit function and cannot handle 32 bit values for range and position.
%group
Win32 comctl32
%prm
dwStyle, x, y, cx, cy, hParent, nID, hInst, hBuddy, nUpper, nLower, nPos
dwStyle : [int] Type: DWORD Window styles for the control. This parameter should include the WS_CHILD, WS_BORDER, and WS_VISIBLE styles, and it may include any of the window styles specific to the up-down control.
x : [int] Type: int Horizontal coordinate, in client coordinates, of the upper-left corner of the control.
y : [int] Type: int Vertical coordinate, in client coordinates, of the upper-left corner of the control.
cx : [int] Type: int Width, in pixels, of the up-down control.
cy : [int] Type: int Height, in pixels, of the up-down control.
hParent : [intptr] Type: HWND Handle to the parent window of the up-down control.
nID : [int] Type: int Identifier for the up-down control.
hInst : [intptr] Type: HINSTANCE Handle to the module instance of the application creating the up-down control.
hBuddy : [intptr] Type: HWND Handle to the window associated with the up-down control. If this parameter is NULL, the control has no buddy window.
nUpper : [int] Type: int Upper limit (range) of the up-down control.
nLower : [int] Type: int Lower limit (range) of the up-down control.
nPos : [int] Type: int Position of the control.
%inst
Creates an up-down control. Note:\_This function is obsolete. It is a
16 bit function and cannot handle 32 bit values for range and
position.

[戻り値]
Type: HWND If the function succeeds, the return value is the window
handle to the up-down control. If the function fails, the return
value is NULL.


%index
DPA_Destroy
Frees a Dynamic Pointer Array (DPA).
%group
Win32 comctl32
%prm
hdpa
hdpa : [intptr] Type: HDPA A handle to a DPA.
%inst
Frees a Dynamic Pointer Array (DPA).

[戻り値]
Type: BOOL Returns TRUE on success, FALSE on failure.


%index
DPA_Clone
Duplicates a dynamic pointer array (DPA).
%group
Win32 comctl32
%prm
hdpa, hdpaNew
hdpa : [intptr] Type: const HDPA A handle to an existing DPA to copy.
hdpaNew : [intptr] Type: HDPA When NULL, a new array is copied from hdpaSource.
%inst
Duplicates a dynamic pointer array (DPA).

[戻り値]
Type: HDPA The handle to the new or altered DPA (hdpaNew) if
successful; otherwise, NULL.

[備考]
DPA_Clone is not exported by name or declared in a public header
file. To use it, you must use GetProcAddress and request ordinal 331
from ComCtl32.dll to obtain a function pointer.


%index
DPA_Create
Creates a dynamic pointer array (DPA).
%group
Win32 comctl32
%prm
cItemGrow
cItemGrow : [int] Type: int The number of elements by which the array should be expanded, if the DPA needs to be enlarged.
%inst
Creates a dynamic pointer array (DPA).

[戻り値]
Type: HDPA Returns a handle to a DPA if successful, or NULL if the
call fails.


%index
DPA_CreateEx
Creates a dynamic pointer array (DPA) using a given specified size and heap location.
%group
Win32 comctl32
%prm
cpGrow, hheap
cpGrow : [int] Type: int The number of elements by which the array should be expanded, if the DPA needs to be enlarged.
hheap : [intptr] Type: HANDLE A handle to the heap where the array is stored.
%inst
Creates a dynamic pointer array (DPA) using a given specified size
and heap location.

[戻り値]
Type: HDPA Returns a handle to a DPA if successful, or NULL if the
call fails.

[備考]
DPA_CreateEx is not exported by name. To use it, you must use
GetProcAddress and request ordinal 340 from ComCtl32.dll to obtain a
function pointer.


%index
DPA_DeleteAllPtrs
Removes all items from a dynamic pointer array (DPA) and shrinks the DPA accordingly.
%group
Win32 comctl32
%prm
hdpa
hdpa : [intptr] Type: HDPA Handle to a DPA.
%inst
Removes all items from a dynamic pointer array (DPA) and shrinks the
DPA accordingly.

[戻り値]
Type: BOOL Returns TRUE on success or FALSE on failure.


%index
DPA_DeletePtr
Removes an item from a dynamic pointer array (DPA). The DPA shrinks if necessary to accommodate the removed item.
%group
Win32 comctl32
%prm
hdpa, i
hdpa : [intptr] Type: HDPA A handle to a DPA.
i : [int] Type: int An index of item to be removed from DPA.
%inst
Removes an item from a dynamic pointer array (DPA). The DPA shrinks
if necessary to accommodate the removed item.

[戻り値]
Returns the removed item or NULL, if the call fails.


%index
DPA_DestroyCallback
Calls pfnCB on each element of the dynamic pointer array (DPA), then frees the DPA.
%group
Win32 comctl32
%prm
hdpa, pfnCB, pData
hdpa : [intptr] Type: HDPA A handle to a DPA.
pfnCB : [int] Type: PFNDPAENUMCALLBACK A callback function pointer. See PFNDPAENUMCALLBACK for the callback function prototype.
pData : [intptr] Type: void* A callback data pointer. pData is passed as a parameter to pfnCB.
%inst
Calls pfnCB on each element of the dynamic pointer array (DPA), then
frees the DPA.


%index
DPA_EnumCallback
Iterates through the Dynamic Pointer Array (DPA) and calls pfnCB on each item.
%group
Win32 comctl32
%prm
hdpa, pfnCB, pData
hdpa : [intptr] Type: HDPA A handle to a DPA.
pfnCB : [int] Type: PFNDPAENUMCALLBACK A callback function pointer. See PFNDPAENUMCALLBACK for the callback function prototype.
pData : [intptr] Type: void* A callback data pointer. pData is passed as a parameter to pfnCB.
%inst
Iterates through the Dynamic Pointer Array (DPA) and calls pfnCB on
each item.


%index
DPA_GetPtr
Gets an item from a dynamic pointer array (DPA).
%group
Win32 comctl32
%prm
hdpa, i
hdpa : [intptr] Type: HDPA A handle to a DPA.
i : [int] Type: int The index of item to be retrieved.
%inst
Gets an item from a dynamic pointer array (DPA).

[戻り値]
Returns the specified item or NULL, if the call fails.


%index
DPA_GetPtrIndex
Gets the index of a matching item found in a dynamic pointer array (DPA).
%group
Win32 comctl32
%prm
hdpa, p
hdpa : [intptr] Type: HDPA A handle to an existing DPA.
p : [intptr] Type: const void* A pointer to an item to locate in hdpa.
%inst
Gets the index of a matching item found in a dynamic pointer array
(DPA).

[戻り値]
Type: int The index of the item pointed to by pvoid, if found;
otherwise, -1.

[備考]
DPA_GetPtrIndex is not exported by name. To use it, you must use
GetProcAddress and request ordinal 333 from ComCtl32.dll to obtain a
function pointer.


%index
DPA_Grow
Changes the number of pointers in a dynamic pointer array (DPA).
%group
Win32 comctl32
%prm
pdpa, cp
pdpa : [intptr] Type: HDPA A handle to an existing DPA.
cp : [int] Type: int The number of pointers desired in the DPA.
%inst
Changes the number of pointers in a dynamic pointer array (DPA).

[戻り値]
Type: BOOL Returns TRUE if successful, or FALSE otherwise.

[備考]
If cp is less than the number of pointers already in the DPA, the DPA
is left unchanged. If cp is greater than the number of pointers in
the DPA, the added pointers are initialized to NULL.


%index
DPA_InsertPtr
Inserts a new item at a specified position in a dynamic pointer array (DPA). If necessary, the DPA expands to accommodate the new item.
%group
Win32 comctl32
%prm
hdpa, i, p
hdpa : [intptr] Type: HDPA A handle to a DPA.
i : [int] Type: int Tbe position where new item is to be inserted.
p : [intptr] Type: void* A pointer to the item that is to be inserted.
%inst
Inserts a new item at a specified position in a dynamic pointer array
(DPA). If necessary, the DPA expands to accommodate the new item.

[戻り値]
Type: int Returns the index of the new item or -1, if the insertion
fails.


%index
DPA_LoadStream
Loads the dynamic pointer array (DPA) from a stream by calling the specified callback function to read each element.
%group
Win32 comctl32
%prm
phdpa, pfn, pstream, pvInstData
phdpa : [intptr] Type: HDPA* A handle to a DPA.
pfn : [int] Type: PFNDPASTREAM The callback function. See PFNDPASTREAM for the callback function prototype.
pstream : [var] Type: IStream* An IStream object.
pvInstData : [intptr] Type: void* A pointer to callback data. pvInstData is passed as a parameter to pfn.
%inst
Loads the dynamic pointer array (DPA) from a stream by calling the
specified callback function to read each element.

[戻り値]
Type: HRESULT Returns one of the following values.
This doc was truncated.

[備考]
This function must be called directly from ComCtl32.dll. It is
ordinal 9. The callback is responsible for writing the pvInstData
data to the stream.


%index
DPA_Merge
Combines the contents of two dynamic pointer arrays (DPAs).
%group
Win32 comctl32
%prm
hdpaDest, hdpaSrc, dwFlags, pfnCompare, pfnMerge, lParam
hdpaDest : [intptr] Type: HDPA A handle to the first DPA. This array can be optionally presorted. When this function returns, contains the handle to the merged array.
hdpaSrc : [intptr] Type: HDPA A handle to the second DPA. This array can be optionally presorted.
dwFlags : [int] Type: DWORD Options determining the method used to merge the two arrays. DPAM_NORMAL, DPAM_UNION, and DPAM_UNION are mutually exclusive?only one of those flags can be set, optionally in conjunction with DPAM_SORTED.
pfnCompare : [int] Type: PFNDPACOMPARE The PFNDPACOMPARE callback function that compares two elements, one from each DPA, to determine whether they are the same item. If so, the callback function pointed to by pfnCompare is called.
pfnMerge : [int] Type: PFNDPAMERGE The PFNDPAMERGE callback function that merges the contents when an element is found in both DPAs and is found to be the same item by PFNDPACOMPARE.
lParam : [intptr] Type: LPARAM Additional parameter used to declare the basis of comparison upon which equality is determined.
%inst
Combines the contents of two dynamic pointer arrays (DPAs).

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE.

[備考]
DPA_Merge is not exported by name. To use it, you must use
GetProcAddress and request ordinal 11 from ComCtl32.dll to obtain a
function pointer.


%index
DPA_SaveStream
Saves the dynamic pointer array (DPA) to a stream by writing out a header, and then calling the specified callback function to write each element.
%group
Win32 comctl32
%prm
hdpa, pfn, pstream, pvInstData
hdpa : [intptr] Type: HDPA Receives a handle to a DPA.
pfn : [int] Type: PFNDPASTREAM The callback function. See PFNDPASTREAM for the callback function prototype.
pstream : [var] Type: IStream* An IStream object.
pvInstData : [intptr] Type: void* A pointer to callback data. pvInstData is passed as a parameter to pfn.
%inst
Saves the dynamic pointer array (DPA) to a stream by writing out a
header, and then calling the specified callback function to write
each element.

[戻り値]
Type: HRESULT Returns one of the following values.
This doc was truncated.

[備考]
This function must be called directly from ComCtl32.dll. It is
ordinal 10. The callback is responsible for writing the pvInstData
data to the stream.


%index
DPA_Search
Finds an item in a dynamic pointer array (DPA).
%group
Win32 comctl32
%prm
hdpa, pFind, iStart, pfnCompare, lParam, options
hdpa : [intptr] Type: HDPA A handle to a DPA.
pFind : [intptr] Type: void* A pointer to search for.
iStart : [int] Type: int The index at which to start search.
pfnCompare : [int] Type: PFNDPACOMPARE A comparison function pointer. See PFNDPACOMPARE for the comparison function prototype.
lParam : [intptr] Type: LPARAM An additional parameter to be passed to pfnCmp.
options : [int] Type: UINT This parameter may be one or more of the following.
%inst
Finds an item in a dynamic pointer array (DPA).

[戻り値]
Type: int Returns the index where the item was found in the DPA or -1
if the item was not found.


%index
DPA_SetPtr
Assigns a value to an item in a dynamic pointer array (DPA).
%group
Win32 comctl32
%prm
hdpa, i, p
hdpa : [intptr] Type: HDPA A handle to a DPA.
i : [int] Type: int The index of the item in the DPA. Note??If the index is beyond the current size of the DPA, the DPA expands to accommodate it. You do not need to assign items contiguously.
p : [intptr] Type: void* A pointer to the value to assign to the specified DPA item.
%inst
Assigns a value to an item in a dynamic pointer array (DPA).

[戻り値]
Type: BOOL Returns TRUE if successful, or FALSE otherwise.


%index
DPA_Sort
Sorts the items in a Dynamic Pointer Array (DPA).
%group
Win32 comctl32
%prm
hdpa, pfnCompare, lParam
hdpa : [intptr] Type: HDPA A handle to a DPA.
pfnCompare : [int] Type: PFNDPACOMPARE A comparison function pointer. See PFNDPACOMPARE for the comparison function prototype.
lParam : [intptr] Type: LPARAM An additional parameter to be passed to pfnCmp.
%inst
Sorts the items in a Dynamic Pointer Array (DPA).

[戻り値]
Type: BOOL Returns TRUE on success or FALSE on failure.


%index
DSA_Destroy
Frees a dynamic structure array (DSA).
%group
Win32 comctl32
%prm
hdsa
hdsa : [intptr] Type: HDSA A handle to a DSA to destroy.
%inst
Frees a dynamic structure array (DSA).

[戻り値]
Type: BOOL Returns TRUE on success, FALSE on failure.


%index
DSA_Create
Creates a dynamic structure array (DSA).
%group
Win32 comctl32
%prm
cbItem, cItemGrow
cbItem : [int] Type: int The size, in bytes, of the item.
cItemGrow : [int] Type: int The number of items by which the array should be incremented, if the DSA needs to be enlarged.
%inst
Creates a dynamic structure array (DSA).

[戻り値]
Type: HDSA Returns a handle to a DSA if successful, or NULL if the
creation fails.

[備考]
Unlike a dynamic pointer array (DPA), a DSA can contain elements of
any size. This allows structures to be stored directly in the array.


%index
DSA_DeleteAllItems
Deletes all items from a dynamic structure array (DSA).
%group
Win32 comctl32
%prm
hdsa
hdsa : [intptr] Type: HDSA A handle to an existing DSA.
%inst
Deletes all items from a dynamic structure array (DSA).

[戻り値]
Type: BOOL TRUE if the items were successfully deleted; otherwise,
FALSE.


%index
DSA_DeleteItem
Deletes an item from a dynamic structure array (DSA).
%group
Win32 comctl32
%prm
hdsa, i
hdsa : [intptr] Type: HDSA A handle to an existing DSA.
i : [int] Type: int The zero-based index of the item to delete.
%inst
Deletes an item from a dynamic structure array (DSA).

[戻り値]
Type: BOOL TRUE if the item was successfully deleted; otherwise,
FALSE.

[備考]
DSA_DeleteItem is not exported by name. To use it, you must use
GetProcAddress and request ordinal 326 from ComCtl32.dll to obtain a
function pointer.


%index
DSA_DestroyCallback
Iterates through a dynamic structure array (DSA), calling a specified callback function on each item. Upon reaching the end of the array, the DSA is freed.
%group
Win32 comctl32
%prm
hdsa, pfnCB, pData
hdsa : [intptr] Type: HDSA A handle to a DSA to walk and destroy.
pfnCB : [int] Type: PFNDSAENUMCALLBACK A callback function pointer. For the callback function prototype, see PFNDSAENUMCALLBACK.
pData : [intptr] Type: void* A callback data pointer. This pointer is, in turn, passed as a parameter to pfnCB.
%inst
Iterates through a dynamic structure array (DSA), calling a specified
callback function on each item. Upon reaching the end of the array,
the DSA is freed.


%index
DSA_EnumCallback
Iterates through the dynamic structure array (DSA) and calls pfnCB on each item.
%group
Win32 comctl32
%prm
hdsa, pfnCB, pData
hdsa : [intptr] Type: HDSA A handle to an existing DSA.
pfnCB : [int] Type: PFNDAENUMCALLBACK* A callback function pointer. See PFNDSAENUMCALLBACK for the callback function prototype.
pData : [intptr] Type: void* A callback data pointer. pData is passed as a parameter to pfnCB.
%inst
Iterates through the dynamic structure array (DSA) and calls pfnCB on
each item.


%index
DSA_GetItem
Gets an element from a dynamic structure array (DSA).
%group
Win32 comctl32
%prm
hdsa, i, pitem
hdsa : [intptr] Type: HDSA A handle to the DSA containing the element.
i : [int] Type: int The index of the element to be retrieved (zero-based).
pitem : [intptr] Type: void* A pointer to a buffer which is filled with a copy of the specified element of the DSA.
%inst
Gets an element from a dynamic structure array (DSA).

[戻り値]
Type: BOOL Returns TRUE if successful or FALSE otherwise.

[備考]
DSA_GetItem is not exported by name. To use it, you must use
GetProcAddress and request ordinal 322 from ComCtl32.dll to obtain a
function pointer. Using the element pointer that this function
retrieves, you can modify the data in that element directly. However,
be aware that a subsequent insert or destroy operation could cause
this pointer value to become invalid or to point to a different
element.


%index
DSA_GetItemPtr
Gets a pointer to an element from a dynamic structure array (DSA).
%group
Win32 comctl32
%prm
hdsa, i
hdsa : [intptr] Type: HDSA A handle to the DSA containing the element.
i : [int] Type: int The index of the element to be retrieved (zero-based).
%inst
Gets a pointer to an element from a dynamic structure array (DSA).

[戻り値]
Returns a pointer to the specified element or NULL if the call fails.

[備考]
Using the element pointer that this function returns, you can modify
the data in that element directly. However, be aware that a
subsequent insert or destroy operation could cause this pointer value
to become invalid or to point to a different element.


%index
DSA_InsertItem
Inserts a new item into a dynamic structure array (DSA). If necessary, the DSA expands to accommodate the new item.
%group
Win32 comctl32
%prm
hdsa, i, pitem
hdsa : [intptr] Type: HDSA A handle to the DSA in which to insert the item.
i : [int] Type: int The position in the DSA where new item is to be inserted, or DSA_APPEND to insert the item at the end of the array.
pitem : [intptr] Type: void* A pointer to the item that is to be inserted.
%inst
Inserts a new item into a dynamic structure array (DSA). If
necessary, the DSA expands to accommodate the new item.

[戻り値]
Type: int Returns the index of the new item if the insertion
succeeds, or DSA_ERR (-1) if the insertion fails.

[備考]
The actual data pointed to by pItem is copied into the DSA.
Subsequent actions performed on that item do not affect the original
copy.


%index
DSA_SetItem
Sets the contents of an element in a dynamic structure array (DSA).
%group
Win32 comctl32
%prm
hdsa, i, pitem
hdsa : [intptr] Type: HDSA A handle to an existing DSA that contains the element.
i : [int] Type: int The zero-based index of the item to set.
pitem : [intptr] Type: void* A pointer to the item that will replace the specified item in the array.
%inst
Sets the contents of an element in a dynamic structure array (DSA).

[戻り値]
Type: BOOL TRUE if successful; otherwise, FALSE.

[備考]
DSA_SetItem is not exported by name. To use it, you must use
GetProcAddress and request ordinal 325 from ComCtl32.dll to obtain a
function pointer.


%index
DefSubclassProc
Calls the next handler in a window's subclass chain. The last handler in the subclass chain calls the original window procedure for the window.
%group
Win32 comctl32
%prm
hWnd, uMsg, wParam, lParam
hWnd : [intptr] Type: HWND A handle to the window being subclassed.
uMsg : [int] Type: UINT A value of type unsigned int that specifies a window message.
wParam : [intptr] Type: WPARAM Specifies additional message information. The contents of this parameter depend on the value of the window message.
lParam : [intptr] Type: LPARAM Specifies additional message information. The contents of this parameter depend on the value of the window message. Note: On 64-bit versions of Windows LPARAM is a 64-bit value.
%inst
Calls the next handler in a window's subclass chain. The last handler
in the subclass chain calls the original window procedure for the
window.

[戻り値]
Type: LRESULT The returned value is specific to the message sent.
This value should be ignored.

[備考]
You do not need to call the default window procedure; this function
calls it automatically. The SUBCLASS module defines helper functions
that are used to subclass windows. The code maintains a single
property on the subclassed window and dispatches various subclass
callbacks to its clients as required. The client is provided
reference data and a default processing API. A subclass callback is
identified by a unique pairing of a callback function pointer and an
unsigned ID value. Each callback can also store a single DWORD of
reference data, which is passed to the callback function when it is
called to filter messages. No reference counting is performed for the
callback; it may repeatedly call SetWindowSubclass to alter the value
of its reference data element. Warning You cannot use the subclassing
helper functions to subclass a window across threads.


%index
DrawInsert
Draws the insert icon in the parent window of the specified drag list box.
%group
Win32 comctl32
%prm
handParent, hLB, nItem
handParent : [intptr] Type: HWND A handle to the parent window of the drag list box.
hLB : [intptr] Type: HWND A handle to the drag list box.
nItem : [int] Type: int The identifier of the icon item to be drawn.
%inst
Draws the insert icon in the parent window of the specified drag list
box.


%index
DrawStatusTextW
The DrawStatusText function draws the specified text in the style of a status window with borders. (Unicode)
%group
Win32 comctl32
%prm
hDC, lprc, pszText, uFlags
hDC : [intptr] Type: HDC Handle to the display context for the window.
lprc : [var] Type: LPCRECT Pointer to a RECT structure that contains the position, in client coordinates, of the rectangle in which the text is drawn. The function draws the borders just inside the edges of the specified rectangle.
pszText : [wstr] Type: LPCTSTR Pointer to a null-terminated string that specifies the text to display. Tab characters in the string determine whether the string is left-aligned, right-aligned, or centered.
uFlags : [int] Type: UINT Text drawing flags. This parameter can be a combination of these values:
%inst
The DrawStatusText function draws the specified text in the style of
a status window with borders. (Unicode)

[備考]
Normal windows display text left-to-right (LTR). Windows can be
mirrored to display languages such as Hebrew or Arabic that read
right-to-left (RTL). Normally, the pszText string will be displayed
in the same direction as the text in its parent window. If
SBT_RTLREADING is set, the pszText string will read in the opposite
direction from the text in the parent window.
> [!NOTE] > The commctrl.h header defines DrawStatusText as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
FlatSB_EnableScrollBar
Enables or disables one or both flat scroll bar direction buttons. If flat scroll bars are not initialized for the window, this function calls the standard EnableScrollBar function.
%group
Win32 comctl32
%prm
param0, param1, param2
param0 : [intptr] 
param1 : [int] 
param2 : [int] 
%inst
Enables or disables one or both flat scroll bar direction buttons. If
flat scroll bars are not initialized for the window, this function
calls the standard EnableScrollBar function.

[戻り値]
Type: BOOL Returns nonzero if the scroll bar changes, or zero
otherwise.

[備考]
Note Flat scroll bar functions are implemented in Comctl32.dll
versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do
not support flat scroll bars.


%index
FlatSB_GetScrollInfo
Gets the information for a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard GetScrollInfo function.
%group
Win32 comctl32
%prm
param0, code, param2
param0 : [intptr] 
code : [int] Type: int
param2 : [var] 
%inst
Gets the information for a flat scroll bar. If flat scroll bars are
not initialized for the window, this function calls the standard
GetScrollInfo function.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
Note Flat scroll bar functions are implemented in Comctl32.dll
versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do
not support flat scroll bars.


%index
FlatSB_GetScrollPos
Gets the thumb position in a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard GetScrollPos function.
%group
Win32 comctl32
%prm
param0, code
param0 : [intptr] 
code : [int] Type: int
%inst
Gets the thumb position in a flat scroll bar. If flat scroll bars are
not initialized for the window, this function calls the standard
GetScrollPos function.

[戻り値]
Type: int Returns the current thumb position of the specified flat
scroll bar.

[備考]
Note Flat scroll bar functions are implemented in Comctl32.dll
versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do
not support flat scroll bars.


%index
FlatSB_GetScrollProp
Gets the properties for a flat scroll bar. This function can also be used to determine if InitializeFlatSB has been called for this window.
%group
Win32 comctl32
%prm
param0, propIndex, param2
param0 : [intptr] 
propIndex : [int] Type: UINT The parameter that determines what
param2 : [var] 
%inst
Gets the properties for a flat scroll bar. This function can also be
used to determine if InitializeFlatSB has been called for this
window.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise. If index
is WSB_PROP_HSTYLE, the return is nonzero if InitializeFlatSB has
been called for this window, or zero otherwise.

[備考]
Note Flat scroll bar functions are implemented in Comctl32.dll
versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do
not support flat scroll bars.


%index
FlatSB_GetScrollRange
Gets the scroll range for a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard GetScrollRange function.
%group
Win32 comctl32
%prm
param0, code, param2, param3
param0 : [intptr] 
code : [int] Type: int
param2 : [var] 
param3 : [var] 
%inst
Gets the scroll range for a flat scroll bar. If flat scroll bars are
not initialized for the window, this function calls the standard
GetScrollRange function.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
Note Flat scroll bar functions are implemented in Comctl32.dll
versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do
not support flat scroll bars.


%index
FlatSB_SetScrollInfo
Sets the information for a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard SetScrollInfo function.
%group
Win32 comctl32
%prm
param0, code, psi, fRedraw
param0 : [intptr] 
code : [int] Type: int
psi : [var] Type: LPSCROLLINFO A pointer to a SCROLLINFO structure that contains the new information for the specified scroll bar. The cbSize and
fRedraw : [int] Type: BOOL Specifies whether the scroll bar should be redrawn immediately to reflect the change. If this parameter is TRUE, the scroll bar is redrawn; if it is FALSE, the scroll bar is not redrawn.
%inst
Sets the information for a flat scroll bar. If flat scroll bars are
not initialized for the window, this function calls the standard
SetScrollInfo function.

[戻り値]
Type: int Returns the current scroll position. If the call to
FlatSB_SetScrollInfo changes the scroll position, then the previous
position is returned.

[備考]
Note Flat scroll bar functions are implemented in Comctl32.dll
versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do
not support flat scroll bars.


%index
FlatSB_SetScrollPos
Sets the current position of the thumb in a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard SetScrollPos function.
%group
Win32 comctl32
%prm
param0, code, pos, fRedraw
param0 : [intptr] 
code : [int] Type: int
pos : [int] Type: int The new thumb position.
fRedraw : [int] Type: BOOL Specifies whether the scroll bar should be redrawn immediately to reflect the change. If this parameter is TRUE, the scroll bar is redrawn; if it is FALSE, the scroll bar is not redrawn.
%inst
Sets the current position of the thumb in a flat scroll bar. If flat
scroll bars are not initialized for the window, this function calls
the standard SetScrollPos function.

[戻り値]
Type: int Returns the previous position of the thumb in the specified
flat scroll bar.

[備考]
Note Flat scroll bar functions are implemented in Comctl32.dll
versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do
not support flat scroll bars.


%index
FlatSB_SetScrollProp
Sets the properties for a flat scroll bar.
%group
Win32 comctl32
%prm
param0, index, newValue, param3
param0 : [intptr] 
index : [int] Type: UINT Determines what
newValue : [int] Type: INT_PTR A new value to set. This parameter depends on the flag passed in index.
param3 : [int] 
%inst
Sets the properties for a flat scroll bar.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
Note Flat scroll bar functions are implemented in Comctl32.dll
versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do
not support flat scroll bars.


%index
FlatSB_SetScrollRange
Sets the scroll range of a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard SetScrollRange function.
%group
Win32 comctl32
%prm
param0, code, min, max, fRedraw
param0 : [intptr] 
code : [int] Type: int
min : [int] Type: int The new minimum scroll range value.
max : [int] Type: int The new maximum scroll range value.
fRedraw : [int] Type: BOOL Specifies whether the scroll bar should be redrawn immediately to reflect the change. If this parameter is TRUE, the scroll bar is redrawn; if it is FALSE, the scroll bar is not redrawn.
%inst
Sets the scroll range of a flat scroll bar. If flat scroll bars are
not initialized for the window, this function calls the standard
SetScrollRange function.

[戻り値]
Type: int Returns nonzero if successful, or zero otherwise.

[備考]
Note Flat scroll bar functions are implemented in Comctl32.dll
versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do
not support flat scroll bars.


%index
FlatSB_ShowScrollBar
Shows or hides a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard ShowScrollBar function.
%group
Win32 comctl32
%prm
param0, code, param2
param0 : [intptr] 
code : [int] Type: int
param2 : [int] 
%inst
Shows or hides a flat scroll bar. If flat scroll bars are not
initialized for the window, this function calls the standard
ShowScrollBar function.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
Note Flat scroll bar functions are implemented in Comctl32.dll
versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do
not support flat scroll bars.


%index
GetEffectiveClientRect
Calculates the dimensions of a rectangle in the client area that contains all the specified controls.
%group
Win32 comctl32
%prm
hWnd, lprc, lpInfo
hWnd : [intptr] Type: HWND A handle to the window that has the client area to check.
lprc : [var] Type: LPRECT A pointer to a RECT structure that receives the dimensions of the rectangle.
lpInfo : [var] Type: const INT* A pointer to a null-terminated array of integers that identify controls in the client area. Each control requires a pair of consecutive elements. The first element of the pair must be nonzero and the second element of the pair must be the control identifier. The first pair represents the menu and is ignored. The last element must be zero to identify the end of the array.
%inst
Calculates the dimensions of a rectangle in the client area that
contains all the specified controls.

[備考]
If a window in the lprc array is visible, or will be visible when its
parent becomes visible, its rectangle is subtracted from the
effective client rectangle.


%index
GetMUILanguage
Gets the language currently in use by the common controls for a particular process.
%group
Win32 comctl32
%prm

%inst
Gets the language currently in use by the common controls for a
particular process.

[戻り値]
Type: LANGID Returns the language identifier of the language an
application has specified for the common controls by calling
InitMUILanguage. GetMUILanguage returns the value for the process
from which it is called. If InitMUILanguage has not been called or
was not called from the same process, GetMUILanguage returns the
language-neutral LANGID, MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL).

[備考]
See Internationalization for Windows Applications for further
discussion of localization.


%index
ImageList_Add
イメージリストに 1 つ以上のイメージを追加する。(ImageList_Add)
%group
Win32 comctl32
%prm
himl, hbmImage, hbmMask
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
hbmImage : [intptr] 型: HBITMAP イメージを含むビットマップへのハンドル。イメージ数はビットマップの幅から推論される。
hbmMask : [intptr] 型: HBITMAP マスクを含むビットマップへのハンドル。イメージリストでマスクが使用されない場合は無視される。NULL を指定できる。
%inst
イメージリストに 1 つ以上のイメージを追加する。(ImageList_Add)

[戻り値]
型: int 成功した場合は最初の新しいイメージのインデックス、それ以外は -1。

[備考]
ImageList_Add はビットマップを内部データ構造にコピーする。関数が戻った後、DeleteObject で hbmImage と
hbmMask を必ず削除する。


%index
ImageList_AddMasked
Adds an image or images to an image list, generating a mask from the specified bitmap. (ImageList_AddMasked)
%group
Win32 comctl32
%prm
himl, hbmImage, crMask
himl : [intptr] Type: HIMAGELIST A handle to the image list.
hbmImage : [intptr] Type: HBITMAP A handle to the bitmap that contains one or more images. The number of images is inferred from the width of the bitmap.
crMask : [int] Type: COLORREF The color used to generate the mask. Each pixel of this color in the specified bitmap is changed to black, and the corresponding bit in the mask is set to 1. If this parameter is CLR_DEFAULT, then the color of the pixel at (0,0) is used as the mask.
%inst
Adds an image or images to an image list, generating a mask from the
specified bitmap. (ImageList_AddMasked)

[戻り値]
Type: int Returns the index of the first new image if successful, or
-1 otherwise.

[備考]
The ImageList_AddMasked function copies the bitmap to an internal
data structure. Bitmaps with color depth greater than 8bpp are not
supported. Be sure to use the DeleteObject function to delete
hbmImage after the function returns.


%index
ImageList_BeginDrag
Begins dragging an image. (ImageList_BeginDrag)
%group
Win32 comctl32
%prm
himlTrack, iTrack, dxHotspot, dyHotspot
himlTrack : [intptr] Type: HIMAGELIST A handle to the image list.
iTrack : [int] Type: int The index of the image to drag.
dxHotspot : [int] Type: int The x-coordinate of the location of the drag position relative to the upper-left corner of the image.
dyHotspot : [int] Type: int The y-coordinate of the location of the drag position relative to the upper-left corner of the image.
%inst
Begins dragging an image. (ImageList_BeginDrag)

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
This function creates a temporary image list that is used for
dragging. In response to subsequent WM_MOUSEMOVE messages, you can
move the drag image by using the ImageList_DragMove function. To end
the drag operation, you can use the ImageList_EndDrag function.


%index
ImageList_Copy
Copies images within a given image list.
%group
Win32 comctl32
%prm
himlDst, iDst, himlSrc, iSrc, uFlags
himlDst : [intptr] Type: HIMAGELIST A handle to an image list that is the target of the copy operation. In current versions of Windows, both himlDst and himlSrc must be identical.
iDst : [int] Type: int The zero-based index of the image to be used as the destination of the copy operation.
himlSrc : [intptr] Type: HIMAGELIST A handle to an image list that is the target of the copy operation. In current versions of Windows, both himlDst and himlSrc must be identical.
iSrc : [int] Type: int The zero-based index of the image to be used as the source of the copy operation.
uFlags : [int] Type: UINT
%inst
Copies images within a given image list.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.


%index
ImageList_Create
新しいイメージリストを作成する。
%group
Win32 comctl32
%prm
cx, cy, flags, cInitial, cGrow
cx : [int] 型: int 各イメージの幅(ピクセル単位)。
cy : [int] 型: int 各イメージの高さ(ピクセル単位)。
flags : [int] 型: UINT 作成するイメージリストの種類を指定するビットフラグのセット。Image List Creation Flags の組み合わせ。
cInitial : [int] 型: int イメージリストが初期に格納するイメージ数。
cGrow : [int] 型: int システムが新しいイメージのために空きを作る必要があるときにイメージリストが成長できるイメージ数。
%inst
新しいイメージリストを作成する。

[戻り値]
型: HIMAGELIST 成功した場合はイメージリストへのハンドル、それ以外は NULL。

[備考]
使用が終わったら ImageList_Destroy を呼んで破棄する。Comctl32.dll バージョン 6
を使うにはマニフェストで指定する必要がある。


%index
ImageList_DragEnter
Displays the drag image at the specified position within the window.
%group
Win32 comctl32
%prm
hwndLock, x, y
hwndLock : [intptr] Type: HWND A handle to the window that owns the drag image.
x : [int] Type: int The x-coordinate at which to display the drag image. The coordinate is relative to the upper-left corner of the window, not the client area.
y : [int] Type: int The y-coordinate at which to display the drag image. The coordinate is relative to the upper-left corner of the window, not the client area.
%inst
Displays the drag image at the specified position within the window.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
To begin a drag operation, use the ImageList_BeginDrag function.


%index
ImageList_DragLeave
Unlocks the specified window and hides the drag image, allowing the window to be updated.
%group
Win32 comctl32
%prm
hwndLock
hwndLock : [intptr] Type: HWND A handle to the window that owns the drag image.
%inst
Unlocks the specified window and hides the drag image, allowing the
window to be updated.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.


%index
ImageList_DragMove
Moves the image that is being dragged during a drag-and-drop operation. This function is typically called in response to a WM_MOUSEMOVE message. (ImageList_DragMove)
%group
Win32 comctl32
%prm
x, y
x : [int] Type: int The x-coordinate at which to display the drag image. The coordinate is relative to the upper-left corner of the window, not the client area.
y : [int] Type: int The y-coordinate at which to display the drag image. The coordinate is relative to the upper-left corner of the window, not the client area.
%inst
Moves the image that is being dragged during a drag-and-drop
operation. This function is typically called in response to a
WM_MOUSEMOVE message. (ImageList_DragMove)

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
To begin a drag operation, use the ImageList_BeginDrag function.


%index
ImageList_DragShowNolock
Shows or hides the image being dragged. (ImageList_DragShowNolock)
%group
Win32 comctl32
%prm
fShow
fShow : [int] Type: BOOL A value specifying whether to show or hide the image being dragged. Specify TRUE to show the image or FALSE to hide the image.
%inst
Shows or hides the image being dragged. (ImageList_DragShowNolock)

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.


%index
ImageList_Draw
指定したデバイスコンテキストにイメージリスト項目を描画する。(ImageList_Draw)
%group
Win32 comctl32
%prm
himl, i, hdcDst, x, y, fStyle
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
i : [int] 型: int 描画するイメージの 0 ベースインデックス。
hdcDst : [intptr] 型: HDC 先デバイスコンテキストへのハンドル。
x : [int] 型: int 指定デバイスコンテキスト内で描画する x 座標。
y : [int] 型: int 指定デバイスコンテキスト内で描画する y 座標。
fStyle : [int] 型: UINT
%inst
指定したデバイスコンテキストにイメージリスト項目を描画する。(ImageList_Draw)

[戻り値]
型: BOOL 成功した場合は 0 以外、それ以外は 0。

[備考]
オーバーレイイメージは i で指定される主イメージの上に透過的に描画される。fStyle でオーバーレイイメージを指定するには、1
ベースのオーバーレイイメージインデックスをシフトする INDEXTOOVERLAYMASK マクロを使う。事前に
ImageList_SetOverlayImage でオーバーレイイメージとして指定しておく必要がある。


%index
ImageList_DrawEx
Draws an image list item in the specified device context. The function uses the specified drawing style and blends the image with the specified color.
%group
Win32 comctl32
%prm
himl, i, hdcDst, x, y, dx, dy, rgbBk, rgbFg, fStyle
himl : [intptr] Type: HIMAGELIST A handle to the image list
i : [int] Type: int The index of the image to draw.
hdcDst : [intptr] Type: HDC A handle to the destination device context.
x : [int] Type: int The x-coordinate at which to draw within the specified device context.
y : [int] Type: int The y-coordinate at which to draw within the specified device context.
dx : [int] Type: int The width of the portion of the image to draw relative to the upper-left corner of the image. If dx and dy are zero, the function draws the entire image. The function does not ensure that the parameters are valid.
dy : [int] Type: int The height of the portion of the image to draw, relative to the upper-left corner of the image. If dx and dy are zero, the function draws the entire image. The function does not ensure that the parameters are valid.
rgbBk : [int] Type: COLORREF
rgbFg : [int] Type: COLORREF
fStyle : [int] Type: UINT
%inst
Draws an image list item in the specified device context. The
function uses the specified drawing style and blends the image with
the specified color.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
An overlay image is drawn transparently over the primary image
specified in the i parameter. To specify an overlay image in the
fStyle parameter, use the INDEXTOOVERLAYMASK macro to shift the
one-based index of the overlay image. Use the OR operator to
logically combine the return value of the macro with the drawing
style flags specified in the fStyle parameter. You must first specify
this image as an overlay image by using the ImageList_SetOverlayImage
function.


%index
ImageList_DrawIndirect
Draws an image list image based on an IMAGELISTDRAWPARAMS structure.
%group
Win32 comctl32
%prm
pimldp
pimldp : [var] Type: IMAGELISTDRAWPARAMS* A pointer to an IMAGELISTDRAWPARAMS structure that contains information about the draw operation.
%inst
Draws an image list image based on an IMAGELISTDRAWPARAMS structure.

[戻り値]
Type: BOOL Returns nonzero if successful, and zero otherwise.


%index
ImageList_Duplicate
Creates a duplicate of an existing image list.
%group
Win32 comctl32
%prm
himl
himl : [intptr] Type: HIMAGELIST A handle to the image list to be duplicated. All information contained in the original image list for normal images is copied to the new image list. Overlay images are not copied.
%inst
Creates a duplicate of an existing image list.

[戻り値]
Type: HIMAGELIST Returns the handle to the new duplicate image list
if successful, or NULL otherwise.


%index
ImageList_EndDrag
Ends a drag operation. (ImageList_EndDrag)
%group
Win32 comctl32
%prm

%inst
Ends a drag operation. (ImageList_EndDrag)

[備考]
The temporary image list is destroyed when the ImageList_EndDrag
function is called. To begin a drag operation, use the
ImageList_BeginDrag function.


%index
ImageList_GetBkColor
Retrieves the current background color for an image list.
%group
Win32 comctl32
%prm
himl
himl : [intptr] Type: HIMAGELIST A handle to the image list.
%inst
Retrieves the current background color for an image list.

[戻り値]
Type: COLORREF The return value is the background color.


%index
ImageList_GetDragImage
Retrieves the temporary image list that is used for the drag image. The function also retrieves the current drag position and the offset of the drag image relative to the drag position.
%group
Win32 comctl32
%prm
ppt, pptHotspot
ppt : [var] Type: POINT* A pointer to a POINT structure that receives the current drag position. Can be NULL.
pptHotspot : [var] Type: POINT* A pointer to a POINT structure that receives the offset of the drag image relative to the drag position. Can be NULL.
%inst
Retrieves the temporary image list that is used for the drag image.
The function also retrieves the current drag position and the offset
of the drag image relative to the drag position.

[戻り値]
Type: HIMAGELIST Returns the handle to the image list if successful,
or NULL otherwise.

[備考]
The temporary image list is destroyed when the ImageList_EndDrag
function is called. To begin a drag operation, use the
ImageList_BeginDrag function.


%index
ImageList_GetIcon
Creates an icon from an image and mask in an image list.
%group
Win32 comctl32
%prm
himl, i, flags
himl : [intptr] Type: HIMAGELIST A handle to the image list.
i : [int] Type: int An index of the image.
flags : [int] Type: UINT A combination of flags that specify the drawing style. For a list of values, see the description of the fStyle parameter of the ImageList_Draw function.
%inst
Creates an icon from an image and mask in an image list.

[戻り値]
Type: HICON Returns the handle to the icon if successful, or NULL
otherwise.

[備考]
It is the responsibility of the calling application to destroy the
icon returned from this function using the DestroyIcon function.


%index
ImageList_GetIconSize
Retrieves the dimensions of images in an image list. All images in an image list have the same dimensions.
%group
Win32 comctl32
%prm
himl, cx, cy
himl : [intptr] Type: HIMAGELIST A handle to the image list.
cx : [var] Type: int* A pointer to an integer variable that receives the width, in pixels, of each image.
cy : [var] Type: int* A pointer to an integer variable that receives the height, in pixels, of each image.
%inst
Retrieves the dimensions of images in an image list. All images in an
image list have the same dimensions.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.


%index
ImageList_GetImageCount
イメージリスト内のイメージ数を取得する。
%group
Win32 comctl32
%prm
himl
himl : [intptr] 型: HIMAGELIST イメージリストへのハンドル。
%inst
イメージリスト内のイメージ数を取得する。

[戻り値]
型: int イメージ数を返す。


%index
ImageList_GetImageInfo
Retrieves information about an image.
%group
Win32 comctl32
%prm
himl, i, pImageInfo
himl : [intptr] Type: HIMAGELIST A handle to the image list.
i : [int] Type: int The index of the image.
pImageInfo : [var] Type: IMAGEINFO* A pointer to an IMAGEINFO structure that receives information about the image. The information in this structure can be used to directly manipulate the bitmaps for the image.
%inst
Retrieves information about an image.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
An application should not call DeleteObject to destroy the bitmaps
retrieved by ImageList_GetImageInfo. The system destroys the bitmaps
when the application calls the ImageList_Destroy function.


%index
ImageList_LoadImageW
Creates an image list from the specified bitmap. (Unicode)
%group
Win32 comctl32
%prm
hi, lpbmp, cx, cGrow, crMask, uType, uFlags
hi : [intptr] Type: HINSTANCE A handle to the instance that contains the resource. This parameter can be NULL if you are loading an image from a file or loading an OEM resource.
lpbmp : [wstr] Type: LPCTSTR The image to load. If the uFlags parameter includes LR_LOADFROMFILE, lpbmp is the address of a null-terminated string that names the file containing the image to load. If the hi parameter is non-NULL and LR_LOADFROMFILE is not specified, lpbmp is the address of a null-terminated string that contains the name of the image resource in the hi module. If hi is NULL and LR_LOADFROMFILE is not specified, the LOWORD of this parameter must be the identifier of an OEM image to load. To create this value, use the MAKEINTRESOURCE macro with one of the OEM image identifiers defined in Winuser.h. These identifiers have the following prefixes.
cx : [int] Type: int The width of each image. The height of each image and the initial number of images are inferred by the dimensions of the specified resource.
cGrow : [int] Type: int The number of images by which the image list can grow when the system needs to make room for new images. This parameter represents the number of new images that the resized image list can contain.
crMask : [int] Type: COLORREF The color used to generate a mask. Each pixel of this color in the specified bitmap, cursor, or icon is changed to black, and the corresponding bit in the mask is set to 1. If this parameter is the CLR_NONE value, no mask is generated. If this parameter is the CLR_DEFAULT value, the color of the pixel at the upper-left corner of the image is treated as the mask color.
uType : [int] Type: UINT A flag that specifies the type of image to load. This parameter must be IMAGE_BITMAP to indicate that a bitmap is being loaded.
uFlags : [int] Type: UINT
%inst
Creates an image list from the specified bitmap. (Unicode)

[戻り値]
Type: HIMAGELIST Returns the handle to the image list if successful,
or NULL otherwise.

[備考]
LR_LOADTRANSPARENT does not load the image transparently. It creates
an opaque image list that only appears transparent because all the
background pixels have been changed to COLOR_WINDOW. If the images
are drawn over a background that is not the color COLOR_WINDOW, the
image does not draw properly. Also, LR_LOADTRANSPARENT and
LR_LOADMAP3DCOLORS use the system colors that were in effect at the
time that ImageList_LoadImage was called. If the system colors
subsequently change, the application must reload the image to remap
the colors.
> [!NOTE] > The commctrl.h header defines ImageList_LoadImage as an
alias which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
ImageList_Merge
Creates a new image by combining two existing images. The function also creates a new image list in which to store the image.
%group
Win32 comctl32
%prm
himl1, i1, himl2, i2, dx, dy
himl1 : [intptr] Type: HIMAGELIST A handle to the first image list.
i1 : [int] Type: int The index of the first existing image.
himl2 : [intptr] Type: HIMAGELIST A handle to the second image list.
i2 : [int] Type: int The index of the second existing image.
dx : [int] Type: int The x-offset of the second image relative to the first image.
dy : [int] Type: int The y-offset of the second image relative to the first image.
%inst
Creates a new image by combining two existing images. The function
also creates a new image list in which to store the image.

[戻り値]
Type: HIMAGELIST Returns the handle to the new image list if
successful, or NULL otherwise.

[備考]
The new image consists of the second existing image drawn
transparently over the first. The mask for the new image is the
result of performing a logical OR operation on the masks of the two
existing images.


%index
ImageList_Read
Reads an image list from a stream.
%group
Win32 comctl32
%prm
pstm
pstm : [var] Type: LPSTREAM A pointer to the stream.
%inst
Reads an image list from a stream.

[戻り値]
Type: HIMAGELIST Returns the handle to the image list if successful,
or NULL otherwise.


%index
ImageList_Remove
Removes an image from an image list. (ImageList_Remove)
%group
Win32 comctl32
%prm
himl, i
himl : [intptr] Type: HIMAGELIST A handle to the image list.
i : [int] Type: int The index of the image to remove. If this parameter is -1, the function removes all images.
%inst
Removes an image from an image list. (ImageList_Remove)

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
When an image is removed, the indexes of the remaining images are
adjusted so that the image indexes always range from zero to one less
than the number of images in the image list. For example, if you
remove the image at index 0, then image 1 becomes image 0, image 2
becomes image 1, and so on.


%index
ImageList_Replace
Replaces an image in an image list with a new image. (ImageList_Replace)
%group
Win32 comctl32
%prm
himl, i, hbmImage, hbmMask
himl : [intptr] Type: HIMAGELIST A handle to the image list.
i : [int] Type: int An index of the image to replace.
hbmImage : [intptr] Type: HBITMAP A handle to the bitmap that contains the image.
hbmMask : [intptr] Type: HBITMAP A handle to the bitmap that contains the mask. If no mask is used with the image list, this parameter is ignored.
%inst
Replaces an image in an image list with a new image.
(ImageList_Replace)

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
The ImageList_Replace function copies the bitmap to an internal data
structure. Be sure to use the DeleteObject function to delete
hbmImage and hbmMask after the function returns.


%index
ImageList_ReplaceIcon
Replaces an image with an icon or cursor. (ImageList_ReplaceIcon)
%group
Win32 comctl32
%prm
himl, i, hicon
himl : [intptr] Type: HIMAGELIST A handle to the image list.
i : [int] Type: int The index of the image to replace. If i is -1, the function appends the image to the end of the list.
hicon : [intptr] Type: HICON The handle to the icon or cursor that contains the bitmap and mask for the new image.
%inst
Replaces an image with an icon or cursor. (ImageList_ReplaceIcon)

[戻り値]
Type: int Returns the index of the image if successful, or -1
otherwise.

[備考]
Because the system does not save hicon, you can destroy it after the
function returns if the icon or cursor was created by the CreateIcon
function. You do not need to destroy hicon if it was loaded by the
LoadIcon function; the system automatically frees an icon resource
when it is no longer needed.


%index
ImageList_SetBkColor
Sets the background color for an image list. This function only works if you add an icon or use ImageList_AddMasked with a black and white bitmap. Without a mask, the entire image is drawn; hence the background color is not visible.
%group
Win32 comctl32
%prm
himl, clrBk
himl : [intptr] Type: HIMAGELIST A handle to the image list.
clrBk : [int] Type: COLORREF The background color to set. This parameter can be the CLR_NONE value; in that case, images are drawn transparently using the mask.
%inst
Sets the background color for an image list. This function only works
if you add an icon or use ImageList_AddMasked with a black and white
bitmap. Without a mask, the entire image is drawn; hence the
background color is not visible.

[戻り値]
Type: COLORREF Returns the previous background color if successful,
or CLR_NONE otherwise.


%index
ImageList_SetDragCursorImage
Creates a new drag image by combining the specified image (typically a mouse cursor image) with the current drag image.
%group
Win32 comctl32
%prm
himlDrag, iDrag, dxHotspot, dyHotspot
himlDrag : [intptr] Type: HIMAGELIST A handle to the image list that contains the new image to combine with the drag image.
iDrag : [int] Type: int The index of the new image to combine with the drag image.
dxHotspot : [int] Type: int The x-position of the hot spot within the new image.
dyHotspot : [int] Type: int The y-position of the hot spot within the new image.
%inst
Creates a new drag image by combining the specified image (typically
a mouse cursor image) with the current drag image.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.


%index
ImageList_SetIconSize
Sets the dimensions of images in an image list and removes all images from the list. (ImageList_SetIconSize)
%group
Win32 comctl32
%prm
himl, cx, cy
himl : [intptr] Type: HIMAGELIST A handle to the image list.
cx : [int] Type: int The width, in pixels, of the images in the image list. All images in an image list have the same dimensions.
cy : [int] Type: int The height, in pixels, of the images in the image list. All images in an image list have the same dimensions.
%inst
Sets the dimensions of images in an image list and removes all images
from the list. (ImageList_SetIconSize)

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.


%index
ImageList_SetImageCount
Resizes an existing image list. (ImageList_SetImageCount)
%group
Win32 comctl32
%prm
himl, uNewCount
himl : [intptr] Type: HIMAGELIST A handle to the image list that will be resized.
uNewCount : [int] Type: UINT A value specifying the new size of the image list.
%inst
Resizes an existing image list. (ImageList_SetImageCount)

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
If an application expands an image list with this function, it must
add new images by using the ImageList_Replace function. If your
application does not add valid images at the new indexes, draw
operations that use the new indexes will be unpredictable. If you
decrease the size of an image list by using this function, the
truncated images are freed.


%index
ImageList_SetOverlayImage
Adds a specified image to the list of images to be used as overlay masks. An image list can have up to four overlay masks in version 4.70 and earlier and up to 15 in version 4.71. The function assigns an overlay mask index to the specified image.
%group
Win32 comctl32
%prm
himl, iImage, iOverlay
himl : [intptr] Type: HIMAGELIST A handle to the image list.
iImage : [int] Type: int The zero-based index of an image in the himl image list. This index identifies the image to use as an overlay mask.
iOverlay : [int] Type: int The one-based index of the overlay mask.
%inst
Adds a specified image to the list of images to be used as overlay
masks. An image list can have up to four overlay masks in version
4.70 and earlier and up to 15 in version 4.71. The function assigns
an overlay mask index to the specified image.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
An overlay mask is an image drawn transparently over another image.
To draw an overlay mask over an image, call the ImageList_Draw or
ImageList_DrawEx function. The fStyle parameter of these functions
can use the INDEXTOOVERLAYMASK macro to specify an overlay mask
index. A call to this method fails and returns E_INVALIDARG unless
the image list is created using a mask.


%index
ImageList_Write
Writes an image list to a stream. (ImageList_Write)
%group
Win32 comctl32
%prm
himl, pstm
himl : [intptr] Type: HIMAGELIST A handle to the image list.
pstm : [var] Type: LPSTREAM A pointer to the stream.
%inst
Writes an image list to a stream. (ImageList_Write)

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.


%index
InitCommonControls
Registers and initializes certain common control window classes. This function is obsolete. New applications should use the InitCommonControlsEx function.
%group
Win32 comctl32
%prm

%inst
Registers and initializes certain common control window classes. This
function is obsolete. New applications should use the
InitCommonControlsEx function.

[備考]
Under Comctl32.dll version 5.x, only Windows 95 classes
(ICC_WIN95_CLASSES) can be registered through InitCommonControls.
Programs which require additional common control classes must use the
InitCommonControlsEx function. Under Comctl32.dll version 6.0 and
later, InitCommonControls does nothing. Applications must explicitly
register all common controls through InitCommonControlsEx.


%index
InitCommonControlsEx
コモンコントロール DLL(Comctl32.dll)がロードされていることを保証し、DLL から特定のコモンコントロールクラスを登録する。コモンコントロールを作成する前にアプリケーションはこの関数を呼ぶ必要がある。
%group
Win32 comctl32
%prm
picce
picce : [var] 型: const LPINITCOMMONCONTROLSEX どのコントロールクラスを登録するかを指定する情報を含む INITCOMMONCONTROLSEX 構造体へのポインタ。
%inst
コモンコントロール DLL(Comctl32.dll)がロードされていることを保証し、DLL
から特定のコモンコントロールクラスを登録する。コモンコントロールを作成する前にアプリケーションはこの関数を呼ぶ必要がある。

[戻り値]
型: BOOL 成功した場合は TRUE、それ以外は FALSE。

[備考]
InitCommonControlsEx の各呼び出しの効果は累積的である。例えば ICC_UPDOWN_CLASS で呼ばれた後に
ICC_HOTKEY_CLASS で呼ばれた場合、アップダウンとホットキーのコモンコントロールクラスの両方が登録される。


%index
InitMUILanguage
Enables an application to specify a language to be used with the common controls that is different from the system language.
%group
Win32 comctl32
%prm
uiLang
uiLang : [int] Type: LANGID The  language identifier of the language to be used by the common controls.
%inst
Enables an application to specify a language to be used with the
common controls that is different from the system language.

[備考]
This function enables an application to override the system language
setting, and specify a different language for the common controls.
The selected language only applies to the process that
InitMUILanguage is called from. See Internationalization for Windows
Applications for further discussion of localization.


%index
InitializeFlatSB
Initializes flat scroll bars for a particular window.
%group
Win32 comctl32
%prm
param0
param0 : [intptr] 
%inst
Initializes flat scroll bars for a particular window.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.

[備考]
This function must be called before any other flat scroll bar
functions are called. The window will receive flat scroll bars by
default. The scroll bar style can be changed with the
FlatSB_SetScrollProp function. Note Flat scroll bar functions are
implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll
versions 6.00 and higher do not support flat scroll bars.


%index
LBItemFromPt
Retrieves the index of the item at the specified point in a list box.
%group
Win32 comctl32
%prm
hLB, pt, bAutoScroll
hLB : [intptr] Type: HWND A handle to the list box to check.
pt : [int] Type: POINT A POINT structure that contains the screen coordinates to check.
bAutoScroll : [int] Type: BOOL A scroll flag. If this parameter is TRUE and the point is directly above or below the list box, the function scrolls the list box by one line and returns -1. Otherwise, the function does not scroll the list box.
%inst
Retrieves the index of the item at the specified point in a list box.

[戻り値]
Type: int Returns the item identifier if the point is over a list
item, or -1 otherwise.

[備考]
The LBItemFromPt function only scrolls the list box if a minimum
amount of time has passed since it last did so. Timing prevents the
list box from scrolling too quickly if the function is called
repeatedly in rapid succession?for example, when DL_DRAGGING
notification codes or WM_MOUSEMOVE messages are processed. If the
specified point is outside the client area of the list box and
bAutoScroll is TRUE, the function scrolls the list box instead of
returning an item identifier.


%index
MakeDragList
Changes the specified single-selection list box to a drag list box.
%group
Win32 comctl32
%prm
hLB
hLB : [intptr] Type: HWND A handle to the single-selection list box.
%inst
Changes the specified single-selection list box to a drag list box.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.


%index
MenuHelp
Processes WM_MENUSELECT and WM_COMMAND messages and displays Help text about the current menu in the specified status window.
%group
Win32 comctl32
%prm
uMsg, wParam, lParam, hMainMenu, hInst, hwndStatus, lpwIDs
uMsg : [int] Type: UINT Message being processed. This can be either WM_MENUSELECT or WM_COMMAND.
wParam : [intptr] Type: WPARAM wParam of the message specified in uMsg.
lParam : [intptr] Type: LPARAM lParam of the message specified in uMsg.
hMainMenu : [intptr] Type: HMENU Handle to the application's main menu.
hInst : [intptr] Type: HINSTANCE Handle to the module that contains the string resources.
hwndStatus : [intptr] Type: HWND Handle to the status window.
lpwIDs : [var] Type: LPUINT Pointer to an array of values that contains pairs of string resource identifiers and menu handles. The function searches the array for the handle to the selected menu and, if found, uses the corresponding resource identifier to load the appropriate Help string.
%inst
Processes WM_MENUSELECT and WM_COMMAND messages and displays Help
text about the current menu in the specified status window.

[備考]
The MenuHelp function is a helper function. Helper functions are
available as a convenience to programming. They combine into one call
a sequence of frequently used calls. You use MenuHelp to send
WM_MENUSELECT and WM_COMMAND messages.


%index
PropertySheetW
Creates a property sheet and adds the pages defined in the specified property sheet header structure. (Unicode)
%group
Win32 comctl32
%prm
param0
param0 : [var] 
%inst
Creates a property sheet and adds the pages defined in the specified
property sheet header structure. (Unicode)

[戻り値]
Type: INT_PTR For modal property sheets, the return value is as
follows:
This doc was truncated.

[備考]
To retrieve extended error information, call GetLastError. If you
attempt to add more than 99 pages to a property sheet, this function
will fail, but with no indication of the cause of the error:
PropertySheet returns a value of -1, but GetLastError returns 0. Note
The following remarks refer only to wizards that do not use the Aero
wizard style (PSH_AEROWIZARD) or non-wizard property sheets. By
default, the PropertySheet function creates a modal dialog box. If
the dwFlags member of the PROPSHEETHEADER structure specifies the
PSH_MODELESS flag, PropertySheet creates a modeless dialog box and
returns immediately after it is created. In this case, the
PropertySheet return value is the window handle to the modeless
dialog box. For a modeless property sheet, your message loop should
use PSM_ISDIALOGMESSAGE to pass messages to the property sheet dialog
box. Your message loop should use PSM_GETCURRENTPAGEHWND to determine
when to destroy the dialog box. When the user clicks the OK or Cancel
button, PSM_GETCURRENTPAGEHWND returns NULL. You can then use the
DestroyWindow function to destroy the dialog box.
Version 5.80. The PropertySheet return value carries different
information for modal and modeless property sheets. In some cases,
modeless property sheets might need the information they would have
received from PropertySheet if they had been modal. In particular,
they may need to know whether ID_PSREBOOTSYSTEM or
ID_PSRESTARTWINDOWS would have been returned. A modeless property
sheet can retrieve the value that a modal property sheet would have
received from PropertySheet by waiting until PSM_GETCURRENTPAGEHWND
returns NULL and then sending a PSM_GETRESULT message.
> [!NOTE] > The prsht.h header defines PropertySheet as an alias
which automatically selects the ANSI or Unicode version of this
function based on the definition of the UNICODE preprocessor
constant. Mixing usage of the encoding-neutral alias with code that
not encoding-neutral can lead to mismatches that result in
compilation or runtime errors. For more information, see [Conventions
for Function
Prototypes](/windows/win32/intl/conventions-for-function-prototypes).


%index
RemoveWindowSubclass
Removes a subclass callback from a window.
%group
Win32 comctl32
%prm
hWnd, pfnSubclass, uIdSubclass
hWnd : [intptr] Type: HWND The handle of the window being subclassed.
pfnSubclass : [int] Type: SUBCLASSPROC A pointer to a window procedure. This pointer and the subclass ID uniquely identify this subclass callback. For the callback function prototype, see SUBCLASSPROC.
uIdSubclass : [int] Type: UINT_PTR The UINT_PTR subclass ID. This ID and the callback pointer uniquely identify this subclass callback. Note: On 64-bit versions of Windows this is a 64-bit value.
%inst
Removes a subclass callback from a window.

[戻り値]
Type: BOOL TRUE if the subclass callback was successfully removed;
otherwise, FALSE.

[備考]
Subclass callbacks are identified by their combination of the
callback address and the subclass ID defined by the calling process.
The SUBCLASS module defines helper functions that are used to
subclass windows. The code maintains a single property on the
subclassed window and dispatches various subclass callbacks to its
clients as required. The client is provided reference data and a
default processing API. No reference counting is performed for the
callback; it may repeatedly call SetWindowSubclass to alter the value
of its reference data element. Warning You cannot use the subclassing
helper functions to subclass a window across threads.


%index
SetWindowSubclass
Installs or updates a window subclass callback.
%group
Win32 comctl32
%prm
hWnd, pfnSubclass, uIdSubclass, dwRefData
hWnd : [intptr] Type: HWND The handle of the window being subclassed.
pfnSubclass : [int] Type: SUBCLASSPROC A pointer to a window procedure. This pointer and the subclass ID uniquely identify this subclass callback. For the callback function prototype, see SUBCLASSPROC.
uIdSubclass : [int] Type: UINT_PTR The subclass ID. This ID together with the subclass procedure uniquely identify a subclass. To remove a subclass, pass the subclass procedure and this value to the RemoveWindowSubclass function. This value is passed to the subclass procedure in the uIdSubclass parameter.
dwRefData : [int] Type: DWORD_PTR DWORD_PTR to reference data. The meaning of this value is determined by the calling application. This value is passed to the subclass procedure in the dwRefData parameter. A different dwRefData is associated with each combination of window handle, subclass procedure and uIdSubclass.
%inst
Installs or updates a window subclass callback.

[戻り値]
Type: BOOL TRUE if the subclass callback was successfully installed;
otherwise, FALSE.

[備考]
Subclass callbacks are identified by the combination of the callback
address and the caller-defined subclass ID. If the callback address
and ID pair have not yet been installed, then this function installs
the subclass. If the pair has already been installed, then this
function just updates the reference data. Each callback can store a
single DWORD_PTR of reference data, which is passed to the callback
function when it is called to filter messages. No reference counting
is performed for the callback; it may repeatedly call
SetWindowSubclass to alter the value of its reference data element.
Warning You cannot use the subclassing helper functions to subclass a
window across threads.


%index
ShowHideMenuCtl
Sets or removes the specified menu item's check mark attribute and shows or hides the corresponding control.
%group
Win32 comctl32
%prm
hWnd, uFlags, lpInfo
hWnd : [intptr] Type: HWND A handle to the window that contains the menu and controls.
uFlags : [int] Type: UINT_PTR The identifier of the menu item to receive or lose a check mark.
lpInfo : [var] Type: LPINT A pointer to an array that contains pairs of values. The second value in the first pair must be the handle to the application's main menu. Each subsequent pair consists of a menu item identifier and a control window identifier. The function searches the array for a value that matches uFlags and, if the value is found, checks or unchecks the menu item and shows or hides the corresponding control.
%inst
Sets or removes the specified menu item's check mark attribute and
shows or hides the corresponding control.

[戻り値]
Type: BOOL Returns nonzero if successful, or zero otherwise.


%index
Str_SetPtrW
Sets ppszCurrent to a copy of pszNew and frees the previous value, if necessary.
%group
Win32 comctl32
%prm
ppsz, psz
ppsz : [var] Type: LPTSTR* The address of a pointer to the current string. The current string is freed and the pointer is set to a copy of pszNew.
psz : [wstr] Type: LPCTSTR A pointer to the string to copy into ppszCurrent.
%inst
Sets ppszCurrent to a copy of pszNew and frees the previous value, if
necessary.

[戻り値]
Type: BOOL Returns TRUE if successful; otherwise, FALSE.

[備考]
The ANSI version of Str_SetPtrW, Str_SetPtrA, is not exported by name
or declared in a public header file. To use it, you must use
GetProcAddress and request ordinal 234 from ComCtl32.dll to obtain a
function pointer.


%index
UninitializeFlatSB
Uninitializes flat scroll bars for a particular window. The specified window will revert to standard scroll bars.
%group
Win32 comctl32
%prm
param0
param0 : [intptr] 
%inst
Uninitializes flat scroll bars for a particular window. The specified
window will revert to standard scroll bars.

[戻り値]
Type: HRESULT Returns one of the following values.
This doc was truncated.

[備考]
Note Flat scroll bar functions are implemented in Comctl32.dll
versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do
not support flat scroll bars.

