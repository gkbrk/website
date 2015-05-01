import bottle
import time

class apache_logger:
    def __init__(self, logfile):
        self.name = "ApacheLogger"
        self.api = 2
        self.logfile = logfile

    def apply(self, callback, route=None):
        def wrapper(*args, **kwargs):
            body = callback(*args, **kwargs)

            log_data = []
            log_data.append(bottle.request.remote_addr)
            log_data.append("-")
            log_data.append("-")
            log_data.append(time.strftime("[%d/%b/%Y:%H:%M:%S %z]"))
            log_data.append("\"{} {} {}\"".format(bottle.request.method, bottle.request.path, bottle.request.environ.get("SERVER_PROTOCOL", "")))
            log_data.append(str(bottle.response.status_code))
            log_data.append(str(len(body) if not isinstance(body, bottle.HTTPResponse) else 0))

            referer = bottle.request.get_header("Referer", "-")
            if referer != "-":
                referer = "\"{}\"".format(referer)
            log_data.append(referer)

            user_agent = bottle.request.get_header("User-Agent", "-")
            if user_agent != "-":
                user_agent = "\"{}\"".format(user_agent)
            log_data.append(user_agent)

            with open(self.logfile, "a+") as log_file:
                log_file.write("{}\n".format(" ".join(log_data)))

            return body
        return wrapper
