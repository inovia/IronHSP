# IronHSP サンプル/.as 自動テスト監査レポート

生成日時: 2026-04-18T19:59:09

## Phase A — .as ファイル (compile-only)

総数: **159** 件

### 上位エラー原因 (グループ集計)

| 件数 | 代表メッセージ |
|---:|---|
| 2 | `error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c)` |

| 状態 | 件数 | 説明 |
|---|---:|---|
| `CERR` | 2 | コンパイルエラー|
| `CMP` | 157 | -|

### CERR 詳細 (2 件)

<details><summary>クリックして展開</summary>

| ファイル | 原因 |
|---|---|
| `comctl32_gen2.as` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `user32_gen2.as` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |

</details>

## Phase B — サンプル .hsp (compile + short-timeout run)

総数: **572** 件

### 上位エラー原因 (グループ集計)

| 件数 | 代表メッセージ |
|---:|---|
| 289 | `error code=21 line=N file=... "サポートされない機能を選択しました"` |
| 63 | `error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c)` |
| 59 | `error code=38 line=N file=... "外部DLLの呼び出しに失敗しました"` |
| 11 | `error code=-1073741819 "non-zero exit without events"` |
| 9 | `error code=2 line=N file=... "文法が間違っています"` |
| 7 | `error code=12 line=N file=... "ファイルが見つからないか無効な名前です"` |
| 6 | `error code=5 line=N file=... "パラメータの省略はできません"` |
| 6 | `error code=23 line=N file=... "変数名が指定されていません"` |
| 4 | `error code=41 line=N file=... "関数を命令として記述しています。"` |
| 3 | `error code=32 line=N file=... "関数のパラメーター記述が不正です"` |
| 3 | `error code=1 line=N file=... "システムエラーが発生しました"` |
| 3 | `#Error:invalid func param in line=N [...]` |
| 2 | `error code=31 line=N file=... "異なる型を持つ配列変数に代入しました"` |
| 1 | `error code=30 line=N file=... "無効な名前がパラメーターに指定されています"` |
| 1 | `error code=3 line=N file=... "パラメータの値が異常です"` |

| 状態 | 件数 | 説明 |
|---|---:|---|
| `CERR` | 75 | コンパイルエラー|
| `ERR` | 404 | -|
| `PASS` | 81 | 正常終了 (exit=0)|
| `TIMO` | 12 | タイムアウト (GUI/waitループ等)|

### CERR 詳細 (75 件)

<details><summary>クリックして展開</summary>

| ファイル | 原因 |
|---|---|
| `package\win32\sample\basic\sample_ai_tts.hsp` | #Error:��`�ς݂̎��ʎq�͎g�p�ł��܂��� [iron_ai_tts] in line 104 [iron_ai_tts.hsp] |
| `package\win32\sample\basic\sample_bigdec.hsp` | sample_bigdec.hsp(74) : error 26 : �p�����[�^�[�������͎g�p����Ă��܂� (74�s��) |
| `package\win32\sample\basic\sample_bigint.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\basic\sample_exif.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\basic\sample_game.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\basic\sample_ime.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\basic\sample_oauth.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\basic\sample_tcp.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\basic\sample_vcam.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\basic\sample_websocket.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\comobj\comtest5.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\d3module\xsample_Astro.hsp` | xsample_Astro.hsp(341) : error 4 : �p�����[�^�[���̋L�q�������ł� (341�s��) |
| `package\win32\sample\hgimg3\addline.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\cnvaxis.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\emit_sample1.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\emit_sample2.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\emit_sample3.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\eprim.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\fullscr.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\hgview.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\meshmap.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\meshmap2.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\meshmap3.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\meshmap4.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\meshmap5.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\meshmap6.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\meshmap7.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\obaqhg1.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\obaqhg2.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\obaqhg3.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\objshadow.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\objsort.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\settex.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\skybox.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\sndedit.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\tamane1.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\tamane2.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\tamane3.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\tamane4.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\test1.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\test10.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\test11.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\test12.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\test13.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\test2.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\test3.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\test4.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\test5.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\test6.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\test7.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\test8.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\test9.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hgimg3\wave.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hspcl\cgi\cookie_get.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hspext\ftime.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\hspprint\test2.hsp` | test2.hsp(28) : error 4 : �p�����[�^�[���̋L�q�������ł� (28�s��) |
| `package\win32\sample\hsptvapp\hsptv_dishtest.hsp` | hsptv_dishtest.hsp(31) : error 7 : ���x�����͂��łɎg���Ă��܂� (31�s��) |
| `package\win32\sample\iron\sample_ble.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\iron\sample_designer.hsp` | #Error:invalid func param in line 39 [iron_webview2.hsp] |
| `package\win32\sample\iron\sample_duckdb.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\iron\sample_mcp_client.hsp` | iron_mcp_client.hsp(474) : error 26 : �p�����[�^�[�������͎g�p����Ă��܂� (474�s��) |
| `package\win32\sample\iron\sample_mcp_server.hsp` | iron_mcp_server.hsp(337) : error 26 : �p�����[�^�[�������͎g�p����Ă��܂� (337�s��) |
| `package\win32\sample\iron\sample_office.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\iron\sample_ribbon.hsp` | #Error:invalid func param in line 39 [iron_webview2.hsp] |
| `package\win32\sample\iron\sample_ruffle.hsp` | #Error:invalid func param in line 39 [iron_webview2.hsp] |
| `package\win32\sample\iron\sample_webview2.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\iron\sample_webview2_bridge.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\iron\sample_wgcapture.hsp` | #Error:��`�ς݂̎��ʎq�͎g�p�ł��܂��� [global] in line 32 [iron_wgcapture.hsp] |
| `package\win32\sample\iron\sample_xlsx.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\misc\nkfcnv.hsp` | #Error:��`�ς݂̎��ʎq�͎g�p�ł��܂��� [getnkfversion] in line 74 [hspinet.as] |
| `package\win32\sample\new34\split.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\new34\strtrim.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\win32_gen2\clipboard_history.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\win32_gen2\file_watch.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |
| `package\win32\sample\win32_gen2\reg_edit.hsp` | error code=0 "compile failed: #HSP script preprocessor ver3.8beta1 / onion software 1997-2025(c) |

</details>

### ERR 詳細 (404 件)

<details><summary>クリックして展開</summary>

| ファイル | 原因 |
|---|---|
| `package\win32\sample\arduino\arduino_test1.hsp` | error code=38 line=52 file=arduino.as "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\arduino\arduino_test2.hsp` | error code=38 line=52 file=arduino.as "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\arduino\arduino_test3.hsp` | error code=38 line=52 file=arduino.as "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\arduino\arduino_test4.hsp` | error code=38 line=52 file=arduino.as "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\arduino\arduino_test5.hsp` | error code=38 line=52 file=arduino.as "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\Artlet2D\sample_01_basic.hsp` | error code=-1073741819 "non-zero exit without events" |
| `package\win32\sample\Artlet2D\sample_02_Rect_Ellip.hsp` | error code=-1073741819 "non-zero exit without events" |
| `package\win32\sample\Artlet2D\sample_03_Color_Brush.hsp` | error code=-1073741819 "non-zero exit without events" |
| `package\win32\sample\Artlet2D\sample_04_Penstyle.hsp` | error code=-1073741819 "non-zero exit without events" |
| `package\win32\sample\Artlet2D\sample_05_DrawText.hsp` | error code=-1073741819 "non-zero exit without events" |
| `package\win32\sample\Artlet2D\sample_06_TransMode.hsp` | error code=-1073741819 "non-zero exit without events" |
| `package\win32\sample\Artlet2D\sample_07_Curve.hsp` | error code=-1073741819 "non-zero exit without events" |
| `package\win32\sample\Artlet2D\sample_08_Copy.hsp` | error code=-1073741819 "non-zero exit without events" |
| `package\win32\sample\Artlet2D\sample_09_imagetest.hsp` | error code=21 line=18 file=J:\HNWorks\IronHSP_2026\package\win32\sample\Artlet2D\sample_09_imagetest.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\Artlet2D\xsample_alphapaint.hsp` | error code=21 line=40 file=J:\HNWorks\IronHSP_2026\package\win32\sample\Artlet2D\xsample_alphapaint.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\Artlet2D\xsample_alphastg.hsp` | error code=-1073741819 "non-zero exit without events" |
| `package\win32\sample\basic\arraynote.hsp` | error code=21 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\arraynote.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\atan_grect.hsp` | error code=21 line=1 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\atan_grect.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\calcsheet.hsp` | error code=21 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\calcsheet.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\cdplay.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\cdplay.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\chkbox.hsp` | error code=21 line=2 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\chkbox.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\clock.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\clock.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\clock2.hsp` | error code=21 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\clock2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\dirinfo.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\dirinfo.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\dirlist.hsp` | error code=21 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\dirlist.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\editor.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\editor.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\emes.hsp` | error code=21 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\emes.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\filedialog.hsp` | error code=21 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\filedialog.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\fonts.hsp` | error code=21 line=1 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\fonts.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\getpath.hsp` | error code=21 line=1 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\getpath.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\gradf.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\gradf.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\grect.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\grect.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\groll.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\groll.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\grotate.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\grotate.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\groupbox.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\groupbox.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\gsel.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\gsel.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\gsquare.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\gsquare.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\gstyle.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\gstyle.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\hsv.hsp` | error code=21 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\hsv.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\htcopy1.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\htcopy1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\htcopy2.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\htcopy2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\line.hsp` | error code=21 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\line.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\memfile.hsp` | error code=12 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\memfile.hsp "ファイルが見つからないか無効な名前です" |
| `package\win32\sample\basic\memnote.hsp` | error code=12 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\memnote.hsp "ファイルが見つからないか無効な名前です" |
| `package\win32\sample\basic\menusample.hsp` | error code=32 line=59 file=J:/HNWorks/IronHSP_2026/package/win32/common/mod_menu.as "関数のパラメーター記述が不正です" |
| `package\win32\sample\basic\mesinfo.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\mesinfo.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\mouse.hsp` | error code=21 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\mouse.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\mouse2.hsp` | error code=21 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\mouse2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\note1.hsp` | error code=12 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\note1.hsp "ファイルが見つからないか無効な名前です" |
| `package\win32\sample\basic\note2.hsp` | error code=21 line=11 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\note2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\noteadd.hsp` | error code=21 line=1 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\noteadd.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\objimage.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\objimage.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\objmode.hsp` | error code=21 line=2 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\objmode.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\omedetai.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\omedetai.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\onexit.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\onexit.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\onkey.hsp` | error code=21 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\onkey.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\picfont.hsp` | error code=21 line=12 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\picfont.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\picload.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\picload.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\sample_audioloop.hsp` | error code=38 line=2 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\sample_audioloop.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\basic\sample_capture.hsp` | error code=38 line=2 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\sample_capture.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\basic\sample_chart.hsp` | error code=5 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\sample_chart.hsp "パラメータの省略はできません" |
| `package\win32\sample\basic\sample_crypto.hsp` | error code=38 line=88 file=iron_crypto.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\basic\sample_darkmode.hsp` | error code=2 line=31 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_darkmode.hsp "文法が間違っています" |
| `package\win32\sample\basic\sample_dns.hsp` | error code=5 line=53 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_dns.hsp "パラメータの省略はできません" |
| `package\win32\sample\basic\sample_dpi.hsp` | error code=2 line=43 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_dpi.hsp "文法が間違っています" |
| `package\win32\sample\basic\sample_forms.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\sample_forms.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\sample_fwatch.hsp` | error code=2 line=68 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_fwatch.hsp "文法が間違っています" |
| `package\win32\sample\basic\sample_html.hsp` | error code=38 line=49 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_html.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\basic\sample_http_net.hsp` | error code=5 line=132 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_http_net.hsp "パラメータの省略はできません" |
| `package\win32\sample\basic\sample_image_net.hsp` | error code=5 line=253 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_image_net.hsp "パラメータの省略はできません" |
| `package\win32\sample\basic\sample_markdown.hsp` | error code=23 line=10 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_markdown.hsp "変数名が指定されていません" |
| `package\win32\sample\basic\sample_mathex_hspvar.hsp` | error code=30 line=12 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\sample_mathex_hspvar.hsp "無効な名前がパラメーターに指定されています" |
| `package\win32\sample\basic\sample_netinfo.hsp` | error code=3 line=70 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_netinfo.hsp "パラメータの値が異常です" |
| `package\win32\sample\basic\sample_pcre2.hsp` | error code=38 line=43 file=iron_pcre2.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\basic\sample_ping.hsp` | error code=5 line=49 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_ping.hsp "パラメータの省略はできません" |
| `package\win32\sample\basic\sample_process.hsp` | error code=2 line=26 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_process.hsp "文法が間違っています" |
| `package\win32\sample\basic\sample_regex.hsp` | error code=38 line=39 file=iron_regex.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\basic\sample_registry.hsp` | error code=-1073741819 "non-zero exit without events" |
| `package\win32\sample\basic\sample_report.hsp` | error code=5 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\sample_report.hsp "パラメータの省略はできません" |
| `package\win32\sample\basic\sample_simd.hsp` | error code=38 line=29 file=iron_simd.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\basic\sample_strbuf.hsp` | error code=23 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\sample_strbuf.hsp "変数名が指定されていません" |
| `package\win32\sample\basic\sample_taskdialog.hsp` | error code=31 line=183 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_taskdialog.hsp "異なる型を持つ配列変数に代入しました" |
| `package\win32\sample\basic\sample_validate.hsp` | error code=23 line=36 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_validate.hsp "変数名が指定されていません" |
| `package\win32\sample\basic\sample_variadic.hsp` | error code=2 line=15 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\sample_variadic.hsp "文法が間違っています" |
| `package\win32\sample\basic\sample_wasapi.hsp` | error code=21 line=10 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\sample_wasapi.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\sample_yaml.hsp` | error code=23 line=17 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_yaml.hsp "変数名が指定されていません" |
| `package\win32\sample\basic\star.hsp` | error code=21 line=2 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\star.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\starmove.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\starmove.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\stars.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\stars.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\stick.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\stick.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\str.hsp` | error code=21 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\str.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\basic\switch.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\basic\switch.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\cbcom\sample_01_urldownload.hsp` | error code=32 line=67 file=J:\HNWorks\IronHSP_2026\package\win32\sample\cbcom\sample_01_urldownload.hsp "関数のパラメーター記述が不正です" |
| `package\win32\sample\cbcom\sample_02_droptarget.hsp` | error code=21 line=64 file=J:\HNWorks\IronHSP_2026\package\win32\sample\cbcom\sample_02_droptarget.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\comobj\comtest10.hsp` | error code=21 line=1 file=J:\HNWorks\IronHSP_2026\package\win32\sample\comobj\comtest10.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\comobj\comtest3.hsp` | error code=21 line=11 file=J:\HNWorks\IronHSP_2026\package\win32\sample\comobj\comtest3.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\comobj\comtest7.hsp` | error code=21 line=20 file=J:\HNWorks\IronHSP_2026\package\win32\sample\comobj\comtest7.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\comobj\htmlput.hsp` | error code=1 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\comobj\htmlput.hsp "システムエラーが発生しました" |
| `package\win32\sample\comobj\imgload.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\comobj\imgload.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\comobj\itunes_mon.hsp` | error code=21 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\comobj\itunes_mon.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\comobj\mplayer.hsp` | error code=1 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\comobj\mplayer.hsp "システムエラーが発生しました" |
| `package\win32\sample\comobj\swfload.hsp` | error code=21 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\comobj\swfload.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\comobj\web.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\comobj\web.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\demo\d3m_techdemo.hsp` | error code=21 line=33 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\demo\d3m_techdemo.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_01_start.hsp` | error code=21 line=90 file=J:/HNWorks/IronHSP_2026/package/win32/common/d3m.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_02_basic.hsp` | error code=21 line=25 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\sample_02_basic.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_03_basic.hsp` | error code=21 line=23 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\sample_03_basic.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_04_d3lineto.hsp` | error code=21 line=34 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\sample_04_d3lineto.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_05_particle_basic.hsp` | error code=21 line=340 file=J:/HNWorks/IronHSP_2026/package/win32/common/d3m.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_06_snow_night.hsp` | error code=21 line=340 file=J:/HNWorks/IronHSP_2026/package/win32/common/d3m.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_07_snow_white.hsp` | error code=21 line=340 file=J:/HNWorks/IronHSP_2026/package/win32/common/d3m.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_08_ball.hsp` | error code=21 line=340 file=J:/HNWorks/IronHSP_2026/package/win32/common/d3m.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_09_toge.hsp` | error code=21 line=20 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\sample_09_toge.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_10_d3square.hsp` | error code=21 line=21 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\sample_10_d3square.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_11_d3texture.hsp` | error code=21 line=18 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\sample_11_d3texture.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_12_anitexture.hsp` | error code=21 line=22 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\sample_12_anitexture.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_13_d3texture_div.hsp` | error code=21 line=21 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\sample_13_d3texture_div.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_14_d3ribbonto.hsp` | error code=21 line=30 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\sample_14_d3ribbonto.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_15_d3wincx.hsp` | error code=21 line=21 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\sample_15_d3wincx.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_16_d3setlocal.hsp` | error code=21 line=24 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\sample_16_d3setlocal.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_17_d3setlocal_shadow.hsp` | error code=21 line=18 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\sample_17_d3setlocal_shadow.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_18_poly_particle.hsp` | error code=21 line=340 file=J:/HNWorks/IronHSP_2026/package/win32/common/d3m.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\sample_19_getmouse.hsp` | error code=21 line=19 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\sample_19_getmouse.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\xsample_amano.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\xsample_amano.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\xsample_diamond.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\xsample_diamond.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\xsample_gcube.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\xsample_gcube.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\xsample_gimbal.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\xsample_gimbal.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\xsample_Rocket.hsp` | error code=21 line=44 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\xsample_Rocket.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\xsample_shiraho.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\xsample_shiraho.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\d3module\xsample_verge.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\d3module\xsample_verge.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\demo\demo.hsp` | error code=21 line=248 file=J:\HNWorks\IronHSP_2026\package\win32\sample\demo\demo.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\battle.hsp` | error code=21 line=23 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\battle.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\block1.hsp` | error code=21 line=13 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\block1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\block2.hsp` | error code=21 line=20 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\block2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\block3.hsp` | error code=21 line=29 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\block3.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\celput.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\celput.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\doukutu.hsp` | error code=21 line=10 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\doukutu.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\facemove1.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\facemove1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\facemove2.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\facemove2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\keymove1.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\keymove1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\keymove2.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\keymove2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\keymove3.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\keymove3.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\keymove4.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\keymove4.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\kick.hsp` | error code=21 line=24 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\kick.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\map1.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\map1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\map2.hsp` | error code=21 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\map2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\mapedit.hsp` | error code=21 line=40 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\mapedit.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\mapmove1.hsp` | error code=21 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\mapmove1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\mapmove2.hsp` | error code=21 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\mapmove2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\poker.hsp` | error code=21 line=1 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\poker.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\tamane_jump.hsp` | error code=21 line=34 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\tamane_jump.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\tile.hsp` | error code=21 line=2 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\tile.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\typing.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\typing.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\game\yopparai.hsp` | error code=21 line=36 file=J:\HNWorks\IronHSP_2026\package\win32\sample\game\yopparai.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg3\ogg_sndtest.hsp` | error code=38 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg3\ogg_sndtest.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hgimg3\volsamp.hsp` | error code=21 line=25 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg3\volsamp.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\block3.hsp` | error code=21 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\block3.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\buffer.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\buffer.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\cnvaxis.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\cnvaxis.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\customshader.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\customshader.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\feedback.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\feedback.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\freemesh.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\freemesh.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\light_test1.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\light_test1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\light_test2.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\light_test2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\light_test3.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\light_test3.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\light_test4.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\light_test4.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\light_test5eff.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\light_test5eff.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\objfade.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\objfade.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\particle.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\particle.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\physics_1.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\physics_1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\physics_2.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\physics_2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\posteffect.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\posteffect.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\tamane1.hsp` | error code=21 line=10 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\tamane1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\tamane2.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\tamane2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\tamane3.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\tamane3.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\tamane_tree.hsp` | error code=21 line=10 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\tamane_tree.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\test1.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\test1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\test10.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\test10.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\test11.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\test11.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\test12.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\test12.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\test13.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\test13.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\test2.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\test2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\test3.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\test3.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\test4.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\test4.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\test5.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\test5.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\test6.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\test6.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\test7.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\test7.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\test8.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\test8.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hgimg4\test9.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hgimg4\test9.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\HIDaspx\hidmon_test1.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\HIDaspx\hidmon_test1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\HIDaspx\hidmon_test2.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\HIDaspx\hidmon_test2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\block3.hsp` | error code=21 line=10 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\block3.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\block3_ad.hsp` | error code=21 line=10 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\block3_ad.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\button_test.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\button_test.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\celputm.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\celputm.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\dish_sortval.hsp` | error code=21 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\dish_sortval.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\ease_test1.hsp` | error code=21 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\ease_test1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\ease_test2.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\ease_test2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\gradf.hsp` | error code=21 line=19 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\gradf.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\grotate.hsp` | error code=21 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\grotate.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\gsquare.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\gsquare.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\hsplogo.hsp` | error code=21 line=98 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\hsplogo.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\http_test1.hsp` | error code=21 line=12 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\http_test1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\http_test2.hsp` | error code=21 line=14 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\http_test2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\mtouch.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\mtouch.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\obaqtest.hsp` | error code=21 line=11 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\obaqtest.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\tamacard_dish.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\tamacard_dish.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\tamadot_dish.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\tamadot_dish.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\tamane_s2_dish.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\tamane_s2_dish.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\tamane_s_dish.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\tamane_s_dish.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\test1.hsp` | error code=21 line=26 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\test1.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\viewcalc.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\viewcalc.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3dish\xsample_gcube.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3dish\xsample_gcube.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3imp\hsp3imp_test.hsp` | error code=21 line=13 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3imp\hsp3imp_test.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3utf\utftest1.hsp` | error code=12 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3utf\utftest1.hsp "ファイルが見つからないか無効な名前です" |
| `package\win32\sample\hsp3utf\utftest2.hsp` | error code=12 line=10 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3utf\utftest2.hsp "ファイルが見つからないか無効な名前です" |
| `package\win32\sample\hsp3utf\utftest3.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3utf\utftest3.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsp3utf\utftest4.hsp` | error code=21 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsp3utf\utftest4.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspcl\cgi\cnt.hsp` | error code=12 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspcl\cgi\cnt.hsp "ファイルが見つからないか無効な名前です" |
| `package\win32\sample\hspcl\cgi\getenv.hsp` | error code=41 line=51 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspcl\cgi\getenv.hsp "関数を命令として記述しています。" |
| `package\win32\sample\hspcl\cgi\hensu.hsp` | error code=41 line=21 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspcl\cgi\hensu.hsp "関数を命令として記述しています。" |
| `package\win32\sample\hspcl\cl_getenv.hsp` | error code=41 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspcl\cl_getenv.hsp "関数を命令として記述しています。" |
| `package\win32\sample\hspcv\cvmatch.hsp` | error code=38 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspcv\cvmatch.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspcv\loadsave.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspcv\loadsave.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspcv\makeavi.hsp` | error code=38 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspcv\makeavi.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspcv\putimg.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspcv\putimg.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspd2d\sample_gif_anim.hsp` | error code=1 "non-zero exit without events" |
| `package\win32\sample\hspda\csvstr.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspda\csvstr.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspda\rndf.hsp` | error code=38 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspda\rndf.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspda\sortrndf.hsp` | error code=21 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspda\sortrndf.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspda\vtest1.hsp` | error code=38 line=10 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspda\vtest1.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspda\vtest2.hsp` | error code=21 line=37 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspda\vtest2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspda\xnoteadd.hsp` | error code=38 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspda\xnoteadd.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspdb\test1.hsp` | error code=38 line=12 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspdb\test1.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspdb\test2.hsp` | error code=38 line=13 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspdb\test2.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspdb\test3.hsp` | error code=38 line=14 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspdb\test3.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspext\aplkey.hsp` | error code=21 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\aplkey.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspext\aplkey3.hsp` | error code=21 line=20 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\aplkey3.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspext\aplnote.hsp` | error code=21 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\aplnote.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspext\clipset.hsp` | error code=38 line=10 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\clipset.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspext\dircsv.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\dircsv.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspext\emath.hsp` | error code=38 line=12 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\emath.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspext\emath2.hsp` | error code=38 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\emath2.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspext\folder.hsp` | error code=21 line=11 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\folder.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspext\fxdir.hsp` | error code=38 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\fxdir.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspext\fxinfo.hsp` | error code=38 line=16 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\fxinfo.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspext\fxlink.hsp` | error code=38 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\fxlink.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspext\fxshort.hsp` | error code=38 line=13 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\fxshort.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspext\pipe.hsp` | error code=21 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\pipe.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspext\regtest.hsp` | error code=38 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\regtest.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspext\regtest2.hsp` | error code=38 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\regtest2.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspext\terminal.hsp` | error code=21 line=15 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspext\terminal.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspinet\base64test.hsp` | error code=38 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\base64test.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspinet\get_binary.hsp` | error code=38 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\get_binary.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspinet\https_download.hsp` | error code=38 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\https_download.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspinet\nkfcnv.hsp` | error code=12 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\nkfcnv.hsp "ファイルが見つからないか無効な名前です" |
| `package\win32\sample\hspinet\sendmail.hsp` | error code=21 line=84 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\sendmail.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspinet\test1.hsp` | error code=38 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\test1.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspinet\test10.hsp` | error code=38 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\test10.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspinet\test2.hsp` | error code=38 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\test2.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspinet\test3.hsp` | error code=38 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\test3.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspinet\test5.hsp` | error code=21 line=6 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\test5.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspinet\test6.hsp` | error code=38 line=9 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\test6.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspinet\test7.hsp` | error code=38 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\test7.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspinet\test8.hsp` | error code=41 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\test8.hsp "関数を命令として記述しています。" |
| `package\win32\sample\hspinet\test9.hsp` | error code=38 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspinet\test9.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspprint\test1.hsp` | error code=38 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspprint\test1.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspsock\client2.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspsock\client2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspsock\daytime.hsp` | error code=21 line=10 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspsock\daytime.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspsock\getip.hsp` | error code=38 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspsock\getip.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspsock\http.hsp` | error code=21 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspsock\http.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspsock\server2.hsp` | error code=21 line=4 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspsock\server2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspsw\test1.hsp` | error code=38 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspsw\test1.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspsw\test2.hsp` | error code=38 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspsw\test2.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspsw\test3.hsp` | error code=38 line=8 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspsw\test3.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hspsw\test4.hsp` | error code=38 line=7 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspsw\test4.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\hsptv\hsptv_test.hsp` | error code=18 line=21 file=J:/HNWorks/IronHSP_2026/package/win32/common/hsptv.as "代入できない変数名を指定しています" |
| `package\win32\sample\hsptv\hsptv_test2.hsp` | error code=21 line=31 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsptv\hsptv_test2.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsptv\hsptv_test3.hsp` | error code=21 line=31 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsptv\hsptv_test3.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsptv\hsptvapp_test.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsptv\hsptvapp_test.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hsptvapp\hsptv_test.hsp` | error code=21 line=3 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hsptvapp\hsptv_test.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\hspusbio\usbiotest.hsp` | error code=21 line=5 file=J:\HNWorks\IronHSP_2026\package\win32\sample\hspusbio\usbiotest.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\iron\sample_7z.hsp` | error code=21 line=10 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_7z.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\iron\sample_ai.hsp` | error code=21 line=19 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_ai.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\iron\sample_cam_ai.hsp` | error code=21 line=25 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_cam_ai.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\iron\sample_camera_mf.hsp` | error code=21 line=22 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_camera_mf.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\iron\sample_camera_mf_dual.hsp` | error code=21 line=18 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_camera_mf_dual.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\iron\sample_camera_preview.hsp` | error code=21 line=23 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_camera_preview.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\iron\sample_clip.hsp` | error code=2 line=12 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_clip.hsp "文法が間違っています" |
| `package\win32\sample\iron\sample_csv.hsp` | error code=21 line=11 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_csv.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\iron\sample_hash.hsp` | error code=23 line=227 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_hash.hsp "変数名が指定されていません" |
| `package\win32\sample\iron\sample_http_get.hsp` | error code=23 line=21 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_http_get.hsp "変数名が指定されていません" |
| `package\win32\sample\iron\sample_ini_config.hsp` | error code=2 line=121 file=J:/HNWorks/IronHSP_2026/package/win32/common/iron_ini.hsp "文法が間違っています" |
| `package\win32\sample\iron\sample_json.hsp` | error code=38 line=49 file=iron_json.hsp "外部DLLの呼び出しに失敗しました" |
| `package\win32\sample\iron\sample_llama.hsp` | error code=21 line=16 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_llama.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\iron\sample_mediapipe_hand.hsp` | error code=21 line=18 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_mediapipe_hand.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\iron\sample_mic_record.hsp` | error code=21 line=19 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_mic_record.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\iron\sample_midi.hsp` | error code=21 line=15 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_midi.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\iron\sample_onnx.hsp` | error code=21 line=21 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_onnx.hsp "サポートされない機能を選択しました" |
| `package\win32\sample\iron\sample_pdf.hsp` | error code=21 line=19 file=J:\HNWorks\IronHSP_2026\package\win32\sample\iron\sample_pdf.hsp "サポートされない機能を選択しました" |
| ... | (104 件省略) |

</details>
