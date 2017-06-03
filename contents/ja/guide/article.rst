
.. article::
  :order: 2
  :tags: タグ1, タグ2
  

アーティクル
======================

``contents`` ディレクトリの ``reStructuredText`` ファイルや ``Markdown`` ファイルは、**アーティクル** として読み込まれ、Jinja2テンプレートを適用してHTMLファイルに変換します。

reStructuredText
----------------------------

拡張子が ``.rst`` のファイルは、 `reStructuredTextパーザ <http://docutils.sourceforge.net/>`_ でHTMLに変換されます。

reStructuredTextファイルの場合、文書の先頭にヘッダが記述されていれば文書の `title` プロパティとなります。タイトルが指定されていない場合、ファイル名がタイトルとなります。


Miyadaikuは、専用の `ディレクティブ <http://docutils.sourceforge.net/docs/ref/rst/directives.html>`_ と `ロール <http://docutils.sourceforge.net/docs/ref/rst/roles.html>`_ を提供しており、文書のプロパティ設定、Jinja2テンプレートの埋め込みなどを行えます。

articleディレクティブ
+++++++++++++++++++++++

articleディレクティブで、アーティクルのプロパティを指定します。

.. code-block:: rst

   .. article::
      :date: 2017-01-01
      :category: カテゴリ1
      :tags: タグ1, タグ2


   Sample of article directive
   -----------------------------------

   This is a miyadaiku article in reST.


この例では、文書のプロパティとして ``date``、``category``、``tags`` を指定しています。指定した値は、``jinja`` ロールを使って次のように参照できます。


.. code-block:: rst

   Properties of this document
   -----------------------------------

   Date is :jinja:`{{ content.date}}`

   Category is :jinja:`{{ content.category }}`

   Tags are :jinja:`{{ ', '.join(content.tags) }}`


プロパティとして、任意の項目を指定できます。標準のプロパティ設定については、`プロパティ設定` を参照してください。



jinjaロール
++++++++++++++

``:jinja:`` ロールで指定した文字列は、Jinja2テンプレートとして評価され、結果はHTMLとして埋め込まれます。

.. code-block:: rst

   Link test
   -------------

   Link to :jinja:`{{ page.link_to("./hello.rst") }}`.


``page`` などの、Jinja2テンプレートで参照できる変数については、`実行時変数` を参照してください。



Markdown
----------------------------

拡張子が ``.md`` のファイルは、 `Markdownモジュール <https://pypi.python.org/pypi/Markdown>`_ でHTMLに変換されます。

デフォルトでは、Markdownモジュールの `Extra 拡張 <http://pythonhosted.org/Markdown/extensions/extra.html>`_ が有効になっています。

また、Miyadaikuは、Markdownモジュールを独自に拡張し、文書プロパティの指定・Jinja2テンプレートの埋め込みなどを行えます。




文書プロパティ
+++++++++++++++++++++++

文書ファイルの先頭に、プロパティ名とプロパティ値を指定できます。


.. code-block:: md

   date: 2017-01-01
   title: 文書タイトル
   category: カテゴリ1
   tags: タグ1, タグ2

   # Title of Markdown article



プロパティ値は各行に一つづつ、プロパティ名と値を ``:`` で区切って指定します。

プロパティとして、任意の項目を指定できます。標準のプロパティ設定については、`プロパティ設定` を参照してください。



Jinja2テンプレート
++++++++++++++++++++++++++

Markdownでも、reStructuredTextと同様、``:jinja:` Jinja2タグ ``` の形式で、Jinja2テンプレートを指定できます。

.. code-block:: md

   # Link test

   Link to :jinja:`{{ page.link_to("./hello.rst") }}`.




``page`` などの、Jinja2テンプレートで参照できる変数については、`実行時変数` を参照してください。




HTML
----------------------------

拡張子が ``.html`` のファイルは、文書の先頭に文書プロパティを指定したHTMLファイルとして読み込み、Jinja2テンプレートエンジンでHTMLとして出力します。


文書プロパティ
+++++++++++++++++++++++

文書ファイルの先頭に、プロパティ名とプロパティ値を指定できます。


.. code-block:: html

   date: 2017-01-01
   title: 文書タイトル
   category: カテゴリ1
   tags: タグ1, タグ2

   <p>This is a HTML file</p>



プロパティ値は各行に一つづつ、プロパティ名と値を ``:`` で区切って指定します。

プロパティとして、任意の項目を指定できます。標準のプロパティ設定については、`プロパティ設定` を参照してください。



Jinja2テンプレート
++++++++++++++++++++++++++

HTMLファイルは、Jinja2テンプレートエンジンでHTMLに変換されます。特別な記法なしで、Jinja2タグを使用できます。

.. code-block:: html

   <p>Link to <a href='{{ page.link_to("./hello.rst") }}`'>hello</a></p>



``page`` などの、Jinja2テンプレートで参照できる変数については、`実行時変数` を参照してください。

