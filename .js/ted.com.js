// Get video's running time from markup, and insert into document title.
var duration = $('meta[property="video:duration"]').attr('content');
duration = parseInt(duration);
var minutes = Math.floor(duration / 60);
var seconds = duration % 60;
if (seconds < 10) seconds = '0' + seconds;
var time = [minutes,seconds].join(':');
document.title = document.title.replace('| Talk Video | TED.com', '(' + time + ')');

// Remove parts of the page.
$('.talk-section--borderless').parents('.area').remove();
