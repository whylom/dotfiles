// Customize page title for issues to start with issue number
document.title = document.title.replace(/(.*) · Issue #([0-9]+).*$/, '#$2 - $1');

// GitHub recently jacked up the size of code displayed in the "changes"
// section of pull requests. Let's change it back, shall we?
$('#files .file .data .diff-line-code').css('font-size', '12px');

// Add GitHub's own "danger" style to the Close button associated with pull
// request comments, so I don't stupidly click on it so often.
$('button[name=comment_and_close]').addClass('danger');

// In the pull request Files Changed tab, hide the diffs (but show filenames)
// for files we don't need to see: images, and lib assets.
$('span.js-selectable-text').filter(function() {
  var hideable = [".png", ".jpg", ".svg", "lib/assets"];
  for (var i = 0; i <= hideable.length; i++) {
    if ($(this).is(':contains("'+ hideable[i] + '")')) return true;
  };
  return false;
}).parents('.file').children('.data, .image').remove();

// Make it easier to copy titles of issues and pull requests
(function() {
  var header = $('h2.discussion-topic-title');

  var textbox = $('<input type="text">').css({
    'display': 'block',
    'fontSize': '1.5em',
    'fontWeight': 'bold',
    'padding': '0px 0px 0px 2px',
    'margin': '-3px 0px -3px -3px',
    'width': '92%'
  }).hide().insertAfter(header);

  header.click(function() {
    header.hide();
    textbox.val(header.text());
    textbox.show()
    textbox[0].select();
  });

  $(document).click(function(e) {
    var clicked = $(e.target)
    if (clicked.is(header) || clicked.is(textbox)) return;
    textbox.hide();
    header.show();
  });
})();

// Make it easier to copy branch names from pull requests
(function() {
  var branch = $('.current-branch .css-truncate-target:last');

  var textbox = $('<input type="text" class="commit-ref">').css({
    'border': 'none',
    'fontSize': '10px',
    'padding': '0px',
    'background': 'none',
    'position': 'relative',
    'top': '-7px'
  }).hide().insertAfter(branch);

  branch.click(function() {
    branch.hide();
    textbox.val(branch.text());
    textbox.css('width', branch.width());
    textbox.show()
    textbox[0].select()
  });

  $(document).click(function(e) {
    var clicked = $(e.target)
    if (clicked.is(branch) || clicked.is(textbox)) return;
    textbox.hide();
    branch.show();
  });
})();



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
