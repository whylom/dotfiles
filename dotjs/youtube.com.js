// Hide comments, siderbar, and footer
$('#comments-view').remove();
$('.watch-sidebar-section').remove();
$('#footer-container').remove();

// Description is always expanded
$('.yt-horizontal-rule').remove();
$('#watch-description-toggle').remove();
$('.yt-uix-expander-collapsed').removeClass('yt-uix-expander-collapsed');
$('#watch-description-toggle').remove();

// Get video's duration from meta tag data.
var duration = $('meta[itemprop="duration"]').attr('content');
var parts = duration.replace(/(PT|S)/g, '').split('M');
var min = parseInt(parts[0]);
var sec = parseInt(parts[1]);

// split 72 minutes into 1 hour, 12 minutes
if (min > 60) {
  var hrs = Math.floor(min / 60);
  min = (min - (hrs * 60)).toString();
}

// prepend hours & seconds with a zero as needed
if (hrs && min < 10) min = '0' + min;
if (sec < 10) sec = '0' + sec;

// Add running time to document title.
var time = hrs ? [hrs, min, sec] : [min, sec];
document.title = document.title.replace('- YouTube', '(' + time.join(":") + ')');
