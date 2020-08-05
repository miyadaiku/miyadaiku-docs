# 設定ファイル

通常、アーティクルのプロパティは文書ファイルに指定しますが、設定ファイルを使うと、ディレクトリごとに未設定なプロパティのデフォルト値を指定できます。

プロジェクトディレクトリの :jinja:`{{ content.link_to('proj.md', fragment='config_yml') }}` に指定したプロパティは、全ディレクトリのデフォルト値となります。


設定ファイルは、Atom/RSSフィードは、`type`を`config`と指定したYAMLファイルで定義します。

**設定ファイルの例: contents/sample.ymlファイル**

```yaml
type: config    # YAMLファイルのタイプを config に指定
category: 一般  # カテゴリのデフォルト値を「一般」に設定
```

## 設定の親子関係

設定ファイルのプロパティは、設定ファイルが保存されているディレクトリと、その子ディレクトリで有効です。

Miyadaikuのデフォルト設定では、アーティクルのHTMLページを生成するJinja2テンプレートは、`page_article.html` です。次の例では、ディレクトリ `A` では `page_dir_A.html`、その子ディレクトリの `A/B` では `page_dir_B.html` となるように設定します。

**contents/A/dircondig.yml**

```yaml
type: config 
article_template: page_dir_A.html  # A/以下の全ディレクトリのデフォルトテンプレート名を指定
```

**contents/A/B/dircondig.yml**

```yaml
type: config 
article_template: page_dir_AB.html  # A/B以下の全ディレクトリのデフォルトテンプレート名を指定
```

