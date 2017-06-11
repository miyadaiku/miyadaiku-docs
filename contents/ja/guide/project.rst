
.. article::
  :order: 1
  

Miyadaikuプロジェクト
======================


Miyadaikuのドキュメントプロジェクトは、``miyadaiku-start`` コマンドで作成します。

.. code-block:: sh
   :caption: Creating new miyadaiku project:
  
   $ miyadaiku-start new-project
   $ ls new-project/
   config.yml	contents	files		templates


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
        └─── outputs/      HTMLなどの出力ファイルを出力するディクレクトリ




:config.yml ファイル: 
   プロジェクト全体のデフォルトとなるプロパティを指定する ``YAML`` ファイルです。

:contents ディレクトリ: 
   reStructuredText/Markdownなどによる文書ファイルや設定ファイルなど、 ``miyadaiku-build`` コマンドが処理するソースファイルを格納します。

   ``contents`` ディレクトリにサブディレクトリを作成してソースファイルを作成すると、``outputs`` ディレクトリに同じサブディレクトリを作成して結果を出力します。

:files ディレクトリ: 
   ``miyadaiku-build`` コマンドで変換せず、``outputs`` ディレクトリにコピーするファイルを格納します。

   ``files`` ディレクトリにサブディレクトリを作成してファイルを作成すると、``outputs`` ディレクトリに同じサブディレクトリを作成してファイルをコピーします。

:templates ディレクトリ: 
   ``jinja2`` テンプレートファイルを格納します。

:outputs ディレクトリ: 
   ``miyadaiku-build`` コマンドで生成したHTMLなどのファイルを格納します。



コンテンツファイル
--------------------------


``miyadaiku-build`` コマンドは、miyadaikuプロジェクトの ``contents`` ディレクトリの次の形式のファイルをコンテンツファイルとして処理し、HTMLファイルを作成します。

- \*.yml ファイル
- \*.rst ファイル
- \*.md ファイル
- \*.html ファイル


処理結果は output ディレクトリに出力します。上記以外の画像ファイルなどは、ソースファイルとして処理をせず、そのままoutput ディレクトリにコピーします。


テンプレート
-------------------

``contents`` ディレクトリのコンテンツファイルは、Markdownパーザなどで変換してから、Jinjaテンプレート部分を実行してHTMLに変換されます。生成されたHTMLは、``templates`` ディレクトリの Jinjaテンプレートで最終的なHTMLファイルを作成し、``outputs`` ディレクトリに出力されます。

:jinja:`<img src="{{page.path_to('/img/process.png')}}" width=500px>`

