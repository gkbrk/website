import bottle
import time

def apache_logger(callback):
    """Logs in the combined log format"""
    def wrapper(*args, **kwargs):
        body = callback(*args, **kwargs)

        log_data = []
        log_data.append(bottle.request.remote_addr)
        log_data.append("-")
        log_data.append("-")
        log_data.append(time.strftime("[%d/%b/%Y:%H:%M:%S %z]"))
        log_data.append('"%s %s %s"' % (bottle.request.method, bottle.request.path, bottle.request.environ.get("SERVER_PROTOCOL", "")))
        log_data.append(str(bottle.response.status_code))
        log_data.append(str(len(body) if not isinstance(body, bottle.HTTPResponse) else 0))

        referer = bottle.request.get_header("Referer", "-")
        if referer != "-":
            referer = "\"%s\"" % referer
        log_data.append(referer)

        user_agent = bottle.request.get_header("User-Agent", "-")
        if user_agent != "-":
            user_agent = "\"%s\"" % user_agent
        log_data.append(user_agent)

        with open("server.log", "a+") as log_file:
            log_file.write(" ".join(log_data) + "\n")

        return body

    return wrapper

def common_logger(callback):
    """Logs in the common log format"""
    def wrapper(*args, **kwargs):
        body = callback(*args, **kwargs)

        log_data = []
        log_data.append(bottle.request.remote_addr)
        log_data.append("-")
        log_data.append("-")
        log_data.append(time.strftime("[%d/%b/%Y:%H:%M:%S %z]"))
        log_data.append('"%s %s %s"' % (bottle.request.method, bottle.request.path, bottle.request.environ.get("SERVER_PROTOCOL", "")))
        log_data.append(str(bottle.response.status_code))
        log_data.append(str(len(body) if not isinstance(body, bottle.HTTPResponse) else 0))

        with open("server.log", "a+") as log_file:
            log_file.write(" ".join(log_data) + "\n")

        return body

    return wrapper