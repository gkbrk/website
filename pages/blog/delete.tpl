%import bottle

%if "logged_in" not in session:
    %bottle.redirect("login")
%end

%if "name" in bottle.request.params:
    %database.execute("delete from posts where url_name=?", (bottle.request.params["name"],))

%bottle.redirect("dashboard")