
.. article::
  :order: 1
  

サイトの作成
======================

はじめに、次のコマンドで ``first_doc`` ディレクトリに ``miyadaiku`` のプロジェクトを作成します

.. code-block:: console

   $ miyadaiku-start ./first_doc

このコマンドで、次のようなディレクトリが作成されます。

::

   first_doc/
        ├─── config.yml   プロジェクト設定を指定するYAMLファイル
        │
        ├─── contents/    reStructuredText/Markdownなどの文書を格納するディレクトリ
        │
        ├─── files/       画像・バイナリファイルなどを格納するディレクトリ
        │
        └─── templates/   jinja2テンプレートファイルを格納するディレクトリ




アーティクルの作成
-------------------------


では、最初のアーティクルとして、reStructuredText形式のファイルを作成しましょう。


.. code-block:: rst

   hello world
   -------------

   This is my first miyadaiku article.


上記の内容のテキストファイルを作成し、 ``first_doc/contents/hello.rst`` という名前で保存してください。


テキストファイルを保存したら、次のコマンドでサイトを構築します。

.. code-block:: console

   $ miyadaiku-build ./first_doc


正常に終了すれば、``first_doc/output/hello.html`` ファイルが作成されています。


アーティクルのリンク
-------------------------

もう一つ、新しいアーティクル ``first_doc/contents/link.rst`` を作成します。


.. code-block:: rst

   Link test
   -------------

   This is a link page.

   Link to :jinja:`{{ page.link_to("./hello.rst") }}`.


再び、

.. code-block:: console

   $ miyadaiku-build ./first_doc


でサイトを構築すると、あらたに ``first_doc/output/link.html`` が作成されます。

``:jinja:`` ロールで記述した内容は、そのまま ``Jinja2`` のテンプレートとして処理され、HTMLに変換されます。

``first_doc/contents/index.rst`` では、``:jinja:`` ロールを利用して、``./hello.rst`` ページへのリンクを作成しています。``page.link_to(ページ名)`` メソッドは、指定したページのタイトルをテキストとして、リンクを作成します。


テンプレートのカスタマイズ
-------------------------------

MiyadaikuがアーティクルからHTMLページを生成する時、``page_article.html`` という名前の Jinja2 テンプレートを使用します。デフォルトでは、``miyadaiku.themes.base`` パッケージの ``page_article.html`` ファイルがテンプレートとなります。

Jinja2 の継承機能を利用してこのテンプレートをカスタマイズし、独自のテンプレートを作成できます。例として、テンプレートディレクトリ ``first_doc/templates`` に、 テンプレートとなる ``page_article.html`` ファイルを作成しましょう。


.. code-block:: jinja

   <!-- miyadaiku.themes.base パッケージの page_article.html を拡張する -->
   {% extends 'miyadaiku.themes.base!page_article.html' %}
   
   <!-- bodyブロックをカスタマイズ -->
   {% block body %}

     <!-- 元のbodyブロックを出力 -->
     {{ super() }}

     <!-- コピーライト表記を追加 -->
     <div class="copyright">Copyright(c) 2017 miyadaiku ALL RIGHTS RESERVED.</div>

   {% endblock body %}

``page_article.html`` テンプレートには ``head`` ブロックと ``body`` ブロックがあり、それぞれ ``<head>`` 要素と ``<body>`` 要素を出力します。ここでは ``body`` ブロックをオーバライドして、``body`` 要素にコピーライト表記を追加します。

Miyadaikuでは、Pythonパッケージに含まれるテンプレートを、``パッケージ名!テンプレートファイル名`` のように、パッケージ名とファイル名を ``!`` 記号で区切って指定します。この例では、``miyadaiku.themes.base`` パッケージの ``page_article.html`` ファイルを拡張しています。


CSSファイルを追加
-------------------------

プロジェクトの ``files/`` ディレクトリにあるファイルは、HTMLに変換せずにそのまま ``output`` ディレクトリにコピーされます。

``first_doc/files/static/css`` ディレクトリに、以下の内容の ``copyright.css`` ファイルを追加します。


.. code-block:: CSS

   .copyright {
     text-align: right;
   }

前節で作成した ``first_doc/templetes/page_article.html`` を、次のように修正します。


.. code-block:: jinja

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


``head`` ブロックのオーバライドを追加し、``<link>`` 要素でCSSの読み込みを指定します。``page.path_to(ページ名)`` メソッドは、指定したページへの相対パスを返します。

