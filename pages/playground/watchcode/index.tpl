%rebase("template.tpl")
%title = "Watch People Code - GKBRK.com"

%import requests
%import re
%def get_streams(category):
%streams = requests.get("http://api.twitch.tv/kraken/streams?limit=20&offset=0&game=%s&broadcaster_language=&on_site=1" % category).json()["streams"]
%return streams
%end

<h1>Watch People Code</h1>

<div class="row">
    <div class="col-md-4">
        <h3>Watch random stream</h3>
        <img src="https://i.imgur.com/NQiQVAC.gif" /><br><br>
        <a href="watchtwitch"><button class="btn btn-success">Click here to go to a random stream</button></a>
    </div>
%for stream in get_streams("Game Development"):
    <div class="col-md-4">
        <h3>{{stream["channel"]["status"][:40]}} <small>{{stream["channel"]["display_name"]}}</small></h3>
        <img src="{{stream["preview"]["medium"]}}" /><br><br>
        <a href="watchtwitch?channel={{stream["channel"]["name"]}}"><button class="btn btn-success">Watch stream! [{{stream["viewers"]}} viewers]</button></a>
    </div>
%end
</div>
