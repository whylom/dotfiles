$('#comments-view').remove();
$('#watch-headline-user-info').remove();
$('.watch-sidebar-section').remove();
$('#footer-container').remove();
$('.yt-uix-expander-collapsed').removeClass('yt-uix-expander-collapsed');
$('#watch-description-toggle').remove();
$('.yt-horizontal-rule').remove();
$('#watch-actions').remove();
$('#watch-description-extra-info').remove();
$('#masthead-nav').remove();
$('#masthead-user-bar-container').remove();
$('#watch-headline h1').css('font-size', '13pt');
$('#watch7-content').css('width', '854px');

// Get video's running time from markup, and insert into document title.
var duration = $('meta[itemprop="duration"]').attr('content');
var parts = duration.replace(/(PT|S)/g, '').split('M');
var min = parseInt(parts[0]);
var sec = parts[1];

// split 72 minutes into 1 hour, 12 minutes
if (min > 60) {
  var hrs = Math.round(min / 60);
  min = (min - (hrs * 60)).toString();
  if (min.length == 1) min = min + '0';
}

// display 2 seconds as "02"
if (sec.length == 1) sec = '0' + sec;

if (hrs) {
  var time = [hrs, min, sec].join(":");
} else {
  var time = [min, sec].join(":");
}

document.title = document.title.replace('- YouTube', '(' + time + ')');
