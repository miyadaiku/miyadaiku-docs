
.. article::
  :order: 3


Implementing breadcrumbs
=============================

In this tutorial, we implement a site with breadcrumb using :jinja:`{{ page.link_to('../guide/config.rst') }}`. To render breadcrumb, we use `Breadclumbs <https://getbootstrap.com/docs/4.3/components/breadcrumb/>`__ of the `Bootstrap4 <https://getbootstrap.com/>`__.


You can download source files in this tutorial from:

    https://github.com/miyadaiku/miyadaiku-docs/tree/master/samples/breadcrumb


You can view the created site at:

    https://miyadaiku.github.io/samples/breadcrumb/index.html



Create a project
-------------------------

At first, create Miyadaiku project to the ``breadcrumb`` directory with the following command.

.. code-block:: console

   $ miyadaiku-start ./breadcrumb



Install Bootstrap4 theme
------------------------------------------

We use `miyadaiku.themes.bootstrap4 <https://github.com/miyadaiku/miyadaiku-themes-bootstrap4>`__ theme to import Bootstrap files. The pip3 command could be used to install ``miyadaiku.themes.bootstrap4``.

.. code-block:: bash

   $ pip3 install miyadaiku.themes.bootstrap4


Project setting
-------------------------



Modify ``themes`` in ``breadcrumb/config.yml`` file to use `miyadaiku.themes.bootstrap4 <https://github.com/miyadaiku/miyadaiku-themes-bootstrap4>`__ theme.


.. code-block:: yaml
   :caption: breadcrumb/config.yml:

   
   # List of site theme
   themes:                            # <--- FIX HERE
     - miyadaiku.themes.bootstrap4    # <--- FIX HERE


Create articles
-------------------------

Create four article files to ``breadcrumb/contents`` directory and ``breadcrumb/contents/child1``.


.. code-block:: rst
   :caption: breadcrumb/contents/index.rst:


   .. article::
      :title: index.rst in the root directory

   This is /index.rst.


.. code-block:: rst
   :caption: breadcrumb/contents/page1.rst:

   .. article::
      :title: page1.rst in the root directory

   This is /page1.rst.


.. code-block:: rst
   :caption: breadcrumb/contents/child1/index.rst:

   .. article::
      :title: index.rst in the child1 directory

   Welcome to the child1.


.. code-block:: rst
   :caption: breadcrumb/contents/child1/child1-2.rst:

   .. article::
      :title: child1-2.rst in the child1 directory

   This is child1-2.rst file in the /child1 directory.


Create configs
-------------------------

:jinja:`{{ page.link_to('../guide/config.rst') }}` is YAML file to specify configuration of the directories.

Create config files to ``breadcrumb/contents`` directory and ``breadcrumb/contents/child1``. The ``foldername`` attribute of the each YAML files are used as caption in the breadcrumbs.

.. code-block:: yaml
   :caption: breadcrumb/contents/root.yml:

   foldername: Root folder


.. code-block:: yaml
   :caption: breadcrumb/contents/child1/child1.yml:

   foldername: Child1 folder


Create template
-------------------------

Create Jinja2 template ``breadcrumb/templates/page_article.html``.

.. code-block:: jinja
   :caption: breadcrumb/templates/page_article.html:

   <!DOCTYPE html>
   <html>
   <head>
     <!-- include boolstrap4 -->
     {{ bootstrap4.load_css(page) }}
  
     <title>{{ page.title }} - {{ page.site_title }}</title>
   </head>

   <body>

   <nav aria-label="breadcrumb">
     <ol class="breadcrumb">

       {% for parent in page.parents_dirs %}
         <li class="breadcrumb-item">
           {{ page.link_to((parent, 'index.rst'),
                            text=config.get(parent, 'foldername')) }}
         </a></li>
       {% endfor %}

       <li class="breadcrumb-item active">
         {{ page.title }}
       </li>
     </ol>
   </nav>

    <div class="container-fluid">
    <div class="row">
       <div class="col-sm">
         {{ page.html }}
       </div>
       <div class="col-sm">
         <ul>
           {% for article in contents.get_contents(subdirs=[page.dirname]) %}
             <li>{{ article.link(text="%s (/%s)" % (
                    article.title,
                    "/".join(article.dirname+(article.name,)))) }}
           {%endfor %}
         </ul>
       </div>
     </div>
   </div>

   </body>
   </html>
   

``bootstrap4.load_css()`` generates ``<link>`` to import CSS file of Bootstrap.

.. code-block:: jinja

   <head>
     <!-- include boolstrap4 -->
     {{ bootstrap4.load_css(page) }}


Following code generates breadcrumb to parent directories. The parent directories of the page could be obtained from ``parents_dirs`` attribute. Link to ``index.rst`` in the each parent directories are output as breadcrumbs.

.. code-block:: jinja

   {% for parent in page.parents_dirs %}
     <li class="breadcrumb-item">
       {{ page.link_to((parent, 'index.rst'),
                        text=config.get(parent, 'foldername')) }}
     </a></li>
   {% endfor %}



The last breadcrumb is a title of the current page.

.. code-block:: jinja

   <li class="breadcrumb-item active">
     {{ page.title }}
   </li>




Building the site
-------------------------

Build the site with the following command.


.. code-block:: console

   $ miyadaiku-build ./breadcrumb


If the command succeeds, the ``breadcrumb/outputs/index.html`` file will be created.

