
.. article::
  :order: 5
  

インデックス
======================

Blogサイトなどでは、新着記事ページや、記事カテゴリ別の一覧ページなど、アーティクルの一覧からなるページが必要となります。Miyadaikuでは、このようなアーティクルの一覧を **インデックスオブジェクト** から作成します。


インデックスオブジェクトは ``contents`` ディレクトリのYAMLファイルに、辞書として定義します。 

.. code-block:: yaml
   :caption: contents/index_ja.yml

   type: index   # YAMLファイルのタイプを index に指定
   indexpage_max_articles: 10  # インデックスページにはアーティクルを10件表示
   filters:      # langが日本語のアーティクルの一覧を作成
     lang: [ja] 


インデックスのプロパティ
------------------------------

インデックスオブジェクトには、:jinja:`{{ page.link_to('./config.rst', text='標準プロパティ', fragment='standardprofs') }}` に加え、以下のプロパティを指定できます。


filters
   表示するアーティクルの検索条件を指定します。検索する文書プロパティ名をキー、表示対象のプロパティ値のリストを値とする辞書を指定します。

   省略時は、``draft`` 以外のすべてのアーティクルを表示します。

   .. code-block:: yaml
      :caption: 'news' または 'event' カテゴリの日本語アーティクルのみを表示

      type: index   # YAMLファイルのタイプを index に指定
      filters:      
        lang: [ja]  # langが日本語
        category: [news, event]  # カテゴリが news または events
  

indexpage_filename_templ
  インデックスの先頭ページのファイル名を、Jina2テンプレートで指定します。未指定の場合は ``'{{page.stem}}.html'`` となります。

   .. code-block:: yaml
      :caption: Sample of indexpage_filename_templ

      type: index
      # 先頭ページのファイル名は `ファイル名_言語.html`、2ページ目以降は `ファイル名_言語_ページ.html`
      indexpage_filename_templ: '{{page.stem}}_{{page.lang}}.html'
      indexpage_filename_templ2: '{{page.stem}}_{{page.lang}}_{{cur_page}}.html'

  テンプレートでは、次の変数を使用できます。

  cur_page
    ページ番号を指定します。

  page
    インデックスページのアーティクルオブジェクト


indexpage_filename_templ2
  インデックスの2ページ目以降のファイル名を、Jina2テンプレートで指定します。未指定の場合は、``'{{page.stem}}_{{cur_page}}.html'`` となります。

  テンプレートでは、``indexpage_filename_templ`` と同じ変数を使用できます。


indexpage_max_articles
  インデックスページに表示する、1ページあたりのアーティクル数を指定します。未指定の場合は ``5`` となります。

indexpage_max_num_pages
  インデックスの最大ページ数を指定します。``0`` の場合は、すべてのページを出力します。未指定の場合は ``0`` となります。


indexpage_template
  インデックスの先頭ページを生成する Jinja2 テンプレート名を指定します。未指定の場合は ``page_index.html`` となります。


indexpage_template2
  インデックスの2ページ目以降を生成する Jinja2 テンプレート名を指定します。未指定の場合は ``page_index.html`` となります。


indexpage_orphan
  最終インデックスページのアーティクル数が ``indexpage_orphan`` 以下なら、新たなページを作成せずに前のページに統合します。

  例えばアーティクルが7件あり、``index_max_page`` が ``3`` なら、3ページ目のアーティクル数は ``1`` となります。この場合、``indexpage_orphan`` が ``1`` なら、3ページ目は生成されず、2ページ目のアーティクル数が ``4`` となります。


type
  YAMLファイルのタイプを指定します。インデックスページの場合は ``index`` を指定します。





グループ別インデックス
-------------------------

アーティクルのカテゴリやタグなど、プロパティ別の一覧を作成する場合は、インデックスオブジェクトの ``groupby`` 属性に対象となるプロパティの名前を指定します。


ex) ``contents/index_category.yml``

.. code-block:: yaml

   type: index   # YAMLファイルのタイプを index に指定
   groupby: category  # カテゴリ別のインデックスを作成


グループ別インデックスのプロパティ
++++++++++++++++++++++++++++++++++++++

グループ別インデックスでは、通常のインデックスに加えて、次のプロパティを指定できます。


groupby
  アーティクルを分類するプロパティの名前を指定します。e.g. ``'tags'``,  ``'category'``

indexpage_group_filename_templ
  インデックスの先頭ページのファイル名を、Jina2テンプレートで指定します。未指定の場合は ``'{{page.stem}}_{{page.groupby}}_{{value}}.html'`` となります。

   .. code-block:: yaml

      type: index
      groupby: tags  # タグ別のインデックスを作成

      # 先頭ページのファイル名は `tags_タグ名.html`、2ページ目以降は `tags_タグ名_ページ.html`
      indexpage_group_filename_templ: 'tags_{{value}}.html'
      indexpage_group_filename_templ2: 'tags_{{value}}_{{cur_page}}.html'

  テンプレートでは、次の変数を使用できます。

  value
    プロパティの値を指定します。

  cur_page
    ページ番号を指定します。

  page
    インデックスページのアーティクルオブジェクト


indexpage_group_filename_templ2
  インデックスの2ページ目以降のファイル名を、Jina2テンプレートで指定します。未指定の場合は ``'{{page.stem}}_{{page.groupby}}_{{value}}_{{cur_page}}.html'`` となります。

  テンプレートでは、``indexpage_group_filename_templ`` と同じ変数を使用できます。


