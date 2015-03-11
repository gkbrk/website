%rebase("template.tpl")
%title = "Login - GKBRK.com"

%import bottle
%if bottle.request.method == "POST":
    %if "password" in bottle.request.forms and bottle.request.forms["password"] == database.execute("select * from settings_store where key=?", ("blog_password",)).fetchone()["value"]:
        %session["logged_in"] = True
        %bottle.redirect("dashboard")
    %else:
        <h2>Sorry. Wrong password.</h2>
        <a href="login">Try again.</a>
    %end
%else:
    %if "logged_in" in session:
        <h2>You are already logged in. Logging you out.</h2>
        %del session["logged_in"]
    %else:
        <h2>Log in to the blog</h2>
        <form class="form-horizontal" action="login" method="post">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-9">
                        <input type="password" class="form-control" name="password" placeholder="Super secret password" />
                    </div>
                    <div class="col-md-3">
                        <input type="submit" class="btn btn-default form-control" value="Log in!" />
                    </div>
                </div>
            </div>
        </form>
    %end
%end