import bottle
import bottlog

@bottle.get("/")
@bottle.get("/index")
def root_path():
    with open("index.tpl") as template:
        return bottle.template(template.read())

@bottle.get("/cv")
def cv():
    with open("cv.tpl") as template:
        return bottle.template(template.read())

application = bottle.default_app()
application.install(bottlog.apache_logger)

if __name__ == "__main__":
    bottle.run(app=application, port=1233, server="paste")
