%dll
; iron_crypto 暗号化/復号
%ver
3.8
%date
2026/04/16
%author
IronHSP
%type
ユーザー定義命令
%group
暗号化

%index
bf_encrypt
Blowfish 暗号化
%prm
key, data, data_len, out
%inst
Blowfish ECB + PKCS7。stat に出力長。
%href
bf_decrypt

%index
bf_decrypt
Blowfish 復号
%prm
key, data, data_len, out
%inst
stat に平文長。
%href
rc4_encrypt

%index
rc4_encrypt
RC4 暗号化/復号
%prm
key, data, data_len, out
%inst
対称暗号なので暗号化・復号同一命令。
%href
hmac_sha256

%index
hmac_sha256
HMAC-SHA256
%prm
key, key_len, data, data_len
%inst
refstr に 64 桁 hex。
%href
pbkdf2_sha256

%index
pbkdf2_sha256
PBKDF2-SHA256 鍵導出
%prm
password, salt, salt_len, iterations, out_len
%inst
refstr に hex 文字列。
%href
aes256_encrypt

%index
aes256_encrypt
AES-256-CBC 暗号化
%prm
key32, iv16, data, data_len, out
%inst
BCrypt ベース。stat に暗号文長。
%href
aes256_decrypt

%index
aes256_decrypt
AES-256-CBC 復号
%prm
key32, iv16, data, data_len, out
%inst
stat に平文長。
