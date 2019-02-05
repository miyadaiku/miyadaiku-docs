
.. article::
  :order: 115
  

Built-in themes
======================

Miyadaiku provides following built-in themes.

- :jinja:`{{content.link_to(content, fragment='miyadaiu_themes_base')}}`
- :jinja:`{{content.link_to(content, fragment='docutils_html5')}}`
- :jinja:`{{content.link_to(content, fragment='ipynb')}}`
- :jinja:`{{content.link_to(content, fragment='pygments')}}`
- :jinja:`{{content.link_to(content, fragment='sample_blog')}}`

.. target:: miyadaiu_themes_base

miyadaiku.themes.base
---------------------------


``miyadaiku.themes.base`` provides default HTML templates for projects. This theme is always included to the project without explicit declaration in the ``config.yml`` file.

Templates
~~~~~~~~~~~~~~~~~~~

Following templates are provided.

page_article.html
    The default Jinaja2 template for :jinja:`{{ page.link_to("article.rst") }}`.

    Source file: `page_article.html <https://github.com/miyadaiku/miyadaiku/blob/master/miyadaiku/themes/base/templates/page_article.html>`_ 

page_index.html
    The default Jinaja2 template for :jinja:`{{ page.link_to("index.rst") }}`.

    Source file: `page_index.html <https://github.com/miyadaiku/miyadaiku/blob/master/miyadaiku/themes/base/templates/page_index.html>`_

Macro
~~~~~~~~~~~~~~~~~~~

The ``macro`` module is installed to the project. The ``macro`` provides following macros.


macro.image(src, alt=None, _class=None, style=None, width=None, height=None, link=None, link_class=None)
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Outputs ``<img>`` element.

``src``
  Specify image object.

``alt``
  Specify ``alt`` attribute of ``img`` element.

``_class``
  Specify ``class`` attribute of ``img`` element.

``style``
  Specify ``style`` attribute of ``img`` element.

``width``
  Specify ``width`` attribute of ``img`` element.

``height``
  Specify ``height`` attribute of ``img`` element.

``link``
  If specified, creates ``a`` elements surrounding ``img`` element. ``link`` specifies ``href`` attribute of the ``a`` element.

``link_class``
  Specify ``class`` attribute of ``a`` element.


Example

   .. code-block:: rst

      Image with a link: :jinja:`{{ macro.image(page.load('/img/img.png'), link='http://example.com') }}`


macro.google_analytics()
+++++++++++++++++++++++++++++++++++++

Outputs tags for Google Analytics. Tracking-id is specified as ``ga_tracking_id`` in the project property.


Example

   .. code-block:: jinja
      :caption: page_article.html:

      {% block head %}
        {{ super() }}
        {{ macro.google_analytics() }}
      {% endblock head %}



macro.opengraph(page)
+++++++++++++++++++++++++++++++++++++

Outputs following metadata from article specified in the ``page``.


Properties:

  - og:url
  - og:locale
  - og:type
  - og:title
  - og:description
  - description
  - og:image
  - article:published_time

Example

   .. code-block:: jinja
      :caption: page_article.html:

      {% block head %}
        {{ super() }}
        {{ macro.opengraph(page) }}
      {% block head %}


.. target:: docutils_html5

miyadaiku.themes.docutils_html5
--------------------------------------------

Provides CSS files usef for `html5_polyglot writer <http://docutils.sourceforge.net/docs/user/html.html#html5-polyglot>`_ of docutils.


Usage
~~~~~~~~~~~~~~~~~~~

1. Add ``miyadaiku.themes.docutils_html5`` to the ``themes`` in the ``config.yml`` file of the project.

   .. code-block:: yaml
      :caption: config.yml:

      themes:
        - miyadaiku.themes.docutils_html5

2. Call ``docutils_html5.load_css(page)`` in the ``head`` element of the template to output ``link`` element to use CSS file.

   .. code-block:: jinja   
      :caption: page_article.html:

      {% block head %}
        {{ super() }}
        {{ docutils_html5.load_css(page) }}
      {% endblock head %}


.. target:: ipynb

miyadaiku.themes.ipynb
--------------------------------------------


Provides CSS files usef for `Jupyter Notebook <http://jupyter.org/>`_.


Example
    https://github.com/miyadaiku/miyadaiku-docs/tree/master/samples/ipynb

Usage
~~~~~~~~~~~~~~~~~~~

1. Add ``miyadaiku.themes.ipynb`` to the ``themes`` in the ``config.yml`` file of the project.

   .. code-block:: yaml
      :caption: config.yml:

      themes:
        - miyadaiku.themes.ipynb

2. Call ``ipynb.load_css(page)`` in the ``head`` element of the template to output ``link`` element to use CSS file.

   .. code-block:: jinja   
      :caption: page_article.html:

      {% block head %}
        {{ super() }}
        {{ ipynb.set_header() }}
      {% endblock head %}


  
.. target:: pygments

miyadaiku.themes.pygments
--------------------------------------------

Provides CSS files usef for built-in styles of the `Pygments <http://pygments.org/>`_. Follwing CSS files are supported.

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

Usage
~~~~~~~~~~~~~~~~~~~

1. Add ``miyadaiku.themes.pygments`` to the ``themes`` in the ``config.yml`` file of the project.

   .. code-block:: yaml
      :caption: config.yml:

      themes:
        - miyadaiku.themes.pygments

2. Specify name of CSS file to the ``pygments_css`` in the ``config.yml`` file of the project. The ``pygments_native.css`` is used if not specified.

   .. code-block:: yaml
      :caption: config.yml:

      pygments_css: pygments_native.css


2. Call ``pygments.load_css(page)`` in the ``head`` element of the template to output ``link`` element to use CSS file.

   .. code-block:: jinja   
      :caption: page_article.html:

      {% block head %}
        {{ super() }}
        {{ pygments.load_css(page) }}
      {% endblock head %}



.. target:: sample_blog

miyadaiku.themes.sample.blog
--------------------------------------------

Sample theme for blog sites. See :jinja:`{{ page.link_to('../tutorial/tutorial_blog.rst')  }}` for usage.


