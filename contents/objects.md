# オブジェクトリファレンス

.. target:: content_obj

## コンテントオブジェクト

Miyadaikuで、`contents` ディレクトリや `files` ディレクトリのファイルは、コンテントオブジェクトとして読み込まれます。アーティクルやインデックスなどのファイルだけでなく、CSSや画像ファイルなどのMiyadaikuで処理されないファイルも、コンテントオブジェクトとして参照できます。

### プロパティ

`tags` や `title` など、コンテントオブジェクトに設定された :jinja:`{{content.link_to('./contents_props.md', text='プロパティ')}}` は、コンテントオブジェクトの属性として参照できます。

**例: titleプロパティを表示**
```
この文書のタイトルは、\:jinja:`{{ content.title}}` です。
```

コンテンツのプロパティ以外にも、以下の属性を参照できます。

#### abstract

コンテンツの先頭から、`abstract_length` で指定した文字数のテキストを取得します。

#### filename

コンテンツの出力ファイル名(ディレクトリを含まない)を取得します。

#### headers
コンテンツのヘッダ要素の一覧を、次の [NamedTuple](https://docs.python.org/3/library/collections.html#collections.namedtuple) で返します。

```python
class HTMLIDInfo(NamedTuple):
    id: str   # ヘッダ部分のid
    tag: str  # ヘッダタグ名 (h1~h6)
    text: str # ヘッダ要素内のテキスト
```

#### html

コンテンツのHTMLを取得します。

#### url

コンテンツの絶対URLを取得します。

### メソッド


#### get_abstract(abstract_length=None, plain=False)

コンテンツの先頭から、`abstract_length` で指定した文字数のテキストを取得します。

abstract_length
: 取得する文字数を指定します。省略時は、`abstract_length` プロパティを使用します。

plain
: `True`の場合はHTML、`False`の場合は plain text を返します。

#### link(text=None, fragment=None, abs_path=False, attrs=None, group_value=None, npage=None):
現在のページからリンクする<a>要素を返します。

text
: リンク文字列を指定します。省略時は、`fragment` で指定するヘッダ要素のテキスト、またはオブジェクトのタイトルとなります。

fragment
: リンク先の要素idを指定します。

abs_path
: `True` の場合、プロトコルから始まる完全なURLを返します。

attrs:
: `<a>`要素の属性を辞書で指定します。e.g: `{'style':'border: solid 1px;'}`

group_value
: グループ別インデックスページの、グループの値を指定します。インデックスページでのみ指定できます。

npage
: インデックスページの、リンク先ページ番号を指定します。インデックスページでのみ指定できます。

```jinja
{{ content.link(fragment="id_in_page",
    attrs={"class":"class_a", "style":"border:solid;"}) }}
```


#### link_to(target, text=None, fragment=None, abs_path=False, attrs=None, group_value=None, npage=None):

``target`` で指定するコンテントオブジェクトへリンクする ``<a>`` 要素を返します。`content.load(target).link_to()` と同様です。
  

target
: リンク先のコンテントオブジェクト、`'/'` から始まる絶対パス、または相対パスのいずれかを指定します。
  
現在のページからリンクする<a>要素を返します。

text
: リンク文字列を指定します。省略時は、`fragment` で指定するヘッダ要素のテキスト、またはオブジェクトのタイトルとなります。

fragment
: リンク先の要素idを指定します。

abs_path
: `True` の場合、プロトコルから始まる完全なURLを返します。

attrs:
: `<a>`要素の属性を辞書で指定します。e.g: `{'style':'border: solid 1px;'}`

group_value
: グループ別インデックスページの、グループの値を指定します。インデックスページでのみ指定できます。

npage
: インデックスページの、リンク先ページ番号を指定します。インデックスページでのみ指定できます。

```jinja
{{ content.link_to("../page1.rst", fragment="id_in_page",
                attrs={"class":"class_a"}) }}
```


#### load(target)

`target` で指定したパスのコンテントオブジェクトを取得します。

target
: `'/'` から始まる絶対パス、または相対パスを指定できます。

```jinja
{{ content.load('/page1.rst').abstract }}  
```


#### path(fragment=None, abs_path=False, group_value=None, npage=None)

現在のページから、自分自身へのパスを取得します。

fragment
: ページ内の要素idを指定します。

abs_path
: `True` の場合、プロトコルから始まる完全なURLを返します。

group_value
: グループ別インデックスページの、グループの値を指定します。インデックスページでのみ指定できます。


npage
: インデックスページの、リンク先ページ番号を指定します。インデックスページでのみ指定できます。

**例:**
```html
<a href='{{ content.path() }}'>
  Current content</a>
```

#### path_to(target, fragment=None, abs_path=False, group_value=None, npage=None)

`target` で指定するコンテントオブジェクトへのパスを取得します。`content.load(target).path()` と同様です。
  
target
: リンク先のコンテントオブジェクト、`'/'` から始まる絶対パス、または相対パスのいずれかを指定します。

fragment
: リンク先の要素idを指定します。

abs_path
: `True` の場合、プロトコルから始まる完全なURLを返します。

group_value
: グループ別インデックスページの、グループの値を指定します。インデックスページでのみ指定できます。

npage
: インデックスページの、リンク先ページ番号を指定します。インデックスページでのみ指定できます。


``` html
<a href='{{ page.path_to("../page1.rst") }}'>
  親ディレクトリのpage1.html</a>
```



.. target:: contents_collection

## コンテンツ コレクション


コンテンツコレクションは、Miyadaikuプロジェクトのすべてのコンテントを管理するオブジェクトです。

### メソッド

#### get_content(key, base=None)
コレクションから、指定したファイル名の :jinja:`{{ content.link(fragment='content_obj')}}` を取得します。

key
: コンテントオブジェクトのパスを、``/`` で始まる絶対パス、または相対パスで指定します。相対パスで指定する場合は、base に起点となるコンテントオブジェクトを指定します。

base
: `key` に相対パスを指定した場合に、起点となるコンテントオブジェクトを指定します。



```jinja
{{ contents.get_content("../page1.rst") }}
```


#### get_contents(subdirs=None, recurse: bool = True, base=None, filters=None, excludes=None)

コレクションから、指定した条件の :jinja:`{{ content.link(fragment='content_obj')}}` を検索します。結果として、:jinja:`{{ content.link(fragment='content_obj')}}` のリストを返します。

subdirs
: 検索対象のディレクトリのリストを指定します。ディレクトリ名は、``/`` で始まる絶対パス、または相対パスで指定します。相対パスで指定する場合は、`base` に起点となるコンテントオブジェクトを指定します。

base
: `subdirs` に相対パスを指定した場合に、起点となるコンテントオブジェクトを指定します。

recurse
: 指定したディレクトリのサブディレクトリも検索する場合は `True` とします。

filters
: 検索条件を指定します。検索するプロパティ名をキー、表示対象のプロパティ値のリストを値とする辞書を指定します。省略時は、文書プロパティ `draft` が `false` かつ `type` が `article` のコンテントオブジェクトを検索します。

excludes
: 検索結果から除外する条件を指定します。検索するプロパティ名をキー、表示対象のプロパティ値のリストを値とする辞書を指定します。

```jinja
{% for found in contents.get_contents(filter={'tags': ['tag1', 'tag2']}) %}
  <p>{{ found.title}}</p>
{% endfor %}
```


#### group_items(group, subdirs=None, recurse: bool = True, base=None, filters=None, excludes=None)

`contents.get_contents()` と同様に、アーティクルを検索します。検索結果は、`group` で指定するプロパティ名の値で分類します。

戻り値は、

```python
[
  (['プロパティ値1'], [article1, article2,]), 
  (['プロパティ値2'], [article3, article4, article5]),
] 
```
のように、プロパティ値と該当するコンテントオブジェクトのリストのタプルを要素とするリストを返します。

group
: 分類するプロパティ名を指定します。

subdirs
: 検索対象のディレクトリのリストを指定します。ディレクトリ名は、``/`` で始まる絶対パス、または相対パスで指定します。相対パスで指定する場合は、`base` に起点となるコンテントオブジェクトを指定します。

base
: `subdirs` に相対パスを指定した場合に、起点となるコンテントオブジェクトを指定します。

recurse
: 指定したディレクトリのサブディレクトリも検索する場合は `True` とします。

filters
: 検索条件を指定します。検索するプロパティ名をキー、表示対象のプロパティ値のリストを値とする辞書を指定します。省略時は、文書プロパティ `draft` が `false` かつ `type` が `article` のコンテントオブジェクトを検索します。

excludes
: 検索結果から除外する条件を指定します。検索するプロパティ名をキー、表示対象のプロパティ値のリストを値とする辞書を指定します。

```jinja
<dl>
{% for values, items in contents.group_items('tags') %}
  <dt>{{ values[0] }}</dt>
  {% for item in items %}
    <dd>{{item.link()}}</dd>
  {% endfor %}
{% endfor %}
</dl>
```
