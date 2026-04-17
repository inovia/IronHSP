%dll
; iron_ribbon_native Windows Ribbon (native COM)
%ver
3.8
%date
2026/04/17
%author
IronHSP
%note
hspribbon.dll. uicc.exe (Windows SDK) required.
%type
User command
%group
UI

%index
ribbon_native_init
Init framework
%prm

%inst

%href
ribbon_native_load_bml

%index
ribbon_native_load_bml
Load BML file
%prm
"path"
%inst
.rc + .h needed in same dir
%href
ribbon_native_load_xml

%index
ribbon_native_load_xml
Auto compile + load
%prm
"xml", "sdk_bin"
%inst
uicc.exe path
%href
ribbon_native_set_event_mode

%index
ribbon_native_set_event_mode
Event mode
%prm
sw, wm_id
%inst
oncmd for commands
%href
ribbon_native_poll

%index
ribbon_native_poll
Poll command
%prm

%inst
stat=1 if fired
%href
ribbon_native_cmd_id

%index
ribbon_native_cmd_id
Last cmd ID
%prm
()
%inst

%href
ribbon_native_height

%index
ribbon_native_height
Ribbon height
%prm
()
%inst
pixels
%href
ribbon_native_minimize

%index
ribbon_native_minimize
Minimize/restore
%prm
sw
%inst

%href
ribbon_native_set_modes

%index
ribbon_native_set_modes
App modes
%prm
mask
%inst
32-bit mask
%href
ribbon_native_destroy

%index
ribbon_native_destroy
Cleanup
%prm

%inst
