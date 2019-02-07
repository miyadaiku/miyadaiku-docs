
.. article::
  :order: 2


Create a blog site
======================


You can download source files in this tutorial from:

    https://github.com/miyadaiku/miyadaiku-docs/tree/master/samples/first_blog


You can view the created site at:

    https://miyadaiku.github.io/samples/first_blog/index.html



Create a project
-------------------------

At first, create Miyadaiku project to the ``first_blog`` directory with the following command.

.. code-block:: console

   $ miyadaiku-start ./first_blog



Project setting
-------------------------

By default, the project configuration file ``first_blog/config.yml`` file looks like this:

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


Modify ``themes`` in ``first_blog/config.yml`` file to use the built-in theme ``miyadaiku.themes.sample.blog``.


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
   themes:                            # <--- FIX HERE
     - miyadaiku.themes.sample.blog   # <--- FIX HERE


Create an article
-------------------------

Create an  article file ``first_blog/contents/first_entry.rst``.


.. code-block:: rst
   :caption: first_blog/contents/first_entry.rst:

   .. article::
      :date: 2017-01-01
      :category: Category1
      :tags: tag1, tag2

   First entry
   -------------

   This is my first blog entry.


You can rite properties of the article such as blog date and category in the ``article`` role. Here, we specify the date, category, tag of the article.

Create the second article ``first_blog/contents/second_entry.rst`` file.



.. code-block:: rst
   :caption: first_blog/contents/second_entry.rst:

   .. article::
      :date: 2017-01-01
      :category: Category2
      :tags: tag3

   Second entry
   -------------

   This is my second blog entry.



Building the site
-------------------------

Build the site with the following command.

.. code-block:: console

   $ miyadaiku-build ./first_blog


If the command succeeds, the ``first_blog/outputs/index.html`` file will be created.


