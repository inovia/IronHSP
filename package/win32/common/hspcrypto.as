;============================================================
;  hspcrypto.as — Extended cryptography plugin
;  Blowfish / RC4 / ChaCha20 / XOR
;============================================================
#ifndef __hspcrypto_as__
#define __hspcrypto_as__

#ifdef hsp3cl_64
#uselib "hspcrypto_64.dll"
#else
#ifdef hsp64
#uselib "hspcrypto_64.dll"
#else
#uselib "hspcrypto.dll"
#endif
#endif

; blowfish_encrypt(key, key_len, data, data_len, out, out_size) → stat: output len
#func global blowfish_encrypt "blowfish_encrypt" str, int, var, int, var, int
; blowfish_decrypt(key, key_len, data, data_len, out, out_size) → stat: plaintext len
#func global blowfish_decrypt "blowfish_decrypt" str, int, var, int, var, int
; rc4_crypt(key, key_len, data, data_len, out, out_size) → stat: output len
#func global rc4_crypt "rc4_crypt" str, int, var, int, var, int
; chacha20_crypt(key32, nonce12, counter, data, data_len, out, out_size) → stat: output len
#func global chacha20_crypt "chacha20_crypt" var, var, int, var, int, var, int
; xor_crypt(key, key_len, data, data_len, out, out_size) → stat: output len
#func global xor_crypt "xor_crypt" str, int, var, int, var, int

; hmac_sha256_ex(key, key_len, data, data_len, out_hex, hex_size) → stat: 1=ok
#func global hmac_sha256_ex "hmac_sha256_ex" var, int, var, int, var, int
; pbkdf2_sha256_ex(password, pass_len, salt, salt_len, iterations, out_hex, out_key_len) → stat: 1=ok
#func global pbkdf2_sha256_ex "pbkdf2_sha256_ex" str, int, var, int, int, var, int
; aes256cbc_encrypt(key32, iv16, data, data_len, out, out_size) → stat: cipher len
#func global aes256cbc_encrypt "aes256cbc_encrypt" var, var, var, int, var, int
; aes256cbc_decrypt(key32, iv16, data, data_len, out, out_size) → stat: plain len
#func global aes256cbc_decrypt "aes256cbc_decrypt" var, var, var, int, var, int

#endif
