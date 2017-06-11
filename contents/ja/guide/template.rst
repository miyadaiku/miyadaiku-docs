
.. article::
  :order: 7
  

テンプレート
======================

``contents`` ディレクトリのアーティクルやインデックスは、Jinjaテンプレートを適用して最終的なHTMLファイルを出力します。

アーティクルテンプレート
------------------------------

アーティクルに適用するテンプレートは、``article_template`` プロパティで指定します。未指定の場合は、``'page_article.html'`` となります。


.. code-block:: jinja
   :caption: Sample of article template:

   <!DOCTYPE html>
   <html lang="{{ page.lang }}">
   <head>
     <meta charset="{{ page.charset }}">
     <title>{{ page.title }}/{{ page.site_title }}</title>
   </head>

   <body>
     {{page.html}}
   </body>
   </html>



.. jinja::

   <a id='content_vars' class='header_anchor'></a>


テンプレート変数
++++++++++++++++++++++++

アーティクルテンプレートでは、次の変数を使用できます。

page オブジェクト
~~~~~~~~~~~~~~~~~~~~

``page`` オブジェクトは、現在テンプレートでHTMLページを作成しているコンテントオブジェクトで、アーティクルなどのコンテントに設定された :jinja:`{{ page.link_to('./article.rst', text='プロパティ', fragment='propsofarticle') }}` と、次のプロパティ/メソッドを使用できます。


html
  HTMLに変換したアーティクル全文を返します

url
  アーティクルのURL

get_content(target)
  ``target`` で指定したパスのコンテンツオブジェクトを取得します。``target`` には相対パスまたは絶対パスを指定できます。

path_to(target):
  ``target`` で指定したパスのコンテンツオブジェクトへのリンクファイル名を取得します。``target`` には相対パスまたは絶対パスを指定できます。

link_to(target, text=None, fragment=None):
  ``target`` で指定したパスのコンテンツオブジェクトへのリンクする<a>要素を取得します。``target`` には相対パスまたは絶対パスを指定できます。

  ``text`` は、リンク文字列を指定します。省略時は、``target`` のタイトルとなります。

  ``fragment`` は、リンク先ページ内の要素idを指定します。



インデックステンプレート
------------------------------


アーティクルの一覧を出力するインデックスの場合、生成されるHTMLファイルは複数ページとなる場合があり、1ページ目と2ページ目以降でそれぞれ別のテンプレートを指定できます。1ページ目のテンプレートは ``indexpage_template`` プロパティで指定します。未指定の場合は、``''page_index.html'`` となります。2ページ目以降は ``indexpage_template2`` プロパティで指定し、未指定の場合は、``''page_index.html'`` となります。


.. code-block:: jinja
   :caption: Sample of index template:

   <!DOCTYPE html>
   <html lang="{{ page.lang }}">
   <head>
     <meta charset="{{ page.charset }}">
     <title>{{ page.site_title }}</title>
   </head>

   <body>
     <h1>
       {{ page.site_title }}
     </h1>
   
     <div>
       {% for article in articles %}
         <h2><a href="{{page.path_to(article)}}">{{ article.title }}</a></h2>
         <div>{{ article.abstract }}</div>
       {% endfor %}
     </div>
   
     <hr>
     <div>
       {% if cur_page != 1 %}
         <a href="{{page.path_to_indexpage(group_names, cur_page-1)}}">Prev page</a>
       {% endif %}
       {% if not is_last %}
         <a href="{{page.path_to_indexpage(group_names, cur_page+1)}}">Next page</a>
       {% endif %}
     </div>
   </body>
   </html>

   
テンプレート変数
++++++++++++++++++++++++

インデックステンプレートでは、:jinja:`{{ page.link_to(page, text='アーティクルテンプレートの変数', fragment='content_vars') }}` に加え、以下の変数を使用できます。


cur_page
   ページ番号を指定します。

is_last
   最後のページなら ``True``、そうでなければ ``False`` となります。

articles
   表示対象のアーティクルのリストを返します。


テンプレート名の解決
---------------------------------------

Jinjaでは、``extends`` 文や ``import`` 文で、テンプレート名を指定して外部のテンプレートを再利用する仕組みがあります。Miyadaikuでは、``extends`` 文などでテンプレート名が指定された時、以下の順にテンプレートを検索します。

1. プロジェクトの ``templates`` ディレクトリ

2. テーマとして指定されたパッケージの、``templates`` ディレクトリ。複数のテーマが指定された場合は、指定された順番に検索します。


ただし、 テンプレート名に ``!`` が含まれていたら、上記の検索は行わず、``!`` の左側をパッケージ名とし、そのパッケージの ``templates`` ディレクトリを検索します。

e.g. ``miyadaiku.themes.sample.blog!test.html`` というテンプレート名なら、``miyadaiku.themes.sample.blog`` パッケージの、``templates/test.html`` を取得します。


