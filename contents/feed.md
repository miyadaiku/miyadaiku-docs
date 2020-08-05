# フィード

Atom/RSSフィードは、`type`を`feed`と指定したYAMLファイルで定義します。

**フィード定義の例: contents/atom.ymlファイル**

```yaml
type: feed             # YAMLファイルのタイプを feed に指定
feedtype: atom         # Atomフィードを作成
feed_num_articles: 10  # 最新10件を出力
```

## プロパティ

`feed`オブジェクトには、以下のプロパティを指定できます。


#### feedtype

フィードの種類を、`atom` または `rss` で指定します。未指定の場合は `atom` となります。

#### feed_num_articles

フィードに出力するファイルの件数を指定します。

#### filters

表示するファイルの検索条件を指定します。検索する文書プロパティ名をキー、表示対象のプロパティ値のリストを値とする辞書を指定します。

省略時は、プロパティ `draft` が `false` で、`date` が指定されているすべてのファイルを表示します。

**例: カテゴリが 'news' または 'event' の日本語ファイルのみを表示**

```yaml
type: feed
filters:
  lang: [ja]  # langが日本語
  category: [news, event]  # カテゴリが news または events
```

#### excludes

インデックスに含めないファイルの検索条件を指定します。検索する文書プロパティ名をキー、表示対象のプロパティ値のリストを値とする辞書を指定します。


**例: タグが 'Programming'のファイルを除外**

```yaml
type: feed
excludes:
  tags: [programming]  # タグが programming
```



#### directories

表示するファイルのディレクトリのリストを、絶対パスまたは相対パスで指定します。次の例を `contents/feeds/atom.yml` に保存すると、`contents/docs` ディレクトリと`contents/index/subdir/` ディレクトリ以下のファイルを出力します。

```yaml
# contents/index/index.yml
type: feed
directories:
  - /docs
  - ./subdir
```

