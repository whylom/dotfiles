// Customize page title for issues to start with issue number
document.title = document.title.replace(/(.*) · Issue #([0-9]+).*$/, '#$2 - $1');

var box = $('.notification-indicator');
var dot = box.find('.mail-status');

// Screen-scrape GitHub notifications page to find # of unread notifications.
// Update notifications indicator with the current state.
function getUnreadCount(callback) {
  $.get('/notifications', function(response) {
    var unread = $(response).find('.filter-item:first .count').text();
    callback(parseInt(unread));
  });
}

function updateOnce() {
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
