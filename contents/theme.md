# テーマ

Miyadaikuは、文書や画像、CSS、JinjaテンプレートなどのファイルをまとめたPythonパッケージを、文書を作成する部品として利用できるようになっています。Miyadaikuでは、こういったPythonパッケージを、「テーマ」と呼んでいます。

利用するテーマは、プロジェクトの :jinja:`{{ content.link_to('proj.md', fragment='config_yml') }}` の `themes:` に指定します。次のサンプルは、Miyadaikuに標準で組み込まれている `pygments` テーマを利用しています。

``` yaml
themes:
  - miyadaiku.themes.pygments
```

## テーマのインストール

標準で組み込まれていない、外部パッケージをテーマとして利用するときには、事前に `pip3` コマンドなどでテーマをインストールしておく必要があります。たとえば、[miyadaiku_theme_fontawesome](https://github.com/miyadaiku/miyadaiku-theme-fontawesome) を利用するときには、

```sh
$ pip install miyadaiku_theme_fontawesome
```

としてパッケージをインストールしてから、:jinja:`{{ content.link_to('proj.md', fragment='config_yml') }}` の `themes:` に `miyadaiku_theme_fontawesome` を追加します。

## テーマのJinjaテンプレート

テーマの `templates` ディレクトリからJinjaテンプレートを参照する時は、テンプレート名の前に  `テーマ名!テンプレート名` と指定します。

```jinja

miyadaiku.themes.base パッケージの、 base.html テンプレートを参照
{% extends 'miyadaiku.themes.base!base.html' %}  

{% block head %}
  <title> My document </title>
{% endblock head %}
```


## 組み込みテーマ

Miyadaikuには、以下のテーマを組み込んでいます。

- :jinja:`{{content.link(fragment='miyadaiu_themes_base')}}`
- :jinja:`{{content.link(fragment='docutils_html5')}}`
- :jinja:`{{content.link(fragment='ipynb')}}`
- :jinja:`{{content.link(fragment='pygments')}}`
- :jinja:`{{content.link(fragment='sample_blog')}}`




.. target:: miyadaiu_themes_base

### miyadaiku.themes.base

``miyadaiku.themes.base`` は、デフォルトで使用されるHTMLテンプレートを提供するテーマで、プロジェクトの ``config.yml`` でテーマとして指定しなくとも、常に使用されます。

次のテンプレートを提供します。

- [page_article.html](https://github.com/miyadaiku/miyadaiku/blob/master/miyadaiku/themes/base/templates/page_article.html)  
:jinja:`{{ page.link_to("contents.md", text="アーティクル") }}`のデフォルトJinja テンプレートです。  


- [page_index.html](https://github.com/miyadaiku/miyadaiku/blob/master/miyadaiku/themes/base/templates/page_index.html)  
:jinja:`{{ page.link_to("indexobj.md") }}` のデフォルトJinja2 テンプレートです。



.. target:: docutils_html5

### miyadaiku.themes.docutils_html5

Docutilsの [html5_polyglot writer](http://docutils.sourceforge.net/docs/user/html.html#html5-polyglot) 用 CSSファイルを提供します。reStructuredTextの標準CSSとして利用できます。

#### 使い方

:jinja:`{{ content.link_to('proj.md', fragment='config_yml') }}` の ``themes`` に、``miyadaiku.themes.docutils_html5`` を追加します。

```yaml
themes:
  - miyadaiku.themes.docutils_html5
```

テンプレートの ``head`` 要素で、``docutils_html5.load_css(page)`` を呼び出し、CSSファイルを指定する ``link`` 要素を出力します。

```jinja
{% block head %}
  {{ super() }}
  {{ docutils_html5.load_css(page) }}
{% endblock head %}
```



.. target:: ipynb

miyadaiku.themes.ipynb
--------------------------------------------

Jupyter Notebook 用のCSSファイルを提供します。


### 使い方

:jinja:`{{ content.link_to('proj.md', fragment='config_yml') }}` の ``themes`` に、``miyadaiku.themes.ipynb`` を追加します。

```yaml
themes:
  - miyadaiku.themes.ipynb
```

``miyadaiku.themes.ipynb`` は、2種類のCSSを用意しています。`ipynb.load_css()`は、標準のJupyter NotebookとおなじデザインのCSSをロードします。

```jinja
{% block head %}
  {{ super() }}
  {{ ipynb.load_css() }}
{% endblock head %}
```

`ipynb.load_css_min()`は、必要最低限なCSSをロードします。

```jinja
{% block head %}
  {{ super() }}
  {{ ipynb.load_css_min() }}
{% endblock head %}
```

  
.. target:: pygments

miyadaiku.themes.pygments
--------------------------------------------

[Pygments](http://pygments.org/) の組み込みスタイル用のCSSファイルを提供します。次のスタイルを指定できます。

> default, emacs, friendly, colorful, autumn, murphy, manni, monokai, perldoc, pastie, borland, trac, native, fruity, bw, vim, vs, tango, rrt, xcode, igor, paraiso-light, paraiso-dark, lovelace, algol, algol_nu, arduino, rainbow_dash, abap, solarized-dark, solarized-light, sas, stata, stata-light, stata-dark, inkpot



### 使い方

:jinja:`{{ content.link_to('proj.md', fragment='config_yml') }}` の ``themes`` に、``miyadaiku.themes.pygments`` を追加し、`pygments_style` にスタイル名を指定します。

```yaml
pygments_style: default
themes:
  - miyadaiku.themes.pygments
```

テンプレートの ``head`` 要素で、``pygments.load_css(page)`` を呼び出し、CSSファイルを指定する ``link`` 要素を出力します。

```jinja
{% block head %}
  {{ super() }}
  {{ pygments.load_css(page) }}
{% endblock head %}
```


.. target:: sample_blog

miyadaiku.themes.sample.blog
--------------------------------------------

ブログサイトのサンプルテーマです。

### 使い方

:jinja:`{{ content.link_to('proj.md', fragment='config_yml') }}` の ``themes`` に、``miyadaiku.themes.sample.blog`` を追加し、`pygments_style` にスタイル名を指定します。

```yaml
# List of site theme
themes:
  - miyadaiku.themes.sample.blog
```

ブログのエントリを `contents/entry_1.md` に作成します。コンテンツには、タグとカテゴリを指定します。

**contents/entry_1.md**
``` markdown
---
date: 2017-01-01
title: First entry
category: カテゴリ1
tags:
    - タグ1
    - タグ2
---

This is my first blog entry.
```
