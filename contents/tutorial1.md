# チュートリアル

Miyadaikuプロジェクトの作成と、簡単なカスタマイズ方法を紹介します。


## プロジェクトの作成

まず、`miyadaiku-start` コマンドで、`first_doc`ディレクトリにMiyadaikuのプロジェクトディレクトリを作成します。

```sh
$ miyadaiku-start first_doc
```

## プロジェクトのビルド

プロジェクトを作成したら、さっそく`miyadaiku-build`コマンドでHTMLを作成してみましょう。

```sh
$ miyadaiku-build first_doc

Building first_doc ...
Loading first_doc/contents
Loading first_doc/files
Loading miyadaiku.themes.base/contents
Loading miyadaiku.themes.base/files
Building first_doc/contents/index.md
Build finished... Built 1 files. 0 error found.
```

`miyadaiku-start` コマンドは、サンプルとして `first_doc/contents/index.md` ファイルを作成します。このファイルから、つぎのようなHTMLファイル `first_doc/outputs/index.html` が生成されます。


```html
<!DOCTYPE html>
<html lang="ja-JP">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>sample document - FIXME - site title</title>
</head>
<body>
  <div>
    <h1>sample document</h1>
    <div><p>Hello world.</p></div>
  </div>
</body>
</html>
```


`first_doc/contents/index.md` を編集してから `miyadaiku-build`コマンドを実行し、`first_doc/outputs/index.html` ファイルの内容が変化することを確認してください。


## テンプレートのカスタマイズ

ページのHTMLを生成するJinjaテンプレートを作ってみましょう。`first_doc/templates/`ディレクトリに、`page_article.html` という名前のファイルを作成します。

```html
<!-- first_doc/templates/page_article.html -->
<html>
<body>
  <h1>{{ page.title }} </h1>
  <div style="border: solid 1px;">
    {{ page.html }}
  </div>
</body>
</html>
```

Jinjaテンプレートで参照している `page` 変数は、現在のドキュメントファイルを示します。ここでは、`page.title` プロパティと `page.html` プロパティで、ドキュメントのタイトルと本文を埋め込んでいます。



もう一度 `miyadaiku-build` コマンドでHTMLファイルを生成すると、`first_doc/outputs/index.html` は次のようになります。


```html
<html>
<body>
  <h1>hello </h1>
  <div style="border: solid 1px;">
    <p>Hello world.</p>
  </div>
</body>
</html>
```
