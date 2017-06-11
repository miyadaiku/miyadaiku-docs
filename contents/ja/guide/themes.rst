
.. article::
  :order: 8
  

テーマ
======================

Miyadaikuプロジェクトは、Pythonのパッケージを、サイトのコンテンツやデザインなどを再利用するテーマとして使用できます。テーマは、通常のパッケージと同じようように、PyPIなどから事前にインストールする必要があります。

.. code-block:: console
   :caption: Install miyadaiku themes with pip

   $ pip install miyadaiku.themes.bootstrap4
   $ pip install miyadaiku.themes.fontawesome



プロジェクトで使用するテーマは、プロジェクト設定ファイル ``config.yml`` の ``themes`` に指定します。


.. code-block:: yaml
   :caption: config.yml: Using two themes in the project

   themes:
       - miyadaiku.themes.bootstrap4
       - miyadaiku.themes.fontawesome


Miyadaikuの組み込みテーマ ``miyadaiku.themes.base`` は、``themes`` に指定されていなくても常に読み込まれます。

テーマに含まれるファイルは、プロジェクトの通常のファイルと同じように ``outputs`` ディレクトリにコンテンツとして出力されます。また、テーマに含まれるテンプレートも、プロジェクトのテンプレートと同様に使用できます。

:jinja:`<img src="{{page.path_to('/img/themes.png')}}" width=500px>`



load_package()
-------------------------



テーマパッケージに ``load_package(site)`` 関数があれば、起動時に呼び出されます。

.. code-block:: python
   :caption: sample of __init__.py of theme package

   import os
   def load_package(site)
       # set "os_version" property
       site.config.add('/', {'os_version': os.uname().version})
