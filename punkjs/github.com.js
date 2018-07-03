// hitting the "Y" key in a file already expands the URL to use the commit SHA
// let's make Shift-Y shorten the SHA to the first 7 chars
$(document).on('keydown', function(e) {
  if (e.keyCode == 89 && e.shiftKey) {
    var url = document.location.toString();
    var matches = url.match( /(blob|commit)\/([a-f0-9]+)/ );
    if (!matches) return;

    var fullSHA = matches[2];
    var shortSHA = fullSHA.substr(0, 7);
    document.location = url.replace(fullSHA, shortSHA);
  }
});

(function() {
  // Add GitHub's own "danger" style to the "Close Pull Request" & "Close Issue"
  // buttons that I keep clicking on accidentally because they're right next to
  // the "Comment" button.
  $('button[name=comment_and_close]').addClass('btn-danger');

  // The above elements are not in the page on load, so keep polling
  setTimeout(arguments.callee, 100);
})();

// Keep the notification indicator in the header in sync with reality.
$(document).ready(function() {
  // Screen-scrape the Notifications page to get the number of unread messages.
  function getUnreadCount(callback) {
    $.get('/notifications', function(response) {
      var htmlPattern = /<span class="count">(\d+)<\/span>/;
      var matches = htmlPattern.exec(response);
      var unreadCount = parseInt(matches[1]);
      callback(unreadCount);
    });
  }

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
    setTimeout(updateRepeatedly, seconds(30));
  }

  // Mousing over the indicator icon updates just once.
  $('.notification-indicator').mouseenter(updateOnce);

  // Fire it up!
  updateRepeatedly();
});
