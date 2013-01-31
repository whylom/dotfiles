// Get video's running time from markup, and insert into document title.
var duration = $('meta[property="video:duration"]').attr('content');
duration = parseInt(duration);
var minutes = Math.floor(duration / 60);
var seconds = duration % 60;
var time = [minutes,seconds].join(':');
document.title = document.title.replace('| Video on TED.com', '(' + time + ')');
