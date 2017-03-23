// Add GitHub's own "danger" style to the "Close Pull Request" & "Close Issue"
// buttons that I keep clicking on accidentally because they're right next to
// the "Comment" button.
$('button[name=comment_and_close]').addClass('btn-danger');


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


// In the pull request Files Changed tab, hide the diffs (but show filenames)
// for files we don't need to see: images and vendored assets.
var hideable = [".png", ".jpg", ".svg", "lib/assets", "vendor/assets/javascripts"];
var filesToHide = $('span.js-selectable-text').filter(function() {
  for (var i = 0; i <= hideable.length; i++) {
    if ($(this).is(':contains("'+ hideable[i] + '")')) return true;
  };
  return false;
});
filesToHide.parents('.file').children('.data, .image, .render-wrapper').remove();


// Add links to all associated PRs right under the issue description.
$(document).ready(function() {
  var issueDescription = $('.timeline-comment-wrapper:first');

  // Start by finding the existing PRs in the issue timeline
  var pullRequests = $('[id*="ref-pullrequest"]').parent();

  // Loop over the PRs in reverse order, so the end result is the right order.
  $(pullRequests.get().reverse()).each(function() {
    // Clone the PR, then harvest the clone's organs.
    var pullRequest = $(this).clone();
    var title = pullRequest.find('.discussion-item-ref-title');
    var state = pullRequest.find('.state');

    // Transplant the organs into a new host & insert after the description.
    var container = $('<div class="discussion-item"></div>');
    container.append(state);
    container.append(title);
    container.insertAfter(issueDescription);
  });
});


// Update favicon & page header based on # of unread notifications.
$(document).ready(function() {
  // Default favicon is loaded from assets-cdn.github.com. Replace it with an
  // identical favicon from github.com to avoid cross-domain errors.
  $('link[rel="icon"]').attr('href', 'https://github.com/favicon.ico');

  // Initialize library used to badge favicon.
  var favicon = new Favico({ animation:'none' });

  function onNotificationsPage() {
    return document.location.pathname == "/notifications";
  }

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
        if (onNotificationsPage()) favicon.badge(unread.toString());
        box.addClass('contextually-unread');
        dot.addClass('unread');
      } else {
        if (onNotificationsPage()) favicon.reset();
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
