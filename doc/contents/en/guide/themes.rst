
.. article::
  :order: 110
  

Themes
======================


The theme is Python's package which contains the contents and design of the site. As regular project, ``contents`` directory, ``files`` directory and ``templates`` directory can be used to store contents and templates.


:jinja:`<img src="{{page.path_to('/img/themes.png')}}" width=500px>`


Using themes
------------------

The theme needs to be installed in advance from PyPI or the like, just like a regular package.

.. code-block:: console
   :caption: Install miyadaiku themes with pip

   $ pip install miyadaiku.themes.bootstrap4
   $ pip install miyadaiku.themes.fontawesome



The themes used in the project are specified in ``themes`` of the project configuration file ``config.yml``.

.. code-block:: yaml
   :caption: config.yml: Using two themes in the project

   themes:
       - miyadaiku.themes.bootstrap4
       - miyadaiku.themes.fontawesome


If the theme uses another themes, these themes are loaded recursively. 

The built-in theme ``miyadaiku.themes.base`` is always loaded even if it is not specified in ``themes``.


Templates
-------------------


Templates in themes can also be used just like as templates in the project.

On searching Jinja2 templates, Miyadaiku searches the project's ``templates`` directory at first, then the template directory of themes in use. See  :jinja:`{{content.link_to ("./template.rst", fragment ="template_names")}}` for details.




load_package()
-------------------------

If there is a ``load_package(site)`` function in the theme package, it will be called at startup. If you need to initialize the data within the theme, do it here.


.. code-block:: python
   :caption: sample of __init__.py of theme package

   import os
   def load_package(site)
       # set "os_version" property
       site.config.add('/', {'os_version': os.uname().version})


