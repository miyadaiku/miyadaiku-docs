
.. article::
  :order: 40
  

Snippet
======================

As article object, **Snippet objects** are created from source files in the ``contents`` directory. But unlike article, snippet does not produce HTML file. Snippets are intended to be embedded in the another article objects.



Create snipprt
-----------------------

As with articles, snippets are created with reStructuredText / Markdown / HTML etc., with a ``type`` property set to ``snippet``.


- Snippet in reStructuredText

   .. code-block:: rst
      :caption: Sample of snippet in reST:

      .. article::
         :type: snippet
         :title: Snippet in reST

      This is a snippet in reST.

- Snippet in Markdown

   .. code-block:: md
      :caption: Sample of snippet in Markdown:

      type: snippet
      title: Snippet in Markdown

      This is a snippet in Markdown.

- Snippet in HTML

   .. code-block:: html
      :caption: Sample of snippet in HTML:

      type: snippet
      title: Snippet in HTML

      <p>This is a snippet in HTML.</p>



Loading snippet
-----------------------

Snippets can be displayed with in other articles or templates using the ``html`` property.


.. code-block:: rst

   Test article
   -------------

   Emebeded 'snippet.rst' file at same directory.

   :jinja:`{{ content.load('./snippet.rst').html }}`


