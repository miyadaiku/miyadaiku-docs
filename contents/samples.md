# サンプル


:jinja:` 
{% macro sample(content, title) -%}
<div class='samplebox'>
  <a target='_blank' href='{{ "https://github.com/miyadaiku/miyadaiku-docs/tree/master/samples/" + title }}'><i class="fab fa-github" aria-hidden="true"></i>{{ title }}</a><br>
  <a target='_blank' href='{{"../samples/" + title + "/index.html"}}'>
    <img src='{{content.path_to("/static/miyadaiku_docs/img/samples/"+title+".png")}}'>
  </a>
</div>
{%- endmacro %}
`

<div class="samples" markdown=1>

:jinja:`{{ sample(content, 'newblog') }}`

:jinja:`{{ sample(content, 'bootstrap4') }}`

:jinja:`{{ sample(content, 'ipynb') }}`

:jinja:`{{ sample(content, 'first_blog') }}`

:jinja:`{{ sample(content, 'breadcrumb') }}`

:jinja:`{{ sample(content, 'first_doc') }}`

:jinja:`{{ sample(content, 'jquery') }}`

:jinja:`{{ sample(content, 'simple') }}`

:jinja:`{{ sample(content, 'simpletemplate') }}`

</div>


