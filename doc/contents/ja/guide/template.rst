
.. article::
  :order: 90
  

テンプレート
======================

Miyadaikuは、``contents`` ディレクトリを走査し、アーティクルやインデックスなどのコンテンツをJinja2テンプレートに渡してHTMLを作成します。テンプレートは、プロジェクトディレクトリの ``templates`` ディレクトリに作成します。

アーティクルテンプレート
------------------------------

アーティクルに適用するテンプレートは、``article_template`` プロパティで指定します。未指定の場合は、``'page_article.html'`` となります。

テンプレート変数
+++++++++++++++++++++

テンプレート内では、次の変数を参照できます。

page
   処理対象となるアーティクルの :jinja:`{{ content.link_to('./objects.rst', fragment='content_obj') }}` を参照します。通常、アーティクルテンプレートでは、``page`` 変数の ``html`` プロパティからHTMLを取得して表示します。

contents
   プロジェクトの :jinja:`{{ content.link_to('./objects.rst', fragment='contents_collection') }}` を参照します。


.. code-block:: jinja
   :caption: Sample of article template:

   <!DOCTYPE html>
   <html lang="{{ page.lang }}">
   <head>
     <meta charset="{{ page.charset }}">
     <title>{{ page.title }}/{{ page.site_title }}</title>
   </head>

   <body>
     {{ page.html }}
   </body>
   </html>



インデックステンプレート
------------------------------


アーティクルの一覧を出力するインデックスの場合、生成されるHTMLファイルは複数ページとなる場合があり、1ページ目と2ページ目以降でそれぞれ別のテンプレートを指定できます。

1ページ目のテンプレートは ``indexpage_template`` プロパティで指定します。未指定の場合は、``'page_index.html'`` となります。2ページ目以降は ``indexpage_template2`` プロパティで指定し、未指定の場合は、``'page_index.html'`` となります。

テンプレート変数
+++++++++++++++++++++

テンプレート内では、次の変数を参照できます。

page
   処理対象となるインデックスの :jinja:`{{ content.link_to('./objects.rst', fragment='content_obj') }}` を参照します。

contents
   プロジェクトの :jinja:`{{ content.link_to('./objects.rst', fragment='contents_collection') }}` を参照します。

cur_page
   ページ番号を指定します。

is_last
   最後のページなら ``True``、そうでなければ ``False`` となります。

articles
   インデックスの表示対象となる :jinja:`{{ content.link_to('./objects.rst', fragment='content_obj') }}` のリストを参照します。


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
         <h2><a href="{{article.path(article)}}">{{ article.title }}</a></h2>
         <div>{{ article.abstract }}</div>
       {% endfor %}
     </div>
   
     <hr>
     <div>
       {% if cur_page != 1 %}
         <a href="{{content.path(values=group_names, npage=cur_page-1)}}">Prev page</a>
       {% endif %}
       {% if not is_last %}
         <a href="{{content.path(values=group_names, npage=cur_page+1)}}">Next page</a>
       {% endif %}
     </div>
   </body>
   </html>


.. target:: template_names

テンプレート名の解決
---------------------------------------

アーティクルに指定されたテンプレート名や、Jinja2の ``extends`` 文や ``import`` 文で、テンプレート名を指定してテンプレートを利用するとき、Miyadaikuでは以下の順にテンプレートを検索します。

1. プロジェクトの ``templates`` ディレクトリ

2. テーマとして指定されたパッケージの、``templates`` ディレクトリ。複数のテーマが指定された場合は、指定された順番に検索します。


ただし、 テンプレート名に ``!`` が含まれていたら、上記の検索は行わず、``!`` の左側をパッケージ名とし、そのパッケージの ``templates`` ディレクトリを検索します。

e.g. ``miyadaiku.themes.sample.blog!test.html`` というテンプレート名なら、``miyadaiku.themes.sample.blog`` パッケージの、``templates/test.html`` を取得します。






