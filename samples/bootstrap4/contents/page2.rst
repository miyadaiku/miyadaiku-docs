
Tooltip sample
---------------------------

.. jinja::

   {% macro tooltip(text, tooltip) -%}
     <a href="#" style='font-size:40px;' data-toggle="tooltip" title="{{ tooltip }}">{{text}}</a>
   {%- endmacro %}

Hover mouse :jinja:`{{tooltip("HERE", "This is tooltip text")}}` for tooltip.


