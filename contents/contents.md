
# アーティクル

プロジェクトの`contents`ディレクトリに作成したファイルのうち、以下の種類のファイルは、ビルド時に HTML に変換してから`outputs`ディレクトリに出力します。Miyadaikuでは、このようにHTMLファイルに変換するファイルを、「**アーティクル**」と呼びます

`contents`ディレクトリには、自由にサブディレクトリを作成できます。サブディレクトリのファイルは、そのままのディレクトリ構造で `outputs`ディレクトリに出力します。


## Markdownファイル

拡張子が `'.md'`のファイルは、MarkdownファイルとしてHTMLに変換されます。Markdownの変換には、[Markdownパッケージ](https://pypi.org/project/Markdown/) を使用しています。





### プロパティ

ファイルのタイトル・タグなどのプロパティは、HTML ファイルの先頭に YAML 形式で指定できます。ファイルの一行目が `---` で始まっている場合、次の `---` までがプロパティとなります。

```
---
title: ファイルのタイトル
date: 2020/9/1
tags:
  - プログラミング
  - Python
---

## Hello
```

### マークアップ

Miyadaikuでは、Markdownに以下の記法を追加しています。

#### :jinja:\``

Markdownファイルには、<code>:jinja:\`</code> と <code>\`</code> の間にJinjaテンプレートを記述できます。

``` text
2の10乗は、 \:jinja:`{{ 2**10 }}` です。
```

#### .. target::

`.. target::` は、HTMLに `<div>` 要素を埋め込み、直後のヘッダ要素へのリンクターゲットとして指定できるようにします。`<div>` 要素の `id` を、ディレクティブの引数で指定します。

```restructuredtext

.. target:: id_of_section1

# Section I

Body of section I.

## Section II

Link to \:jinja:`{{ content.link_to(content, fragment='id_of_section1') }}`.
```



### ファイル分割

Markdownファイルの一行目が `%%% ファイル名` から始まるファイルは、次の`%%% ファイル名` で始まる行までを分割して、複数のコンテンツを出力します。

次の例は、一つのファイルを２つの別々のファイルとして出力します。それぞれのファイル名は、`split_file_1.md` と、`split_file_2.md` となります。

```text
%%% split_file_1.md
---
title: 分割ファイル1
---
ファイル1

%%% split_file_2.md
---
title: 分割ファイル2
---
ファイル2
```

## Jupyter Notebookファイル

Jupyter Notebookファイル(*.ipynb)ファイルは、HTMLに変換して結果を出力します。このHTMLにはCSSが含まれていないので、通常のNotebookとは表示が異なります。CSSの適用については、NotebookのCSS設定を参照してください。

現在のMiyadaikuでは、NotebookにはJinjaテンプレートは記述できません。


### プロパティ

ファイルのタイトル・タグなどのプロパティは、最初のセルの先頭に YAML 形式で指定できます。ファイルの一行目が `---` で始まっている場合、次の `---` までがプロパティとなります。プロパティは、タイプが `code` 以外のセル(`raw`, `markdown`など)に指定できます。

```markdown
---
title: ファイルのタイトル
date: 2020/9/1
tags:
  - プログラミング
  - Python
---

- sample markdown
```

また、NotebookのメタデータとしてもMiyadaikuのプロパティを設定できます。

1. Jupyter Web画面のメニューで Edit -> Edit Notebook Metadata を選択します。
2. JSONに miyadaiku キーを追加し、プロパティ値を指定します。次の例では、`title` プロパティと `date` プロパティを指定しています。

```json
{
  "kernelspec": {
    "name": "python3",
    "display_name": "Python 3",

    "":
    " ommit inrelevant lines"
    " ... "
    " ... "

  "miyadaiku": {
    "title": "Title of Jupyter notebook",
    "date": "2017-01-01",
  }
}
```



### ファイル分割

ノートブックの最初のセルの一行目が `%%% ファイル名` から始まるファイルは、以降のセルの`%%% ファイル名` で始まる行までを分割して、複数のコンテンツを出力します。ファイル分割は、タイプが `code` 以外のセル(`raw`, `markdown`など)に指定できます。

次の例は、一つのファイルを２つの別々のファイルとして出力します。それぞれのファイル名は、`split_file_1.ipynb` と、`split_file_2.i@pynb` となります。

```html
%%% split_file_1.ipynb
---
title: 分割ファイル1
---
ファイル1

%%% split_file_2.ipynb
---
title: 分割ファイル2
---
ファイル2
```


## HTMLファイル

拡張子が `'.html'`, `'.htm'`, `'.j2'` のいずれかのファイルは、Jinja のテンプレートとして実行して結果を出力します。通常の Jinja テンプレートのように、`{{}}`や`{% 〜 %}` を使って処理を記述します。

```jinja
<h1>HTMLコンテンツ サンプル</h1>

<ol>
{% for os in ['Windows', 'macOS', 'Ubuntu'] %}
  <li>{{ os }}</li>
{% endfor %}
</ol>
```

### プロパティ

ファイルのタイトル・タグなどのプロパティは、HTML ファイルの先頭に YAML 形式で指定できます。ファイルの一行目が `---` で始まっている場合、次の `---` までがプロパティとなります。

```html
---
title: ファイルのタイトル
date: 2020/9/1
tags:
  - プログラミング
  - Python
---

<h1>{{ content.title }}</h1>
```

### ファイル分割

HTMLファイルの一行目が `%%% ファイル名` から始まるファイルは、次の `%%% ファイル名` で始まる行までを分割して、複数のコンテンツを出力します。

次の例は、一つのファイルを２つの別々のファイルとして出力します。それぞれのファイル名は、`split_file_1.html` と、`split_file_2.html` となります。

```html
%%% split_file_1.html
---
title: 分割ファイル1
---
ファイル1

%%% split_file_2.html
---
title: 分割ファイル2
---
ファイル2
```




## reStructuredTextファイル

拡張子が `'.rst'`のファイルは、reStructuredTextファイルとしてHTMLに変換されます。


### プロパティ

アーティクルのプロパティは、`articleディレクティブ` で指定します。

```restructuredtext
.. article::
   :date: 2017-01-01
   :title: 文書のタイトル
   :category: カテゴリ1
   :tags: タグ1, タグ2


Sample of article directive
-----------------------------------

This is a miyadaiku article in reST.

```

### マークアップ

Miyadaikuでは、reStructuredTextに以下の記法を追加しています。

#### jinjaディレクティブ

複数行のJinjaテンプレートは、`jinjaディレクティブ` を使って記述できます。

```restructuredtext

この文書のプロパティ
-----------------------------------

.. jinja::

   <ul>
     <li> カテゴリ: {{ content.category }} </li>
     <li> タグ: {{ ', '.join(content.tags) }} </li>
     <li> 日付: {{ content.date.strftime('%Y-%m-%d') }} </li>
   </ul>

```

#### jinjaロール

また、`\:jinja: ロール` で、インラインにJinjaテンプレートを記述できます。

```restructuredtext

この文書は、\:jinja:`{{ content.title }}` です。
```



#### code-blockディレクティブ

プログラムのソースコードなどは、`code-block ディレクティブ` で記述します。`.. code-block:: lang` のように言語を指定すると、Pygments による構文ハイライトが行われます。

```restructuredtext
.. code-block:: python
   def test():
      pass
```

#### targetディレクティブ

`targetディレクティブ` は、HTMLに `<div>` 要素を埋め込み、直後のヘッダ要素へのリンクターゲットとして指定できるようにします。`<div>` 要素の `id` を、ディレクティブの引数で指定します。

```restructuredtext

.. target:: id_of_section1

Section I
-------------------

Body of section I.

Section II
------------------

Link to \:jinja:`{{ content.link_to(content, fragment='id_of_section1') }}`.
```


## スニペット

**スニペット**は、アーティクルと同様、*.rst ファイルや *.md ファイルなどから作成されるコンテンツですが、アーティクルとは異なり、スニペットからはHTMLファイルは生成されません。スニペットは、独立したHTMLページを作成するためではなく、他のアーティクルなどから読み込んで使用します。

スニペットは、ファイルの `type` プロパティに `snippet` を指定して作成します。


次のMarkdownファイル `snip.md` は、スニペットを作成します。

```markdown
---
type: snippet
---

Hello from snip.md.
```

スニペットは、次のように他のアーティクル内に取り込めます。

```markdown
---
title
---

こんにちは

\:jinja:`{{ content.load('snip.md').html }}`

```



## テンプレート変数

アーティクルに <code>:jinja:\`\`</code> などを使って記述するJinjaテンプレートでは、次の変数を参照できます。

content
: 実行中のJinjaテンプレートが記述されている、アーティクル自身の :jinja:`{{ content.link_to('./objects.md', fragment='content_obj') }}` を参照します。

page
: 現在のページのオブジェクトの :jinja:`{{ content.link_to('./objects.md', fragment='content_obj') }}` を参照します。  


アーティクルの個別ページでは `content` と `page` は同じアーティクルですが、インデックスページにアーティクルを表示する場合などは、`content` はアーティクルオブジェクトで、`page` はインデックスオブジェクトとなります。

context
: 実行中の状態を示す :jinja:`{{ content.link_to('./objects.md', fragment='context_obj') }}` を参照します。

contents
: :jinja:`{{ content.link_to('./objects.md', fragment='contents_collection') }}` オブジェクトを参照します。
