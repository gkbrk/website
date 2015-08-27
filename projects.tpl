%rebase("template.tpl")
%title = "Projects - GKBRK.com"

%def project(title, description, url):
<div class="col-md-4">
    <h2>{{title}}</h2>
    <p>{{description}}</p>
    <a href="{{url}}" target="_blank"><button class="btn btn-success">Check it out!</button></a>
</div>
%end


<h1 class="text-center">Here are some of my projects</h1>
<div class="row">
    %project("gkbrk.com", "This website itself", "https://github.com/gkbrk/website")
    %project("RustOre", "A Minecraft classic server written in Rust. It is still a Work In Progress.", "https://github.com/gkbrk/RustOre-Classic")
    %project("AsteroidRacer", "A dodging game written in Python. It can be used as an example for the Pyglet library.", "https://github.com/gkbrk/AsteroidRacer")
</div>
<div class="row">
    %project("JustIRC", "A Python library that makes it really simple to make IRC bots.", "https://github.com/gkbrk/SimpleIRC")
    %project("SirLogsalot", "A simple IRC bot written in C.", "https://github.com/gkbrk/Sirlogsalot")
    %project("IrcLib", "An event-based C# library that makes coding IRC bots easy.", "https://github.com/gkbrk/IrcLib")
</div>
<div class="row">
    %project("GKBRK WebRadio", "A web-based radio player in HTML5/CSS/JS.", "http://radio.gkbrk.com")
    %project("AsteroidsC++", "An asteroid dodging game written in C++ and SDL.", "https://github.com/gkbrk/AsteroidsCpp")
</div>
