
.. article::
  :order: 1
  

Miyadaikuプロジェクト
======================


Miyadaikuのドキュメントプロジェクトは、``miyadaiku-start`` コマンドで作成します。

ディレクトリ構成
-----------------


ドキュメントプロジェクトは、次のようなファイルから構成されます。

::

   ドキュメントプロジェクト/
        │
        ├─── config.yml   プロジェクト設定を指定するYAMLファイル
        │
        ├─── contents/    reStructuredText/Markdownなどの文書を格納するディレクトリ
        │
        ├─── files/       画像・バイナリファイルなどを格納するディレクトリ
        │
        ├─── templates/   jinja2テンプレートファイルを格納するディレクトリ
        │
        └─── output/      HTMLなどの出力ファイルを出力するディクレクトリ




:config.yml ファイル: 
   プロジェクト全体のデフォルトとなるプロパティを指定する ``YAML`` ファイルです。

:contents ディレクトリ: 
   reStructuredText/Markdownなどによる文書ファイルや設定ファイルなど、 ``miyadaiku-build`` コマンドが処理するソースファイルを格納します。

:files ディレクトリ: 
   ``miyadaiku-build`` コマンドで変換せず、output ディレクトリにコピーするファイルを格納します。

:templates ディレクトリ: 
   ``jinja2`` テンプレートファイルを格納します。

:output ディレクトリ: 
   ``miyadaiku-build`` コマンドで生成したHTMLなどのファイルを格納します。


コンテンツファイル
--------------------------


``miyadaiku-build`` コマンドは、miyadaikuプロジェクトの ``contents`` ディレクトリの次の形式のファイルをコンテンツファイルとして処理します。

- \*.yml ファイル
- \*.rst ファイル
- \*.md ファイル
- \*.html ファイル


処理結果は output ディレクトリに出力します。上記以外の画像ファイルなどは、ソースファイルとして処理をせず、そのままoutput ディレクトリにコピーします。
