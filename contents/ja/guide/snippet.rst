
.. article::
  :order: 4
  

スニペット
======================

**スニペットオブジェクト** はアーティクルと同様、`*.rst` ファイルや `*.md` ファイルなどから作成されるコンテンツですが、アーティクルとは異なり、スニペットからはHTMLファイルは生成されません。

スニペットは、独立したHTMLページを作成するためではなく、他のアーティクルなどから読み込んで使用します。


スニペットの作成
-----------------------

スニペットはアーティクルと同様にreStructuredText/Markdown/HTMLなどで作成し、文書プロパティの ``type`` として ``snippet`` を指定します。


- reStructuredTextのスニペット

   .. code-block:: rst

      .. article::
         :type: snippet

      This is a snippet in reST.

- Markdownのスニペット

   .. code-block:: md

      type: snippet

      This is a snippet in Markdown.

- HTMLのスニペット

   .. code-block:: html

      type: snippet

      <p>This is a snippet in Markdown.</p>


スニペットの読み込み
-----------------------

スニペットの内容は、``html`` プロパティで取得できます。他のアーティクルやJinaテンプレートにスニペットの内容を書き込む場合は、次のように記述します。

.. code-block:: rst

   Test article
   -------------

   Emebeded 'snippet.rst' file at same directory.

   :jinja:`{{ page.get_content('./snippet.rst').html }}`


