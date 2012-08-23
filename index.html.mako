<%inherit file="_templates/site.mako" />
<div> 
	<ul>
		% for post in bf.config.blog.posts[:10]:
			<li><a href="${post.path}">${post.title}</a></li>
		% endfor
	</ul>
</div>
<hr>
<div id="photo_gallery">
<table>
<tr>
<% 
    import os
    photos_dir = bf.util.fs_site_path_helper(bf.config.photo_gallery_dir)
    photos = os.listdir(photos_dir)
%>
%for photo in photos:
	<td><a href="${photos_dir}/${photo}.html">
		<img src="${photos_dir}/${photo}" height="80px" width="80px"> </a></td>
%endfor
</tr>
</table>
</div>
