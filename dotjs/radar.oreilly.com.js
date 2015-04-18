$('#sidebar').remove();

// Remove stupid "tweet this" links
$('.inline-twitter-link').each(function() {
  var link = $(this);
  $('<span>'+ link.html() +'</span>').insertAfter(link);
  link.remove();
});
