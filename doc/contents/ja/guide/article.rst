
.. article::
  :order: 30
  

アーティクル
======================

``contents`` ディレクトリの reStructuredTextファイル/Markdownファイル/HTMLファイルは、**アーティクルオブジェクト** として読み込まれます。アーティクルオブジェクトはJinja2テンプレートを適用し、``outputs`` ディレクトリにHTMLファイルを出力します。


.. target:: propsofarticle 

アーティクルのプロパティ
-----------------------------------

アーティクルオブジェクトは、:jinja:`{{ content.link_to('./property.rst', fragment='standardprofs') }}` に加え、以下のプロパティを指定できます。


abstract
  HTMLに変換したアーティクルを、 ``abstract_length`` プロパティで指定した文字数分取得します。``abstract_length`` が ``0`` の場合、全文を返します。

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
  出力HTMLファイルのファイル名を、Jina2テンプレートで指定します。未指定の場合は、``'{{ content.stem }}.{{ content.ext }}'`` となります。テンプレートでは、 :jinja:`{{ content.link(fragment='jinja_vars') }}` を参照できます。

header
  アーティクルのヘッダ要素のリストを取得します。リストの要素は、(ヘッダのid, ヘッダ要素名, ヘッダテキスト) のタプルです。

html
  ページの内容をHTMLで取得します。

order
  アーティクルの順序を数値で指定します。

stem
  アーティクルの出力ファイル名(拡張子以外)。未指定の場合は、アーティクルソースファイルのファイル名(拡張子以外)となります。



reStructuredText
----------------------------

拡張子が ``.rst`` のファイルは、 `reStructuredTextパーザ <http://docutils.sourceforge.net/>`_ でHTMLに変換されます。

.. code-block:: rst
   :caption: Sample of article in reStructuredText:


   Title of the article
   ------------------------------

   My first article in reStructuredText.


この例のように、文書の先頭にヘッダが記述されていれば、そのヘッダが文書の `title` プロパティとなります。`title` プロパティは、``article`` ディレクティブでも指定できます。

Miyadaikuは、rst用の `ディレクティブ <http://docutils.sourceforge.net/docs/ref/rst/directives.html>`_ と `ロール <http://docutils.sourceforge.net/docs/ref/rst/roles.html>`_ を提供しており、文書のプロパティ設定、Jinja2テンプレートの埋め込みなどを行えます。

articleディレクティブ
+++++++++++++++++++++++

articleディレクティブは、アーティクルのプロパティを指定します。

.. code-block:: rst
   :caption: Article directive in reStructuredText:

   .. article::
      :date: 2017-01-01
      :title: 文書のタイトル
      :category: カテゴリ1
      :tags: タグ1, タグ2


   Sample of article directive
   -----------------------------------

   This is a miyadaiku article in reST.


この例では、文書のプロパティとして ``date``、``title``、``category``、``tags`` を指定しています。

プロパティとして、任意の項目を指定できます。プロパティ設定については、:jinja:`<a href="#propsofarticle">アーティクルのプロパティ</a>` を参照してください。



jinjaディレクティブ
++++++++++++++++++++++++++++++++++++++++++++++

``jinja`` ディレクティブに記述した内容は、Jinja2テンプレートエンジンによってHTMLに変換されます。テンプレートでは、 :jinja:`{{ content.link(fragment='jinja_vars') }}` を参照できます。


.. code-block:: rst
   :caption: Sample of Jinja directive in reST:

   Properties of this document

   -----------------------------------

   .. jinja::

      <ul>
        <li> Category is {{ content.category }} </li>
        <li> Tags are {{ ', '.join(content.tags) }} </li>
        <li> Date is {{ content.date.strftime('%Y-%m-%d') }} </li>
      </ul>




jinjaロール
++++++++++++++++++++++++++++++++++++++++++++++

``:jinja:`` ロールで指定した文字列は、Jinja2テンプレートエンジンによってHTMLに変換されます。テンプレートでは、 :jinja:`{{ content.link(fragment='jinja_vars') }}` を参照できます。


.. code-block:: rst
   :caption: Sample of Jinja role in reST:

   Link test
   -------------

   Link to :jinja:`{{ content.link_to("./hello.rst") }}`.




code-blockディレクティブ
+++++++++++++++++++++++++++++


プログラムのソースコードなどは、``code-block`` ディレクティブで記述します。``.. code-block:: lang`` のように言語を指定すると、`Pygments <http://pygments.org/>`_ による構文ハイライトが行われます。

.. code-block:: rst
   :caption: Sample of code-block directive:

   .. code-block:: python
      :caption: sample python code
      
      def test():
         pass


targetディレクティブ
+++++++++++++++++++++++

HTMLに ``<div>`` 要素を埋め込み、リンクのターゲットとして指定できるようにします。``<div>`` 要素の ``id`` として、ディレクティブの引数を指定します。

.. code-block:: rst
   :caption: Sample of target role:

   .. target:: id_of_this_section1

   Section I
   -------------------

   Body of section I.

   Section II
   ------------------

   Link to :jinja:`content.link_to(content, fragment='id_of_this_section1')`.



Markdown
----------------------------

拡張子が ``.md`` のファイルは、 `Markdownモジュール <https://pypi.python.org/pypi/Markdown>`_ でHTMLに変換されます。

デフォルトでは、Markdownモジュールの `Extra 拡張 <http://pythonhosted.org/Markdown/extensions/extra.html>`_ が有効になっています。

また、Miyadaikuは、Markdownモジュールを独自に拡張しており、文書プロパティの指定・Jinja2テンプレートの埋め込みなどを行えます。




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

Markdownでも、reStructuredTextと同様、*\:jinja:` Jinja2タグ `* の形式で、Jinja2テンプレートを指定できます。テンプレートでは、 :jinja:`{{ content.link(fragment='jinja_vars') }}` を参照できます。

.. code-block:: md
   :caption: Sample of Jinja role in Markdown:

   # Link test

   Link to :jinja:`{{ content.link_to("./hello.rst") }}`.



target
+++++++++++++++++++++++

*\:target:`id_of_div`* の形式で記述し、HTMLに ``<div>`` 要素を埋め込み、リンクのターゲットとして指定できるようにします。``<div>`` 要素の ``id`` として、``id_of_div`` を指定します。

.. code-block:: md
   :caption: Sample of target :

   :target:`id_of_this_section1`

   # Section I

   Body of section I.

   # Section II

   Link to :jinja:`content.link_to(content, fragment='id_of_this_section1')`.



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

HTMLファイルは、Jinja2テンプレートエンジンでHTMLに変換されます。HTMLファイル内では、Jinja2タグを使って
 :jinja:`{{ content.link(fragment='jinja_vars') }}` を参照できます。

.. code-block:: html
   :caption: Sample of Jinja template in HTML:

   <p>Link to <a href='{{ content.link_to("./hello.rst") }}'>hello</a></p>



.. target:: jinja_vars

テンプレート変数
-----------------------------------


アーティクルのJinjaテンプレートでは、次の変数を使用できます。

content
  現在のアーティクルの :jinja:`{{ content.link_to('./objects.rst', fragment='content_obj') }}` を参照します。

page
  アーティクルを呼び出しているコンテンツの :jinja:`{{ content.link_to('./objects.rst', fragment='content_obj') }}` を参照します。

contents
   プロジェクトの  :jinja:`{{ content.link_to('./objects.rst', fragment='contents_collection') }}`  を参照します。


content と page
-----------------------------------


Miyadaikuは、``contents`` ディレクトリを走査し、見つかったアーティクル中をJinja2テンプレートに渡し、HTMLを作成します。この時、アーティクルにあるJinja2テンプレートでは、変数 ``content`` と ``page`` はどちらもHTMLを作成しているアーティクルオブジェクト自身を参照します。

このアーティクルが、文章中で別のアーティクルを読み込んでいる場合、読み込まれているアーティクル内のJinja2テンプレートでは、読み込み元のアーティクルは変数 ``page``、読み込まれているアーティクル自身は 変数 ``content`` で参照できます。

例えば次のような2つのアーティクル ``parent.rst`` と ``child.rst`` がある場合

.. code-block:: jinja
   :caption: parent.rst:

   This is parent.rst

   page: {{ page.name }}
   content: {{ content.name }}

   ---

   {{ content.load('./child.rst').html }}


.. code-block:: jinja
   :caption: child.rst:

   This is child.rst

   page: {{ page.name }}
   content: {{ content.name }}


``parent.rst`` をHTMLに変換する際、 ``{{ content.load('./child.rst').html }}`` で ``child.rst`` が読み込まれます。

この時、``parent.rst`` 内では、 

- ``page`` は ``parent.rst`` オブジェクト
- ``content`` は ``parent.rst`` オブジェクト


``child.rst`` 内では、 

- ``page`` は ``parent.rst`` オブジェクト
- ``content`` は ``child.rst`` オブジェクト

となります。

.. target:: import_templ


インポート済みテンプレート
-----------------------------------

:jinja:`{{ content.link_to('./property.rst', fragment='prop_imports', text='importsプロパティ') }}` に指定したJinja2テンプレートは、自動的に `import <http://jinja.pocoo.org/docs/2.9/templates/#import>`_ されます。モジュール名は、パッケージ名の拡張子を除いたファイル名となります。

.. code-block:: rst
   :caption: Using Jinja2 macros:

   .. article::
      :imports: my_template.html

   my_template.html をインポートし、my_macroを呼び出す

   {{ my_template.my_macro() }}



