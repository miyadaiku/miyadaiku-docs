
.. article::
  :order: 110
  

Themes
======================


The theme is Python's package which contains the contents and design of the site. Files included in the theme are used to generate outputs just like regular contents in project.

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


If the theme uses an another theme, that theme is recursively loaded. 

Miyadaiku's built-in theme ``miyadaiku.themes.base`` is always loaded even if it is not specified in ``themes``.


Templates
-------------------


Templates included in themes can also be used like templates in the project.

If you specify a template name in the article's template name, Miyadaiku search the project's ``templates`` directory, then the template directory from the theme in use. See  :jinja:`{{content.link_to ("./template.rst", fragment ="template_names")}}` for details.




load_package()
-------------------------

If there is a `` load_package (site) `` in the theme package, it will be called at startup. If you need to initialize the data within the theme, do it here.


.. code-block:: python
   :caption: sample of __init__.py of theme package

   import os
   def load_package(site)
       # set "os_version" property
       site.config.add('/', {'os_version': os.uname().version})


