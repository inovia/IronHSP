; ============================================================
;   wintrust.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
wintrust.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の wintrust.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
CryptSIPCreateIndirectData
指定された SIP_SUBJECTINFO 構造体のハッシュ、ダイジェストアルゴリズム、およびエンコーディング属性を含む SIP_INDIRECT_DATA 構造体を返す。このハッシュはデータへの間接参照として使用できる。
%prm
pSubjectInfo, pcbIndirectData, pIndirectData
pSubjectInfo : [var] 間接データ参照が指し示す対象（サブジェクト）を含む [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) 構造体へのポインタ。
pcbIndirectData : [var] [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data) 構造体へのポインタ。
pIndirectData : [var] カタログ項目を受け取る [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data) 構造体へのポインタ。
%inst
指定された SIP_SUBJECTINFO 構造体のハッシュ、ダイジェストアルゴリズム、およびエンコーディング属性を含む
SIP_INDIRECT_DATA 構造体を返す。このハッシュはデータへの間接参照として使用できる。

[戻り値]
関数が成功した場合は TRUE、そうでない場合は FALSE が返される。
この関数が FALSE を返した場合、GetLastError 関数を呼び出すことで追加のエラー情報を取得できる。GetLastError
は次のいずれかのエラーコードを返す。
（以下省略）

[備考]
pcbIndirectData が DWORD を指し、pIndirectData が NULL を指している場合、データのサイズが
pcbIndirectData に返される。


%index
CryptSIPGetCaps
サブジェクトインターフェイスパッケージ (SIP) の機能を取得する。
%prm
pSubjInfo, pCaps
pSubjInfo : [var] SIP API に対して対象情報データを指定する [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) 構造体へのポインタ。
pCaps : [var] SIP の機能を定義する SIP_CAP_SET 構造体へのポインタ。
%inst
サブジェクトインターフェイスパッケージ (SIP) の機能を取得する。

[備考]
他の SIP
関数と異なり、[SIP_DISPATCH_INFO](/windows/desktop/api/mssip/ns-mssip-sip_dispatch_info)
構造体とは異なる。代わりに、呼び出し元はオブジェクト識別子 (OID) を関数のエントリポイントにマップする必要がある。


%index
CryptSIPGetSealedDigest
(no summary)
%prm
pSubjectInfo, pSig, dwSig, pbDigest, pcbDigest
pSubjectInfo : [var] 
pSig : [var] 
dwSig : [int] 
pbDigest : [var] 
pcbDigest : [var] 
%inst



%index
CryptSIPGetSignedDataMsg
ファイルから Authenticode 署名を取得する。
%prm
pSubjectInfo, pdwEncodingType, dwIndex, pcbSignedDataMsg, pbSignedDataMsg
pSubjectInfo : [var] メッセージのサブジェクトに関する情報を含む [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) 構造体へのポインタ。
pdwEncodingType : [var] Authenticode 署名のエンコーディング種別。
dwIndex : [int] このパラメータは予約されており、0 に設定する必要がある。
pcbSignedDataMsg : [var] pbSignedDataMsg パラメータが指すバッファの長さ（バイト単位）。
pbSignedDataMsg : [var] 返される Authenticode 署名を受け取るバッファへのポインタ。必要なバッファサイズを求めるには、pbSignedDataMsg を NULL に設定して CryptSIPGetSignedDataMsg 関数を呼び出す。この関数は必要なバッファサイズ（バイト単位）を pcbSignedDataMsg が指す値に格納する。詳細は「長さが不明なデータの取得」を参照。
%inst
ファイルから Authenticode 署名を取得する。

[戻り値]
関数が成功した場合は TRUE を返す。関数が失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。返される可能性のあるエラーコードの一部を以下に示す。
（以下省略）

[備考]
サブジェクトには、ポータブル実行イメージ (.exe)、キャビネット (.cab)
イメージ、フラットファイル、カタログファイルなどが含まれるが、これらに限定されない。サブジェクト種別ごとに、ハッシュ計算に使用するデータのサブセットが異なり、格納や取得の手順も異なる。そのため、サブジェクト種別ごとに固有の
SIP 仕様が存在する。


%index
CryptSIPPutSignedDataMsg
対象ファイルに Authenticode 署名を格納する。
%prm
pSubjectInfo, dwEncodingType, pdwIndex, cbSignedDataMsg, pbSignedDataMsg
pSubjectInfo : [var] メッセージのサブジェクトに関する情報を含む [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) 構造体へのポインタ。
dwEncodingType : [int] 
pdwIndex : [var] メッセージインデックスへのポインタ。
cbSignedDataMsg : [int] pbSignedDataMsg パラメータが指すバッファの長さ（バイト単位）。
pbSignedDataMsg : [var] メッセージを格納したバッファへのポインタ。
%inst
対象ファイルに Authenticode 署名を格納する。

[戻り値]
関数が成功した場合は TRUE を返す。関数が失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。返される可能性のあるエラーコードの一部を以下に示す。
（以下省略）

[備考]
サブジェクト種別ごとに、ハッシュ計算に使用するデータのサブセットが異なり、格納や取得の手順も異なる。そのため、サブジェクト種別ごとに固有の
SIP 仕様が存在する。


%index
CryptSIPRemoveSignedDataMsg
指定された Authenticode 署名を削除する。
%prm
pSubjectInfo, dwIndex
pSubjectInfo : [var] メッセージのサブジェクトに関する情報を含む [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) 構造体へのポインタ。
dwIndex : [int] このパラメータは予約されており、0 に設定する必要がある。
%inst
指定された Authenticode 署名を削除する。

[戻り値]
関数が成功した場合は TRUE を返す。関数が失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
CryptSIPVerifyIndirectData
間接ハッシュ化データを指定されたサブジェクトに対して検証する。
%prm
pSubjectInfo, pIndirectData
pSubjectInfo : [var] メッセージのサブジェクトに関する情報を含む [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) 構造体へのポインタ。
pIndirectData : [var] ハッシュ化されたサブジェクト情報に関する情報を含む [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data) 構造体へのポインタ。
%inst
間接ハッシュ化データを指定されたサブジェクトに対して検証する。

[戻り値]
関数が成功した場合は TRUE、そうでない場合は FALSE が返される。
この関数が FALSE を返した場合、GetLastError 関数を呼び出すことで追加のエラー情報を取得できる。GetLastError
は次のいずれかのエラーコードを返す。
（以下省略）

[備考]
サブジェクトには、ポータブル実行イメージ (.exe)、キャビネット (.cab)
イメージ、フラットファイル、カタログファイルなどが含まれるが、これらに限定されない。サブジェクト種別ごとに、ハッシュ計算に使用するデータのサブセットが異なり、格納や取得の手順も異なる。そのため、サブジェクト種別ごとに固有のサブジェクトインターフェイスパッケージ仕様が存在する。

