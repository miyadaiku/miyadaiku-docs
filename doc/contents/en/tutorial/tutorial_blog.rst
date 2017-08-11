
.. article::
  :order: 2


Blogサイトの作成
======================


このチュートリアルで作成するソースコードは、

    https://github.com/miyadaiku/miyadaiku-docs/tree/master/samples/first_blog

からダウンロードできます。


プロジェクトの作成
-------------------------

はじめに、次のコマンドで ``first_blog`` ディレクトリに ``miyadaiku`` のプロジェクトを作成します

.. code-block:: console

   $ miyadaiku-start ./first_blog



プロジェクト設定
-------------------------

初期設定では、プロジェクト設定ファイル ``first_blog/config.yml`` ファイルは次のようになっています。

.. code-block:: yaml
   :caption: first_blog/config.yml:

   # Miyadaiku config file

   # Base URL of the site
   site_url: http://localhost:8888/

   # Title of the site
   site_title: FIXME - site title

   # Default language code
   lang: ja-JP

   # Default charset
   charset: utf-8

   # Default timezone
   timezone: Asia/Tokyo

   # List of site theme
   # themes:
   #   - miyadaiku.themes.sample.blog


``first_blog/config.yml`` の ``themes`` を修正し、組み込みテーマ ``miyadaiku.themes.sample.blog`` を使用するように設定します。

.. code-block:: yaml
   :caption: first_blog/config.yml:

   # Title of the site
   site_title: FIXME - site title

   # Default language code
   lang: ja

   # Default charset
   charset: utf-8

   # Default timezone
   timezone: Asia/Tokyo

   # List of site theme
   themes:                            # <--- この行を修正
     - miyadaiku.themes.sample.blog   # <--- この行を修正


記事の作成
-------------------------

ブログの記事として、``first_blog/contents/first_entry.rst`` ファイルを作成します。


.. code-block:: rst
   :caption: first_blog/contents/first_entry.rst:

   .. article::
      :date: 2017-01-01
      :category: カテゴリ1
      :tags: タグ1, タグ2

   First entry
   -------------

   This is my first blog entry.


ブログの日付、カテゴリなどのプロパティを、``article`` ロールに記述します。ここでは、記事の日付、カテゴリ、タグを指定しています。

同様に、二つ目の記事 ``first_blog/contents/second_entry.rst`` ファイルを作成します。


.. code-block:: rst
   :caption: first_blog/contents/second_entry.rst:

   .. article::
      :date: 2017-01-01
      :category: カテゴリ2
      :tags: タグ3

   Second entry
   -------------

   This is my second blog entry.



サイトのビルド
-------------------------

次のコマンドでサイトをビルドします。


.. code-block:: console

   $ miyadaiku-build ./first_blog


正常に終了すると、``first_blog/outputs/index.html`` にBlogが出力されます。

