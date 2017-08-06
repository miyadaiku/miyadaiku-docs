
.. article::
  :order: 20
  

プロパティ
=================

コンテンツには、自由にプロパティを設定できます。プロパティの設定方法は、reStructuredText・Markdownなどの、ドキュメント形式によって異なります。


.. target:: standardprofs


標準プロパティ
----------------

標準プロパティとして、すべてのコンテンツに以下の値が設定されています。

abstract_length
  インデックスファイルやRSSの摘要として使用するテキストの長さを、文字数で指定します。長さとして ``0`` を指定すると、本文すべてを摘要とします。未指定の場合は、``500`` 文字となります。

cagegory
  コンテンツのカテゴリを指定します。未指定の場合は ``''`` となります。

charset
  生成されるHTMLの ``charset`` を指定します。未指定の場合は ``'utf-8'`` となります。

date
  コンテンツの作成日を指定します。

  e.g.

  - ``2017/01/01``

  - ``2017/01/01 12:00:00``

  - ``2017/01/01 12:00:00 +0900``

.. target:: prop_imports

imports
   Jinja2のモジュールとして import するテンプレートを、``,`` 区切りで指定します。指定したモジュールは、:jinja:`{{ content.link_to('./article.rst', fragment='import_templ') }}` として使用できます。

   e.g.

   ``macro1.html, other.package!macro2.html``

lang
  生成されるHTMLの ``lang`` を指定します。未指定の場合は ``'en'``  となります。


site_title
  サイトのタイトルを指定します。未指定の場合は ``'(FIXME-site_title)``  となります。

site_url
  コンテンツの親となるURLを指定します。 e.g. ``https://www.example.com/my-site``

  未指定の場合は ``'http://localhost:8888'``  となります。

tags
  コンテンツのタグを、``,`` で区切って指定します。未指定の場合は ``''`` となります。

timezone
  コンテンツの作成日などを表示するタイムゾーンを指定します。e.g. ``'Europe/Warsaw'``, ``'Asia/Tokyo'``

  未指定の場合は、プラットフォームから取得したタイムゾーンとなります。

title
  コンテンツのタイトルを指定します。未指定の場合は ``''`` となります。

url
  アーティクルのURLを取得します。

