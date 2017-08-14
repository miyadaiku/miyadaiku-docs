
.. article::
  :order: 60
  

コンフィグ
======================

コンフィグファイルは、Miyadaikuプロジェクト全体の設定や、文書プロパティのデフォルト値の指定する YAMLファイルです。


アーティクルやインデックスなどのプロパティのデフォルト値は、ルートディレクトリの ``config.yml`` ファイルで指定します。

また、``contents`` ディレクトリ内のサブディレクトリにYAMLファイルを作成し、ディレクトリ別のデフォルト値を指定できます。``contents`` ディレクトリ内の、以下の条件を満たすファイルは、コンフィグファイルとして読み込まれます。

- 拡張子が ``.yml`` である
- ``type`` キーの値が ``config`` と指定されている

例として、``/dir1/config_dir1.yml`` と ``/dir1/dir2/config_dir2.yml`` の2つのコンフィグファイルを作成します。

.. code-block:: md
   :caption: contents/dir1/config_dir1.yml

   type: config   # YAMLファイルのタイプを config に指定
   lang: ja       # lang のデフォルト値を ja に設定


.. code-block:: md
   :caption: contents/dir1/dir2/config_dir2.yml

   type: config   # YAMLファイルのタイプを config に指定
   category: tutorial # categoryのデフォルト値を tutorial に設定


``/dir1`` 以下のディレクトリでは、アーティクルの ``lang`` プロパティは ``ja`` がデフォルト値となります。

また、``/dir1/dir2`` 以下のディレクトリでは、アーティクルの ``category`` プロパティは ``tutorial`` がデフォルト値となります。



.. target:: external_prop_file

外部プロパティファイル
------------------------

アーティクル・画像などのコンテンツは、外部プロパティファイルを作成してプロパティを指定できます。

外部プロパティファイルは、ファイル名が ``設定先ファイル名 + props.yml`` という名前のYAMLファイルで、画像などのバイナリファイルでもプロパティを指定できます。

外部プロパティファイルの自動生成
+++++++++++++++++++++++++++++++++++++

``generate_metadata_file`` プロパティが ``true`` のアーティクルでは、アーティクルに ``date`` プロパティが指定されていない場合、自動的に外部プロパティファイルが作成されます。


