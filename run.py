import bottle
import bottle_sqlite
import beaker.middleware
import bottlog
import os

@bottle.get("/")
def root_path():
    bottle.redirect("/index")

@bottle.get("/static/<filename:path>")
def static_file(filename):
    return bottle.static_file(filename, root="static/")

@bottle.post("/<filename:path>")
@bottle.get("/<filename:path>")
def render_template(filename, db):
    filename = filename.lstrip("/").rstrip("/")

    session = bottle.request.environ["beaker.session"]

    if os.path.isdir("pages/%s" % filename):
        bottle.redirect("/%s/index" % filename)

    if not os.path.isfile("pages/%s.tpl" % filename):
        bottle.redirect("/404")

    with open("pages/%s.tpl" % filename) as template_file:
        template_data = template_file.read()
    
    return bottle.template(template_data, session=session, database=db)


app = bottle.default_app()
plugin = bottle_sqlite.Plugin(dbfile="db.sqlite")
app.install(plugin)

app.install(bottlog.apache_logger)

app = beaker.middleware.SessionMiddleware(app, {
    "session.type": "file",
    "session.cookie_expires": 60 * 60 * 3,
    "session.auto": True,
    "session.data_dir": "./session"
})

application = app

if __name__ == "__main__":
    bottle.run(app=app, port=1233, server="paste", reloader=True, debug=True)
