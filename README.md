# IronHSP

**.NET をフル活用できる、HSP 互換 + 拡張ランタイム / 言語スイート**

OpenHSP 3.8beta1 をベースに、.NET Framework 4.8 連携 / 64bit 対応 / wstr (UTF-16) / 構造体型 (NSTRUCT) / OpenCV 4 / DXLib / HSP風 .NET コンパイラ (nhspc) / Visual Studio 2022 + VS Code 統合まで、多数の機能を追加した実験プロジェクトです。

> Based on http://dev.onionsoft.net/svn/openhsp/trunk (Subversion) — 3.8beta1 系。`hspver "3.8beta1"`, see [`hsp3/hsp3config.h`](hsp3/hsp3config.h)

---

## 主な追加機能 (vanilla HSP3 との差分)

### ランタイム / 言語コア

- **`int64` / `long` 型** — Phase 1〜6 で導入。変数型・システム変数・関数・コンパイラリテラル・パラメータすべて対応。
- **`intptr` 型** — プラットフォーム依存サイズの整数型 (x86=32bit / x64=64bit)。`#func` / `#cfunc` / `#cfuncd` / `#cfuncf` / `#cfuncst` / `#comfunc` / `#cbmethod` の全 DLL 系関数で `int` / `int64` の代わりに使えて、**同じ HSP source が x86/x64 両方で動く**。HANDLE / ポインタ系引数を書くときに使う。hsp3net 専用。
- **`wstr` 型 (UTF-16 ワイド文字列)** — `L"..."` リテラル + 文字列関数 / 命令 / `note` 系 / 自動変換まで全 Phase 完了。
- **構造体型 `HSPVAR_FLAG_NSTRUCT`** — `#defstruct` / `stdim` で確保。`#field` / `#defunion` / `pack` / `Size` / `LayoutKind` 全対応。`#cfuncst` で構造体戻り値 DLL 関数を呼べる、`callfuncst` で動的呼び出し可。`varsize(STRUCT)` で型サイズ取得。`MPTYPE_STRUCTVAL` で構造体値渡しも対応。
- **.NET 連携 (hsp3net)** — Phase 7〜12 で `loadnet` / `newnet` / `netres` / `mcall` 等を通じて任意の .NET 4.8 アセンブリを呼び出せます。例外処理 (`neterror` / `netexerr`)、`CnvCustom`、`tonet`、Enum 変換、`objprm` 対応済み。
- **DLL の double / float 戻り値** — `#cfuncd` / `#cfuncf` / `callfuncd` / `callfuncf`。
- **可変長引数 (`...`)** — `#func` / `#cfunc` 等のパラメータリスト末尾に `...` を書くと、C の `printf` 系 variadic DLL 関数を直接呼べる。引数の型は式の評価結果から自動推論 (int/double/str)。`#cfunc crt_sprintf "sprintf" var, str, ...` → `n = crt_sprintf(s, "%d + %.2f", 42, 3.14)`。
- **`setcallback` / `callbackarg`** — flat C 関数コールバックを HSP ラベルから生成 (動的 thunk)。WNDPROC や SetWindowsHookEx 等に渡せる。hsp3net 専用。
- **COM コールバックインターフェース (`#defcbcom`)** — `IDropTarget` / `IBindStatusCallback` 等の COM インターフェースを HSP 側で実装し、外部 COM API に渡せる。`#cbmethod` で各メソッドを HSP ラベルにマッピング、`newcomcb` でインスタンス化、`comprm()` / `comcbidx()` / `comcbtag()` / `comret` で実行コンテキストにアクセス。IUnknown (QI/AddRef/Release) は runtime が自動実装。x86/x64 両対応の動的 vtable トランポリン生成。hsp3net 専用。詳細は [`package/win32/sample/cbcom/`](package/win32/sample/cbcom/)。
- **WinForms 統合** — `screen` を Form として扱い、HSP の GUI オブジェクトを .NET 化。
- **Allman ブレーススタイル** — `if` / `else` のブロック開始 `{` を次行に書く記法 (Allman / BSD スタイル) に対応。従来の同一行 `{` も従来通り動作。サンプル: [`package/win32/sample/basic/allman_brace.hsp`](package/win32/sample/basic/allman_brace.hsp)。
- **環境変数・コマンドライン引数** — `getenv` / `setenv` / `delenv` / `hasenv` で環境変数を操作、`getcmdargc` / `getcmdarg` / `getcmdargs("--name", default)` / `getcmdargi("--name", default)` / `hascmdarg("--flag")` で Python の `sys.argv` + `argparse` 相当のコマンドライン引数パースを内蔵。`--name=value` / `--name value` 両形式対応。
- **連想配列 (MAP 型)** — `dimmap map` で連想配列を作成し、`map("key") = value` で文字列キーによる読み書きが可能。内部は `std::unordered_map<std::string, std::string>`。`mapcount` / `hasmap` / `mapkey` 関数と `delmap` / `mapclear` 命令を追加。サンプル: [`package/win32/sample/basic/sample_map.hsp`](package/win32/sample/basic/sample_map.hsp)。
- **統計関数 (`iron_stat.hsp`)** — 外部 DLL 不要の純 HSP 実装。`stat_mean` / `stat_median` / `stat_stddev` / `stat_variance` / `stat_min` / `stat_max` / `stat_sum` / `stat_range` / `stat_percentile` / `stat_describe` の 10 関数。int/double 配列対応。
- **任意精度数値 + SIMD (`hspmathex.dll`)** — HSPVAR 型拡張として `bigint` (任意精度整数 / Java BigInteger 相当) と `bigdec` (任意精度10進固定小数 / Java BigDecimal 相当) を追加。`a = bigint("12345678901234567890")` のように通常の変数として扱え、`c = a + b` のように `+ - * / \ & | ^ == != < >` 全演算子が自然に使える。`str()` / `vartype()` も対応。並列してハンドルベース API (`bi_*` / `bigdec_*`) と SSE/AVX2 SIMD 配列演算 (`simd_*` — add/sub/mul/div/dot/sum/min/max/matmul/pixel_blend 等、CPU 機能検出で自動フォールバック) も提供。1 DLL で 80 エクスポート。32/64bit 両対応。
- **正規表現 2 エンジン** — `hspregex.dll` (C++11 std::regex, ECMAScript 互換) と `hsppcre2.dll` (PCRE2 10.44, Perl 互換, Unicode フル対応)。高レベルラッパー `iron_regex.hsp` / `iron_pcre2.hsp` で `regex_match` / `regex_search` / `regex_replace` / `regex_find` + `regex_get` が使える。32/64bit 両対応。
- **暗号化/復号 (`iron_crypto.hsp` + `hspcrypto.dll`)** — Blowfish / RC4 / ChaCha20 (RFC 7539) / XOR / AES-256-CBC (BCrypt) / HMAC-SHA256 / PBKDF2-SHA256。32/64bit 両対応。
- **レジストリ操作 (`iron_registry.hsp`)** — Win32 API 直叩き。`reg_read` / `reg_write` / `reg_write_dword` / `reg_delete_value` / `reg_delete_key` / `reg_exists`。
- **ファイル監視 (`iron_fwatch.hsp`)** — Win32 `FindFirstChangeNotification` ベース。`fwatch_start` / `fwatch_check` / `fwatch_stop` でディレクトリの変更をポーリング監視。
- **EXIF 読み取り (`iron_exif.hsp`)** — GDI+ PropertyItem API。`exif_open` / `exif_get_str` / `exif_get_int` / `exif_get_rational` / `exif_close` で JPEG/TIFF の撮影情報を取得。
- **FTP クライアント (`iron_ftp.hsp`)** — WinINet ベース。`ftp_connect` / `ftp_upload` / `ftp_download` / `ftp_list` / `ftp_mkdir` / `ftp_delete` 等。FTP/FTPS (Passive) 対応。
- **SMTP メール送信 (`iron_smtp.hsp` + `hspsmtp.dll`)** — Winsock2 ベース SMTP クライアント。AUTH LOGIN 認証、複数宛先対応。
- **HTML パース (`iron_html.hsp` + `hsphtml.dll`)** — 軽量 HTML タグパーサ。`html_parse` / `html_find` / `html_tag_text` / `html_tag_attr` でタグ検索・属性取得。
- **グラフ/チャート (`iron_chart.hsp`)** — Chart.js + WebView2/ブラウザ。棒/折れ線/円/ドーナツ/レーダー/散布図の 6 種類。`chart_init` → `chart_data` → `chart_show` の簡潔 API。
- **グラフ/チャート ネイティブ (`iron_chart_d2d.hsp`)** — hspd2d (Direct2D) 直接描画。WebView2 不要。棒グラフ (`chartd2d_bar`) / 折れ線 (`chartd2d_line`) / 2系列棒 (`chartd2d_bar2`)。
- **SSH/SFTP (`iron_ssh.hsp` + `hspssh.dll`)** — libssh2 + WinCNG。`ssh_connect` / `ssh_exec` / `sftp_upload` / `sftp_download`。32/64bit 両対応。
- **OAuth 2.0 (`iron_oauth.hsp`)** — ブラウザ認証 + localhost TCP コールバックで Authorization Code を取得。`oauth_start_listener` / `oauth_wait_code`。
- **形態素解析 (`iron_mecab.hsp`)** — MeCab C API ラッパー。`mecab_init` / `mecab_parse`。libmecab.dll と辞書が別途必要。
- **帳票出力 (`iron_report.hsp`)** — HTML テンプレート + `{{key}}` 差し込み。テーブル行の動的生成対応。`report_preview` でブラウザ印刷。
- **画面キャプチャ (`iron_capture.hsp` + `hspcapture.dll`)** — DXGI Desktop Duplication。`capture_init` → `capture_save "file.bmp"` でスクリーンショット。32/64bit。
- **音声ループバック (`iron_audioloop.hsp` + `hspaudioloop.dll`)** — WASAPI ループバック。PC 再生音を WAV 録音。ステレオミックス不要。32/64bit。
- **画面拡大 (`iron_magnify.hsp`)** — Magnification API。`mag_fullscreen_on 200` で 2 倍拡大。
- **DPI 対応 (`iron_dpi.hsp`)** — Per-Monitor DPI V2。`dpi_set_awareness` / `dpi_get` / `dpi_scale`。
- **IME 制御 (`iron_ime.hsp`)** — imm32.dll。`ime_on` / `ime_off` / `ime_set_mode` (ひらがな/カタカナ切替)。
- **タッチ入力 (`iron_touch.hsp`)** — InjectTouchInput。`touch_tap x, y` でタッチシミュレーション。
- **ネットワーク情報 (`iron_netinfo.hsp`)** — `netinfo_connected` / `netinfo_ip` / `netinfo_hostname`。
- **.NET 版モジュール** — `iron_regex_net` / `iron_crypto_net` / `iron_registry_net` / `iron_fwatch_net` / `iron_smtp_net` / `iron_html_net` / `iron_ftp_net` の 7 モジュール。ネイティブ版の .NET 代替。
- **ユーティリティ (21個)** — iron_datetime / iron_stopwatch / iron_uuid / iron_path / iron_uri / iron_folder / iron_strbuf / iron_urlencode / iron_jwt / iron_markdown / iron_log / iron_process / iron_matrix / iron_graph / iron_tray / iron_hotkey / iron_splash / iron_qr / iron_xml / iron_service / iron_task
- **WinForms UI (iron_forms)** — Anchor/Dock/DataGridView/TabControl/SplitContainer/MenuStrip/PropertyGrid/TableLayout。リサイズ追従の ctrl_anchor が目玉。
- **ゲーム (iron_game)** — HitTest/Vec2D/Easing 10種/FPS/Tilemap
- **バリデーション (iron_validate)** / **C#スクリプト (iron_async)** / **ダークモード (iron_darkmode)**
- **ファイル操作 (iron_fs)** — copy/move/readtext/writetext/is_locked/mkdir_p/rmdir_r/listfiles。**全 API Unicode (W版) 対応**、絵文字・環境依存文字パス可
- **D&D (iron_dragdrop)** / **クリップボード (iron_clipboard2)** / **印刷 (iron_print)** / **GDI+ (iron_gdiplus)** / **ドッキング (iron_docking)** / **リボン (iron_ribbon2)**
- **Windows Ribbon Framework (`iron_ribbon_native.hsp`)** — 本物の UIRibbon COM。uicc.exe で XML → BML コンパイル → 画像+文字列自動埋め込み → ロード。[専用ドキュメント](docs/ribbon_guide.html)
- **Math.NET Numerics (`iron_math_net.hsp`)** — 統計/分布/線形代数/補間。MathNet.Numerics.dll 同梱
- **テスト (`iron_test`)** / **配列操作 (`iron_array2`)** / **文字列拡張 (`iron_str2`)** / **色変換 (`iron_color`)** / **ヒューマナイズ (`iron_humanize`)** / **再帰検索 (`iron_glob`)** / **テキスト差分 (`iron_diff`)** / **Stack/Queue (`iron_collection`)** / **偽データ (`iron_faker`)** / **YAML (`iron_yaml`)** / **.env (`iron_dotenv`)** / **CLI 表 (`iron_table2`)** / **プログレスバー (`iron_progress_cl`)** / **Word (`iron_docx`)** / **PowerPoint (`iron_pptx`)** / **バーコード (`iron_barcode`)** / **スクレイピング (`iron_scraper`)** / **キャッシュ (`iron_cache`)** / **Pub/Sub (`iron_event`)** / **リトライ (`iron_retry`)** / **ステートマシン (`iron_statemachine`)** / **MessagePack (`iron_msgpack`)** / **Bloom フィルタ (`iron_bloom`)**

### 新規プラグイン

- **hspcv4** ([`plugins/win32/hspcv4/`](plugins/win32/hspcv4/)) — OpenCV 4.12 + opencv_contrib をベースに新規開発したプラグイン。**全 277 命令** (main DLL + hspcv4_contrib.dll の 2 モジュール構成)。FreeType / HarfBuzz による日本語フォント描画、Tesseract OCR、wechat_qrcode、saliency、SWT text detection、stereo / xfeatures2d / ximgproc / ml / face / dnn 等、フル装備。**Phase I (QR/Barcode)**: `cv4_qr_encode` で QR コード生成、`cv4_barcode_detect`/`cv4_barcode_decode` で 1D バーコード (Code128/EAN-13/EAN-8/UPC-A) 検出 + デコード。**アルファチャンネル対応 (Phase 1-3)**: `cv4load` がデフォルトで `IMREAD_UNCHANGED` を使い PNG 等の BGRA を保持、`with_alpha_preserved` ヘルパーで blur/filter2d/canny/sobel/morphology 等の主要フィルタ系がアルファを自動分離・再合成、`cv4_get_pixela` で 4ch ピクセル読み取り対応。**Phase F1-F6 (2026-04-16)**: OLDDLL `$202` 形式から typed `#func` 新形式へ 277 関数全部を移行済 (混合戦略: typed 引数 / `pval` / `bmscr`)。

### 大幅拡張したプラグイン

- **hspdxlib** ([`plugins/win32/hspdxlib/`](plugins/win32/hspdxlib/)) — [DX ライブラリ (山田 巧 氏)](https://dxlib.xsrv.jp/) を `#uselib` / `#func` / `#cfunc` / `#cfuncst` で呼べるよう自動ラッパ生成。`gen_hspdxlib.py` で 55 構造体を自動 `#defstruct` 化、166 関数で値渡し ABI 修正、32 / 64 bit 検証済み。

### Pure HSP モジュール

- **hspd2d** ([`package/win32/common/hspd2d.hsp`](package/win32/common/hspd2d.hsp)) — DirectWrite + Direct2D + WIC を **HSP の COM 機能 (`#usecom` / `#comfunc` / `newcom -1/-2`) だけで wrap** したモジュール。C++ DLL を介さずに高品質テキスト描画と画像読み書きを実現。`d2d_init` / `d2d_image_create` / `d2d_image_load` / `d2d_clear` / `d2d_font` / `d2d_color` / `d2d_drawtext` / `d2d_drawline` / `d2d_drawrect` / `d2d_fillrect` / `d2d_drawellipse` / `d2d_fillellipse` / `d2d_drawimage` / `d2d_image_save` 等のコマンドを提供。PNG / BMP / JPEG / TIFF / GIF 形式のロード・保存対応。`D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT` を有効にしているので **Segoe UI Emoji 等の COLR/CPAL カラーフォントによる絵文字** も自動で色付き描画される。サンプル: [`package/win32/sample/hspd2d/`](package/win32/sample/hspd2d/)。

### Win32 API 大幅拡充 (CsWin32 bridge)

OpenHSP 標準の `package/win32/common/user32.as` / `kernel32.as` / `gdi32.as` 等は古く (sptr ベース、構造体未対応、x64 で破綻ぎりぎり)、kernel32.dll の 1449 exports に対して 67 関数 (4%) しかカバーできていなかった。これを **dumpbin による実 DLL exports 走査 + Microsoft の [win32metadata](https://github.com/microsoft/win32metadata) (CsWin32 source generator)** をベースに体系的に再構築:

- **51 DLL / 6020 関数 / 118 COM インターフェース / 1238 COM メソッド** ([`package/win32/common/*_gen2.as`](package/win32/common/) + [`package/hsphelp/win32_*_gen2.hs`](package/hsphelp/))
- そのうち約 28000 entries に **日本語 MSDN ヘルプ** 付き (Phase E + F の +1682 関数分は次回翻訳予定)
- 自動 A/W 選択 (`CreateFileW` / `MessageBoxW` / `RegOpenKeyExW` 等が自動でユニコード版を選択)
- 完全な `intptr` / `wstr` / `var` (NSTRUCT pointer) 型マッピング
- 全定数 enum を自動 `#define` 展開 (`SW_*` / `SM_*` / `WS_*` / `MB_*` / `WM_*` / `KEY_*` 等)
- 共有 `win32_types_gen2.as` に 734 構造体 + 608 enum 群を集約 (各 DLL .as は `#include` で参照)
- `#usecom` / `#comfunc` 形式で COM インターフェース ([IFileDialog](package/win32/common/com_misc_gen2.as) / IDropTarget / IShellLinkW / IDataObject / ID2D1Factory / IDWriteFactory / IWICImagingFactory / IDXGIFactory 等) も自動生成

#### カバー DLL 一覧 (51 DLL / 6020 関数)

| カテゴリ | DLL (関数数) |
|---|---|
| ベース (大規模) | kernel32 (881), user32 (606), advapi32 (419), oleaut32 (404), gdi32 (384), crypt32 (218), shell32 (195), wininet (192) |
| マルチメディア / OLE / デバッグ | winmm (146), ole32 (143), dbghelp (128), comctl32 (94) |
| グラフィック (Phase F) | **gdiplus (627), opengl32 (353), glu32 (52)** |
| OpenGL / 3D | gdiplus / opengl32 / glu32 / d2d1 (13) / dwrite (1) / windowscodecs (9) |
| ネットワーク (Phase E/F) | **ws2_32 (90), iphlpapi (194), winhttp (46), urlmon (71), wlanapi (59)** |
| HTTP / XML | **httpapi (42), xmllite (6)**, wininet, winhttp |
| DirectX エントリ点 | **dxgi (5), d3d11 (5), dinput8 (1), xaudio2_8 (4)** |
| UI / IME / DWM / テーマ | uxtheme (77), imm32 (63), dwmapi (31), wtsapi32 (44) |
| セキュリティ / 暗号 | bcrypt (53), userenv (34), wintrust (7), secur32 (8) |
| システム | psapi (20), version (7), shlwapi (15), msimg32 (3), powrprof (84), wer (20), netapi32 (45) |
| bonus | comdlg32, ncrypt, normaliz, propsys |

#### パイプライン

```
dumpbin /exports → tools/cswin32_bridge/dump_exports.py → NativeMethods.txt
                                                              ↓
                                          dotnet build (CsWin32 SourceGenerator)
                                                              ↓
                              tools/cswin32_bridge/gen_from_cswin32.py (Python)
                                                              ↓
                         package/win32/common/<dll>_gen2.as + win32_types_gen2.as
                         package/hsphelp/win32_<dll>_gen2.hs (英語/日本語 fallback)
```

`tools/cswin32_bridge/docs_ja.json` (約 26000 entries) と `tools/cswin32_bridge_com/docs_ja.json` (2951 entries) に MSDN-JP 準拠の常体翻訳をキャッシュ。再生成時に自動的に日本語ヘルプとして埋め込まれる。

新規 API を追加するときは `NativeMethods.txt` に 1 行追加 → `dotnet build` → `python gen_from_cswin32.py` だけで .as / .hs まで完成する。詳細は [`tools/cswin32_bridge/`](tools/cswin32_bridge/) と [`tools/cswin32_bridge_com/`](tools/cswin32_bridge_com/)。

### IronHSP Simple モジュール集 ([`package/win32/common/iron_*.hsp`](package/win32/common/))

生の Win32 API は強力だが、初心者には敷居が高い。よく使うパターンを **1〜2 行で書ける薄い HSP モジュール** として wrap した「IronHSP Simple」シリーズを `iron_*.hsp` として提供:

#### システム / ユーティリティ

| モジュール | 機能 | 例 |
|---|---|---|
| **`iron_ini.hsp`** | INI 設定ファイル読み書き (kernel32 GetPrivateProfile*) | `ini_setpath "config.ini"` / `ini_geti "Window","Width",640` |
| **`iron_http.hsp`** | HTTP GET/POST + multipart upload (winhttp.dll) | `http_get url, body` / `http_post url, body, out` / `http_post_file url, "audio.wav", ...` |
| **`iron_json.hsp`** | JSON parse/build (hspjson.dll wrapper) | `hid = json_load(text)` / `json_str(hid, "name")` / `json_pretty(hid)` |
| **`iron_hash.hsp`** | SHA-1/256/384/512 / MD5 / Base64 (bcrypt + crypt32) | `hash_sha256 "hello world"` → `refstr` に hex / `base64_encode "Hi"` |
| **`iron_dialog.hsp`** | モダン (Vista+) ファイルダイアログ (IFileOpenDialog COM) | `dialog_open "ファイル選択"` / `dialog_save` |
| **`iron_perf.hsp`** | μ秒精度タイマー (QueryPerformanceCounter) | `perf_start` ... `perf_lap` → `refdval` に経過秒 |
| **`iron_sysinfo.hsp`** | OS / CPU / ユーザ情報 (10 個) | `sys_username` / `sys_cpucount` / `sys_temp_path` 等 |
| **`iron_clip.hsp`** | クリップボード文字列 (HSP 標準より柔軟) | `clip_set_text "..."` / `clip_get_text` / `clip_has_text` |
| **`iron_toast.hsp`** | タスクトレイバルーン通知 (Shell_NotifyIcon) | `toast "title", "body"` / `toast_warning` / `toast_error` |
| **`iron_shell.hsp`** | ShellExecute / ゴミ箱送り / .lnk 作成 (shell32 + IShellLink COM) | `shell_open "path"` / `shell_recycle "file"` / `shell_mklink target, "link.lnk"` |
| **`iron_7z.hsp`** | 7z / zip / tar.gz / xz / rar(読) / iso など 40+ 形式の読み書き (hsp7z.dll + 同梱 7za.exe) | `iron_7z_add "out.7z", "dir\\"` / `iron_7z_list "in.zip", names, sizes` / `iron_7z_extract "a.tar.gz", "out\\"` |
| **`iron_db.hsp`** | SQLite 3.46 組み込みデータベース (hspdb.dll) | `h = db_open("test.db")` / `db_exec h, "INSERT..."` / `qh = db_query(h, "SELECT...")` |
| **`iron_webserver.hsp`** | localhost HTTP サーバ (winsock ベース, hspwebsrv.dll) | `web_open 8080` / `web_accept method, path, body` / `web_respond 200, "text/html", html` |
| **`iron_serial.hsp`** | シリアルポート (kernel32 CreateFile + DCB) | `serial_open "COM3", 115200` / `serial_write "hello\n"` / `serial_read buf, 256` |

#### マルチメディア (動画 / カメラ / 録音)

| モジュール | 機能 | 例 |
|---|---|---|
| **`iron_video.hsp`** | 動画/音声再生 (Media Foundation MFPlay, IMFPMediaPlayer #comfunc 直叩き) | `iron_video_open "movie.mp4", hwnd` / `iron_video_play` / `iron_video_set_rate 1.5` |
| **`iron_camera.hsp`** | Webcam 取り込み (hspcv4 OpenCV VideoCapture wrapper) | `iron_camera_open 0` / `iron_camera_read` / `iron_camera_draw` |
| **`iron_camera_mf.hsp`** | Webcam + 録画 + マイク録音 (hspmfcam.dll) | `h = iron_cam_open(0, 0, 0, 800, 600)` / `iron_cam_record_av h, "out.mp4", 0, "H264", 4000000, "AAC", 16000` / `iron_mic_save_wav h2, "voice.wav"` |

#### AI / クラウド連携

| モジュール | 機能 | 例 |
|---|---|---|
| **`iron_ai.hsp`** | OpenAI 互換 Chat API クライアント (Anthropic / Ollama / Groq / GitHub Models / xAI 等) | `iron_ai_set_endpoint "https://api.groq.com/openai/v1"` / `iron_ai_chat msg, reply` / `iron_ai_transcribe "voice.wav", text` |
| **`iron_speech.hsp`** | 音声認識統一 API (5 バックエンド切替) | `iron_speech_set_backend SPEECH_BACKEND_WHISPER` / `iron_speech_transcribe "voice.wav", text` |
| **`iron_mcp_client.hsp`** | Model Context Protocol クライアント (stdio + HTTP) | `iron_mcp_open_stdio "npx -y @modelcontextprotocol/server-filesystem ..."` / `iron_mcp_call "search_files", args, result` |
| **`iron_mcp_server.hsp`** | HSP3CL を MCP stdio server 化 | `iron_mcp_server_tool "say_hello", "...", *handler` / `iron_mcp_server_run` |

各モジュールに対応するサンプルが [`package/win32/sample/iron/`](package/win32/sample/iron/) にあり、ヘルプは [`package/hsphelp/iron_*.hs`](package/hsphelp/) で日本語 IDE F1 表示可能。

### 新規プラグイン DLL (本拡張で追加)

| DLL | 役割 | 対応 |
|---|---|---|
| **[`hspjson.dll`](plugins/win32/hspjson/)** | 自前 JSON parser/writer (依存ゼロ、~300 KB) | Win32 + x64 |
| **[`hspmfcam.dll`](plugins/win32/hspmfcam/)** | Pure Media Foundation Webcam キャプチャ + 録画 (max 256 並列 / 録画 H.264/HEVC/WMV9/VP9/MJPG + AAC/WMA/FLAC/MP3 / マイク単独 PCM/WAV/エンコード録音 / プロパティ /自動デインターレース). 68 関数 export | Win32 + x64 |
| **[`hspmcp.dll`](plugins/win32/hspmcp/)** | Model Context Protocol stdio transport ヘルパ (CreateProcess + 匿名 pipe + reader thread) | Win32 + x64 |
| **[`hspwhisper.dll`](plugins/win32/hspwhisper/)** | whisper.cpp ベースのオフライン音声認識。多言語 Whisper モデル対応 (tiny〜large) | x64 |
| **[`hspvosk.dll`](plugins/win32/hspvosk/)** | Vosk (Kaldi) ベースの軽量オフライン音声認識。24+ 言語 model 50 MB〜 | x64 |
| **[`hspsapi.dll`](plugins/win32/hspsapi/)** | Windows SAPI 5 (sapi.dll) オフライン音声認識。OS 標準、追加 DL 不要 | Win32 + x64 |
| **[`hspwinrtspeech.dll`](plugins/win32/hspwinrtspeech/)** | Windows.Media.SpeechRecognition (cppwinrt) ライブマイク認識 | x64 |
| **[`hspwebsrv.dll`](plugins/win32/hspwebsrv/)** | winsock ベースの minimal HTTP server (URL reservation/admin 不要) | Win32 + x64 |
| **[`hsp7z.dll`](plugins/win32/hsp7z/)** | 7-Zip 公式 CLI (7za.exe) のサブプロセスラッパ。7z/zip/tar.gz/xz/bz2/rar(読)/wim/iso 等 40+ フォーマット。LGPL な 7za.exe を同梱して DLL 差し替えでセキュリティ追従可 | Win32 + x64 |
| **[`hspdb.dll`](plugins/win32/hspdb/)** | SQLite 3.46.1 amalgamation 組み込み (2348 関数内包) | x64 |
| **[`hspmidi.dll`](plugins/win32/hspmidi/)** | winmm MIDI in/out (16 関数)。GM 音色再生からポーリング受信まで | x64 |
| **[`hspwasm.dll`](plugins/win32/hspwasm/)** | Wasm3 embed (~150 KB インタプリタ)。Rust/Go/Zig/C/AS で書いた `.wasm` を HSP 拡張として実行可能 | x64 |
| **[`hsppdf.dll`](plugins/win32/hsppdf/)** | PDFium ベースの PDF 読み取り。テキスト抽出 + ビットマップ化 | x64 (PDFium 配置必須) |
| **[`hspduckdb.dll`](plugins/win32/hspduckdb/)** | DuckDB C API (組み込み分析 DB)。`SELECT * FROM 'data.csv'` 等が直接動く | x64 (DuckDB 配置必須) |
| **[`hspwebview2.dll`](plugins/win32/hspwebview2/)** | Edge WebView2 を HSP window に attach。HSP↔JS 双方向 postMessage | x64 (WebView2 SDK 配置必須) |
| **[`hsponnx.dll`](plugins/win32/hsponnx/)** | ONNX Runtime + DirectML backend。GPU 推論可能 | x64 (ONNX Runtime 配置必須) |
| **[`hspllama.dll`](plugins/win32/hspllama/)** | llama.cpp embed。GGUF モデルでオフライン LLM 推論 (実機検証済) | x64 (llama.cpp prebuilt 同梱) |
| **[`hsptflite.dll`](plugins/win32/hsptflite/)** | TensorFlow Lite C API + MediaPipe ヘルパ。hand_detector / hand_landmarker 用の前後処理 (palm anchor decode / NMS / letterbox) を C++ 側に内蔵 | x64 (ValYouW tflite-dist 同梱) |
| **[`hspwinrtocr.dll`](plugins/win32/hspwinrtocr/)** | Windows.Media.Ocr (WinRT) ローカル OCR | x64 |
| **[`hspwgcapture.dll`](plugins/win32/hspwgcapture/)** | Windows.Graphics.Capture でスクリーン / ウィンドウキャプチャ | x64 |
| **[`hspble.dll`](plugins/win32/hspble/)** | Windows.Devices.Bluetooth (cppwinrt) BLE GATT クライアント | x64 |

### プラグイン関数宣言形式について

上記の新規プラグインはすべて **typed `#func` 形式** (引数型を明示宣言) で書かれています:

```hsp
#func global llama_init     "hspllama_init"
#func global llama_load     "hspllama_load"     str, int, int, var
#func global llama_complete "hspllama_complete" int, str, int, var, int
```

旧来の OLDDLL `$202` 形式 (`#func global cmd cmd $202` + `BOOL WINAPI fn(HSPEXINFO*, int, int, int)` + `HspFunc_prm_*` 経由パラメータ取得) は使っていません。HSP コマンド名と DLL 実体名を分離できるためシンボル衝突を避けやすく、引数型がドキュメントとして残るのが利点です。

### hsp3net 64bit ランタイムの使用

新規プラグインの大半は **hsp3net 64bit 専用** です。サンプルスクリプトの冒頭に以下を追加してください:

```hsp
#include "hsp3_net_64.as"          ; GUI 用
#include "hsp3cl_net_64.as"        ; CLI / テスト用
```

`package/win32/` 配下に以下が配置されています:

| バイナリ | 用途 |
|---|---|
| `hsp3_net.exe` / `hsp3_net_64.exe` | hsp3net GUI ランチャ (32bit / 64bit) |
| `hsp3cl_net.exe` / `hsp3cl_net_64.exe` | hsp3net CLI ランチャ (32bit / 64bit) |
| `hspcmp_net.exe` / `hspcmp_net_64.exe` | hsp3net 対応 hspcmp 3.8beta1 |
| `runtime/hsp3_net.hrt` / `hsp3_net_64.hrt` | GUI ランタイム本体 |
| `runtime/hsp3cl_net.hrt` / `hsp3cl_net_64.hrt` | CLI ランタイム本体 |
| `common/hsp3_net.as` / `hsp3_net_64.as` / `hsp3cl_net.as` / `hsp3cl_net_64.as` | `#runtime` 切替用 |

バニラ HSP の `hsp3.exe` / `hspcmp.exe` / `hsp3cl.exe` は温存されており、既存スクリプトとの互換性は維持されています。

### 標準プラグインの 64bit 対応

OpenHSP 標準同梱のプラグイン (hspvoicevox / hgimg / hgimgx / hspinet / hspsock / hspda / hspdb / hspsw / hspprint / Hspext / obaq 等) は、上記新規開発分とは別に **64bit ビルドへの対応作業** を行っています。機能追加ではなく、x64 ターゲットでもビルド・動作するようにしたものです。

### `nhspc` — HSP風 .NET アセンブリコンパイラ ([`nhspc/`](nhspc/))

HSP に似た文法で **.NET DLL / EXE を直接生成** する独自コンパイラ。`System.Reflection.Emit` ベース、出力は .NET Framework 4.8 アセンブリ (IL)。

**言語機能 (Phase 1〜18 完了、157 ユニットテスト全パス):**

- クラス / インターフェース / 構造体 / enum / delegate / イベント / インデクサ / 演算子オーバーロード / ネストクラス / 静的コンストラクタ / デストラクタ / プロパティ
- 継承 / virtual / override / sealed / abstract
- if / else / elseif / repeat / loop / while / for / foreach / switch / case / break / continue
- try / catch / finally / throw + 例外フィルタ
- ref / out / params / デフォルト引数
- P/Invoke (`#dllimport` / `#dllfunc` の全オプション: EntryPoint / CharSet / CallingConvention / SetLastError / [MarshalAs] / [In] / [Out])
- COM 属性 (`#attribute`)
- 文字列補間 `$"..{x}.."` / 16 進数 `0xFF`/`$FF` / コロン区切り / 行継続 `\` / dim 省略 / `null`/`nullptr` / 値型メンバアクセス
- 三項演算子 `?:` / null 合体 `??` / `is` / `as` / `typeof` / ビット演算 / `++`/`--` / 複合代入

**ビルド出力オプション:**

- `-platform anycpu | x86 | x64 | anycpu32` — ターゲットアーキ (`PortableExecutableKinds` + `Preferred32Bit` 対応)
- `-target dll | exe` — 出力種別 (`#main` 自動判定もあり)
- `-subsystem console | windows` — GUI アプリの黒コンソール窓を抑制
- `-r <assembly>` / `#reference "..."` — 参照アセンブリ追加
- `-win32icon <file>` / `#icon "logo.png"` — Win32 アプリケーションアイコン埋め込み (.ico/.png/.bmp/.gif/.jpg/.tiff 対応、内部で 16/32/48/256 PNG エントリの .ico に自動変換)
- `#manifest "app.manifest"` — Win32 マニフェスト埋め込み
- `#version` / `#fileversion` / `#title` / `#company` / `#product` / `#copyright` 等のメタデータディレクティブ → `DefineVersionInfoResource()` で Win32 VERSIONINFO 自動生成
- `-debug` — Windows PDB 出力。`Pdb2PortablePdb.exe` で Portable PDB に変換可

**エディタ統合:**

- **`NhspEditor.exe`** — スタンドアロン WinForms エディタ (シンタックスハイライト + Platform/Target/SubSystem ドロップダウン + 実行時引数 TextBox 付き)
- **`vscode-nhsp/`** — VS Code 拡張 (シンタックスハイライト + コンパイル/実行/デバッグコマンド + LSP クライアント)
- **`vs2022-nhsp/`** — Visual Studio 2022 拡張 (TextMate 文法 + MEF 経由の `ILanguageClient` + bundled LSP server)。`install.bat /home /openfolder C:\proj` でワンショットセットアップ
- **`sakura/`** — サクラエディタ用 強調キーワード (`.kwd`) + キーワードヘルプ (`.khp`)、Shift-JIS + CRLF

**Language Server (`nhspls.exe`):**

nhspc のレキサー / パーサーをそのまま使った独自 LSP サーバ (JSON-RPC over stdio、Newtonsoft.Json ベース)。サポート機能:

- リアルタイム診断 (`publishDiagnostics`)
- アウトライン (`documentSymbol`)
- 補完 (`completion` — `#` 直後はディレクティブ、それ以外はキーワード/型/ユーザー定義)
- ホバー (`hover` — 型エイリアスは CLR 名、識別子はシグネチャ)
- 定義ジャンプ (`definition` — F12)

VS Code は同梱の最小 LSP クライアント、VS 2022 は `Microsoft.VisualStudio.LanguageServer.Client` MEF コンポーネント経由で使います。

---

## ディレクトリ構造

```
IronHSP_2026/
├── hsp3/                       — HSP3 ランタイム本体 (Win32 / x64)
├── hsp3net/                    — .NET 連携版 ランタイム
├── hsp3cnv/ hsp3dish/ hsp3embed/ hsp3ll/ hsp3rd/ hsp3rtest/
├── hspcmp/                     — HSP コンパイラ (#defstruct / NSTRUCT 対応)
├── plugins/win32/              — 同梱プラグイン
│   ├── hspcv4/                 — OpenCV 4.12 (277 命令 / main + contrib / QR encode + Barcode)
│   ├── hspdxlib/               — DXLib プラグイン化
│   ├── hspvoicevox/            — VOICEVOX 連携 (TTS)
│   ├── hspjson/                — 自前 JSON parser/writer
│   ├── hspmfcam/               — Pure MF Webcam capture + 録画 + マイク (68 関数)
│   ├── hspmcp/                 — Model Context Protocol stdio helper
│   ├── hspwhisper/             — whisper.cpp オフライン音声認識
│   ├── hspvosk/                — Vosk オフライン音声認識
│   ├── hspsapi/                — Windows SAPI 5 音声認識
│   ├── hspwinrtspeech/         — WinRT ライブマイク認識
│   ├── hspwebsrv/              — winsock HTTP server
│   ├── hsp7z/                  — 7-Zip (7za.exe 同梱) アーカイブラッパ
│   ├── hspdb/                  — SQLite 3.46
│   └── ... (hgimg / hspinet / hspsock / hspda / 他)
├── nhspc/                      — HSP風 .NET アセンブリコンパイラ
│   ├── NhspCompiler.Core/      — コアライブラリ (.NET 4.8 Class Library)
│   ├── nhspc/                  — CLI コンパイラ (nhspc.exe)
│   ├── NhspCompiler.Tests/     — 157 ユニットテスト
│   ├── NhspEditor/             — スタンドアロン WinForms エディタ
│   ├── NhspLanguageServer/     — LSP サーバ (nhspls.exe)
│   ├── NhspVsLanguageClient/   — VS 2022 用 MEF ILanguageClient
│   ├── Pdb2PortablePdb/        — Windows PDB → Portable PDB 変換ツール
│   ├── vscode-nhsp/            — VS Code 拡張
│   ├── vs2022-nhsp/            — VS 2022 VSIX ビルドツリー + install.bat
│   ├── sakura/                 — サクラエディタ強調キーワード
│   ├── docs/                   — nhsp_beginners.html / nhsp_reference.html
│   └── samples/                — サンプル .nhsp スクリプト
├── package/                    — HSP 配布用パッケージ素材
├── docs/                       — HSP 公式ドキュメント
└── License.txt / License_j.txt — OpenHSP オリジナルライセンス (BSD)
```

---

## ビルド方法

### HSP3 ランタイム本体

[`hsp3/win32/`](hsp3/win32/) (32bit) または [`hsp3/hsp3_64/`](hsp3/hsp3_64/) (64bit) の `.sln` を Visual Studio 2022 で開いて Release ビルド。

### `nhspc` コンパイラ + エディタ + LSP

```cmd
cd nhspc
"C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe" NhspCompiler.sln /p:Configuration=Release /m
```

これだけで以下がすべてビルドされます:

- `nhspc/nhspc/bin/Release/nhspc.exe` — CLI コンパイラ
- `nhspc/NhspEditor/bin/Release/NhspEditor.exe` — スタンドアロンエディタ
- `nhspc/NhspLanguageServer/bin/Release/net48/nhspls.exe` — LSP サーバ
- `nhspc/NhspVsLanguageClient/bin/Release/net472/NhspVsLanguageClient.dll` — VS 2022 LSP MEF
- `nhspc/Pdb2PortablePdb/bin/Release/net48/Pdb2PortablePdb.exe` — PDB 変換

テスト実行:

```cmd
nhspc\NhspCompiler.Tests\bin\Release\NhspCompiler.Tests.exe
```

### Visual Studio 2022 拡張 (nhsp-language.vsix)

```cmd
cd nhspc\vs2022-nhsp
build.bat                                  REM .vsix を生成 (PowerShell ベース、VS SDK 不要)
install.bat                                REM ビルド + インストール (確認ダイアログあり)
install.bat /q                             REM サイレントインストール
install.bat /home /openfolder C:\proj      REM Phase A+B+C 全部入り (NHSPC_HOME 自動設定)
uninstall.bat                              REM アンインストール
```

### VS Code 拡張

```cmd
cd nhspc\vscode-nhsp
install.bat
```

### `hspcv4` (OpenCV プラグイン)

```cmd
cd plugins\win32\hspcv4\build
build_all.bat                              REM OpenCV 4.12 を vcpkg 経由で取得しつつ x86/x64 両方ビルド
```

詳細は [`plugins/win32/hspcv4/docs/hspcv4_build.html`](plugins/win32/hspcv4/docs/hspcv4_build.html)。

---

## ブランチ

メイン開発ブランチは [`update-hsp3net`](https://github.com/inovia/IronHSP/tree/update-hsp3net)。`master` へのマージは未実施 (随時統合予定)。

---

## ライセンス

OpenHSP 3.8beta1 (BSD ライセンス) をベースとしているため、追加分も基本的に BSD ライセンスとして扱います。詳細は [`License.txt`](License.txt) / [`License_j.txt`](License_j.txt) を参照。

サードパーティライブラリ (OpenCV / Tesseract / Newtonsoft.Json / DxLib 等) はそれぞれの配布元のライセンスに従います。

---

## リンク

- 公式リポジトリ: https://github.com/inovia/IronHSP
- nhspc 言語リファレンス: [`nhspc/docs/nhsp_reference.html`](nhspc/docs/nhsp_reference.html)
- nhspc 入門: [`nhspc/docs/nhsp_beginners.html`](nhspc/docs/nhsp_beginners.html)
- HSP 本家: https://hsp.tv/
- OpenHSP: http://dev.onionsoft.net/
