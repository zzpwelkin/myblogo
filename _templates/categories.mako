##
## Category list

${self.category(categories_all)}

<%def name="category(categories)">
<ul>
% for c in categories:
	<li><a href="${c[0].path}">${c[0]} (${c[1]})</a><li>	
% endfor
</ul>	
</%def>
