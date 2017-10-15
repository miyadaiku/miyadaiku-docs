
.. article::
  :order: 80
  

Feed
======================

The Atom / RSS feed is produced with the **feed object**. Feed objects are defined in the YAML file in the `` contents`` directory.


.. code-block:: yaml
   :caption: contents/atom.yml

   type: feed   #  Specify YAML file type as feed
   feedtype: atom  # Create an Atom feed
   feed_num_articles: 10 


In addition to :jinja:`{{ content.link_to('./property.rst', fragment='standardprofs') }}`, you can set the following properties for the feed object.


type
  Specify the type of YAML file. For feed objects, specify ``feed``.

feedtype
  Specify the feed type as ``atom`` or ``rss``. Default value is ``atom``.

feed_num_articles
  Specify the number of articles included in the feed. Default value ``10``.

filename
  File name of feed file. Default value is name of the YAML file with the extension is ``.atom`` or ``.html``.

filters
  Specify search conditions for articles to be registered in the feed. Specify a dictionary whose key is the document property name to be searched and whose value is the list of property values ​​to be displayed.

  If omitted, all articles whose property ``draft`` is ``true`` are displayed.

  .. code-block:: yaml
      :caption: Register only Japanese articles in 'news' or 'event' category

      type: feed
      filters:      
        category: [news, event]
        lang: [ja]
