// Get video's running time from markup, and insert into document title.
var duration = $('meta[property="video:duration"]').attr('content');
duration = parseInt(duration);
var minutes = Math.floor(duration / 60);
var seconds = duration % 60;
if (seconds < 10) seconds = '0' + seconds;
var time = [minutes,seconds].join(':');
document.title = document.title.replace('| Video on TED.com', '(' + time + ')');

// Remove parts of the page.
$('#conversations, #conversation, #share_and_save').remove();
var relatedTalks = $('.contentPod').has('.relatedPlaylists, .relatedTalks');
$('.contentPod').not(relatedTalks).remove();

// Show/hide right-rail content by clicking headers.
$('.contentPod .header').toggle(function() {
  $(this).siblings('.content').hide();
}, function() {
  $(this).siblings('.content').show();
});
