# hsp3dx

HSP3 + **DxLib** で Windows / iOS / Android を 1 本の `.ax` で動かすクロスプラットフォームランタイム。

- HSP3Dish との差別化 = **DxLib の 2000 関数超の API** (3D / エフェクト / 動画 / ネットワークなど) が mobile でそのまま使える
- 3 プラットフォームで **同一 `.ax` バイト列** を VM がインタプリト実行
- 文字コードは **UTF-8 固定** (3 プラットフォーム共通化のため)

## 仕様

→ [docs/hsp3dx_spec.md](../docs/hsp3dx_spec.md)

## 現状: Phase 0 (仕様策定 + 移行ツール + ディレクトリ雛形)

| Phase | 内容 | 状態 |
|---|---|---|
| **Phase 0** | 仕様書 / SJIS→UTF-8 移行ツール / ディレクトリ雛形 | ✅ |
| Phase 1 | Windows 版 `hsp3dx.exe` MVP (DxLib コア 40 関数) | 未着手 |
| Phase 2 | `hsp3dx_cnv` / `hsp3dx_pack` ツール | 未着手 |
| Phase 3 | iOS 版 `libhsp3dx.a` + Xcode テンプレ | 未着手 |
| Phase 4 | Android 版 `libhsp3dx.so` + Studio テンプレ | 未着手 |
| Phase 5 | DxLib API を 40 → 500 関数に拡張 | 未着手 |
| Phase 6 | 3D / 動画 / ネットワーク追加 | 未着手 |

## ディレクトリ構成

```
hsp3dx/
  samples/         Phase 1 検証用サンプル (雛形のみ、DxLib 命令は Phase 1 で実装)
  win32/           Phase 1 で hsp3dx.exe のソース/vcxproj を配置
  ios/             Phase 3 で Xcode プロジェクトを配置
  ndk/             Phase 4 で Android Studio プロジェクトを配置
```

## 関連ツール

- [tools/hsp3dx_sjis2utf8/](../tools/hsp3dx_sjis2utf8/) — 既存 SJIS `.hsp` ソースを UTF-8 に一括変換
