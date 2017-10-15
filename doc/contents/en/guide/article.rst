
.. article::
  :order: 30
  

Article
======================

Following type of files in the ``contents`` directory are processed as **article object**.

- reStructuredText
- Markdown
- HTML
- ipynb

Article objects are converted to HTML and written to the ``outputs`` directory.


reStructuredText
----------------------------

Files with the extension ``.rst`` are converted to HTML by the `reStructuredText parser <http://docutils.sourceforge.net/>`_.

.. code-block:: rst
   :caption: Sample of article in reStructuredText:


   Title of the article
   ------------------------------

   My first article in reStructuredText.


As in this example above, a header at the beginning of the document is used as the `title` property of the document. The `title` property can also be specified with the` `article` directive.

Miyadaiku provides `directives <http://docutils.sourceforge.net/docs/ref/rst/directives.html>`_ and `roles <http://docutils.sourceforge.net/docs/ref/rst /roles.html>`_ for rst to specifying propertie, to embedding Jinja2 templates, etc.



Article drective
+++++++++++++++++++++++

The ``article`` directive specifies the properties of the article.

.. code-block:: rst
   :caption: Article directive in reStructuredText:

   .. article::
      :date: 2017-01-01
      :title: Title of the article
      :category: category1
      :tags: tag1, tag2


   Sample of article directive
   -----------------------------------

   This is a miyadaiku article in reST.


In this example, ``date``, ``title``, ``category``, ``tags`` properties are specified.

You can specify any item as a property. For property, see :jinja:`{{ content.link_to('./property.rst') }}` for detail.


.. target:: jinjadirective

Jinja directive
++++++++++++++++++++++++++++++++++++++++++++++

The contents written in the ``jinja`` directive are converted to HTML by the Jinja2 template engine. In the template you can reference :jinja:`{{content.link (fragment = 'jinja_vars')}}`.


.. code-block:: rst
   :caption: Sample of Jinja directive in reST:

   Properties of this document

   -----------------------------------

   .. jinja::

      <ul>
        <li> Category is {{ content.category }} </li>
        <li> Tags are {{ ', '.join(content.tags) }} </li>
        <li> Date is {{ content.date.strftime('%Y-%m-%d') }} </li>
      </ul>




Jinja role
++++++++++++++++++++++++++++++++++++++++++++++

The string specified in the ``:jinja:`` role is converted to HTML by the Jinja2 template engine. In the template you can reference :jinja:`{{content.link(fragment='jinja_vars')}}`.

.. code-block:: rst
   :caption: Sample of Jinja role in reST:

   Link test
   -------------

   Link to :jinja:`{{ content.link_to("./hello.rst") }}`.




Code-block directive
+++++++++++++++++++++++++++++

Source code in the ``code-block`` directive is syntax highlighted by `Pygments <http://pygments.org/>`_. You can specify a language as an argument. e.g.  ``.. code-block :: lang``.


.. code-block:: rst
   :caption: Sample of code-block directive:

   .. code-block:: python
      :caption: sample python code
      
      def test():
         pass

.. target:: targetdirective


Target directive
+++++++++++++++++++++++

Creates the ``<div>`` element with ``id`` attribute to be specified as the target of the link.

.. code-block:: rst
   :caption: Sample of target role:

   .. target:: id_of_this_section1

   Section I
   -------------------

   Body of section I.

   Section II
   ------------------

   Link to :jinja:`content.link(fragment='id_of_this_section1')`.



Markdown
----------------------------

Files with the extension ``.md`` are converted to HTML by the `Markdown module <https://pypi.python.org/pypi/Markdown>`_.

By default, `Extra extension <http://pythonhosted.org/Markdown/extensions/extra.html>`_ of the the Markdown module is enabled.



Property
+++++++++++++++++++++++

You can specify the property name and property value at the beginning of the document file.


.. code-block:: md
   :caption: Sample of document properties in Markdown:

   date: 2017-01-01
   title: Title of document
   category: category1
   tags: tag1, tag2

   # Miyadaiku article

   This is a Miyadaiku article in Markdown.
  


Property values are specified one per line, separating property name and value with ``:``.


Jinja2 template
++++++++++++++++++++++++++

Jinja2 templated can be written in the form **:jinja:`Jinja 2 tag`**. `Jinja2 tag` can contain newlines.

.. code-block:: md
   :caption: Sample of Jinja role in Markdown:

   # Link test

   Link to :jinja:`{{ content.link_to("./hello.rst") }}`.



Target
+++++++++++++++++++++++

**\:target:`id_of_div`** creates the ``<div>`` element with ``id`` attribute to be specified as the target of the link.


.. code-block:: md
   :caption: Sample of target :

   :target:`id_of_this_section1`

   # Section I

   Body of section I.

   # Section II

   Link to :jinja:`content.link_to(content, fragment='id_of_this_section1')`.



HTML
----------------------------

Files with the extension ``.html`` is read as an HTML file with the document properties specified at the beginning of the document, and outputted as HTML by the Jinja2 template engine.


Property
+++++++++++++++++++++++


You can specify the property name and property value at the beginning of the document file.


.. code-block:: html
   :caption: Sample of document properties in HTML:

   date: 2017-01-01
   title: Document title
   category: Category1
   tags: Tag1, Tag2

   <p>This is a HTML file</p>


Property values are specified one per line, separating property name and value with ``:``.


Jinja2 template
++++++++++++++++++++++++++


HTML files are processed by Jinja2 template engine. Jinja2 tags can be used in the HTML files.

.. code-block:: html
   :caption: Sample of Jinja template in HTML:

   <p>Link to <a href='{{ content.link_to("./hello.rst") }}'>hello</a></p>



Jupyter notebook
----------------------------

Files with extension ".ipynb" are read as `Jupyter notebook <http://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/>`_.

Property
+++++++++++++++

Jupyter notebook properties are specified as :jinja:`{{content.link_to('./config.rst', fragment= 'external_prop_file')}}` or as notebook metadata.


Jupyter notebook metadata settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Select **Edit -> Edit Notebook Metadata** on the Jupyter.

   :jinja:`<img src="{{content.path_to('/img/jupyter-metadata.png')}}" width=400px>`


2. Add the ``miyadaiku`` key to JSON and specify the property value. The following example specifies the ``title`` property and ``date`` property.

   .. code-block:: json
      :caption: Sample property of Jupyter notebook:
   
      {
        "kernelspec": {
          "name": "python3",
          "display_name": "Python 3",

          "": 
          " ommit inrelevant lines"
          " ... "
          " ... "
   
        "miyadaiku": {
          "title": "Title of Jupyter notebook",
          "date": "2017-01-01",
        }
      }


.. target:: jinja_vars

Template variables
-----------------------------------


In the Jinja2 templates, following variables can be used to refer articles.

content
   Refer to the :jinja:`{{content.link_to('./objects.rst', fragment='content_obj')}}` of current article.

page
   Refer to the :jinja:`{{content.link_to('./objects.rst', fragment='content_obj')}}` of the article producing current HTML page.

contents
   Refer to the :jinja:`{{content.link_to('./objects.rst', fragment='contents_collection')}}` of the project.




Content and page
+++++++++++++++++++++++

When converting an article to HTML, in the Jinja 2 template, the variables ``content`` and ``page`` both refer to the same article object currently being processed. In this case ``content`` and ``page`` refer to the same object.

However, if the article is loaded by another article, variable ``page`` refers the article of the current HTML page, and the variable ``content`` refers the article being loaded.


.. code-block:: jinja
   :caption: parent.rst:

   This is parent.rst

   page: {{ page.name }}
   content: {{ content.name }}

   ---

   {{ content.load('./child.rst').html }}


.. code-block:: jinja
   :caption: child.rst:

   This is child.rst

   page: {{ page.name }}
   content: {{ content.name }}


When converting ``parent.rst`` to HTML, ``{{content.load('./child.rst').html}}`` loads ``child.rst``.


In this case, in the template in ``parent.rst``,

- ``page`` refers  ``parent.rst`` object
- ``content`` refers ``parent.rst`` object


In the template in ``child.rst``

- ``page`` refers ``parent.rst`` object
- ``content`` refers ``child.rst`` object


.. target:: import_templ


Imported template
+++++++++++++++++++++++


The Jinja2 template specified in the :jinja:`{{content.link_to ('./property.rst', fragment='prop_imports', text='imports property')}}`  are `imported <http://jinja.pocoo.org/docs/2.9/templates/#import>`_. The module name of the template is the file name excluding the extension of the name of the template.



.. code-block:: rst
   :caption: Using Jinja2 macros:

   .. article::
      :imports: my_template.html

   Imports my_template.html and use my_macro()

   {{ my_template.my_macro() }}





