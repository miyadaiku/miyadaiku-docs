
.. article::
  :order: 20
  

Property
=================

Contents has property values to provide meta data. The syntax to provide properties differ to document format such as reStructuredText, Markdown.


.. target:: standardprofs


Standard properties
----------------------------

Following properties are standard property which are defined for all contents.



abstract
   Short summary of the article. Default is taken from beggining of the HTML of the article. Length of letters taken from HTML is specified by ``abstract_length`` property. 


abstract_length
   Specify the number of characters of the text to be used as ``abstract``. If ``0`` is specified, all the text is used. Default value is ``500`` characters.

article_template
   Name of the Jinja2 template that generates the HTML page of the article. Default value is ``page_article.html``.

cagegory
  Category of content. Default value is ``''``.

canonical_url
  Canonical URL of the content.

  e.g.

  - ``http://www.example.com/a/b/c``

  - ``/index.html``

  - ``/``

  - ``anothername.html``

charset
  Character set of output HTML. Default values is ``'utf-8'``.

date
  Created date of the content. Default value is ``None``.

  e.g.

  - ``2017/01/01``

  - ``2017/01/01 12:00:00``

  - ``2017/01/01 12:00:00 +0900``

.. target:: prop_imports

draft
   ``true`` if the article is unpublished. Default value is ``false``.

ext
   Extension of the article's output file name. Default value is ``'.html'``.

filename
   Specify the output file name. If unspecified, file name is generated with ``filename_templ`` property.

   ``Filename`` can be a relative path. Ex) ``subdir/article1.html``, ``../subdir/article1.html``

filename_templ
   Specify the file name of the output HTML file with Jina 2 template. Default value is ``'{{content.stem}}.{{Content.ext}}'``. In the template you can use :jinja:`{{content.link_to('./article.rst', fragment='jinja_vars')}}`.

generate_metadata_file
   ``true`` if :jinja:`{{ content.link_to('config.rst', fragment='external_prop_file') }}` is produced if the article doesn't has ``date`` property. Default value is ``false``.
   
header
   Returns a list of the header elements of an article. The items of the list are tuples of `(header id, header element name, header text)`. 

html
   Returns an article in HTML.


imports
  File names of templates to be imported as Jinja2 modules. File names are separated by ``,``. Specified modules can be used as :jinja:`{{content.link_to ('./article.rst', fragment='import_templ')}}`.

   e.g.

     ``macro1.html, other.package!macro2.html``

lang
  Language code of output HTML. Default values is ``'en'``.


order
  Numeric order of the content. Default value is ``0``.

parents_dirs
  Readonly property returns list of parent directories of the content. The ``parent_dirs`` property of the article at ``/dir1/dir2/article.rst`` is

    ``[(), ('dir1'), ('dir1', 'dir2')]``

site_title
  Title of the site. Defautl value is ``'(FIXME - site_title)'``.

site_url
  Base URL of the site. Defautl value is ``'http://localhost:8888'``.

stem
  Specify the output file name without extension of the article. Default value is file name of source article  without extension.

tags
  Tags of the content, separeted by ``,``. Default value is ``''``.

timezone
  Timezone of the content. e.g. ``'Europe/Warsaw'``, ``'Asia/Tokyo'``

  Default is taken from the platform.

title
  Title of the content. Default value is ``''``.

url
  Url of the content. Default value is ``site_url`` + ``path_from_the_root``.

