
.. article::
  :order: 20
  

プロパティ
=================

コンテンツには、自由にプロパティを設定できます。プロパティの設定方法は、reStructuredText・Markdownなどの、ドキュメント形式によって異なります。コンテンツのプロパティは、:jinja:`{{ content.link_to('./config.rst', fragment='external_prop_file') }}` でも指定できます。



.. target:: standardprofs


標準プロパティ
----------------

標準プロパティとして、すべてのコンテンツに以下の値が設定されています。

abstract
  HTMLに変換したアーティクルを、 ``abstract_length`` プロパティで指定した文字数分取得します。``abstract_length`` が ``0`` の場合、全文を返します。


abstract_length
  インデックスファイルやRSSの摘要として使用するテキストの長さを、文字数で指定します。長さとして ``0`` を指定すると、本文すべてを摘要とします。未指定の場合は、``500`` 文字となります。

article_template
  アーティクルのHTMLページを生成するJinja2テンプレートの名前を指定します。未指定の場合は、``page_article.html`` となります。

cagegory
  コンテンツのカテゴリを指定します。未指定の場合は ``''`` となります。

canonical_url
  コンテンツへの、公式なURLを指定します。

  e.g.

  - ``http://www.example.com/a/b/c``

  - ``/index.html``

  - ``/``

  - ``anothername.html``


charset
  生成されるHTMLの ``charset`` を指定します。未指定の場合は ``'utf-8'`` となります。

date
  コンテンツの作成日を指定します。

  e.g.

  - ``2017/01/01``

  - ``2017/01/01 12:00:00``

  - ``2017/01/01 12:00:00 +0900``

draft
  未公開状態のアーティクルは ``true``、公開中のアーティクルは ``false`` を指定します。未指定の場合は ``false`` となります。

ext
  アーティクルの出力ファイル名の拡張子を指定します。未指定の場合は、``'.html'`` となります。

filename
  出力ファイル名を指定します。未指定の場合は、``filename_templ`` プロパティでファイル名を生成します。

  ``filename`` には、相対ディレクトリ名も指定できます。ex) ``subdir/article1.html``,  ``../subdir/article1.html``

filename_templ
  出力HTMLファイルのファイル名を、Jina2テンプレートで指定します。未指定の場合は、``'{{ content.stem }}.{{ content.ext }}'`` となります。テンプレートでは、 :jinja:`{{ content.link_to('./article.rst', fragment='jinja_vars') }}` を参照できます。

generate_metadata_file
   ``true`` の場合は、アーティクルに ``date`` プロパティが指定されていなければ自動的に :jinja:`{{ content.link_to('config.rst', fragment='external_prop_file') }}` を生成します。未指定の場合は ``false`` となります。

header
  アーティクルのヘッダ要素のリストを取得します。リストの要素は、`(ヘッダのid, ヘッダ要素名, ヘッダテキスト)` のタプルとなります。

html
  ページの内容をHTMLで取得します。


.. target:: prop_imports

imports
   Jinja2のモジュールとして import するテンプレートを、``,`` 区切りで指定します。指定したモジュールは、:jinja:`{{ content.link_to('./article.rst', fragment='import_templ') }}` として使用できます。

   e.g.

     ``macro1.html, other.package!macro2.html``

lang
  生成されるHTMLの ``lang`` を指定します。未指定の場合は ``'en'``  となります。

order
  アーティクルの順序を数値で指定します。

site_title
  サイトのタイトルを指定します。未指定の場合は ``'(FIXME-site_title)``  となります。

site_url
  コンテンツの親となるURLを指定します。 e.g. ``https://www.example.com/my-site``

  未指定の場合は ``'http://localhost:8888'``  となります。

stem
  アーティクルの出力ファイル名(拡張子以外)を指定します。未指定の場合は、アーティクルソースファイルのファイル名(拡張子以外)となります。

tags
  コンテンツのタグを、``,`` で区切って指定します。未指定の場合は ``''`` となります。

timezone
  コンテンツの作成日などを表示するタイムゾーンを指定します。e.g. ``'Europe/Warsaw'``, ``'Asia/Tokyo'``

  未指定の場合は、プラットフォームから取得したタイムゾーンとなります。

title
  コンテンツのタイトルを指定します。未指定の場合は ``''`` となります。

url
  アーティクルのURLを指定します。未指定の場合は、``site_url`` + ``コンテンツのパス`` となります。





