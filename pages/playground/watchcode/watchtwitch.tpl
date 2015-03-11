%rebase("template.tpl")
%title = "Twitch - GKBRK.com"

%import bottle
%import twitch

%streams = twitch.get_streams("Game Development")

%channel_name = bottle.request.params.get("channel", "random")
%if channel_name == "random":
%channel = twitch.get_channel(twitch.get_random_channel(streams)["channel"]["name"])
%else:
%channel = twitch.get_channel(channel_name)
%end

<h2>Watching {{channel["channel"]["name"]}} <small class="pull-right">{{channel["viewers"]}} viewers</small></h2>
<h4>{{channel["channel"]["status"]}}</h4>
<div class="row">
    <div class="col-md-8">
        <iframe height="400" width="100%" frameborder="0" scrolling="no" src="http://www.twitch.tv/{{channel["channel"]["name"]}}/embed"></iframe>
    </div>
    <div class="col-md-4">
        <iframe height="400" width="100%" frameborder="0" scrolling="no" src="http://twitch.tv/{{channel["channel"]["name"]}}/chat" height="500" width="350"></iframe>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <a href="index"><button class="btn btn-warning btn-block">Go back</button></a>
    </div>
    <div class="col-md-6">
        <a href="watchtwitch"><button class="btn btn-success btn-block">Go to a random stream</button></a>
    </div>
</div>