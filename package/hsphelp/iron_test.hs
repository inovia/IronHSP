%dll
; iron_test Unit test framework
%ver
3.8
%date
2026/04/17
%author
IronHSP
%note
Pure HSP
%type
User command
%group
Testing

%index
test_begin
Start test suite
%prm
"name"
%inst

%href
assert_eq

%index
assert_eq
Assert equal
%prm
actual, expected, "msg"
%inst

%href
assert_ne

%index
assert_ne
Assert not equal
%prm
actual, notexpected, "msg"
%inst

%href
assert_true

%index
assert_true
Assert true
%prm
cond, "msg"
%inst

%href
assert_false

%index
assert_false
Assert false
%prm
cond, "msg"
%inst

%href
test_end

%index
test_end
End test suite
%prm

%inst
Shows pass/fail count
%href
test_passed

%index
test_passed
All passed?
%prm
()
%inst
1=all passed