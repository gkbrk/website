%rebase("template.tpl")
%title = "Page Not Found"

<h1>Page Not Found</h1>
<p>Sorry. I couldn't find the page you were looking for. Click <a href="index">here</a> to go to the homepage.</p>

%import random
%random_image = "static/animals/animal%s.jpg" % random.randint(0, 18)
<a href="404"><img src="{{random_image}}" width="400" height="300"/></a>
