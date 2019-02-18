
.. article::
  :order: 3


Breadcrumbの実装
======================

Miyadaikuの :jinja:`{{ page.link_to('../guide/config.rst') }}` を利用して、Breadcrumb付きのサイトを作成します。Breadcrumbは、`Bootstrap4 <https://getbootstrap.com/>`__ の `Breadclumbs <https://getbootstrap.com/docs/4.3/components/breadcrumb/>`__ で表示します。

このチュートリアルで作成するソースコードは、

    https://github.com/miyadaiku/miyadaiku-docs/tree/master/samples/breadcrumb

からダウンロードできます。

作成したサイトは、

    https://miyadaiku.github.io/samples/breadcrumb/index.html

で参照できます。

プロジェクトの作成
-------------------------

はじめに、次のコマンドで ``breadcrumb`` ディレクトリに ``miyadaiku`` のプロジェクトを作成します

.. code-block:: console

   $ miyadaiku-start ./breadcrumb



Bootstrap4テーマのインストール
------------------------------------------

Miyadaikuでは、かんたんにBootstrap4を使えるように、`miyadaiku.themes.bootstrap4 <https://github.com/miyadaiku/miyadaiku-themes-bootstrap4>`__ テーマを用意しています。``miyadaiku.themes.bootstrap4`` は、次のコマンドでインストールできます。

.. code-block:: bash

   $ pip3 install miyadaiku.themes.bootstrap4


プロジェクト設定
-------------------------

プロジェクト設定ファイル ``breadcrumb/config.yml`` の ``themes`` を修正し、`miyadaiku.themes.bootstrap4 <https://github.com/miyadaiku/miyadaiku-themes-bootstrap4>`__ を使用するように設定します。

.. code-block:: yaml
   :caption: first_blog/config.yml:

   # Title of the site
   site_title: FIXME - site title

   # Default language code
   lang: ja

   (... 中略 ...)

   # List of site theme
   themes:                            # <--- この行を修正
     - miyadaiku.themes.bootstrap4    # <--- この行を修正


記事の作成
-------------------------

表示する記事として、``breadcrumb/contents`` ディレクトリと ``breadcrumb/contents/child1`` ディレクトリに、次の4ファイルを作成します。

.. code-block:: rst
   :caption: breadcrumb/contents/index.rst:


   .. article::
      :title: index.rst in the root directory

   This is /index.rst.


.. code-block:: rst
   :caption: breadcrumb/contents/page1.rst:

   .. article::
      :title: page1.rst in the root directory

   This is /page1.rst.


.. code-block:: rst
   :caption: breadcrumb/contents/child1/index.rst:

   .. article::
      :title: index.rst in the child1 directory

   Welcome to the child1.


.. code-block:: rst
   :caption: breadcrumb/contents/child1/child1-2.rst:

   .. article::
      :title: child1-2.rst in the child1 directory

   This is child1-2.rst file in the /child1 directory.


コンフィグの作成
-------------------------

:jinja:`{{ page.link_to('../guide/config.rst') }}` は、ディレクトリごとの設定を指定するYAMLファイルです。


``breadcrumb/contents`` ディレクトリと ``breadcrumb/contents/child1`` ディレクトリにコンフィグを作成し、Breadcrumb に表示するタイトルを ``foldername`` 属性に指定します。


.. code-block:: yaml
   :caption: breadcrumb/contents/root.yml:

   foldername: Root folder


.. code-block:: yaml
   :caption: breadcrumb/contents/child1/child1.yml:

   foldername: Child1 folder


テンプレートの作成
-------------------------

Jinja2テンプレート ``breadcrumb/templates/page_article.html`` を作成します。

.. code-block:: jinja
   :caption: breadcrumb/templates/page_article.html:

   <!DOCTYPE html>
   <html>
   <head>
     <!-- include boolstrap4 -->
     {{ bootstrap4.load_css(page) }}
  
     <title>{{ page.title }} - {{ page.site_title }}</title>
   </head>

   <body>


   <nav aria-label="breadcrumb">
     <ol class="breadcrumb">

       {% for parent in page.parents_dirs %}
         <li class="breadcrumb-item">
           {{ page.link_to((parent, 'index.rst'),
                            text=config.get(parent, 'foldername')) }}
         </a></li>
       {% endfor %}

       <li class="breadcrumb-item active">
         {{ page.title }}
       </li>
     </ol>
   </nav>


    <div class="container-fluid">
    <div class="row">
       <div class="col-sm">
         {{ page.html }}
       </div>
       <div class="col-sm">
         <ul>
           {% for article in contents.get_contents(subdirs=[page.dirname]) %}
             <li>{{ article.link(text="%s (/%s)" % (
                    article.title,
                    "/".join(article.dirname+(article.name,)))) }}
           {%endfor %}
         </ul>
       </div>
     </div>
   </div>

   </body>
   </html>
   


Bootstrap4のCSSは、次のように ``bootstrap4.load_css()`` を呼び出し ``<link>`` 要素を出力します。

.. code-block:: jinja

   <head>
     <!-- include boolstrap4 -->
     {{ bootstrap4.load_css(page) }}


ページオブジェクトの ``parents_dirs`` 属性で親ディレクトリの一覧を取得し、各ディレクトリの ``index.rst`` へのリンクをBreadcrumbとして出力します。

.. code-block:: jinja

   {% for parent in page.parents_dirs %}
     <li class="breadcrumb-item">
       {{ page.link_to((parent, 'index.rst'),
                        text=config.get(parent, 'foldername')) }}
     </a></li>
   {% endfor %}


一番最後のBreadcrumbは、現在のページのタイトルを出力します。

.. code-block:: jinja

   <li class="breadcrumb-item active">
     {{ page.title }}
   </li>




サイトのビルド
-------------------------

次のコマンドでサイトをビルドします。


.. code-block:: console

   $ miyadaiku-build ./breadcrumb


正常に終了すると、``breadcrumb/outputs/index.html`` が出力されます。

