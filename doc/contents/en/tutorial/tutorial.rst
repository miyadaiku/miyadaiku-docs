
.. article::
  :order: 1
  



Create a site
======================

You can download source files in this tutorial from:

   https://github.com/miyadaiku/miyadaiku-docs/tree/master/samples/first_doc

You can view the created site at:

    https://miyadaiku.github.io/samples/first_doc/index.html



.. target:: create_project

Create a project
-------------------------


At first, create Miyadaiku project to the ``first_doc`` directory with the following command.

.. code-block:: console

   $ miyadaiku-start ./first_doc

This command creates following directories.

::

   first_doc/
        ├─── config.yml   YAML file to specify project settings.
        │
        ├─── contents/    Directory to store contents such as reStructuredText/Markdown files.
        │
        ├─── files/       Directory to store files such as images.
        │
        └─── templates/   Directory to store Jinja2 template files.



.. target:: create_article

Create an article
-------------------------


Let's create the your first article in reStructuredText format.



.. code-block:: rst
   :caption: first_doc/contents/hello.rst:

   hello world
   -------------

   This is my first miyadaiku article.



Create a text file with the above contents and save it as ``first_doc/contents/hello.rst``.


.. target:: build

Building the site
-------------------------

After saving the text file, build the site with the following command.

.. code-block:: console

   $ miyadaiku-build ./first_doc


If the command succeeds, the ``first_doc/output/hello.html`` file will be created.


.. target:: createlinks


Article link
-------------------------

Create the another article file ``first_doc/contents/link.rst``.


.. code-block:: rst
   :caption: first_doc/contents/link.rst:

   Link test
   -------------

   This is a link page.

   Link to :jinja:`{{ content.link_to("./hello.rst") }}`.


Let's build the project again.

.. code-block:: console

   $ miyadaiku-build ./first_doc


This command creates ``first_doc/output/link.html`` file.


Content written in the ``:jinja:`` role is processed as ``Jinja2`` template and converted to HTML.


The variable ``content`` is :jinja:`{{content.link_to('../guide/objects.rst', fragment='content_obj')}}` refers to the article being processed. We use the ``link_to(pagename)`` method to create a link to another page. The title of the landing page is used as the text of the link.



.. target:: template


Customizing templates
-------------------------------

Article files are converted to HTML with a Jinja2 template named ``page_article.html``.

As an example, let's create a template ``page_article.html`` in the template directory ``first_doc/templates``.



.. code-block:: jinja
   :caption: first_doc/templates/page_article.html:

   <!-- Extends page_article.html in miyadaiku.themes.base package -->
   {% extends 'miyadaiku.themes.base!page_article.html' %}
   
   <!-- Customize body block -->
   {% block body %}

     <!-- Render contents of the parent block -->
     {{ super() }}

     <!-- Add copyright notation  -->
     <div class="copyright">Copyright(c) 2017 miyadaiku ALL RIGHTS RESERVED.</div>

   {% endblock body %}


Miyadaiku provides `page_article.html <https: //github.com/miyadaiku/miyadaiku/tree/master/miyadaiku/themes/base/templates/page_article.html>`_ file in `miyadaiku.themes.base <https://github.com/miyadaiku/miyadaiku/tree/master/miyadaiku/themes/base/templates>`_ package as default article template. Here, we customize this template with Jinja2's inheritance to create a new template.


To use templates in the ``templates`` directory of the Python package, specify the package name and file name separated by the ``!`` as follows.

    ``package!filename``

In the code above, we wrote

    ``miyadaiku.themes.base!page_article.html``

to refer ``page_article.html`` file in ``miyadaiku.themes.base`` package.


``page_article.html`` has a ``head`` block and a ``body`` block, which generates ``<head>`` element and ``<body>`` element, respectively. In this example, we override the ``body`` block and add copyright notation to the ``body`` element.



.. target:: newfile

Add a CSS file
-------------------------


Files in the ``files/`` directory of the project are copied to the ``outputs`` directory directly without converting them to HTML.

Let's add ``copyright.css`` file to the ``first_doc/files/static/css`` directory.

.. code-block:: CSS
   :caption: first_doc/files/static/css/copyright.css:

   .copyright {
     text-align: right;
   }

Modify the template ``first_doc/templetes/page_article.html`` created in the previous section as follows.


.. code-block:: jinja
   :caption: first_doc/templetes/page_article.html:

   <!-- Extends page_article.html in miyadaiku.themes.base package -->
   {% extends 'miyadaiku.themes.base!page_article.html' %}
   
   <! - Add template - begin ->

   <!-- Customize head block -->
   {% block head %}

     <!-- Render contents of the parent block -->
     {{ super() }}

      <!-- Add link element -->
      <link rel="stylesheet" href="{{ page.path_to('/static/css/copyright.css')}}">
   {% endblock head %}

   <! - Add template - end ->

   <!-- Customize body block -->
   {% block body %}

     <!-- Render contents of the parent block -->
     {{ super() }}

     <!-- Add copyright notation  -->
     <div class="copyright">Copyright(c) 2017 miyadaiku ALL RIGHTS RESERVED.</div>

   {% endblock body %}


We added an override for the ``head`` block and specify the CSS to load with the ``<link>`` element. The ``content.path_to(pagename)`` method returns the path to the page specified.
