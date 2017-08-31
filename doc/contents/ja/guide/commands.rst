
.. article::
  :order: 120
  

コマンド
======================

miyadaku-build
-------------------

Miyadaikuプロジェクトからサイトを構築します。

.. code-block:: text

    $ miyadaiku-build --help
    usage: miyadaiku-build [-h] [--define property=value] [--debug] [--rebuild]
                           [--watch] [--server] [--port PORT] [--bind BIND]
                           directory

    Build miyadaiku project.

    positional arguments:
      directory             directory name

    optional arguments:
      -h, --help            show this help message and exit
      --define property=value, -d property=value
                            Set default property value.
      --debug, -D           Show debug message
      --rebuild, -r         Rebuild contents.
      --watch, -w           Watch for contents update.
      --server, -s          Run http server.
      --port PORT, -p PORT  http port
      --bind BIND, -b BIND  bind address



``--define``

    ``config.yml`` ファイルのプロパティを上書きできます。``--define`` オプションは複数指定可能です。

    .. code-block:: console
    
       $ miyadaiku-build --define prop1=value1 --define prop2=value2 .
    
``--debug`` 

    詳細なエラー情報を出力します。

``--rebuild``

    更新されたファイルだけではなく、すべてのファイルを更新します。

``--watch``

   コンテンツ・テンプレートなどの変更を監視し、変更を検出すると自動的にファイルを更新します。``Ctrl+C`` で終了します。

``--server``

   HTMLファイルをブラウザから表示するためのHTTPサーバを起動します。デフォルトでは、

       ``http://localhost:8800``  

   で表示できます。 ``Ctrl+C`` で終了します。


``--port``

   HTTPサーバで使用するポートを指定します。未指定時は ``8800`` です。

``--bind``

   HTTPサーバでバインドするアドレスを指定します。未指定時はすべてのアドレスにバインドします。


