
.. article::
  :order: 90
  

Template
======================

Content files in the ``contents`` directory are converted with Jinja2 template file. The templates are created in the ``templates`` directory of the project directory.


Aritcle template
------------------------------

The template applied to the article is specified by the ``article_template`` property. Default template name is ``'page_article.html'``.


Template variable
+++++++++++++++++++++


Within the template, you can refer to the following variables.



page
   Refer to the :jinja:`{{content.link_to('./objects.rst', fragment='content_obj')}}` of the article producing current HTML page. Most article templates get the HTML to render from the ``html`` property of the ``page`` variable.

contents
   Refer to the :jinja:`{{content.link_to('./objects.rst', fragment='contents_collection')}}` of the project.


.. code-block:: jinja
   :caption: Sample of article template:

   <!DOCTYPE html>
   <html lang="{{ page.lang }}">
   <head>
     <meta charset="{{ page.charset }}">
     <title>{{ page.title }}/{{ page.site_title }}</title>
   </head>

   <body>
     {{ page.html }}
   </body>
   </html>



Index template
------------------------------


For an index that produces list of articles, the generated HTML file may be multiple pages. You can specify different templates for the first page, and the second and subsequent pages.

The template of the first page is specified by the ``indexpage_template`` property. Default template name is ``'page_index.html'``.  The template df the second and subsequent pages are specified with the ``indexpage_template2`` property. Default template name is ``'page_index.html'``.


Template variables
+++++++++++++++++++++

Within the template, you can refer to the following variables.

page
   Refer to the :jinja:`{{content.link_to('./objects.rst', fragment='content_obj')}}` of the index producing current HTML page.


contents
   Refer to :jinja:`{{ content.link_to('./objects.rst', fragment='contents_collection') }}` of the project.

cur_page
   Current page number.

is_last
   ``True`` if this is last page, ``False`` otherwise.

articles
   List of :jinja:`{{ content.link_to('./objects.rst', fragment='content_obj') }}` of article to be displayed in the index page.

group_values
   List of property values specified in ``groupby`` property of index.

   e.g. ``['category 1']``



.. code-block:: jinja
   :caption: Sample of index template:

   <!DOCTYPE html>
   <html lang="{{ page.lang }}">
   <head>
     <meta charset="{{ page.charset }}">
     <title>{{ page.site_title }}</title>
   </head>

   <body>
     <h1>
       {{ page.site_title }}
     </h1>
   
     <div>
       {% for article in articles %}
         <h2><a href="{{article.path(article)}}">{{ article.title }}</a></h2>
         <div>{{ article.abstract }}</div>
       {% endfor %}
     </div>
   
     <hr>
     <div>
       {% if cur_page != 1 %}
         <a href="{{content.path(values=group_values, npage=cur_page-1)}}">Prev page</a>
       {% endif %}
       {% if not is_last %}
         <a href="{{content.path(values=group_values, npage=cur_page+1)}}">Next page</a>
       {% endif %}
     </div>
   </body>
   </html>


.. target:: template_names



Template name resolution
---------------------------------------

Miyadaiku searches Jinja2 template in the following order.

1. The project's ``templates`` directory

2. The ``templates`` directory of the package specified as the theme. When multiple themes are specified, search is performed in the specified order.

However, if ``!`` is included in the template name, templates are obtained from the ``templates`` directory of the package which the package name is the left side of ``!``.

e.g.  ``{% import 'miyadaiku.themes.sample.blog!Test.html' %}`` imports ``templates/test.html`` in the ``miyadaiku.themes.sample.blog`` package.


