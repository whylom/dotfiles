function emptyFileContents(element) {
  element.parents('.file').children('.data, .image, .render-wrapper').remove();
}

// Add GitHub's own "danger" style to the Close button associated with pull
// request comments, so I don't stupidly click on it so often.
$('button[name=comment_and_close]').addClass('danger');



// In the pull request Files Changed tab, hide the diffs (but show filenames)
// for files we don't need to see: images and vendored assets.
var hideable = [".png", ".jpg", ".svg", "lib/assets", "vendor/assets/javascripts"];
var filenamesToHide = $('span.js-selectable-text').filter(function() {
  for (var i = 0; i <= hideable.length; i++) {
    if ($(this).is(':contains("'+ hideable[i] + '")')) return true;
  };
  return false;
});
emptyFileContents(filenamesToHide);



// Upgrade notifications indicator in page header
(function() {

  // Screen-scrape GitHub notifications page to find # of unread notifications.
  function getUnreadCount(callback) {
    $.get('/notifications', function(response) {
      var unread = $(response).find('.filter-item:first .count').text();
      callback(parseInt(unread));
    });
  }

  // Update notifications indicator with the current state.
  function updateOnce() {
    var box = $('.notification-indicator');
    var dot = box.find('.mail-status');
    getUnreadCount(function(unread) {
      if (unread > 0) {
        box.addClass('contextually-unread');
        dot.addClass('unread');
      } else {
        box.removeClass('contextually-unread');
        dot.removeClass('unread');
      }
    });
  }

  // Update notifications indicator and schedule next update.
  function updateRepeatedly() {
    updateOnce();
    setTimeout(updateRepeatedly, seconds(60));
  }

  // Update just once (right away) by hovering over the indicator icon.
  $('.notification-indicator').mouseenter(updateOnce);

  // Fire it up!
  updateRepeatedly();

})();
