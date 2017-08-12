
.. article::
  :order: 50
  

Index
======================

Web sites like blog require index pages, which is a list of articles in the site. Miyadaiku creates index pages from **index object**. 

Index objects are created by YAML file which type is ``index``.  


.. code-block:: yaml
   :caption: contents/index_ja.yml

   type: index   # Set type of YAML file as 'index'
   indexpage_max_articles: 10  # Display 10 article in a page
   filters:      # List articles where lang is 'ja'
     lang: [ja] 

Index object may output multiple pages of HTML file if the article to be displayed does not fit on one page.

.. target:: propertyofindex

Property of index
------------------------------

Index object has following properties, in addition to :jinja:`{{content.link_to('./property.rst', fragment='standardprofs')}}`.


filters
   Specify search criteria for the article to be displayed as a dictionary. The keys of the dictionary are name of property to search, and the values is a list of values to be selected.

   If omitted, all articles whose property `` draft`` is `` true`` are displayed.


   .. code-block:: yaml
      :caption: Display only Japanese articles with category 'news' or 'event'

      type: index   # Set the type of YAML file as index
      filters:      
        lang: [ja]  # Seearch articles where lang is Japanese
        category: [news, event]  # Category is news or event
  

indexpage_filename_templ
  File name of the first page of the index with the Jina2 template. Default value is ``'{{content.stem}}.html'``.

   .. code-block:: yaml
      :caption: Sample of indexpage_filename_templ

      type: index
      indexpage_filename_templ: '{{content.stem}}_{{content.lang}}.html'   # template of first page
      indexpage_filename_templ2: '{{content.stem}}_{{content.lang}}_{{content}}.html' # template of second page

  The following variables can be used in the template.

  cur_page
    Current page number。

  page
    Refers :jinja:`{{ content.link_to('./objects.rst', fragment='content_obj') }}` of the index.


indexpage_filename_templ2
  File name of the second and subsequent pages of the index with the Jina2 template. Default value is ``'{{content.stem}} _{{cur_page}}.html'``.


indexpage_max_articles
  Number of articles to be displayed on the index page per page. Default value is ``5``.

indexpage_max_num_pages
  Maximum number of pages of the index. If ``0``, all pages are output. Default value is ``0``.

indexpage_template
  Name of the Jinja2 template file to generate the first page of the index. Default value is ``page_index.html``.

indexpage_template2
  Name of Jinja2 template file to generate the second and subsequent pages of the index. Default value is ``page_index.html``.

indexpage_orphan
  If the number of articles on the final index page is less than ``indexpage_orphan``, articles on the last page are merged into previous page.

  For example, if there are seven articles and ``index_max_page`` is ``3``, the number of articles on the third page is ``1``. In this case, if ``indexpage_orphan`` is ``1``, ​​the third page is not generated and the number of articles on the second page is ``4``.

type
  Type of YAML file. For index object, specify ``index``.





Grouped index
-------------------------

To create index grouped by property value, specify the name of the property to classify as ``groupby`` property of the index object.


.. code-block:: yaml
   :caption: contents/index_category.yml

   type: index        # Set the type of YAML file as index
   groupby: category  # Create index grouped by category name


Grouped index creates a series of index page for each value of the specified property. In this example, if there are articles with category "catA" and articles with "catB", the index creates two groups of subsequent pages.

- ``index_category_catA.html``、``index_category_catA_2.html``、``index_category_catA_3.html`` ... 

- ``index_category_catB.html``、``index_category_catB_2.html``、``index_category_catB_3.html`` ... 



Property of Grouped index
++++++++++++++++++++++++++++++++++++++

Following properties are available for grouped index in addition to :jinja:`{{content.link(fragment = 'propertyofindex')}}`.


groupby
  Name of the property that classifies the article. Eg ``'category'``

indexpage_group_filename_templ
  File name of the first page of the index with the Jina2 template. Default is ``'{{content.stem}}_{{content.groupby}}_{{value}}.html'``.

   .. code-block:: yaml

      type: index
      groupby: tags  # create index grouped by tags

      indexpage_group_filename_templ: 'tags_{{value}}.html'
      indexpage_group_filename_templ2: 'tags_{{value}}_{{cur_page}}.html'

  The following variables can be used in the template.

  cur_page
    Page number

  groupby
    Name of the property that classifies the article.

  page
     Refer to the :jinja:`{{content.link_to('./objects.rst', fragment='content_obj')}}` of the index.

  value
    Current value of property.


indexpage_group_filename_templ2
  File name of the second page and  subsequent pages of the index with the Jina2 template. Default is ``'{{content.stem}}_{{content.groupby}}_{{value}}_{{cur_page}}.html'``.

  Same variable as ``indexpage_group_filename_templ`` are provided.


