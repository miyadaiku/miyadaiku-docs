
.. article::
  :order: 80
  

フィード
======================

Atom/RSSフィードは、**フィードオブジェクト** で作成します。フィードオブジェクトは ``contents`` ディレクトリのYAMLファイルで定義します。 

.. code-block:: yaml
   :caption: contents/atom.yml

   type: feed   # YAMLファイルのタイプを feed に指定
   feedtype: atom  # Atomフィードを作成
   feed_num_articles: 10


フィードオブジェクトには、:jinja:`{{ content.link_to('./property.rst', fragment='standardprofs') }}` に加え、以下のプロパティを設定できます。

type
  YAMLファイルのタイプを指定します。インデックスページの場合は ``feed`` を指定します。

feedtype
  フィードの種類を、``atom`` または ``rss`` で指定します。未指定の場合は ``atom`` となります。

feed_num_articles
  フィードに含まれるアーティクルの数を指定します。未指定の場合は ``10`` となります。

filename
  出力ファイル名を指定します。未指定の場合は、YAMLファイルの拡張子を ``.atom`` または ``.html`` としたファイルを作成します。

filters
   フィードに登録するアーティクルの検索条件を指定します。検索する文書プロパティ名をキー、表示対象のプロパティ値のリストを値とする辞書を指定します。

   省略時は、プロパティ ``draft`` が ``true`` の、すべてのアーティクルを表示します。

   .. code-block:: yaml
      :caption: 'news' または 'event' カテゴリの日本語アーティクルのみを登録する

      type: feed   # YAMLファイルのタイプを index に指定
      filters:      
        category: [news, event]  # カテゴリが 'news' または 'events'  
        lang: [ja]
