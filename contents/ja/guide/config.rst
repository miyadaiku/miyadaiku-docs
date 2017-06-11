
.. article::
  :order: 2
  

コンフィグ
======================

アーティクルやインデックスなどのプロパティのデフォルト値は、ルートディレクトリの ``config.yml`` ファイルで指定します。

また、``contents`` ディレクトリ内のサブディレクトリごとに、``config`` タイプのYAMLファイルで、辞書として指定します。

.. code-block:: md
   :caption: contents/dir1/config.yml

   type: config   # YAMLファイルのタイプを config に指定
   lang: ja       # lang のデフォルト値を ja に設定


.. code-block:: md
   :caption: contents/dir1/dir2/config.yml

   type: config   # YAMLファイルのタイプを config に指定
   category: tutorial # categoryのデフォルト値を tutorial に設定


上のように2つの ``config`` ファイルを指定した場合、 ``dir1`` と ``dir2`` ディレクトリ の ``lang`` プロパティのデフォルト値は ``ja`` となります。また、``dir2`` ディレクトリの ``category`` プロパティのデフォルト値は ``tutorial`` となります。


.. jinja::

   <a id='standardprofs' class='header_anchor'></a>

標準プロパティ
-------------------------

abstract_length
  インデックスファイルやRSSの摘要として使用するテキストの長さを、文字数で指定します。長さとして ``0`` を指定すると、本文すべてを摘要とします。未指定の場合は、``500`` 文字となります。

cagegory
  コンテンツのカテゴリを指定します。


charset
  生成されるHTMLの ``charset`` を指定します。未指定の場合は ``'utf-8'`` となります。

date
  コンテンツの作成日を指定します。

  e.g.

  - ``2017/01/01``

  - ``2017/01/01 12:00:00``

  - ``2017/01/01 12:00:00 +0900``

lang
  生成されるHTMLの ``lang`` を指定します。未指定の場合は ``'en'``  となります。


site_title
  値: ``'(FIXME-site_title)'``

  サイトのタイトルを指定します。未指定の場合は ``'(FIXME-site_title)``  となります。

site_url
  値: ``'http://localhost:8888'``

  コンテンツの親となるURLを指定します。 e.g. ``https://www.example.com/my-site``

  未指定の場合は ``'http://localhost:8888'``  となります。

tags
  コンテンツのタグを、``,`` で区切って指定します。

timezone
  コンテンツの作成日などを表示するタイムゾーンを指定します。e.g. ``'Europe/Warsaw'``, ``'Asia/Tokyo'``

  未指定の場合は、プラットフォームから取得したタイムゾーンとなります。

title:
  コンテンツのタイトルを指定します。











feed_num_articles:
  値: ``10``

  フィードに含まれるアーティクルの数を指定します。


feed_type:
  値: ``'atom'``

  フィードの種類を、``atom`` または ``rss`` で指定します。未指定の場合は ``'atom'`` となります。


