import bottle
import re
import bottlog

class minify:
    def __init__(self, f):
        self.f = f

    def __call__(self, *args, **kwargs):
        return re.sub(">\s+<", "><", self.f(args, kwargs))

@bottle.get("/")
@bottle.get("/index")
@minify
def root_path():
    with open("index.tpl") as template:
        return bottle.template(template.read())

@bottle.get("/cv")
def cv():
    with open("cv.tpl") as template:
        return bottle.template(template.read())

@bottle.get("/projects")
def cv():
    with open("projects.tpl") as template:
        return bottle.template(template.read())

@bottle.get("/contact")
def cv():
    with open("contact.tpl") as template:
        return bottle.template(template.read())

@bottle.error(404)
def notfound(error):
    with open("404.tpl") as template:
        return bottle.template(template.read())

@bottle.get("/static/<filename:path>")
def static(filename):
    return bottle.static_file(filename, root="static/")

application = bottle.default_app()
application.install(bottlog.apache_logger("server.log"))

if __name__ == "__main__":
    bottle.run(app=application, port=1233, server="paste")
