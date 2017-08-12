
.. article::
  :order: 100

Object reference
================================

.. blank

.. target:: content_obj

Content object
--------------------------

In Miyadaiku, the files in the ``contents`` directory and the ``files`` directory are loaded as :jinja:`{{ content.link(fragment='content_obj') }}`.  This is true not only for articles and indexes in the ``contents`` directory, but files that are not processed by Miyadaiku such as CSS and image files..


Content object provides attributes listed :jinja:`{{ content.link_to('./property.rst') }}` や :jinja:`{{ content.link_to('./index.rst', fragment='propertyofindex') }}`, and followinng methods.


load(target)
  Load the content object of the path specified by ``target``. ``target`` can be absolute path which starts with ``'/'``, or relative path. 



  .. code-block:: jinja
     :caption: Sample of content.load() method

     <p> Renders abstract of /page1.rst</p>
     
     {{ content.load('/page1.rst').abstract }}  


path(fragment=None, abs_path=False, values=None, npage=None):
  Get the path from the current page. ``target`` can be absolute path which starts with ``'/'``, or relative path.

  ``fragment`` specifies the element id in the page.

  If ``abs_path`` is ``True``, it returns the complete URL starting with the protocol.

  ``values`` specifies the value of the group on the grouped index page. It can be specified only on the index page.

  ``npage`` specifies the landing page number of the index page. It can be specified only on the index page.

  .. code-block:: jinja
     :caption: Sample of content.path() method

     <a href='{{ content.path() }}'>
        Current content</a>


path_to(target, fragment=None, abs_path=False, values=None, npage=None):
  Get the path to the content object specified by ``target``. ``target`` can be absolute path which starts with ``'/'``, or relative path. 

  ``fragment`` specifies the element id in the page.

  If ``abs_path`` is ``True``, it returns the complete URL starting with the protocol.

  ``values`` specifies the value of the group on the grouped index page. It can be specified only on the index page.

  ``npage`` specifies the landing page number of the index page. It can be specified only on the index page.


  .. code-block:: jinja
     :caption: Sample of content.path_to() method

     <a href='{{ page.path_to('../page1.rst') }}'>
        親ディレクトリのpage1.html</a>


link(text=None, fragment=None, abs_path=False, attrs=None, values=None, npage=None):
  Get the ``<a>`` element to link to the object.  

  ``text`` specifies the link text in the ``<a>`` element. If omitted, it is the text of the header element specified by ``fragment``, or the title of the object.

  ``fragment`` specifies the element id in the page.

  If ``abs_path`` is ``True``, it returns the complete URL starting with the protocol.

  ``attrs`` specifies the dictionary of attribute of ``<a>`` elements.

  ``values`` specifies the value of the group on the grouped index page. It can be specified only on the index page.

  ``npage`` specifies the landing page number of the index page. It can be specified only on the index page.

  .. code-block:: jinja
     :caption: Sample of content.link() method

     {{ content.link(fragment="id_in_page",
                     attrs={"class":"class_a", "style":"border:solid;"}) }}



link_to(target, text=None, fragment=None, abs_path=False, attrs=None, values=None, npage=None):
  Get the ``<a>`` element to link to the object specified by ``target``. ``target`` can be absolute path which starts with ``'/'``, or relative path.

  ``text`` specifies the link text in the ``<a>`` element. If omitted, it is the text of the header element specified by ``fragment``, or the title of the object.

  ``fragment`` specifies the element id in the page.

  If ``abs_path`` is ``True``, it returns the complete URL starting with the protocol.

  ``attrs`` specifies the dictionary of attribute of ``<a>`` elements.

  ``values`` specifies the value of the group on the grouped index page. It can be specified only on the index page.

  ``npage`` specifies the landing page number of the index page. It can be specified only on the index page.


  .. code-block:: jinja
     :caption: Sample of content.link_to() method

     {{ content.link_to("../page1.rst", fragment="id_in_page",
                     attrs={"class":"class_a", "style":"border:solid;"}) }}



.. target:: contents_collection

Contents collection
--------------------------


Content collection is the object that manages all contents of Miyadaiku project.


get_content(key, base=None)
  Load the content object of the path specified by ``key``. ``key`` can be absolute path which starts with ``'/'``, or relative path. 

  If ``key`` is relative path,  specify ``base`` as the originating content object.

  .. code-block:: jinja
     :caption: Sample of contents.get_content() method

     Link to 'page1.rst' of the parent directory

     {{ contents.get_content("../page1.rst", base=content) }}


get_contents(subdirs=None, base=None, filters=None)
   Search :jinja:`{{content.link (fragment = 'content_obj')}}` from the collection on the specified condition.


   If you want to retrieve only the content contained in a specific directory, specify a list of directory names in ``subdirs``. The directory name is specified as an absolute path starting with ``/`` or a relative path. If specified as a relative path, specify ``base`` as the originating content object.

   .. code-block:: jinja
      :caption: Search for articles in the ./myfolder 

      {% set items = contents.get_contents(subdirs=['./myfolder'], base=content) %}

   ``Filtes`` specifies search criteria for content. Specify a dictionary whose key is the document property name to be searched and whose value is the list of property values to be displayed. By default, ``get_content()`` searches article object with ``draft`` is ``false``.


   .. code-block:: jinja
      :caption: Search articles with category 'news' or 'event'

      {% set items = contents.get_contents(filters={'type':['artile'], 'category': ['news', 'event']}) %}




group_items(group, subdirs=None, base=None, filters=None):
   Search :jinja:`{{content.link (fragment = 'content_obj')}}` from the collection on the specified condition like ``contents.get_contents()``. Search results are classified by the value of the property name specified by ``group``.


   Return value is list of tuple of property value and list of articles.

   .. code-block:: python
      :caption: Return value of group_items()

      [(['property value 1'], [article1, article2,]), 
       (['property value 2'], [article3, article4, article5]),] 


   Usage of ``subdirs``, ``base``, ``filters`` is the same as ``contents.get_contents ()``.

   .. code-block:: jinja
      :caption: Group articles in '/dir1' directory with 'tags' property

      {% set items = contents.group_items(group='tags', subdirs=['/dir1']) %}


