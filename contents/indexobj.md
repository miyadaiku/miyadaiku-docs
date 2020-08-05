# インデックス

Blogサイトなどでは、新着記事ページや、記事カテゴリ別の一覧ページなど、アーティクルの一覧からなるページが必要となります。Miyadaikuでは、このようなファイルの一覧ページは、`index`オブジェクトから作成します。

`index`オブジェクトは、`type`を`index`と指定したYAMLファイルで定義します。


**インデックス定義の例: contents/index.ymlファイル**

```yaml
type: index                 # YAMLファイルのタイプを index に指定
indexpage_max_articles: 10  # 1ページにファイルを10件表示
abstract_length: 256        # 摘要として表示する文字数
filters:                    # categoryが TECH または IT のファイルの一覧を作成
  category: [TECH, IT]
```

## プロパティ

`index`オブジェクトには、以下のプロパティを指定できます。


#### filters

表示するアーティクルの検索条件を指定します。検索する文書プロパティ名をキー、表示対象のプロパティ値のリストを値とする辞書を指定します。

省略時は、プロパティ `draft` が `false` の、すべてのファイルを表示します。

**例: カテゴリが 'news' または 'event' の日本語ファイルのみを表示**

```yaml
type: index
filters:
  lang: [ja]  # langが日本語
  category: [news, event]  # カテゴリが news または events
```

#### excludes

インデックスに含めないアーティクルの検索条件を指定します。検索する文書プロパティ名をキー、表示対象のプロパティ値のリストを値とする辞書を指定します。


**例: タグが 'Programming'のファイルを除外**

```yaml
type: index
excludes:
  tags: [programming]  # カテゴリが news または events
```



#### directories

表示するアーティクルのディレクトリのリストを、絶対パスまたは相対パスで指定します。次の例を `contents/index/index.yml` に保存すると、`contents/docs` ディレクトリと`contents/index/subdir/` ディレクトリ以下のアーティクルを出力します。

**例: `contents/docs` と`contents/index/subdir/` ディレクトリのみを表示**

```yaml
# contents/index/index.yml
type: index
directories:
  - /docs
  - ./subdir
```

#### indexpage_filename_templ, indexpage_filename_templ2

インデックスの先頭ページと２ページ目以降のファイル名を、Jina2テンプレートで指定します。

未指定の場合は `{{content.stem}}.html` と `{{content.stem}}_{{cur_page}}.html` になります。

テンプレートでは、次の変数を参照できます。

* **cur_page**  
ページ番号を指定します。

* **page**  
現在のインデックスオブジェクト



次の例は、インデックスの1ページ目のファイル名は `index_blog.html`、2ページ目以降は `index_blog_2.html`、`index_blog_3.html`、... とします。

**例: インデックスのファイル名設定**

```yaml
type: index
indexpage_filename_templ: 'index_blog.html'
indexpage_filename_templ2: 'index_blog_{{cur_page}}.html'
```

#### indexpage_max_articles

インデックスページに表示する、1ページあたりの項目数を指定します。未指定の場合は `5` となります。

#### indexpage_max_num_pages

インデックスの最大ページ数を指定します。`0` の場合は、すべてのページを出力します。未指定の場合は `0` となります。

#### indexpage_template
インデックスの先頭ページを生成する Jinja2 テンプレート名を指定します。未指定の場合は `page_index.html` となります。

#### indexpage_template2
インデックスの2ページ目以降を生成する Jinja2 テンプレート名を指定します。未指定の場合は `page_index.html` となります。

#### indexpage_orphan
最終インデックスページの項目数が `indexpage_orphan` 以下なら、新たなページを作成せずに前のページに統合します。

例えばファイルが7件あり、`index_max_page` が `3` なら、3ページ目の項目数は 1 となります。この場合、`indexpage_orphan` が `1` なら、3ページ目は生成されず、2ページ目の項目数が 4 となります。


## グループ別インデックス
カテゴリ毎のインデックスや、タグ毎のインデックスなど、プロパティ毎のインデックスは、分類対象のプロパティを `groupby` に指定して作成します。

**例: カテゴリ別のインデックスを作成**
```yaml
type: index   # YAMLファイルのタイプを index に指定
groupby: category  # カテゴリ別のインデックスを作成
```

`groupby` プロパティを指定すると、指定されたプロパティの値ごとにインデックスページを作成します。この例では、カテゴリが `catA` のページと `catB` のページが存在する場合、

- index_category_catA.html
- index_category_catA_2.html
- ...

と、

- index_category_catB.html
- index_category_catB_2.html
- ...

の2種類のインデックスページを作成します。

### グループ別インデックスのプロパティ

グループ別インデックスでは、通常のインデックス に加えて、次のプロパティを指定できます。

#### groupby
ファイルを分類するプロパティの名前を指定します。e.g. `category`, `tag`, ...

#### indexpage_group_filename_templ, indexpage_group_filename_templ2

グループ別先頭ページと２ページ目以降のファイル名を、Jina2テンプレートで指定します。未指定の場合は `{{content.stem}}_{{content.groupby}}_{{ group_value }}.html`  と `{{content.stem}}_{{content.groupby}}_{{ group_value }}_{{cur_page}}.html` となります。

**例: グループ別インデックスのファイル名設定**

```yaml
type: index
groupby: tags  # タグ別のインデックスを作成

# 先頭ページのファイル名は `tags_タグ名.html`、2ページ目以降は `tags_タグ名_ページ.html`
indexpage_group_filename_templ: '{{content.groupby}}_{{value}}.html'
indexpage_group_filename_templ2: '{{content.groupby}}_{{value}}_{{cur_page}}.html'

```

テンプレートでは、次の変数を参照できます。

* **cur_page**  
ページ番号を指定します。

* **page**  
現在のインデックスオブジェクト

* **group_value**  
プロパティの値を指定します。



