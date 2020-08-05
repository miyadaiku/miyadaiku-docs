# プロジェクト構成

Miyadaikuのプロジェクトは、次のようなファイルで構成されます。

```text
サンプルプロジェクト
├── config.yml
├── contents/
│   └──
├── files/
│   └──
├── outputs/
│   └──
└── templates/
    └──
```

.. target:: config_yml

#### config.yml ファイル

プロジェクト全体のプロパティを設定します。このファイルに指定したプロパティは、全てのファイルのプロパティのデフォルト値となります。


#### contents ディレクトリ

Markdown、Jupyter notebookなどの :jinja:`{{ content.link_to('./contents.md', text="アーティクル")}}` や、それ以外の画像ファイルなどを配置します。contents ディレクトリのアーティクルファイルはHTMLに変換して、それ以外のファイルはそのまま、ディレクトリ構造を保ってOutputディレクトリにコピーされます。

#### files ディレクトリ

files ディレクトリのファイルは、ディレクトリ構造を保ってそのままOutputディレクトリにコピーされます。


#### outputs ディレクトリ

生成したHTMLなどがコピーされます。

#### templatesディレクトリ

アーティクルを変換するJinjaテンプレートを配置します。


