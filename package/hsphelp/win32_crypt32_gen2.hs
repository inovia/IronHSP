; ============================================================
;   crypt32.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%type
拡張命令
%ver
1.0
%dll
crypt32.dll
%date
2026/04/16
%author
IronHSP / CsWin32 bridge
%url
https://github.com/inovia/IronHSP
%port
Win

%note
Win32 API の crypt32.dll 関数群。CsWin32 + win32metadata から自動生成。
hsp3net 専用 (intptr / NSTRUCT / wstr を使用)。

%group
Win32API

%index
CertAddCRLContextToStore
指定した証明書ストアに証明書失効リスト (CRL) コンテキストを追加する。
%prm
hCertStore, pCrlContext, dwAddDisposition, ppStoreContext
hCertStore : [int] 証明書ストアのハンドル。
pCrlContext : [var] 追加する CRL_CONTEXT 構造体へのポインター。
dwAddDisposition : [int] 一致する CRL または一致する CRL へのリンクが既にストアに存在する場合の動作を指定する。現在定義されている配置値とその用途は次のとおり。
ppStoreContext : [var] デコードされた CRL コンテキストへのポインターへのポインター。これは省略可能なパラメーターで、NULL を指定できる。NULL の場合、呼び出し元アプリケーションは追加または既存の CRL のコピーを必要としないことを示す。コピーが作成された場合、そのコンテキストは CertFreeCRLContext で解放しなければならない。
%inst
指定した証明書ストアに証明書失効リスト (CRL) コンテキストを追加する。

[戻り値]
関数が成功した場合、戻り値は TRUE。関数が失敗した場合、戻り値は FALSE。呼び出し先の
CertAddEncodedCRLToStore および CertSetCRLContextProperty
からのエラーが本関数に伝播することがある。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）

[備考]
CRL コンテキストは CertDuplicateCRLContext
では複製されない。代わりに新しいコピーが作成され、ストアに追加される。エンコードされた CRL
のコピーに加えて、本関数はコンテキストのプロパティもコピーする。証明書ストアから CRL コンテキストを削除するには
CertDeleteCRLFromStore 関数を使用する。


%index
CertAddCRLLinkToStore
あるストア内に、別のストアにある証明書失効リスト (CRL) コンテキストへのリンクを追加する。
%prm
hCertStore, pCrlContext, dwAddDisposition, ppStoreContext
hCertStore : [int] リンクを追加する証明書ストアのハンドル。
pCrlContext : [var] リンク対象の CRL_CONTEXT 構造体へのポインター。
dwAddDisposition : [int] 一致する CRL または一致する CRL へのリンクがストアに存在する場合の動作を指定する。現在定義されている配置値とその用途は次のとおり。
ppStoreContext : [var] 作成されたリンクのコピーへのポインターへのポインター。リンクのコピーが不要な場合、ppStoreContext には NULL を指定できる。リンクのコピーが作成された場合、そのコピーは CertFreeCRLContext を使用して解放しなければならない。
%inst
あるストア内に、別のストアにある証明書失効リスト (CRL) コンテキストへのリンクを追加する。

[戻り値]
関数が成功した場合、戻り値は TRUE。関数が失敗した場合、戻り値は FALSE。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）

[備考]
リンクは元の CRL コンテキストへのアクセスを提供するため、リンクされた CRL コンテキストで拡張プロパティを設定すると、元の CRL
上のその拡張プロパティ、および同じ CRL
への他のすべてのリンクも変更される。コレクションとして開かれたストアにはリンクを追加できない。コレクションとして開かれたストアには、CertOpenSystemStore
または CertOpenStore に CERT_STORE_PROV_SYSTEM あるいは
CERT_STORE_PROV_COLLECTION を指定して開かれたすべてのストアが含まれる。詳しくは
CertAddStoreToCollection を参照。リンクを使用している場合で、CertCloseStore を
CERT_CLOSE_STORE_FORCE_FLAG
付きで呼び出すときは、元のコンテキストを含むストアを閉じる前に、リンクを使用しているストアを閉じなければならない。CERT_CLOSE_STORE_FORCE_FLAG
を使用しない場合、2 つのストアはどちらの順序でも閉じてよい。証明書ストアから CRL コンテキストリンクを削除するには
CertDeleteCRLFromStore 関数を使用する。


%index
CertAddCTLContextToStore
証明書ストアに証明書信頼リスト (CTL) コンテキストを追加する。
%prm
hCertStore, pCtlContext, dwAddDisposition, ppStoreContext
hCertStore : [int] 証明書ストアのハンドル。
pCtlContext : [var] ストアに追加する CTL_CONTEXT 構造体へのポインター。
dwAddDisposition : [int] 一致する CTL または一致する CTL へのリンクが既にストアに存在する場合の動作を指定する。現在定義されている配置値とその用途は次のとおり。
ppStoreContext : [var] デコードされた CTL コンテキストへのポインターへのポインター。この省略可能なパラメーターには NULL を指定でき、その場合、呼び出し元アプリケーションは追加または既存の CTL のコピーを必要としないことを示す。コピーが作成された場合、そのコンテキストは CertFreeCTLContext を使用して解放しなければならない。
%inst
証明書ストアに証明書信頼リスト (CTL) コンテキストを追加する。

[戻り値]
関数が成功した場合、戻り値は TRUE。関数が失敗した場合、戻り値は FALSE。呼び出し先の
CertAddEncodedCRLToStore および CertSetCRLContextProperty
からのエラーが本関数に伝播することがある。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）

[備考]
CTL コンテキストは CertDuplicateCTLContext
では複製されない。代わりに新しいコピーが作成され、ストアに追加される。エンコードされた CTL
に加えて、コンテキストのプロパティもコピーされる。証明書ストアから CTL コンテキストを削除するには
CertDeleteCTLFromStore 関数を使用する。


%index
CertAddCTLLinkToStore
CertAddCTLLinkToStore 関数は、あるストア内に、別のストアにある証明書信頼リスト (CTL) コンテキストへのリンクを追加する。CTL コンテキストの複製を作成して追加する代わりに、元の CTL コンテキストへのリンクを追加する。
%prm
hCertStore, pCtlContext, dwAddDisposition, ppStoreContext
hCertStore : [int] リンクを追加する証明書ストアのハンドル。
pCtlContext : [var] リンク対象の CTL_CONTEXT 構造体へのポインター。
dwAddDisposition : [int] 一致する CTL または一致する CTL へのリンクが既にストアに存在する場合の動作を指定する。現在定義されている配置値とその用途は次のとおり。
ppStoreContext : [var] 作成されたリンクのコピーへのポインターへのポインター。リンクのコピーが不要であれば ppStoreContext に NULL を指定できる。リンクのコピーが作成された場合、そのコピーは CertFreeCTLContext を使用して解放しなければならない。
%inst
CertAddCTLLinkToStore 関数は、あるストア内に、別のストアにある証明書信頼リスト (CTL)
コンテキストへのリンクを追加する。CTL コンテキストの複製を作成して追加する代わりに、元の CTL コンテキストへのリンクを追加する。

[戻り値]
関数が成功した場合、戻り値は TRUE。関数が失敗した場合、戻り値は FALSE。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）

[備考]
リンクは元の CTL コンテキストへのアクセスを提供するため、リンクされた CTL コンテキストで拡張プロパティを設定すると、元の CTL
上のその拡張プロパティ、および同じ CTL
への他のすべてのリンクも変更される。コレクションとして開かれたストアにはリンクを追加できない。コレクションとして開かれたストアには、CertOpenSystemStore
または CertOpenStore に CERT_STORE_PROV_SYSTEM あるいは
CERT_STORE_PROV_COLLECTION
を指定して開かれたすべてのストアが含まれる。CertAddStoreToCollection
も参照。リンクを使用している場合で、CertCloseStore を CERT_CLOSE_STORE_FORCE_FLAG
付きで呼び出すときは、元のコンテキストを含むストアを閉じる前に、リンクを使用しているストアを閉じなければならない。CERT_CLOSE_STORE_FORCE_FLAG
を使用しない場合、2 つのストアはどちらの順序でも閉じてよい。証明書ストアから CTL コンテキストリンクを削除するには
CertDeleteCTLFromStore 関数を使用する。


%index
CertAddCertificateContextToStore
証明書ストアに証明書コンテキストを追加する。
%prm
hCertStore, pCertContext, dwAddDisposition, ppStoreContext
hCertStore : [int] 証明書ストアのハンドル。
pCertContext : [var] ストアに追加する CERT_CONTEXT 構造体へのポインター。
dwAddDisposition : [int] 一致する証明書または一致する証明書へのリンクが既にストアに存在する場合の動作を指定する。現在定義されている配置値とその用途は次のとおり。
ppStoreContext : [var] ストアに追加された証明書のコピーへのポインターへのポインター。
%inst
証明書ストアに証明書コンテキストを追加する。

[戻り値]
関数が成功した場合、戻り値は TRUE。関数が失敗した場合、戻り値は FALSE。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）

[備考]
証明書コンテキストは CertDuplicateCertificateContext
では複製されない。代わりに、本関数はコンテキストの新しいコピーを作成してストアに追加する。エンコードされた証明書に加えて、CertDuplicateCertificateContext
はコンテキストのプロパティもコピーするが、CERT_KEY_PROV_HANDLE_PROP_ID および
CERT_KEY_CONTEXT_PROP_ID プロパティは例外である。証明書ストアから証明書コンテキストを削除するには
CertDeleteCertificateFromStore 関数を使用する。注:
証明書コンテキストの順序はストア内で保持されないことがある。特定の証明書にアクセスするには、ストア内の証明書を走査する必要がある。


%index
CertAddCertificateLinkToStore
証明書ストア内に、別のストアにある証明書コンテキストへのリンクを追加する。
%prm
hCertStore, pCertContext, dwAddDisposition, ppStoreContext
hCertStore : [int] リンクを追加する証明書ストアのハンドル。
pCertContext : [var] リンク対象の CERT_CONTEXT 構造体へのポインター。
dwAddDisposition : [int] 一致する証明書または一致する証明書へのリンクが既にストアに存在する場合の動作を指定する。現在定義されている配置値とその用途は次のとおり。
ppStoreContext : [var] 作成されたリンクのコピーへのポインターへのポインター。リンクのコピーが不要な場合、ppStoreContext に NULL を指定できる。リンクのコピーが作成された場合、そのコピーは CertFreeCertificateContext 関数で解放しなければならない。
%inst
証明書ストア内に、別のストアにある証明書コンテキストへのリンクを追加する。

[戻り値]
関数が成功した場合、戻り値は TRUE。関数が失敗した場合、戻り値は FALSE。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）

[備考]

リンクは元の証明書コンテキストへのアクセスを提供するため、リンクされた証明書コンテキストで拡張プロパティを設定すると、元の証明書、および同じ証明書への他のすべてのリンクにおけるその拡張プロパティも変更される。コレクションとして開かれたストアにはリンクを追加できない。コレクションとして開かれたストアには、CertOpenSystemStore
または CertOpenStore に CERT_STORE_PROV_SYSTEM あるいは
CERT_STORE_PROV_COLLECTION を指定して開かれたすべてのストアが含まれる。詳しくは
CertAddStoreToCollection を参照。リンクを使用している場合で、CertCloseStore を
CERT_CLOSE_STORE_FORCE_FLAG
付きで呼び出すときは、元のコンテキストを含むストアを閉じる前に、リンクを使用しているストアを閉じなければならない。CERT_CLOSE_STORE_FORCE_FLAG
を使用しない場合、2 つのストアはどちらの順序でも閉じてよい。証明書ストアから証明書コンテキストリンクを削除するには
CertDeleteCertificateFromStore 関数を使用する。


%index
CertAddEncodedCRLToStore
エンコードされた CRL から証明書失効リスト (CRL) コンテキストを作成し、証明書ストアに追加する。
%prm
hCertStore, dwCertEncodingType, pbCrlEncoded, cbCrlEncoded, dwAddDisposition, ppCrlContext
hCertStore : [int] 証明書ストアのハンドル。
dwCertEncodingType : [int] 使用するエンコード種別を指定する。証明書エンコード種別とメッセージエンコード種別を、次の例のようにビットごとの OR 演算で組み合わせて指定することも常に可能である: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコード種別は次のとおり。
pbCrlEncoded : [var] 証明書ストアに追加するエンコード済み CRL を含むバッファーへのポインター。
cbCrlEncoded : [int] pbCrlEncoded バッファーのサイズ（バイト単位）。
dwAddDisposition : [int] 一致する CRL または一致する CRL へのリンクが既にストアに存在する場合の動作を指定する。現在定義されている配置値とその用途は次のとおり。
ppCrlContext : [var] デコードされた CRL_CONTEXT 構造体へのポインターへのポインター。これは省略可能なパラメーターで、NULL を指定できる。NULL の場合、呼び出し元アプリケーションは新規または既存の CRL のコピーを必要としないことを示す。コピーが作成された場合、そのコンテキストは CertFreeCRLContext を使用して解放しなければならない。
%inst
エンコードされた CRL から証明書失効リスト (CRL) コンテキストを作成し、証明書ストアに追加する。

[戻り値]
関数が成功した場合、戻り値は TRUE。関数が失敗した場合、戻り値は FALSE。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）


%index
CertAddEncodedCTLToStore
エンコードされた CTL から証明書信頼リスト (CTL) コンテキストを作成し、証明書ストアに追加する。
%prm
hCertStore, dwMsgAndCertEncodingType, pbCtlEncoded, cbCtlEncoded, dwAddDisposition, ppCtlContext
hCertStore : [int] 証明書ストアのハンドル。
dwMsgAndCertEncodingType : [int] 使用するエンコード種別を指定する。証明書エンコード種別とメッセージエンコード種別の両方を、次の例のようにビットごとの OR 演算で組み合わせて指定しなければならない: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。
pbCtlEncoded : [var] 証明書ストアに追加するエンコード済み CTL を含むバッファーへのポインター。
cbCtlEncoded : [int] pbCtlEncoded バッファーのサイズ（バイト単位）。
dwAddDisposition : [int] 一致する CTL または一致する CTL へのリンクが既にストアに存在する場合の動作を指定する。現在定義されている配置値とその用途は次のとおり。
ppCtlContext : [var] デコードされた CTL_CONTEXT 構造体へのポインターへのポインター。NULL を指定でき、その場合、呼び出し元アプリケーションは追加または既存の CTL のコピーを必要としないことを示す。コピーが作成された場合は CertFreeCTLContext を使用して解放しなければならない。
%inst
エンコードされた CTL から証明書信頼リスト (CTL) コンテキストを作成し、証明書ストアに追加する。

[戻り値]
関数が成功した場合、戻り値は TRUE。関数が失敗した場合、戻り値は FALSE。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）


%index
CertAddEncodedCertificateToStore
エンコードされた証明書から証明書コンテキストを作成し、証明書ストアに追加する。
%prm
hCertStore, dwCertEncodingType, pbCertEncoded, cbCertEncoded, dwAddDisposition, ppCertContext
hCertStore : [int] 証明書ストアへのハンドル。
dwCertEncodingType : [int] 使用するエンコード種別を指定する。証明書エンコード種別とメッセージエンコード種別を、次の例のようにビットごとの OR 演算で組み合わせて指定することも常に可能である: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコード種別は次のとおり。
pbCertEncoded : [var] 証明書ストアに追加するエンコード済み証明書を含むバッファーへのポインター。
cbCertEncoded : [int] pbCertEncoded バッファーのサイズ（バイト単位）。
dwAddDisposition : [int] 一致する証明書または一致する証明書へのリンクがストアに存在する場合の動作を指定する。現在定義されている配置値とその用途は次のとおり。
ppCertContext : [var] デコードされた証明書コンテキストへのポインターへのポインター。これは省略可能なパラメーターで、NULL を指定できる。NULL の場合、呼び出し元アプリケーションは新規または既存の証明書のコピーを必要としないことを示す。コピーが作成された場合、そのコンテキストは CertFreeCertificateContext を使用して解放しなければならない。
%inst
エンコードされた証明書から証明書コンテキストを作成し、証明書ストアに追加する。

[戻り値]
関数が成功した場合、戻り値は TRUE。関数が失敗した場合、戻り値は FALSE。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）


%index
CertAddEncodedCertificateToSystemStoreW
指定したシステムストアを開き、エンコード済み証明書を追加する。(Unicode)
%prm
szCertStoreName, pbCertEncoded, cbCertEncoded
szCertStoreName : [wstr] エンコード済み証明書を格納するシステムストアの名前を含む、NULL 終端文字列。
pbCertEncoded : [var] 追加するエンコード済み証明書を含むバッファーへのポインター。
cbCertEncoded : [int] pbCertEncoded バッファーのサイズ（バイト単位）。
%inst
指定したシステムストアを開き、エンコード済み証明書を追加する。(Unicode)

[戻り値]
関数が成功した場合、戻り値は TRUE。関数が失敗した場合、戻り値は
FALSE。CertAddEncodedCertificateToSystemStore
はエラー処理を以下の備考に記載された関数に依存している。それぞれのエラー処理動作については対応する関数のトピックを参照。拡張エラー情報は
GetLastError を呼び出して取得する。

[備考]
内部的に CertAddEncodedCertificateToSystemStore は、次のパラメーターで
CertOpenSystemStore と CertAddEncodedCertificateToStore を呼び出す。
（以下省略）


%index
CertAddEnhancedKeyUsageIdentifier
CertAddEnhancedKeyUsageIdentifier 関数は、証明書の拡張キー使用法 (EKU) 拡張プロパティに、使用法識別子オブジェクト識別子 (OID) を追加する。
%prm
pCertContext, pszUsageIdentifier
pCertContext : [var] 使用法識別子を追加する対象の証明書の CERT_CONTEXT へのポインター。
pszUsageIdentifier : [str] 追加する使用法識別子 OID を指定する。
%inst
CertAddEnhancedKeyUsageIdentifier 関数は、証明書の拡張キー使用法 (EKU)
拡張プロパティに、使用法識別子オブジェクト識別子 (OID) を追加する。

[戻り値]
関数が成功した場合、関数は 0 以外 (TRUE) を返す。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報は
GetLastError を呼び出して取得する。


%index
CertAddRefServerOcspResponse
HCERT_SERVER_OCSP_RESPONSE ハンドルの参照カウントをインクリメントする。
%prm
hServerOcspResponse
hServerOcspResponse : [intptr] CertOpenServerOcspResponse が返す HCERT_SERVER_OCSP_RESPONSE へのハンドル。
%inst
HCERT_SERVER_OCSP_RESPONSE ハンドルの参照カウントをインクリメントする。

[備考]
CertOpenServerOcspResponse および CertAddRefServerOcspResponse
の各呼び出しには、対応する CertCloseServerOcspResponse の呼び出しが必要である。


%index
CertAddRefServerOcspResponseContext
CERT_SERVER_OCSP_RESPONSE_CONTEXT 構造体の参照カウントをインクリメントする。
%prm
pServerOcspResponseContext
pServerOcspResponseContext : [var] CertGetServerOcspResponseContext が返す CERT_SERVER_OCSP_RESPONSE_CONTEXT へのポインター。
%inst
CERT_SERVER_OCSP_RESPONSE_CONTEXT 構造体の参照カウントをインクリメントする。

[備考]
CertGetServerOcspResponseContext および
CertAddRefServerOcspResponseContext の各呼び出しには、対応する
CertFreeServerOcspResponseContext の呼び出しが必要である。


%index
CertAddSerializedElementToStore
シリアル化された証明書、証明書失効リスト (CRL)、または証明書信頼リスト (CTL) 要素をストアに追加する。
%prm
hCertStore, pbElement, cbElement, dwAddDisposition, dwFlags, dwContextTypeFlags, pdwContextType, ppvContext
hCertStore : [int] 作成される証明書を格納する証明書ストアのハンドル。hCertStore が NULL の場合、本関数は証明書、CRL、または CTL コンテキストのコピーを拡張プロパティとともに作成するが、証明書、CRL、または CTL はどのストアにも永続化されない。
pbElement : [var] シリアル化して証明書ストアに追加する証明書、CRL、または CTL 情報を含むバッファーへのポインター。
cbElement : [int] pbElement バッファーのサイズ（バイト単位）。
dwAddDisposition : [int] 証明書、CRL、または CTL が既にストアに存在する場合の動作を指定する。現在定義されている配置値を次の表に示す。
dwFlags : [int] 将来の使用のために予約されている。0 でなければならない。
dwContextTypeFlags : [int] 追加できるコンテキストを指定する。たとえば、証明書、CRL、または CTL のいずれかを追加するには、dwContextTypeFlags に CERT_STORE_CERTIFICATE_CONTEXT_FLAG または CERT_STORE_CRL_CONTEXT_FLAG を設定する。
pdwContextType : [var] 追加したシリアル化要素のコンテキスト種別へのポインター。これは省略可能なパラメーターで、NULL を指定でき、その場合、呼び出し元アプリケーションはコンテキスト種別を必要としないことを示す。現在定義されているコンテキスト種別を次の表に示す。
ppvContext : [var] デコードされた証明書、CRL、または CTL コンテキストへのポインターへのポインター。これは省略可能なパラメーターで、NULL を指定でき、その場合、呼び出し元アプリケーションは追加または既存の証明書、CRL、または CTL のコンテキストを必要としないことを示す。ppvContext が NULL でない場合、CERT_CONTEXT、CRL_CONTEXT、または CTL_CONTEXT へのポインターのアドレスでなければならない。アプリケーションがコンテキストの使用を終えたら、証明書の場合は CertFreeCertificateContext、CRL の場合は CertFreeCRLContext、CTL の場合は CertFreeCTLContext を使用して解放しなければならない。
%inst
シリアル化された証明書、証明書失効リスト (CRL)、または証明書信頼リスト (CTL) 要素をストアに追加する。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。関数が失敗した場合は 0 を返す。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）


%index
CertAddStoreToCollection
CertAddStoreToCollection 関数は、コレクション証明書ストアに兄弟証明書ストアを追加する。
%prm
hCollectionStore, hSiblingStore, dwUpdateFlags, dwPriority
hCollectionStore : [int] 証明書ストアのハンドル。
hSiblingStore : [int] コレクションストアに追加する兄弟ストアのハンドル。詳しくは備考を参照。
dwUpdateFlags : [int] コレクションストアの新しい兄弟ストアメンバーに対して、証明書、CRL、CTL を追加できるかを示す。追加を有効にするには、dwUpdateFlag に CERT_PHYSICAL_STORE_ADD_ENABLE_FLAG を設定する。追加を無効にするには、dwUpdateFlag に 0 を設定する。
dwPriority : [int] コレクション内の新しいストアの優先順位レベルを設定する。0 が最下位の優先順位である。このパラメーターに 0 を渡すと、指定したストアはコレクション内の末尾に追加される。コレクション内のストアの優先順位レベルは、ストアを列挙する順序と、証明書、CRL、または CTL を取得する際のストアの検索順序を決定する。優先順位レベルは、新しい証明書、CRL、または CTL がコレクションのどのストアに追加されるかも決定する。詳しくは備考を参照。
%inst
CertAddStoreToCollection 関数は、コレクション証明書ストアに兄弟証明書ストアを追加する。

[戻り値]
関数が成功した場合、関数は 0 以外を返し、新しいストアがストアのコレクションに追加される。関数が失敗した場合は 0
を返し、ストアは追加されない。

[備考]
コレクションストアは単一ストアと同じ HCERTSTORE
ハンドルを持つため、証明書ストアに適用されるほぼすべての関数はコレクションストアにも適用される。列挙および検索処理は、コレクションストア内のすべてのストアにまたがって行われる。ただし、CertAddCertificateLinkToStore
など、ストアにリンクを追加する関数はコレクションストアでは使用できない。証明書、CRL、または CTL
がコレクションストアに追加されると、コレクション内の兄弟ストアのリストが優先順位順に検索され、追加を許可する最初のストアが選ばれる。追加は
CertAddStoreToCollection の呼び出しで CERT_PHYSICAL_STORE_ADD_ENABLE_FLAG
を設定したときに有効になる。ストアに要素を追加する関数では、追加を許可するストアが成功を返さない場合、追加関数は通知なしで次のストアへ進む。コレクションストアとその兄弟ストアを
CertCloseStore で CERT_CLOSE_STORE_FORCE_FLAG
を指定して閉じる場合、兄弟ストアより先にコレクションストアを閉じなければならない。CERT_CLOSE_STORE_FORCE_FLAG
を使用しない場合、ストアはどの順序でも閉じてよい。


%index
CertAlgIdToOID
CryptoAPI アルゴリズム識別子 (ALG_ID) を ASN.1 オブジェクト識別子 (OID) 文字列に変換する。
%prm
dwAlgId
dwAlgId : [int] OID に変換する値。
%inst
CryptoAPI アルゴリズム識別子 (ALG_ID) を ASN.1 オブジェクト識別子 (OID) 文字列に変換する。

[戻り値]
関数が成功した場合、関数は NULL 終端 OID 文字列を返す。アルゴリズム識別子に対応する OID 文字列がない場合、関数は NULL
を返す。


%index
CertCloseServerOcspResponse
オンライン証明書状態プロトコル (OCSP) サーバー応答のハンドルを閉じる。
%prm
hServerOcspResponse, dwFlags
hServerOcspResponse : [intptr] 閉じる OCSP サーバー応答のハンドル。
dwFlags : [int] このパラメーターは使用されず、0 でなければならない。
%inst
オンライン証明書状態プロトコル (OCSP) サーバー応答のハンドルを閉じる。

[備考]
CertCloseServerOcspResponse 関数は、CertOpenServerOcspResponse または
CertAddRefServerOcspResponse が返したハンドルを閉じる。


%index
CertCloseStore
証明書ストアのハンドルを閉じ、ストアの参照カウントを減らす。
%prm
hCertStore, dwFlags
hCertStore : [int] 閉じる証明書ストアのハンドル。
dwFlags : [int] 通常は既定値の 0 を指定する。既定動作では、未解放コンテキストがあってもメモリを残したままストアを閉じる。この場合、メモリの確認は行わない。
%inst
証明書ストアのハンドルを閉じ、ストアの参照カウントを減らす。

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError
で取得する。CERT_CLOSE_STORE_CHECK_FLAG
が未設定、またはそれが設定されていてストアに関連付けられたすべてのコンテキストが解放済みであれば TRUE
を返す。CERT_CLOSE_STORE_CHECK_FLAG が設定されておりまだメモリが割り当てられたままのコンテキストがある場合は
FALSE を返す。FALSE を返してもストアは常に閉じられる。
コンテキストのメモリが残っている場合、GetLastError は CRYPT_E_PENDING_CLOSE
を返す。CERT_CLOSE_STORE_CHECK_FLAG が未設定なら既存の GetLastError 値は保持される。

[備考]

証明書ストアが開かれている間、ストアからコンテキストを取得または複製できる。取得/複製時に参照カウントが加算され、検索列挙関数への前回コンテキストとしての受け渡し、もしくは
CertFreeCertificateContext/CertFreeCRLContext/CertFreeCTLContext
で解放すると減算される。参照カウントが 0 になると対応するメモリは自動解放される。既定では、ストアクローズ時に参照カウントが 0
より大きいコンテキストのメモリは解放されない。このためメモリリークの原因となりうる。また、ストアクローズ後のコンテキストプロパティ変更は保存されない。強制解放するには
CERT_CLOSE_STORE_FORCE_FLAG
を設定する。これを設定するとストアに関連付けられたすべてのコンテキストメモリが解放され、それらへのポインタは無効になる。このフラグは、ストアやコンテキストが他の関数に渡されていない場合にのみ使用する。CERT_CLOSE_STORE_CHECK_FLAG
を使うとストアクローズ時に参照カウントの状態を確認でき、未解放のコンテキストがあれば FALSE を返し GetLastError が
CRYPT_E_PENDING_CLOSE となる。FALSE でもストアは閉じられるがメモリは解放されない。ストアオープン時に
CERT_STORE_NO_CRYPT_RELEASE_FLAG を指定していなければ、クローズ時に CSP ハンドルも解放される。


%index
CertCompareCertificate
証明書の発行者名とシリアル番号を比較することにより、2 つの証明書が同一かどうかを判定する。
%prm
dwCertEncodingType, pCertId1, pCertId2
dwCertEncodingType : [int] 使用するエンコード種別を指定する。証明書エンコード種別とメッセージエンコード種別を、次の例のようにビットごとの OR 演算で組み合わせて指定することも常に可能である: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコード種別は次のとおり。
pCertId1 : [var] 比較する 1 つ目の証明書の CERT_INFO へのポインター。
pCertId2 : [var] 比較する 2 つ目の証明書の CERT_INFO へのポインター。
%inst
証明書の発行者名とシリアル番号を比較することにより、2 つの証明書が同一かどうかを判定する。

[戻り値]
証明書が同一で、関数が成功した場合、関数は 0 以外 (TRUE) を返す。関数が失敗した場合は 0 (FALSE) を返す。


%index
CertCompareCertificateName
CertCompareCertificateName 関数は、2 つの証明書の CERT_NAME_BLOB 構造体を比較して、同一かどうかを判定する。CERT_NAME_BLOB 構造体は証明書のサブジェクトおよび発行者のために使用される。
%prm
dwCertEncodingType, pCertName1, pCertName2
dwCertEncodingType : [int] 使用するエンコード種別を指定する。証明書エンコード種別とメッセージエンコード種別を、次の例のようにビットごとの OR 演算で組み合わせて指定することも常に可能である: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコード種別は次のとおり。
pCertName1 : [var] 比較する 1 つ目の名前の CERT_NAME_BLOB へのポインター。詳しくは CRYPT_INTEGER_BLOB を参照。
pCertName2 : [var] 比較する 2 つ目の名前の CERT_NAME_BLOB へのポインター。
%inst
CertCompareCertificateName 関数は、2 つの証明書の CERT_NAME_BLOB
構造体を比較して、同一かどうかを判定する。CERT_NAME_BLOB 構造体は証明書のサブジェクトおよび発行者のために使用される。

[戻り値]
名前が同一で、関数が成功した場合、関数は 0 以外 (TRUE) を返す。関数が失敗した場合は 0 (FALSE) を返す。


%index
CertCompareIntegerBlob
CertCompareIntegerBlob 関数は、2 つの整数 BLOB を比較して、等しい数値を表しているかを判定する。
%prm
pInt1, pInt2
pInt1 : [var] 比較する 1 つ目の整数を含む CRYPT_INTEGER_BLOB 構造体へのポインター。
pInt2 : [var] 比較する 2 つ目の整数を含む CRYPT_INTEGER_BLOB 構造体へのポインター。
%inst
CertCompareIntegerBlob 関数は、2 つの整数 BLOB を比較して、等しい数値を表しているかを判定する。

[戻り値]
整数 BLOB の表現が同一で、関数が成功した場合、関数は 0 以外 (TRUE) を返す。関数が失敗した場合は 0 (FALSE)
を返す。拡張エラー情報は GetLastError を呼び出して取得する。

[備考]
比較の前に、正の数からは値 0x00
の最上位バイトが除去される。ここで言う正とは、次の非ゼロバイトの最上位ビットが立っていないことを意味する。負の数からは値 0xFF
の最上位バイトが除去される。ここで言う負とは、次の非 0xFF
バイトの最上位ビットが立っていることを意味する。これにより、その整数の一意な表現が得られる。次の表を参照。
（以下省略）


%index
CertComparePublicKeyInfo
CertComparePublicKeyInfo 関数は、エンコードされた 2 つの公開鍵を比較して、同一かどうかを判定する。
%prm
dwCertEncodingType, pPublicKey1, pPublicKey2
dwCertEncodingType : [int] 使用するエンコード種別を指定する。証明書エンコード種別とメッセージエンコード種別を、次の例のようにビットごとの OR 演算で組み合わせて指定することも常に可能である: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコード種別は次のとおり。
pPublicKey1 : [var] 比較する 1 つ目の公開鍵の CERT_PUBLIC_KEY_INFO へのポインター。
pPublicKey2 : [var] 比較する 2 つ目の公開鍵の CERT_PUBLIC_KEY_INFO へのポインター。
%inst
CertComparePublicKeyInfo 関数は、エンコードされた 2 つの公開鍵を比較して、同一かどうかを判定する。

[戻り値]
公開鍵が同一で、関数が成功した場合、関数は 0 以外 (TRUE) を返す。関数が失敗した場合は 0 (FALSE) を返す。


%index
CertControlStore
使用中のキャッシュされたストアの内容と、永続化ストレージ上のその内容との間に差異がある場合に、アプリケーションに通知できるようにする。
%prm
hCertStore, dwFlags, dwCtrlType, pvCtrlPara
hCertStore : [int] 証明書ストアのハンドル。
dwFlags : [int] 
dwCtrlType : [int] CertControlStore が実行する制御動作。pvCtrlPara および dwFlags の解釈は dwCtrlType の値に依存する。現在、次の動作が定義されている。
pvCtrlPara : [intptr] dwCtrlType が CERT_STORE_NOTIFY_CHANGE の場合、pvCtrlPara はハンドルのアドレスに設定し、システムはストアの永続化状態からの変更を検出したときにそのハンドル上で通知変更イベントをシグナルする。ハンドルは CreateEvent 関数の呼び出しで初期化しておく必要がある。レジストリベースのストアでは pvCtrlPara に NULL を指定できる。pvCtrlPara が NULL の場合、内部の通知変更イベントが作成され、シグナルされるよう登録される。内部の通知変更イベントを使用すると、ストアが変更された場合にのみ再同期操作が行える。
%inst
使用中のキャッシュされたストアの内容と、永続化ストレージ上のその内容との間に差異がある場合に、アプリケーションに通知できるようにする。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。関数が失敗した場合は 0 を返す。拡張エラー情報は GetLastError
を呼び出して取得する。dwCtrlType が CERT_STORE_NOTIFY_CHANGE
の場合、イベントシグナル用のハンドルの設定に成功すると関数は 0 以外を返す。イベントハンドルが設定されなかった場合は 0
を返す。dwCtrlType が CERT_STORE_CTRL_RESYNC の場合、再同期が成功すると 0
以外を返す。再同期が失敗した場合は 0 を返す。dwCtrlType が CERT_STORE_CTRL_COMMIT
の場合、永続化ストアへのコミットが正常に完了すると 0 以外を返す。コミットが失敗した場合は 0
を返す。プロバイダーによっては特定の制御種別をサポートしない場合がある。その場合 CertControlStore は 0
を返し、GetLastError は ERROR_NOT_SUPPORTED に設定される。

[備考]

ストアの再同期は任意のタイミングで実行でき、シグナルされた通知変更イベントに続けて行う必要はない。CERT_STORE_CTRL_NOTIFY_CHANGE
はレジストリベースのストアプロバイダーで、RegNotifyChangeKeyValue
関数を使用してサポートされる。CERT_STORE_CTRL_NOTIFY_CHANGE を用いた CertControlStore
の呼び出しは、CERT_STORE_CTRL_RESYNC で渡すイベントハンドル 1 つにつき 1
回行う。CERT_STORE_CTRL_NOTIFY_CHANGE
を用いたこれらの呼び出しは、各イベントが作成された後に行わなければならず、イベントがシグナルされた後ではいけない。


%index
CertCreateCRLContext
CertCreateCRLContext 関数は、エンコードされた CRL から証明書失効リスト (CRL) コンテキストを作成する。作成されたコンテキストは証明書ストアには永続化されない。作成されたコンテキスト内にエンコード済み CRL のコピーを保持する。
%prm
dwCertEncodingType, pbCrlEncoded, cbCrlEncoded
dwCertEncodingType : [int] 使用するエンコード種別を指定する。証明書エンコード種別とメッセージエンコード種別を、次の例のようにビットごとの OR 演算で組み合わせて指定することも常に可能である: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコード種別は次のとおり。
pbCrlEncoded : [var] コンテキストの作成元となるエンコード済み CRL を含むバッファーへのポインター。
cbCrlEncoded : [int] pbCrlEncoded バッファーのサイズ（バイト単位）。
%inst
CertCreateCRLContext 関数は、エンコードされた CRL から証明書失効リスト (CRL)
コンテキストを作成する。作成されたコンテキストは証明書ストアには永続化されない。作成されたコンテキスト内にエンコード済み CRL
のコピーを保持する。

[戻り値]
関数が成功した場合、戻り値は読み取り専用の CRL_CONTEXT へのポインター。関数が失敗し、CRL_CONTEXT
のデコードおよび作成ができなかった場合、戻り値は NULL。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを次の表に示す。
（以下省略）

[備考]
CRL_CONTEXT は CertFreeCRLContext を呼び出して解放しなければならない。複製するには
CertDuplicateCRLContext を呼び出せる。CRL のプロパティを保存・取得するには
CertSetCRLContextProperty および CertGetCRLContextProperty を呼び出せる。


%index
CertCreateCTLContext
CertCreateCTLContext 関数は、エンコードされた CTL から証明書信頼リスト (CTL) コンテキストを作成する。作成されたコンテキストは証明書ストアには永続化されない。本関数は、作成したコンテキスト内にエンコード済み CTL のコピーを保持する。
%prm
dwMsgAndCertEncodingType, pbCtlEncoded, cbCtlEncoded
dwMsgAndCertEncodingType : [int] 使用するエンコード種別を指定する。証明書エンコード種別とメッセージエンコード種別の両方を、次の例のようにビットごとの OR 演算で組み合わせて指定しなければならない: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコード種別は次のとおり。
pbCtlEncoded : [var] コンテキストの作成元となるエンコード済み CTL を含むバッファーへのポインター。
cbCtlEncoded : [int] pbCtlEncoded バッファーのサイズ（バイト単位）。
%inst
CertCreateCTLContext 関数は、エンコードされた CTL から証明書信頼リスト (CTL)
コンテキストを作成する。作成されたコンテキストは証明書ストアには永続化されない。本関数は、作成したコンテキスト内にエンコード済み CTL
のコピーを保持する。

[戻り値]
関数が成功した場合、戻り値は読み取り専用の CTL_CONTEXT へのポインター。関数が失敗し、CTL_CONTEXT
のデコードおよび作成ができなかった場合、戻り値は NULL。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを次の表に示す。
（以下省略）

[備考]
CTL_CONTEXT は CertFreeCTLContext を呼び出して解放しなければならない。複製するには
CertDuplicateCTLContext を呼び出せる。CTL のプロパティを保存・取得するには
CertSetCTLContextProperty および CertGetCTLContextProperty を呼び出せる。


%index
CertCreateCTLEntryFromCertificateContextProperties
CertCreateCTLEntryFromCertificateContextProperties 関数は、属性が証明書コンテキストのプロパティである証明書信頼リスト (CTL) エントリを作成する。CTL エントリの SubjectIdentifier は証明書の SHA1 ハッシュである。
%prm
pCertContext, cOptAttr, rgOptAttr, dwFlags, pvReserved, pCtlEntry, pcbCtlEntry
pCertContext : [var] CTL の作成に使用する CERT_CONTEXT へのポインター。
cOptAttr : [int] 追加する属性の数を指定する DWORD。
rgOptAttr : [var] CTL に追加する CRYPT_ATTRIBUTE 属性の配列へのポインター。
dwFlags : [int] DWORD。チェーン構築ハッシュプロパティを属性として強制的に含めるには CTL_ENTRY_FROM_PROP_CHAIN_FLAG を指定できる。
pvReserved : [intptr] VOID へのポインター。将来の使用のために予約されている。
pCtlEntry : [var] CTL_ENTRY 構造体へのポインターのアドレス。CTL エントリを取得するには本関数を 2 回呼び出す。1 回目の呼び出しでは、このパラメーターを NULL に設定する。関数が戻ったら、pcbCtlEntry パラメーターから取得したバイト数を使用してメモリを割り当てる。再度関数を呼び出し、このパラメーターに割り当てたメモリのアドレスを設定する。
pcbCtlEntry : [var] CTL_ENTRY 構造体のために割り当てるバイト数を格納する DWORD へのポインター。バイト数を取得するには本関数を 2 回呼び出す。1 回目の呼び出しでは、このパラメーターに 0 を含む DWORD 値のアドレスを設定し、pCtlEntry パラメーターを NULL に設定する。1 回目の呼び出しが成功すると、DWORD 値には CTL_ENTRY 構造体のために割り当てる必要があるバイト数が格納される。必要なメモリを割り当て、再度関数を呼び出し、pCtlEntry パラメーターにそのメモリのアドレスを指定する。
%inst
CertCreateCTLEntryFromCertificateContextProperties
関数は、属性が証明書コンテキストのプロパティである証明書信頼リスト (CTL) エントリを作成する。CTL エントリの
SubjectIdentifier は証明書の SHA1 ハッシュである。

[戻り値]
関数が成功した場合、関数は 0 以外 (TRUE) を返す。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報は
GetLastError を呼び出して取得する。


%index
CertFreeCertificateChainEngine
CertFreeCertificateChainEngine 関数は、証明書信頼エンジンを解放する。
%prm
hChainEngine
hChainEngine : [intptr] 解放するチェーンエンジンのハンドル。
%inst
CertFreeCertificateChainEngine 関数は、証明書信頼エンジンを解放する。


%index
CertCreateCertificateChainEngine
CertCreateCertificateChainEngine 関数は、アプリケーション用に新しい既定以外のチェーンエンジンを作成する。
%prm
pConfig, phChainEngine
pConfig : [var] チェーンエンジンのパラメーターを指定する CERT_CHAIN_ENGINE_CONFIG データ構造体へのポインター。
phChainEngine : [intptr] 作成したチェーンエンジンのハンドルへのポインター。チェーンエンジンの使用を終えたら、CertFreeCertificateChainEngine 関数を呼び出して解放する。
%inst
CertCreateCertificateChainEngine 関数は、アプリケーション用に新しい既定以外のチェーンエンジンを作成する。

[戻り値]
関数が成功した場合、関数は 0 以外 (TRUE) を返す。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報は
GetLastError を呼び出して取得する。phChainEngine パラメーターはチェーンエンジンのハンドルを返す。


%index
CertCreateCertificateContext
エンコードされた証明書から証明書コンテキストを作成する。作成されたコンテキストは証明書ストアには永続化されない。作成されたコンテキスト内にエンコード済み証明書のコピーを保持する。
%prm
dwCertEncodingType, pbCertEncoded, cbCertEncoded
dwCertEncodingType : [int] 使用するエンコード種別を指定する。証明書エンコード種別とメッセージエンコード種別を、次の例のようにビットごとの OR 演算で組み合わせて指定することも常に可能である: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコード種別は次のとおり。
pbCertEncoded : [var] コンテキストの作成元となるエンコード済み証明書を含むバッファーへのポインター。
cbCertEncoded : [int] pbCertEncoded バッファーのサイズ（バイト単位）。
%inst

エンコードされた証明書から証明書コンテキストを作成する。作成されたコンテキストは証明書ストアには永続化されない。作成されたコンテキスト内にエンコード済み証明書のコピーを保持する。

[戻り値]
関数が成功した場合、関数は読み取り専用の CERT_CONTEXT
へのポインターを返す。証明書コンテキストの使用を終えたら、CertFreeCertificateContext
関数を呼び出して解放する。関数が証明書コンテキストをデコードおよび作成できなかった場合は NULL を返す。拡張エラー情報は
GetLastError を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）

[備考]
CERT_CONTEXT は CertFreeCertificateContext を呼び出して解放しなければならない。複製するには
CertDuplicateCertificateContext を呼び出せる。証明書のプロパティを保存・取得するには
CertSetCertificateContextProperty および
CertGetCertificateContextProperty を呼び出せる。


%index
CertCreateContext
エンコードされたバイト列から指定したコンテキストを作成する。作成されたコンテキストには拡張プロパティは含まれない。
%prm
dwContextType, dwEncodingType, pbEncoded, cbEncoded, dwFlags, pCreatePara
dwContextType : [int] 作成可能なコンテキストを指定する。たとえば証明書コンテキストを作成するには、dwContextType に CERT_STORE_CERTIFICATE_CONTEXT を設定する。
dwEncodingType : [int] 使用するエンコード種別を指定する。現在は X509_ASN_ENCODING と PKCS_7_ASN_ENCODING のみが使用されているが、将来はエンコード種別が追加される可能性がある。現在のどちらのエンコード種別にも次を使用する: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。
pbEncoded : [var] コピー元となる既存のエンコード済みコンテキスト内容を含むバッファーへのポインター。
cbEncoded : [int] pbEncoded バッファーのサイズ（バイト単位）。
dwFlags : [int] 次のフラグ値が定義されており、ビットごとの OR 演算で組み合わせることができる。
pCreatePara : [var] CERT_CREATE_CONTEXT_PARA 構造体へのポインター。
%inst
エンコードされたバイト列から指定したコンテキストを作成する。作成されたコンテキストには拡張プロパティは含まれない。

[戻り値]
関数が成功した場合、戻り値は新しく作成されたコンテキストへのポインター。作成されたコンテキストを解放するには pCreatePara の
pvFree メンバーを呼び出さなければならない。
関数が失敗した場合、戻り値は NULL。拡張エラー情報は GetLastError を呼び出して取得する。GetLastError が
ERROR_CANCELLED を返した場合、それは PFN_CERT_CREATE_CONTEXT_SORT_FUNC
コールバック関数がソートを中止するために FALSE を返したことを意味する。


%index
CertCreateSelfSignCertificate
自己署名証明書を構築し、その証明書を表す CERT_CONTEXT 構造体へのポインターを返す。
%prm
hCryptProvOrNCryptKey, pSubjectIssuerBlob, dwFlags, pKeyProvInfo, pSignatureAlgorithm, pStartTime, pEndTime, pExtensions
hCryptProvOrNCryptKey : [int] 作成する証明書の署名に使用する暗号化プロバイダーのハンドル。NULL の場合、必要なハンドルを取得するために pKeyProvInfo パラメーターの情報が使用される。pKeyProvInfo も NULL の場合、既定のプロバイダー種別である PROV_RSA_FULL、既定のキー仕様である AT_SIGNATURE、および一意なコンテナー名で新しく作成したキーコンテナーが使用される。このハンドルは、CryptAcquireContext 関数で作成された HCRYPTPROV ハンドル、または NCryptOpenKey 関数で作成された NCRYPT_KEY_HANDLE ハンドルでなければならない。新しいアプリケーションでは、必ず CNG CSP の NCRYPT_KEY_HANDLE ハンドルを渡すべきである。
pSubjectIssuerBlob : [var] 証明書サブジェクトの識別名 (DN) を含む BLOB へのポインター。このパラメーターは NULL にできない。最低限でも、空の DN へのポインターを指定する必要がある。この BLOB は通常 CertStrToName 関数を使用して作成する。CryptEncodeObject 関数を使用し、StructType として X509_NAME または X509_UNICODE_NAME を指定して作成することもできる。
dwFlags : [int] 
pKeyProvInfo : [var] CRYPT_KEY_PROV_INFO 構造体へのポインター。証明書を作成する前に、CSP に対してキープロバイダー、キープロバイダー種別、およびキーコンテナー名が問い合わされる。問い合わせた CSP がこれらの問い合わせをサポートしていない場合、本関数は失敗する。既定のプロバイダーがこれらの問い合わせをサポートしていない場合は、pKeyProvInfo 値を指定する必要がある。RSA BASE はこれらの問い合わせをサポートする。pKeyProvInfo パラメーターが NULL でない場合、対応する値が、生成された証明書の CERT_KEY_PROV_INFO_PROP_ID 値に設定される。指定する構造体のすべてのパラメーターが正しく設定されていることを確認しなければならない。
pSignatureAlgorithm : [var] CRYPT_ALGORITHM_IDENTIFIER 構造体へのポインター。NULL の場合、既定のアルゴリズムである SHA1RSA が使用される。
pStartTime : [var] SYSTEMTIME 構造体へのポインター。NULL の場合、既定ではシステムの現在時刻が使用される。
pEndTime : [var] SYSTEMTIME 構造体へのポインター。NULL の場合、既定では pStartTime 値に 1 年を加えた値が使用される。
pExtensions : [var] CERT_EXTENSION 構造体の CERT_EXTENSIONS 配列へのポインター。既定では配列は空。別名のサブジェクト名が必要であれば、これらの拡張の 1 つとして指定できる。
%inst
自己署名証明書を構築し、その証明書を表す CERT_CONTEXT 構造体へのポインターを返す。

[戻り値]
関数が成功した場合、作成された証明書を指す PCCERT_CONTEXT 変数が返される。関数が失敗した場合は NULL
を返す。拡張エラー情報は GetLastError を呼び出して取得する。

[備考]
pEndTime は有効な日付でなければならず、ユーザーが指定しない場合は自動生成されるため、この API
をうるう日に呼び出すと、補正するアプリケーションロジックが伴わないと予期しない失敗を簡単に引き起こす可能性がある。詳しくは leap
year readiness
(https://techcommunity.microsoft.com/t5/azure-developer-community-blog/it-s-2020-is-your-code-ready-for-leap-day/ba-p/1157279)
を参照。


%index
CertDeleteCRLFromStore
CertDeleteCRLFromStore 関数は、指定した証明書失効リスト (CRL) コンテキストを証明書ストアから削除する。
%prm
pCrlContext
pCrlContext : [var] 削除する CRL_CONTEXT 構造体へのポインター。
%inst
CertDeleteCRLFromStore 関数は、指定した証明書失効リスト (CRL) コンテキストを証明書ストアから削除する。

[戻り値]
関数が成功した場合、戻り値は TRUE。関数が失敗した場合、戻り値は FALSE。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードの 1 つを以下に示す。
（以下省略）

[備考]
以降、このストアでの CRL 取得および検索操作はすべて失敗する。ただし、CRL
用に割り当てられたメモリは、すべての複製されたコンテキストも解放されるまで解放されない。pCrlContext
パラメーターは、エラーの場合でも常に本関数が CertFreeCRLContext を使用して解放する。


%index
CertDeleteCTLFromStore
CertDeleteCTLFromStore 関数は、指定した証明書信頼リスト (CTL) コンテキストを証明書ストアから削除する。
%prm
pCtlContext
pCtlContext : [var] 削除する CTL_CONTEXT 構造体へのポインター。
%inst
CertDeleteCTLFromStore 関数は、指定した証明書信頼リスト (CTL) コンテキストを証明書ストアから削除する。

[戻り値]
関数が成功した場合、戻り値は TRUE。関数が失敗した場合、戻り値は FALSE。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードの 1 つを以下に示す。
（以下省略）

[備考]
以降、このストアでの CTL 取得および検索操作はすべて失敗する。ただし、CTL
用に割り当てられたメモリは、すべての複製されたコンテキストも解放されるまで解放されない。pCtlContext
パラメーターは、エラーの場合でも常に本関数が CertFreeCTLContext を使用して解放する。


%index
CertDeleteCertificateFromStore
CertDeleteCertificateFromStore 関数は、指定した証明書コンテキストを証明書ストアから削除する。
%prm
pCertContext
pCertContext : [var] 削除する CERT_CONTEXT 構造体へのポインター。
%inst
CertDeleteCertificateFromStore 関数は、指定した証明書コンテキストを証明書ストアから削除する。

[戻り値]
関数が成功した場合、戻り値は TRUE。
関数が失敗した場合、戻り値は FALSE。拡張エラー情報は GetLastError を呼び出して取得する。想定されるエラーコードの 1
つを以下に示す。
（以下省略）

[備考]

証明書がストアから削除された後は、そのストアでその証明書を取得・検索しようとしてもすべて失敗する。ただし、証明書用に割り当てられたメモリは、すべての複製されたコンテキストも解放されるまで解放されない。CertDeleteCertificateFromStore
関数は、エラーが発生した場合でも常に CertFreeCertificateContext 関数を呼び出して pCertContext
を解放する。コンテキストを解放すると、そのコンテキストの参照カウントが 1 減る。参照カウントが 0
に達すると、証明書用に割り当てられたメモリが解放される。


%index
CertDuplicateCRLContext
CertDuplicateCRLContext 関数は、参照カウントをインクリメントすることで、証明書失効リスト (CRL) コンテキストを複製する。
%prm
pCrlContext
pCrlContext : [var] 参照カウントをインクリメントする対象の CRL_CONTEXT 構造体へのポインター。
%inst
CertDuplicateCRLContext 関数は、参照カウントをインクリメントすることで、証明書失効リスト (CRL)
コンテキストを複製する。

[戻り値]
現在はコンテキストのコピーは作成されず、返されるコンテキストは入力と同じものである。本関数に NULL を渡した場合は NULL を返す。


%index
CertDuplicateCTLContext
CertDuplicateCTLContext 関数は、参照カウントをインクリメントすることで、証明書信頼リスト (CTL) コンテキストを複製する。
%prm
pCtlContext
pCtlContext : [var] 参照カウントをインクリメントする対象の CTL_CONTEXT 構造体へのポインター。
%inst
CertDuplicateCTLContext 関数は、参照カウントをインクリメントすることで、証明書信頼リスト (CTL)
コンテキストを複製する。

[戻り値]
現在はコンテキストのコピーは作成されず、返される CTL_CONTEXT へのポインターは入力のポインターと同じものである。本関数に
NULL を渡した場合は NULL を返す。


%index
CertDuplicateCertificateChain
CertDuplicateCertificateChain 関数は、チェーンの参照カウントをインクリメントすることで、証明書チェーンへのポインターを複製する。
%prm
pChainContext
pChainContext : [var] 複製する CERT_CHAIN_CONTEXT チェーンコンテキストへのポインター。
%inst
CertDuplicateCertificateChain
関数は、チェーンの参照カウントをインクリメントすることで、証明書チェーンへのポインターを複製する。

[戻り値]
関数が成功した場合、チェーンコンテキストへのポインターが返される。このポインターは本関数に渡した pChainContext
と同じ値である。チェーンコンテキストの使用を終えたら、CertFreeCertificateChain
関数を呼び出して解放する。関数が失敗した場合は NULL を返す。


%index
CertDuplicateCertificateContext
参照カウントをインクリメントすることで、証明書コンテキストを複製する。
%prm
pCertContext
pCertContext : [var] 参照カウントをインクリメントする対象の CERT_CONTEXT 構造体へのポインター。
%inst
参照カウントをインクリメントすることで、証明書コンテキストを複製する。

[戻り値]
現在はコンテキストのコピーは作成されず、返されるコンテキストへのポインターは入力と同じ値である。本関数に NULL を渡した場合は
NULL を返す。複製したコンテキストの使用を終えたら、CertFreeCertificateContext
関数を呼び出して参照カウントを減らす。


%index
CertDuplicateStore
ストアの参照カウントをインクリメントすることで、ストアハンドルを複製する。
%prm
hCertStore
hCertStore : [int] 参照カウントをインクリメントする対象の証明書ストアのハンドル。
%inst
ストアの参照カウントをインクリメントすることで、ストアハンドルを複製する。

[戻り値]
現在はハンドルのコピーは作成されず、返されるハンドルは入力と同じものである。NULL
を渡した場合、呼び出された関数はアクセス違反例外を発生させる。


%index
CertEnumCRLContextProperties
CertEnumCRLContextProperties 関数は、証明書失効リスト (CRL) コンテキストに関連付けられた最初または次の拡張プロパティを取得する。
%prm
pCrlContext, dwPropId
pCrlContext : [var] CRL_CONTEXT 構造体へのポインター。
dwPropId : [int] 直前に列挙したプロパティの番号。最初のプロパティを取得するには dwPropId を 0 にする。以降のプロパティを取得するには、dwPropId に直前の呼び出しで返されたプロパティ番号を設定する。すべてのプロパティを列挙するには、関数が 0 を返すまで呼び出しを続ける。
%inst
CertEnumCRLContextProperties 関数は、証明書失効リスト (CRL)
コンテキストに関連付けられた最初または次の拡張プロパティを取得する。

[戻り値]
戻り値は、CRL コンテキストのプロパティを識別する DWORD 値。1 回の呼び出しで返された DWORD 値は、次回の呼び出しの
dwPropId に指定できる。列挙すべきプロパティがもうない場合、または関数が失敗した場合は 0 が返される。


%index
CertEnumCRLsInStore
CertEnumCRLsInStore 関数は、証明書ストア内の最初または次の証明書失効リスト (CRL) コンテキストを取得する。ループ内で使用することで、証明書ストア内のすべての CRL コンテキストを順に取得できる。
%prm
hCertStore, pPrevCrlContext
hCertStore : [int] 証明書ストアのハンドル。
pPrevCrlContext : [var] 直前に見つかった CRL_CONTEXT 構造体へのポインター。ストアの最初の CRL を取得するには pPrevCrlContext を NULL にしなければならない。以降の CRL は、pPrevCrlContext に直前の呼び出しで返されたポインターを設定して列挙する。このパラメーターが NULL 以外の場合、本関数はそのポインターが参照する CRL_CONTEXT を解放する。列挙は CertDeleteCRLFromStore で既に削除された CRL をスキップする。
%inst
CertEnumCRLsInStore 関数は、証明書ストア内の最初または次の証明書失効リスト (CRL)
コンテキストを取得する。ループ内で使用することで、証明書ストア内のすべての CRL コンテキストを順に取得できる。

[戻り値]
関数が成功した場合、戻り値はストア内の次の CRL_CONTEXT へのポインター。関数が失敗した場合は NULL
が返される。拡張エラー情報は GetLastError を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）

[備考]
返されたポインターは、次回の呼び出しで pPrevCrlContext
として渡されると解放される。そうでない場合、CertFreeCRLContext
を呼び出してポインターを明示的に解放しなければならない。NULL 以外の pPrevCrlContext
は、関数自体がエラーを返した場合でも、本関数に渡されると常に CertFreeCRLContext の呼び出しで解放される。本関数が返す
CRL コンテキストの複製は CertDuplicateCRLContext を呼び出して作成できる。


%index
CertEnumCTLContextProperties
CertEnumCTLContextProperties 関数は、証明書信頼リスト (CTL) コンテキストに関連付けられた最初または次の拡張プロパティを取得する。ループ内で使用することで、CTL コンテキストに関連付けられたすべての拡張プロパティを順に取得できる。
%prm
pCtlContext, dwPropId
pCtlContext : [var] CTL_CONTEXT 構造体へのポインター。
dwPropId : [int] 直前に列挙したプロパティの番号。最初のプロパティを取得するには dwPropId を 0 にする。以降のプロパティを取得するには、dwPropId に直前の呼び出しで返されたプロパティ番号を設定する。すべてのプロパティを列挙するには、関数が 0 を返すまで呼び出しを続ける。
%inst
CertEnumCTLContextProperties 関数は、証明書信頼リスト (CTL)
コンテキストに関連付けられた最初または次の拡張プロパティを取得する。ループ内で使用することで、CTL
コンテキストに関連付けられたすべての拡張プロパティを順に取得できる。

[戻り値]
戻り値は、CTL コンテキストのプロパティを識別する DWORD 値。1 回の呼び出しで返された DWORD 値は、次回の呼び出しの
dwPropId に指定できる。列挙すべきプロパティがもうない場合、または関数が失敗した場合は 0 が返される。


%index
CertEnumCTLsInStore
CertEnumCTLsInStore 関数は、証明書ストア内の最初または次の証明書信頼リスト (CTL) コンテキストを取得する。ループ内で使用することで、証明書ストア内のすべての CTL コンテキストを順に取得できる。
%prm
hCertStore, pPrevCtlContext
hCertStore : [int] 証明書ストアのハンドル。
pPrevCtlContext : [var] 直前に見つかった CTL_CONTEXT 構造体へのポインター。ストアの最初の CTL を取得するには NULL にしなければならない。以降の CTL は、pPrevCtlContext に直前の呼び出しで返されたポインターを設定して列挙する。このパラメーターが NULL 以外の場合、本関数はそのポインターが参照する CTL_CONTEXT を解放する。列挙は CertDeleteCTLFromStore で既に削除された CTL をスキップする。
%inst
CertEnumCTLsInStore 関数は、証明書ストア内の最初または次の証明書信頼リスト (CTL)
コンテキストを取得する。ループ内で使用することで、証明書ストア内のすべての CTL コンテキストを順に取得できる。

[戻り値]
関数が成功した場合、戻り値は読み取り専用の CTL_CONTEXT へのポインター。関数が失敗し、CTL が見つからなかった場合、戻り値は
NULL。拡張エラー情報は GetLastError を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）

[備考]
返されたポインターは、次回の呼び出しで pPrevCtlContext
として渡されると解放される。そうでない場合、CertFreeCTLContext を呼び出して明示的に解放しなければならない。NULL
以外の pPrevCtlContext は、エラーの場合でも（CertFreeCTLContext
の呼び出しを通じて）本関数が常に解放する。複製は CertDuplicateCTLContext を呼び出して作成できる。


%index
CertEnumCertificateContextProperties
CertEnumCertificateContextProperties 関数は、証明書コンテキストに関連付けられた最初または次の拡張プロパティを取得する。
%prm
pCertContext, dwPropId
pCertContext : [var] 列挙対象のプロパティを含む証明書の CERT_CONTEXT 構造体へのポインター。
dwPropId : [int] 直前に列挙したプロパティの番号。最初のプロパティを取得するには dwPropId を 0 にする。以降のプロパティを取得するには、dwPropId に直前の呼び出しで返されたプロパティ番号を設定する。すべてのプロパティを列挙するには、関数が 0 を返すまで呼び出しを続ける。
%inst
CertEnumCertificateContextProperties
関数は、証明書コンテキストに関連付けられた最初または次の拡張プロパティを取得する。

[戻り値]
戻り値は、証明書コンテキストのプロパティを識別する DWORD 値。1 回の呼び出しで返された DWORD 値は、次回の呼び出しの
dwPropId に指定できる。列挙すべきプロパティがもうない場合、または関数が失敗した場合は 0 が返される。

[備考]
CERT_KEY_PROV_HANDLE_PROP_ID および CERT_KEY_SPEC_PROP_ID
プロパティは、CERT_KEY_CONTEXT_PROP_ID プロパティのメンバーとして保存されており、個別には列挙されない。


%index
CertEnumCertificatesInStore
証明書ストア内の最初または次の証明書を取得する。ループで呼び出すことで全証明書を順に列挙できる。
%prm
hCertStore, pPrevCertContext
hCertStore : [int] 証明書ストアのハンドル。
pPrevCertContext : [var] 前回見つかった証明書コンテキストの CERT_CONTEXT へのポインタ。列挙開始時は NULL を渡す。後続の呼び出しでは前回の戻り値を渡す。NULL でない値は本関数により解放される。論理ストア(コレクションストア含む)では、返された pCertContext の複製を使って新たな列挙サブシーケンスを開始することはできない。列挙は CertDeleteCertificateFromStore で以前削除された証明書をスキップする。
%inst
証明書ストア内の最初または次の証明書を取得する。ループで呼び出すことで全証明書を順に列挙できる。

[戻り値]
成功時はストア内の次の CERT_CONTEXT へのポインタを返す。これ以上証明書がない場合は NULL を返す。拡張エラー情報は
GetLastError で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
返されたポインタは、後続呼び出しで pPrevCertContext として渡されたとき解放される。そうでない場合は
CertFreeCertificateContext で明示的に解放する必要がある。NULL でない pPrevCertContext
を渡した場合はエラー時も必ず解放される。現在列挙中の証明書の複製は CertDuplicateCertificateContext
で作成できる。


%index
CertEnumPhysicalStore
CertEnumPhysicalStore 関数は、コンピューター上の物理ストアを取得する。見つかった各物理ストアについて、指定したコールバック関数を呼び出す。
%prm
pvSystemStore, dwFlags, pvArg, pfnEnum
pvSystemStore : [intptr] dwFlags に CERT_SYSTEM_STORE_RELOCATE_FLAG が設定されている場合、pvSystemStore は、列挙対象のシステムストアの名前と場所の両方を示す CERT_SYSTEM_STORE_RELOCATE_PARA 構造体を指す。そうでない場合、pvSystemStore は物理ストアを列挙する対象のシステムストア名を保持する Unicode 文字列へのポインター。ServiceName または ComputerName をシステムストア名の前に付加する方法については CertRegisterSystemStore を参照。
dwFlags : [int] システムストアの場所を指定する。次のフラグ値が定義されている。
pvArg : [intptr] コールバック列挙関数に渡す情報を格納する構造体を、アプリケーションが宣言・定義・初期化するための void へのポインター。
pfnEnum : [int] 各物理ストアの詳細を表示するために使用するコールバック関数へのポインター。このコールバック関数は、各物理ストアに関する情報の表示内容とフォーマットを決定する。アプリケーションは CertEnumPhysicalStoreCallback コールバック関数を提供しなければならない。
%inst
CertEnumPhysicalStore
関数は、コンピューター上の物理ストアを取得する。見つかった各物理ストアについて、指定したコールバック関数を呼び出す。

[戻り値]
関数が成功し、別の物理ストアが見つかった場合、戻り値は
TRUE。システムストアの場所がシステムストアのみをサポートし、物理ストアをサポートしていない場合、関数は FALSE
を返し、GetLastError は ERROR_NOT_SUPPORTED
を返す。関数が失敗し、別の物理ストアが見つからなかった場合、戻り値は FALSE。拡張エラー情報は GetLastError
を呼び出して取得する。

[備考]
CertEnumPhysicalStore を使用するには、アプリケーションは ENUM_ARG
構造体と列挙コールバック関数を宣言・定義しなければならない。


%index
CertEnumSubjectInSortedCTL
ソートされた証明書信頼リスト (CTL) 内の最初または次の TrustedSubject を取得する。
%prm
pCtlContext, ppvNextSubject, pSubjectIdentifier, pEncodedAttributes
pCtlContext : [var] 検索対象の CTL_CONTEXT 構造体へのポインター。
ppvNextSubject : [var] 直前に見つかった TrustedSubject のアドレスへのポインター。列挙を開始するには、ppvNextSubject は NULL に設定されたポインターを指していなければならない。戻り時、ppvNextSubject が指すポインターは、エンコードシーケンス内の次の TrustedSubject を指すように更新される。
pSubjectIdentifier : [var] TrustedSubject を一意に識別する CRYPT_DER_BLOB 構造体へのポインター。この構造体の情報はハッシュまたは任意の一意なバイト列でよい。
pEncodedAttributes : [var] バイト数と、TrustedSubject のエンコード済み属性へのポインターを含む CRYPT_DER_BLOB 構造体へのポインター。
%inst
ソートされた証明書信頼リスト (CTL) 内の最初または次の TrustedSubject を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE で、ppvNextSubject はエンコードシーケンス内の次の TrustedSubject
を指すように更新される。関数が失敗した場合、戻り値は FALSE。これ以上サブジェクトがない場合、または引数が無効な場合も FALSE
になる。

[備考]
CRYPT_DER_BLOB 構造体の pbData メンバーは、エンコードされたバイト列を直接指している。CRYPT_DER_BLOB
構造体自体はアプリケーションが割り当てて解放しなければならないが、これらの構造体の pbData
メンバーが指すメモリはアプリケーションが割り当てたものではなく、アプリケーションが解放してはならない。CTL が
CERT_CREATE_CONTEXT_SORTED_FLAG フラグを指定してソートされていない場合、エラーが発生する。


%index
CertEnumSystemStore
CertEnumSystemStore 関数は、利用可能なシステムストアを取得する。見つかった各システムストアについて、指定したコールバック関数を呼び出す。
%prm
dwFlags, pvSystemStoreLocationPara, pvArg, pfnEnum
dwFlags : [int] システムストアの場所を指定する。このパラメーターには次のいずれかのフラグを指定できる。
pvSystemStoreLocationPara : [intptr] dwFlags パラメーターに CERT_SYSTEM_STORE_RELOCATE_FLAG が設定されている場合、pvSystemStoreLocationPara は、システムストアの名前と場所の両方を示す CERT_SYSTEM_STORE_RELOCATE_PARA 構造体を指す。そうでない場合、pvSystemStoreLocationPara はシステムストア名を保持する Unicode 文字列へのポインター。
pvArg : [intptr] コールバック列挙関数に渡す情報を格納する構造体を、アプリケーションが宣言・定義・初期化するための void へのポインター。
pfnEnum : [int] 各システムストアの詳細を表示するために使用するコールバック関数へのポインター。このコールバック関数は、各システムストアに関する情報の表示内容とフォーマットを決定する。アプリケーションは CertEnumSystemStoreCallback コールバック関数を提供しなければならない。
%inst
CertEnumSystemStore
関数は、利用可能なシステムストアを取得する。見つかった各システムストアについて、指定したコールバック関数を呼び出す。

[戻り値]
関数が成功した場合、関数は TRUE を返す。関数が失敗した場合は FALSE を返す。

[備考]
CertEnumSystemStore を使用するには、アプリケーションは ENUM_ARG 構造体および
CertEnumSystemStoreCallback コールバック関数を宣言・定義しなければならない。


%index
CertEnumSystemStoreLocation
CertEnumSystemStoreLocation 関数は、すべてのシステムストアの場所を取得する。見つかった各システムストアの場所について、指定したコールバック関数を呼び出す。
%prm
dwFlags, pvArg, pfnEnum
dwFlags : [int] 将来の使用のために予約されている。0 でなければならない。
pvArg : [intptr] コールバック列挙関数に渡す情報を格納する構造体を、アプリケーションが宣言・定義・初期化するための void へのポインター。
pfnEnum : [int] 各ストア場所の詳細を表示するために使用するコールバック関数へのポインター。このコールバック関数は、各ストア場所に関する情報の表示内容とフォーマットを決定する。コールバック関数のシグネチャとパラメーターについては CertEnumSystemStoreLocationCallback を参照。
%inst
CertEnumSystemStoreLocation
関数は、すべてのシステムストアの場所を取得する。見つかった各システムストアの場所について、指定したコールバック関数を呼び出す。

[戻り値]
関数が成功した場合、関数は TRUE を返す。
関数が失敗した場合は FALSE を返す。

[備考]
CertEnumSystemStoreLocation を使用するには、アプリケーションは ENUM_ARG
構造体と列挙コールバック関数を宣言・定義しなければならない。


%index
CertFindAttribute
CertFindAttribute 関数は、CRYPT_ATTRIBUTE 配列内で、オブジェクト識別子 (OID) で識別される最初の属性を見つける。
%prm
pszObjId, cAttr, rgAttr
pszObjId : [str] 検索に使用するオブジェクト識別子 (OID) へのポインター。
cAttr : [int] rgAttr 配列内の属性数。
rgAttr : [var] CRYPT_ATTRIBUTE 構造体の配列。
%inst
CertFindAttribute 関数は、CRYPT_ATTRIBUTE 配列内で、オブジェクト識別子 (OID)
で識別される最初の属性を見つける。

[戻り値]
属性が見つかった場合はその属性へのポインターを返す。見つからなかった場合は NULL を返す。


%index
CertFindCRLInStore
dwFindType パラメーターと関連する pvFindPara パラメーターによって指定された検索条件に一致する証明書失効リスト (CRL) コンテキストのうち、最初または次のものを証明書ストアから見つける。
%prm
hCertStore, dwCertEncodingType, dwFindFlags, dwFindType, pvFindPara, pPrevCrlContext
hCertStore : [int] 検索対象の証明書ストアのハンドル。
dwCertEncodingType : [int] このパラメーターは現在使用されていない。0 に設定しなければならない。
dwFindFlags : [int] dwFindType が CRL_FIND_ISSUED_BY の場合、既定では発行者名の照合のみが行われる。次のフラグを使用して追加の絞り込みを行える。
dwFindType : [int] 行う検索の種別を指定する。dwFindType の値が、pvFindPara パラメーターのデータ型、内容、および使用方法を決定する。現在定義されている検索種別と pvFindPara の要件は次のとおり。
pvFindPara : [intptr] このパラメーターは dwFindType の値によって決まる。詳しくはこのトピック前出の表を参照。
pPrevCrlContext : [var] 本関数が直前に返した CRL_CONTEXT へのポインター。検索条件を満たすストア内の最初の CRL を取得するには NULL にしなければならない。以降の検索条件に一致する CRL は、pPrevCrlContext に直前の呼び出しで返された PCCRL_CONTEXT ポインターを設定することで取得できる。検索処理は、検索条件に一致しない CRL、または CertDeleteCRLFromStore で既に削除された CRL をスキップする。このパラメーターが NULL でない場合、本関数はそのポインターが参照する CRL_CONTEXT を解放する。
%inst
dwFindType パラメーターと関連する pvFindPara パラメーターによって指定された検索条件に一致する証明書失効リスト
(CRL) コンテキストのうち、最初または次のものを証明書ストアから見つける。

[戻り値]
関数が成功した場合、関数は読み取り専用の CRL コンテキストへのポインターを返す。返された CRL
コンテキストの使用を終えたら、CertFreeCRLContext 関数を呼び出して解放するか、後続の
CertFindCRLInStore の呼び出しで pPrevCrlContext パラメーターとして渡して暗黙的に解放する。
関数が失敗し、検索条件に一致する CRL が見つからなかった場合、戻り値は NULL。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）

[備考]
返されたポインターは、次回の呼び出しで pPrevCrlContext
として渡されると解放される。そうでない場合、CertFreeCRLContext を呼び出して明示的に解放しなければならない。NULL
以外の pPrevCrlContext は、本関数内でエラーが発生した場合でも、CertFindCRLInStore が
CertFreeCRLContext の呼び出しにより常に解放する。
返されたコンテキストの複製は CertDuplicateCRLContext を呼び出して作成できる。返された CRL コンテキストは
CertAddCRLContextToStore を使用して別の証明書ストアに追加できる。また、CertAddCRLLinkToStore
を使用して、その CRL コンテキストへのリンクを非コレクションストアに追加することもできる。


%index
CertFindCTLInStore
dwFindType とそれに関連付けられた pvFindPara によって指定された検索条件に一致する証明書信頼リスト (CTL) コンテキストのうち、最初または次のものを見つける。
%prm
hCertStore, dwMsgAndCertEncodingType, dwFindFlags, dwFindType, pvFindPara, pPrevCtlContext
hCertStore : [int] 検索対象の証明書ストアのハンドル。
dwMsgAndCertEncodingType : [int] CTL に使用されているエンコード種別を指定する。証明書エンコード種別とメッセージエンコード種別を、次の例のようにビットごとの OR 演算で組み合わせて指定することも常に可能である: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコード種別は次のとおり。
dwFindFlags : [int] dwFindType が CTL_FIND_USAGE に設定されているときに指定できる。詳しくは後述の CTL_FIND_USAGE の説明を参照。
dwFindType : [int] 
pvFindPara : [intptr] dwFindType パラメーターに関連付けられた検索値へのポインター。
pPrevCtlContext : [var] 本関数が直前に返した CTL_CONTEXT へのポインター。ストア内の最初の CTL を取得するには NULL でなければならない。以降の CTL は、pPrevCtlContext に直前の呼び出しで返された CTL_CONTEXT へのポインターを設定することで取得する。検索条件に一致しない証明書や、CertDeleteCTLFromStore で既に削除された証明書はスキップされる。このパラメーターが NULL 以外の場合、本関数はそのポインターが参照する CTL_CONTEXT を解放する。
%inst
dwFindType とそれに関連付けられた pvFindPara によって指定された検索条件に一致する証明書信頼リスト (CTL)
コンテキストのうち、最初または次のものを見つける。

[戻り値]
関数が成功した場合、戻り値は読み取り専用の CTL コンテキストへのポインター。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）

[備考]
返されたポインターは、次回の呼び出しで pPrevCtlContext として渡されると解放される。そうでない場合は
CertFreeCTLContext を呼び出して解放しなければならない。NULL 以外の pPrevCtlContext
は、本関数がエラーを発生させた場合でも、CertFreeCTLContext の呼び出しにより常に解放される。
返されたコンテキストの複製は CertDuplicateCTLContext を呼び出して作成できる。返された CTL コンテキストは
CertAddCTLContextToStore を使用して別の証明書ストアに追加できる。また、CertAddCTLLinkToStore
を使用して、その CTL コンテキストへのリンクを非コレクションストアに追加することもできる。検索条件に一致する CTL
が見つからない場合、NULL が返される。


%index
CertFindCertificateInCRL
CertFindCertificateInCRL 関数は、指定した証明書を証明書失効リスト (CRL) から検索する。
%prm
pCert, pCrlContext, dwFlags, pvReserved, ppCrlEntry
pCert : [var] CRL 内を検索する証明書の CERT_CONTEXT へのポインター。
pCrlContext : [var] 検索対象の CRL_CONTEXT へのポインター。
dwFlags : [int] 将来の使用のために予約されている。0 に設定しなければならない。
pvReserved : [intptr] 将来の使用のために予約されている。0 に設定しなければならない。
ppCrlEntry : [var] 証明書が CRL 内で見つかった場合、このポインターはそのエントリへのポインターで更新される。見つからなかった場合は NULL に設定される。返されたエントリは割り当てられたものではなく、解放してはならない。
%inst
CertFindCertificateInCRL 関数は、指定した証明書を証明書失効リスト (CRL) から検索する。

[戻り値]
リストが検索された場合は TRUE、そうでない場合は FALSE。


%index
CertFindCertificateInStore
dwFindType と関連する pvFindPara で指定した検索条件に一致する、ストア内の最初または次の証明書コンテキストを検索する。
%prm
hCertStore, dwCertEncodingType, dwFindFlags, dwFindType, pvFindPara, pPrevCertContext
hCertStore : [int] 検索対象の証明書ストアのハンドル。
dwCertEncodingType : [int] 使用するエンコーディングの種類。証明書エンコーディング種別とメッセージエンコーディング種別の両方をビット単位 OR で組み合わせて指定する必要がある。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING 現在定義されているエンコーディング種別は以下の通り。
dwFindFlags : [int] 一部の dwFindType 値と組み合わせて検索条件を変更する。大抵の dwFindType では使用されず 0 を指定する。詳細は Remarks 参照。
dwFindType : [int] 
pvFindPara : [intptr] dwFindType と共に使用するデータ項目または構造体を指すポインタ。
pPrevCertContext : [var] 前回この関数が返した CERT_CONTEXT 構造体へのポインタ。初回呼び出し時は NULL を指定する。条件に一致する後続証明書を得るには前回の戻り値を渡す。NULL でない値は本関数により解放される。
%inst
dwFindType と関連する pvFindPara
で指定した検索条件に一致する、ストア内の最初または次の証明書コンテキストを検索する。

[戻り値]
成功時は読み取り専用の CERT_CONTEXT 構造体へのポインタを返す。検索条件に一致する証明書が見つからなかった場合は NULL
を返す。NULL でない戻り値は CertFreeCertificateContext で解放するか、次回呼び出しの
pPrevCertContext として渡して解放する必要がある。拡張エラー情報は GetLastError
で取得する。主なエラーコードは以下の通り。
（以下省略）

[備考]
dwFindFlags
パラメータは一部の検索種別の条件を変更するために使用する。CERT_UNICODE_IS_RDN_ATTRS_FLAG は
dwFindType が CERT_FIND_SUBJECT_ATTR または CERT_FIND_ISSUER_ATTR
の場合のみ使用され、pvFindPara が指す CERT_RDN_ATTR 構造体が Unicode
文字列で初期化されている場合に設定する必要がある。比較前に X509_UNICODE_NAME を使って変換される。以下の
dwFindFlags 値は dwFindType が CERT_FIND_ENKEY_USAGE の場合のみ使用される:
返されたコンテキストの複製は CertDuplicateCertificateContext で作成できる。返されたコンテキストは
CertAddCertificateContextToStore で別の証明書ストアに追加できる。返されたポインタは、次回呼び出しの
pPrevCertContext として渡すと解放される。そうでなければ CertFreeCertificateContext
で明示的に解放する。NULL でない pPrevCertContext はエラー時も必ず
CertFreeCertificateContext により解放される。


%index
CertFindChainInStore
ストア内で指定した条件を満たす最初または次の証明書を見つける。
%prm
hCertStore, dwCertEncodingType, dwFindFlags, dwFindType, pvFindPara, pPrevChainContext
hCertStore : [int] チェーンを構築する証明書を検索する対象のストアのハンドル。このハンドルは、チェーン構築時に追加のストアとして CertGetCertificateChain 関数に渡される。
dwCertEncodingType : [int] ストアのエンコードに使用された証明書エンコード種別。この値の上位 WORD に含まれるメッセージエンコード種別識別子は、本関数では無視される。
dwFindFlags : [int] 検索の追加オプションを含む。このパラメーターの指定可能な値は dwFindType パラメーターの値に依存する。
dwFindType : [int] ストア内の証明書を見つけるために使用する条件を決定する。
pvFindPara : [intptr] 追加の検索条件を含むポインター。このパラメーターが指すデータの型と形式は dwFindType パラメーターの値に依存する。
pPrevChainContext : [var] 本関数の直前の呼び出しから返された CERT_CHAIN_CONTEXT 構造体へのポインター。検索はこの証明書から開始される。本関数への最初の呼び出しではこのパラメーターは NULL でなければならない。以降の呼び出しでは、直前の呼び出しで返されたポインターを指定する。このパラメーターが NULL でない場合、本関数はこの構造体を解放する。
%inst
ストア内で指定した条件を満たす最初または次の証明書を見つける。

[戻り値]
最初または次のチェーンコンテキストが構築されなかった場合は NULL を返す。そうでない場合、読み取り専用の
CERT_CHAIN_CONTEXT 構造体へのポインターを返す。CERT_CHAIN_CONTEXT 構造体は、後続の本関数呼び出しで
pPrevChainContext
パラメーターとして渡されると解放される。そうでない場合、CertFreeCertificateChain
関数を呼び出して明示的に解放しなければならない。

[備考]
チェーンコンテキストを構築する最初の呼び出しでは pPrevChainContext パラメーターは NULL
でなければならない。次のチェーンコンテキストを構築するには、pPrevChainContext に直前の呼び出しで返された
CERT_CHAIN_CONTEXT 構造体を設定する。pPrevChainContext が NULL
でない場合、エラーが発生した場合でも、本関数は常に CertFreeCertificateChain 関数を使用してその構造体を解放する。


%index
CertFindExtension
CertFindExtension 関数は、CERT_EXTENSION 配列内で、オブジェクト識別子 (OID) で識別される最初の拡張を見つける。
%prm
pszObjId, cExtensions, rgExtensions
pszObjId : [str] 検索に使用するオブジェクト識別子 (OID) へのポインター。
cExtensions : [int] rgExtensions 配列内の拡張の数。
rgExtensions : [var] CERT_EXTENSION 構造体の配列。
%inst
CertFindExtension 関数は、CERT_EXTENSION 配列内で、オブジェクト識別子 (OID)
で識別される最初の拡張を見つける。

[戻り値]
拡張が見つかった場合はその拡張へのポインターを返す。見つからなかった場合は NULL を返す。


%index
CertFindRDNAttr
CertFindRDNAttr 関数は、相対識別名 (RDN) のリストから、オブジェクト識別子 (OID) で識別される最初の RDN 属性を見つける。
%prm
pszObjId, pName
pszObjId : [str] 検索に使用するオブジェクト識別子 (OID) へのポインター。
pName : [var] 検索対象の相対識別名のリストを含む CERT_NAME_INFO 構造体へのポインター。
%inst
CertFindRDNAttr 関数は、相対識別名 (RDN) のリストから、オブジェクト識別子 (OID) で識別される最初の RDN
属性を見つける。

[戻り値]
属性が見つかった場合はその属性へのポインターを返す。見つからなかった場合は NULL を返す。


%index
CertFindSubjectInCTL
CertFindSubjectInCTL 関数は、証明書信頼リスト (CTL) 内から指定したサブジェクトを見つけることを試みる。
%prm
dwEncodingType, dwSubjectType, pvSubject, pCtlContext, dwFlags
dwEncodingType : [int] 使用するエンコード種別を指定する。現在は X509_ASN_ENCODING と PKCS_7_ASN_ENCODING のみが使用されているが、将来はエンコード種別が追加される可能性がある。現在のどちらのエンコード種別にも次を使用する: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。
dwSubjectType : [int] CTL 内で検索するサブジェクトの種別を指定する。既定の検索を行う場合は NULL でもよい。
pvSubject : [intptr] dwSubjectType パラメーターと組み合わせて使用するポインター。
pCtlContext : [var] 検索対象の CTL_CONTEXT 構造体へのポインター。
dwFlags : [int] 将来の使用のために予約されている。0 でなければならない。
%inst
CertFindSubjectInCTL 関数は、証明書信頼リスト (CTL) 内から指定したサブジェクトを見つけることを試みる。

[戻り値]
関数が成功した場合、戻り値は見つかったエントリ。関数が失敗した場合、戻り値は NULL。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）

[備考]
サブジェクトエントリの検索では、証明書のハッシュまたは CTL_ANY_SUBJECT_INFO 構造体の
SubjectIdentifier メンバーがキーとして使用される。キーとエントリの SubjectIdentifier
との間でバイナリメモリ比較が行われる。


%index
CertFindSubjectInSortedCTL
CertFindSubjectInSortedCTL 関数は、ソートされた証明書信頼リスト (CTL) 内から指定したサブジェクトを見つけることを試みる。
%prm
pSubjectIdentifier, pCtlContext, dwFlags, pvReserved, pEncodedAttributes
pSubjectIdentifier : [var] サブジェクトを一意に識別する CRYPT_DATA_BLOB 構造体へのポインター。この構造体の情報はハッシュまたは任意の一意なバイト列でよい。
pCtlContext : [var] 検索対象の CTL_CONTEXT 構造体へのポインター。
dwFlags : [int] 将来の使用のために予約されている。NULL でなければならない。
pvReserved : [intptr] 将来の使用のために予約されている。NULL でなければならない。
pEncodedAttributes : [var] バイト数と、サブジェクトのエンコード済み属性へのポインターを含む CRYPT_DER_BLOB 構造体へのポインター。
%inst
CertFindSubjectInSortedCTL 関数は、ソートされた証明書信頼リスト (CTL)
内から指定したサブジェクトを見つけることを試みる。

[戻り値]
関数が成功し、CTL にサブジェクト識別子が存在する場合、戻り値は
TRUE。関数が失敗し、一致するサブジェクト識別子が見つからなかった場合、戻り値は FALSE。


%index
CertFreeCRLContext
参照カウントをデクリメントすることで、証明書失効リスト (CRL) コンテキストを解放する。
%prm
pCrlContext
pCrlContext : [var] 解放する CRL_CONTEXT へのポインター。
%inst
参照カウントをデクリメントすることで、証明書失効リスト (CRL) コンテキストを解放する。

[戻り値]
本関数は常に TRUE を返す。


%index
CertFreeCTLContext
参照カウントをデクリメントすることで、証明書信頼リスト (CTL) コンテキストを解放する。
%prm
pCtlContext
pCtlContext : [var] 解放する CTL_CONTEXT へのポインター。
%inst
参照カウントをデクリメントすることで、証明書信頼リスト (CTL) コンテキストを解放する。

[戻り値]
本関数は常に TRUE を返す。


%index
CertFreeCertificateChain
CertFreeCertificateChain 関数は、証明書チェーンの参照カウントを減らして解放する。参照カウントが 0 になると、そのチェーンのために割り当てられたメモリが解放される。
%prm
pChainContext
pChainContext : [var] 解放する CERT_CHAIN_CONTEXT 証明書チェーンコンテキストへのポインター。コンテキストの参照カウントが 0 に達すると、そのコンテキストのために割り当てられたストレージが解放される。
%inst
CertFreeCertificateChain 関数は、証明書チェーンの参照カウントを減らして解放する。参照カウントが 0
になると、そのチェーンのために割り当てられたメモリが解放される。


%index
CertFreeCertificateChainList
チェーンコンテキストへのポインター配列を解放する。
%prm
prgpSelection
prgpSelection : [var] CertSelectCertificateChains 関数が返した PCCERT_CHAIN_CONTEXT 構造体へのポインター。
%inst
チェーンコンテキストへのポインター配列を解放する。

[備考]
CertFreeCertificateChainList 関数を呼び出す前に、prgpSelection
パラメーターが指す配列内の各チェーンコンテキストに対して CertFreeCertificateChain
関数を呼び出さなければならない。


%index
CertFreeCertificateContext
参照カウントをデクリメントすることで、証明書コンテキストを解放する。参照カウントが 0 になると、CertFreeCertificateContext は証明書コンテキストで使用されていたメモリを解放する。
%prm
pCertContext
pCertContext : [var] 解放する CERT_CONTEXT へのポインター。
%inst
参照カウントをデクリメントすることで、証明書コンテキストを解放する。参照カウントが 0
になると、CertFreeCertificateContext は証明書コンテキストで使用されていたメモリを解放する。

[戻り値]
本関数は常に 0 以外を返す。


%index
CertFreeServerOcspResponseContext
CERT_SERVER_OCSP_RESPONSE_CONTEXT 構造体の参照カウントをデクリメントする。
%prm
pServerOcspResponseContext
pServerOcspResponseContext : [var] CertGetServerOcspResponseContext 関数によって返された値を含む CERT_SERVER_OCSP_RESPONSE_CONTEXT 構造体へのポインター。
%inst
CERT_SERVER_OCSP_RESPONSE_CONTEXT 構造体の参照カウントをデクリメントする。


%index
CertGetCRLContextProperty
指定した証明書失効リスト (CRL) コンテキストの拡張プロパティを取得する。
%prm
pCrlContext, dwPropId, pvData, pcbData
pCrlContext : [var] CRL_CONTEXT 構造体へのポインター。
dwPropId : [int] 取得するプロパティを識別する。現在定義されている識別子と、pvData に返されるデータ型を次の表に示す。
pvData : [intptr] dwPropId で決定されるデータを受け取るバッファーへのポインター。返される構造体のメンバーが指す構造体も、基底構造体に続けて返される。したがって、pcbData に格納されるサイズは、基底構造体のサイズを超えることが多い。
pcbData : [var] pvData パラメーターが指すバッファーのサイズ（バイト単位）を指定する DWORD 値へのポインター。関数が戻るとき、この DWORD 値にはバッファーに格納するバイト数が含まれる。
%inst
指定した証明書失効リスト (CRL) コンテキストの拡張プロパティを取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE。関数が失敗した場合、戻り値は FALSE。呼び出し先の CryptHashCertificate
からのエラーが本関数に伝播することがある。拡張エラー情報は GetLastError
を呼び出して取得する。想定されるエラーコードを以下に示す。
（以下省略）


%index
CertGetCRLFromStore
指定した発行者について、証明書ストアから最初または次の証明書失効リスト (CRL) コンテキストを取得する。
%prm
hCertStore, pIssuerContext, pPrevCrlContext, pdwFlags
hCertStore : [int] 証明書ストアのハンドル。
pIssuerContext : [var] 発行者 CERT_CONTEXT へのポインター。pIssuerContext ポインターは、このストアや別のストアから取得したもの、または CertCreateCertificateContext を呼び出して作成したものでよい。このパラメーターに NULL を渡すと、ストア内のすべての CRL が検索対象となる。
pPrevCrlContext : [var] CRL_CONTEXT へのポインター。発行者は複数の CRL を持つ場合がある。たとえば、X.509 バージョン 3 拡張を使用して差分 CRL を生成できる。CRL を取得する最初の呼び出しでは、このパラメーターは NULL でなければならない。発行者の次の CRL を取得するには、直前の呼び出しで返された CRL_CONTEXT を設定する。NULL 以外の pPrevCrlContext は、エラーの場合でも、本関数が CertFreeCRLContext を呼び出して常に解放する。
pdwFlags : [var] 返される CRL に対する検証チェックを有効にするために、次のフラグ値が定義されている。これらのフラグはビットごとの OR 演算で組み合わせることができる。
%inst
指定した発行者について、証明書ストアから最初または次の証明書失効リスト (CRL) コンテキストを取得する。

[戻り値]
関数が成功した場合、戻り値は読み取り専用の CRL_CONTEXT へのポインターとなる。関数が失敗し、最初または次の CRL
が見つからない場合は、戻り値は NULL となる。返された CRL_CONTEXT は CertFreeCRLContext
を呼び出して解放しなければならない。ただし、返された CRL_CONTEXT を後続呼び出しで pPrevCrlContext
として渡した場合、関数側で解放される。拡張エラー情報を取得するには GetLastError
を呼び出す。考えられるエラーコードを以下に示す。
（以下省略）

[備考]
CertDuplicateCRLContext を呼び出すと CRL の複製を作成できる。フラグの 16 進値をビット単位 OR
で組み合わせると複数の検証を同時に有効化できる。例えば署名検証と時刻有効性検証の両方を有効にするには、pdwFlags が指す DWORD
値を CERT_STORE_SIGNATURE_FLAG | CERT_STORE_TIME_VALIDITY_FLAG
に設定する。CERT_STORE_SIGNATURE_FLAG 検証が成功し、CERT_STORE_TIME_VALIDITY_FLAG
検証が失敗した場合、関数から戻るときには pdwFlags が指す DWORD 値は
CERT_STORE_TIME_VALIDITY_FLAG に設定される。


%index
CertGetCTLContextProperty
証明書信頼リスト (CTL) コンテキストの拡張プロパティを取得する。
%prm
pCtlContext, dwPropId, pvData, pcbData
pCtlContext : [var] CTL_CONTEXT 構造体へのポインター。
dwPropId : [int] 取得するプロパティを識別する。現在定義されている識別子と pvData に返されるデータ型を次の表に示す。
pvData : [intptr] dwPropId によって決まるデータを受け取るバッファーへのポインター。返される構造体のメンバーが指す構造体も、基底構造体に続けて返される。したがって pcbData に含まれるサイズは基底構造体のサイズを超えることが多い。
pcbData : [var] pvData パラメーターが指すバッファーのサイズをバイト単位で指定する DWORD 値へのポインター。関数から戻ると、DWORD 値はバッファーに格納されるバイト数を含む。
%inst
証明書信頼リスト (CTL) コンテキストの拡張プロパティを取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。呼び出される関数
CryptHashCertificate のエラーがこの関数に伝播することがある。拡張エラー情報を取得するには GetLastError
を呼び出す。考えられるエラーコードを以下に示す。
（以下省略）


%index
CertGetCertificateChain
末端証明書から出発し、可能であれば信頼されたルート証明書まで遡る証明書チェーンコンテキストを構築する。
%prm
hChainEngine, pCertContext, pTime, hAdditionalStore, pChainPara, dwFlags, pvReserved, ppChainContext
hChainEngine : [intptr] 使用するチェーンエンジン (名前空間およびキャッシュ) のハンドル。hChainEngine が NULL の場合、既定のチェーンエンジン HCCE_CURRENT_USER が使用される。このパラメーターに HCCE_LOCAL_MACHINE を指定することもできる。
pCertContext : [var] チェーンを構築する対象となる末端証明書 (エンド証明書) の CERT_CONTEXT へのポインター。この証明書コンテキストは最初の単純チェーンの 0 番目の要素になる。
pTime : [var] チェーンを検証する対象の時刻を示す FILETIME 変数へのポインター。なお、この時刻は信頼リスト・失効・ルートストアの確認には影響しない。このパラメーターに NULL を渡すと、現在のシステム時刻が使用される。特定の証明書を信頼済みルートとして信頼するかは、現在のルートストアの状態に基づくもので、このパラメーターで渡した時刻におけるルートストアの状態ではない。失効については、証明書失効リスト (CRL) 自体が現在時刻で有効でなければならない。このパラメーターの値は、CRL に列挙された証明書が失効しているかどうかの判定に用いられる。
hAdditionalStore : [int] サポート用の証明書および証明書信頼リスト (CTL) を検索する追加ストアへのハンドル。追加ストアを検索しない場合は NULL を指定できる。
pChainPara : [var] チェーン構築パラメーターを含む CERT_CHAIN_PARA 構造体へのポインター。
dwFlags : [int] 特殊な処理を指定するフラグ値。このパラメーターには以下のフラグを 1 つ以上組み合わせて指定できる。
pvReserved : [intptr] このパラメーターは予約されており、NULL でなければならない。
ppChainContext : [var] 作成されたチェーンコンテキストへのポインターのアドレス。チェーンコンテキストの使用を終えたら、CertFreeCertificateChain 関数を呼び出してチェーンを解放する。
%inst
末端証明書から出発し、可能であれば信頼されたルート証明書まで遡る証明書チェーンコンテキストを構築する。

[戻り値]
関数が成功した場合、0 以外 (TRUE) を返す。関数が失敗した場合、0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
アプリケーションが証明書チェーンを要求すると、返される構造は CERT_CHAIN_CONTEXT の形式となる。このコンテキストは
CERT_SIMPLE_CHAIN
構造体の配列を含み、各単純チェーンは末端証明書から自己署名証明書までをつなぐ。チェーンコンテキストは信頼リストを介して単純チェーンを接続する。各単純チェーンには証明書の連鎖、そのチェーンに関する要約された信頼情報、およびチェーン内の各証明書要素に関する信頼情報が含まれる。
（以下省略）


%index
CertGetCertificateContextProperty
証明書コンテキストの拡張プロパティに含まれる情報を取得する。
%prm
pCertContext, dwPropId, pvData, pcbData
pCertContext : [var] 取得対象のプロパティを含む証明書の CERT_CONTEXT 構造体へのポインター。
dwPropId : [int] 取得するプロパティ。現在定義されている識別子と pvData に返されるデータ型を次の表に示す。
pvData : [intptr] dwPropId によって決まるデータを受け取るバッファーへのポインター。返される構造体のメンバーが指す構造体も、基底構造体に続けて返される。したがって pcbData に含まれるサイズは基底構造体のサイズを超えることが多い。このパラメーターを NULL に設定すると、メモリ割り当て用に情報サイズを取得できる。詳細は「長さ不明のデータの取得」を参照。
pcbData : [var] pvData パラメーターが指すバッファーのサイズをバイト単位で指定する DWORD 値へのポインター。関数から戻ると、DWORD 値はバッファーに格納されるバイト数を含む。実行時に必要なバッファーサイズを取得するには、pvData に NULL を渡し、このパラメーターが指す値を 0 に設定する。pvData が NULL でなく、pcbData に指定したサイズがデータを格納するのに必要なバイト数より小さい場合、関数は失敗し、GetLastError は ERROR_MORE_DATA を返し、必要なサイズが pcbData が指す変数に格納される。注意: バッファーに返されたデータを処理する際、アプリケーションは実際に返されたデータのサイズを使用しなければならない。実際のサイズは入力で指定したバッファーサイズよりわずかに小さいことがある。（入力時には通常、最大出力データが収まるように十分大きなサイズを指定する。）出力時には、このパラメーターが指す変数はバッファーにコピーされた実際のデータサイズを反映するよう更新される。
%inst
証明書コンテキストの拡張プロパティに含まれる情報を取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。考えられるエラーコードを以下に示す。
（以下省略）

[備考]

プロパティは証明書の内部には格納されない。通常、証明書応答を受け取った後に証明書に関連付けられ、ストアに証明書とともに保存される。セキュリティ上の理由から、プロパティ値は保存前に検証し、CERT_FRIENDLY_NAME_PROP_ID
のような情報系プロパティのみをユーザーストアに保存することを推奨する。その他のプロパティ型はローカルコンピューターストアに保存すべきである。コードはマクロを用いて証明書コンテキストのハッシュクラスを評価できる。詳細は
CertSetCertificateContextProperty を参照。


%index
CertGetEnhancedKeyUsage
証明書の拡張キー使用法 (EKU) 拡張または EKU 拡張プロパティから情報を返す。
%prm
pCertContext, dwFlags, pUsage, pcbUsage
pCertContext : [var] CERT_CONTEXT 証明書コンテキストへのポインター。
dwFlags : [int] 関数が証明書の拡張、その拡張プロパティ、またはその両方についてレポートするかを指定する。0 に設定すると、EKU 拡張と EKU 拡張プロパティ値の両方に基づいて証明書の有効な用途を返す。
pUsage : [var] 証明書の有効な用途を受け取る CERT_ENHKEY_USAGE 構造体 (CERT_ENHKEY_USAGE は CTL_USAGE 構造体の別名 typedef) へのポインター。
pcbUsage : [var] pUsage が指す構造体のサイズをバイト単位で指定する DWORD へのポインター。関数から戻ると、DWORD は構造体のサイズ (バイト単位) を含む。
%inst
証明書の拡張キー使用法 (EKU) 拡張または EKU 拡張プロパティから情報を返す。

[戻り値]
関数が成功した場合、0 以外 (TRUE) を返す。関数が失敗した場合、0 (FALSE) を返す。

[備考]
証明書が EKU 拡張を持つ場合、その拡張にはその証明書の有効な用途を表すオブジェクト識別子 (OID) が列挙される。Microsoft
環境では、証明書に有効な用途を示す EKU 拡張プロパティが付加されていることもある。
（以下省略）


%index
CertGetIntendedKeyUsage
証明書から意図されたキー用途バイトを取得する。
%prm
dwCertEncodingType, pCertInfo, pbKeyUsage, cbKeyUsage
dwCertEncodingType : [int] 使用するエンコーディング種別を指定する。次の例のように証明書エンコーディングとメッセージエンコーディングをビット単位 OR で組み合わせて指定することも常に許容される: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING 現在定義されているエンコーディング種別は次のとおり。
pCertInfo : [var] 指定した証明書の CERT_INFO 構造体へのポインター。
pbKeyUsage : [var] 意図されたキー用途を受け取るバッファーへのポインター。現在定義されている値を次に示す。これらはビット単位 OR 演算で組み合わせることができる。
cbKeyUsage : [int] pbKeyUsage が指すバッファーのサイズ (バイト単位)。現在、意図されたキー用途は 1 ～ 2 バイトのデータで表される。
%inst
証明書から意図されたキー用途バイトを取得する。

[戻り値]
証明書に意図されたキー用途バイトが存在しない場合、FALSE が返され、pbKeyUsage は 0 クリアされる。存在する場合、TRUE
が返され、cbKeyUsage バイトまでが pbKeyUsage にコピーされる。コピーされなかった残りのバイトは 0 クリアされる。
必須の拡張が一つも見つからない場合、GetLastError は 0 を返す。関数が失敗した場合、GetLastError は ASN.1
エンコード/デコードエラーを返すことがある。これらのエラーについては「ASN.1 エンコード/デコード戻り値」を参照。


%index
CertGetIssuerCertificateFromStore
指定したサブジェクト証明書の最初または次の発行者について、証明書ストアから証明書コンテキストを取得する。本関数よりも新しい「証明書チェーン検証関数」の使用を推奨する。
%prm
hCertStore, pSubjectContext, pPrevIssuerContext, pdwFlags
hCertStore : [int] 証明書ストアのハンドル。
pSubjectContext : [var] サブジェクト情報を含む CERT_CONTEXT 構造体へのポインター。このパラメーターは任意の証明書ストアから取得することも、呼び出し側アプリケーションが CertCreateCertificateContext 関数で作成することもできる。
pPrevIssuerContext : [var] 発行者情報を含む CERT_CONTEXT 構造体へのポインター。特に有効期間が切り替わる時期には、発行者が複数の証明書を持つことがある。最初の発行者証明書を取得する呼び出しではこのパラメーターは NULL でなければならない。同じ発行者の次の証明書を取得するには、pPrevIssuerContext に前回の呼び出しで返された CERT_CONTEXT 構造体を設定する。このパラメーターが NULL でない値の CERT_CONTEXT は、本関数によって解放される。
pdwFlags : [var] 以下のフラグにより、返される証明書に対する検証チェックを有効化できる。ビット単位 OR で組み合わせて複数の検証を有効化できる。
%inst

指定したサブジェクト証明書の最初または次の発行者について、証明書ストアから証明書コンテキストを取得する。本関数よりも新しい「証明書チェーン検証関数」の使用を推奨する。

[戻り値]
関数が成功した場合、戻り値は読み取り専用の発行者 CERT_CONTEXT
へのポインターとなる。関数が失敗し、最初または次の発行者証明書が見つからない場合は、戻り値は NULL
となる。CertFreeCertificateContext を呼び出して解放する必要があるのは最後に返された CERT_CONTEXT
構造体のみである。ある呼び出しで返された CERT_CONTEXT を後続呼び出しで pPrevIssuerContext
として渡した場合、そのコンテキストは関数の動作の一部として解放される。拡張エラー情報を取得するには GetLastError
を呼び出す。考えられるエラーコードを以下に示す。
（以下省略）

[備考]
返されるポインターは、後続呼び出しで pPrevIssuerContext
として渡された時点で解放される。それ以外の場合、CertFreeCertificateContext
を呼び出して明示的に解放しなければならない。関数内でエラーが発生した場合であっても、NULL 以外の pPrevIssuerContext
は常に CertGetIssuerCertificateFromStore が CertFreeCertificateContext
を呼び出して解放する。
CertDuplicateCertificateContext を呼び出すと発行者証明書の複製を作成できる。dwFlags の 16
進値はビット単位 OR で組み合わせて複数の検証を有効化できる。例えば署名と時刻有効性の両方を有効にするには、入力時に dwFlags に
0x00000003 を渡す。この場合、CERT_STORE_SIGNATURE_FLAG 検証が成功し
CERT_STORE_TIME_VALIDITY_FLAG 検証が失敗すると、出力時の dwFlags は 0x00000002 となる。


%index
CertGetNameStringW
証明書の CERT_CONTEXT 構造体からサブジェクト名または発行者名を取得し、NULL 終端文字列に変換する。(Unicode)
%prm
pCertContext, dwType, dwFlags, pvTypePara, pszNameString, cchNameString
pCertContext : [var] 変換対象のサブジェクト名および発行者名を含む CERT_CONTEXT 証明書コンテキストへのポインター。
dwType : [int] 名前を見つける方法と出力のフォーマット方法を示す DWORD。
dwFlags : [int] 必要な処理の種類を示す。
pvTypePara : [intptr] dwStrType を含む DWORD、または名前属性を指定するオブジェクト識別子 (OID) のいずれかへのポインター。指す型は dwType の値によって決まる。
pszNameString : [wstr] 返される文字列を受け取るために確保したバッファーへのポインター。pszNameString が NULL でなく cchNameString が 0 でない場合、pszNameString は NULL 終端文字列となる。dwFlags に CERT_NAME_SEARCH_ALL_NAMES_FLAG が指定され、dwType に CERT_NAME_DNS_TYPE が指定されている場合、返される文字列は該当する全ての DNS 名を含む。出力文字列中の各文字列は NULL 終端され、最後の文字列は二重 NULL 終端される。DNS 名が見つからない場合、単一の NULL 終端された空文字列が返される。
cchNameString : [int] 返される文字列のために確保した領域のサイズ (文字数)。このサイズには終端の NULL 文字を含める必要がある。
%inst
証明書の CERT_CONTEXT 構造体からサブジェクト名または発行者名を取得し、NULL 終端文字列に変換する。(Unicode)

[戻り値]
終端の NULL 文字を含む、変換された文字数を返す。pszNameString が NULL または cchNameString が 0
の場合、終端の NULL 文字を含む必要な出力文字列サイズを返す。指定した名前種別が見つからなかった場合、文字数 1 の NULL
終端された空文字列を返す。

[備考]
> [!NOTE] > wincrypt.h ヘッダーでは CertGetNameString
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づき、本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスをエンコーディング非依存でないコードと混在して使用すると、不整合によりコンパイルエラーや実行時エラーが発生することがある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CertGetPublicKeyLength
CertGetPublicKeyLength 関数は、公開鍵 BLOB から公開鍵/秘密鍵のビット長を取得する。
%prm
dwCertEncodingType, pPublicKey
dwCertEncodingType : [int] 使用するエンコーディング種別を指定する。次の例のように証明書エンコーディングとメッセージエンコーディングをビット単位 OR で組み合わせて指定することも常に許容される: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING 現在定義されているエンコーディング種別は次のとおり。
pPublicKey : [var] 長さを取得したい鍵を含む公開鍵 BLOB へのポインター。
%inst
CertGetPublicKeyLength 関数は、公開鍵 BLOB から公開鍵/秘密鍵のビット長を取得する。

[戻り値]
公開鍵/秘密鍵の長さをビット単位で返す。鍵の長さを判定できなかった場合は 0 を返す。失敗した理由は GetLastError
を呼び出して確認する。


%index
CertGetServerOcspResponseContext
指定したハンドルに対して、ノンブロッキングかつ時刻有効な OCSP (オンライン証明書状態プロトコル) 応答コンテキストを取得する。
%prm
hServerOcspResponse, dwFlags, pvReserved
hServerOcspResponse : [intptr] 応答コンテキストを取得する OCSP サーバー応答ハンドル。このハンドルは CertOpenServerOcspResponse 関数から返される。
dwFlags : [int] このパラメーターは将来の使用のため予約されており、0 でなければならない。
pvReserved : [intptr] このパラメーターは将来の使用のため予約されており、NULL でなければならない。
%inst
指定したハンドルに対して、ノンブロッキングかつ時刻有効な OCSP (オンライン証明書状態プロトコル) 応答コンテキストを取得する。

[戻り値]
関数が成功した場合、CERT_SERVER_OCSP_RESPONSE_CONTEXT
構造体へのポインターを返す。応答が時刻的に有効であるためには、本関数呼び出しをホストしているシステムの現在時刻が、証明書失効リスト
(CRL) コンテキストの次回更新時刻より前でなければならない。時刻的に有効な OCSP 応答が利用できない場合、本関数は NULL
を返し、GetLastError は CRYPT_E_REVOCATION_OFFLINE を返す。OCSP
レスポンダーにとって証明書が未知の場合も、本関数は NULL を返し、GetLastError は
CRYPT_E_REVOCATION_OFFLINE を返す。

[備考]
CertGetServerOcspResponseContext 関数を使用して OCSP
応答コンテキストへの参照を複数作成する場合、CertAddRefServerOcspResponseContext を呼び出して
CERT_SERVER_OCSP_RESPONSE_CONTEXT
構造体の参照カウントを増やさなければならない。構造体の使用を終えたら、CertFreeServerOcspResponseContext
関数を呼び出して解放する必要がある。


%index
CertGetStoreProperty
ストアプロパティを取得する。
%prm
hCertStore, dwPropId, pvData, pcbData
hCertStore : [int] オープン済み証明書ストアのハンドル。
dwPropId : [int] 一連のストアプロパティのうち、いずれかを示す。事前定義されたストアプロパティは CERT_STORE_LOCALIZED_NAME_PROP_ID (ストアのローカライズ名) の一つである。ユーザー定義プロパティは事前定義のコンテキストプロパティの現在の値範囲の外でなければならない。現在、ユーザー定義の dwPropId 値は 4096 から開始する。
pvData : [intptr] dwPropId によって決まるデータを受け取るバッファーへのポインター。CERT_STORE_LOCALIZED_NAME_PROP_ID の場合、これはストアのローカライズ名となり、pvData は NULL 終端の Unicode ワイド文字列を指す。その他の dwPropId の場合、pvData はバイト配列を指す。このパラメーターを NULL に設定すると、メモリ割り当て用に情報サイズを取得できる。詳細は「長さ不明のデータの取得」を参照。
pcbData : [var] pvData バッファーのサイズをバイト単位で指定する DWORD 値へのポインター。関数から戻ると、DWORD 値はバッファーに格納されたバイト数を含む。
%inst
ストアプロパティを取得する。

[戻り値]
関数が成功した場合、0 以外を返す。関数が失敗した場合、0 を返す。ストアプロパティが見つかった場合、関数は 0 以外を返し、pvData
はプロパティを指し、pcbData は文字列長を指す。ストアプロパティが見つからない場合、関数は 0 を返し、GetLastError は
CRYPT_E_NOT_FOUND を返す。

[備考]
ストアプロパティ識別子はストア全体に適用されるプロパティである。個々の証明書、CRL、CTL
コンテキストに対するプロパティではない。現在、ストアプロパティは永続化されない。ストアのローカライズ名を取得するには、CryptFindLocalizedName
関数を使用することもできる。


%index
CertGetSubjectCertificateFromStore
発行者とシリアル番号によって一意に識別されるサブジェクト証明書コンテキストを、証明書ストアから返す。
%prm
hCertStore, dwCertEncodingType, pCertId
hCertStore : [int] 証明書ストアのハンドル。
dwCertEncodingType : [int] 使用するエンコーディング種別。次の例のように証明書エンコーディングとメッセージエンコーディングをビット単位 OR で組み合わせて指定することも常に許容される: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING 現在定義されているエンコーディング種別は次のとおり。
pCertId : [var] CERT_INFO 構造体へのポインター。Issuer メンバーと SerialNumber メンバーのみが使用される。
%inst
発行者とシリアル番号によって一意に識別されるサブジェクト証明書コンテキストを、証明書ストアから返す。

[戻り値]
関数が成功した場合、読み取り専用の CERT_CONTEXT へのポインターを返す。CERT_CONTEXT は
CertFreeCertificateContext
を呼び出して解放しなければならない。返される証明書は有効であるとは限らない。通常は発行者証明書を取得する際
(CertGetIssuerCertificateFromStore) に検証される。拡張エラー情報を取得するには
GetLastError を呼び出す。考えられるエラーコードを以下に示す。
（以下省略）

[備考]
CertDuplicateCertificateContext を呼び出すと、証明書の複製を作成できる。


%index
CertGetValidUsages
証明書配列内の全証明書の有効用途の積集合となる用途の配列を返す。
%prm
cCerts, rghCerts, cNumOIDs, rghOIDs, pcbOIDs
cCerts : [int] 確認対象の配列に含まれる証明書数。
rghCerts : [var] 有効用途を確認する対象の証明書配列。
cNumOIDs : [var] 配列中の全証明書の有効用途の積集合として得られた有効用途の数。配列中の全証明書が全用途で有効な場合、cNumOIDs は -1 に設定される。
rghOIDs : [var] rghCerts 配列中の全証明書で共有される有効用途のオブジェクト識別子 (OID) の配列。このパラメーターを NULL に設定すると、メモリ割り当て用にこの構造体のサイズを取得できる。詳細は「長さ不明のデータの取得」を参照。
pcbOIDs : [var] rghOIDs 配列および指し示される文字列のサイズをバイト単位で指定する DWORD 値へのポインター。関数から戻ると、DWORD 値は配列に必要なバイト数を含む。
%inst
証明書配列内の全証明書の有効用途の積集合となる用途の配列を返す。

[戻り値]
関数が成功した場合、戻り値は 0 以外となる。関数が失敗した場合、戻り値は 0 となる。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
CertIsRDNAttrsInCertificateName
CertIsRDNAttrsInCertificateName 関数は、証明書名の属性と指定した CERT_RDN を比較し、すべての属性がその中に含まれているかを判定する。
%prm
dwCertEncodingType, dwFlags, pCertName, pRDN
dwCertEncodingType : [int] 使用するエンコーディング種別を指定する。次の例のように証明書エンコーディングとメッセージエンコーディングをビット単位 OR で組み合わせて指定することも常に許容される: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING 現在定義されているエンコーディング種別は次のとおり。
dwFlags : [int] pRDN が lpszStructType を X509_UNICODE_NAME に設定した CryptEncodeObject のように Unicode 文字列で初期化されている場合、CERT_UNICODE_IS_RDN_ATTRS_FLAG を設定しなければならない。大文字小文字を区別しない照合を行うには CERT_CASE_INSENSITIVE_IS_RDN_ATTRS_FLAG を設定する。それ以外の場合は、完全一致かつ大文字小文字を区別する照合が行われる。
pCertName : [var] エンコードされたサブジェクト名または発行者名を含む CRYPT_INTEGER_BLOB へのポインター。
pRDN : [var] 名前の中で検索する属性を含む CERT_RDN 構造体の配列。CERT_RDN 構造体の CERT_RDN_ATTR メンバーは次の規則に従って動作する。
%inst
CertIsRDNAttrsInCertificateName 関数は、証明書名の属性と指定した CERT_RDN
を比較し、すべての属性がその中に含まれているかを判定する。

[戻り値]
関数が成功し、指定した CERT_RDN 内のすべての RDN 値が証明書名に含まれている場合、戻り値は 0 以外 (TRUE)
となる。関数が失敗した場合、または指定した CERT_RDN 内の RDN 値のうち証明書名に含まれないものがある場合、戻り値は 0
(FALSE) となる。拡張エラー情報を取得するには GetLastError を呼び出す。考えられるエラーコードを次の表に示す。
（以下省略）

[備考]
現在、完全一致かつ大文字小文字を区別する照合のみがサポートされている。


%index
CertIsStrongHashToSign
指定したハッシュアルゴリズムと署名証明書の公開鍵が、強い署名 (strong signing) に使用可能であるかを判定する。
%prm
pStrongSignPara, pwszCNGHashAlgid, pSigningCert
pStrongSignPara : [var] サポートされる署名およびハッシュアルゴリズムに関する情報を含む CERT_STRONG_SIGN_PARA 構造体へのポインター。
pwszCNGHashAlgid : [wstr] ハッシュアルゴリズム名を含む Unicode 文字列へのポインター。サポートされているアルゴリズムは次のとおり。
pSigningCert : [var] 署名証明書を含む CERT_CONTEXT 構造体へのポインター。署名証明書内の公開鍵アルゴリズムの強度がチェックされる。公開鍵 (非対称) アルゴリズムは署名に使用される。サポートされている署名アルゴリズムは次のとおり。
%inst
指定したハッシュアルゴリズムと署名証明書の公開鍵が、強い署名 (strong signing) に使用可能であるかを判定する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。この関数は次のエラーコードを返す。
（以下省略）


%index
CertIsValidCRLForCertificate
CertIsValidCRLForCertificate 関数は、特定の証明書が失効していた場合にそれを含み得る CRL かどうかを確認する。
%prm
pCert, pCrl, dwFlags, pvReserved
pCert : [var] 証明書コンテキストへのポインター。
pCrl : [var] CRL へのポインター。関数はこの CRL を調べ、pCert が指す証明書コンテキストを含み得るかを判定する。CRL 内に実際にその証明書が存在するかどうかは確認しない。
dwFlags : [int] 現在は使用されておらず、0 に設定しなければならない。
pvReserved : [intptr] 現在は使用されておらず、NULL に設定しなければならない。
%inst
CertIsValidCRLForCertificate 関数は、特定の証明書が失効していた場合にそれを含み得る CRL
かどうかを確認する。

[戻り値]
関数は、指定の証明書を検索する対象として CRL が有効な場合は TRUE を、有効でない場合は FALSE を返す。

[備考]
CRL が証明書に対して有効であるために、CertIsValidCRLForCertificate 関数は、CRL
が証明書の発行者と同じ認証局 (CA) により発行されていることを要求しない。


%index
CertIsWeakHash
(no summary)
%prm
dwHashUseType, pwszCNGHashAlgid, dwChainFlags, pSignerChainContext, pTimeStamp, pwszFileName
dwHashUseType : [int] 
pwszCNGHashAlgid : [wstr] 
dwChainFlags : [int] 
pSignerChainContext : [var] 
pTimeStamp : [var] 
pwszFileName : [wstr] 
%inst



%index
CertNameToStrW
CERT_NAME_BLOB 構造体内のエンコード済み名前を NULL 終端文字列に変換する。(Unicode)
%prm
dwCertEncodingType, pName, dwStrType, psz, csz
dwCertEncodingType : [int] 名前のエンコードに使用された証明書エンコーディング種別。この値の上位 WORD に含まれるメッセージエンコーディング種別識別子は、本関数では無視される。
pName : [var] 変換対象の CERT_NAME_BLOB 構造体へのポインター。
dwStrType : [int] このパラメーターは出力文字列のフォーマットを指定する。また、文字列の内容に関する他のオプションも指定する。
psz : [wstr] 返される文字列を受け取る文字バッファーへのポインター。このバッファーのサイズは csz パラメーターで指定する。
csz : [int] psz バッファーのサイズ (文字数)。サイズには終端の NULL 文字を含める必要がある。
%inst
CERT_NAME_BLOB 構造体内のエンコード済み名前を NULL 終端文字列に変換する。(Unicode)

[戻り値]
終端の NULL 文字を含む変換された文字数を返す。psz が NULL または csz が 0 の場合、必要な出力文字列サイズを返す。

[備考]
psz が NULL でなく csz が 0 でない場合、返される psz は常に NULL
終端文字列となる。デコード時の順序問題を避けるため、マルチコンポーネント RDN (例: CN=James+O=Microsoft)
の使用は推奨されない。代わりに単一値 RDN (例: CN=James, O=Microsoft) の使用を検討すること。文字列表現は
RFC 1779 の識別名仕様に従うが、次の一覧に記載した点が異なる。
（以下省略）


%index
CertOIDToAlgId
ALG_ID 識別子は CNG でサポートされなくなったため、本関数の代わりに CryptFindOIDInfo 関数を使用すること。
%prm
pszObjId
pszObjId : [str] アルゴリズム識別子に変換する ASN.1 OID へのポインター。
%inst
ALG_ID 識別子は CNG でサポートされなくなったため、本関数の代わりに CryptFindOIDInfo 関数を使用すること。

[戻り値]
オブジェクト識別子 (OID) に対応する ALG_ID を返す。OID に対応する ALG_ID がない場合は 0 を返す。


%index
CertOpenServerOcspResponse
サーバー証明書チェーンに関連付けられた OCSP (オンライン証明書状態プロトコル) 応答へのハンドルを開く。
%prm
pChainContext, dwFlags, pOpenPara
pChainContext : [var] 証明書チェーンを含む CERT_CHAIN_CONTEXT 構造体のアドレス。
dwFlags : [int] このパラメーターは使用されておらず、0 でなければならない。
pOpenPara : [var] このパラメーターは使用されておらず、NULL でなければならない。
%inst
サーバー証明書チェーンに関連付けられた OCSP (オンライン証明書状態プロトコル) 応答へのハンドルを開く。

[戻り値]
成功した場合、サーバー証明書チェーンに関連付けられた OCSP 応答へのハンドルを返す。失敗した場合、NULL
を返す。このハンドルが不要になったら CertCloseServerOcspResponse
関数に渡さなければならない。拡張エラー情報を取得するには GetLastError を呼び出す。GetLastError
関数が返す可能性のあるエラーコードには、以下を含むが、これらに限定されない。
（以下省略）

[備考]
CertOpenServerOcspResponse 関数は、戻る前に初期 OCSP
応答の取得を試みる。その取得の間、プロセススレッドはブロックされる。CertOpenServerOcspResponse
関数は、時刻的に有効な OCSP
応答を事前取得するバックグラウンドスレッドを作成する。CertOpenServerOcspResponse 関数は
pChainContext
パラメーターが表すチェーンコンテキストの参照カウントを増やす。チェーンコンテキストの使用を終えたら、CertCloseServerOcspResponse
関数を呼び出して返されたハンドルを閉じる。CertOpenServerOcspResponse
関数は次の関数で使用する構成設定を初期化する。
（以下省略）


%index
CertOpenStore
指定したストアプロバイダー種別を使用して証明書ストアを開く。
%prm
lpszStoreProvider, dwEncodingType, hCryptProv, dwFlags, pvPara
lpszStoreProvider : [str] ストアプロバイダー種別を含む NULL 終端 ANSI 文字列へのポインター。次の値が事前定義されたストア種別を表す。ストアプロバイダー種別により、pvPara パラメーターの内容、および dwFlags パラメーターの上位ワードの用途と意味が決まる。追加のストアプロバイダーは CryptInstallOIDFunctionAddress または CryptRegisterOIDFunction 関数でインストール/登録できる。ストアプロバイダーの追加について詳しくは「CertOpenStore 機能の拡張」を参照。
dwEncodingType : [int] 証明書エンコーディング種別およびメッセージエンコーディング種別を指定する。このエンコーディングは、CertSaveStore 関数の dwSaveAs パラメーターに CERT_STORE_SAVE_AS_PKCS7 を指定した場合にのみ使用される。それ以外の場合、dwMsgAndCertEncodingType パラメーターは使用されない。このパラメーターは lpszStoreProvider パラメーターに CERT_STORE_PROV_MSG、CERT_STORE_PROV_PKCS7、または CERT_STORE_PROV_FILENAME プロバイダー種別を指定した場合にのみ有効である。それ以外のプロバイダー種別では使用されず、0 に設定すべきである。
hCryptProv : [int] このパラメーターは使用されておらず、NULL に設定すべきである。Windows Server 2003 および Windows XP: 暗号化プロバイダーへのハンドル。このパラメーターに NULL を渡すと、適切な既定のプロバイダーが使用される。既定のプロバイダーの使用を推奨する。既定または指定された暗号化プロバイダーは、サブジェクト証明書または CRL の署名を検証するすべてのストア関数で使用される。このパラメーターのデータ型は HCRYPTPROV である。
dwFlags : [int] これらの値は、上位ワードと下位ワードの値をビット単位 OR で組み合わせて構成する。
pvPara : [intptr] 本関数に対する追加情報を含めることができる 32 ビット値。このパラメーターの内容は lpszStoreProvider などの他のパラメーターの値に依存する。
%inst
指定したストアプロバイダー種別を使用して証明書ストアを開く。

[戻り値]
関数が成功した場合、証明書ストアへのハンドルを返す。ストアの使用を終えたら、CertCloseStore
関数を呼び出してハンドルを解放する。関数が失敗した場合、NULL を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。
注意:
CreateFile、ReadFile、またはレジストリのエラーが伝播し、そのエラーコードが返されることがある。CertOpenStore
固有のエラーコードとして ERROR_FILE_NOT_FOUND があり、これは lpszStoreProvider
パラメーターで指定したプロバイダーが見つからなかったことを示す。

[備考]
システムストアは 1
つ以上の物理的な兄弟ストアから成るコレクションである。各システムストアには事前定義された物理兄弟ストアがある。CERT_SYSTEM_STORE_CURRENT_USER
の "My" などのシステムストアを開いた後、CertOpenStore
が呼び出され、システムストアコレクション内のすべての物理ストアが開かれる。これらの物理ストアは
CertAddStoreToCollection
関数を用いてシステムストアコレクションに追加される。これらの物理ストア内のすべての証明書、CRL、CTL
は、論理的なシステムストアコレクションを通じて利用可能となる。注意:
証明書コンテキストの順序はストア内で保持されない場合がある。特定の証明書にアクセスするには、ストア内の証明書を反復処理しなければならない。次のシステムストアの場所はリモートから開くことができる。
（以下省略）


%index
CertOpenSystemStoreW
最も一般的なシステム証明書ストアを開く。ファイルベースやメモリベースのストアなどより複雑なストアには CertOpenStore を使用する。(Unicode)
%prm
hProv, szSubsystemProtocol
hProv : [int] 使用されない。0 を指定すること。Windows Server 2003 および Windows XP: CSP のハンドル。0 で既定 CSP を使用。0 でない場合は CryptAcquireContext で作成した CSP ハンドルでなければならない。データ型は HCRYPTPROV。
szSubsystemProtocol : [wstr] システムストア名を表す文字列。既存のシステムストア名でない場合は新規作成される。既存システムストア名の一覧は CertEnumSystemStore で取得できる。代表例は以下の表参照。
%inst
最も一般的なシステム証明書ストアを開く。ファイルベースやメモリベースのストアなどより複雑なストアには CertOpenStore
を使用する。(Unicode)

[戻り値]
成功時は証明書ストアのハンドルを返す。失敗時は NULL を返す。拡張エラー情報は GetLastError
で取得する。CertOpenStore のエラーがそのまま伝播される。

[備考]

この方法でアクセスできるのはカレントユーザーの証明書のみで、ローカルマシンストアにはアクセスできない。オープン後は標準の証明書ストア関数で操作できる。使用後は
CertCloseStore で閉じる。自動移行されるストアについては Certificate Store Migration を参照。


%index
CertRDNValueToStrW
CertRDNValueToStr 関数は、CERT_RDN_VALUE_BLOB 内の名前を NULL 終端文字列に変換する。(Unicode)
%prm
dwValueType, pValue, psz, csz
dwValueType : [int] 変換する RDN 値の種類を示す。
pValue : [var] dwValueType に対応する型の CERT_RDN_VALUE_BLOB へのポインター。
psz : [wstr] 返される文字列を受け取るバッファーへのポインター。
csz : [int] 返される文字列のために確保した領域のサイズ (文字数)。サイズには終端の NULL 文字を含める必要がある。
%inst
CertRDNValueToStr 関数は、CERT_RDN_VALUE_BLOB 内の名前を NULL
終端文字列に変換する。(Unicode)

[戻り値]
終端の NULL 文字を含む変換された文字数を返す。psz が NULL または csz が 0 の場合、必要な出力文字列サイズを返す。

[備考]
psz が NULL でなく csz が 0 でない場合、返される psz は常に (場合によっては空の) NULL 終端文字列となる。
> [!NOTE] > wincrypt.h ヘッダーでは CertRDNValueToStr
をエイリアスとして定義しており、UNICODE プリプロセッサ定数の定義に基づき、本関数の ANSI 版または Unicode
版を自動的に選択する。エンコーディング非依存のエイリアスをエンコーディング非依存でないコードと混在して使用すると、不整合によりコンパイルエラーや実行時エラーが発生することがある。詳細は
[関数プロトタイプの規約](/windows/win32/intl/conventions-for-function-prototypes)
を参照。


%index
CertRegisterPhysicalStore
レジストリのシステムストアコレクションに物理ストアを追加する。
%prm
pvSystemStore, dwFlags, pwszStoreName, pStoreInfo, pvReserved
pvSystemStore : [intptr] 物理ストアを追加するシステムストアコレクション。このパラメーターは NULL 終端の Unicode 文字列または CERT_SYSTEM_STORE_RELOCATE_PARA 構造体のいずれかを指す。構造体の使用方法、およびシステムストア名文字列の前への ServiceName や ComputerName の付加方法については、CertRegisterSystemStore を参照。
dwFlags : [int] dwFlags パラメーターの上位ワードはシステムストアの場所を指定する。定義されている上位ワードフラグ、およびシステムストア名の末尾への ServiceName、UserNames、ComputerNames の付加方法については、CertRegisterSystemStore を参照。
pwszStoreName : [wstr] システムストアコレクションに追加する物理ストアの名前を示す Unicode 文字列へのポインター。システムストアコレクションから物理ストアを削除するには、CertUnregisterPhysicalStore 関数を呼び出す。
pStoreInfo : [var] 物理ストアに関する基本情報を提供する CERT_PHYSICAL_STORE_INFO 構造体へのポインター。
pvReserved : [intptr] 将来の使用のため予約されており、NULL に設定しなければならない。
%inst
レジストリのシステムストアコレクションに物理ストアを追加する。

[戻り値]
関数が成功した場合、0 以外を返す。関数が失敗した場合、0 を返す。


%index
CertRegisterSystemStore
システムストアを登録する。
%prm
pvSystemStore, dwFlags, pStoreInfo, pvReserved
pvSystemStore : [intptr] 登録するシステムストアを識別する。dwFlags に CERT_SYSTEM_STORE_RELOCATE_FLAG が設定されている場合、pvSystemStore は CERT_SYSTEM_STORE_RELOCATE_PARA 構造体を指す。それ以外の場合、システムストア名の NULL 終端 Unicode 文字列を指す。
dwFlags : [int] dwFlags パラメーターの上位ワードはシステムストアの場所を指定するために使用する。
pStoreInfo : [var] 将来の使用のため予約されており、NULL に設定しなければならない。
pvReserved : [intptr] 将来の使用のため予約されており、NULL に設定しなければならない。
%inst
システムストアを登録する。

[戻り値]
関数が成功した場合、0 以外を返す。関数が失敗した場合、0 を返す。

[備考]
この関数で登録したシステムストアを登録解除するには、CertUnregisterSystemStore を呼び出す。


%index
CertRemoveEnhancedKeyUsageIdentifier
CertRemoveEnhancedKeyUsageIdentifier 関数は、証明書の拡張キー使用法 (EKU) 拡張プロパティから用途識別子オブジェクト識別子 (OID) を削除する。
%prm
pCertContext, pszUsageIdentifier
pCertContext : [var] 用途識別子 OID を削除する対象の証明書の CERT_CONTEXT へのポインター。
pszUsageIdentifier : [str] 削除する用途識別子 OID へのポインター。
%inst
CertRemoveEnhancedKeyUsageIdentifier 関数は、証明書の拡張キー使用法 (EKU)
拡張プロパティから用途識別子オブジェクト識別子 (OID) を削除する。

[戻り値]
関数が成功した場合、0 以外 (TRUE) を返す。関数が失敗した場合、0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
CertRemoveStoreFromCollection
コレクションストアから兄弟証明書ストアを削除する。
%prm
hCollectionStore, hSiblingStore
hCollectionStore : [int] コレクション証明書ストアのハンドル。
hSiblingStore : [int] コレクションストアから削除する兄弟証明書ストアのハンドル。
%inst
コレクションストアから兄弟証明書ストアを削除する。


%index
CertResyncCertificateChainEngine
証明書チェーンエンジンを再同期し、そのエンジンが参照するストアを再同期し、エンジンキャッシュを更新する。
%prm
hChainEngine
hChainEngine : [intptr] 再同期するチェーンエンジン。
%inst
証明書チェーンエンジンを再同期し、そのエンジンが参照するストアを再同期し、エンジンキャッシュを更新する。

[戻り値]
関数が成功した場合、0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
CertRetrieveLogoOrBiometricInfo
szOID_LOGOTYPE_EXT または szOID_BIOMETRIC_EXT 証明書拡張で指定されたロゴまたは生体情報を URL 経由で取得する。
%prm
pCertContext, lpszLogoOrBiometricType, dwRetrievalFlags, dwTimeout, dwFlags, pvReserved, ppbData, pcbData, ppwszMimeType
pCertContext : [var] 証明書を含む CERT_CONTEXT 構造体のアドレス。
lpszLogoOrBiometricType : [str] 取得する情報の種類を識別するオブジェクト識別子 (OID) 文字列を含む NULL 終端 ANSI 文字列のアドレス。
dwRetrievalFlags : [int] 情報取得方法を指定するフラグの集合。このパラメーターは CryptRetrieveObjectByUrl 関数の dwRetrievalFlags として渡される。
dwTimeout : [int] 取得を待機する最大時間 (ミリ秒単位)。
dwFlags : [int] このパラメーターは使用されておらず、0 でなければならない。
pvReserved : [intptr] このパラメーターは使用されておらず、NULL でなければならない。
ppbData : [var] ロゴタイプまたは生体データを受け取る BYTE ポインターのアドレス。不要になったら、このポインターを CryptMemFree 関数に渡してメモリを解放しなければならない。
pcbData : [var] ppbData バッファーのバイト数を受け取る DWORD 変数のアドレス。
ppwszMimeType : [var] データの MIME (Multipurpose Internet Mail Extensions) 種別を受け取る NULL 終端 Unicode 文字列へのポインターのアドレス。この情報が不要な場合は NULL を指定できる。不要になったら、このポインターを CryptMemFree 関数に渡してメモリを解放しなければならない。生体種別の場合、このアドレスには常に NULL が格納される。メモリにアクセスする前に、このパラメーターに有効なメモリアドレスが入っていることを必ず確認すること。
%inst
szOID_LOGOTYPE_EXT または szOID_BIOMETRIC_EXT 証明書拡張で指定されたロゴまたは生体情報を URL
経由で取得する。

[戻り値]
成功した場合は 0 以外を、それ以外の場合は 0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。GetLastError 関数が返す可能性のあるエラーコードには、以下を含むが、これらに限定されない。
（以下省略）


%index
CertSaveStore
証明書ストアをファイルまたはメモリ BLOB に保存する。
%prm
hCertStore, dwEncodingType, dwSaveAs, dwSaveTo, pvSaveToPara, dwFlags
hCertStore : [int] 保存する証明書ストアのハンドル。
dwEncodingType : [int] 証明書エンコーディング種別およびメッセージエンコーディング種別を指定する。このエンコーディングは dwSaveAs に CERT_STORE_SAVE_AS_PKCS7 を指定した場合にのみ使用される。それ以外の場合、dwMsgAndCertEncodingType パラメーターは使用されない。
dwSaveAs : [int] 証明書ストアの保存形式を指定する。
dwSaveTo : [int] 証明書ストアの保存先と保存方法を指定する。このパラメーターの内容により pvSaveToPara パラメーターの形式が決まる。
pvSaveToPara : [intptr] ストアの保存先を表すポインター。このパラメーターの内容は dwSaveTo パラメーターの値に依存する。
dwFlags : [int] このパラメーターは将来の使用のため予約されており、0 に設定しなければならない。
%inst
証明書ストアをファイルまたはメモリ BLOB に保存する。

[戻り値]
関数が成功した場合、0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。CreateFile や WriteFile のエラーが本関数に伝播することがある。考えられるエラーコードの一つに
CRYPT_E_FILE_ERROR があり、これはファイルへの書き込み中にエラーが発生したことを示す。


%index
CertSelectCertificateChains
指定した選択条件に基づいて証明書チェーンを取得する。
%prm
pSelectionContext, dwFlags, pChainParameters, cCriteria, rgpCriteria, hStore, pcSelection, pprgpSelection
pSelectionContext : [var] この呼び出しで使用する証明書選択シナリオの GUID へのポインター。
dwFlags : [int] 証明書選択処理を制御するフラグ。このパラメーターには次のフラグを 0 個以上組み合わせて指定できる。
pChainParameters : [var] チェーン構築パラメーターを指定する CERT_SELECT_CHAIN_PARA 構造体へのポインター。NULL の場合、既定のパラメーターが使用される。CERT_SELECT_CHAIN_PARA 構造体の pChainPara メンバーは、強い署名を有効化するために使用できる CERT_CHAIN_PARA 構造体を指す。
cCriteria : [int] rgpCriteria 配列の要素数。
rgpCriteria : [var] 選択条件を定義する CERT_SELECT_CRITERIA 構造体の配列へのポインター。このパラメーターを NULL に設定する場合、cCriteria パラメーターの値は 0 でなければならない。
hStore : [int] 証明書を選択する元となるストアのハンドル。
pcSelection : [var] pprgpSelection パラメーターが指す配列の要素数を受け取る DWORD 値へのポインター。
pprgpSelection : [var] CERT_CHAIN_CONTEXT 構造体の配列を受け取る場所へのポインターのポインター。CertSelectCertificateChains 関数は、すべての選択条件に合致する証明書チェーンのみを返す。配列の要素は品質順に並び、品質の最も高いチェーンが先頭となる。配列用のメモリは CertSelectCertificateChains 関数が確保する。割り当てたメモリを解放するには、まず配列内の各チェーンコンテキストを CertFreeCertificateChain 関数で解放し、その後 CertFreeCertificateChainList 関数でメモリを解放しなければならない。
%inst
指定した選択条件に基づいて証明書チェーンを取得する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は 0 (FALSE) となる。拡張エラー情報を取得するには
GetLastError 関数を呼び出す。
注意: 選択結果が 0 件となった場合でも、CertSelectCertificateChains 関数は TRUE
を返すが、pcSelection パラメーターが指す値は 0 に設定される。

[備考]
選択条件は dwFlags パラメーター、rgpCriteria
パラメーター、あるいはその両方で指定できる。選択条件を指定しない場合、関数は成功し、hStore
パラメーターで指定したストア内の全証明書についての証明書チェーンを返す。
選択された証明書チェーンは、次の優先順位ロジックに基づいて並べられる。
（以下省略）


%index
CertSerializeCRLStoreElement
CertSerializeCRLStoreElement 関数は、エンコードされた CRL (証明書失効リスト) コンテキストと、そのプロパティのエンコード表現をシリアル化する。
%prm
pCrlContext, dwFlags, pbElement, pcbElement
pCrlContext : [var] シリアル化する CRL_CONTEXT 構造体へのポインター。
dwFlags : [int] 将来の使用のため予約されており、0 でなければならない。
pbElement : [var] シリアル化された出力 (エンコード済み CRL およびそのプロパティを含む可能性あり) を受け取るバッファーへのポインター。
pcbElement : [var] pbElement パラメーターが指すバッファーのサイズをバイト単位で指定する DWORD 値へのポインター。関数から戻ると、DWORD 値はバッファーに格納されたバイト数を含む。
%inst
CertSerializeCRLStoreElement 関数は、エンコードされた CRL (証明書失効リスト)
コンテキストと、そのプロパティのエンコード表現をシリアル化する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
CertSerializeCTLStoreElement
CertSerializeCTLStoreElement 関数は、エンコードされた CTL (証明書信頼リスト) コンテキストと、そのプロパティのエンコード表現をシリアル化する。結果はストレージに永続化でき、後で CTL とプロパティを取得できる。
%prm
pCtlContext, dwFlags, pbElement, pcbElement
pCtlContext : [var] シリアル化する CTL_CONTEXT 構造体へのポインター。
dwFlags : [int] 将来の使用のため予約されており、0 でなければならない。
pbElement : [var] シリアル化された出力 (エンコード済み CTL およびそのプロパティを含む可能性あり) を受け取るバッファーへのポインター。
pcbElement : [var] pbElement パラメーターが指すバッファーのサイズをバイト単位で指定する DWORD 値へのポインター。関数から戻ると、DWORD 値はバッファーに格納されたバイト数を含む。
%inst
CertSerializeCTLStoreElement 関数は、エンコードされた CTL (証明書信頼リスト)
コンテキストと、そのプロパティのエンコード表現をシリアル化する。結果はストレージに永続化でき、後で CTL とプロパティを取得できる。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
CertSerializeCertificateStoreElement
CertSerializeCertificateStoreElement 関数は、証明書コンテキストのエンコード済み証明書とそのエンコード済みプロパティをシリアル化する。結果はストレージに永続化でき、後で証明書とプロパティを取得できる。
%prm
pCertContext, dwFlags, pbElement, pcbElement
pCertContext : [var] シリアル化する CERT_CONTEXT へのポインター。
dwFlags : [int] 将来の使用のため予約されており、0 でなければならない。
pbElement : [var] シリアル化された出力 (エンコード済み証明書およびそのプロパティを含む可能性あり) を受け取るバッファーへのポインター。
pcbElement : [var] pbElement パラメーターが指すバッファーのサイズをバイト単位で指定する DWORD 値へのポインター。関数から戻ると、DWORD 値はバッファーに格納されたバイト数を含む。
%inst
CertSerializeCertificateStoreElement
関数は、証明書コンテキストのエンコード済み証明書とそのエンコード済みプロパティをシリアル化する。結果はストレージに永続化でき、後で証明書とプロパティを取得できる。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
CertSetCRLContextProperty
指定した証明書失効リスト (CRL) コンテキストに拡張プロパティを設定する。
%prm
pCrlContext, dwPropId, dwFlags, pvData
pCrlContext : [var] CRL_CONTEXT 構造体へのポインター。
dwPropId : [int] 設定するプロパティを識別する。dwPropId の値により pvData パラメーターの型と内容が決まる。現在定義されている識別子と pvData に返されるデータ型を次の表に示す。
dwFlags : [int] CERT_KEY_PROV_HANDLE_PROP_ID または CERT_KEY_CONTEXT_PROP_ID の dwPropId プロパティに対しては CERT_STORE_NO_CRYPT_RELEASE_FLAG を設定できる。
pvData : [intptr] dwPropId に渡される値によって決まる型のデータへのポインター。
%inst
指定した証明書失効リスト (CRL) コンテキストに拡張プロパティを設定する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。考えられるエラーコードの一つを以下に示す。
（以下省略）

[備考]
プロパティが既に存在する場合、その古い値は置き換えられる。


%index
CertSetCTLContextProperty
指定した証明書信頼リスト (CTL) コンテキストに拡張プロパティを設定する。
%prm
pCtlContext, dwPropId, dwFlags, pvData
pCtlContext : [var] CTL_CONTEXT 構造体へのポインター。
dwPropId : [int] 設定するプロパティを識別する。dwPropId の値により pvData パラメーターの型と内容が決まる。現在定義されている識別子と関連する pvData の型は次のとおり。
dwFlags : [int] CERT_KEY_PROV_HANDLE_PROP_ID または CERT_KEY_CONTEXT_PROP_ID の dwPropId プロパティに対しては CERT_STORE_NO_CRYPT_RELEASE_FLAG を設定できる。
pvData : [intptr] dwPropId に渡される値によって決まる型のデータへのポインター。
%inst
指定した証明書信頼リスト (CTL) コンテキストに拡張プロパティを設定する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。考えられるエラーコードの一つを以下に示す。
（以下省略）

[備考]
プロパティが既に存在する場合、その古い値は置き換えられる。


%index
CertSetCertificateContextPropertiesFromCTLEntry
指定した証明書信頼リスト (CTL) エントリー内の属性を使用して、証明書コンテキストにプロパティを設定する。
%prm
pCertContext, pCtlEntry, dwFlags
pCertContext : [var] 属性を設定する対象の CERT_CONTEXT へのポインター。
pCtlEntry : [var] 証明書に属性を設定するために使用する CTL_ENTRY 構造体へのポインター。
dwFlags : [int] DWORD 値。このパラメーターに CERT_SET_PROPERTY_IGNORE_PERSIST_ERROR_FLAG を指定すると、永続化された任意のエラーフラグを無視する。
%inst
指定した証明書信頼リスト (CTL) エントリー内の属性を使用して、証明書コンテキストにプロパティを設定する。

[戻り値]
関数が成功した場合、0 以外を返す。関数が失敗した場合、0 を返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
CertSetCertificateContextProperty
指定した証明書コンテキストに拡張プロパティを設定する。
%prm
pCertContext, dwPropId, dwFlags, pvData
pCertContext : [var] CERT_CONTEXT 構造体へのポインター。
dwPropId : [int] 設定するプロパティ。dwPropId の値により pvData パラメーターの型と内容が決まる。現在定義されている識別子と関連する pvData の型は次のとおり。注意: CRYPT_HASH_BLOB と CRYPT_DATA_BLOB は CRYPT_INTEGER_BLOB の項で説明されている。
dwFlags : [int] CERT_KEY_PROV_HANDLE_PROP_ID または CERT_KEY_CONTEXT_PROP_ID の dwPropId プロパティに対しては CERT_STORE_NO_CRYPT_RELEASE_FLAG を設定できる。CERT_SET_PROPERTY_IGNORE_PERSIST_ERROR_FLAG を設定した場合、プロバイダー側の書き込みエラーは無視され、キャッシュされたコンテキストのプロパティは常に設定される。CERT_SET_PROPERTY_INHIBIT_PERSIST_FLAG を設定した場合、設定したコンテキストプロパティは永続化されない。
pvData : [intptr] dwPropId の値によって決まる型のデータへのポインター。注意: いずれの dwPropId についても、pvData を NULL に設定するとそのプロパティは削除される。
%inst
指定した証明書コンテキストに拡張プロパティを設定する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。拡張エラー情報を取得するには
GetLastError を呼び出す。考えられるエラーコードの一つを以下に示す。
（以下省略）

[備考]

プロパティが既に存在する場合、その古い値は置き換えられる。コードはマクロを用いて証明書コンテキストのハッシュクラスを評価できる。Wincrypt.h
ヘッダーはこの目的のため次のマクロを定義している。これらは CertSetCertificateContextProperty
関数の内部で使用される。IS_CERT_HASH_PROP_ID(X) IS_PUBKEY_HASH_PROP_ID(X)
IS_CHAIN_HASH_PROP_ID(X) 各マクロは dwPropId の値 (X)
を入力として受け取り、真偽値として評価される。各マクロに対して TRUE と評価される dwPropId の値を次の表に示す。
（以下省略）


%index
CertSetEnhancedKeyUsage
CertSetEnhancedKeyUsage 関数は、証明書の拡張キー使用法 (EKU) プロパティを設定する。
%prm
pCertContext, pUsage
pCertContext : [var] 指定した証明書の CERT_CONTEXT へのポインター。
pUsage : [var] 証明書の拡張プロパティとして設定する EKU オブジェクト識別子 (OID) の配列を含む CERT_ENHKEY_USAGE 構造体 (CTL_USAGE 構造体と等価) へのポインター。
%inst
CertSetEnhancedKeyUsage 関数は、証明書の拡張キー使用法 (EKU) プロパティを設定する。

[戻り値]
関数が成功した場合、0 以外 (TRUE) を返す。関数が失敗した場合、0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
CertSetStoreProperty
CertSetStoreProperty 関数は、ストアプロパティを設定する。
%prm
hCertStore, dwPropId, dwFlags, pvData
hCertStore : [int] 証明書ストアのハンドル。
dwPropId : [int] 一連のストアプロパティのうち、いずれかを示す。ユーザー定義プロパティの値は、事前定義のコンテキストプロパティの現在の値範囲の外でなければならない。現在、ユーザー定義の dwPropId 値は 4096 から開始する。事前定義されたストアプロパティは CERT_STORE_LOCALIZED_NAME_PROP_ID (ストアのローカライズ名) の一つである。
dwFlags : [int] 将来の使用のため予約されており、0 でなければならない。
pvData : [intptr] pvData の型定義は dwPropId の値に依存する。dwPropId が CERT_STORE_LOCALIZED_NAME_PROP_ID の場合、pvData は CRYPT_DATA_BLOB 構造体を指す。その構造体の pbData メンバーは NULL 終端 Unicode 文字列へのポインターであり、cbData メンバーは文字列長を保持する DWORD 値である。
%inst
CertSetStoreProperty 関数は、ストアプロパティを設定する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。

[備考]
ストアプロパティ識別子はストア全体に適用されるプロパティである。個々の証明書、CRL、CTL
コンテキストに対するプロパティではない。現在、ストアプロパティは永続化されない。


%index
CertStrToNameW
NULL 終端された X.500 文字列をエンコードされた証明書名に変換する。(Unicode)
%prm
dwCertEncodingType, pszX500, dwStrType, pvReserved, pbEncoded, pcbEncoded, ppszError
dwCertEncodingType : [int] 文字列のエンコードに使用された証明書エンコーディング種別。この値の上位 WORD に含まれるメッセージエンコーディング種別識別子は、本関数では無視される。
pszX500 : [wstr] 変換対象の NULL 終端 X.500 文字列へのポインター。この文字列の形式は dwStrType パラメーターで指定する。この文字列は CertNameToStr 関数の出力と同じ形式であることが想定される。
dwStrType : [int] 文字列の種別を指定する。また、文字列の内容に関する他のオプションも指定する。文字列種別指定子にフラグを組み合わせない場合、文字列では RDN (相対識別名) の区切り文字としてコンマ (,) またはセミコロン (;) を含めることができ、複数の RDN 値の区切りにはプラス記号 (+) を使用する。ダブルクォーテーション ("") がサポートされる。引用された値の中にクォーテーションを含めるには、2 組のクォーテーションを使用する (例: CN="User ""one""")。シャープ記号 (#) で始まる値は ASCII 16 進数として扱われ、CERT_RDN_OCTET_STRING に変換される。埋め込まれた空白は無視される。例えば 1.2.3 = # AB CD 01 は 1.2.3=#ABCD01 と同じである。キー、オブジェクト識別子、値を囲む空白は無視される。
pvReserved : [intptr] 将来の使用のため予約されており、NULL でなければならない。
pbEncoded : [var] エンコードされた構造体を受け取るバッファーへのポインター。
pcbEncoded : [var] DWORD へのポインター。関数を呼び出す前に、pbEncoded パラメーターが指すバッファーのサイズ (バイト単位) を格納する。関数から戻ると、DWORD はバッファーに格納されたバイト数を含む。pbEncoded が NULL の場合、DWORD は必要なバッファーサイズ (バイト単位) を受け取る。
ppszError : [var] 入力文字列が不正な場合に追加のエラー情報を受け取る文字列ポインターへのポインター。
%inst
NULL 終端された X.500 文字列をエンコードされた証明書名に変換する。(Unicode)

[戻り値]
成功した場合は 0 以外を、それ以外は 0 を返す。
拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
次の表には、サポートされる X.500 キー、対応するオブジェクト識別子文字列、文字列識別子 (Wincrypt.h
より)、および値型が示されている。
（以下省略）


%index
CertUnregisterPhysicalStore
CertUnregisterPhysicalStore 関数は、指定したシステムストアコレクションから物理ストアを削除する。CertUnregisterPhysicalStore は物理ストアの削除にも使用できる。
%prm
pvSystemStore, dwFlags, pwszStoreName
pvSystemStore : [intptr] 物理ストアを削除するシステムストアコレクションの識別子へのポインター。NULL 終端の Unicode 文字列または CERT_SYSTEM_STORE_RELOCATE_PARA 構造体のいずれかを指す。構造体の使用方法、およびシステムストア名文字列の末尾への ServiceName や ComputerName の付加方法については、CertRegisterSystemStore を参照。
dwFlags : [int] dwFlags パラメーターの上位ワードはシステムストアの場所を指定する。定義されている上位ワードフラグ、およびシステムストア名の末尾への ServiceName、UserNames、ComputerNames の付加方法については、CertRegisterSystemStore を参照。
pwszStoreName : [wstr] 物理ストア名を含む NULL 終端 Unicode 文字列。
%inst
CertUnregisterPhysicalStore
関数は、指定したシステムストアコレクションから物理ストアを削除する。CertUnregisterPhysicalStore
は物理ストアの削除にも使用できる。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。


%index
CertUnregisterSystemStore
CertUnregisterSystemStore 関数は、指定したシステムストアを登録解除する。
%prm
pvSystemStore, dwFlags
pvSystemStore : [intptr] 登録解除するシステムストアを識別する。NULL 終端の Unicode 文字列または CERT_SYSTEM_STORE_RELOCATE_PARA 構造体のいずれかを指す。構造体の使用方法、およびシステムストア名文字列の末尾への ServiceName や ComputerName の付加方法については、CertRegisterSystemStore を参照。
dwFlags : [int] dwFlags パラメーターの上位ワードはシステムストアの場所を指定する。定義されている上位ワードフラグ、およびシステムストア名の末尾への ServiceName、UserNames、ComputerNames の付加方法については、CertRegisterSystemStore を参照。
%inst
CertUnregisterSystemStore 関数は、指定したシステムストアを登録解除する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。


%index
CertVerifyCRLRevocation
証明書失効リスト (CRL) を調べ、サブジェクトの証明書が失効しているかどうかを判定する。
%prm
dwCertEncodingType, pCertId, cCrlInfo, rgpCrlInfo
dwCertEncodingType : [int] 使用するエンコーディング種別を指定する。次の例のように証明書エンコーディングとメッセージエンコーディングをビット単位 OR で組み合わせて指定することも常に許容される: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING 現在定義されているエンコーディング種別は次のとおり。
pCertId : [var] CRL と照合する証明書の CERT_INFO 構造体へのポインター。
cCrlInfo : [int] rgpCrlInfo 配列に含まれる CRL_INFO ポインターの数。
rgpCrlInfo : [var] CRL_INFO 構造体へのポインター配列。
%inst
証明書失効リスト (CRL) を調べ、サブジェクトの証明書が失効しているかどうかを判定する。

[戻り値]
証明書が CRL に載っておらず有効である場合は TRUE を返す。
証明書が CRL に載っており失効して無効である場合は FALSE を返す。


%index
CertVerifyCRLTimeValidity
CertVerifyCRLTimeValidity 関数は、CRL の時刻有効性を検証する。
%prm
pTimeToVerify, pCrlInfo
pTimeToVerify : [var] 検証に用いる時刻を含む FILETIME 構造体へのポインター。NULL に設定した場合、現在時刻が使用される。
pCrlInfo : [var] 時刻を検証する対象の CRL を含む CRL_INFO 構造体へのポインター。
%inst
CertVerifyCRLTimeValidity 関数は、CRL の時刻有効性を検証する。

[戻り値]
比較時刻が pCrlInfo が指す CRL_INFO の ThisUpdate メンバーより前の場合は -1 を返す。比較時刻が
NextUpdate より後の場合は +1 を返す。CRL にとって有効な時刻の場合は 0 を返す。


%index
CertVerifyCTLUsage
署名されており時刻的に有効な証明書信頼リスト (CTL) を検索し、サブジェクトを含む用途識別子を持つことを確認することで、サブジェクトが指定の用途について信頼されていることを検証する。
%prm
dwEncodingType, dwSubjectType, pvSubject, pSubjectUsage, dwFlags, pVerifyUsagePara, pVerifyUsageStatus
dwEncodingType : [int] 使用するエンコーディング種別を指定する。現在使用されているのは X509_ASN_ENCODING と PKCS_7_ASN_ENCODING のみであるが、将来エンコーディング種別が追加される可能性がある。現状のどちらのエンコーディングでも、
dwSubjectType : [int] dwSubjectType パラメーターが CTL_CERT_SUBJECT_TYPE の場合、pvSubject は CERT_CONTEXT 構造体を指す。構造体の SubjectAlgorithm メンバーを調べ、サブジェクトの識別情報の表現を判別する。当初は SubjectAlgorithm の値として SHA1 と MD5 ハッシュのみがサポートされる。対応するハッシュプロパティは CERT_CONTEXT 構造体から取得される。dwSubjectType パラメーターが CTL_ANY_SUBJECT_TYPE の場合、pvSubject は CTL_ANY_SUBJECT_INFO 構造体を指す。この構造体の SubjectAlgorithm メンバーは CTL のアルゴリズム種別と一致し、SubjectIdentifier メンバーは CTL エントリーのいずれかと一致しなければならない。dwSubjectType が上記いずれかの値に設定されている場合、dwEncodingType は使用されない。
pvSubject : [intptr] dwSubjectType パラメーターと組み合わせて使用する値。
pSubjectUsage : [var] サブジェクトの意図された用途を指定するための CTL_USAGE 構造体へのポインター。
dwFlags : [int] CERT_VERIFY_INHIBIT_CTL_UPDATE_FLAG が設定されていない場合、CTL_VERIFY_USAGE_PARA の rghCtlStore で指定したストアに含まれる時刻的に有効でない CTL は置き換えられうる。置き換えが行われた場合、pVerifyUsageStatus の dwFlags メンバーに CERT_VERIFY_UPDATED_CTL_FLAG が設定される。このフラグを設定している場合、ストア内の時刻的に有効でない CTL に対して時刻的に有効な更新 CTL を受信しても、更新は行われない。CERT_VERIFY_TRUSTED_SIGNERS_FLAG を設定している場合、署名者の検索は CTL_VERIFY_USAGE_PARA の rghSignerStore で指定した署名者ストアのみで行われる。設定していない場合、署名者ストアは署名者の証明書を探すための追加の参照先となる。詳細は「解説」を参照。CERT_VERIFY_NO_TIME_CHECK_FLAG を設定している場合、CTL の時刻有効性は確認されない。設定していない場合は確認される。CERT_VERIFY_ALLOW_MORE_USAGE_FLAG を設定している場合、CTL は pSubjectUsage で指定したもの以外の用途識別子を含んでいてもよい。設定していない場合、見つかる CTL は追加の用途識別子を含まない。
pVerifyUsagePara : [var] CTL の検索対象となるストアと、受け入れ可能な CTL 署名者を含むストアを指定する CTL_VERIFY_USAGE_PARA 構造体へのポインター。ListIdentifier メンバーを設定すると検索条件をさらに限定できる。
pVerifyUsageStatus : [var] CTL_VERIFY_USAGE_STATUS 構造体へのポインター。CertVerifyCTLUsage を呼び出す前に、構造体の cbSize メンバーに構造体のサイズ (バイト単位) を設定し、他のすべてのフィールドを 0 にしなければならない。詳細は CTL_VERIFY_USAGE_STATUS を参照。
%inst
署名されており時刻的に有効な証明書信頼リスト (CTL)
を検索し、サブジェクトを含む用途識別子を持つことを確認することで、サブジェクトが指定の用途について信頼されていることを検証する。

[戻り値]
サブジェクトが指定された用途について信頼されている場合は TRUE を返す。そうでない場合は FALSE を返す。GetLastError
は次のエラーコードのいずれかを返すことがある。
（以下省略）

[備考]
CertVerifyCTLUsage は、オブジェクト識別子 (OID)
によってインストール可能な関数へのディスパッチャーである。まず、pSubjectUsage が指す CTL_USAGE
構造体内の最初の用途 OID に一致する OID 関数の検出を試みる。失敗した場合、既定の CertDllVerifyCTLUsage
関数を使用する。Cryptnet.dll の CertDllVerifyCTLUsage 関数は OID
を通じてインストールでき、次のプロパティを持つ。
（以下省略）


%index
CertVerifyCertificateChainPolicy
証明書チェーンが有効であるかを検証する。指定された有効性ポリシー条件への準拠も含めて確認する。
%prm
pszPolicyOID, pChainContext, pPolicyPara, pPolicyStatus
pszPolicyOID : [str] 現在事前定義されているチェーン検証ポリシー構造を次の表に示す。
pChainContext : [var] 検証対象のチェーンを含む CERT_CHAIN_CONTEXT 構造体へのポインター。
pPolicyPara : [var] チェーンに対するポリシー検証条件を提供する CERT_CHAIN_POLICY_PARA 構造体へのポインター。この構造体の dwFlags メンバーを設定することで既定のポリシーチェック動作を変更できる。
pPolicyStatus : [var] チェーンの状態情報を返す CERT_CHAIN_POLICY_STATUS 構造体へのポインター。この構造体の pvExtraPolicyStatus メンバーには OID 固有の追加ステータスを返すことができる。
%inst
証明書チェーンが有効であるかを検証する。指定された有効性ポリシー条件への準拠も含めて確認する。

[戻り値]

戻り値は、関数がポリシーチェックを実行できたかどうかを示すものであり、ポリシーチェックの結果が合格か不合格かを示すものではない。指定のポリシーについてチェーンを検証できた場合、TRUE
が返され、pPolicyStatus の dwError メンバーが更新される。dwError が 0 (ERROR_SUCCESS
または S_OK) であれば、チェーンは指定のポリシーを満たすことを示す。チェーンを有効と判定できなかった場合、戻り値は TRUE
となり、実際のエラーを知るには pPolicyStatus パラメーターを確認する必要がある。FALSE
はそもそもポリシーをチェックできなかったことを示す。

[備考]
pPolicyStatus が指す CERT_CHAIN_POLICY_STATUS 構造体の dwError
メンバーは、単一のチェーン要素、単純チェーン、またはチェーンコンテキスト全体に適用されうる。dwError
がチェーンコンテキスト全体に適用される場合、CERT_CHAIN_POLICY_STATUS 構造体の lChainIndex と
lElementIndex のどちらも -1 に設定される。dwError が単純チェーン全体に適用される場合、lElementIndex
は -1、lChainIndex はエラーを含む最初のチェーンのインデックスに設定される。dwError
が単一証明書要素に適用される場合、lChainIndex と lElementIndex
はエラーを持つ最初の証明書を指す。証明書要素を取得するには次の構文を使用する:
pChainContext->rgpChain[lChainIndex]->rgpElement[lElementIndex];
証明書失効チェックを有効化して実行するには、CertGetCertificateChain
関数を使用する。CertVerifyCertificateChainPolicy
関数は、証明書チェーン内の証明書が失効しているかどうかのチェックは行わない。


%index
CertVerifyRevocation
rgpvContext 配列に含まれる証明書の失効状態を確認する。リスト内のいずれかの証明書が失効していると判定された時点で、それ以上の確認は行われない。
%prm
dwEncodingType, dwRevType, cContext, rgpvContext, dwFlags, pRevPara, pRevStatus
dwEncodingType : [int] 使用するエンコーディング種別を指定する。現在使用されているのは X509_ASN_ENCODING と PKCS_7_ASN_ENCODING のみであるが、将来エンコーディング種別が追加される可能性がある。現状のどちらのエンコーディングでも、X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。
dwRevType : [int] rgpvContext で渡されるコンテキスト構造体の種類を示す。現在定義されているのは CERT_CONTEXT_REVOCATION_TYPE (証明書の失効) のみである。
cContext : [int] rgpvContext 配列の要素数。
rgpvContext : [var] dwRevType が CERT_CONTEXT_REVOCATION_TYPE の場合、rgpvContext は CERT_CONTEXT 構造体へのポインターの配列となる。これらのコンテキストには、インストール済みまたは登録済みの失効 DLL が失効サーバーを特定するために十分な情報が含まれていなければならない。この情報は通常、IETF の PKIX Part 1 で定義されている CRLDistributionsPoints 拡張などの拡張で伝達される。
dwFlags : [int] 特殊な処理が必要であるかを示す。このパラメーターには次のフラグのいずれかを指定できる。
pRevPara : [var] 発行者の検索を補助するために任意で設定する。詳細は CERT_REVOCATION_PARA 構造体を参照。
pRevStatus : [var] CertVerifyRevocation を呼び出す前に、pRevStatus が指す CERT_REVOCATION_STATUS の cbSize メンバーだけを設定すればよい。関数が FALSE を返した場合、この構造体のメンバーにはエラー状態情報が格納される。詳細は CERT_REVOCATION_STATUS を参照。失効検証で問題が発生した場合の pRevStatus の更新方法については「解説」を参照。
%inst
rgpvContext
配列に含まれる証明書の失効状態を確認する。リスト内のいずれかの証明書が失効していると判定された時点で、それ以上の確認は行われない。

[戻り値]
関数が全コンテキストを正常に確認し、いずれも失効していなければ TRUE を返す。失敗した場合は FALSE
を返し、CERT_REVOCATION_STATUS に記載のとおり pRevStatus
が指す構造体を更新する。いずれかのコンテキストの失効ハンドラーがエラーで FALSE を返した場合、pRevStatus が指す構造体の
dwError メンバーにハンドラーが遭遇したエラーが設定される。GetLastError は
CERT_REVOCATION_STATUS 構造体の dwError メンバーと同じエラーコードを返す。GetLastError
は次の値のいずれかを返すことがある。
（以下省略）

[備考]
失効検証で問題が発生した場合の pRevStatus の更新方法を次の例で示す。cContext が 4
の場合を考える。CertVerifyRevocation が rgpvContext[0] と rgpvContext[1]
を失効していないと検証できたが rgpvContext[2] をチェックできない場合、pRevStatus メンバー dwIndex は
2 に設定され、インデックス 2 のコンテキストに問題があることを示す。また pRevStatus の dwError メンバーは
CRYPT_E_NO_REVOCATION_CHECK に設定され、関数は FALSE を返す。rgpvContext[2]
が失効していると判明した場合、pRevStatus の dwIndex メンバーは 2、dwError メンバーは
CRYPT_E_REVOKED、dwReason も更新され、FALSE が返される。いずれの場合も、rgpvContext[0] と
rgpvContext[1] は失効していないことが確認され、rgpvContext[2]
は最後に確認された配列インデックスであり、rgpvContext[3] はまったく確認されていない。


%index
CertVerifySubjectCertificateContext
CertVerifySubjectCertificateContext 関数は、証明書の発行者の正当性を確認することで、証明書に対して有効化された検証チェックを行う。本関数よりも新しい「証明書チェーン検証関数」の使用を推奨する。
%prm
pSubject, pIssuer, pdwFlags
pSubject : [var] サブジェクトの証明書を含む CERT_CONTEXT 構造体へのポインター。
pIssuer : [var] 発行者の証明書を含む CERT_CONTEXT へのポインター。CERT_STORE_TIME_VALIDITY_FLAG のみを確認する場合、pIssuer は NULL でも構わない。
pdwFlags : [var] 検証チェックフラグを含む DWORD 値へのポインター。次のフラグを設定することで、サブジェクト証明書に対する検証チェックを有効化できる。ビット単位 OR で組み合わせて複数の検証を有効化できる。
%inst
CertVerifySubjectCertificateContext
関数は、証明書の発行者の正当性を確認することで、証明書に対して有効化された検証チェックを行う。本関数よりも新しい「証明書チェーン検証関数」の使用を推奨する。

[戻り値]
関数が成功した場合、戻り値は TRUE となる。関数が失敗した場合、戻り値は FALSE となる。検証チェックに失敗した場合でも TRUE
が返される。FALSE は不正なパラメーターが渡されたときのみ返される。拡張エラー情報を取得するには GetLastError
を呼び出す。考えられるエラーコードの一つを以下に示す。
（以下省略）

[備考]
フラグの 16 進値はビット単位 OR
で組み合わせ、複数の検証を有効化できる。例えば署名と時刻有効性の両方を有効にするには次の値を指定する。
（以下省略）


%index
CertVerifyTimeValidity
CertVerifyTimeValidity 関数は、証明書の時刻有効性を検証する。
%prm
pTimeToVerify, pCertInfo
pTimeToVerify : [var] 比較時刻を含む FILETIME 構造体へのポインター。NULL の場合、現在時刻が使用される。
pCertInfo : [var] 時刻を検証する対象の証明書の CERT_INFO 構造体へのポインター。
%inst
CertVerifyTimeValidity 関数は、証明書の時刻有効性を検証する。

[戻り値]
比較時刻が CERT_INFO 構造体の NotBefore メンバーより前の場合は -1 を返す。比較時刻が NotAfter
メンバーより後の場合は +1 を返す。証明書にとって有効な時刻の場合は 0 を返す。


%index
CertVerifyValidityNesting
CertVerifyValidityNesting 関数は、サブジェクト証明書の時刻有効期間が、その発行者の時刻有効期間の中に正しく入れ子になっているかを検証する。
%prm
pSubjectInfo, pIssuerInfo
pSubjectInfo : [var] サブジェクト証明書の CERT_INFO 構造体へのポインター。
pIssuerInfo : [var] 発行者証明書の CERT_INFO 構造体へのポインター。
%inst
CertVerifyValidityNesting
関数は、サブジェクト証明書の時刻有効期間が、その発行者の時刻有効期間の中に正しく入れ子になっているかを検証する。

[戻り値]
サブジェクト証明書の NotBefore 時刻が発行者証明書の NotBefore 時刻より後で、かつサブジェクト証明書の
NotAfter 時刻が発行者証明書の NotAfter 時刻より後でない場合、TRUE を返す。そうでない場合は FALSE を返す。


%index
CryptAcquireCertificatePrivateKey
証明書の秘密鍵を取得する。
%prm
pCert, dwFlags, pvParameters, phCryptProvOrNCryptKey, pdwKeySpec, pfCallerFreeProvOrNCryptKey
pCert : [var] 秘密鍵を取得する対象の証明書コンテキストを含む CERT_CONTEXT 構造体のアドレス。
dwFlags : [int] 
pvParameters : [intptr] CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG が設定されている場合、これは HWND のアドレスとなる。CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG が設定されていない場合、このパラメーターは NULL でなければならない。
phCryptProvOrNCryptKey : [var] CryptoAPI プロバイダーまたは CNG 鍵のハンドルを受け取る HCRYPTPROV_OR_NCRYPT_KEY_HANDLE 変数のアドレス。pdwKeySpec 変数が CERT_NCRYPT_KEY_SPEC フラグを受け取った場合、これは NCRYPT_KEY_HANDLE 型の CNG 鍵ハンドルとなり、そうでなければ HCRYPTPROV 型の CryptoAPI プロバイダーハンドルとなる。このハンドルをいつどのように解放するかについては、pfCallerFreeProvOrNCryptKey パラメーターの説明を参照。
pdwKeySpec : [var] 
pfCallerFreeProvOrNCryptKey : [var] phCryptProvOrNCryptKey 変数に返されたハンドルを呼び出し元が解放する必要があるかを示す値を受け取る BOOL 変数のアドレス。次のいずれかが真であれば FALSE が返される。
%inst
証明書の秘密鍵を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE) となる。関数が失敗した場合、戻り値は 0 (FALSE)
となる。拡張エラー情報を取得するには GetLastError を呼び出す。考えられるエラーコードの一つを以下に示す。
（以下省略）

[備考]
CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG が設定されている場合、呼び出し元は HWND
が有効であることを保証しなければならない。HWND が有効でなくなった場合、CSP では呼び出し元が CryptSetProvParam
を PP_CLIENT_HWND フラグ、HWND に NULL、HCRYPTPROV に NULL を指定して呼び出す必要がある。KSP
では呼び出し元が ncrypt 鍵の NCRYPT_WINDOW_HANDLE_PROPERTY を NULL
に設定する必要がある。CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG が KSP
に対して設定されている場合、NCRYPT_WINDOW_HANDLE_PROPERTY
はストレージプロバイダーと鍵の双方に設定される。両呼び出しとも失敗した場合、関数は失敗する。片方だけ失敗した場合、関数は成功する。HWND
を NULL に設定すると、実質的に HCRYPTPROV または ncrypt 鍵から HWND が取り除かれる点に注意。


%index
CryptBinaryToStringW
バイト配列を書式化された文字列に変換する。(Unicode)
%prm
pbBinary, cbBinary, dwFlags, pszString, pcchString
pbBinary : [var] 文字列化するバイト配列へのポインタ。
cbBinary : [int] pbBinary 配列の要素数。
dwFlags : [int] 
pszString : [wstr] 変換後の文字列を受け取るバッファへのポインタ。必要文字数を計算するには NULL を指定する。関数は終端 NULL 文字を含む必要文字数を pcchString に格納する。
pcchString : [var] pszString バッファのサイズ(TCHAR 単位)を格納した DWORD へのポインタ。pszString が NULL の場合、関数は終端 NULL を含む必要文字数を TCHAR 単位で計算して返す。pszString が NULL でなく十分に大きい場合、終端 NULL を含む文字列を格納し、pcchString には終端 NULL を除いた文字数が返される。
%inst
バイト配列を書式化された文字列に変換する。(Unicode)

[戻り値]
成功時は 0 以外 (TRUE) を返す。失敗時は 0 (FALSE) を返す。

[備考]
CRYPT_STRING_BINARY エンコーディングを除き、すべての文字列には改行シーケンスが付加される。既定では CR/LF
(0x0D/0x0A) が使用される。dwFlags に CRYPT_STRING_NOCR が指定されている場合は LF (0x0A)
のみ、CRYPT_STRING_NOCRLF が指定されている場合は改行は付加されない。
> [!NOTE] > wincrypt.h は UNICODE マクロに応じて CryptBinaryToString を
ANSI/Unicode
版へのエイリアスとして定義する。エンコーディング中立なエイリアスと非中立コードを混在させるとコンパイル/ランタイムエラーの原因となる。


%index
CryptCloseAsyncHandle
CryptCloseAsyncHandle 関数 (wincrypt.h) は非同期ハンドルを閉じる。
%prm
hAsync
hAsync : [intptr] 閉じる非同期ハンドル。
%inst
CryptCloseAsyncHandle 関数 (wincrypt.h) は非同期ハンドルを閉じる。

[戻り値]
成功した場合 S_OK を返す。


%index
CryptCreateAsyncHandle
CryptCreateAsyncHandle 関数 (wincrypt.h) は非同期ハンドルを作成する。
%prm
dwFlags, phAsync
dwFlags : [int] ハンドル作成フラグ。
phAsync : [intptr] 作成された非同期ハンドルへのポインターを受け取る。
%inst
CryptCreateAsyncHandle 関数 (wincrypt.h) は非同期ハンドルを作成する。


%index
CryptCreateKeyIdentifierFromCSP
重要: この API は非推奨である。(CryptCreateKeyIdentifierFromCSP)
%prm
dwCertEncodingType, pszPubKeyOID, pPubKeyStruc, cbPubKeyStruc, dwFlags, pvReserved, pbHash, pcbHash
dwCertEncodingType : [int] 使用するエンコーディング種別を指定する。次の例のように証明書エンコーディングとメッセージエンコーディングをビット単位 OR で組み合わせて指定することも常に許容される: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING 現在定義されているエンコーディング種別は次のとおり。
pszPubKeyOID : [str] 公開鍵オブジェクト識別子 (OID) へのポインター。NULL 以外の値を指定すると、pPubKeyStruc が指す構造体の aiKeyAlg メンバーから取得される既定の OID を上書きする。既定の OID を使用する場合は pszPubKeyOID を NULL に設定する。
pPubKeyStruc : [var] PUBLICKEYSTRUC 構造体へのポインター。既定では、pPubKeyStruc が指す構造体の aiKeyAlg メンバーを用いて公開鍵 OID を探す。pszPubKeyOID の値が NULL 以外の場合、既定値を上書きする。
cbPubKeyStruc : [int] PUBLICKEYSTRUC のサイズ (バイト単位)。
dwFlags : [int] 将来の使用のため予約されており、0 でなければならない。
pvReserved : [intptr] 将来の使用のため予約されており、NULL でなければならない。
pbHash : [var] 公開鍵のハッシュおよび鍵識別子を受け取るバッファーへのポインター。メモリ割り当て用にサイズを取得するには、このパラメーターを NULL に設定する。詳細は「長さ不明のデータの取得」を参照。
pcbHash : [var] pbHash パラメーターが指すバッファーのサイズをバイト単位で指定する DWORD へのポインター。関数から戻ると、DWORD はバッファーに格納されたバイト数を含む。SHA1 ハッシュを使用する場合、必要なバッファー長は 20 である。
%inst
重要: この API は非推奨である。(CryptCreateKeyIdentifierFromCSP)

[戻り値]
関数が成功した場合、0 以外 (TRUE) を返す。関数が失敗した場合、0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
CryptDecodeMessage
暗号メッセージを復号・復号化・検証する。
%prm
dwMsgTypeFlags, pDecryptPara, pVerifyPara, dwSignerIndex, pbEncodedBlob, cbEncodedBlob, dwPrevInnerContentType, pdwMsgType, pdwInnerContentType, pbDecoded, pcbDecoded, ppXchgCert, ppSignerCert
dwMsgTypeFlags : [int] メッセージ種別を示す。メッセージ種別はビット単位 OR 演算子で組み合わせることができる。このパラメーターには次のメッセージ種別のいずれかを指定できる。
pDecryptPara : [var] 復号パラメーターを含む CRYPT_DECRYPT_MESSAGE_PARA 構造体へのポインター。
pVerifyPara : [var] 検証パラメーターを含む CRYPT_VERIFY_MESSAGE_PARA 構造体へのポインター。
dwSignerIndex : [int] メッセージに複数の署名者が存在する場合に、どの署名者を検証するかを示す。このインデックスを変えて関数を複数回呼び出すと、追加の署名者を検証できる。
pbEncodedBlob : [var] デコード対象のエンコード済み BLOB へのポインター。
cbEncodedBlob : [int] エンコードされた BLOB のサイズ (バイト単位)。
dwPrevInnerContentType : [int] 入れ子になった暗号化メッセージを処理する場合にのみ適用される。外側の暗号化メッセージを処理する際は 0 に設定する必要がある。入れ子となった暗号化メッセージをデコードする場合、外側メッセージに対する前回の CryptDecodeMessage 呼び出しで pdwInnerContentType に返された値を設定する。pdwMsgType に列挙された CMSG 型のいずれでもよい。後方互換性のため、dwPrevInnerContentType は 0 に設定する。
pdwMsgType : [var] 返されるメッセージ型を指定する DWORD へのポインタ。このパラメータには次のメッセージ型のいずれかを指定できる。
pdwInnerContentType : [var] 内側メッセージの型を指定する DWORD へのポインタ。pdwMsgType に使用されるメッセージ型コードがここでも使用される。
pbDecoded : [var] デコード済みメッセージを受け取るバッファーへのポインター。
pcbDecoded : [var] pbDecoded パラメーターが指すバッファーのサイズをバイト単位で指定する変数へのポインター。関数から戻ると、この変数にはデコード済みメッセージのサイズが格納される。
ppXchgCert : [var] メッセージを復号するために必要な秘密鍵交換鍵に対応する証明書を含む CERT_CONTEXT 構造体へのポインタのポインタ。このパラメータは、メッセージ型が CMSG_ENVELOPED および CMSG_SIGNED_AND_ENVELOPED の場合にのみ設定される。
ppSignerCert : [var] 署名者の証明書コンテキストを表す CERT_CONTEXT 構造体へのポインタのポインタ。このパラメータは、メッセージ型が CMSG_SIGNED および CMSG_SIGNED_AND_ENVELOPED の場合にのみ設定される。
%inst
暗号メッセージを復号・復号化・検証する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError
を呼び出す。CryptDecryptMessage、CryptVerifyMessageSignature、CryptVerifyMessageHash
の各関数のエラーがこの関数に伝播することがある。次のエラーコードが GetLastError 関数によって最も一般的に返される。
（以下省略）

[備考]
dwMsgTypeFlags パラメータは、許容されるメッセージの集合を指定する。たとえば SIGNED または ENVELOPED
メッセージのいずれかを復号する場合、dwMsgTypeFlags に CMSG_SIGNED_FLAG |
CMSG_ENVELOPED_FLAG を設定する。pDecryptPara または pVerifyPara
のいずれか、または両方を指定する必要がある。メッセージの復号または検証に成功すると、ppXchgCert および ppSignerCert
が指す証明書コンテキストポインタが更新される。これらは CertFreeCertificateContext
を呼び出して解放しなければならない。関数が失敗した場合、これらは NULL に設定される。ppXchgCert または
ppSignerCert の各パラメータは、関数呼び出し前に NULL
に設定することができ、これは呼び出し元が交換証明書や署名者証明書コンテキストの取得に関心がないことを示す。


%index
CryptDecodeObject
CryptDecodeObject 関数は、lpszStructType パラメータが示す型の構造体を復号する。大幅な性能向上を伴う同じ機能を実現する API として CryptDecodeObjectEx の使用が推奨される。
%prm
dwCertEncodingType, lpszStructType, pbEncoded, cbEncoded, dwFlags, pvStructInfo, pcbStructInfo
dwCertEncodingType : [int] 使用するエンコーディングの型。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
lpszStructType : [str] 構造体の型を定義する OID へのポインタ。lpszStructType パラメータの上位ワードが 0 の場合、下位ワードは指定された構造体の型の整数識別子を指定する。それ以外の場合、このパラメータは NULL 終端文字列への long ポインタとなる。オブジェクト識別子文字列、その定義済み定数および対応する構造体の詳細については、Constants for CryptEncodeObject and CryptDecodeObject を参照。
pbEncoded : [var] 復号する符号化済み構造体へのポインタ。
cbEncoded : [int] pbEncoded が指すバイト数。
dwFlags : [int] 次のフラグが定義されている。これらはビットごとの OR 演算で組み合わせることができる。
pvStructInfo : [intptr] 復号済み構造体を受け取るバッファへのポインタ。指定されたバッファが復号済み構造体を受け取るのに十分な大きさでない場合、関数は ERROR_MORE_DATA を設定し、必要なバッファサイズ (バイト単位) を pcbStructInfo が指す変数に格納する。メモリ割り当て目的でこの情報のサイズを取得するため、このパラメータは NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbStructInfo : [var] pvStructInfo パラメータが指すバッファのサイズ (バイト単位) を指定する DWORD 値へのポインタ。関数が戻ると、この DWORD 値には pvStructInfo にコピーされた復号済みデータのサイズが格納される。pcbStructInfo が指す変数に含まれるサイズは、復号済み構造体が他の構造体へのポインタを含むことができるため、復号済み構造体よりも大きいサイズを示すことがある。このサイズは復号済み構造体が必要とするサイズと、参照先の他の構造体のサイズの合計である。
%inst
CryptDecodeObject 関数は、lpszStructType
パラメータが示す型の構造体を復号する。大幅な性能向上を伴う同じ機能を実現する API として CryptDecodeObjectEx
の使用が推奨される。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。次の表に、想定されるエラーコードの一部を示す。
（以下省略）

[備考]
推奨される CryptEncodeObjectEx 関数を使用して暗号オブジェクトを符号化する場合、NULL
終端文字が含まれる。推奨される CryptDecodeObjectEx 関数を使用して復号する場合、NULL 終端文字は保持されない。


%index
CryptDecodeObjectEx
lpszStructType パラメータが示す型の構造体を復号する。
%prm
dwCertEncodingType, lpszStructType, pbEncoded, cbEncoded, dwFlags, pDecodePara, pvStructInfo, pcbStructInfo
dwCertEncodingType : [int] 使用するエンコーディングの型。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
lpszStructType : [str] 構造体の型を定義するオブジェクト識別子 (OID) へのポインタ。lpszStructType パラメータの上位ワードが 0 の場合、下位ワードは指定された構造体の型の整数識別子を指定する。それ以外の場合、このパラメータは NULL 終端文字列への long ポインタとなる。
pbEncoded : [var] 復号するデータへのポインタ。構造体は lpszStructType で指定された型でなければならない。
cbEncoded : [int] pbEncoded が指すバイト数。これは復号するバイト数を表す。
dwFlags : [int] このパラメータには次のフラグのうち 1 つ以上を指定できる。フラグはビットごとの OR 演算で組み合わせることができる。
pDecodePara : [var] デコード段落情報を含む CRYPT_DECODE_PARA 構造体へのポインタ。pDecodePara が NULL に設定されている場合、メモリの割り当てと解放には LocalAlloc と LocalFree が使用される。pDecodePara が CRYPT_DECODE_PARA 構造体を指している場合、その構造体がメモリの割り当てと解放用のコールバック関数を渡す。これらのコールバック関数は LocalAlloc と LocalFree の既定のメモリ割り当てをオーバーライドする。
pvStructInfo : [intptr] dwFlags に CRYPT_ENCODE_ALLOC_FLAG が設定されている場合、pvStructInfo はバッファへのポインタではなく、バッファへのポインタのアドレスとなる。メモリは関数内部で割り当てられ、ポインタは *pvStructInfo に格納されるため、pvStructInfo が NULL であってはならない。CRYPT_ENCODE_ALLOC_FLAG が設定されていない場合、pvStructInfo は復号済み構造体を受け取るバッファへのポインタとなる。指定されたバッファが復号済み構造体を受け取るのに十分な大きさでない場合、関数は ERROR_MORE_DATA コードを設定し、必要なバッファサイズ (バイト単位) を pcbStructInfo が指す変数に格納する。メモリ割り当て目的でこの情報のサイズを取得するため、このパラメータは NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbStructInfo : [var] pvStructInfo パラメータが指すバッファのサイズ (バイト単位) を含む DWORD 変数へのポインタ。関数が戻ると、この DWORD 値はバッファに格納されたバイト数を含む。pcbStructInfo が指す変数に含まれるサイズは、復号済み構造体が補助データへのポインタを含むことがあるため、復号済み構造体より大きいサイズを示すことがある。このサイズは復号済み構造体が必要とするサイズと補助データのサイズの合計である。CRYPT_DECODE_ALLOC_FLAG が設定されている場合、*pcbStructInfo の初期値は関数に使用されず、復帰時に *pcbStructInfo は pvStructInfo に割り当てられたバイト数を含む。注意 バッファ内で返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用しなければならない。実際のサイズは入力時に指定されたバッファのサイズよりわずかに小さいことがある。出力時にはこのパラメータが指す変数は、実際のデータサイズを反映するよう更新される。
%inst
lpszStructType パラメータが示す型の構造体を復号する。

[戻り値]
関数が成功した場合、0 以外 (TRUE) を返す。関数が失敗した場合、0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。次の表にいくつかの想定されるエラーコードを示す。
（以下省略）

[備考]
推奨される CryptEncodeObjectEx 関数を使用して暗号オブジェクトを符号化する場合、NULL
終端文字が含まれる。推奨される CryptDecodeObjectEx 関数を使用して復号する場合、NULL
終端文字は保持されない。下記のリストの各定数には、pvStructInfo
パラメータが指す関連する構造体型がある。直接または間接的に指される構造体は CERT_ALT_NAME_ENTRY 構造体への参照を持つ。
（以下省略）


%index
CryptDecryptAndVerifyMessageSignature
CryptDecryptAndVerifyMessageSignature 関数は、メッセージを復号し署名を検証する。
%prm
pDecryptPara, pVerifyPara, dwSignerIndex, pbEncryptedBlob, cbEncryptedBlob, pbDecrypted, pcbDecrypted, ppXchgCert, ppSignerCert
pDecryptPara : [var] 復号パラメータを含む CRYPT_DECRYPT_MESSAGE_PARA 構造体へのポインタ。
pVerifyPara : [var] 検証パラメータを含む CRYPT_VERIFY_MESSAGE_PARA 構造体へのポインタ。
dwSignerIndex : [int] メッセージの特定の署名者を識別する。メッセージは複数の署名者によって署名されることがあり、このパラメータを変更しながらこの関数を複数回呼び出して複数の署名者を確認できる。最初の署名者では 0 に設定する。関数が FALSE を返し、GetLastError が CRYPT_E_NO_SIGNER を返す場合、前回の呼び出しでメッセージの最後の署名者を受け取ったことを示す。
pbEncryptedBlob : [var] 復号および検証を行う署名・符号化・暗号化されたメッセージへのポインタ。
cbEncryptedBlob : [int] 暗号化メッセージのサイズ (バイト単位)。
pbDecrypted : [var] 復号されたメッセージを受け取るバッファへのポインタ。
pcbDecrypted : [var] pbDecrypted パラメータが指すバッファのサイズ (バイト単位) を指定する DWORD へのポインタ。関数が戻ると、pbDecrypted にコピーされた復号済みメッセージのサイズが格納される。
ppXchgCert : [var] メッセージを復号するために必要な秘密鍵交換鍵に対応する証明書を表す CERT_CONTEXT 構造体へのポインタ。
ppSignerCert : [var] 署名者の証明書を表す CERT_CONTEXT 構造体へのポインタ。
%inst
CryptDecryptAndVerifyMessageSignature 関数は、メッセージを復号し署名を検証する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。注意 呼び出された CryptDecryptMessage および
CryptVerifyMessageSignature 関数のエラーがこの関数に伝播することがある。GetLastError
関数は最も一般的に次のエラーコードを返す。
（以下省略）

[備考]
メッセージの復号および検証に成功すると、ppXchgCert および ppSignerCert
が指す証明書コンテキストポインタが更新される。これらは CertFreeCertificateContext
を呼び出して解放しなければならない。関数が失敗した場合、これらは NULL
に設定される。呼び出し元が交換証明書や署名者証明書コンテキストに関心がないことを示すには、ppXchgCert および
ppSignerCert パラメータを NULL に設定する。


%index
CryptDecryptMessage
CryptDecryptMessage 関数はメッセージを復号化および復号する。
%prm
pDecryptPara, pbEncryptedBlob, cbEncryptedBlob, pbDecrypted, pcbDecrypted, ppXchgCert
pDecryptPara : [var] 復号パラメータを含む CRYPT_DECRYPT_MESSAGE_PARA 構造体へのポインタ。
pbEncryptedBlob : [var] 復号する符号化・暗号化されたメッセージを含むバッファへのポインタ。
cbEncryptedBlob : [int] 符号化・暗号化されたメッセージのサイズ (バイト単位)。
pbDecrypted : [var] 復号されたメッセージを受け取るバッファへのポインタ。
pcbDecrypted : [var] pbDecrypted パラメータが指すバッファのサイズ (バイト単位) を指定する DWORD へのポインタ。関数が戻ると、この変数は pbDecrypted にコピーされた復号済みメッセージのサイズ (バイト単位) を含む。
ppXchgCert : [var] メッセージを復号するために必要な秘密鍵交換鍵に対応する証明書を表す CERT_CONTEXT 構造体へのポインタ。関数が復号に使用された証明書コンテキストを返さないことを示すには、このパラメータを NULL に設定する。
%inst
CryptDecryptMessage 関数はメッセージを復号化および復号する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。注意 CryptImportKey および CryptDecrypt
の呼び出しからのエラーがこの関数に伝播することがある。GetLastError 関数は最も一般的に次のエラーコードを返す。
（以下省略）

[備考]
pbDecrypted に NULL が渡され、pcbDecrypted が NULL でない場合、ppXchgCert
に渡されたアドレスには NULL が返される。それ以外の場合は CERT_CONTEXT
へのポインタが返される。復号に成功したメッセージについて、この CERT_CONTEXT
へのポインタはメッセージの復号に使用された証明書コンテキストを指す。これは CertFreeCertificateContext
を呼び出して解放しなければならない。関数が失敗した場合、ppXchgCert の値は NULL に設定される。


%index
CryptEncodeObject
CryptEncodeObject 関数は、lpszStructType パラメータの値が示す型の構造体を符号化する。大幅な性能向上を伴う同じ機能を実現する API として CryptEncodeObjectEx の使用が推奨される。
%prm
dwCertEncodingType, lpszStructType, pvStructInfo, pbEncoded, pcbEncoded
dwCertEncodingType : [int] 使用するエンコーディングの型。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
lpszStructType : [str] 構造体の型を定義する OID へのポインタ。lpszStructType パラメータの上位ワードが 0 の場合、下位ワードは指定された構造体の型の整数識別子を指定する。それ以外の場合、このパラメータは NULL 終端文字列への long ポインタとなる。
pvStructInfo : [intptr] 符号化する構造体へのポインタ。構造体は lpszStructType で指定された型でなければならない。
pbEncoded : [var] 符号化された構造体を受け取るバッファへのポインタ。指定されたバッファが復号済み構造体を受け取るのに十分な大きさでない場合、関数は ERROR_MORE_DATA コードを設定し、必要なバッファサイズ (バイト単位) を pcbEncoded が指す変数に格納する。メモリ割り当て目的でこの情報のサイズを取得するため、このパラメータは NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbEncoded : [var] pbEncoded パラメータが指すバッファのサイズ (バイト単位) を含む DWORD 変数へのポインタ。関数が戻ると、この DWORD 値はバッファに格納された割り当て済み符号化バイト数を含む。注意 バッファ内で返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用しなければならない。実際のサイズは入力で指定されたバッファのサイズよりわずかに小さいことがある。出力時には、このパラメータが指す変数は実際のデータサイズを反映するよう更新される。
%inst
CryptEncodeObject 関数は、lpszStructType
パラメータの値が示す型の構造体を符号化する。大幅な性能向上を伴う同じ機能を実現する API として CryptEncodeObjectEx
の使用が推奨される。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。次の表に想定されるエラーコードの一部を示す。
（以下省略）

[備考]
推奨される CryptEncodeObjectEx 関数を使用して暗号オブジェクトを符号化する場合、NULL
終端文字が含まれる。推奨される CryptDecodeObjectEx 関数を使用して復号する場合、NULL 終端文字は保持されない。


%index
CryptEncodeObjectEx
lpszStructType パラメータの値が示す型の構造体を符号化する。
%prm
dwCertEncodingType, lpszStructType, pvStructInfo, dwFlags, pEncodePara, pvEncoded, pcbEncoded
dwCertEncodingType : [int] 
lpszStructType : [str] 構造体の型を定義するオブジェクト識別子 (OID) へのポインタ。lpszStructType パラメータの上位ワードが 0 の場合、下位ワードは指定された構造体の型の整数識別子を指定する。それ以外の場合、このパラメータは OID の文字列表現を含む NULL 終端文字列へのポインタとなる。
pvStructInfo : [intptr] 符号化する構造体へのポインタ。構造体は lpszStructType で指定された型でなければならない。
dwFlags : [int] 
pEncodePara : [var] 符号化情報を含む CRYPT_ENCODE_PARA 構造体へのポインタ。このパラメータは NULL にできる。pEncodePara か pEncodePara の pfnAlloc メンバのいずれかが NULL の場合、割り当てには LocalAlloc が使用され、メモリを解放するには LocalFree を呼び出さなければならない。pEncodePara と pEncodePara の pfnAlloc メンバの両方が NULL でない場合、pEncodePara が指す CRYPT_ENCODE_PARA 構造体の pfnAlloc メンバが指す関数が割り当てに呼び出される。メモリを解放するには pEncodePara の pfnFree メンバが指す関数を呼び出さなければならない。
pvEncoded : [intptr] 符号化された構造体を受け取るバッファへのポインタ。このバッファのサイズは pcbEncoded パラメータで指定される。指定されたバッファが復号済み構造体を受け取るのに十分な大きさでない場合、関数は ERROR_MORE_DATA コードを設定し、必要なバッファサイズ (バイト単位) を pcbEncoded が指す変数に格納する。メモリ割り当て目的でバッファのサイズを取得するため、このパラメータは NULL にできる。詳細は Retrieving Data of Unknown Length を参照。dwFlags に CRYPT_ENCODE_ALLOC_FLAG フラグが含まれている場合、pvEncoded はバッファへのポインタではなく、バッファへのポインタのアドレスとなる。メモリは関数内部で割り当てられ、ポインタは pvEncoded に格納されるため、pvEncoded を NULL にすることはできない。
pcbEncoded : [var] pvEncoded パラメータが指すバッファのサイズ (バイト単位) を含む DWORD 変数へのポインタ。関数が戻ると、pcbEncoded パラメータが指す変数はバッファに格納された割り当て済み符号化バイト数を含む。dwFlags に CRYPT_ENCODE_ALLOC_FLAG フラグが含まれている場合、pcbEncoded は更新される DWORD 値へのポインタのアドレスとなる。注意 バッファ内で返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用しなければならない。実際のサイズは入力で指定されたバッファのサイズよりわずかに小さいことがある。出力時には、このパラメータが指す変数は実際のデータサイズを反映するよう更新される。
%inst
lpszStructType パラメータの値が示す型の構造体を符号化する。

[戻り値]
成功した場合は 0 以外、失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。次の表に、CryptEncodeObjectEx が失敗したときに GetLastError
から返される可能性のあるエラーコードの一部を示す。
（以下省略）

[備考]
推奨される CryptEncodeObjectEx 関数を使用して暗号オブジェクトを符号化する場合、NULL
終端文字が含まれる。推奨される CryptDecodeObjectEx 関数を使用して復号する場合、NULL
終端文字は保持されない。CryptEncodeObjectEx
は最初にインストール可能な拡張符号化関数を検索する。拡張符号化関数が見つからない場合、古い非拡張のインストール可能関数が位置付けされる。オブジェクトの直接的な
IA5String 符号化ができない場合、dwFlag パラメータに CRYPT_ENCODE_ENABLE_PUNYCODE_FLAG
を設定することで Punycode 符号化を指定できる。CRYPT_ENCODE_ENABLE_PUNYCODE_FLAG
フラグを設定する効果は、lpszStructType
パラメータで指定される符号化対象の構造体の型によって異なる。下記のリストの各定数には、pvStructInfo
パラメータが指す関連する構造体型がある。直接または間接的に指される構造体は CERT_ALT_NAME_ENTRY 構造体への参照を持つ。
（以下省略）


%index
CryptEncryptMessage
CryptEncryptMessage 関数はメッセージを暗号化および符号化する。
%prm
pEncryptPara, cRecipientCert, rgpRecipientCert, pbToBeEncrypted, cbToBeEncrypted, pbEncryptedBlob, pcbEncryptedBlob
pEncryptPara : [var] 暗号化パラメータを含む CRYPT_ENCRYPT_MESSAGE_PARA 構造体へのポインタ。CryptEncryptMessage 関数は SHA2 系 OID である szOID_DH_SINGLE_PASS_STDDH_SHA256_KDF および szOID_DH_SINGLE_PASS_STDDH_SHA384_KDF をサポートしない。
cRecipientCert : [int] rgpRecipientCert 配列の要素数。
rgpRecipientCert : [var] メッセージの意図された受信者の証明書を含む CERT_CONTEXT 構造体へのポインタの配列。
pbToBeEncrypted : [var] 暗号化するメッセージを含むバッファへのポインタ。
cbToBeEncrypted : [int] 暗号化するメッセージのサイズ (バイト単位)。
pbEncryptedBlob : [var] 暗号化・符号化されたメッセージを受け取るバッファを含む BLOB へのポインタ。
pcbEncryptedBlob : [var] pbEncryptedBlob パラメータが指すバッファのサイズ (バイト単位) を指定する DWORD へのポインタ。関数が戻ると、この変数は pbEncryptedBlob にコピーされた暗号化・符号化されたメッセージのサイズ (バイト単位) を含む。
%inst
CryptEncryptMessage 関数はメッセージを暗号化および符号化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。注意
CryptGenKey、CryptEncrypt、CryptImportKey、CryptExportKey
の呼び出しからのエラーがこの関数に伝播することがある。GetLastError 関数は最も一般的に次のエラーコードを返す。
（以下省略）


%index
CryptEnumKeyIdentifierProperties
CryptEnumKeyIdentifierProperties 関数は鍵識別子とそのプロパティを列挙する。
%prm
pKeyIdentifier, dwPropId, dwFlags, pwszComputerName, pvReserved, pvArg, pfnEnum
pKeyIdentifier : [var] 鍵識別子を含む CRYPT_HASH_BLOB 構造体へのポインタ。
dwPropId : [int] 列挙するプロパティ識別子を示す。
dwFlags : [int] 既定では CurrentUser の鍵識別子の一覧が検索される。CRYPT_KEYID_MACHINE_FLAG が設定されている場合、LocalMachine (pwszComputerName が NULL の場合) またはリモートコンピュータ (pwszComputerName が NULL でない場合) の鍵識別子の一覧が検索される。詳細は pwszComputerName を参照。
pwszComputerName : [wstr] 検索するリモートコンピュータの名前へのポインタ。dwFlags に CRYPT_KEYID_MACHINE_FLAG が設定されている場合、リモートコンピュータから鍵識別子の一覧が検索される。リモートコンピュータではなくローカルコンピュータを検索する場合、pwszComputerName は NULL に設定する。
pvReserved : [intptr] 将来使用のために予約されており、NULL でなければならない。
pvArg : [intptr] コールバック関数に渡されるデータへのポインタ。型は void で、アプリケーションが任意の情報を保持する構造体や引数を宣言・定義・初期化できる。
pfnEnum : [int] 入力パラメータと一致する各鍵識別子エントリに対して実行されるアプリケーション定義のコールバック関数へのポインタ。コールバック関数のパラメータの詳細については CRYPT_ENUM_KEYID_PROP を参照。
%inst
CryptEnumKeyIdentifierProperties 関数は鍵識別子とそのプロパティを列挙する。

[戻り値]
CryptEnumKeyIdentifierProperties 関数は、最後の鍵識別子が列挙されるか、コールバック関数が FALSE
を返すまで CRYPT_ENUM_KEYID_PROP コールバック関数を繰り返し呼び出す。メイン関数が成功した場合、関数は 0 以外
(TRUE) を返す。関数が失敗した場合、0 (FALSE) を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。列挙を継続するには関数は TRUE を返す。列挙を停止するには関数は FALSE を返し、最終エラーコードを設定する。

[備考]
鍵識別子は証明書コンテキストと同じプロパティを持つことができる。


%index
CryptEnumOIDFunction
CryptEnumOIDFunction 関数は、登録されたオブジェクト識別子 (OID) 関数を列挙する。
%prm
dwEncodingType, pszFuncName, pszOID, dwFlags, pvArg, pfnEnumOIDFunc
dwEncodingType : [int] 一致させるエンコーディング型を指定する。このパラメータを CRYPT_MATCH_ANY_ENCODING_TYPE に設定すると任意のエンコーディング型と一致する。CRYPT_MATCH_ANY_ENCODING_TYPE が指定されていない場合、証明書またはメッセージのエンコーディング型のいずれかが必要であることに注意。証明書エンコーディング型を含む下位ワードが 0 以外の場合、それが使用される。そうでない場合、メッセージエンコーディング型を含む上位ワードが使用される。両方が指定されている場合、下位ワードの証明書エンコーディング型が使用される。
pszFuncName : [str] 大文字小文字を区別しない一致検索を行う関数の名前。このパラメータを NULL に設定すると、任意の関数名との一致が検出される。
pszOID : [str] pszOID の上位ワードが 0 以外の場合、pszOID は大文字小文字を区別しない一致検索を行うオブジェクト識別子を指定する。pszOID の上位ワードが 0 の場合、pszOID は数値オブジェクト識別子との一致に使用される。このパラメータを NULL に設定すると任意のオブジェクト識別子と一致する。このパラメータを CRYPT_DEFAULT_OID に設定すると、列挙を既定の関数のみに制限する。
dwFlags : [int] 将来使用のために予約されており、0 でなければならない。
pvArg : [intptr] CRYPT_ENUM_OID_FUNCTION コールバック関数に渡される引数へのポインタ。
pfnEnumOIDFunc : [int] 入力パラメータと一致する各 OID 関数に対して実行されるコールバック関数へのポインタ。詳細は CRYPT_ENUM_OID_FUNCTION を参照。
%inst
CryptEnumOIDFunction 関数は、登録されたオブジェクト識別子 (OID) 関数を列挙する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
CryptEnumOIDInfo
定義済みおよび登録済みのオブジェクト識別子 (OID) CRYPT_OID_INFO 構造体を列挙する。この関数は定義済みと登録済みのすべての構造体、または選択された OID グループによって識別される構造体のみを列挙する。
%prm
dwGroupId, dwFlags, pvArg, pfnEnumOIDInfo
dwGroupId : [int] 一致させる OID グループを示す。dwGroupId を 0 に設定するとすべてのグループと一致する。dwGroupId が 0 より大きい場合、指定されたグループの OID エントリのみが列挙される。
dwFlags : [int] このパラメータは将来使用のために予約されている。0 でなければならない。
pvArg : [intptr] コールバック関数に渡される引数へのポインタ。
pfnEnumOIDInfo : [int] 列挙される各 OID 情報エントリに対して実行されるコールバック関数へのポインタ。コールバックパラメータの情報は CRYPT_ENUM_OID_INFO を参照。
%inst
定義済みおよび登録済みのオブジェクト識別子 (OID) CRYPT_OID_INFO
構造体を列挙する。この関数は定義済みと登録済みのすべての構造体、または選択された OID グループによって識別される構造体のみを列挙する。

[戻り値]
コールバック関数が列挙を完了した場合、この関数は TRUE を返す。コールバック関数が列挙を停止した場合、この関数は FALSE を返す。


%index
CryptExportPKCS8
PKCS 形式で秘密鍵をエクスポートする (CryptExportPKCS8)。
%prm
hCryptProv, dwKeySpec, pszPrivateKeyObjId, dwFlags, pvAuxInfo, pbPrivateKeyBlob, pcbPrivateKeyBlob
hCryptProv : [int] 暗号サービスプロバイダ (CSP) を含む HCRYPTPROV 変数。これは CryptAcquireContext を呼び出して取得した CSP のハンドル。
dwKeySpec : [int] 鍵指定を含む DWORD 変数。既定のプロバイダに対して次の dwKeySpec 値が定義されている。
pszPrivateKeyObjId : [str] 秘密鍵オブジェクト識別子 (OID) を含む LPSTR 変数。
dwFlags : [int] pbPrivateKeyBlob が NULL の場合は 0、それ以外の場合は 0x8000 にする。
pvAuxInfo : [intptr] このパラメータは NULL に設定しなければならない。
pbPrivateKeyBlob : [var] エクスポートする秘密鍵を受け取る BYTE 構造体の配列へのポインタ。
pcbPrivateKeyBlob : [var] 入力時に pbPrivateKeyBlob を格納するために必要なメモリ割り当てのサイズ (バイト単位) を含むことがある DWORD へのポインタ。pbPrivateKeyBlob が NULL の場合、このパラメータは関数への 2 回目の呼び出しに必要なメモリ割り当てのサイズを返す。詳細は Retrieving Data of Unknown Length を参照。
%inst
PKCS 形式で秘密鍵をエクスポートする (CryptExportPKCS8)。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。次のエラーコードはこの関数に固有のものである。
（以下省略）

[備考]
この関数は非対称鍵に対してのみサポートされる。


%index
CryptExportPublicKeyInfo
CryptExportPublicKeyInfo 関数は、プロバイダの対応する秘密鍵に関連付けられた公開鍵情報をエクスポートする。この関数の更新版については CryptExportPublicKeyInfoEx を参照。
%prm
hCryptProvOrNCryptKey, dwKeySpec, dwCertEncodingType, pInfo, pcbInfo
hCryptProvOrNCryptKey : [int] 公開鍵情報をエクスポートするときに使用する暗号サービスプロバイダ (CSP) のハンドル。このハンドルは CryptAcquireContext 関数を使用して作成された HCRYPTPROV ハンドル、または NCryptOpenKey 関数を使用して作成された NCRYPT_KEY_HANDLE ハンドルでなければならない。新しいアプリケーションでは常に CNG CSP の NCRYPT_KEY_HANDLE ハンドルを渡すこと。
dwKeySpec : [int] プロバイダのコンテナから使用する秘密鍵を識別する。AT_KEYEXCHANGE または AT_SIGNATURE を指定できる。hCryptProvOrNCryptKey パラメータに NCRYPT_KEY_HANDLE が使用されている場合、このパラメータは無視される。
dwCertEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
pInfo : [var] エクスポートする公開鍵情報を受け取る CERT_PUBLIC_KEY_INFO 構造体へのポインタ。メモリ割り当て目的でこの情報のサイズを設定するには、このパラメータを NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbInfo : [var] pInfo パラメータが指すバッファのサイズ (バイト単位) を含む DWORD へのポインタ。関数が戻ると、DWORD には戻りバッファに必要なバイト数が格納される。注意 バッファ内で返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用する必要がある。実際のサイズは入力で指定されたバッファのサイズよりわずかに小さいことがある。出力時には、このパラメータが指す変数は実際のデータサイズを反映するよう更新される。
%inst
CryptExportPublicKeyInfo
関数は、プロバイダの対応する秘密鍵に関連付けられた公開鍵情報をエクスポートする。この関数の更新版については
CryptExportPublicKeyInfoEx を参照。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。注意 呼び出された CryptGetUserKey および CryptExportKey
関数のエラーがこの関数に伝播することがある。この関数には次のエラーコードがある。
（以下省略）


%index
CryptExportPublicKeyInfoEx
プロバイダの対応する秘密鍵に関連付けられた公開鍵情報をエクスポートする。
%prm
hCryptProvOrNCryptKey, dwKeySpec, dwCertEncodingType, pszPublicKeyObjId, dwFlags, pvAuxInfo, pInfo, pcbInfo
hCryptProvOrNCryptKey : [int] 公開鍵情報をエクスポートするときに使用する CSP のハンドル。このハンドルは CryptAcquireContext 関数を使用して作成された HCRYPTPROV ハンドル、または NCryptOpenKey 関数を使用して作成された NCRYPT_KEY_HANDLE ハンドルでなければならない。新しいアプリケーションでは常に CNG CSP の NCRYPT_KEY_HANDLE ハンドルを渡すこと。
dwKeySpec : [int] プロバイダのコンテナから使用する秘密鍵を識別する。AT_KEYEXCHANGE または AT_SIGNATURE を指定できる。hCryptProvOrNCryptKey パラメータに NCRYPT_KEY_HANDLE が使用されている場合、このパラメータは無視される。
dwCertEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
pszPublicKeyObjId : [str] 公開鍵アルゴリズムを指定する。注意 pszPublicKeyObjId と dwCertEncodingType は、呼び出すインストール可能な CRYPT_OID_EXPORT_PUBLIC_KEY_INFO_FUNC を決定するために一緒に使用される。pszPublicKeyObjId パラメータ用にインストール可能な関数が見つからなかった場合、RSA 公開鍵 (szOID_RSA_RSA) として鍵をエクスポートする試みが行われる。
dwFlags : [int] 公開鍵情報のエクスポート方法を示す DWORD フラグ値。フラグ値は、公開鍵オブジェクト識別子を対応する CNG 公開鍵アルゴリズム Unicode 文字列にマップするときに CryptFindOIDInfo 関数に直接渡される。次のフラグ値を設定できる。
pvAuxInfo : [intptr] このパラメータは将来使用のために予約されており、NULL に設定しなければならない。
pInfo : [var] エクスポートする公開鍵情報を受け取る CERT_PUBLIC_KEY_INFO 構造体へのポインタ。メモリ割り当て目的でこの情報のサイズを設定するには、このパラメータを NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbInfo : [var] pInfo パラメータが指すバッファのサイズ (バイト単位) を含む DWORD へのポインタ。関数が戻ると、DWORD にはバッファに格納されたバイト数が含まれる。注意 バッファ内で返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用する必要がある。実際のサイズは入力で指定されたバッファのサイズよりわずかに小さいことがある。出力時には、このパラメータが指す変数は実際のデータサイズを反映するよう更新される。
%inst
プロバイダの対応する秘密鍵に関連付けられた公開鍵情報をエクスポートする。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。注意 呼び出された CryptGetUserKey および CryptExportKey
関数のエラーがこの関数に伝播することがある。この関数には次のエラーコードがある。
（以下省略）


%index
CryptExportPublicKeyInfoFromBCryptKeyHandle
プロバイダの対応する秘密鍵に関連付けられた公開鍵情報をエクスポートする。
%prm
hBCryptKey, dwCertEncodingType, pszPublicKeyObjId, dwFlags, pvAuxInfo, pInfo, pcbInfo
hBCryptKey : [int] 公開鍵情報をエクスポートする鍵のハンドル。
dwCertEncodingType : [int] 一致させるエンコーディング型を指定する。
pszPublicKeyObjId : [str] 鍵のエクスポートに使用するインストール可能な関数を識別するオブジェクト識別子 (OID) へのポインタ。OID の上位ワードが 0 以外の場合、pszPublicKeyObjId は "2.5.29.1" のような OID 文字列または "file" のような ASCII 文字列へのポインタとなる。OID の上位ワードが 0 の場合、下位ワードはオブジェクト識別子として使用される整数識別子を指定する。
dwFlags : [int] 公開鍵情報のエクスポート方法を示す DWORD 値。
pvAuxInfo : [intptr] このパラメータは将来使用のために予約されており、NULL に設定しなければならない。
pInfo : [var] エクスポートする公開鍵情報を受け取る CERT_PUBLIC_KEY_INFO 構造体へのポインタ。メモリ割り当て目的でこの情報のサイズを設定するには、このパラメータを NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbInfo : [var] pInfo パラメータが指すバッファのサイズ (バイト単位) を含む DWORD へのポインタ。関数が戻ると、DWORD にはバッファに格納されたバイト数が含まれる。
%inst
プロバイダの対応する秘密鍵に関連付けられた公開鍵情報をエクスポートする。

[戻り値]
関数が成功した場合は TRUE、それ以外は FALSE を返す。

[備考]
CryptExportPublicKeyInfoFromBCryptKeyHandle 関数が pszPublicKeyObjId
パラメータで指定された OID のインストール可能な OID 関数を見つけられない場合、RSA 公開鍵 (szOID_RSA_RSA)
として鍵をエクスポートする試みが行われる。鍵が RSA 公開鍵としてエクスポートされる場合、dwFlags および pvAuxInfo
パラメータの値は使用されない。


%index
CryptFindCertificateKeyProvInfo
暗号プロバイダとそのコンテナを列挙し、証明書の公開鍵に対応する秘密鍵を検索する。
%prm
pCert, dwFlags, pvReserved
pCert : [var] 公開鍵情報をエクスポートするときに使用する証明書の CERT_CONTEXT 構造体へのポインタ。
dwFlags : [int] 
pvReserved : [intptr] 将来使用のために予約されており、NULL でなければならない。
%inst
暗号プロバイダとそのコンテナを列挙し、証明書の公開鍵に対応する秘密鍵を検索する。

[戻り値]
検索対象のコンテナ内で証明書の公開鍵に対応する秘密鍵を関数が見つけた場合は
TRUE。コンテナを見つけられないか、コンテナ内の秘密鍵を見つけられない場合は FALSE を返す。
GetLastError は次のエラーを返す。
（以下省略）

[備考]
この関数は暗号プロバイダとそのコンテナを列挙し、証明書の公開鍵に対応する秘密鍵を検索する。一致した場合、関数は証明書の
CERT_KEY_PROV_INFO_PROP_ID プロパティを更新する。CERT_KEY_PROV_INFO_PROP_ID
がすでに設定されている場合、プロバイダの公開鍵と一致するかどうかを判定するためにチェックされる。一致した場合、関数は前述の列挙をスキップする。


%index
CryptFindLocalizedName
"Root" システムストアのローカライズ名など、指定された名前のローカライズ名を検索する。
%prm
pwszCryptName
pwszCryptName : [wstr] 指定された名前へのポインタ。内部テーブルが検索され、定義済みのローカライズ名と指定された名前を比較する。検索では大文字小文字を区別しない文字列比較を使用してローカライズ名を照合する。
%inst
"Root" システムストアのローカライズ名など、指定された名前のローカライズ名を検索する。

[戻り値]
指定された名前が見つかった場合、ローカライズ名へのポインタが返される。返されたポインタは解放してはならない。
指定された名前が見つからない場合、NULL が返される。

[備考]
CryptSetOIDFunctionValue を次のように呼び出して追加のローカライズ文字列を登録できる。dwEncodingType
= CRYPT_LOCALIZED_NAME_ENCODING_TYPE pszFuncName =
CRYPT_OID_FIND_LOCALIZED_NAME_FUNC pszOID = CRYPT_LOCALIZED_NAME_OID
pwszValueName = ローカライズする名前 (たとえば L"ApplicationStore") dwValueType =
REG_SZ pbValueData = Unicode ローカライズ文字列へのポインタ cbValueData =
(wcslen(Unicode ローカライズ文字列) + 1) * sizeof(WCHAR)
ローカライズ文字列の登録を解除するには CryptSetOIDFunctionValue を次のように呼び出す。pbValueData =
NULL cbValueData = 0。登録された名前は、あらかじめインストールされた名前よりも先に検索される。
（以下省略）


%index
CryptFindOIDInfo
指定されたキー型とキーに一致する、最初の定義済みまたは登録済みの CRYPT_OID_INFO 構造体を取得する。検索は、指定された OID グループ内のオブジェクト識別子 (OID) に制限できる。
%prm
dwKeyType, pvKey, dwGroupId
dwKeyType : [int] OID 情報を検索するときに使用するキー型を指定する。
pvKey : [intptr] 追加の検索情報を含むバッファのアドレス。このパラメータは dwKeyType パラメータの値に依存する。詳細は dwKeyType 以下の表を参照。
dwGroupId : [int] OID 情報を検索するときに使用するグループ識別子。このパラメータを 0 に設定すると、dwKeyType パラメータに従ってすべてのグループが検索される。それ以外の場合、指定された dwGroupId のみが検索される。グループ識別子別に OID 情報を一覧表示するコードの情報については、CryptEnumOIDInfo を参照。
%inst
指定されたキー型とキーに一致する、最初の定義済みまたは登録済みの CRYPT_OID_INFO 構造体を取得する。検索は、指定された
OID グループ内のオブジェクト識別子 (OID) に制限できる。

[戻り値]
CRYPT_OID_INFO
型の定数構造体へのポインタを返す。返されたポインタは解放してはならない。指定されたキーとグループが見つからない場合、NULL が返される。

[備考]
CryptFindOIDInfo 関数は、次の条件下で OID のフレンドリー名を取得するために Active Directory
で検索を実行する。
（以下省略）


%index
CryptFormatObject
CryptFormatObject 関数は、符号化済みデータを書式化し、証明書エンコーディング型に従って割り当てられたバッファ内の Unicode 文字列を返す。
%prm
dwCertEncodingType, dwFormatType, dwFormatStrType, pFormatStruct, lpszStructType, pbEncoded, cbEncoded, pbFormat, pcbFormat
dwCertEncodingType : [int] 証明書に使用されているエンコーディングの型。現在定義されている証明書エンコーディング型は X509_ASN_ENCODING。
dwFormatType : [int] 書式型値。使用されない。0 に設定する。
dwFormatStrType : [int] 構造体の書式型値。このパラメータは 0 にするか、ビットごとの OR 演算子を使用して次のフラグを 1 つ以上組み合わせて指定できる。
pFormatStruct : [intptr] 構造体の書式へのポインタ。使用されない。NULL に設定する。
lpszStructType : [str] 符号化済みデータを定義する OID へのポインタ。lpszStructType パラメータの上位ワードが 0 の場合、下位ワードは指定された構造体の型の整数識別子を指定する。それ以外の場合、このパラメータは NULL 終端文字列への long ポインタとなる。
pbEncoded : [var] 書式化する符号化済みデータへのポインタ。lpszStructType が上記に示した OID の 1 つである場合、pbEncoded は符号化済み拡張となる。
cbEncoded : [int] pbEncoded 構造体のサイズ (バイト単位)。
pbFormat : [intptr] 書式化された文字列を受け取るバッファへのポインタ。指定されたバッファが復号済み構造体を受け取るのに十分な大きさでない場合、関数は ERROR_MORE_DATA を設定し、必要なバッファサイズ (バイト単位) を pcbFormat が指す変数に格納する。メモリ割り当て目的でこの情報のサイズを設定するには、このパラメータを NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbFormat : [var] pbFormat パラメータが指すバッファのサイズ (バイト単位) を指定する変数へのポインタ。関数が戻ると、pcbFormat パラメータが指す変数にはバッファに格納されたバイト数が含まれる。このパラメータは pbFormat が NULL の場合にのみ NULL にできる。
%inst
CryptFormatObject 関数は、符号化済みデータを書式化し、証明書エンコーディング型に従って割り当てられたバッファ内の
Unicode 文字列を返す。

[戻り値]
関数が成功した場合、戻り値は TRUE。成功しない場合、戻り値は FALSE。拡張エラー情報を取得するには GetLastError
関数を使用する。

[備考]
この関数の既定の動作は、符号化済みデータを 1 行表示で返すことである。すなわち、各サブフィールドはコンマ (,) で連結され 1
行にまとめられる。データを複数行で表示する場合、CRYPT_FORMAT_STR_MULTI_LINE
フラグを設定する。そうすると各サブフィールドは別々の行に表示される。lpszStructType
パラメータに対してインストールまたは登録された書式化ルーチンがない場合、符号化済み CRYPT_INTEGER_BLOB の 16
進数ダンプが返される。ユーザーは 16 進数ダンプを無効にするために CRYPT_FORMAT_STR_NO_HEX フラグを設定できる。


%index
CryptFreeOIDFunctionAddress
CryptFreeOIDFunctionAddress 関数は、関数ハンドルの参照カウントを減らすことで CryptGetOIDFunctionAddress または CryptGetDefaultOIDFunctionAddress によって返されたハンドルを解放する。
%prm
hFuncAddr, dwFlags
hFuncAddr : [intptr] CryptGetOIDFunctionAddress または CryptGetDefaultOIDFunctionAddress の呼び出しから以前に取得された関数のハンドル。
dwFlags : [int] 将来使用のために予約されており、0 でなければならない。
%inst
CryptFreeOIDFunctionAddress 関数は、関数ハンドルの参照カウントを減らすことで
CryptGetOIDFunctionAddress または CryptGetDefaultOIDFunctionAddress
によって返されたハンドルを解放する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。

[備考]
参照カウントが 0 になり、解放される関数のために DLL が読み込まれていた場合、DLL がアンロードされる可能性がある。DLL が
DLLCanUnloadNow 関数をエクスポートしている場合、その関数が呼び出され、戻り値がチェックされる。この関数から S_FALSE
が返されると、このタイミングでの DLL アンロードがキャンセルされる。関数が S_TRUE を返すか、DLL が
DLLCanUnloadNow 関数をエクスポートしていない場合、アンロードプロセスが開始される。この場合、実際のアンロードは 15
秒間延期される。DLL を必要とする別の CryptFreeOIDFunctionAddress または
CryptGetDefaultOIDFunctionAddress が 15
秒経過する前に発生した場合、延期されたアンロードプロセスはキャンセルされる。


%index
CryptGetAsyncParam
CryptGetAsyncParam 関数 (wincrypt.h) は非同期パラメータ値を設定する。
%prm
hAsync, pszParamOid, ppvParam, ppfnFree
hAsync : [intptr] 非同期ハンドル。
pszParamOid : [str] パラメータ ID。
ppvParam : [var] パラメータ値を受け取る。
ppfnFree : [var] パラメータが解放されるときに呼び出されるコールバック関数。
%inst
CryptGetAsyncParam 関数 (wincrypt.h) は非同期パラメータ値を設定する。

[戻り値]
成功時は S_OK。


%index
CryptGetDefaultOIDDllList
CryptGetDefaultOIDDllList 関数は、指定された関数セットとエンコーディング型に対して登録された既定のオブジェクト識別子 (OID) 関数を含む DLL ファイルの名前の一覧を取得する。
%prm
hFuncSet, dwEncodingType, pwszDllList, pcchDllList
hFuncSet : [intptr] CryptInitOIDFunctionSet の呼び出しから以前に取得された関数セットハンドル。
dwEncodingType : [int] 一致させるエンコーディング型を指定する。現在、X509_ASN_ENCODING および PKCS_7_ASN_ENCODING のみが使用されているが、将来追加のエンコーディング型が追加される可能性がある。現在の両方のエンコーディング型と一致させるには X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。注意 証明書またはメッセージのエンコーディング型のいずれかが必要。X509_ASN_ENCODING が既定となる。その型が指定されている場合、それが使用される。そうでない場合、PKCS7_ASN_ENCODING 型が指定されていればそれが使用される。
pwszDllList : [int] 0 個以上の NULL 終端のファイル名の一覧を受け取るバッファへのポインタ。返されるリストは NULL 終端文字で終わる。たとえば、2 つの名前のリストは次のようになる。
pcchDllList : [var] pwszDllList パラメータが指す返されるリストのサイズ (ワイド文字単位) を指定する DWORD へのポインタ。関数が戻ると、pcchDllList パラメータが指す変数にはバッファに格納されたワイド文字数が含まれる。
%inst
CryptGetDefaultOIDDllList
関数は、指定された関数セットとエンコーディング型に対して登録された既定のオブジェクト識別子 (OID) 関数を含む DLL
ファイルの名前の一覧を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。この関数には次のエラーコードがある。
（以下省略）


%index
CryptGetDefaultOIDFunctionAddress
CryptGetDefaultOIDFunctionAddress 関数は、既定の関数アドレスを含む DLL を読み込む。
%prm
hFuncSet, dwEncodingType, pwszDll, dwFlags, ppvFuncAddr, phFuncAddr
hFuncSet : [intptr] CryptInitOIDFunctionSet の呼び出しから以前に取得された関数セットハンドル。
dwEncodingType : [int] 一致させるエンコーディング型。現在、X509_ASN_ENCODING および PKCS_7_ASN_ENCODING のみが使用されているが、将来追加のエンコーディング型が追加される可能性がある。現在の両方のエンコーディング型と一致させるには X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。
pwszDll : [wstr] 読み込む DLL の名前。通常、DLL 名は CryptGetDefaultOIDDllList によって返されるリストから取得される。pwszDll が NULL の場合、インストール済みの既定の関数の一覧に対して検索が実行される。
dwFlags : [int] 将来使用のために予約されており、0 でなければならない。
ppvFuncAddr : [var] 戻り関数のアドレスへのポインタ。関数が失敗した場合、NULL が ppvFuncAddr で返される。
phFuncAddr : [var] pwszDll が NULL の場合にのみ使用される。この関数への最初の呼び出しでは、最初にインストールされている関数を取得するために *phFuncAddr は NULL でなければならない。
%inst
CryptGetDefaultOIDFunctionAddress 関数は、既定の関数アドレスを含む DLL を読み込む。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。


%index
CryptGetKeyIdentifierProperty
CryptGetKeyIdentifierProperty は指定された鍵識別子から特定のプロパティを取得する。
%prm
pKeyIdentifier, dwPropId, dwFlags, pwszComputerName, pvReserved, pvData, pcbData
pKeyIdentifier : [var] 鍵識別子を含む CRYPT_HASH_BLOB へのポインタ。
dwPropId : [int] 取得するプロパティを識別する。dwPropId の値が pvData パラメータの型と内容を決定する。任意の証明書プロパティ ID を使用できる。
dwFlags : [int] 次のフラグを使用できる。これらはビットごとの OR 演算で組み合わせることができる。
pwszComputerName : [wstr] 検索するリモートコンピュータの名前へのポインタ。CRYPT_KEYID_MACHINE_FLAG フラグが設定されている場合、リモートコンピュータから鍵識別子のリストが検索される。リモートコンピュータではなくローカルコンピュータを検索する場合、pwszComputerName を NULL に設定する。
pvReserved : [intptr] 将来使用のために予約されており、NULL でなければならない。
pvData : [intptr] dwPropId によって決定されるデータを受け取るバッファへのポインタ。pvData 構造体内のフィールドが指す要素は構造体の後に続く。したがって、pcbData に含まれるサイズが構造体のサイズを超えることがある。
pcbData : [var] pvData パラメータが指すバッファのサイズ (バイト単位) を含む DWORD へのポインタ。関数が戻ると、DWORD にはバッファに格納されたバイト数が含まれる。pcbData が指す変数に含まれるサイズは、構造体が補助データへのポインタを含むことができるため、CRYPT_KEY_PROV_INFO 構造体よりも大きいサイズを示す場合がある。このサイズは構造体が必要とするサイズとすべての補助データのサイズの合計である。
%inst
CryptGetKeyIdentifierProperty は指定された鍵識別子から特定のプロパティを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
CryptGetMessageCertificates
CryptGetMessageCertificates 関数は、メッセージの証明書および CRL を含む開かれた証明書ストアのハンドルを返す。この関数は lpszStoreProvider パラメータとしてプロバイダ型 CERT_STORE_PROV_PKCS7 を使用して CertOpenStore を呼び出す。
%prm
dwMsgAndCertEncodingType, hCryptProv, dwFlags, pbSignedBlob, cbSignedBlob
dwMsgAndCertEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
hCryptProv : [int] このパラメータは使用されず、NULL に設定すべきである。Windows Server 2003 および Windows XP: CertOpenStore に渡される CSP のハンドル。詳細は CertOpenStore を参照。hCryptProv に特定の暗号プロバイダを渡す強い理由がない限り、既定の RSA または DSS プロバイダを取得させるために 0 を渡す。このパラメータのデータ型は HCRYPTPROV。
dwFlags : [int] CertOpenStore に渡されるフラグ。詳細は CertOpenStore を参照。
pbSignedBlob : [var] 署名されたメッセージを含むバッファの CRYPT_INTEGER_BLOB 構造体へのポインタ。
cbSignedBlob : [int] 署名されたメッセージのサイズ (バイト単位)。
%inst
CryptGetMessageCertificates 関数は、メッセージの証明書および CRL
を含む開かれた証明書ストアのハンドルを返す。この関数は lpszStoreProvider パラメータとしてプロバイダ型
CERT_STORE_PROV_PKCS7 を使用して CertOpenStore を呼び出す。

[戻り値]
メッセージの証明書および CRL を含む証明書ストアを返す。エラーの場合は NULL が返される。GetLastError
関数で最も一般的に返されるエラーコードを以下に示す。
（以下省略）

[備考]
エラーの原因を特定するには GetLastError を使用する。


%index
CryptGetMessageSignerCount
CryptGetMessageSignerCount 関数は、署名されたメッセージの署名者数を返す。
%prm
dwMsgEncodingType, pbSignedBlob, cbSignedBlob
dwMsgEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
pbSignedBlob : [var] 署名されたメッセージを含むバッファへのポインタ。
cbSignedBlob : [int] 署名されたメッセージのサイズ (バイト単位)。
%inst
CryptGetMessageSignerCount 関数は、署名されたメッセージの署名者数を返す。

[戻り値]
署名されたメッセージの署名者数を返す。署名者がいない場合は 0、エラーの場合は -1 を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。次のエラーコードが最も一般的に返される。
（以下省略）


%index
CryptGetOIDFunctionAddress
登録済みおよびインストール済みの関数の一覧から、エンコーディング型とオブジェクト識別子 (OID) の一致を検索する。
%prm
hFuncSet, dwEncodingType, pszOID, dwFlags, ppvFuncAddr, phFuncAddr
hFuncSet : [intptr] CryptInitOIDFunctionSet 関数の呼び出しから以前に取得された関数セットハンドル。
dwEncodingType : [int] 一致させるエンコーディング型を指定する。現在、X509_ASN_ENCODING および PKCS_7_ASN_ENCODING のみが使用されているが、将来追加のエンコーディング型が追加される可能性がある。現在の両方のエンコーディング型と一致させるには X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。エンコーディング型を使用しない関数の場合、このパラメータを 0 に設定する。
pszOID : [str] OID の上位ワードが 0 以外の場合、pszOID は "2.5.29.1" のような OID 文字列または "file" のような ASCII 文字列へのポインタとなる。OID の上位ワードが 0 の場合、下位ワードはオブジェクト識別子として使用される数値識別子を指定する。この結果の OID は、同じ OID でインストールまたは登録された関数にマップされる。
dwFlags : [int] このパラメータには次の値を指定できる。
ppvFuncAddr : [var] 関数アドレスへのポインタへのポインタ。一致が見つかった場合、ppvFuncAddr は関数アドレスを指す。
phFuncAddr : [var] 一致が見つかった場合、phFuncAddr は関数ハンドルを指す。ハンドルの参照カウントは増分される。ハンドルの使用が終了したら、CryptFreeOIDFunctionAddress 関数を呼び出してハンドルを解放する。
%inst
登録済みおよびインストール済みの関数の一覧から、エンコーディング型とオブジェクト識別子 (OID) の一致を検索する。

[戻り値]
関数が成功し、一致が見つかった場合、戻り値は 0 以外 (TRUE)。関数が失敗したか、一致が見つからない場合は 0 (FALSE)
を返す。拡張エラー情報を取得するには GetLastError を呼び出す。

[備考]
次のコールバック関数の既定のインストール可能な関数を取得するには、pszOID 引数を
CMSG_DEFAULT_INSTALLABLE_FUNC_OID に設定して CryptGetOIDFunctionAddress
を呼び出すことができる。既定の関数の取得には、dwEncodingType に次のエンコーディング型のビットごとの OR
の組み合わせを設定する。CRYPT_ASN_ENCODING X509_ASN_ENCODING


%index
CryptGetOIDFunctionValue
CryptGetOIDFunctionValue 関数は、OID に関連付けられた値を照会する。
%prm
dwEncodingType, pszFuncName, pszOID, pwszValueName, pdwValueType, pbValueData, pcbValueData
dwEncodingType : [int] 一致させるエンコーディング型を指定する。現在、X509_ASN_ENCODING および PKCS_7_ASN_ENCODING のみが使用されているが、将来追加のエンコーディング型が追加される可能性がある。現在の両方のエンコーディング型と一致させるには X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。
pszFuncName : [str] OID 関数セットの名前を含む NULL 終端文字列へのポインタ。
pszOID : [str] OID の上位ワードが 0 以外の場合、pszOID は "2.5.29.1" のような NULL 終端の OID 文字列、または "file" のような NULL 終端の ASCII 文字列へのポインタとなる。OID の上位ワードが 0 の場合、下位ワードはオブジェクト識別子として使用される数値識別子を指定する。
pwszValueName : [wstr] 照会する値の名前を含む NULL 終端の Unicode 文字列へのポインタ。
pdwValueType : [var] 値の型を受け取る変数へのポインタ。このパラメータで返される型は次のいずれかとなる。
pbValueData : [var] pwszValueName パラメータに関連付けられた値を受け取るバッファへのポインタ。バッファは NULL 終端文字を格納するのに十分な大きさでなければならない。返されるデータが不要な場合、このパラメータは NULL にできる。メモリ割り当て目的でバッファのサイズを取得するためにも NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbValueData : [var] pbValueData が指すバッファのサイズ (バイト単位) を指定する DWORD へのポインタ。ほとんどの場合、*pcbValueData で返される値は文字列内の NULL 終端文字のサイズを含む。NULL 文字が含まれない状況の詳細については、RegQueryValueEx の「備考」セクションを参照。注意 バッファ内で返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用しなければならない。実際のサイズは入力で指定されたバッファのサイズよりわずかに小さい場合がある。出力時には、このパラメータが指す変数は実際のデータサイズを反映するよう更新される。
%inst
CryptGetOIDFunctionValue 関数は、OID に関連付けられた値を照会する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。この関数には次のエラーコードがある。
（以下省略）


%index
CryptHashCertificate
CryptHashCertificate 関数は、署名を含む証明書の符号化済みコンテンツ全体をハッシュ化する。
%prm
hCryptProv, Algid, dwFlags, pbEncoded, cbEncoded, pbComputedHash, pcbComputedHash
hCryptProv : [int] このパラメータは使用されず、NULL に設定すべきである。Windows Server 2003 および Windows XP: ハッシュの計算に使用する暗号サービスプロバイダ (CSP) のハンドル。
Algid : [int] 使用するハッシュアルゴリズムを指定する ALG_ID 構造体。Algid が 0 の場合、既定のハッシュアルゴリズムである SHA1 が使用される。
dwFlags : [int] ハッシュ API に渡される値。詳細は CryptCreateHash を参照。
pbEncoded : [var] ハッシュ化する符号化済みコンテンツのアドレス。
cbEncoded : [int] 符号化済みコンテンツのサイズ (バイト単位)。
pbComputedHash : [var] 計算されたハッシュを受け取るバッファへのポインタ。
pcbComputedHash : [var] pbComputedHash パラメータが指すバッファのサイズ (バイト単位) を含む DWORD へのポインタ。関数が戻ると、DWORD にはバッファに格納されたバイト数が含まれる。
%inst
CryptHashCertificate 関数は、署名を含む証明書の符号化済みコンテンツ全体をハッシュ化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。注意 呼び出された
CryptCreateHash、CryptGetHashParam、CryptHashData
関数のエラーがこの関数に伝播することがある。


%index
CryptHashCertificate2
CNG ハッシュプロバイダを使用してデータブロックをハッシュする。
%prm
pwszCNGHashAlgid, dwFlags, pvReserved, pbEncoded, cbEncoded, pbComputedHash, pcbComputedHash
pwszCNGHashAlgid : [wstr] 証明書をハッシュするために使用するハッシュアルゴリズムの CNG ハッシュアルゴリズム識別子を含む NULL 終端の Unicode 文字列のアドレス。これはハッシュアルゴリズムを表す CNG アルゴリズム識別子、またはその他の登録済みハッシュアルゴリズム識別子にできる。
dwFlags : [int] この関数の動作を変更する一連のフラグ。この関数にはフラグは定義されていない。
pvReserved : [intptr] 将来使用のために予約されており、NULL でなければならない。
pbEncoded : [var] ハッシュ化するバイト配列のアドレス。cbEncoded パラメータにはこの配列のサイズが含まれる。
cbEncoded : [int] pbEncoded 配列の要素数。
pbComputedHash : [var] 計算されたハッシュを受け取るバッファのアドレス。pcbComputedHash パラメータが指す変数にはこのバッファのサイズが含まれる。
pcbComputedHash : [var] 入力時に pbComputedHash バッファのサイズ (バイト単位) を含む DWORD 変数のアドレス。この関数が戻ると、この変数には pbComputedHash バッファにコピーされたバイト数が含まれる。
%inst
CNG ハッシュプロバイダを使用してデータブロックをハッシュする。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError
を呼び出す。想定されるエラーコードの一部は次のトピックに示されている。BCryptOpenAlgorithmProvider、BCryptCreateHash、BCryptGetProperty、BCryptHashData、BCryptFinishHash。


%index
CryptHashMessage
メッセージのハッシュを作成する。
%prm
pHashPara, fDetachedHash, cToBeHashed, rgpbToBeHashed, rgcbToBeHashed, pbHashedBlob, pcbHashedBlob, pbComputedHash, pcbComputedHash
pHashPara : [var] ハッシュパラメータを含む CRYPT_HASH_MESSAGE_PARA 構造体へのポインタ。
fDetachedHash : [int] このパラメータが TRUE に設定されている場合、pbHashedBlob には pbComputedHash のみが符号化される。それ以外の場合、rgpbToBeHashed と pbComputedHash の両方が符号化される。
cToBeHashed : [int] rgpbToBeHashed と rgcbToBeHashed の配列要素数。fDetachedHash が TRUE に設定されていない限り、このパラメータは 1 のみを指定できる。
rgpbToBeHashed : [var] ハッシュ化するコンテンツを含むバッファへのポインタの配列。
rgcbToBeHashed : [var] rgpbToBeHashed が指すバッファのサイズ (バイト単位) の配列。
pbHashedBlob : [var] 送信用に符号化されたハッシュ化済みメッセージを受け取るバッファへのポインタ。
pcbHashedBlob : [var] pbHashedBlob パラメータが指すバッファのサイズ (バイト単位) を指定する DWORD へのポインタ。関数が戻ると、この変数には pbHashedBlob にコピーされた復号済みメッセージのサイズ (バイト単位) が含まれる。このパラメータは DWORD のアドレスでなければならず、NULL にすると、バッファの長さが返されない。
pbComputedHash : [var] 新しく作成されたハッシュ値を受け取るバッファへのポインタ。新しく作成されたハッシュが追加の処理に不要な場合、またはメモリ割り当て目的でハッシュのサイズを設定する場合、このパラメータは NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbComputedHash : [var] pbComputedHash パラメータが指すバッファのサイズ (バイト単位) を指定する DWORD へのポインタ。関数が戻ると、この DWORD には pbComputedHash にコピーされた新しく作成されたハッシュのサイズ (バイト単位) が含まれる。
%inst
メッセージのハッシュを作成する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。注意 呼び出された
CryptCreateHash、CryptHashData、CryptGetHashParam
関数のエラーがこの関数に伝播することがある。GetLastError 関数は最も一般的に次のエラーコードを返す。
（以下省略）


%index
CryptHashPublicKeyInfo
CERT_PUBLIC_KEY_INFO 構造体内の公開鍵情報を符号化し、符号化されたバイト列のハッシュを計算する。
%prm
hCryptProv, Algid, dwFlags, dwCertEncodingType, pInfo, pbComputedHash, pcbComputedHash
hCryptProv : [int] このパラメータは使用されず、NULL に設定すべきである。Windows Server 2003 および Windows XP: ハッシュの計算に使用する暗号サービスプロバイダ (CSP) のハンドル。このパラメータのデータ型は HCRYPTPROV。hCryptProv で特定の暗号プロバイダを渡す強い理由がない限り、0 を渡す。0 を渡すと、ハッシュ、署名検証、または受信者暗号化操作を行う前に既定の RSA または Digital Signature Standard (DSS) プロバイダが取得される。
Algid : [int] 使用する CryptoAPI ハッシュアルゴリズムを指定する ALG_ID 構造体。Algid が 0 の場合、既定のハッシュアルゴリズムである MD5 が使用される。
dwFlags : [int] CryptCreateHash に渡される値。
dwCertEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
pInfo : [var] 符号化およびハッシュ化する公開鍵情報を含む CERT_PUBLIC_KEY_INFO 構造体へのポインタ。
pbComputedHash : [var] 計算されたハッシュを受け取るバッファへのポインタ。メモリ割り当て目的でこの情報のサイズを設定するには、このパラメータを NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbComputedHash : [var] pbComputedHash パラメータが指すバッファのサイズ (バイト単位) を含む DWORD へのポインタ。関数が戻ると、DWORD にはバッファに格納されたバイト数が含まれる。注意 バッファ内で返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用する必要がある。実際のサイズは入力で指定されたバッファのサイズよりわずかに小さい場合がある。出力時には、このパラメータが指す変数は実際のデータサイズを反映するよう更新される。
%inst
CERT_PUBLIC_KEY_INFO 構造体内の公開鍵情報を符号化し、符号化されたバイト列のハッシュを計算する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。注意 呼び出された
CryptCreateHash、CryptGetHashParam、CryptHashData
関数のエラーがこの関数に伝播することがある。この関数には次のエラーコードがある。
（以下省略）


%index
CryptHashToBeSigned
重要 この API は廃止予定。(CryptHashToBeSigned)
%prm
hCryptProv, dwCertEncodingType, pbEncoded, cbEncoded, pbComputedHash, pcbComputedHash
hCryptProv : [int] このパラメータは使用されず、NULL に設定すべきである。Windows Server 2003 および Windows XP: ハッシュの計算に使用する暗号サービスプロバイダ (CSP) のハンドル。このパラメータのデータ型は HCRYPTPROV。hCryptProv で特定の暗号プロバイダを渡す強い理由がない限り、0 を渡す。0 を渡すと、ハッシュ、署名検証、または受信者暗号化操作を行う前に既定の RSA または Digital Signature Standard (DSS) プロバイダが取得される。
dwCertEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
pbEncoded : [var] ハッシュ化するコンテンツを含むバッファのアドレス。これは CERT_SIGNED_CONTENT_INFO の符号化形式。
cbEncoded : [int] バッファのサイズ (バイト単位)。
pbComputedHash : [var] 計算されたハッシュを受け取るバッファへのポインタ。メモリ割り当て目的でこの情報のサイズを設定するには、このパラメータを NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbComputedHash : [var] pbComputedHash パラメータが指すバッファのサイズ (バイト単位) を含む DWORD へのポインタ。関数が戻ると、DWORD にはバッファに格納されたバイト数が含まれる。注意 バッファ内で返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用する必要がある。実際のサイズは入力で指定されたバッファのサイズよりわずかに小さい場合がある。出力時には、このパラメータが指す変数は実際のデータサイズを反映するよう更新される。
%inst
重要 この API は廃止予定。(CryptHashToBeSigned)

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。注意 呼び出された
CryptCreateHash、CryptGetHashParam、CryptHashData
関数のエラーがこの関数に伝播することがある。この関数には次のエラーコードがある。
（以下省略）


%index
CryptImportPKCS8
PKCS 形式で秘密鍵をインポートする。
%prm
sPrivateKeyAndParams, dwFlags, phCryptProv, pvAuxInfo
sPrivateKeyAndParams : [var] 秘密鍵 BLOB と対応するパラメータを含む CRYPT_PKCS8_IMPORT_PARAMS 構造体。
dwFlags : [int] 
phCryptProv : [var] CryptImportPKCS8 関数の呼び出しによって鍵がインポートされたプロバイダのハンドルを受け取る HCRYPTPROV へのポインタ。ハンドルの使用が終了したら、CryptReleaseContext を呼び出してハンドルを解放する。このパラメータは NULL にでき、その場合プロバイダのハンドルは返されない。
pvAuxInfo : [intptr] このパラメータは NULL でなければならない。
%inst
PKCS 形式で秘密鍵をインポートする。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。次のエラーコードはこの関数に固有のものである。
（以下省略）

[備考]
CryptImportPKCS8 は、sPrivateKeyAndParams パラメータに含まれる
CRYPT_PKCS8_IMPORT_PARAMS 構造体を使用して PCRYPT_RESOLVE_HCRYPTPROV_FUNC
関数を呼び出し、鍵をインポートするプロバイダのハンドルを取得する。PCRYPT_RESOLVE_HCRYPTPROV_FUNC が
NULL の場合、既定のプロバイダが使用される。この関数は非対称鍵に対してのみサポートされる。


%index
CryptImportPublicKeyInfo
公開鍵情報を変換してプロバイダにインポートし、公開鍵のハンドルを返す。
%prm
hCryptProv, dwCertEncodingType, pInfo, phKey
hCryptProv : [int] 公開鍵をインポートするときに使用する暗号サービスプロバイダ (CSP) のハンドル。このハンドルは CryptAcquireContext を使用してあらかじめ作成されている必要がある。
dwCertEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
pInfo : [var] プロバイダにインポートする公開鍵を含む CERT_PUBLIC_KEY_INFO 構造体のアドレス。
phKey : [var] インポートされた公開鍵のハンドルを受け取る HCRYPTKEY 変数のアドレス。公開鍵の使用が終了したら、CryptDestroyKey 関数を呼び出してハンドルを解放する。
%inst
公開鍵情報を変換してプロバイダにインポートし、公開鍵のハンドルを返す。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。注意 呼び出された CryptGetUserKey および CryptExportKey
関数のエラーがこの関数に伝播することがある。この関数には次のエラーコードがある。
（以下省略）

[備考]
この関数は通常、証明書から公開鍵を取得するために使用される。これは、次の擬似コードに示すように、記入済みの証明書構造体から
CERT_PUBLIC_KEY_INFO 構造体を渡すことで行われる。
（以下省略）


%index
CryptImportPublicKeyInfoEx
重要 この API は廃止予定。(CryptImportPublicKeyInfoEx)
%prm
hCryptProv, dwCertEncodingType, pInfo, aiKeyAlg, dwFlags, pvAuxInfo, phKey
hCryptProv : [int] インポートされた公開鍵を受け取る CSP のハンドル。このハンドルは CryptAcquireContext を使用してあらかじめ作成されている必要がある。
dwCertEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
pInfo : [var] プロバイダにインポートする公開鍵を含む CERT_PUBLIC_KEY_INFO 構造体のアドレス。注意 pInfo が指す Algorithm メンバの pzObjId メンバと dwCertEncodingType パラメータによって、インストール可能な CRYPT_OID_IMPORT_PUBLIC_KEY_INFO_FUNC コールバック関数が決定される。インストール可能な関数が見つからない場合、RSA 公開鍵 (szOID_RSA_RSA) として鍵をインポートする試みが行われる。
aiKeyAlg : [int] 既定の CALG_RSA_KEYX アルゴリズムを上書きする CSP 固有のアルゴリズムを含む ALG_ID 構造体。
dwFlags : [int] 将来使用のために予約されており、0 でなければならない。
pvAuxInfo : [intptr] 将来使用のために予約されており、NULL でなければならない。
phKey : [var] インポートされた公開鍵のハンドルを受け取る HCRYPTKEY 変数のアドレス。公開鍵の使用が終了したら、CryptDestroyKey 関数を呼び出してハンドルを解放する。
%inst
重要 この API は廃止予定。(CryptImportPublicKeyInfoEx)

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。注意 呼び出された CryptGetUserKey および CryptExportKey
関数のエラーがこの関数に伝播することがある。この関数には次のエラーコードがある。
（以下省略）

[備考]
この関数は通常、証明書から公開鍵を取得するために使用される。これは、次の擬似コードに示すように、記入済みの証明書構造体から
CERT_PUBLIC_KEY_INFO 構造体を渡すことで行われる。
（以下省略）


%index
CryptImportPublicKeyInfoEx2
公開鍵オブジェクト識別子 (OID) に対応する CNG 非対称プロバイダに公開鍵をインポートし、鍵の CNG ハンドルを返す。
%prm
dwCertEncodingType, pInfo, dwFlags, pvAuxInfo, phKey
dwCertEncodingType : [int] サブジェクトを暗号化するために使用された証明書エンコーディング型。この値の上位 WORD に含まれるメッセージエンコーディング型識別子は、この関数では無視される。
pInfo : [var] プロバイダにインポートする公開鍵情報を含む CERT_PUBLIC_KEY_INFO 構造体のアドレス。
dwFlags : [int] 
pvAuxInfo : [intptr] このパラメータは将来使用のために予約されており、NULL に設定しなければならない。
phKey : [var] インポートされた鍵のハンドルを受け取る BCRYPT_KEY_HANDLE 変数のアドレス。このハンドルが不要になったら、BCryptDestroyKey 関数を呼び出して解放しなければならない。
%inst
公開鍵オブジェクト識別子 (OID) に対応する CNG 非対称プロバイダに公開鍵をインポートし、鍵の CNG ハンドルを返す。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。想定されるエラーコードには次のものが含まれるが、これらに限定されない。
（以下省略）


%index
CryptInitOIDFunctionSet
CryptInitOIDFunctionSet は、指定された関数セット名で識別される OID 関数セットを初期化してそのハンドルを返す。
%prm
pszFuncName, dwFlags
pszFuncName : [str] OID 関数セットの名前。
dwFlags : [int] 将来使用のために予約されており、0 でなければならない。
%inst
CryptInitOIDFunctionSet は、指定された関数セット名で識別される OID 関数セットを初期化してそのハンドルを返す。

[戻り値]
pszFuncName によって識別される OID 関数セットのハンドルを返す。関数が失敗した場合は NULL を返す。


%index
CryptInstallDefaultContext
指定されたアルゴリズムの既定のコンテキストプロバイダとして特定のプロバイダをインストールする。
%prm
hCryptProv, dwDefaultType, pvDefaultPara, dwFlags, pvReserved, phDefaultContext
hCryptProv : [int] 既定のコンテキストとして使用する暗号サービスプロバイダのハンドル。このハンドルは CryptAcquireContext 関数を使用して取得される。
dwDefaultType : [int] 
pvDefaultPara : [intptr] 既定のコンテキストプロバイダをインストールするオブジェクトを指定する。このパラメータの形式は dwDefaultType パラメータの内容によって異なる。
dwFlags : [int] 
pvReserved : [intptr] このパラメータは将来使用のために予約されている。
phDefaultContext : [var] 既定のコンテキストハンドルを受け取る HCRYPTDEFAULTCONTEXT 変数のアドレス。このハンドルは既定のコンテキストプロバイダをアンインストールするために CryptUninstallDefaultContext 関数に渡される。
%inst
指定されたアルゴリズムの既定のコンテキストプロバイダとして特定のプロバイダをインストールする。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]

インストール済みの既定のコンテキストプロバイダはスタック順に並べられており、既定のコンテキストプロバイダを検索する場合、システムは最も新しくインストールされたプロバイダから開始する。プロバイダのスレッドごとのリストは、プロバイダのプロセスごとのリストの前に検索される。一致が見つかると、システムは他の一致の検索を続行しない。インストールされたプロバイダハンドルは、CryptUninstallDefaultContext
が呼び出されるか、スレッドまたはプロセスが終了するまで使用可能なままでなければならない。


%index
CryptInstallOIDFunctionAddress
CryptInstallOIDFunctionAddress 関数は、呼び出し可能なオブジェクト識別子 (OID) 関数アドレスのセットをインストールする。
%prm
hModule, dwEncodingType, pszFuncName, cFuncEntry, rgFuncEntry, dwFlags
hModule : [intptr] このパラメータは、CryptGetOIDFunctionAddress または CryptFreeOIDFunctionAddress によって、関数アドレスを含む DLL がアンロードされないように、DllMain に渡される hModule パラメータで更新される。これは、DLL が CryptRegisterOIDFunction を介して OID 関数も登録している場合に当てはまる。
dwEncodingType : [int] 一致させるエンコーディング型を指定する。現在、X509_ASN_ENCODING および PKCS_7_ASN_ENCODING のみが使用されているが、将来追加のエンコーディング型が追加される可能性がある。現在の両方のエンコーディング型と一致させるには X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。
pszFuncName : [str] インストールされる関数セットの名前。
cFuncEntry : [int] rgFuncEntry[] の配列要素数。
rgFuncEntry : [var] CRYPT_OID_FUNC_ENTRY 構造体の配列。各要素には OID と、それに関連付けられたルーチンの開始アドレスが含まれる。
dwFlags : [int] 既定では、新しい関数セットは関数セットの一覧の末尾にインストールされる。CRYPT_INSTALL_OID_FUNC_BEFORE_FLAG フラグを設定すると、関数セットは一覧の先頭にインストールされる。
%inst
CryptInstallOIDFunctionAddress 関数は、呼び出し可能なオブジェクト識別子 (OID)
関数アドレスのセットをインストールする。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。


%index
CryptMemAlloc
CryptMemAlloc 関数はバッファのメモリを割り当てる。割り当てられたバッファを返すすべての Crypt32.lib 関数で使用される。
%prm
cbSize
cbSize : [int] 割り当てるバイト数。
%inst
CryptMemAlloc 関数はバッファのメモリを割り当てる。割り当てられたバッファを返すすべての Crypt32.lib
関数で使用される。

[戻り値]
割り当てられたバッファへのポインタを返す。関数が失敗した場合は NULL を返す。バッファの使用が終了したら、CryptMemFree
関数を呼び出してメモリを解放する。


%index
CryptMemFree
CryptMemFree 関数は、CryptMemAlloc または CryptMemRealloc によって割り当てられたメモリを解放する。
%prm
pv
pv : [intptr] 解放するバッファへのポインタ。
%inst
CryptMemFree 関数は、CryptMemAlloc または CryptMemRealloc
によって割り当てられたメモリを解放する。


%index
CryptMemRealloc
CryptMemRealloc 関数は、バッファに現在割り当てられているメモリを解放し、新しいバッファのメモリを割り当てる。
%prm
pv, cbSize
pv : [intptr] 現在割り当てられているバッファへのポインタ。
cbSize : [int] 割り当てるバイト数。
%inst
CryptMemRealloc 関数は、バッファに現在割り当てられているメモリを解放し、新しいバッファのメモリを割り当てる。

[戻り値]
割り当てられたバッファへのポインタを返す。関数が失敗した場合は NULL を返す。バッファの使用が終了したら、CryptMemFree
関数を呼び出してメモリを解放する。


%index
CryptMsgCalculateEncodedLength
メッセージの型、エンコーディングパラメータ、および符号化されるデータの合計長を指定して、符号化された暗号メッセージに必要な最大バイト数を計算する。
%prm
dwMsgEncodingType, dwFlags, dwMsgType, pvMsgEncodeInfo, pszInnerContentObjID, cbData
dwMsgEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
dwFlags : [int] 現在定義されているフラグは次の表に示す。
dwMsgType : [int] 現在定義されているメッセージ型は次の表に示す。
pvMsgEncodeInfo : [intptr] 符号化するデータへのポインタ。指し示すデータの型は dwMsgType の値に依存する。詳細は dwMsgType の表を参照。
pszInnerContentObjID : [str] CryptMsgUpdate に渡されるデータがすでに符号化されている状態で CryptMsgCalculateEncodedLength を呼び出す場合、適切なオブジェクト識別子を pszInnerContentObjID に渡す。pszInnerContentObjID が NULL の場合、内部コンテンツ型はあらかじめ符号化されていないものと見なされ、オクテット文字列として符号化され、CMSG_DATA 型が付与される。
cbData : [int] コンテンツのサイズ (バイト単位)。
%inst

メッセージの型、エンコーディングパラメータ、および符号化されるデータの合計長を指定して、符号化された暗号メッセージに必要な最大バイト数を計算する。

[戻り値]
符号化された暗号メッセージに必要な長さを返す。この長さは正確な長さではない場合もあるが、必要な長さを下回ることはない。関数が失敗した場合は
0 を返す。拡張エラー情報を取得するには GetLastError 関数を使用する。次の表に最も一般的に返されるエラーコードを示す。
（以下省略）


%index
CryptMsgClose
CryptMsgClose 関数は暗号メッセージハンドルを閉じる。この関数の呼び出しごとに、メッセージの参照カウントが 1 つ減らされる。参照カウントが 0 に達すると、メッセージは完全に解放される。
%prm
hCryptMsg
hCryptMsg : [intptr] 閉じる暗号メッセージのハンドル。
%inst
CryptMsgClose 関数は暗号メッセージハンドルを閉じる。この関数の呼び出しごとに、メッセージの参照カウントが 1
つ減らされる。参照カウントが 0 に達すると、メッセージは完全に解放される。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
CryptMsgControl
CryptMsgUpdate 関数への最後の呼び出しでメッセージが復号された後に、制御操作を実行する。
%prm
hCryptMsg, dwFlags, dwCtrlType, pvCtrlPara
hCryptMsg : [intptr] 制御を適用する暗号メッセージのハンドル。
dwFlags : [int] 次の値は、dwCtrlType パラメータが次のいずれかの場合に定義される。
dwCtrlType : [int] 実行する操作の型。現在定義されているメッセージ制御型と、pvCtrlPara パラメータに渡される構造体の型は次の表に示す。
pvCtrlPara : [intptr] dwCtrlType の値によって決まる構造体へのポインタ。
%inst
CryptMsgUpdate 関数への最後の呼び出しでメッセージが復号された後に、制御操作を実行する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合、戻り値は 0 であり、GetLastError 関数は Abstract
Syntax Notation One (ASN.1) のエンコード/デコードエラーを返す。これらのエラーの情報については、ASN.1
Encoding/Decoding Return Values
を参照。ストリームされたエンベロープメッセージが復号されている場合、CryptMsgOpenToDecode 関数の
pStreamInfo パラメータで指定されたアプリケーション定義のコールバック関数で発生したエラーが CryptMsgControl
関数に伝播することがある。これが発生した場合、コールバック関数が戻った後に CryptMsgControl 関数は
SetLastError
関数を呼び出さない。これにより、アプリケーションの制御下で発生したエラーが保持される。アプリケーションがストリームされたデータを処理している間にエラーが発生した場合、SetLastError
関数を呼び出すのはコールバック関数 (またはそれが呼び出す API の 1 つ) の責任である。
（以下省略）


%index
CryptMsgCountersign
メッセージ内の既存の署名を副署する。
%prm
hCryptMsg, dwIndex, cCountersigners, rgCountersigners
hCryptMsg : [intptr] 使用する暗号メッセージハンドル。
dwIndex : [int] 副署される署名済みまたは署名済み・エンベロープメッセージ内の署名者のゼロから始まるインデックス。
cCountersigners : [int] rgCountersigners 配列の副署者数。
rgCountersigners : [var] 副署者の CMSG_SIGNER_ENCODE_INFO 構造体の配列。
%inst
メッセージ内の既存の署名を副署する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。CryptMsgCountersignEncoded
からエラーが伝播することがある。次のエラーコードが最も一般的に返される。
（以下省略）


%index
CryptMsgCountersignEncoded
既存の PKCS に副署する。
%prm
dwEncodingType, pbSignerInfo, cbSignerInfo, cCountersigners, rgCountersigners, pbCountersignature, pcbCountersignature
dwEncodingType : [int] 使用するエンコーディングの型を指定する。現在、X509_ASN_ENCODING および PKCS_7_ASN_ENCODING のみが使用されているが、将来追加のエンコーディング型が追加される可能性がある。現在の両方のエンコーディング型には X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。
pbSignerInfo : [var] 副署される符号化済み SignerInfo へのポインタ。
cbSignerInfo : [int] 符号化された SignerInfo データのバイト数。
cCountersigners : [int] rgCountersigners 配列の副署者数。
rgCountersigners : [var] 副署者の CMSG_SIGNER_ENCODE_INFO 構造体の配列。
pbCountersignature : [var] 符号化された PKCS #9 副署属性を受け取るバッファへのポインタ。入力時、このパラメータはメモリ割り当て目的でこの情報のサイズを設定するために NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbCountersignature : [var] pbCountersignature パラメータが指すバッファのサイズ (バイト単位) を指定する変数へのポインタ。関数が戻ると、pcbCountersignature パラメータが指す変数にはバッファに格納されたバイト数が含まれる。
%inst
既存の PKCS に副署する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。次の表に、GetLastError 関数で最も一般的に返されるエラーコードを示す。
（以下省略）


%index
CryptMsgDuplicate
CryptMsgDuplicate 関数は、参照カウントを増やすことによって暗号メッセージハンドルを複製する。
%prm
hCryptMsg
hCryptMsg : [intptr] 複製する暗号メッセージのハンドル。複製はメッセージの参照カウントを増やすことによって行われる。メッセージのコピーは作成されない。
%inst
CryptMsgDuplicate 関数は、参照カウントを増やすことによって暗号メッセージハンドルを複製する。

[戻り値]

返されるハンドルは入力ハンドルと同じである。メッセージのコピーは作成されない。複製されたメッセージハンドルの使用が終了したら、CryptMsgClose
関数を呼び出して参照カウントを減らす。

[備考]
CryptMsgDuplicate は、HCRYPTMSG ハンドルの参照カウントを増やして、実際にハンドルを解放するために
CryptMsgClose を複数回呼び出す必要があるようにするために使用される。


%index
CryptMsgEncodeAndSignCTL
CryptMsgEncodeAndSignCTL 関数は、CTL を符号化し、符号化された CTL を含む署名済みメッセージを作成する。この関数はまず pCtlInfo が指す CTL を符号化し、次に CryptMsgSignCTL を呼び出して符号化されたメッセージに署名する。
%prm
dwMsgEncodingType, pCtlInfo, pSignInfo, dwFlags, pbEncoded, pcbEncoded
dwMsgEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
pCtlInfo : [var] 符号化および署名する CTL を含む CTL_INFO 構造体へのポインタ。
pSignInfo : [var] CMSG_SIGNER_ENCODE_INFO 構造体の配列を含む CMSG_SIGNED_ENCODE_INFO 構造体へのポインタ。構造体の cbSize メンバを構造体のサイズに設定し、他のすべてのメンバを 0 に設定すると、署名者なしでメッセージを符号化することができる。
dwFlags : [int] CTL エントリを符号化前にソートする場合、CMSG_ENCODE_SORTED_CTL_FLAG を設定する。このフラグは、CertFindSubjectInSortedCTL または CertEnumSubjectInSortedCTL 関数が呼び出される場合に設定される。CMSG_ENCODE_SORTED_CTL_FLAG が設定され、TrustedSubjects の識別子が MD5 や SHA1 などのハッシュである場合、CMSG_ENCODE_HASHED_SUBJECT_IDENTIFIER_FLAG を設定する。CMS_PKCS7 が定義されている場合、dwFlags を CMSG_CMS_ENCAPSULATED_CTL_FLAG に設定して、CMS 互換の V3 SignedData メッセージを符号化することができる。
pbEncoded : [var] 作成された符号化・署名済みメッセージを受け取るバッファへのポインタ。メモリ割り当て目的でこの情報のサイズを設定するには、このパラメータを NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbEncoded : [var] pbEncoded バッファのサイズ (バイト単位) を指定する DWORD へのポインタ。関数が戻ると、DWORD にはバッファに格納された、または格納されるバイト数が含まれる。
%inst
CryptMsgEncodeAndSignCTL 関数は、CTL を符号化し、符号化された CTL
を含む署名済みメッセージを作成する。この関数はまず pCtlInfo が指す CTL を符号化し、次に CryptMsgSignCTL
を呼び出して符号化されたメッセージに署名する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。CryptMsgOpenToEncode および CryptMsgUpdate
の呼び出しからエラーが伝播することがある。


%index
CryptMsgGetAndVerifySigner
CryptMsgGetAndVerifySigner 関数は暗号メッセージの署名を検証する。
%prm
hCryptMsg, cSignerStore, rghSignerStore, dwFlags, ppSigner, pdwSignerIndex
hCryptMsg : [intptr] 暗号メッセージのハンドル。
cSignerStore : [int] rghSignerStore 配列のストア数。
rghSignerStore : [var] 署名者の証明書を検索できる証明書ストアハンドルの配列。
dwFlags : [int] 関数の特定の用途を示す。
ppSigner : [var] 署名が検証された場合、ppSigner は署名者の証明書コンテキストを指すように更新される。証明書の使用が終了したら、CertFreeCertificateContext 関数を呼び出してコンテキストを解放する。アプリケーションが署名者の証明書を必要としない場合、このパラメータは NULL にできる。
pdwSignerIndex : [var] 署名が検証された場合、pdwSigner は署名者配列内の署名者のインデックスを指すように更新される。アプリケーションが署名者のインデックスを必要としない場合、このパラメータは NULL にできる。
%inst
CryptMsgGetAndVerifySigner 関数は暗号メッセージの署名を検証する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
CryptMsgGetParam
暗号メッセージが符号化または復号化された後にメッセージパラメータを取得する。
%prm
hCryptMsg, dwParamType, dwIndex, pvData, pcbData
hCryptMsg : [intptr] 暗号メッセージのハンドル。
dwParamType : [int] 取得するデータのパラメータ型を示す。取得するデータの型によって pvData に使用する構造体の型が決まる。
dwIndex : [int] 該当する場合、取得するパラメータのインデックス。パラメータが取得されない場合、このパラメータは無視され 0 に設定される。
pvData : [intptr] 取得されたデータを受け取るバッファへのポインタ。このデータの形式は dwParamType パラメータの値によって異なる。
pcbData : [var] pvData パラメータが指すバッファのサイズ (バイト単位) を指定する変数へのポインタ。関数が戻ると、pcbData パラメータが指す変数にはバッファに格納されたバイト数が含まれる。
%inst
暗号メッセージが符号化または復号化された後にメッセージパラメータを取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。次の表に、GetLastError 関数で最も一般的に返されるエラーコードを示す。
（以下省略）

[備考]
CMSG_VERSION_PARAM を dwParamType に設定した CryptMsgGetParam
の呼び出しによって返されるバージョン番号は次のように定義されている。
（以下省略）


%index
CryptMsgOpenToDecode
復号のために暗号メッセージを開き、開かれたメッセージのハンドルを返す。
%prm
dwMsgEncodingType, dwFlags, dwMsgType, hCryptProv, pRecipientInfo, pStreamInfo
dwMsgEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING
dwFlags : [int] このパラメータには次のフラグのいずれかを指定できる。
dwMsgType : [int] 復号するメッセージの型を指定する。ほとんどの場合、メッセージ型はメッセージヘッダから決定され、このパラメータには 0 が渡される。特に Internet Explorer 3.0 では、メッセージにヘッダがない場合があり、この関数呼び出しで復号するメッセージの型を指定する必要がある。ヘッダが欠落しており、このパラメータに 0 が渡された場合、関数は失敗する。
hCryptProv : [int] このパラメータは使用されず、NULL に設定すべきである。Windows Server 2003 および Windows XP: メッセージのハッシュに使用する暗号プロバイダのハンドルを指定する。署名されたメッセージの場合、hCryptProv は署名検証に使用される。このパラメータのデータ型は HCRYPTPROV。hCryptProv で特定の暗号プロバイダを渡す強い理由がない限り、このパラメータを NULL に設定する。NULL を渡すと、ハッシュ、署名検証、または受信者暗号化操作を実行する前に既定の RSA または DSS プロバイダが取得される。
pRecipientInfo : [var] このパラメータは将来使用のために予約されており、NULL でなければならない。
pStreamInfo : [var] ストリーミングが使用されない場合、このパラメータは NULL に設定しなければならない。
%inst
復号のために暗号メッセージを開き、開かれたメッセージのハンドルを返す。

[戻り値]
関数が成功した場合、開かれたメッセージのハンドルが返される。関数が失敗した場合、NULL が返される。拡張エラー情報を取得するには
GetLastError を呼び出す。次の表に、GetLastError 関数で最も一般的に返されるエラーコードを示す。
（以下省略）


%index
CryptMsgOpenToEncode
符号化のために暗号メッセージを開き、開かれたメッセージのハンドルを返す。
%prm
dwMsgEncodingType, dwFlags, dwMsgType, pvMsgEncodeInfo, pszInnerContentObjID, pStreamInfo
dwMsgEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
dwFlags : [int] 現在定義されている dwFlags を次の表に示す。
dwMsgType : [int] 
pvMsgEncodeInfo : [intptr] 符号化情報を含む構造体のアドレス。データの型は dwMsgType パラメータの値に依存する。詳細は dwMsgType を参照。
pszInnerContentObjID : [str] CryptMsgCalculateEncodedLength が呼び出され、CryptMsgUpdate のデータがすでにメッセージ符号化されている場合、適切なオブジェクト識別子 (OID) が pszInnerContentObjID に渡される。pszInnerContentObjID が NULL の場合、内部コンテンツ型はあらかじめ符号化されていないものと見なされ、したがってオクテット文字列として符号化され、CMSG_DATA 型が付与される。注意 ストリーミングが使用される場合、pszInnerContentObjID は NULL または szOID_RSA_data のいずれかでなければならない。次のアルゴリズム OID がよく使用される。ユーザーは、メッセージの送信者と受信者が OID に関連付けられたセマンティクスに同意することを確認して、新しい内部コンテンツの用途を定義できる。
pStreamInfo : [var] ストリーミングが使用される場合、このパラメータは CMSG_STREAM_INFO 構造体のアドレスとなる。CMSG_STREAM_INFO 構造体の pfnStreamOutput メンバで指定されたコールバック関数は、CryptMsgUpdate が実行されたときに呼び出される。コールバックには符号化によって生成された符号化済みバイトが渡される。コールバックの使用方法の詳細については CMSG_STREAM_INFO を参照。注意 ストリーミングが使用される場合、アプリケーションは、この関数が返したメッセージハンドルが CryptMsgClose 関数を使用して閉じられるまで、pvMsgEncodeInfo パラメータに渡されたデータハンドル (CMSG_SIGNER_ENCODE_INFO 構造体の hCryptProv メンバ内のプロバイダハンドルなど) を解放してはならない。ストリーミングが使用されない場合、このパラメータは NULL に設定される。ストリーミングは CMSG_HASHED メッセージ型では使用されない。ハッシュ化されたデータを扱う場合、このパラメータは NULL に設定しなければならない。署名済みメッセージがエンベロープメッセージ内に含まれる場合を考える。署名済みメッセージのストリーム符号化からの符号化出力は、エンベロープメッセージの別のストリーム符号化にフィードされる。ストリーム符号化のコールバックは CryptMsgUpdate を呼び出してエンベロープメッセージを符号化する。エンベロープメッセージのコールバックは、入れ子になった署名済みメッセージの符号化されたバイトを受け取る。
%inst
符号化のために暗号メッセージを開き、開かれたメッセージのハンドルを返す。

[戻り値]
関数が成功した場合、開かれたメッセージへのハンドルが返される。このハンドルは、不要になったら CryptMsgClose
関数に渡して閉じる必要がある。関数が失敗した場合、NULL が返される。拡張エラー情報を取得するには GetLastError
関数を使用する。次の表に、GetLastError 関数で最も一般的に返されるエラーコードを示す。
（以下省略）

[備考]
暗号化を実行する関数の場合、暗号化された対称鍵は CryptExportKey
が内部的に呼び出された後にリトルエンディアンからビッグエンディアンに反転される。復号を実行する関数の場合、暗号化された対称鍵は
CryptImportKey が呼び出される前にビッグエンディアンからリトルエンディアンに反転される。
対称鍵が CryptGenKey と CryptImportKey で生成・インポートされる場合、CRYPT_NO_SALT
が指定される。RC2 暗号化アルゴリズムで暗号化されたメッセージは、鍵のインポートまたはエクスポート時に RC2
鍵の有効鍵長を決定するために CryptGetKeyParam と共に KP_EFFECTIVE_KEYLEN を使用する。
RC2 暗号化アルゴリズムで暗号化されたメッセージの場合、符号化および復号化操作は、CMSG_ENVELOPED_ENCODE_INFO
構造体の ContentEncryptionAlgorithm メンバの ASN RC2 パラメータを処理するように更新されている。
RC4、DES、3DES
暗号化アルゴリズムで暗号化されたメッセージの場合、符号化および復号化操作は、CMSG_ENVELOPED_ENCODE_INFO 構造体の
ContentEncryptionAlgorithm メンバの ASN IV オクテット文字列パラメータを処理するようになっている。


%index
CryptMsgSignCTL
CryptMsgSignCTL 関数は、符号化された CTL を含む署名済みメッセージを作成する。
%prm
dwMsgEncodingType, pbCtlContent, cbCtlContent, pSignInfo, dwFlags, pbEncoded, pcbEncoded
dwMsgEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
pbCtlContent : [var] 符号化された CTL_INFO。CTL_CONTEXT 構造体のメンバであるか、CryptEncodeObject 関数を使用して作成されたものでもよい。
cbCtlContent : [int] pbCtlContent が指すコンテンツのサイズ (バイト単位)。
pSignInfo : [var] CMSG_SIGNER_ENCODE_INFO 構造体の配列を含む CMSG_SIGNED_ENCODE_INFO 構造体へのポインタ。構造体の cbSize メンバを構造体のサイズに設定し、他のすべてのメンバを 0 に設定すると、署名者なしでメッセージを符号化することができる。
dwFlags : [int] CMS_PKCS7 が定義されている場合、CMSG_CMS_ENCAPSULATED_CTL_FLAG に設定して、CMS 互換の V3 SignedData メッセージを符号化することができる。
pbEncoded : [var] 符号化されたメッセージを受け取るバッファへのポインタ。メモリ割り当て目的でこの情報のサイズを取得するには、このパラメータを NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbEncoded : [var] pbEncoded バッファのサイズ (バイト単位) を指定する DWORD へのポインタ。関数が戻ると、DWORD にはバッファに格納された、または格納されるバイト数が含まれる。
%inst
CryptMsgSignCTL 関数は、符号化された CTL を含む署名済みメッセージを作成する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。この関数は CryptMsgOpenToEncode および CryptMsgUpdate
の呼び出しから伝播したエラーを返すことがある。


%index
CryptMsgUpdate
暗号メッセージにコンテンツを追加する。
%prm
hCryptMsg, pbData, cbData, fFinal
hCryptMsg : [intptr] 更新するメッセージの暗号メッセージハンドル。
pbData : [var] 符号化または復号するデータを保持するバッファへのポインタ。
cbData : [int] pbData バッファ内のデータのバイト数。
fFinal : [int] 符号化または復号のためのデータの最後のブロックが処理されていることを示す。このフラグの正しい使用方法は、処理されるメッセージが分離データを含むかどうかに依存する。メッセージに分離データが含まれることは、メッセージを開いた関数の呼び出しで dwFlags を CMSG_DETACHED_FLAG に設定することで示される。
%inst
暗号メッセージにコンテンツを追加する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。ストリーミングが使用される場合、CryptMsgOpenToDecode および
CryptMsgOpenToEncode の pStreamInfo で指定されたアプリケーション定義のコールバック関数で発生したエラーが
CryptMsgUpdate に伝播することがある。これが発生した場合、コールバック関数が戻った後、CryptMsgUpdate は
SetLastError
を呼び出さない。これにより、アプリケーションの制御下で発生したエラーが保持される。アプリケーションがストリームされたデータを処理している間にエラーが発生した場合、SetLastError
を呼び出すのはコールバック関数 (またはそれが呼び出す API の 1 つ) の責任である。次の表に、GetLastError
関数で最も一般的に返されるエラーコードを示す。
（以下省略）


%index
CryptMsgVerifyCountersignatureEncoded
SignerInfo 構造体 (PKCS で定義) の観点から副署を検証する。
%prm
hCryptProv, dwEncodingType, pbSignerInfo, cbSignerInfo, pbSignerInfoCountersignature, cbSignerInfoCountersignature, pciCountersigner
hCryptProv : [int] このパラメータは使用されず、NULL に設定すべきである。Windows Server 2003 および Windows XP: NULL、または pbSignerInfo の encryptedDigest フィールドをハッシュするために使用する暗号プロバイダのハンドル。このパラメータのデータ型は HCRYPTPROV。hCryptProv で特定の暗号プロバイダを渡す強い理由がない限り、既定の RSA または DSS プロバイダを使用させるために NULL を渡す。
dwEncodingType : [int] 使用するエンコーディングの型を指定する。現在、X509_ASN_ENCODING および PKCS_7_ASN_ENCODING のみが使用されているが、将来追加のエンコーディング型が追加される可能性がある。現在の両方のエンコーディング型には X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。
pbSignerInfo : [var] 副署されるメッセージのコンテンツの署名者を含む符号化済み BLOB へのポインタ。
cbSignerInfo : [int] コンテンツの署名者用の符号化済み BLOB のバイト数。
pbSignerInfoCountersignature : [var] 副署者情報を含む符号化済み BLOB へのポインタ。
cbSignerInfoCountersignature : [int] メッセージの副署者用の符号化済み BLOB のバイト数。
pciCountersigner : [var] 副署者の発行者とシリアル番号を含む CERT_INFO へのポインタ。詳細は「備考」を参照。
%inst
SignerInfo 構造体 (PKCS で定義) の観点から副署を検証する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。次の表に、GetLastError 関数で最も一般的に返されるエラーコードを示す。
（以下省略）

[備考]
副署者の検証は PKCS #7 SIGNERINFO 構造体を使用して行われる。署名は pbSignerInfo の
encryptedDigest フィールドの暗号化されたハッシュを含む必要がある。副署者の発行者とシリアル番号は
pbSignerInfoCountersignature の副署者情報と一致する必要がある。pciCountersigner
から参照される唯一のフィールドは
SerialNumber、Issuer、SubjectPublicKeyInfo。SubjectPublicKeyInfo
は公開鍵にアクセスするために使用され、次に pciCountersigner からのハッシュを暗号化して pbSignerInfo
からのハッシュと比較するために使用される。


%index
CryptMsgVerifyCountersignatureEncodedEx
pbSignerInfoCounterSignature パラメータが pbSignerInfo パラメータ構造体の encryptedDigest フィールドの暗号化ハッシュを含んでいることを検証する。
%prm
hCryptProv, dwEncodingType, pbSignerInfo, cbSignerInfo, pbSignerInfoCountersignature, cbSignerInfoCountersignature, dwSignerType, pvSigner, dwFlags, pvExtra
hCryptProv : [int] このパラメータは使用されず、NULL に設定すべきである。Windows Server 2003 および Windows XP: NULL、または pbSignerInfo の encryptedDigest フィールドをハッシュするために使用する暗号プロバイダのハンドル。このパラメータのデータ型は HCRYPTPROV。hCryptProv で特定の暗号プロバイダを渡す強い理由がない限り、既定の RSA または DSS プロバイダを使用させるために NULL を渡す。
dwEncodingType : [int] 使用するエンコーディング型。現在、X509_ASN_ENCODING および PKCS_7_ASN_ENCODING のみが使用されているが、将来追加のエンコーディング型が追加される可能性がある。現在の両方のエンコーディング型には X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。
pbSignerInfo : [var] 副署されるメッセージのコンテンツの署名者を含む符号化済み BLOB へのポインタ。
cbSignerInfo : [int] コンテンツの署名者用の符号化済み BLOB のバイト数。
pbSignerInfoCountersignature : [var] 副署者情報を含む符号化済み BLOB へのポインタ。
cbSignerInfoCountersignature : [int] メッセージの副署者用の符号化済み BLOB のバイト数。
dwSignerType : [int] 署名者情報を含む構造体。次の表は、定義済みの値と示される構造体を示す。
pvSigner : [intptr] dwSignerType の値に応じて、CERT_PUBLIC_KEY_INFO 構造体、証明書コンテキスト、または連鎖コンテキストへのポインタ。
dwFlags : [int] 関数の動作を変更するフラグ。これは 0 または次の値にできる。
pvExtra : [intptr] dwFlags パラメータを CMSG_VERIFY_COUNTER_SIGN_ENABLE_STRONG_FLAG に設定する場合、このパラメータ (pvExtra) は、署名強度を確認するために使用されるパラメータを含む CERT_STRONG_SIGN_PARA 構造体を指すように設定する。
%inst
pbSignerInfoCounterSignature パラメータが pbSignerInfo パラメータ構造体の
encryptedDigest フィールドの暗号化ハッシュを含んでいることを検証する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。GetLastError 関数で最も一般的に返されるエラーコードは次のとおり。
（以下省略）

[備考]
副署者の検証は PKCS #7 SIGNERINFO 構造体を使用して行われる。署名は pbSignerInfo の
encryptedDigest フィールドの暗号化されたハッシュを含む必要がある。副署者の発行者とシリアル番号は
pbSignerInfoCountersignature の副署者情報と一致する必要がある。pciCountersigner
から参照される唯一のフィールドは
SerialNumber、Issuer、SubjectPublicKeyInfo。SubjectPublicKeyInfo
は公開鍵にアクセスするために使用され、次に pciCountersigner からのハッシュを暗号化して pbSignerInfo
からのハッシュと比較するために使用される。


%index
CryptProtectData
DATA_BLOB 構造体中のデータを暗号化する。
%prm
pDataIn, szDataDescr, pOptionalEntropy, pvReserved, pPromptStruct, dwFlags, pDataOut
pDataIn : [var] 暗号化する平文を保持する DATA_BLOB 構造体へのポインタ。
szDataDescr : [wstr] 暗号化データの可読な説明文字列。暗号化データと共に保存される。省略可能で NULL 可。
pOptionalEntropy : [var] 暗号化に使用するパスワードなど追加のエントロピーを保持する DATA_BLOB 構造体へのポインタ。暗号化フェーズで使用した構造体と同じものを復号フェーズでも使わなければならない。追加エントロピーが不要なら NULL を指定する。
pvReserved : [intptr] 予約。NULL を指定する必要がある。
pPromptStruct : [var] プロンプト表示の場所・タイミング・内容を指定する CRYPTPROTECT_PROMPTSTRUCT 構造体へのポインタ。暗号化と復号の両フェーズで NULL 可。
dwFlags : [int] 以下のいずれかのフラグを指定できる。
pDataOut : [var] 暗号化データを受け取る DATA_BLOB 構造体へのポインタ。使用後は LocalFree で pbData メンバを解放すること。
%inst
DATA_BLOB 構造体中のデータを暗号化する。

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。拡張エラー情報は GetLastError で取得する。

[備考]

通常、データを暗号化したユーザーと同一のログオン資格情報を持つユーザーのみが復号できる。また暗号化を実行したコンピュータ上でのみ復号できる。ただしローミングプロファイルを持つユーザーは別のコンピュータから復号できる。CRYPTPROTECT_LOCAL_MACHINE
フラグで暗号化すれば、同一コンピュータ上のすべてのユーザーが復号できる。関数は暗号化用のセッション鍵を生成し、復号時にも再導出する。また改ざん検出用
MAC も付加する。一時的に同一プロセス内または複数プロセス間でメモリを保護するには CryptProtectMemory を使用する。


%index
CryptQueryObject
証明書、証明書失効リスト、または証明書信頼リストなどの暗号 API オブジェクトのコンテンツに関する情報を取得する。
%prm
dwObjectType, pvObject, dwExpectedContentTypeFlags, dwExpectedFormatTypeFlags, dwFlags, pdwMsgAndCertEncodingType, pdwContentType, pdwFormatType, phCertStore, phMsg, ppvContext
dwObjectType : [int] 
pvObject : [intptr] 照会するオブジェクトへのポインタ。データポインタの型は dwObjectType パラメータの内容に依存する。
dwExpectedContentTypeFlags : [int] 
dwExpectedFormatTypeFlags : [int] 
dwFlags : [int] このパラメータは将来使用のために予約されており、0 に設定しなければならない。
pdwMsgAndCertEncodingType : [var] メッセージで使用されるエンコーディングの型を受け取る DWORD 値へのポインタ。この情報が不要な場合、このパラメータを NULL に設定する。
pdwContentType : [var] 
pdwFormatType : [var] 
phCertStore : [var] オブジェクト内のすべての証明書、CRL、CTL を含む証明書ストアへのハンドルを受け取る HCERTSTORE 値へのポインタ。
phMsg : [var] 開かれたメッセージのハンドルを受け取る HCRYPTMSG 値へのポインタ。
ppvContext : [var] オブジェクトに関する追加情報を受け取るポインタへのポインタ。
%inst
証明書、証明書失効リスト、または証明書信頼リストなどの暗号 API オブジェクトのコンテンツに関する情報を取得する。

[戻り値]
関数が成功した場合、戻り値は 0 以外。関数が失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。


%index
CryptRegisterDefaultOIDFunction
CryptRegisterDefaultOIDFunction は、指定されたエンコーディング型と関数名に対して呼び出される既定の関数を含む DLL を登録する。CryptRegisterOIDFunction とは異なり、DLL によってエクスポートされる関数名はオーバーライドできない。
%prm
dwEncodingType, pszFuncName, dwIndex, pwszDll
dwEncodingType : [int] 一致させるエンコーディング型を指定する。現在、X509_ASN_ENCODING および PKCS_7_ASN_ENCODING のみが使用されているが、将来追加のエンコーディング型が追加される可能性がある。現在の両方のエンコーディング型と一致させるには X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。
pszFuncName : [str] 登録される関数の名前。
dwIndex : [int] DLL の一覧への DLL の挿入位置のインデックス。dwIndex が 0 の場合、DLL は一覧の先頭に挿入される。CRYPT_REGISTER_LAST_INDEX の場合、DLL は一覧の末尾に追加される。
pwszDll : [wstr] DLL の読み込み前に ExpandEnvironmentStrings 関数を使用して展開される省略可能な環境変数文字列。
%inst
CryptRegisterDefaultOIDFunction
は、指定されたエンコーディング型と関数名に対して呼び出される既定の関数を含む DLL
を登録する。CryptRegisterOIDFunction とは異なり、DLL
によってエクスポートされる関数名はオーバーライドできない。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。


%index
CryptRegisterOIDFunction
指定されたエンコーディング型、関数名、およびオブジェクト識別子 (OID) に対して呼び出される関数を含む DLL を登録する。
%prm
dwEncodingType, pszFuncName, pszOID, pwszDll, pszOverrideFuncName
dwEncodingType : [int] 一致させるエンコーディング型を指定する。現在、X509_ASN_ENCODING および PKCS_7_ASN_ENCODING のみが使用されているが、将来追加のエンコーディング型が追加される可能性がある。現在の両方のエンコーディング型と一致させるには X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。
pszFuncName : [str] 登録される関数の名前。
pszOID : [str] 登録される関数の OID。OID の上位ワードが 0 以外の場合、pszOID は "2.5.29.1" のような OID 文字列または "file" のような ASCII 文字列へのポインタとなる。OID の上位ワードが 0 の場合、下位ワードはオブジェクト識別子として使用される数値識別子を指定する。
pwszDll : [wstr] 登録される DLL ファイルの名前。DLL の読み込み前に ExpandEnvironmentStrings 関数を使用して展開される環境変数文字列を含むことができる。
pszOverrideFuncName : [str] DLL でエクスポートされる関数の名前を指定する文字列。pszOverrideFuncName が NULL の場合、pszFuncName で指定された関数名が使用される。
%inst
指定されたエンコーディング型、関数名、およびオブジェクト識別子 (OID) に対して呼び出される関数を含む DLL を登録する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。

[備考]
OID 関数の使用が終了したら、CryptUnregisterOIDFunction 関数を呼び出して登録を解除する。


%index
CryptRegisterOIDInfo
CryptRegisterOIDInfo 関数は、CRYPT_OID_INFO 構造体で指定された OID 情報を登録し、レジストリに永続化する。
%prm
pInfo, dwFlags
pInfo : [var] 登録する OID 情報を含む CRYPT_OID_INFO 構造体へのポインタ。構造体の dwGroupId メンバを設定して、OID 情報を登録するグループを指定する。注意 Cryptography API: Next Generation (CNG) で実装された Suite B アルゴリズムの OID 情報を登録するときは、CRYPT_OID_INFO 構造体の Algid メンバを CALG_OID_INFO_CNG_ONLY (0xFFFFFFFF) に設定する必要がある。
dwFlags : [int] 既定では、登録された OID 情報は Crypt32.dll の OID エントリの後にインストールされる。CRYPT_INSTALL_OID_INFO_BEFORE_FLAG が設定されている場合、新しい OID 情報は Crypt32.dll のエントリの前にインストールされる。
%inst
CryptRegisterOIDInfo 関数は、CRYPT_OID_INFO 構造体で指定された OID
情報を登録し、レジストリに永続化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。

[備考]
OID 情報の使用が終了したら、CryptUnregisterOIDInfo 関数を呼び出して登録を解除する。


%index
CryptRetrieveTimeStamp
タイムスタンプ要求を符号化し、タイムスタンプ局 (TSA) の URL で指定された場所からタイムスタンプトークンを取得する。
%prm
wszUrl, dwRetrievalFlags, dwTimeout, pszHashId, pPara, pbData, cbData, ppTsContext, ppTsSigner, phStore
wszUrl : [wstr] 要求の送信先 TSA の URL を含む NULL 終端ワイド文字列へのポインタ。
dwRetrievalFlags : [int] タイムスタンプの取得方法を指定する一連のフラグ。
dwTimeout : [int] 取得を待機する最大ミリ秒数を指定する DWORD 値。このパラメータが 0 に設定されている場合、この関数はタイムアウトしない。
pszHashId : [str] ハッシュアルゴリズムのオブジェクト識別子 (OID) を含む NULL 終端文字列へのポインタ。
pPara : [var] 要求の追加パラメータを含む CRYPT_TIMESTAMP_PARA 構造体へのポインタ。
pbData : [var] タイムスタンプを付けるバイト配列へのポインタ。
cbData : [int] pbData パラメータが指す配列のサイズ (バイト単位)。
ppTsContext : [var] PCRYPT_TIMESTAMP_CONTEXT 構造体へのポインタ。コンテキストの使用が終了したら、CryptMemFree 関数を呼び出して解放しなければならない。
ppTsSigner : [var] 署名者の証明書を受け取る PCERT_CONTEXT へのポインタ。この構造体の使用が終了したら、このポインタを CertFreeCertificateContext 関数に渡して解放しなければならない。
phStore : [var] タイムスタンプ応答からの証明書で初期化された証明書ストアのハンドル。このストアはタイムスタンプ応答の署名者証明書の検証に使用できる。TSA サポート証明書が不要な場合、このパラメータは NULL にできる。このハンドルの使用が終了したら、CertCloseStore 関数に渡して解放する。
%inst
タイムスタンプ要求を符号化し、タイムスタンプ局 (TSA) の URL で指定された場所からタイムスタンプトークンを取得する。

[戻り値]
関数がタイムスタンプコンテキストの取得、復号、検証ができない場合、FALSE を返す。拡張エラー情報を取得するには
GetLastError 関数を呼び出す。


%index
CryptSIPAddProvider
CryptSIPAddProvider 関数は、Subject Interface Package (SIP) を実装する指定された DLL ファイルによってエクスポートされる関数を登録する。
%prm
psNewProv
psNewProv : [var] 登録する DLL ファイルと関数名を指定する [SIP_ADD_NEWPROVIDER](/windows/desktop/api/mssip/ns-mssip-sip_add_newprovider) 構造体へのポインタ。
%inst
CryptSIPAddProvider 関数は、Subject Interface Package (SIP) を実装する指定された
DLL ファイルによってエクスポートされる関数を登録する。

[戻り値]
関数が成功した場合は TRUE、失敗した場合は FALSE を返す。関数が失敗した場合、失敗の理由を確認するために
GetLastError 関数を呼び出す。

[備考]
通常、この関数はインプロセス COM サーバ登録の一部として呼び出される。CryptSIPAddProvider 関数は、SIP
プロバイダ関数用の適切なレジストリエントリを永続化する。追加された SIP
プロバイダの使用が終了したら、CryptSIPRemoveProvider 関数を呼び出して削除する。


%index
CryptSIPLoad
サブジェクトインターフェイスパッケージ (SIP) を実装するダイナミックリンクライブラリ (DLL) を読み込み、適切なライブラリエクスポート関数を SIP_DISPATCH_INFO 構造体に割り当てる。
%prm
pgSubject, dwFlags, pSipDispatch
pgSubject : [var] CryptSIPRetrieveSubjectGuid 関数の呼び出しによって返された GUID へのポインタ。
dwFlags : [int] このパラメータは予約されており、0 に設定しなければならない。
pSipDispatch : [var] サブジェクト型に固有の SIP プロバイダ関数へのポインタを含む [SIP_DISPATCH_INFO](/windows/desktop/api/mssip/ns-mssip-sip_dispatch_info) 構造体へのポインタ。呼び出し元はこの構造体をバイナリ 0 で初期化し、CryptSIPLoad 関数を呼び出す前に cbSize メンバを sizeof(SIP_DISPATCH_INFO) に設定しなければならない。
%inst
サブジェクトインターフェイスパッケージ (SIP) を実装するダイナミックリンクライブラリ (DLL)
を読み込み、適切なライブラリエクスポート関数を SIP_DISPATCH_INFO 構造体に割り当てる。

[戻り値]
関数が成功した場合は TRUE、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
CryptSIPRemoveProvider
以前の CryptSIPAddProvider 関数の呼び出しで追加された Subject Interface Package (SIP) DLL ファイルのレジストリの詳細を削除する。
%prm
pgProv
pgProv : [var] 削除する SIP DLL を識別する GUID へのポインタ。
%inst
以前の CryptSIPAddProvider 関数の呼び出しで追加された Subject Interface Package (SIP)
DLL ファイルのレジストリの詳細を削除する。

[戻り値]
関数が成功した場合は TRUE、失敗した場合は FALSE を返す。関数が失敗した場合、失敗の理由を確認するために
GetLastError 関数を呼び出す。

[備考]
通常、この関数はインプロセス COM サーバの登録を解除するために呼び出される。CryptSIPRemoveProvider
関数は、SIP プロバイダ関数の適切なレジストリエントリを削除する。


%index
CryptSIPRetrieveSubjectGuid
指定されたファイル内のヘッダ情報に基づいて GUID を取得する。
%prm
FileName, hFileIn, pgSubject
FileName : [wstr] ファイルの名前。
hFileIn : [intptr] 確認するファイルのハンドル。
pgSubject : [var] サブジェクトを識別する GUID。
%inst
指定されたファイル内のヘッダ情報に基づいて GUID を取得する。

[戻り値]
関数が成功した場合は TRUE、失敗した場合は FALSE を返す。拡張エラー情報を取得するには GetLastError を呼び出す。


%index
CryptSIPRetrieveSubjectGuidForCatalogFile
指定されたファイルに関連付けられたサブジェクト GUID を取得する。
%prm
FileName, hFileIn, pgSubject
FileName : [wstr] ファイルの名前。hFileIn パラメータが設定されている場合、このパラメータの値は無視される。
hFileIn : [intptr] 確認するファイルのハンドル。FileName パラメータが NULL の場合、このパラメータには有効なハンドルを含める必要がある。
pgSubject : [var] サブジェクトを識別するグローバル一意 ID。
%inst
指定されたファイルに関連付けられたサブジェクト GUID を取得する。

[戻り値]
関数が成功した場合は TRUE、それ以外は FALSE を返す。
この関数が FALSE を返す場合、GetLastError 関数を呼び出して追加のエラー情報を取得できる。GetLastError
は次のエラーコードのいずれかを返す。
（以下省略）

[備考]
この関数は、ポータブル実行可能イメージ (.exe)、キャビネット (.cab)
イメージ、およびフラットファイルに使用されるサブジェクトインターフェイスパッケージ (SIP) のみをサポートする。


%index
CryptSetAsyncParam
CryptSetAsyncParam 関数 (wincrypt.h) は非同期パラメータを設定する。
%prm
hAsync, pszParamOid, pvParam, pfnFree
hAsync : [intptr] 非同期ハンドル。
pszParamOid : [str] パラメータ ID。
pvParam : [intptr] パラメータ値。
pfnFree : [int] パラメータが解放されるときに呼び出されるコールバック関数。
%inst
CryptSetAsyncParam 関数 (wincrypt.h) は非同期パラメータを設定する。

[戻り値]
成功時は S_OK。


%index
CryptSetKeyIdentifierProperty
CryptSetKeyIdentifierProperty 関数は指定された鍵識別子のプロパティを設定する。この関数は pwszComputerName で識別されるコンピュータ上のプロパティを設定できる。
%prm
pKeyIdentifier, dwPropId, dwFlags, pwszComputerName, pvReserved, pvData
pKeyIdentifier : [var] 鍵識別子を含む CRYPT_HASH_BLOB へのポインタ。
dwPropId : [int] 設定するプロパティを識別する。dwPropId の値が pvData パラメータの型と内容を決定する。任意の証明書プロパティ ID を使用できる。最も関心のあるプロパティは CERT_KEY_PROV_INFO_PROP_ID である。
dwFlags : [int] 次のフラグを設定できる。これらはビットごとの OR 演算で組み合わせることができる。
pwszComputerName : [wstr] プロパティを設定する鍵識別子を持つリモートコンピュータの名前を含む NULL 終端文字列へのポインタ。CRYPT_KEYID_MACHINE_FLAG フラグが設定されている場合、リモートコンピュータから鍵識別子の一覧が検索される。リモートコンピュータではなくローカルコンピュータに設定する場合、pwszComputerName を NULL に設定する。
pvReserved : [intptr] 将来使用のために予約されており、NULL でなければならない。
pvData : [intptr] dwPropId が CERT_KEY_PROV_INFO_PROP_ID の場合、pvData は鍵識別子のプロパティを含む CRYPT_KEY_PROV_INFO 構造体を指す。
%inst
CryptSetKeyIdentifierProperty 関数は指定された鍵識別子のプロパティを設定する。この関数は
pwszComputerName で識別されるコンピュータ上のプロパティを設定できる。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。注意 CRYPT_KEYID_SET_NEW_FLAG
が設定されており、プロパティがすでに存在する場合、最終エラーコードを CRYPT_E_EXISTS に設定して FALSE が返される。


%index
CryptSetOIDFunctionValue
CryptSetOIDFunctionValue 関数は、指定されたエンコーディング型、関数名、OID、および値名の値を設定する。
%prm
dwEncodingType, pszFuncName, pszOID, pwszValueName, dwValueType, pbValueData, cbValueData
dwEncodingType : [int] 一致させるエンコーディング型を指定する。現在、X509_ASN_ENCODING および PKCS_7_ASN_ENCODING のみが使用されているが、将来追加のエンコーディング型が追加される可能性がある。現在の両方のエンコーディング型と一致させるには X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。
pszFuncName : [str] エンコーディング型、OID、および値名を更新する関数の名前。
pszOID : [str] オブジェクト識別子 (OID) の上位ワードが 0 以外の場合、pszOID は "2.5.29.1" のような OID 文字列または "file" のような ASCII 文字列へのポインタとなる。OID の上位ワードが 0 の場合、下位ワードはオブジェクト識別子として使用される整数識別子を指定する。
pwszValueName : [wstr] 設定する値の名前を含む Unicode 文字列へのポインタ。この名前の値がまだ存在しない場合、関数は作成する。
dwValueType : [int] 
pbValueData : [var] 指定された値名に格納されるデータを含むバッファを指す。
cbValueData : [int] pbValueData パラメータが指す情報のサイズ (バイト単位) を指定する。データが REG_SZ、REG_EXPAND_SZ、REG_MULTI_SZ 型の場合、サイズには NULL 終端ワイド文字が含まれていなければならない。
%inst
CryptSetOIDFunctionValue 関数は、指定されたエンコーディング型、関数名、OID、および値名の値を設定する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。


%index
CryptSignAndEncodeCertificate
証明書、証明書失効リスト (CRL)、証明書信頼リスト (CTL)、または証明書要求を符号化および署名する。
%prm
hCryptProvOrNCryptKey, dwKeySpec, dwCertEncodingType, lpszStructType, pvStructInfo, pSignatureAlgorithm, pvHashAuxInfo, pbEncoded, pcbEncoded
hCryptProvOrNCryptKey : [int] 
dwKeySpec : [int] 
dwCertEncodingType : [int] 使用するエンコーディングの型を指定する。これは次の値にできる。
lpszStructType : [str] 符号化および署名するデータの型を含む NULL 終端の ANSI 文字列へのポインタ。次の定義済み lpszStructType 定数は符号化操作で使用される。
pvStructInfo : [intptr] 署名および符号化するデータを含む構造体のアドレス。この構造体の形式は lpszStructType パラメータによって決定される。
pSignatureAlgorithm : [var] 署名アルゴリズムのオブジェクト識別子 (OID) と必要な追加パラメータを含む CRYPT_ALGORITHM_IDENTIFIER 構造体へのポインタ。この関数は次のアルゴリズム OID を使用する。
pvHashAuxInfo : [intptr] 予約済み。NULL でなければならない。
pbEncoded : [var] 署名および符号化された出力を受け取るバッファへのポインタ。メモリ割り当て目的でこの情報のサイズを設定するには、このパラメータを NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbEncoded : [var] pbEncoded パラメータが指すバッファのサイズ (バイト単位) を含む DWORD へのポインタ。関数が戻ると、DWORD にはバッファに格納された、または格納されるバイト数が含まれる。
%inst
証明書、証明書失効リスト (CRL)、証明書信頼リスト (CTL)、または証明書要求を符号化および署名する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。注意 呼び出された
CryptCreateHash、CryptSignHash、CryptHashData
関数のエラーがこの関数に伝播することがある。想定されるエラーコードには次のものが含まれるが、これらに限定されない。
（以下省略）


%index
CryptSignAndEncryptMessage
CryptSignAndEncryptMessage 関数は、指定されたコンテンツのハッシュを作成し、ハッシュに署名し、コンテンツを暗号化し、暗号化されたコンテンツと署名済みハッシュをハッシュし、次に暗号化されたコンテンツと署名済みハッシュの両方を符号化する。
%prm
pSignPara, pEncryptPara, cRecipientCert, rgpRecipientCert, pbToBeSignedAndEncrypted, cbToBeSignedAndEncrypted, pbSignedAndEncryptedBlob, pcbSignedAndEncryptedBlob
pSignPara : [var] 署名パラメータを含む CRYPT_SIGN_MESSAGE_PARA 構造体へのポインタ。
pEncryptPara : [var] 暗号化パラメータを含む CRYPT_ENCRYPT_MESSAGE_PARA 構造体へのポインタ。
cRecipientCert : [int] rgpRecipientCert の配列要素数。
rgpRecipientCert : [var] CERT_CONTEXT 構造体へのポインタの配列。各構造体はメッセージの意図された受信者の証明書である。
pbToBeSignedAndEncrypted : [var] 署名および暗号化するコンテンツを含むバッファへのポインタ。
cbToBeSignedAndEncrypted : [int] pbToBeSignedAndEncrypted バッファのサイズ (バイト単位)。
pbSignedAndEncryptedBlob : [var] 暗号化および符号化されたメッセージを受け取るバッファへのポインタ。
pcbSignedAndEncryptedBlob : [var] pbSignedAndEncryptedBlob が指すバッファのサイズ (バイト単位) を指定する DWORD へのポインタ。関数が戻ると、この変数には *pbSignedAndEncryptedBlob にコピーされた署名および暗号化されたメッセージのサイズ (バイト単位) が含まれる。
%inst
CryptSignAndEncryptMessage
関数は、指定されたコンテンツのハッシュを作成し、ハッシュに署名し、コンテンツを暗号化し、暗号化されたコンテンツと署名済みハッシュをハッシュし、次に暗号化されたコンテンツと署名済みハッシュの両方を符号化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。GetLastError 関数で最も一般的に返されるエラーコードを以下に示す。
（以下省略）


%index
CryptSignCertificate
CryptSignCertificate 関数は、符号化署名済みコンテンツ内の「署名される」情報に署名する。
%prm
hCryptProvOrNCryptKey, dwKeySpec, dwCertEncodingType, pbEncodedToBeSigned, cbEncodedToBeSigned, pSignatureAlgorithm, pvHashAuxInfo, pbSignature, pcbSignature
hCryptProvOrNCryptKey : [int] 
dwKeySpec : [int] プロバイダのコンテナから使用する秘密鍵を識別する。AT_KEYEXCHANGE または AT_SIGNATURE を指定できる。hCryptProvOrNCryptKey パラメータに NCRYPT_KEY_HANDLE が使用されている場合、このパラメータは無視される。
dwCertEncodingType : [int] 使用するエンコーディングの型を指定する。証明書とメッセージのエンコーディング型の両方をビットごとの OR 演算で組み合わせて指定することも常に許容される。例: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING。現在定義されているエンコーディング型は次のとおり。
pbEncodedToBeSigned : [var] 署名する符号化済みコンテンツへのポインタ。
cbEncodedToBeSigned : [int] 符号化済みコンテンツ pbEncodedToBeSigned のサイズ (バイト単位)。
pSignatureAlgorithm : [var] pszObjId メンバが次のいずれかに設定された CRYPT_ALGORITHM_IDENTIFIER 構造体へのポインタ。
pvHashAuxInfo : [intptr] 現在使用されない。NULL でなければならない。
pbSignature : [var] コンテンツの署名済みハッシュを受け取るバッファへのポインタ。メモリ割り当て目的でこの情報のサイズを設定するには、このパラメータを NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbSignature : [var] pbSignature パラメータが指すバッファのサイズ (バイト単位) を含む DWORD へのポインタ。関数が戻ると、DWORD にはバッファに格納された、または格納されるバイト数が含まれる。注意 バッファ内で返されたデータを処理する際、アプリケーションは返されたデータの実際のサイズを使用しなければならない。実際のサイズは入力で指定されたバッファのサイズよりわずかに小さい場合がある。出力時には、このパラメータが指す変数は実際のデータサイズを反映するよう更新される。
%inst
CryptSignCertificate 関数は、符号化署名済みコンテンツ内の「署名される」情報に署名する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。注意 呼び出された
CryptCreateHash、CryptSignHash、CryptHashData
関数のエラーがこの関数に伝播することがある。この関数には次のエラーコードがある。
（以下省略）


%index
CryptSignMessage
CryptSignMessage 関数は、指定されたコンテンツのハッシュを作成し、ハッシュに署名し、元のメッセージコンテンツと署名済みハッシュの両方を符号化する。
%prm
pSignPara, fDetachedSignature, cToBeSigned, rgpbToBeSigned, rgcbToBeSigned, pbSignedBlob, pcbSignedBlob
pSignPara : [var] 署名パラメータを含む CRYPT_SIGN_MESSAGE_PARA 構造体へのポインタ。
fDetachedSignature : [int] これを分離署名にする場合は TRUE。それ以外の場合は FALSE。このパラメータが TRUE に設定されている場合、pbSignedBlob には署名済みハッシュのみが符号化される。それ以外の場合、rgpbToBeSigned と署名済みハッシュの両方が符号化される。
cToBeSigned : [int] rgpbToBeSigned および rgcbToBeSigned の配列要素数。fDetachedSignature が TRUE に設定されていない限り、このパラメータは 1 に設定しなければならない。
rgpbToBeSigned : [var] 署名するコンテンツを含むバッファへのポインタの配列。
rgcbToBeSigned : [var] rgpbToBeSigned が指すコンテンツバッファのサイズ (バイト単位) の配列。
pbSignedBlob : [var] fDetachedSignature が TRUE の場合は符号化された署名済みハッシュを、FALSE の場合は符号化されたコンテンツと署名済みハッシュの両方を受け取るバッファへのポインタ。
pcbSignedBlob : [var] pbSignedBlob バッファのサイズ (バイト単位) を指定する DWORD へのポインタ。関数が戻ると、この変数には署名および符号化されたメッセージのサイズ (バイト単位) が含まれる。
%inst
CryptSignMessage
関数は、指定されたコンテンツのハッシュを作成し、ハッシュに署名し、元のメッセージコンテンツと署名済みハッシュの両方を符号化する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。GetLastError 関数で最も一般的に返されるエラーコードを以下に示す。
（以下省略）


%index
CryptSignMessageWithKey
パラメータで指定された CSP の秘密鍵を使用してメッセージに署名する。
%prm
pSignPara, pbToBeSigned, cbToBeSigned, pbSignedBlob, pcbSignedBlob
pSignPara : [var] 署名パラメータを含む CRYPT_KEY_SIGN_MESSAGE_PARA 構造体へのポインタ。
pbToBeSigned : [var] 署名するメッセージを含むバッファ配列へのポインタ。
cbToBeSigned : [int] pbToBeSigned バッファ配列の要素数。
pbSignedBlob : [var] 符号化された署名済みメッセージを受け取るバッファへのポインタ。
pcbSignedBlob : [var] pbSignedBlob バッファのサイズ (バイト単位) を示す DWORD 値へのポインタ。関数が戻ると、この変数には署名および符号化されたメッセージのサイズ (バイト単位) が含まれる。
%inst
パラメータで指定された CSP の秘密鍵を使用してメッセージに署名する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。GetLastError 関数で最も一般的に返されるエラーコードを以下に示す。
（以下省略）


%index
CryptStringToBinaryW
書式化された文字列をバイト配列に変換する。(Unicode)
%prm
pszString, cchString, dwFlags, pbBinary, pcbBinary, pdwSkip, pdwFlags
pszString : [wstr] 変換対象の書式化文字列を指すポインタ。
cchString : [int] 変換する文字列長(終端 NULL は含まない)。0 を指定すると pszString は NULL 終端とみなされる。
dwFlags : [int] 
pbBinary : [var] バイト列を受け取るバッファへのポインタ。NULL を指定すると必要バッファサイズが pcbBinary に返される。
pcbBinary : [var] 入力時は pbBinary バッファのサイズ(バイト単位)。関数復帰後はコピーされたバイト数が格納される。値が小さい場合は失敗し GetLastError は ERROR_MORE_DATA を返す。pbBinary が NULL の場合、pcbBinary の値は無視される。
pdwSkip : [var] `-----BEGIN ...-----` ヘッダ開始までスキップした文字数を受け取る DWORD へのポインタ。ヘッダがなければ 0 が返る。省略可能で NULL 可。
pdwFlags : [var] 実際に変換で使用されたフラグを受け取る DWORD へのポインタ。多くの場合 dwFlags と同じ値だが、dwFlags に下記フラグが含まれる場合は実際の文字列書式を示すフラグが返る。省略可能で NULL 可。
%inst
書式化された文字列をバイト配列に変換する。(Unicode)

[戻り値]
成功時は 0 以外 (TRUE) を返す。失敗時は 0 (FALSE) を返す。

[備考]

CRYPT_STRING_BASE64HEADER、CRYPT_STRING_BASE64REQUESTHEADER、CRYPT_STRING_BASE64X509CRLHEADER
は本関数では同一扱いされ、`-----BEGIN ...-----` と `-----END ...-----` の間にある最初の
base64 エンコードデータブロックの解析を試みる。`...` 部分は無視され一致する必要はない。解析成功時、dwFlags
で渡した値がそのまま pdwFlags の DWORD に返される。CRYPT_STRING_BASE64REQUESTHEADER や
CRYPT_STRING_BASE64X509CRLHEADER が返ったからといって実際にリクエストヘッダや X.509 CRL
が見つかったとは限らないことに注意。> [!NOTE] > wincrypt.h は UNICODE マクロに応じて
CryptStringToBinary を ANSI/Unicode 版のエイリアスとして定義する。


%index
CryptUninstallDefaultContext
重要 この API は廃止予定。(CryptUninstallDefaultContext)
%prm
hDefaultContext, dwFlags, pvReserved
hDefaultContext : [intptr] 解放するコンテキストのハンドル。
dwFlags : [int] 将来使用のために予約されている。
pvReserved : [intptr] 将来使用のために予約されている。
%inst
重要 この API は廃止予定。(CryptUninstallDefaultContext)

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
CryptUnprotectData
DATA_BLOB 構造体中のデータを復号し、整合性チェックを行う。
%prm
pDataIn, ppszDataDescr, pOptionalEntropy, pvReserved, pPromptStruct, dwFlags, pDataOut
pDataIn : [var] 暗号化データを保持する DATA_BLOB 構造体へのポインタ。cbData メンバには暗号化対象テキストを含む pbData バイト列の長さが入る。
ppszDataDescr : [var] 暗号化データに含まれていた可読な説明文字列へのポインタ。NULL も可。使用後は LocalFree で解放する。
pOptionalEntropy : [var] 暗号化時に使用された追加エントロピーを保持する DATA_BLOB 構造体へのポインタ。NULL 可だが、暗号化フェーズで追加エントロピーが使われた場合は同じ構造体を渡す必要がある。
pvReserved : [intptr] 予約。NULL を指定する必要がある。
pPromptStruct : [var] プロンプト表示の場所・タイミング・内容を指定する CRYPTPROTECT_PROMPTSTRUCT 構造体へのポインタ。NULL 可。
dwFlags : [int] 本関数のオプションを指定する DWORD。0 を指定するとオプション無し。または下記のフラグを指定できる。
pDataOut : [var] 復号データを格納する DATA_BLOB 構造体へのポインタ。使用後は LocalFree で pbData メンバを解放する。
%inst
DATA_BLOB 構造体中のデータを復号し、整合性チェックを行う。

[戻り値]
成功時は TRUE、失敗時は FALSE を返す。

[備考]
CryptProtectData が暗号化時に生成したセッション鍵を再導出してデータ BLOB を復号する。暗号化データに付加された
MAC ハッシュにより改ざん検出を行い、改ざんが検出された場合は ERROR_INVALID_DATA を返す。DATA_BLOB
構造体使用後は LocalFree で pbData メンバを解放する。NULL でない ppszDataDescr も
LocalFree で解放する必要がある。機密情報使用後は SecureZeroMemory でメモリをクリアすること。


%index
CryptUnregisterDefaultOIDFunction
CryptUnregisterDefaultOIDFunction は、指定されたエンコーディング型と関数名に対して呼び出される既定の関数を含む DLL の登録を削除する。
%prm
dwEncodingType, pszFuncName, pwszDll
dwEncodingType : [int] 一致させるエンコーディング型を指定する。現在、X509_ASN_ENCODING および PKCS_7_ASN_ENCODING のみが使用されているが、将来追加のエンコーディング型が追加される可能性がある。現在の両方のエンコーディング型と一致させるには X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。
pszFuncName : [str] 登録を解除する関数の名前。
pwszDll : [wstr] 関数が配置されている DLL の名前。
%inst
CryptUnregisterDefaultOIDFunction
は、指定されたエンコーディング型と関数名に対して呼び出される既定の関数を含む DLL の登録を削除する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。


%index
CryptUnregisterOIDFunction
指定されたエンコーディング型、関数名、および OID に対して呼び出される関数を含む DLL の登録を削除する。
%prm
dwEncodingType, pszFuncName, pszOID
dwEncodingType : [int] 一致させるエンコーディング型を指定する。現在、X509_ASN_ENCODING および PKCS_7_ASN_ENCODING のみが使用されているが、将来追加のエンコーディング型が追加される可能性がある。現在の両方のエンコーディング型と一致させるには X509_ASN_ENCODING | PKCS_7_ASN_ENCODING を使用する。エンコーディング型を使用しない関数の場合、このパラメータを 0 に設定する。
pszFuncName : [str] 登録を解除する関数の名前。
pszOID : [str] 登録を解除する関数の名前に対応するオブジェクト識別子 (OID) へのポインタ。OID の上位ワードが 0 以外の場合、pszOID は "2.5.29.1" のような OID 文字列または "file" のような ASCII 文字列へのポインタとなる。OID の上位ワードが 0 の場合、下位ワードはオブジェクト識別子として使用される整数識別子を指定する。
%inst
指定されたエンコーディング型、関数名、および OID に対して呼び出される関数を含む DLL の登録を削除する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。


%index
CryptUnregisterOIDInfo
CryptUnregisterOIDInfo 関数は、指定された CRYPT_OID_INFO OID 情報構造体の登録を削除する。登録を解除する構造体は、構造体の pszOID および dwGroupId メンバによって識別される。
%prm
pInfo
pInfo : [var] 登録を削除するオブジェクト識別子 (OID) 情報を指定する。登録を削除するグループは pInfo 内の dwGroupId メンバによって指定される。
%inst
CryptUnregisterOIDInfo 関数は、指定された CRYPT_OID_INFO OID
情報構造体の登録を削除する。登録を解除する構造体は、構造体の pszOID および dwGroupId メンバによって識別される。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合は 0 (FALSE) を返す。


%index
CryptVerifyCertificateSignature
CERT_PUBLIC_KEY_INFO 構造体内の公開鍵を使用して、証明書、証明書失効リスト (CRL)、または証明書要求の署名を検証する。
%prm
hCryptProv, dwCertEncodingType, pbEncoded, cbEncoded, pPublicKey
hCryptProv : [int] このパラメータは使用されず、NULL に設定すべきである。Windows Server 2003 および Windows XP: 署名の検証に使用する暗号サービスプロバイダ (CSP) のハンドル。このパラメータのデータ型は HCRYPTPROV。特定の暗号プロバイダを渡す強い理由がない限り、NULL を渡す。NULL を渡すと、既定の RSA または DSS プロバイダが取得される。
dwCertEncodingType : [int] サブジェクトを暗号化するために使用された証明書エンコーディング型。この値の上位 WORD に含まれるメッセージエンコーディング型識別子は、この関数では無視される。
pbEncoded : [var] 署名を検証する CERT_SIGNED_CONTENT_INFO コンテンツの符号化済み BLOB へのポインタ。
cbEncoded : [int] pbEncoded 内の符号化済みコンテンツのサイズ (バイト単位)。
pPublicKey : [var] 署名を検証するときに使用する公開鍵を含む CERT_PUBLIC_KEY_INFO 構造体へのポインタ。
%inst
CERT_PUBLIC_KEY_INFO 構造体内の公開鍵を使用して、証明書、証明書失効リスト
(CRL)、または証明書要求の署名を検証する。

[戻り値]
成功した場合は 0 以外、それ以外の場合は 0 を返す。
拡張エラー情報を取得するには GetLastError を呼び出す。注意 呼び出された
CryptCreateHash、CryptImportKey、CryptVerifySignature、CryptHashData
関数のエラーがこの関数に伝播することがある。失敗時に、この関数は GetLastError から次のエラーコードを返させる。
（以下省略）

[備考]
この関数は現在、検証を実行するために CryptVerifyCertificateSignatureEx 関数を呼び出す。


%index
CryptVerifyCertificateSignatureEx
発行者の公開鍵を使用して、サブジェクト証明書、証明書失効リスト、証明書要求、または keygen 要求の署名を検証する。
%prm
hCryptProv, dwCertEncodingType, dwSubjectType, pvSubject, dwIssuerType, pvIssuer, dwFlags, pvExtra
hCryptProv : [int] このパラメータは使用されず、NULL に設定すべきである。Windows Server 2003 および Windows XP: 署名の検証に使用する暗号サービスプロバイダのハンドル。このパラメータのデータ型は HCRYPTPROV。特定の暗号プロバイダを渡す強い理由がない限り、NULL を渡す。NULL を渡すと、既定の RSA または DSS プロバイダが取得される。
dwCertEncodingType : [int] サブジェクトを暗号化するために使用された証明書エンコーディング型。この値の上位 WORD に含まれるメッセージエンコーディング型識別子は、この関数では無視される。
dwSubjectType : [int] サブジェクトの型。このパラメータには次のサブジェクト型のいずれかを指定できる。
pvSubject : [intptr] dwSubjectType が示す型の構造体へのポインタ。検証される署名が含まれる。
dwIssuerType : [int] 発行者の型。このパラメータには次の発行者型のいずれかを指定できる。
pvIssuer : [intptr] dwIssuerType の値が示す型の構造体へのポインタ。この構造体は、署名を検証するために必要な公開鍵へのアクセスを含む。
dwFlags : [int] 
pvExtra : [intptr] dwFlags パラメータが CRYPT_VERIFY_CERT_SIGN_RETURN_STRONG_PROPERTIES_FLAG に設定されている場合、CRYPT_VERIFY_CERT_SIGN_STRONG_PROPERTIES_INFO 構造体へのポインタ。構造体を解放するには CryptMemFree を呼び出さなければならない。
%inst
発行者の公開鍵を使用して、サブジェクト証明書、証明書失効リスト、証明書要求、または keygen 要求の署名を検証する。

[戻り値]
成功した場合は 0 以外、それ以外の場合は 0 を返す。
拡張エラー情報を取得するには GetLastError を呼び出す。注意 呼び出された
CryptCreateHash、CryptImportKey、CryptVerifySignature、CryptHashData
関数のエラーがこの関数に伝播することがある。失敗時に、この関数は GetLastError から次のエラーコードを返させる。
（以下省略）

[備考]
サブジェクトバッファには、証明書または CRL の符号化済み BLOB
またはコンテキストを含めることができる。証明書コンテキストの場合、証明書の公開鍵パラメータが欠落しており、これらのパラメータが証明書の発行者
(たとえば DSS 公開鍵パラメータなど) から継承できる場合、コンテキストの CERT_PUBKEY_ALG_PARA_PROP_ID
プロパティは、有効な署名に対して発行者の公開鍵アルゴリズムパラメータで更新される。


%index
CryptVerifyDetachedMessageHash
CryptVerifyDetachedMessageHash 関数は分離ハッシュを検証する。
%prm
pHashPara, pbDetachedHashBlob, cbDetachedHashBlob, cToBeHashed, rgpbToBeHashed, rgcbToBeHashed, pbComputedHash, pcbComputedHash
pHashPara : [var] ハッシュパラメータを含む CRYPT_HASH_MESSAGE_PARA 構造体へのポインタ。
pbDetachedHashBlob : [var] 符号化された分離ハッシュへのポインタ。
cbDetachedHashBlob : [int] 分離ハッシュのサイズ (バイト単位)。
cToBeHashed : [int] rgpbToBeHashed および rgcbToBeHashed 配列の要素数。
rgpbToBeHashed : [var] ハッシュ化するコンテンツバッファへのポインタの配列。
rgcbToBeHashed : [var] rgcbToBeHashed 配列の要素が指すコンテンツバッファのサイズ (バイト単位) の配列。
pbComputedHash : [var] 計算されたハッシュを受け取るバッファへのポインタ。
pcbComputedHash : [var] pbComputedHash バッファのサイズ (バイト単位) を指定する DWORD へのポインタ。関数が戻ると、この DWORD には作成されたハッシュのサイズ (バイト単位) が含まれる。このパラメータが NULL の場合、ハッシュは返されない。
%inst
CryptVerifyDetachedMessageHash 関数は分離ハッシュを検証する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。GetLastError 関数で最も一般的に返されるエラーコードを以下に示す。
（以下省略）


%index
CryptVerifyDetachedMessageSignature
CryptVerifyDetachedMessageSignature 関数は、分離署名を含む署名済みメッセージを検証する。
%prm
pVerifyPara, dwSignerIndex, pbDetachedSignBlob, cbDetachedSignBlob, cToBeSigned, rgpbToBeSigned, rgcbToBeSigned, ppSignerCert
pVerifyPara : [var] 検証パラメータを含む CRYPT_VERIFY_MESSAGE_PARA 構造体へのポインタ。
dwSignerIndex : [int] 検証する署名のインデックス。メッセージには複数の署名者が存在する場合があり、この関数は dwSignerIndex を変更しながら繰り返し呼び出して他の署名を検証できる。関数が FALSE を返し、GetLastError が CRYPT_E_NO_SIGNER を返す場合、前回の呼び出しでメッセージの最後の署名者を受け取ったことを示す。
pbDetachedSignBlob : [var] 符号化されたメッセージ署名を含む BLOB へのポインタ。
cbDetachedSignBlob : [int] 分離署名のサイズ (バイト単位)。
cToBeSigned : [int] rgpbToBeSigned および rgcbToBeSigned の配列要素数。
rgpbToBeSigned : [var] ハッシュ化するコンテンツを含むバッファへのポインタの配列。
rgcbToBeSigned : [var] rgpbToBeSigned が指すコンテンツバッファのサイズ (バイト単位) の配列。
ppSignerCert : [var] 署名者証明書を表す CERT_CONTEXT 構造体へのポインタのポインタ。証明書コンテキストの使用が終了したら、CertFreeCertificateContext 関数を呼び出して解放する。このパラメータが NULL の場合、CERT_CONTEXT 構造体へのポインタは返されない。
%inst
CryptVerifyDetachedMessageSignature 関数は、分離署名を含む署名済みメッセージを検証する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。GetLastError 関数で最も一般的に返されるエラーコードを以下に示す。
（以下省略）


%index
CryptVerifyMessageHash
CryptVerifyMessageHash 関数は、指定されたコンテンツのハッシュを検証する。
%prm
pHashPara, pbHashedBlob, cbHashedBlob, pbToBeHashed, pcbToBeHashed, pbComputedHash, pcbComputedHash
pHashPara : [var] ハッシュパラメータを含む CRYPT_HASH_MESSAGE_PARA 構造体へのポインタ。
pbHashedBlob : [var] 元のコンテンツとそのハッシュを含むバッファへのポインタ。
cbHashedBlob : [int] 元のハッシュバッファのサイズ (バイト単位)。
pbToBeHashed : [var] ハッシュ化された元のコンテンツを受け取るバッファへのポインタ。
pcbToBeHashed : [var] pbToBeHashed バッファのサイズ (バイト単位) を指定する DWORD へのポインタ。関数が戻ると、この変数には pbToBeHashed にコピーされた元のコンテンツのサイズ (バイト単位) が含まれる。このパラメータが NULL の場合、元のコンテンツは返されない。
pbComputedHash : [var] 計算されたハッシュを受け取るバッファへのポインタ。作成されたハッシュが追加の処理に不要な場合、またはメモリ割り当て目的で元のコンテンツのサイズを設定する場合、このパラメータは NULL にできる。詳細は Retrieving Data of Unknown Length を参照。
pcbComputedHash : [var] pbComputedHash バッファのサイズ (バイト単位) を指定する DWORD へのポインタ。関数が戻ると、この変数には作成されたハッシュのサイズ (バイト単位) が含まれる。このパラメータが NULL の場合、ハッシュは返されない。
%inst
CryptVerifyMessageHash 関数は、指定されたコンテンツのハッシュを検証する。

[戻り値]
関数が成功した場合、戻り値は 0 以外 (TRUE)。関数が失敗した場合、戻り値は 0 (FALSE)。拡張エラー情報を取得するには
GetLastError を呼び出す。GetLastError 関数で最も一般的に返されるエラーコードを以下に示す。
（以下省略）


%index
CryptVerifyMessageSignature
署名済みメッセージの署名を検証する。
%prm
pVerifyPara, dwSignerIndex, pbSignedBlob, cbSignedBlob, pbDecoded, pcbDecoded, ppSignerCert
pVerifyPara : [var] 検証パラメータを含む CRYPT_VERIFY_MESSAGE_PARA 構造体へのポインタ。
dwSignerIndex : [int] 目的の署名のインデックス。複数の署名がある場合がある。CryptVerifyMessageSignature を繰り返し呼び出し、毎回 dwSignerIndex を増分できる。最初の署名者、または署名者が 1 人しかいない場合、このパラメータを 0 に設定する。関数が FALSE を返し、GetLastError が CRYPT_E_NO_SIGNER を返す場合、前回の呼び出しでメッセージの最後の署名者を処理したことを示す。
pbSignedBlob : [var] 署名済みメッセージを含むバッファへのポインタ。
cbSignedBlob : [int] 署名済みメッセージバッファのサイズ (バイト単位)。
pbDecoded : [var] 復号されたメッセージを受け取るバッファへのポインタ。
pcbDecoded : [var] pbDecoded バッファのサイズ (バイト単位) を指定する DWORD 値へのポインタ。関数が戻ると、この DWORD には復号されたメッセージのサイズ (バイト単位) が含まれる。このパラメータが NULL の場合、復号されたメッセージは返されない。
ppSignerCert : [var] 署名者の証明書を受け取る CERT_CONTEXT 構造体へのポインタのアドレス。この構造体の使用が終了したら、このポインタを CertFreeCertificateContext 関数に渡して解放する。署名者の証明書が不要な場合、このパラメータは NULL にできる。
%inst
署名済みメッセージの署名を検証する。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。これは必ずしも署名が検証されたことを意味しない。分離メッセージの場合、pcbDecoded
が指す変数は 0 を含む。この場合、この関数は 0
以外を返すが、署名は検証されない。分離メッセージの署名を検証するには、CryptVerifyDetachedMessageSignature
関数を使用する。関数が失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。次の表に、GetLastError 関数で最も一般的に返されるエラーコードを示す。
（以下省略）

[備考]
検証済みの署名者とメッセージについて、ppSignerCert は署名者の CERT_CONTEXT で更新される。これは
CertFreeCertificateContext を呼び出して解放しなければならない。そうでない場合、ppSignerCert は
NULL に設定される。証明書と CRL のみを含むメッセージについては、pcbDecoded は NULL に設定される。


%index
CryptVerifyMessageSignatureWithKey
指定された公開鍵情報を使用して、署名済みメッセージの署名を検証する。
%prm
pVerifyPara, pPublicKeyInfo, pbSignedBlob, cbSignedBlob, pbDecoded, pcbDecoded
pVerifyPara : [var] 検証パラメータを含む CRYPT_KEY_VERIFY_MESSAGE_PARA 構造体へのポインタ。
pPublicKeyInfo : [var] 署名済みメッセージの検証に使用する公開鍵を含む CERT_PUBLIC_KEY_INFO 構造体へのポインタ。NULL の場合、署名は検証されない。
pbSignedBlob : [var] 署名済みメッセージを含むバッファへのポインタ。
cbSignedBlob : [int] 署名済みメッセージバッファのサイズ (バイト単位)。
pbDecoded : [var] 復号されたメッセージを受け取るバッファへのポインタ。
pcbDecoded : [var] pbDecoded バッファのサイズ (バイト単位) を指定する DWORD 値へのポインタ。関数が戻ると、この DWORD には復号されたメッセージのサイズ (バイト単位) が含まれる。このパラメータが NULL の場合、復号されたメッセージは返されない。
%inst
指定された公開鍵情報を使用して、署名済みメッセージの署名を検証する。

[戻り値]
関数が成功した場合、関数は 0 以外を返す。関数が失敗した場合は 0 を返す。拡張エラー情報を取得するには GetLastError
を呼び出す。次の表に、GetLastError 関数で最も一般的に返されるエラーコードを示す。
（以下省略）


%index
CryptVerifyTimeStampSignature
指定されたバイト配列のタイムスタンプ署名を検証する。
%prm
pbTSContentInfo, cbTSContentInfo, pbData, cbData, hAdditionalStore, ppTsContext, ppTsSigner, phStore
pbTSContentInfo : [var] タイムスタンプコンテンツを含むバッファへのポインタ。
cbTSContentInfo : [int] pbTSContentInfo パラメータが指すバッファのサイズ (バイト単位)。
pbData : [var] タイムスタンプ署名を検証するバイト配列へのポインタ。
cbData : [int] pbData パラメータが指す配列のサイズ (バイト単位)。
hAdditionalStore : [int] サポートするタイムスタンプ局 (TSA) 署名証明書および証明書信頼リスト (CTL) を検索するために使用する追加ストアのハンドル。追加ストアを検索しない場合、このパラメータは NULL にできる。
ppTsContext : [var] PCRYPT_TIMESTAMP_CONTEXT 構造体へのポインタ。コンテキストの使用が終了したら、CryptMemFree 関数を呼び出して解放しなければならない。
ppTsSigner : [var] 署名者の証明書を受け取る PCERT_CONTEXT へのポインタ。この構造体の使用が終了したら、このポインタを CertFreeCertificateContext 関数に渡して解放しなければならない。TSA 署名者の証明書が不要な場合、このパラメータを NULL に設定する。
phStore : [var] サポート証明書を検索するために CMS で開かれた証明書ストアを受け取るハンドルへのポインタ。TSA サポート証明書が不要な場合、このパラメータは NULL にできる。このハンドルの使用が終了したら、CertCloseStore 関数に渡して解放しなければならない。
%inst
指定されたバイト配列のタイムスタンプ署名を検証する。

[戻り値]
関数が成功した場合は TRUE を返す。拡張エラー情報を取得するには GetLastError 関数を呼び出す。

[備考]
呼び出し元は、CryptRetrieveTimeStamp 関数によって返された CRYPT_TIMESTAMP_INFO 構造体の
pszTSAPolicyId メンバを検証する必要がある。要求で TSA ポリシーが指定されており、ftTime
メンバに有効な値が含まれている場合、呼び出し元は ppTsSigner
パラメータに入力する証明書コンテキスト連鎖を構築し、信頼を検証する必要がある。


%index
PFXExportCertStore
参照された証明書ストアから証明書、および利用可能であれば関連する秘密鍵をエクスポートする。
%prm
hStore, pPFX, szPassword, dwFlags
hStore : [int] エクスポートする証明書を含む証明書ストアのハンドル。
pPFX : [var] エクスポートされた証明書と鍵を含む PFX パケットを含む CRYPT_DATA_BLOB 構造体へのポインタ。pPFX->pbData が NULL の場合、関数は符号化された BLOB に必要なバイト数を計算し、これを pPFX->cbData に返す。pPFX->pbData が必要なサイズの割り当て済みバッファを指す状態で関数が呼び出されると、関数は符号化済みバイトをバッファにコピーし、pPFX->cbData を符号化バイト長で更新する。
szPassword : [wstr] PFX パケットを暗号化および検証するために使用される文字列パスワード。パスワードの使用が終了したら、SecureZeroMemory 関数を呼び出してパスワードをメモリからクリアする。パスワードの保護に関する詳細は Handling Passwords を参照。
dwFlags : [int] フラグ値は次の任意の組み合わせに設定できる。
%inst
参照された証明書ストアから証明書、および利用可能であれば関連する秘密鍵をエクスポートする。

[戻り値]
関数が成功した場合は TRUE (0 以外)、失敗した場合は FALSE (0) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。


%index
PFXExportCertStoreEx
参照された証明書ストアから証明書、および利用可能であれば関連する秘密鍵をエクスポートする。
%prm
hStore, pPFX, szPassword, pvPara, dwFlags
hStore : [int] エクスポートする証明書を含む証明書ストアのハンドル。
pPFX : [var] エクスポートされた証明書と鍵を含む PFX パケットを含む CRYPT_DATA_BLOB 構造体へのポインタ。pPFX->pbData が NULL の場合、関数は符号化された BLOB に必要なバイト数を計算し、これを pPFX->cbData に返す。pPFX->pbData が必要なサイズの割り当て済みバッファを指す状態で関数が呼び出されると、関数は符号化済みバイトをバッファにコピーし、pPFX->cbData を符号化バイト長で更新する。
szPassword : [wstr] PFX パケットを暗号化および検証するために使用される文字列パスワード。パスワードの使用が終了したら、SecureZeroMemory 関数を呼び出してパスワードをメモリからクリアする。パスワードの保護に関する詳細は Handling Passwords を参照。
pvPara : [intptr] dwFlags パラメータに PKCS12_PROTECT_TO_DOMAIN_SIDS または PKCS12_EXPORT_PBES2_PARAMS が含まれていない場合、このパラメータは NULL でなければならない。したがって Windows 8 および Windows Server 2012 より前では、このパラメータは NULL でなければならない。Windows 8 および Windows Server 2012 以降、dwFlags パラメータに PKCS12_PROTECT_TO_DOMAIN_SIDS が含まれている場合、pvPara パラメータが NCRYPT_DESCRIPTOR_HANDLE 値を指すように設定して、PFX パスワードを PFX BLOB 内でどの Active Directory プリンシパルに対して保護するかを識別できる。現在、パスワードは Active Directory のユーザー、コンピュータ、またはグループに対して保護できる。保護記述子の詳細については NCryptCreateProtectionDescriptor を参照。Windows 10 1709 (Fall Creators update) および Windows Server 2019 以降、dwFlags パラメータに PKCS12_EXPORT_PBES2_PARAMS が含まれている場合、pvPara を PKCS12_EXPORT_PBES2_PARAMS 値に設定して、使用するパスワードベースの暗号化アルゴリズムを選択する必要がある。
dwFlags : [int] フラグ値は次の任意の組み合わせに設定できる。
%inst
参照された証明書ストアから証明書、および利用可能であれば関連する秘密鍵をエクスポートする。

[戻り値]
関数が成功した場合は TRUE (0 以外)、失敗した場合は FALSE (0) を返す。拡張エラー情報を取得するには
GetLastError を呼び出す。

[備考]
Windows 8 および Windows Server 2012 以降、PFX パスワードを Active Directory
のユーザー、コンピュータ、またはグループに対して保護できる。そうすることを選択したがパスワードを作成しない場合、一時的なパスワードがランダムに選択される。パスワードは
Active Directory プリンシパルを使用して暗号化され、PFX BLOB に埋め込まれる。詳細は pvPara
パラメータおよび PKCS12_PROTECT_TO_DOMAIN_SIDS フラグを参照。Windows 10 1709 (Fall
Creators update) および Windows Server 2019 以降、次のレジストリキーを使用して
PFXExportCertStoreEx 関数がパスワード上でハッシュ関数を実行する反復回数を制御できる。このキーの値は
REG_DWORD
型である。HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\PFX\PasswordIterationCount


%index
PFXImportCertStore
PFX BLOB をインポートし、証明書と関連する秘密鍵を含むストアのハンドルを返す。
%prm
pPFX, szPassword, dwFlags
pPFX : [var] エクスポートおよび暗号化された証明書と鍵を含む PFX パケットを含む [CRYPT_DATA_BLOB](/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)) 構造体へのポインタ。
szPassword : [wstr] PFX パケットを復号および検証するために使用される文字列パスワード。長さが 0 より大きい文字列、空文字列、または **NULL** のいずれであっても、この値はパケットを暗号化するために使用された値と完全に同じでなければならない。Windows 8 および Windows Server 2012 以降、PFX パケットが [PFXExportCertStoreEx](nf-wincrypt-pfxexportcertstoreex.md) 関数で **PKCS12_PROTECT_TO_DOMAIN_SIDS** フラグを使用して作成された場合、**PFXImportCertStore** 関数はそれを暗号化するために使用された Active Directory (AD) プリンシパルを使用してパスワードの復号を試みる。AD プリンシパルは *pvPara* パラメータで指定される。**PFXExportCertStoreEx** 関数の *szPassword* パラメータが空文字列または **NULL** で、*dwFlags* パラメータが **PKCS12_PROTECT_TO_DOMAIN_SIDS** に設定されていた場合、その関数はランダムにパスワードを生成し、それを *pvPara* パラメータで指定された AD プリンシパルに暗号化した。その場合、PFX パケットが作成されたときに使用された値 (空文字列または **NULL**) にパスワードを設定する必要がある。**PFXImportCertStore** 関数は AD プリンシパルを使用してランダムなパスワードを復号し、ランダムに生成されたパスワードを使用して PFX 証明書を復号する。パスワードの使用が終了したら、[SecureZeroMemory](/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)) 関数を呼び出してメモリからクリアする。パスワードの保護に関する詳細は [Handling Passwords](/windows/win32/SecBP/handling-passwords) を参照。
dwFlags : [int] 
%inst
PFX BLOB をインポートし、証明書と関連する秘密鍵を含むストアのハンドルを返す。

[戻り値]
関数が成功した場合、インポートされた証明書 (利用可能な秘密鍵を含む)
を含む証明書ストアへのハンドルを返す。関数が失敗した場合、つまり、パスワードパラメータがエクスポートされたパケットの暗号化に使用されたパスワードと完全に一致しない場合や、PFX
BLOB の復号時に他の問題があった場合、関数は **NULL**
を返し、[GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
関数を呼び出してエラーコードを取得できる。

[備考]
**PFXImportCertStore**
関数は一時ストアを開く。関数が成功した場合、[CertCloseStore](nf-wincrypt-certclosestore.md)
関数を呼び出してストアへのハンドルを閉じる必要がある。PFX パケットから証明書をインポートするとき、CSP/KSP コンテナ名は
PKCS8ShroudedKeyBag SafeBag [bagId: 1.2.840.113549.1.12.10.1.2] の OID
1.3.6.1.4.1.311.17.1 を持つ AttributeId を使用して決定される (この ASN.1 構造の詳細については
[PKCS #12](https://www.rfc-editor.org/rfc/rfc7292) を参照)。*
**AttributeId:** 1.3.6.1.4.1.311.17.1 * **Value:** KSP 名または CSP
名。AttributeId が存在せず、PREFER_CNG フラグが渡された場合、MS_KEY_STORAGE_PROVIDER
が選択される。AttributeId が存在せず、PREFER_CNG フラグが渡されなかった場合、プロバイダ名は公開鍵アルゴリズム
(つまり、公開鍵アルゴリズムは PKCS #8 内の AlgorithmIdentifier によって決定される)
に基づいて決定される。* **RSA:** MS_ENHANCED_PROV_W * **DSA:**
MS_DEF_DSS_DH_PROV_W。同様に、鍵指定は OID 2.5.29.15 (szOID_KEY_USAGE) を持つ
AttributeId を使用して次のように決定される。**CAPI 鍵が使用される場合:** * KEY_ENCIPHERMENT
または DATA_ENCIPHERMENT が設定されている場合、鍵指定は AT_KEYEXCHANGE に設定される。*
DIGITAL_SIGNATURE または CERT_SIGN または CRL_SIGN が設定されている場合、鍵指定は
AT_SIGNATURE に設定される。**CNG 鍵が使用される場合:** * KEY_ENCIPHERMENT または
DATA_ENCIPHERMENT または ENCIPHER_ONLY または DECIPHER_ONLY
が設定されている場合、ncrypt 鍵使用法は ALLOW_DECRYPT に設定される。* DIGITAL_SIGNATURE または
CERT_SIGN または CRL_SIGN が設定されている場合、ncrypt 鍵使用法は ALLOW_SIGN に設定される。*
KEY_AGREEMENT が設定されている場合、ncrypt 鍵使用法は ALLOW_KEY_AGREEMENT
に設定される。AttributeId が存在しない場合、RSA または DH に対して CAPI 鍵の値は AT_KEYEXCHANGE
に設定され、アルゴリズムは PKCS #8 の AlgorithmIdentifier によって決定される。それ以外の場合、アルゴリズムは
AT_SIGNATURE に設定される。CNG 鍵の値については、すべての ncrypt 鍵使用法が設定される。>[!NOTE] >PFX
パケット内に無効なプロバイダ名が存在する場合、または基本または強化暗号プロバイダがこのレジストリキー
(**HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Cryptography\\Defaults\\Provider**)
に存在しない場合、このレジストリサブキー
(**HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Cryptography\\Defaults\\Provider
Types**) を使用してプロバイダ型によるプロバイダ検索が実行される。Microsoft は PFX のインポートのために次の 2
つの暗号化/ハッシュアルゴリズムのみをサポートする。* TripleDES-SHA1 *
AES256-SHA256。上記のアルゴリズムのいずれにおいても、証明書の暗号化は省略可能。Microsoft は `All Tasks`
> `Yes, export the private key` の選択により、証明書ストアから PFX
をエクスポートできる。そこでは、これら 2 つの選択肢のいずれかに一致する暗号化/ハッシュアルゴリズムを選択できる。次を使用して
PowerShell で PFX をエクスポートできる。
（以下省略）


%index
PFXIsPFXBlob
PFXIsPFXBlob 関数は、BLOB の外層を PFX パケットとして復号を試みる。
%prm
pPFX
pPFX : [var] 関数が PFX パケットとして復号を試みる CRYPT_DATA_BLOB 構造体へのポインタ。
%inst
PFXIsPFXBlob 関数は、BLOB の外層を PFX パケットとして復号を試みる。

[戻り値]
関数は、BLOB を PFX パケットとして復号できる場合は TRUE を返す。BLOB の外層を PFX
パケットとして復号できない場合、関数は FALSE を返す。


%index
PFXVerifyPassword
PFXVerifyPassword 関数は、BLOB の外層を Personal Information Exchange (PFX) パケットとして復号し、指定されたパスワードで復号を試みる。BLOB からインポートされるデータはない。
%prm
pPFX, szPassword, dwFlags
pPFX : [var] 関数が PFX パケットとして復号を試みる CRYPT_DATA_BLOB 構造体へのポインタ。
szPassword : [wstr] 確認する文字列パスワード。この関数が成功するためには、このパスワードはパケットの暗号化に使用されたパスワードと完全に一致する必要がある。この値を空文字列または NULL に設定した場合、この関数は通常、空文字列または NULL を使用して PFX BLOB に埋め込まれたパスワードの復号を試みる。ただし、Windows 8 および Windows Server 2012 以降、PFX BLOB の作成時に NULL または空のパスワードが指定され、かつアプリケーションがパスワードを Active Directory (AD) プリンシパルに対して保護するよう指定した場合、Cryptography API (CAPI) はランダムにパスワードを生成し、それを AD プリンシパルに暗号化して PFX BLOB に埋め込む。その後、PFXVerifyPassword 関数は指定された AD プリンシパル (現在のユーザー、コンピュータ、または AD グループメンバー) を使用してパスワードの復号を試みる。PFX を AD プリンシパルに対して保護することに関する詳細については、PFXExportCertStoreEx 関数の pvPara パラメータおよび PKCS12_PROTECT_TO_DOMAIN_SIDS フラグを参照。パスワードの使用が終了したら、SecureZeroMemory 関数を呼び出してパスワードをメモリからクリアする。パスワードの保護に関する詳細は Handling Passwords を参照。
dwFlags : [int] 将来使用のために予約されている。
%inst
PFXVerifyPassword 関数は、BLOB の外層を Personal Information Exchange (PFX)
パケットとして復号し、指定されたパスワードで復号を試みる。BLOB からインポートされるデータはない。

[戻り値]
パスワードが正しいと見られる場合、関数は TRUE を返す。それ以外の場合は FALSE を返す。

