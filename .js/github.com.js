// Lighten up the header with some custom CSS.
var css ='\
  .header { background-color: #fafafa; }                                   \
  .header .header-nav-link { color: #555; }                                \
  .header-logo-invertocat .octicon-mark-github { color: #000; }            \
  .header .header-search-input { border: 1px solid #e5e5e5; color: #555; } \
  .header .header-search-input:focus { border-color: #bbb; }               \
';

var style = $('<style></style>').html(css);
$('head').append(style);


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


// Make it easier to see links to pull requests in an issue's timeline.
$(document).ready(function() {
  $('[id*="ref-pullrequest"]').each(function() {
    var header = $(this);

    // Put a dashed red border around the link to the pull request.
    var pull = header.siblings('h4').add( header.children('h4') );
    pull.css({ border: '1px dashed red', padding: '4px 8px' });

    // Align the status icon within the new border.
    var status = header.siblings('span');
    status.css({ position: 'relative', top: '6px', marginRight: '5px' });
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
      var unread = $(response).find('.filter-item:first .count').text();
      callback(parseInt(unread));
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
