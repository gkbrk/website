%rebase("template.tpl")
%title = "FFmpeg Snippets and Examples - GKBRK.com"

<h3>FFmpeg Snippets and Examples</h3><br>

<div>
    <h4>Speeding up or slowing down a video</h4>
    <p>To change the video speed, you need to take the target time and divide it by the original time. You then use this number instead of the 0.5 in the example.</p>
    <p>Example: You have a video that is 3600 seconds long and you want to make it 100 seconds long.<br>100/3600 = 0.27<br>You would write 0.27 instead of 0.5.</p>
    <pre>ffmpeg -an -i original.flv -filter:v "setpts=<b>0.5</b>*PTS" rendered.mp4</pre>
</div>
