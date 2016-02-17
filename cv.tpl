%rebase("template.tpl")
%title = "My CV - GKBRK.com"

%def block(title, description, url="", link_name="Check it out!", include_button=True):
<div class="col-md-4">
    <h3>{{title}}</h3>
    <p>{{description}}</p>
    %if include_button:
    <a href="{{url}}" target="_blank"><button class="btn btn-success">{{link_name}}</button></a>
    %end
</div>
%end

<h1>Here's my CV</h1>

<a href="static/cv.pdf" target="_blank"><p class="bg-success" style="font-size: 20px;"><span class="glyphicon glyphicon-file"></span> If you need my CV in a tabular format, you can click here.</p></a>

<br/>
<img class="pull-right" src="static/images/profil.png" width="200" height="250"/>
<h2>Personal Details</h2>
<p><strong>Full Name:</strong> Gökberk Yaltıraklı</p>
<p><strong>Date of Birth:</strong> 13th of January 1998</p>
<p><strong>Mobile Number:</strong> +90 0542 483 45 43</p>
<p><strong>E-Mail Address:</strong> webdosusb@gmail.com</p>

<br/><br/>
<h2>Education</h2>
<div class="row">
    %block("Bostancı Doğa Collage", "Primary School (2004-2012)", link_name="View diploma", include_button=False)
    %block("Fatin Rüştü Zorlu High School", "High School (2012-)", include_button=False)
</div>

<br/><br/>
<h2>Trainings</h2>
<div class="row">
    %block("Society and Culture", "Sabancı University Summer School", link_name="View certificate", include_button=False)
    %block("Economy and Government", "Sabancı University Summer School", link_name="View certificate", include_button=False)
    %block("Acedemic Writing", "ESLI Academy", link_name="View certificate", url="static/images/certificates/esli.png")
</div>

<br/><br/>
<h2>Languages</h2>
<ul>
    <li><p><strong>Turkish</strong> - Native language</p></li>
    <li><p><strong>English</strong> - Second language (C2)</p></li>
    <li><p><strong>German</strong> - B2</p></li>
</ul>

<br/><br/>
<h2>SAT Score</h2>
<ul>
    <li><p><strong>Critical Reading</strong> - 570</p></li>
    <li><p><strong>Maths</strong> - 640</p></li>
    <li><p><strong>Writing</strong> - 490</p></li>
    <li><p><strong>Total Score</strong> - 1700</p></li>
</ul>

<br/><br/>
<h2>Language Certificates</h2>
<div class="row">
    %block("Cambridge KET Exam", "[English] Pass with Merit", link_name="View certificate", include_button=False)
    %block("Cambridge PET Exam", "[English] Pass with Distinction", link_name="View certificate", include_button=False)
    %block("IELTS Exam", "[English] 8.0 points", link_name="View certificate", url="static/images/certificates/ielts.jpg")
</div>
<div class="row">
    %block("TELC B2", "[German] B2 Certificate", link_name="View certificate", url="static/images/certificates/telc.png")
</div>

<br/><br/>
<h2>Competitions</h2>
<div class="row">
    %block("Istanbul Aydın University", "High Schools English Competition (3rd place)", link_name="View certificate", include_button=False)
</div>

<br/><br/>
<h2>Language Courses</h2>
<div class="row">
    %block("Hamburg Colon Language Center", "German course for 3 weeks", link_name="View certificate", include_button=False)
    %block("Hamburg EvoLanguage Language School", "German course for 6 weeks", link_name="View certificate", include_button=False)
</div>

<br/><br/>
<h2>Places I've Been To</h2>
<ul>
    <li><p>Switzerland (Basel, Zurich, Geneva)</p></li>
    <li><p>Netherlands (Amsterdam, Volendam)</p></li>
    <li><p>Germany (Hamburg, Cologne, Berlin, Dresden, Bremen, Frankfurt, Munich)</p></li>
    <li><p>Belgium (Brussels, Brueges)</p></li>
    <li><p>Spain (Valencia)</p></li>
    <li><p>Luxembourg (Luxembourg)</p></li>
    <li><p>France (Paris, Mulhouse)</p></li>
    <li><p>Sweden (Malmö)</p></li>
    <li><p>Finland (Helsinki)</p></li>
    <li><p>Latvia (Riga)</p></li>
    <li><p>Letonia (Vilnius)</p></li>
    <li><p>Estonia (Talinn)</p></li>
    <li><p>Denmark (Copenhagen)</p></li>
    <li><p>Austria (Vienna, Innsbruck)</p></li>
    <li><p>Czech Republic (Prague)</p></li>
</ul>
