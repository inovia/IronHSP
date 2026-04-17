%dll
; iron_ribbon_pro Rich Ribbon UI (WinForms)
%ver
3.8
%date
2026/04/17
%author
IronHSP
%note
hsp3net only. No uicc needed.
%type
User command
%group
UI

%index
ribpro_init
Init ribbon
%prm

%inst

%href
ribpro_add_tab

%index
ribpro_add_tab
Add tab
%prm
"name"
%inst
stat=tab_id
%href
ribpro_begin_group

%index
ribpro_begin_group
Begin group
%prm
tab_id, "name"
%inst

%href
ribpro_add_large

%index
ribpro_add_large
Large button
%prm
"text"
%inst

%href
ribpro_add_small

%index
ribpro_add_small
Small button
%prm
"text"
%inst

%href
ribpro_add_dropdown

%index
ribpro_add_dropdown
Dropdown
%prm
"text", "items"
%inst
items: pipe-separated
%href
ribpro_end_group

%index
ribpro_end_group
End group
%prm

%inst
