
.. article::
  :order: 60
  

Config
======================

The config file is a YAML file that specifies default values ​​of document properties.


The default values ​​of properts are specified in the ``config.yml`` file in the root directory.


You can also create a YAML file in a subdirectory within the ``contents`` directory and specify a default value for each directory. Files that satisfy the following conditions in the ``contents`` directory are read as config files.

- Extension of file name is ``.yml``
- ``type`` key value specified as ``config``

As an example, we create two config files ``/dir1/config_dir1.yml`` and ``/dir1/dir2/config_dir2.yml``.

.. code-block:: md
   :caption: contents/dir1/config_dir1.yml

   type: config   # Specify YAML file type as config
   lang: ja       # Set the default value of lang to ja


.. code-block:: md
   :caption: contents/dir1/dir2/config_dir2.yml

   type: config   # Specify YAML file type as config
   category: tutorial # Set the default value of category to tutorial


In the ``/dir1`` directories and below, the article's ``lang`` property defaults to ``ja``.

Also, in the directories under ``/dir1/dir2``, the ``category`` property of the article defaults to ``tutorial``.


.. target:: external_prop_file

External property file
------------------------

To specify properties For content such as articles and images, you can create an external properties file .

The external property file is a YAML file whose file name is ``destination_file_name.props.yml``. You can specify properties even for binary files such as images.


Automatic generation of external property file
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

In articles with the ``generate_metadata_file`` property set to ``true``, external property file for the article is produced if the article does not have a ``date`` property.

