%rebase("template.tpl")
%title = "Playground - GKBRK.com"

%def block(title, description="", url=""):
<div class="col-md-4">
    <h2>{{title}}</h2>
    <p>{{description}}</p>
    <a href="{{url}}" target="_blank"><button class="btn btn-success">Check it out!</button></a>
</div>
%end

<h1>The Playground</h1>

<div class="row">
    %block("Watch people code", "Watch people coding in various coding streams", "watchcode")
</div>