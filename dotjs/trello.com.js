var css = '\
  .window-title .icon-subscribe,      \
  .window-header-icon {               \
    display: none;                    \
  }                                   \
                                      \
  h2.window-title-text {              \
    font-size: 18pt;                  \
  }                                   \
                                      \
  .window-sidebar {                   \
    opacity: 0.1;                     \
    transition: opacity 0.18s;        \
  }                                   \
                                      \
  .window-sidebar:hover {             \
    opacity: 1.0;                     \
  }                                   \
                                      \
  p {                                 \
    margin: 0 0 16px;                 \
    line-height: 1.6;                 \
  }                                   \
                                      \
  .known-service-link {               \
    background: none;                 \
    padding: 2px 0px;                 \
  }                                   \
                                      \
  .list-header .card-count {          \
    position: absolute;               \
    right: 26px;                      \
    top: 8px;                         \
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

  $("h3:contains('Description') ~ a").remove();
  $("h3:contains('Description')").remove();
  $("h3:contains('Members')").remove();
  $("h3:contains('Activity')").parent('div').remove();
  $('.window-title p:contains("in list")').remove();

  setTimeout(arguments.callee, 100);
})();
