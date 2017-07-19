
.. article::
  :order: 3
  

アーティクル
======================

``contents`` ディレクトリの reStructuredTextファイルや Markdownファイルは、**アーティクルオブジェクト** として読み込まれます。アーティクルオブジェクトはJinja2テンプレートを適用し、``outputs`` ディレクトリにHTMLファイルを出力します。

reStructuredText
----------------------------

拡張子が ``.rst`` のファイルは、 `reStructuredTextパーザ <http://docutils.sourceforge.net/>`_ でHTMLに変換されます。

reStructuredTextファイルの場合、文書の先頭にヘッダが記述されていれば文書の `title` プロパティとなります。タイトルが指定されていない場合、ファイル名がタイトルとなります。


Miyadaikuは、専用の `ディレクティブ <http://docutils.sourceforge.net/docs/ref/rst/directives.html>`_ と `ロール <http://docutils.sourceforge.net/docs/ref/rst/roles.html>`_ を提供しており、文書のプロパティ設定、Jinja2テンプレートの埋め込みなどを行えます。

articleディレクティブ
+++++++++++++++++++++++

articleディレクティブで、アーティクルのプロパティを指定します。

.. code-block:: rst
   :caption: Sample of article in reStructuredText:

   .. article::
      :date: 2017-01-01
      :category: カテゴリ1
      :tags: タグ1, タグ2


   Sample of article directive
   -----------------------------------

   This is a miyadaiku article in reST.


この例では、文書のプロパティとして ``date``、``category``、``tags`` を指定しています。

プロパティとして、任意の項目を指定できます。プロパティ設定については、:jinja:`<a href="#propsofarticle">アーティクルのプロパティ</a>` を参照してください。



jinjaテンプレート
++++++++++++++++++++++++++++++++++++++++++++++

``jinja`` ディレクティブと ``jinja`` ロールを使って、reST中にJinja2テンプレートを記述できます。


jinjaディレクティブ
################################

``jinja`` ディレクティブで指定した文字列は、Jinja2テンプレートとして評価され、結果はHTMLに出力されます。


.. code-block:: rst
   :caption: Sample of Jinja role in reST:

   Properties of this document
   -----------------------------------

   Category is :jinja:`{{ content.category }}`

   Tags are :jinja:`{{ ', '.join(content.tags) }}`

   Date is :jinja:`{{ content.date.strftime('%Y-%m-%d') }}`




jinjaロール
################################

``:jinja:`` ロールで指定した文字列は、Jinja2テンプレートとして評価され、結果はHTMLとして埋め込まれます。

.. code-block:: rst
   :caption: Sample of Jinja role in reST:

   Link test
   -------------

   Link to :jinja:`{{ page.link_to("./hello.rst") }}`.



.. jinja::

   <a id='jinja_vars' class='header_anchor'></a>

テンプレート変数
################################


Jinjaテンプレート内では、次の変数を使用できます。

content
  アーティクルオブジェクト自身を参照します。

page
  アーティクルを呼び出しているコンテンツオブジェクトを参照します。


``content`` と ``page`` はどちらもコンテンツオブジェクトです。コンテンツオブジェクトの詳細は、:jinja:`{{ page.link_to('template.rst', text='テンプレートのコンテンツ変数', fragment='content_vars') }}` を参照してください。


例えば、次のような2つのアーティクル ``parent.rst`` と ``child.rst`` があった場合

.. code-block:: parent.rst

   This is parent.rst

   page: {{ page.name }}
   content: {{ content.name }}

   ---

   {{ page.load('./child.rst').html }}


.. code-block:: child.rst

   This is child.rst

   page: {{ page.name }}
   content: {{ content.name }}


``parent.rst`` の 

   ``{{ page.load('./child.rst').html }}``

で ``child.rst`` を読み込んでHTMLを生成しますが、この時、``child.rst`` の ``page`` は ``parent.rst`` オブジェクト、``content`` は ``child.rst`` オブジェクトとなります。



code-blockディレクティブ
+++++++++++++++++++++++++++++


プログラムのソースコードなどは、``code-block`` ディレクティブで記述します。``.. code-block:: lang`` のように言語を指定すると、`Pygments <http://pygments.org/>`_ による構文ハイライトが行われます。

.. code-block:: rst
   :caption: Sample of code-block directive:

   .. code-block:: python
      :caption: sample python code
      
      def test():
         pass



Markdown
----------------------------

拡張子が ``.md`` のファイルは、 `Markdownモジュール <https://pypi.python.org/pypi/Markdown>`_ でHTMLに変換されます。

デフォルトでは、Markdownモジュールの `Extra 拡張 <http://pythonhosted.org/Markdown/extensions/extra.html>`_ が有効になっています。

また、Miyadaikuは、Markdownモジュールを独自に拡張ており、文書プロパティの指定・Jinja2テンプレートの埋め込みなどを行えます。




プロパティ
+++++++++++++++++++++++

文書ファイルの先頭に、プロパティ名とプロパティ値を指定できます。


.. code-block:: md
   :caption: Sample of document properties in Markdown:

   date: 2017-01-01
   title: 文書タイトル
   category: カテゴリ1
   tags: タグ1, タグ2

   # Miyadaiku article

   This is a Miyadaiku article in Markdown.
  



プロパティ値は各行に一つづつ、プロパティ名と値を ``:`` で区切って指定します。

プロパティとして、任意の項目を指定できます。プロパティ設定については、:jinja:`<a href="#propsofarticle">アーティクルのプロパティ</a>` を参照してください。




Jinja2テンプレート
++++++++++++++++++++++++++

Markdownでも、reStructuredTextと同様、*\:jinja:` Jinja2タグ `* の形式で、Jinja2テンプレートを指定できます。

.. code-block:: md
   :caption: Sample of Jinja role in Markdown:

   # Link test

   Link to :jinja:`{{ page.link_to("./hello.rst") }}`.



Jinja2テンプレートでは、 :jinja:`{{ page.link_to(content, text='テンプレート変数', fragment='jinja_vars') }}` を参照できます。




HTML
----------------------------

拡張子が ``.html`` のファイルは、文書の先頭に文書プロパティを指定したHTMLファイルとして読み込み、Jinja2テンプレートエンジンでHTMLとして出力します。


プロパティ
+++++++++++++++++++++++

文書ファイルの先頭に、プロパティ名とプロパティ値を指定できます。


.. code-block:: html
   :caption: Sample of document properties in HTML:

   date: 2017-01-01
   title: 文書タイトル
   category: カテゴリ1
   tags: タグ1, タグ2

   <p>This is a HTML file</p>



プロパティ値は各行に一つづつ、プロパティ名と値を ``:`` で区切って指定します。

プロパティとして、任意の項目を指定できます。プロパティ設定については、:jinja:`<a href="#propsofarticle">アーティクルのプロパティ</a>` を参照してください。



Jinja2テンプレート
++++++++++++++++++++++++++

HTMLファイルは、Jinja2テンプレートエンジンでHTMLに変換されます。特別な記法なしで、Jinja2タグを使用できます。

.. code-block:: html
   :caption: Sample of Jinja template in HTML:

   <p>Link to <a href='{{ page.link_to("./hello.rst") }}'>hello</a></p>



Jinja2テンプレートでは、 :jinja:`{{ page.link_to(content, text='テンプレート変数', fragment='jinja_vars') }}` を参照できます。



:jinja:`<a class="header_anchor" id="propsofarticle"></a>`



アーティクルのプロパティ
-----------------------------------

アーティクルオブジェクトは、:jinja:`{{ page.link_to('./config.rst', text='標準プロパティ', fragment='standardprofs') }}` に加え、以下のプロパティを指定できます。


article_template
  アーティクルのHTMLページを生成するJinja2テンプレートの名前を指定します。未指定の場合は、``page_article.html`` となります。

draft
  未公開状態のアーティクルは ``true``、公開中のアーティクルは ``false`` を指定します。未指定の場合は ``false`` となります。

ext
  アーティクルの出力ファイル名の拡張子。未指定の場合は、``'.html'`` となります。

filename
  出力ファイル名を指定します。未指定の場合は、アーティクルのファイル名の拡張子を ``.html`` としたファイルを作成します。

  ``filename`` には、相対ディレクトリ名も指定できます。ex) ``subdir/article1.html``,  ``../subdir/article1.html``

filename_templ
  出力HTMLファイルのファイル名を、Jina2テンプレートで指定します。未指定の場合は、``'{{ page.stem }}.{{ page.ext }}'`` となります。

  テンプレートでは、 :jinja:`{{ page.link_to(content, text='テンプレート変数', fragment='jinja_vars') }}` を参照できます。


order
  アーティクルの順序を数値で指定します。

stem
  アーティクルの出力ファイル名(拡張子以外)。未指定の場合は、アーティクルソースファイルのファイル名(拡張子以外)となります。

