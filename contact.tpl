%rebase("template.tpl")
%title = "Contact Me - GKBRK.com"

%def contact(title, description, url):
<div class="col-md-4">
    <h2>{{title}}</h2>
    <p>{{description}}</p>
    <a href="{{url}}" target="_blank"><button class="btn btn-success">Contact me!</button></a>
</div>
%end

<h1>How to contact me?</h1>

<p>If you'd like to ask me a question or (hopefully) recruit me, you can contact me through these channels.</p>

<div class="row">
    %contact("E-Mail", "Send me a good ol' e-mail", "mailto:webdosusb@gmail.com")
    %contact("LinkedIn", "Send me a message or become a connection on LinkedIn.", "https://www.linkedin.com/pub/g%C3%B6kberk-yalt%C4%B1rakl%C4%B1/103/8b2/104")
</div>
