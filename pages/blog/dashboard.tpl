%rebase("template.tpl")
%title = "Dashboard - GKBRK.com"

%import bottle
%if "logged_in" not in session:
    %bottle.redirect("login")
%end

<h2 class="text-center">Welcome to your dashboard</h2>
<form class="form-horizontal" action="edit" method="post">
    <div class="form-group">
        <div class="row">
            <div class="col-md-9">
                <input type="text" class="form-control" name="title" placeholder="Post title" />
                <input type="hidden" name="fromdashboard" value="1" />
            </div>
            <div class="col-md-3">
                <input type="submit" class="btn btn-default form-control" value="Create!" />
            </div>
        </div>
    </div>
</form>

<div class="row">
    <div class="col-md-6">
        <h3>Ideas</h3>
    </div>
    <div class="col-md-6">
        <h3>Published posts</h3>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        %i = 0
        %bg = ["bg-success", "bg-info"]
        %for post in database.execute("select * from posts where published_date=0 order by modified_date desc"):
            <div class="{{bg[i%2]}}"><span>{{post["title"]}}</span> - <span>Reads: {{post["reads"]}}</span> - <a href="edit?fromlink=1&url_name={{post["url_name"]}}">Edit</a> - <a href="read?name={{post["url_name"]}}">Read</a> - <a href="delete?name={{post["url_name"]}}">Delete</a></div><br/>
            %i += 1
            %i = i % 2
        %end
    </div>
    <div class="col-md-6">
        %i = 0
        %bg = ["bg-success", "bg-info"]
        %for post in database.execute("select * from posts where published_date > 0 order by published_date desc"):
            <div class="{{bg[i%2]}}"><span>{{post["title"]}}</span> - <span>Reads: {{post["reads"]}}</span> - <a href="edit?fromlink=1&url_name={{post["url_name"]}}">Edit</a> - <a href="read?name={{post["url_name"]}}">Read</a> - <a href="delete?name={{post["url_name"]}}">Delete</a></div><br/>
            %i += 1
            %i = i % 2
        %end
    </div>
</div>