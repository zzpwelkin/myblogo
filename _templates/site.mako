<%inherit file="base.mako" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    ${self.head()}
    <link rel='stylesheet' href='${bf.config.site.url}css/base.css' type='text/css' />
  </head>
  <body>
    <div class="header" id="content">
      ${self.header()}
      <div id="main_block">
	<!-- 分类列表 -->
	<div class="categorysidebar" id="category">
	  <ul>
<%
    posts = bf.config.blog.posts
    categories = set()
    all_categories = []
    categorized_posts={}
    for post in posts:
        categories.update(post.categories)
    for category in categories:
        category_posts = [post for post in posts
                            if category in post.categories]
        categorized_posts[category] = category_posts
    for category, posts in sorted(
        categorized_posts.items()):
        all_categories.append((category, len(posts)))
%>
		% for c in all_categories:
		  <li><a href="${c[0].path}">${c[0]} (${c[1]})</a><li>	
		% endfor
	  </ul>
	</div>
	
	<!-- 内容体 -->
        <div class="post" id="post_block">
          ${next.body()}
        </div><!-- End Prose Block -->
      </div><!-- End Main Block -->
      <div class="footer" id="footer">
        ${self.footer()}
      </div> <!-- End Footer -->
    </div> <!-- End Content -->
  </body>
</html>
<%def name="head()">
  <%include file="myhead.mako" />
</%def>
<%def name="header()">
  <%include file="myheader.mako" />
</%def>
<%def name="footer()">
  <hr/>
  <%include file="myfooter.mako" />
</%def>
