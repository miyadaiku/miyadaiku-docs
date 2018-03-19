
.. article::
  :order: 100

オブジェクト リファレンス 
================================

.. blank

.. target:: content_obj

コンテント オブジェクト
--------------------------

Miyadaikuで、``contents`` ディレクトリや ``files`` ディレクトリのファイルは、:jinja:`{{ content.link(fragment='content_obj') }}` として読み込まれます。アーティクルやインデックスなどのファイルだけでなく、CSSや画像ファイルなどのMiyadaikuで処理されないファイルも、コンテントオブジェクトとして参照できます。


コンテントオブジェクトは、:jinja:`{{ content.link_to('./property.rst') }}` や :jinja:`{{ content.link_to('./index.rst', fragment='propertyofindex') }}` に加え、次のメソッドを使用できます。



load(target)
  ``target`` で指定したパスのコンテントオブジェクトを取得します。``target`` には、``'/'`` から始まる絶対パス、または相対パスを指定できます。

  .. code-block:: jinja
     :caption: Sample of content.load() method

     <p>/page1.rst の概要を表示します</p>
     
     {{ content.load('/page1.rst').abstract }}  


path(fragment=None, abs_path=False, values=None, npage=None):
  現在のページからのパスを取得します。``target`` には、``'/'`` から始まる絶対パス、または相対パスを指定できます。

  ``fragment`` は、ページ内の要素idを指定します。

  ``abs_path`` が ``True`` の場合、プロトコルから始まる完全なURLを返します。

  ``values`` は、グループ別インデックスページの、グループの値を指定します。インデックスページでのみ指定できます。

  ``npage`` は、インデックスページの、リンク先ページ番号を指定します。インデックスページでのみ指定できます。

  .. code-block:: jinja
     :caption: Sample of content.path() method

     <a href='{{ content.path() }}'>
        Current content</a>


path_to(target, fragment=None, abs_path=False, values=None, npage=None):
  ``target`` で指定するコンテントオブジェクトへのパスを取得します。``target`` には、``'/'`` から始まる絶対パス、または相対パスを指定できます。

  ``fragment`` は、リンク先ページ内の要素idを指定します。

  ``abs_path`` が ``True`` の場合、プロトコルから始まる完全なURLを返します。

  ``values`` は、グループ別インデックスページの、グループの値を指定します。インデックスページでのみ指定できます。

  ``npage`` は、インデックスページの、リンク先ページ番号を指定します。インデックスページでのみ指定できます。


  .. code-block:: jinja
     :caption: Sample of content.path_to() method

     <a href='{{ page.path_to('../page1.rst') }}'>
        親ディレクトリのpage1.html</a>


link(text=None, fragment=None, abs_path=False, attrs=None, values=None, npage=None):
  現在のページからリンクする<a>要素を取得します。

  ``text`` は、リンク文字列を指定します。省略時は、``fragment`` で指定するヘッダ要素のテキスト、またはオブジェクトのタイトルとなります。

  ``fragment`` は、リンク先ページ内の要素idを指定します。

  ``abs_path`` が ``True`` の場合、プロトコルから始まる完全なURLを返します。

  ``attrs`` は、<a>要素の属性を辞書で指定します。

  ``values`` は、グループ別インデックスページの、グループの値を指定します。インデックスページでのみ指定できます。

  ``npage`` は、インデックスページの、リンク先ページ番号を指定します。インデックスページでのみ指定できます。

  .. code-block:: jinja
     :caption: Sample of content.link() method

     {{ content.link(fragment="id_in_page",
                     attrs={"class":"class_a", "style":"border:solid;"}) }}



link_to(target, text=None, fragment=None, abs_path=False, attrs=None, values=None, npage=None):
  ``target`` で指定するコンテントオブジェクトへリンクする ``<a>`` 要素を取得します。``target`` には、``'/'`` から始まる絶対パス、または相対パスを指定できます。
  
  ``text`` は、リンク文字列を指定します。省略時は、``fragment`` で指定するヘッダ要素のテキスト、または``target`` のタイトルとなります。

  ``fragment`` は、リンク先ページ内の要素idを指定します。

  ``abs_path`` が ``True`` の場合、プロトコルから始まる完全なURLを返します。

  ``attrs`` は、<a>要素の属性を辞書で指定します。

  ``values`` は、グループ別インデックスページの、グループの値を指定します。インデックスページでのみ指定できます。

  ``npage`` は、インデックスページの、リンク先ページ番号を指定します。インデックスページでのみ指定できます。

  .. code-block:: jinja
     :caption: Sample of content.link_to() method

     {{ content.link_to("../page1.rst", fragment="id_in_page",
                     attrs={"class":"class_a", "style":"border:solid;"}) }}



.. target:: contents_collection

コンテンツ コレクション
--------------------------


コンテンツコレクションは、Miyadaikuプロジェクトのすべてのコンテンツを管理するオブジェクトです。



get_content(key, base=None)
   コレクションから、指定したファイル名の :jinja:`{{ content.link(fragment='content_obj')}}` を取得します。

   ``key`` は、コンテントオブジェクトのパスを、``/`` で始まる絶対パス、または相対パスで指定します。相対パスで指定する場合は、``base`` に起点となるコンテントオブジェクトを指定します。

  .. code-block:: jinja
     :caption: Sample of contents.get_content() method

     Link to 'page1.rst' of the parent directory

     {{ contents.get_content("../page1.rst", base=content) }}


get_contents(subdirs=None, base=None, filters=None)
   コレクションから、指定した条件の :jinja:`{{ content.link(fragment='content_obj')}}` を検索します。

   特定のディレクトリに含まれるコンテントのみを取得する場合は、``subdirs`` に、ディレクトリ名のリストを指定します。ディレクトリ名は、``/`` で始まる絶対パス、または相対パスで指定します。相対パスで指定する場合は、``base`` に起点となるコンテントオブジェクトを指定します。

   結果として、:jinja:`{{ content.link(fragment='content_obj')}}` のリストを返します。

   .. code-block:: jinja
      :caption: ./myfolder のアーティクルを検索

      {% set items = contents.get_contents(subdirs=['./myfolder'], base=content) %}


   ``filtes`` は、コンテンツの検索条件を指定します。検索する文書プロパティ名をキー、表示対象のプロパティ値のリストを値とする辞書を指定します。

   省略時は、文書プロパティ ``draft`` が ``false`` かつ ``type`` が ``article`` のコンテントオブジェクトを検索します。

   .. code-block:: jinja
      :caption: カテゴリが 'news' または 'event' のアーティクルを検索

      {% set items = contents.get_contents(filters={'type':['article'], 'draft': [false], 'category': ['news', 'event']}) %}




group_items(group, subdirs=None, base=None, filters=None):
   ``contents.get_contents()`` と同様に、アーティクルを検索します。検索結果は、``group`` で指定するプロパティ名の値で分類します。

   ``subdirs``、``base``、``filters`` の使い方は、``contents.get_contents()`` と同じです。

   戻り値は、

   .. code-block:: python

      [(['プロパティ値1'], [article1, article2,]), 
       (['プロパティ値2'], [article3, article4, article5]),] 

  のように、プロパティ値と該当するコンテントオブジェクトのリストのタプルを要素とするリストを返します。

   .. code-block:: jinja
      :caption: Group articles in '/dir1' directory with 'tags' property

      {% set items = contents.group_items(group='tags', subdirs=['/dir1']) %}
