; ============================================================
;   dwrite.dll ヘルプ (CsWin32 / win32metadata から自動抽出)
;   docs_ja.json に日本語訳があればそちらを使用、無ければ英語原文。
;   翻訳を追加するときは docs_ja.json を編集して再生成。
; ============================================================

%index
DWriteCreateFactory
その後の個別 DirectWrite オブジェクト生成に使用される DirectWrite ファクトリオブジェクトを作成する。
%group
Win32 dwrite
%prm
factoryType, iid, factory
factoryType : [int] 型: DWRITE_FACTORY_TYPE ファクトリオブジェクトを共有にするか分離するかを指定する値。
iid : [var] 型: REFIID DirectWrite ファクトリインターフェースを識別する GUID 値。たとえば __uuidof(IDWriteFactory)。
factory : [var] 型: IUnknown** 新しく作成された DirectWrite ファクトリオブジェクトへのポインタを受け取るアドレス。
%inst
その後の個別 DirectWrite オブジェクト生成に使用される DirectWrite ファクトリオブジェクトを作成する。

[戻り値]
型: HRESULT 関数が成功すると S_OK を返す。失敗時は HRESULT エラーコードを返す。

[備考]
この関数は、その後の個別 DirectWrite オブジェクトの生成に使用される DirectWrite
ファクトリオブジェクトを作成する。DirectWrite
ファクトリは、フォントローダの登録やキャッシュ済みフォントデータなどの内部状態を保持する。多くの場合、共有ファクトリオブジェクトを使うことを推奨する。これにより
DirectWrite
を使う複数のコンポーネントが内部状態を共有でき、メモリ使用量を削減できるからである。一方で、信頼できないソースからのプラグインなどの影響をプロセス全体に及ぼさないよう、サンドボックス化して分離したい場合もある。そのような場合には、サンドボックス化したコンポーネント用に分離ファクトリを使うことを推奨する。以下の例は共有
DirectWrite ファクトリの作成方法を示す。
このドキュメントは省略されている。

