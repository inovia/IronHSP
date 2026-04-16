;
; iron_hash.hsp  HSP3 ヘルプ (日本語)
; ハッシュ / Base64 簡易ラッパ (BCrypt CNG)
;

%type
拡張命令
%ver
3.8
%date
2026/04/18
%author
IronHSP
%dll
iron_hash.hsp

%url
https://github.com/inovia/IronHSP
%port
Win32 / Win64

%note
iron_hash.hsp は Win32 BCrypt (CNG) と CryptStringToBinary /
CryptBinaryToString を使った 1 行 ハッシュ + Base64 ラッパです。

  #include "iron_hash.hsp"

サポート:
  MD5, SHA-1, SHA-256, SHA-384, SHA-512
  Base64 encode / decode

%group
iron_hash (ハッシュ/Base64)

%index
hash_md5
MD5 ハッシュ
%group
iron_hash ― ハッシュ
%prm
"text"

%inst
refstr に hex 表記の MD5 (32 文字) を返します。

%index
hash_sha1
SHA-1 ハッシュ
%group
iron_hash ― ハッシュ
%prm
"text"

%inst
refstr に hex (40 文字) を返します。

%index
hash_sha256
SHA-256 ハッシュ
%group
iron_hash ― ハッシュ
%prm
"text"

%inst
refstr に hex (64 文字) を返します。

例:
  hash_sha256 "hello world"
  mes refstr
  ; → b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9

%index
hash_sha384
SHA-384 ハッシュ
%group
iron_hash ― ハッシュ
%prm
"text"

%index
hash_sha512
SHA-512 ハッシュ
%group
iron_hash ― ハッシュ
%prm
"text"

%index
hash_md5_buf
バイナリバッファの MD5
%group
iron_hash ― バイナリ
%prm
var, len

%index
hash_sha1_buf
バイナリバッファの SHA-1
%group
iron_hash ― バイナリ
%prm
var, len

%index
hash_sha256_buf
バイナリバッファの SHA-256
%group
iron_hash ― バイナリ
%prm
var, len

%index
hash_sha512_buf
バイナリバッファの SHA-512
%group
iron_hash ― バイナリ
%prm
var, len

%index
base64_encode
文字列を Base64 エンコード
%group
iron_hash ― Base64
%prm
"text"

%inst
refstr に Base64 文字列を返します。

例:
  base64_encode "Hello, World!"
  mes refstr
  ; → SGVsbG8sIFdvcmxkIQ==

%index
base64_encode_buf
バイナリバッファを Base64 エンコード
%group
iron_hash ― Base64
%prm
var, len

%index
base64_decode
Base64 をデコード
%group
iron_hash ― Base64
%prm
"base64_text"

%inst
refstr にデコード結果バイト列、stat にサイズが返ります。
