
.. article::
  :order: 115
  

組み込みテーマ
======================

Miyadaiku には、デフォルトで次のテーマが組み込まれています

- :jinja:`{{content.link_to(content, fragment='miyadaiu_themes_base')}}`
- :jinja:`{{content.link_to(content, fragment='docutils_html5')}}`
- :jinja:`{{content.link_to(content, fragment='ipynb')}}`
- :jinja:`{{content.link_to(content, fragment='pygments')}}`
- :jinja:`{{content.link_to(content, fragment='sample_blog')}}`

.. target:: miyadaiu_themes_base

miyadaiku.themes.base
---------------------------

``miyadaiku.themes.base`` は、デフォルトで使用されるHTMLテンプレートを提供するテーマで、プロジェクトの ``config.py`` でテーマとして指定しなくとも、常に使用されます。

テンプレート
~~~~~~~~~~~~~~~~~~~

次のテンプレートを提供します。

page_article.html
    :jinja:`{{ page.link_to("article.rst") }}` のデフォルトJinja2 テンプレートです。

    ソースファイル: `page_article.html <https://github.com/miyadaiku/miyadaiku/blob/master/miyadaiku/themes/base/templates/page_article.html>`_ 

page_index.html
    :jinja:`{{ page.link_to("index.rst") }}` のデフォルトJinja2 テンプレートです。

    ソースファイル: `page_index.html <https://github.com/miyadaiku/miyadaiku/blob/master/miyadaiku/themes/base/templates/page_index.html>`_

マクロ
~~~~~~~~~~~~~~~~~~~

``macro`` という名前のモジュールを定義し、以下のマクロを提供します。

macro.image(src, alt=None, _class=None, style=None, width=None, height=None, link=None, link_class=None)
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

``<img>`` 要素を出力します。

``src``
  画像オブジェクトを指定します。

``alt``
  ``img`` 要素の ``alt`` 属性を指定します。

``_class``
  ``img`` 要素の ``class`` 属性を指定します。

``style``
  ``img`` 要素の ``style`` 属性を指定します。

``width``
  ``img`` 要素の ``width`` 属性を指定します。

``height``
  ``img`` 要素の ``height`` 属性を指定します。

``link``
  リンク先のURLを指定した場合、``a`` 要素を作成して ``img`` の親要素とします。

``link_class``
  ``a`` 要素の ``class`` 属性を指定します。


例

   .. code-block:: rst

      リンク付き画像ファイル: :jinja:`{{ macro.image(page.load('/img/img.png'), link='http://example.com') }}`


macro.google_analytics()
+++++++++++++++++++++++++++++++++++++

Google Analytics のタグを出力します。トラッキングIDは、プロジェクトプロパティの ``ga_tracking_id`` を使用します。


例
   .. code-block:: jinja
      :caption: page_article.html:

      {% block head %}
        {{ super() }}
        {{ macro.google_analytics() }}
      {% endblock head %}



macro.opengraph(page)
+++++++++++++++++++++++++++++++++++++

``page`` で指定したアーティクルの情報から、次のメタデータを出力します。


プロパティ:

  - og:url
  - og:locale
  - og:type
  - og:title
  - og:description
  - description
  - og:image
  - article:published_time

例
   .. code-block:: jinja
      :caption: page_article.html:

      {% block head %}
        {{ super() }}
        {{ macro.opengraph(page) }}
      {% block head %}


.. target:: docutils_html5

miyadaiku.themes.docutils_html5
--------------------------------------------

Docutilsの `html5_polyglot writer <http://docutils.sourceforge.net/docs/user/html.html#html5-polyglot>`_ 用 CSSファイルを提供します。

使い方
~~~~~~~~~~~~~~~~~~~

1. ``config.yml`` ファイルの ``themes`` に、``miyadaiku.themes.docutils_html5`` を追加します。

   .. code-block:: yaml
      :caption: config.yml:

      themes:
        - miyadaiku.themes.docutils_html5

2. テンプレートの ``head`` 要素で、``docutils_html5`` モジュールの ``load_css(page)`` を呼び出し、CSSファイルを指定する ``link`` 要素を出力します。

   .. code-block:: jinja   
      :caption: page_article.html:

      {% block head %}
        {{ super() }}
        {{ docutils_html5.load_css(page) }}
      {% endblock head %}


.. target:: ipynb

miyadaiku.themes.ipynb
--------------------------------------------


`Jupyter Notebook <http://jupyter.org/>`_ 用のCSSファイルを提供します。


サンプル
    https://github.com/miyadaiku/miyadaiku-docs/tree/master/samples/ipynb

使い方
~~~~~~~~~~~~~~~~~~~

1. ``config.yml`` ファイルの ``themes`` に、``miyadaiku.themes.ipynb`` を追加します。

   .. code-block:: yaml
      :caption: config.yml:

      themes:
        - miyadaiku.themes.ipynb

2. テンプレートの ``head`` 要素で、``ipynb`` モジュールの ``load_css(page)`` を呼び出し、CSSファイルを指定する ``link`` 要素を出力します。

   .. code-block:: jinja   
      :caption: page_article.html:

      {% block head %}
        {{ super() }}
        {{ ipynb.load_css(page) }}
      {% endblock head %}



  
.. target:: pygments

miyadaiku.themes.pygments
--------------------------------------------

`Pygments <http://pygments.org/>`_ の組み込みスタイル用のCSSファイルを提供します。次のCSSファイルを指定できます。

- pygments_abap.css
- pygments_algol.css
- pygments_algol_nu.css
- pygments_arduino.css
- pygments_autumn.css
- pygments_borland.css
- pygments_bw.css
- pygments_colorful.css
- pygments_default.css
- pygments_emacs.css
- pygments_friendly.css
- pygments_fruity.css
- pygments_igor.css
- pygments_lovelace.css
- pygments_manni.css
- pygments_monokai.css
- pygments_murphy.css
- pygments_native.css
- pygments_paraiso.css
- pygments_pastie.css
- pygments_perldoc.css
- pygments_rainbow_dash.css
- pygments_rrt.css
- pygments_tango.css
- pygments_trac.css
- pygments_vim.css
- pygments_vs.css
- pygments_xcode.css

使い方
~~~~~~~~~~~~~~~~~~~

1. ``config.yml`` ファイルの ``themes`` に、``miyadaiku.themes.pygments`` を追加します。

   .. code-block:: yaml
      :caption: config.yml:

      themes:
        - miyadaiku.themes.pygments

2. ``config.yml`` ファイルの ``pygments_css`` に、使用するCSSファイル名を指定します。指定しない場合は、``pygments_native.css`` を使用します。

   .. code-block:: yaml
      :caption: config.yml:

      pygments_css: pygments_native.css


2. テンプレートの ``head`` 要素で、``pygments`` モジュールの ``load_css(page)`` を呼び出し、CSSファイルを指定する ``link`` 要素を出力します。

   .. code-block:: jinja   
      :caption: page_article.html:

      {% block head %}
        {{ super() }}
        {{ pygments.load_css(page) }}
      {% endblock head %}



.. target:: sample_blog

miyadaiku.themes.sample.blog
--------------------------------------------

ブログサイトのサンプルテーマです。使い方は、:jinja:`{{ page.link_to('../tutorial/tutorial_blog.rst')  }}` を参照してください。
