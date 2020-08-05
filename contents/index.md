# Miyadaiku

Miyadaiku は、 [Jinja2](https://jinja.palletsprojects.com/)職人のための静的サイトジェネレータです。

- コンテンツを reStructuredText, Markdown, HTML, Jupyter Notebook, YAML で記述できます。

- Jinja2 テンプレートでコンテンツからHTMLを作成します。

- コンテンツ中にもJinja2タグを記述できます。Miyadaikuは、ReSTとMarkdownにそれぞれ専用の拡張構文を用意しています。

- コンテンツのプロパティを、ディレクトリ階層に沿って指定できます。ディレクトリごとにデフォルトプロパティを指定し、ディレクトリとそのサブディレクトリのデフォルトプロパティを一括して指定できます。

- テーマを使って、テンプレートやCSS, Javascript, 画像などを共有できます。

- テーマは、Pythonのパッケージとして作成し、pip などを用いて PyPI からインストールできます。

- Blogサイト用の機能として、インデックスページや、Atom/RSSフィードを作成できます。

## Requirements

Miydaiku requires Python 3.7 or later.

## Installation

```
$ pip3 install miyadaiku
```
