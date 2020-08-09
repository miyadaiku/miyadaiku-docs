# テンプレート

Miyadaikuは、`contents` ディレクトリを走査し、アーティクルやインデックスなどのコンテンツをJinja2テンプレートに渡してHTMLを作成します。テンプレートは、プロジェクトディレクトリの `templates` ディレクトリに作成します。

## アーティクルテンプレート

アーティクルに適用するテンプレートは、`article_template` プロパティで指定します。未指定の場合は、`'page_article.html'` となります。

アーティクルテンプレートでは、次の変数を参照できます。

page
: ページに表示する :jinja:`{{ content.link_to('./objects.md', fragment='content_obj', text='Article オブジェクト') }}` を参照します。

context
: 実行中の状態を示す :jinja:`{{ content.link_to('./objects.md', fragment='context_obj') }}` を参照します。


contents
: :jinja:`{{ content.link_to('./objects.md', fragment='contents_collection') }}` オブジェクトを参照します。



アーティクルテンプレートでは、次のようにアーティクルのHTMLを表示します。

**例: シンプルなアーティクルテンプレート**

```jinja
<html>
<head>
  <title>{{ page.title }} </title>
</head>
<body>
  <h1>{{ page.title }} </h1>

  {{ page.html }}
</body>
</html>
```


## インデックステンプレート

:jinja:`{{ content.link_to("./indexobj.md") }}`に適用するテンプレートは、1ページ目を`indexpage_template` プロパティと `indexpage_template2` プロパティで指定します。未指定の場合は、どちらも `page_index.html` となります。


インデックステンプレートでは、次の変数を参照できます。


page
: ページに表示する :jinja:`{{ content.link_to('./objects.md', fragment='content_obj', text='IndexPageオブジェクト') }}` オブジェクト を参照します。

context
: 実行中の状態を示す :jinja:`{{ content.link_to('./objects.md', fragment='context_obj') }}` を参照します。

contents
: :jinja:`{{ content.link_to('./objects.md', fragment='contents_collection') }}` オブジェクトを参照します。

articles
: ページに表示する:jinja:`{{ content.link_to('./objects.md', fragment='content_obj', text='Article オブジェクト') }}` のリストを参照します。

cur_page
: 現在のページ番号(1~)。

num_pages
: インデックスのページ数。

is_last
: 最終ページならTrue

### グループ別インデックスページ

`groupby` プロパティを指定したグループ別インデックスページでは、テンプレートで次の変数を参照できます。

group_value
: グループの値


**例: シンプルなインデックステンプレート**

```jinja
<html>
<body>
<!-- エントリへのリンク -->
{% for article in articles %}
  <p>{{ article.link() }}</p>
{% endfor %}

{% if cur_page != 1 %}
  <!-- 前ページへのリンク>
  {{ page.link(group_value=group_value, npage=cur_page-1) }}
{% endif %}
{% if not is_last %}
  <!-- 次ページへのリンク>
  {{ page.link(page, group_value=group_value, npage=cur_page+1) }}
{% endif %}
</body>
</html>
```
