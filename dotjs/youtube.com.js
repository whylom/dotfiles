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
var runningTime = $('meta[itemprop="duration"]').attr('content');
runningTime = '(' + runningTime.replace('PT', '').replace('M', ':').replace('S', '') + ')';
document.title = document.title.replace('- YouTube', runningTime);
