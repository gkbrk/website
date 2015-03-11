%rebase("template.tpl")
%title = "Blog - GKBRK.com"


%import bottle
%import markdown

%if "name" in bottle.request.params:
    %database.execute("update posts set reads = reads + 1 where url_name=?", (bottle.request.params["name"],))
    %post = database.execute("select * from posts where url_name=?", (bottle.request.params["name"],)).fetchone()
    %if post:
        <div class="panel panel-default">
            <div class="panel-heading">{{post["title"]}} <span class="pull-right">Read {{post["reads"]}} times</span></div>
            <div class="panel-body">{{!markdown.markdown(post["markdown"])}}</div>
            <div class="panel-footer">Thanks for reading my blog.</div>
        </div>
    %else:
        %bottle.redirect("/404")
%end