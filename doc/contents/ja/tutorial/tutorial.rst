
.. article::
  :order: 1
  


サイトの作成
======================

このチュートリアルで作成するソースコードは、

   https://github.com/miyadaiku/miyadaiku-docs/tree/master/samples/first_doc

からダウンロードできます。

作成したサイトは、

   https://miyadaiku.github.io/samples/first_doc/hello.html

で参照できます。



.. target:: create_project

プロジェクトの作成
-------------------------


はじめに、次のコマンドで ``first_doc`` ディレクトリに ``miyadaiku`` のプロジェクトを作成します

.. code-block:: console

   $ miyadaiku-start ./first_doc

次のようなディレクトリが作成されます。

::

   first_doc/
        ├─── config.yml   プロジェクト設定を指定するYAMLファイル
        │
        ├─── contents/    reStructuredText/Markdownなどの文書を格納するディレクトリ
        │
        ├─── files/       画像・バイナリファイルなどを格納するディレクトリ
        │
        ├─── modules/     Pythonモジュールを格納するディレクトリ
        │
        └─── templates/   jinja2テンプレートファイルを格納するディレクトリ



.. target:: create_article

アーティクルの作成
-------------------------


最初のアーティクルとして、reStructuredText形式のファイルを作成しましょう。


.. code-block:: rst
   :caption: first_doc/contents/hello.rst:

   hello world
   -------------

   This is my first miyadaiku article.


上記の内容のテキストファイルを作成し、 ``first_doc/contents/hello.rst`` という名前で保存してください。


.. target:: build

サイトのビルド
-------------------------

テキストファイルを保存したら、次のコマンドでサイトをビルドします。

.. code-block:: console

   $ miyadaiku-build ./first_doc


正常に終了すれば、``first_doc/output/hello.html`` ファイルが作成されます。


.. target:: createlinks

アーティクルのリンク
-------------------------

もう一つ、新しいアーティクル ``first_doc/contents/link.rst`` を作成します。


.. code-block:: rst
   :caption: first_doc/contents/link.rst:

   Link test
   -------------

   This is a link page.

   Link to :jinja:`{{ content.link_to("./hello.rst") }}`.


再び、

.. code-block:: console

   $ miyadaiku-build ./first_doc


でサイトを構築すると、あらたに ``first_doc/output/link.html`` が作成されます。

``:jinja:`` ロールで記述した内容は、そのまま ``Jinja2`` のテンプレートとして処理され、HTMLに変換されます。

変数 ``content`` は、処理中のアーティクルを参照する :jinja:`{{ content.link_to('../guide/objects.rst', fragment='content_obj') }}` です。ここでは、``link_to(ページ名)`` メソッドを使用して、他のページへのリンクを作成します。リンク先ページのタイトルが、リンクのテキストとなります。


.. target:: template

テンプレートのカスタマイズ
-------------------------------

アーティクルは、``page_article.html`` という名前の Jinja2 テンプレートでHTMLに変換されます。 デフォルトでは、`miyadaiku.themes.base <https://github.com/miyadaiku/miyadaiku/tree/master/miyadaiku/themes/base/templates>`_  パッケージの `page_article.html <https://github.com/miyadaiku/miyadaiku/tree/master/miyadaiku/themes/base/templates/page_article.html>`_ が使われます。

独自のテンプレートを使用する場合は、テンプレートディレクトリ ``first_doc/templates`` に ``page_article.html`` ファイルを作成します。

ここでは、Jinja2 の継承機能を利用して、デフォルトのテンプレートをカスタマイズし、独自のテンプレートを作成します。


.. code-block:: jinja
   :caption: first_doc/templates/page_article.html:

   <!-- miyadaiku.themes.base パッケージの page_article.html を拡張する -->
   {% extends 'miyadaiku.themes.base!page_article.html' %}
   
   <!-- bodyブロックをカスタマイズ -->
   {% block body %}

     <!-- 元のbodyブロックを出力 -->
     {{ super() }}

     <!-- コピーライト表記を追加 -->
     <div class="copyright">Copyright(c) 2017 miyadaiku ALL RIGHTS RESERVED.</div>

   {% endblock body %}

この例の

    ``miyadaiku.themes.base!page_article.html``

は、``miyadaiku.themes.base`` テーマの ``templates/page_article.html`` ファイルを指定しています。

テーマパッケージの ``templates`` ディレクトリにあるテンプレートを使用するときは、次のようにパッケージ名とファイル名を ``!`` 記号で区切って指定します。

    ``パッケージ名!テンプレートファイル名``



``page_article.html`` には、``head`` ブロックと ``body`` ブロックがあり、それぞれ ``<head>`` 要素と ``<body>`` 要素を出力します。この例では、``body`` ブロックをオーバライドして、``body`` 要素にコピーライト表記を追加しています。




.. target:: newfile

CSSファイルを追加
-------------------------

プロジェクトの ``files/`` ディレクトリにあるファイルは、HTMLに変換せずにそのまま ``outputs`` ディレクトリにコピーされます。

``first_doc/files/static/css`` ディレクトリに、以下の内容の ``copyright.css`` ファイルを追加します。


.. code-block:: CSS
   :caption: first_doc/files/static/css/copyright.css:

   .copyright {
     text-align: right;
   }

前節で作成したテンプレート ``first_doc/templetes/page_article.html`` を、次のように修正します。


.. code-block:: jinja
   :caption: first_doc/templetes/page_article.html:

   <!-- miyadaiku.themes.base パッケージの page_article.html を拡張する -->
   {% extends 'miyadaiku.themes.base!page_article.html' %}
   
   <!-- テンプレート追加 - ここから -->

   <!-- headブロックをカスタマイズ -->
   {% block head %}

     <!-- 元のheadブロックを出力 -->
     {{ super() }}

      <!-- link要素を追加 -->
      <link rel="stylesheet" href="{{ page.path_to('/static/css/copyright.css')}}">
   {% endblock head %}

   <!-- テンプレート追加 - ここまで -->

   <!-- bodyブロックをカスタマイズ -->
   {% block body %}

     <!-- 元のbodyブロックを出力 -->
     {{ super() }}

     <!-- コピーライト表記を追加 -->
     <div class="copyright">Copyright(c) 2017 miyadaiku ALL RIGHTS RESERVED.</div>

   {% endblock body %}


``head`` ブロックのオーバライドを追加し、``<link>`` 要素でCSSの読み込みを指定します。``content.path_to(ページ名)`` メソッドは、指定したページのパスを返します。

