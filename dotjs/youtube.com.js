(function() {
  // Hide comments, sidebar, and footer.
  $('#watch-discussion').remove();
  $('.comments-pagination').remove();
  $('.watch-sidebar-section').remove();
  $('#footer-container').remove();

  // Expand description, hide controls to toggle description.
  $('.yt-horizontal-rule').remove();
  $('#watch-description-toggle').remove();
  $('.yt-uix-expander-collapsed').removeClass('yt-uix-expander-collapsed');
  $('#watch-description-toggle').remove();

  // remove sidebar & widen main content section to fill the space
  $('#watch7-sidebar-contents').remove();
  $('#watch7-content').css({
    'width': '856px',
    'paddingLeft': '105px',
  });

  // Get video's duration from meta tag data.
  var duration = $('meta[itemprop="duration"]').attr('content');
  var parts = duration.replace(/(PT|S)/g, '').split('M');
  var min = parseInt(parts[0]);
  var sec = parseInt(parts[1]);

  // Split 60+ minutes into hours and minutes.
  if (min > 60) {
    var hrs = Math.floor(min / 60);
    min = (min - (hrs * 60)).toString();
  }

  // Prepend hours & seconds with a zero as needed.
  if (hrs && min < 10) min = '0' + min;
  if (sec < 10) sec = '0' + sec;

  // Add running time to document title.
  var time = hrs ? [hrs, min, sec] : [min, sec];
  document.title = document.title.replace('▶ ', '').replace('- YouTube', '(' + time.join(":") + ')');

  // Keep repeating all of the above to catch asynchronous changes to the page.
  setTimeout(arguments.callee, 1000);
})();
