%rebase("template.tpl")
%title = "Blog - GKBRK.com"

%import markdown

<h2>My latest blog posts <a href="dashboard" class="pull-right">Admin Area</a></h2>

%for post in database.execute("select * from posts where published_date > 0 order by published_date limit 5"):
    <div class="panel panel-default">
        <div class="panel-heading">{{post["title"]}} <span class="pull-right">Read {{post["reads"]}} times</span></div>
        <div class="panel-body">{{!markdown.markdown(post["markdown"][:500])}}...</div>
        <div class="panel-footer"><a href="read?name={{post["url_name"]}}" class="text-muted">Read the full blog post</a></div>
    </div>
%end