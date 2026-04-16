//
//  hspcrypto.dll — Extended cryptography plugin for HSP
//
//  Provides algorithms not available in Windows BCrypt:
//    - Blowfish (ECB/CBC)
//    - RC4
//    - ChaCha20 (RFC 7539)
//    - XOR cipher (simple)
//
//  All functions operate on binary buffers.
//  BCrypt-based algorithms (AES, RSA, HMAC, PBKDF2) are handled
//  by iron_crypto.hsp using bcrypt.dll directly.
//
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <cstdint>
#include <cstring>
#include <cstdlib>
#include <string>

#define EXPORT extern "C" __declspec(dllexport)

//============================================================
// Blowfish implementation (based on Bruce Schneier's reference)
//============================================================

// P-array and S-box initial values (from pi digits)
#include "blowfish_tables.h"

struct BlowfishCtx {
    uint32_t P[18];
    uint32_t S[4][256];
};

static uint32_t bf_f(BlowfishCtx *ctx, uint32_t x)
{
    uint32_t h = ctx->S[0][(x >> 24) & 0xFF] + ctx->S[1][(x >> 16) & 0xFF];
    h ^= ctx->S[2][(x >> 8) & 0xFF];
    h += ctx->S[3][x & 0xFF];
    return h;
}

static void bf_encrypt_block(BlowfishCtx *ctx, uint32_t *xl, uint32_t *xr)
{
    uint32_t Xl = *xl, Xr = *xr;
    for (int i = 0; i < 16; i++) {
        Xl ^= ctx->P[i];
        Xr ^= bf_f(ctx, Xl);
        uint32_t t = Xl; Xl = Xr; Xr = t;
    }
    uint32_t t = Xl; Xl = Xr; Xr = t;
    Xr ^= ctx->P[16];
    Xl ^= ctx->P[17];
    *xl = Xl; *xr = Xr;
}

static void bf_decrypt_block(BlowfishCtx *ctx, uint32_t *xl, uint32_t *xr)
{
    uint32_t Xl = *xl, Xr = *xr;
    for (int i = 17; i > 1; i--) {
        Xl ^= ctx->P[i];
        Xr ^= bf_f(ctx, Xl);
        uint32_t t = Xl; Xl = Xr; Xr = t;
    }
    uint32_t t = Xl; Xl = Xr; Xr = t;
    Xr ^= ctx->P[1];
    Xl ^= ctx->P[0];
    *xl = Xl; *xr = Xr;
}

static void bf_init(BlowfishCtx *ctx, const uint8_t *key, int keylen)
{
    memcpy(ctx->P, bf_P_init, sizeof(ctx->P));
    memcpy(ctx->S, bf_S_init, sizeof(ctx->S));

    int j = 0;
    for (int i = 0; i < 18; i++) {
        uint32_t data = 0;
        for (int k = 0; k < 4; k++) {
            data = (data << 8) | key[j];
            j = (j + 1) % keylen;
        }
        ctx->P[i] ^= data;
    }

    uint32_t xl = 0, xr = 0;
    for (int i = 0; i < 18; i += 2) {
        bf_encrypt_block(ctx, &xl, &xr);
        ctx->P[i] = xl;
        ctx->P[i+1] = xr;
    }
    for (int i = 0; i < 4; i++) {
        for (int j2 = 0; j2 < 256; j2 += 2) {
            bf_encrypt_block(ctx, &xl, &xr);
            ctx->S[i][j2] = xl;
            ctx->S[i][j2+1] = xr;
        }
    }
}

//------------------------------------------------------------
// blowfish_encrypt(key, key_len, data, data_len, out, out_size)
//   ECB mode, PKCS7 padding.
//   Returns output length, or -1 on error.
//------------------------------------------------------------
EXPORT int __cdecl blowfish_encrypt(const char *key, int key_len,
                                     const char *data, int data_len,
                                     char *out, int out_size)
{
    if (key_len < 4 || key_len > 56) return -1;
    // Calculate padded length (8-byte blocks)
    int pad = 8 - (data_len % 8);
    int out_len = data_len + pad;
    if (out_size < out_len) return -1;

    BlowfishCtx ctx;
    bf_init(&ctx, (const uint8_t *)key, key_len);

    // Copy data with PKCS7 padding
    memcpy(out, data, data_len);
    memset(out + data_len, pad, pad);

    // Encrypt blocks
    for (int i = 0; i < out_len; i += 8) {
        uint32_t xl = ((uint8_t)out[i]<<24) | ((uint8_t)out[i+1]<<16) |
                      ((uint8_t)out[i+2]<<8) | (uint8_t)out[i+3];
        uint32_t xr = ((uint8_t)out[i+4]<<24) | ((uint8_t)out[i+5]<<16) |
                      ((uint8_t)out[i+6]<<8) | (uint8_t)out[i+7];
        bf_encrypt_block(&ctx, &xl, &xr);
        out[i]   = (xl >> 24) & 0xFF; out[i+1] = (xl >> 16) & 0xFF;
        out[i+2] = (xl >> 8) & 0xFF;  out[i+3] = xl & 0xFF;
        out[i+4] = (xr >> 24) & 0xFF; out[i+5] = (xr >> 16) & 0xFF;
        out[i+6] = (xr >> 8) & 0xFF;  out[i+7] = xr & 0xFF;
    }
    return out_len;
}

//------------------------------------------------------------
// blowfish_decrypt(key, key_len, data, data_len, out, out_size)
//   ECB mode, PKCS7 unpadding.
//   Returns plaintext length, or -1 on error.
//------------------------------------------------------------
EXPORT int __cdecl blowfish_decrypt(const char *key, int key_len,
                                     const char *data, int data_len,
                                     char *out, int out_size)
{
    if (key_len < 4 || key_len > 56) return -1;
    if (data_len % 8 != 0 || data_len == 0) return -1;
    if (out_size < data_len) return -1;

    BlowfishCtx ctx;
    bf_init(&ctx, (const uint8_t *)key, key_len);

    memcpy(out, data, data_len);
    for (int i = 0; i < data_len; i += 8) {
        uint32_t xl = ((uint8_t)out[i]<<24) | ((uint8_t)out[i+1]<<16) |
                      ((uint8_t)out[i+2]<<8) | (uint8_t)out[i+3];
        uint32_t xr = ((uint8_t)out[i+4]<<24) | ((uint8_t)out[i+5]<<16) |
                      ((uint8_t)out[i+6]<<8) | (uint8_t)out[i+7];
        bf_decrypt_block(&ctx, &xl, &xr);
        out[i]   = (xl >> 24) & 0xFF; out[i+1] = (xl >> 16) & 0xFF;
        out[i+2] = (xl >> 8) & 0xFF;  out[i+3] = xl & 0xFF;
        out[i+4] = (xr >> 24) & 0xFF; out[i+5] = (xr >> 16) & 0xFF;
        out[i+6] = (xr >> 8) & 0xFF;  out[i+7] = xr & 0xFF;
    }

    // Remove PKCS7 padding
    int pad = (uint8_t)out[data_len - 1];
    if (pad < 1 || pad > 8) return -1;
    return data_len - pad;
}

//============================================================
// RC4
//============================================================

EXPORT int __cdecl rc4_crypt(const char *key, int key_len,
                              const char *data, int data_len,
                              char *out, int out_size)
{
    if (out_size < data_len) return -1;
    uint8_t S[256];
    for (int i = 0; i < 256; i++) S[i] = (uint8_t)i;
    int j = 0;
    for (int i = 0; i < 256; i++) {
        j = (j + S[i] + (uint8_t)key[i % key_len]) & 0xFF;
        uint8_t t = S[i]; S[i] = S[j]; S[j] = t;
    }
    int i2 = 0; j = 0;
    for (int k = 0; k < data_len; k++) {
        i2 = (i2 + 1) & 0xFF;
        j = (j + S[i2]) & 0xFF;
        uint8_t t = S[i2]; S[i2] = S[j]; S[j] = t;
        out[k] = data[k] ^ S[(S[i2] + S[j]) & 0xFF];
    }
    return data_len;
}

//============================================================
// ChaCha20 (RFC 7539)
//============================================================

static inline uint32_t rotl32(uint32_t v, int n) { return (v << n) | (v >> (32 - n)); }

#define QR(a,b,c,d) \
    a+=b; d^=a; d=rotl32(d,16); \
    c+=d; b^=c; b=rotl32(b,12); \
    a+=b; d^=a; d=rotl32(d, 8); \
    c+=d; b^=c; b=rotl32(b, 7);

static void chacha20_block(uint32_t out[16], const uint32_t in[16])
{
    uint32_t x[16];
    memcpy(x, in, 64);
    for (int i = 0; i < 10; i++) {
        QR(x[0],x[4],x[ 8],x[12]); QR(x[1],x[5],x[ 9],x[13]);
        QR(x[2],x[6],x[10],x[14]); QR(x[3],x[7],x[11],x[15]);
        QR(x[0],x[5],x[10],x[15]); QR(x[1],x[6],x[11],x[12]);
        QR(x[2],x[7],x[ 8],x[13]); QR(x[3],x[4],x[ 9],x[14]);
    }
    for (int i = 0; i < 16; i++) out[i] = x[i] + in[i];
}

//------------------------------------------------------------
// chacha20_crypt(key32, nonce12, counter, data, data_len, out, out_size)
//   key: 32 bytes, nonce: 12 bytes
//   Returns output length, or -1 on error.
//------------------------------------------------------------
EXPORT int __cdecl chacha20_crypt(const char *key, const char *nonce, int counter,
                                   const char *data, int data_len,
                                   char *out, int out_size)
{
    if (out_size < data_len) return -1;
    uint32_t state[16];
    state[0] = 0x61707865; state[1] = 0x3320646e;
    state[2] = 0x79622d32; state[3] = 0x6b206574;
    memcpy(&state[4], key, 32);
    memcpy(&state[13], nonce, 12);

    int pos = 0;
    while (pos < data_len) {
        state[12] = (uint32_t)(counter + pos / 64);
        uint32_t ks[16];
        chacha20_block(ks, state);
        uint8_t *keystream = (uint8_t *)ks;
        int block_len = data_len - pos;
        if (block_len > 64) block_len = 64;
        for (int i = 0; i < block_len; i++) {
            out[pos + i] = data[pos + i] ^ keystream[i];
        }
        pos += block_len;
    }
    return data_len;
}

//============================================================
// XOR cipher (simple)
//============================================================

EXPORT int __cdecl xor_crypt(const char *key, int key_len,
                              const char *data, int data_len,
                              char *out, int out_size)
{
    if (out_size < data_len || key_len <= 0) return -1;
    for (int i = 0; i < data_len; i++) {
        out[i] = data[i] ^ key[i % key_len];
    }
    return data_len;
}

//============================================================
// BCrypt-based: HMAC-SHA256, PBKDF2-SHA256, AES-256-CBC
//============================================================
#include <bcrypt.h>
#pragma comment(lib, "bcrypt.lib")

//------------------------------------------------------------
// hmac_sha256(key, key_len, data, data_len, out_hex, hex_size)
//   Returns 1 on success, writes hex string to out_hex.
//------------------------------------------------------------
EXPORT int __cdecl hmac_sha256_ex(const char *key, int key_len,
                                    const char *data, int data_len,
                                    char *out_hex, int hex_size)
{
    BCRYPT_ALG_HANDLE hAlg = NULL;
    BCRYPT_HASH_HANDLE hHash = NULL;
    UCHAR hash[32];

    // BCRYPT_ALG_HANDLE_HMAC_FLAG = 0x00000008
    if (BCryptOpenAlgorithmProvider(&hAlg, BCRYPT_SHA256_ALGORITHM, NULL, 0x08) != 0)
        return -1;
    if (BCryptCreateHash(hAlg, &hHash, NULL, 0, (PUCHAR)key, key_len, 0) != 0) {
        BCryptCloseAlgorithmProvider(hAlg, 0);
        return -1;
    }
    BCryptHashData(hHash, (PUCHAR)data, data_len, 0);
    BCryptFinishHash(hHash, hash, 32, 0);
    BCryptDestroyHash(hHash);
    BCryptCloseAlgorithmProvider(hAlg, 0);

    // Hex encode
    if (hex_size < 65) return -1;
    for (int i = 0; i < 32; i++)
        sprintf(out_hex + i * 2, "%02x", (int)hash[i]);
    out_hex[64] = '\0';
    return 1;
}

//------------------------------------------------------------
// pbkdf2_sha256_ex(password, pass_len, salt, salt_len, iterations, out, out_len)
//   Writes derived key bytes to out.
//   Returns 1 on success.
//------------------------------------------------------------
EXPORT int __cdecl pbkdf2_sha256_ex(const char *password, int pass_len,
                                      const char *salt, int salt_len,
                                      int iterations,
                                      char *out_hex, int out_key_len)
{
    BCRYPT_ALG_HANDLE hAlg = NULL;
    if (BCryptOpenAlgorithmProvider(&hAlg, BCRYPT_SHA256_ALGORITHM, NULL, 0x08) != 0)
        return -1;

    UCHAR derived[256];
    if (out_key_len > 256) return -1;
    NTSTATUS st = BCryptDeriveKeyPBKDF2(hAlg,
        (PUCHAR)password, pass_len,
        (PUCHAR)salt, salt_len,
        (ULONGLONG)iterations,
        derived, out_key_len, 0);
    BCryptCloseAlgorithmProvider(hAlg, 0);
    if (st != 0) return -1;

    // Hex encode
    for (int i = 0; i < out_key_len; i++)
        sprintf(out_hex + i * 2, "%02x", (int)derived[i]);
    out_hex[out_key_len * 2] = '\0';
    return 1;
}

//------------------------------------------------------------
// aes256cbc_encrypt(key32, iv16, data, data_len, out, out_size)
//   Returns ciphertext length, or -1 on error.
//------------------------------------------------------------
EXPORT int __cdecl aes256cbc_encrypt(const char *key, const char *iv,
                                      const char *data, int data_len,
                                      char *out, int out_size)
{
    BCRYPT_ALG_HANDLE hAlg = NULL;
    BCRYPT_KEY_HANDLE hKey = NULL;
    UCHAR iv_copy[16];

    if (BCryptOpenAlgorithmProvider(&hAlg, BCRYPT_AES_ALGORITHM, NULL, 0) != 0)
        return -1;
    // Set CBC mode
    BCryptSetProperty(hAlg, BCRYPT_CHAINING_MODE, (PUCHAR)BCRYPT_CHAIN_MODE_CBC,
                      sizeof(BCRYPT_CHAIN_MODE_CBC), 0);

    if (BCryptGenerateSymmetricKey(hAlg, &hKey, NULL, 0, (PUCHAR)key, 32, 0) != 0) {
        BCryptCloseAlgorithmProvider(hAlg, 0);
        return -1;
    }

    memcpy(iv_copy, iv, 16);
    ULONG cbResult = 0;
    // BCRYPT_BLOCK_PADDING = 1
    NTSTATUS st = BCryptEncrypt(hKey, (PUCHAR)data, data_len, NULL,
                                 iv_copy, 16, (PUCHAR)out, out_size, &cbResult, 1);
    BCryptDestroyKey(hKey);
    BCryptCloseAlgorithmProvider(hAlg, 0);
    if (st != 0) return -1;
    return (int)cbResult;
}

//------------------------------------------------------------
// aes256cbc_decrypt(key32, iv16, data, data_len, out, out_size)
//   Returns plaintext length, or -1 on error.
//------------------------------------------------------------
EXPORT int __cdecl aes256cbc_decrypt(const char *key, const char *iv,
                                      const char *data, int data_len,
                                      char *out, int out_size)
{
    BCRYPT_ALG_HANDLE hAlg = NULL;
    BCRYPT_KEY_HANDLE hKey = NULL;
    UCHAR iv_copy[16];

    if (BCryptOpenAlgorithmProvider(&hAlg, BCRYPT_AES_ALGORITHM, NULL, 0) != 0)
        return -1;
    BCryptSetProperty(hAlg, BCRYPT_CHAINING_MODE, (PUCHAR)BCRYPT_CHAIN_MODE_CBC,
                      sizeof(BCRYPT_CHAIN_MODE_CBC), 0);

    if (BCryptGenerateSymmetricKey(hAlg, &hKey, NULL, 0, (PUCHAR)key, 32, 0) != 0) {
        BCryptCloseAlgorithmProvider(hAlg, 0);
        return -1;
    }

    memcpy(iv_copy, iv, 16);
    ULONG cbResult = 0;
    NTSTATUS st = BCryptDecrypt(hKey, (PUCHAR)data, data_len, NULL,
                                 iv_copy, 16, (PUCHAR)out, out_size, &cbResult, 1);
    BCryptDestroyKey(hKey);
    BCryptCloseAlgorithmProvider(hAlg, 0);
    if (st != 0) return -1;
    return (int)cbResult;
}

BOOL WINAPI DllMain(HINSTANCE hinst, DWORD reason, LPVOID reserved)
{
    return TRUE;
}
