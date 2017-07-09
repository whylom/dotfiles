// Get video's running time and format as MM:SS
var duration = $('meta[property="video:duration"]').attr('content');
duration = parseInt(duration);
var minutes = Math.floor(duration / 60);
var seconds = duration % 60;
if (seconds < 10) seconds = '0' + seconds;
var time = [minutes,seconds].join(':');

// Remove "TED.com" boilerplate from document title and append running time.
var title = document.title.split('|')[0];
document.title = title + '(' + time + ')';

// Remove parts of the page.
$('.talk-section--borderless').parents('.area').remove();
