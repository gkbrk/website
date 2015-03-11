%rebase("template.tpl")
%title = "Edit blog post - GKBRK.com"

%import bottle
%import time

%if "logged_in" not in session:
    %bottle.redirect("login")
%end

%if "fromlink" not in bottle.request.params and "fromdashboard" not in bottle.request.params and "fromsave" not in bottle.request.params:
    %bottle.redirect("dashboard")
%end

%if "url_name" in bottle.request.params:
    %url_name = bottle.request.params["url_name"]
%else:
    %url_name = bottle.request.params["title"].lower().replace(" ", "_").replace(".", "_")
%end

%post = database.execute("select * from posts where url_name=?", (url_name,)).fetchone()

%if "fromsave" in bottle.request.params:
    %publish_date = 0
    %if "publish" in bottle.request.params:
        %publish_date = int(time.time())
    %end
    %if post:
        %database.execute("update posts set url_name=?, title=?, published_date=?, modified_date=?, markdown=? where url_name=?", (bottle.request.params["url_name"], bottle.request.params["title"], publish_date, int(time.time()), bottle.request.params["content"], bottle.request.params["url_name"],))
    %else:
        %database.execute("insert into posts values (?,?,?,?,?,?)", (bottle.request.params["url_name"], bottle.request.params["title"], publish_date, int(time.time()), 0, bottle.request.params["content"],))
    %end
    %bottle.redirect("dashboard")
%end

<%post_dict = {
    "title": bottle.request.params.get("title", ""),
    "url_name": url_name,
    "markdown": "",
    "publish": ""
}
%>

%if post:
    %post_dict["title"] = post["title"]
    %post_dict["url_name"] = post["url_name"]
    %post_dict["markdown"] = post["markdown"]
    %if post["published_date"] > 0:
        %post_dict["publish"] = "checked"
    %end
%end

<script type="text/javascript" src="/static/js/showdown.js"></script>

<h3 class="text-center">Create and shape your idea here</h3>

<form class="form-horizontal" action="edit" method="post">
    <div class="form-group">
        <input type="text" class="form-control" name="title" placeholder="Post title" value="{{post_dict['title']}}" />
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="url_name" placeholder="URL alias" value="{{post_dict['url_name']}}" />
    </div>
    <div class="form-group">
        <div class="row">
            <div class="col-md-6">
                <textarea class="form-control" id="markdown" name="content">{{post_dict["markdown"]}}</textarea>
            </div>
            <script>
                var resize = function (){
                    var box = document.getElementById("markdown");
                    box.style.height = 'auto';
                    box.style.height = box.scrollHeight + (box.offsetHeight - box.clientHeight) +'px'; 
                };

                var update_markdown = function (){
                    var converter = new Showdown.converter();
                    var box = document.getElementById("markdown");
                    var preview = document.getElementById("preview");
                    
                    preview.innerHTML = converter.makeHtml(box.value);
                };

                var update = function (){
                    resize();
                    update_markdown();
                };

                document.getElementById("markdown").onkeyup = update;
                window.onload = update;
            </script>
            <div class="col-md-6" id="preview">
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="row">
            <div class="col-md-2">
                <div class="checkbox">
                    <label><input type="checkbox" value="" name="publish" {{post_dict["publish"]}}/>Publish</label>
                </div>
            </div>
            <div class="col-md-10">
                <input type="submit" class="btn btn-default form-control" value="Save idea!" name="fromsave" />
            </div>
        </div>
    </div>
</form>