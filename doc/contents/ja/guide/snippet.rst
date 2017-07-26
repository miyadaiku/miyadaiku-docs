
.. article::
  :order: 40
  

スニペット
======================

**スニペットオブジェクト** はアーティクルと同様、`*.rst` ファイルや `*.md` ファイルなどから作成されるコンテンツですが、アーティクルとは異なり、スニペットからはHTMLファイルは生成されません。

スニペットは、独立したHTMLページを作成するためではなく、他のアーティクルなどから読み込んで使用します。


スニペットの作成
-----------------------

スニペットはアーティクルと同様にreStructuredText/Markdown/HTMLなどで作成し、文書プロパティの ``type`` として ``snippet`` を指定します。


- reStructuredTextのスニペット

   .. code-block:: rst
      :caption: Sample of snippet in reST:

      .. article::
         :type: snippet
         :title: Snippet in reST

      This is a snippet in reST.

- Markdownのスニペット

   .. code-block:: md
      :caption: Sample of snippet in Markdown:

      type: snippet
      title: Snippet in Markdown

      This is a snippet in Markdown.

- HTMLのスニペット

   .. code-block:: html
      :caption: Sample of snippet in HTML:

      type: snippet
      title: Snippet in HTML

      <p>This is a snippet in HTML.</p>


スニペットの読み込み
-----------------------

スニペットは、``html`` プロパティを利用して他のアーティクルやテンプレートで表示できます。``title`` などの :jinja:`{{ page.link_to("./article.rst", fragment='propsofarticle') }}` も使用できます。


.. code-block:: rst

   Test article
   -------------

   Emebeded 'snippet.rst' file at same directory.

   :jinja:`{{ page.load('./snippet.rst').html }}`


