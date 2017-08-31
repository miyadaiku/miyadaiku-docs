
.. article::
  :order: 120
  

Commands
======================

miyadaku-build
-------------------

Build a site from the Miyadaiku project.


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

    You can override the properties of the ``config.yml`` file. More than one `--define` option can be specified.

    .. code-block:: console
    
       $ miyadaiku-build --define prop1=value1 --define prop2=value2 .
    
``--debug``

    Show detailed error message.

``--rebuild``

    Rebuild all files.

``--watch``

   Watch changes on contents and templates and updates files when it detected. Exit with ``Ctrl+C``.

``--server``

   Start the HTTP server for displaying the HTML file from the browser. The default URL would be

       ``http://localhost:8800``

   Exit with ``Ctrl+C``.


``--port``

   Specify the port used by the HTTP server. Default is ``8800``.

``--bind``

   Specify the address to be bound on the HTTP server. When not specified, it binds to all addresses.
