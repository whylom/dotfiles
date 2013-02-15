// Get video's duration from meta tag data.
var duration = $('meta[itemprop="duration"]').attr('content');
var parts = duration.replace(/(PT|S)/g, '').split(/(H|M)/);
var hrs = parts[0];
var min = parts[2];
var sec = parts[4];

// Add running time to document title.
var time = (hrs == '00') ? [min, sec] : [hrs, min, sec];
time = time.join(":");
document.title = document.title.replace('on Vimeo', '(' + time + ')');
