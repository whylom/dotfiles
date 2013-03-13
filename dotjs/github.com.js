// Customize page title for issues to start with issue number
document.title = document.title.replace(/(.*) · Issue #([0-9]+).*$/, '#$2 - $1');

// GitHub recently jacked up the size of code displayed in the "changes"
// section of pull requests. Let's change it back, shall we?
$('#files .file .data .diff-line').css('font-size', '12px');

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
