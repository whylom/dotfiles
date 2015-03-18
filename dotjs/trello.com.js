var css = '\
  .list-header .card-count {          \
    position: absolute;               \
    right: 21px;                      \
    top: 3px;                         \
    color: #999;                      \
    font-size: 12px;                  \
  }                                   \
                                      \
  .badge-state-due-soon {             \
    color: #8c8c8c;                   \
    background-color: #fff;           \
  }                                   \
                                      \
  .badge-state-due-soon .badge-icon { \
    color: #a6a6a6;                   \
  }                                   \
';

var style = $('<style></style>').html(css);
$('head').append(style);

(function() {
  // display the # of cards in each list's header
  $('.list').each(function() {
    var header   = $('.list-header h2', this);
    var numCards = $('.list-card', this).length;
    var cardCount = header.find('.card-count');

    if (cardCount.length) {
      cardCount.html(numCards);
    } else {
      header.prepend(
        $('<span class="card-count">'+ numCards +'</span>')
      );
    }
  })

  setTimeout(arguments.callee, 1000);
})();
