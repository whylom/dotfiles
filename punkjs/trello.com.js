var css = '\
  .window-title .icon-subscribe,            \
  .window-header-icon {                     \
    display: none;                          \
  }                                         \
                                            \
  h2 {                                      \
    margin: 28px 0 9px;                     \
  }                                         \
                                            \
  h2.window-title-text {                    \
    font-size: 18pt;                        \
  }                                         \
                                            \
                                            \
  h3, h4, h5, h6 {                          \
    margin-top: 25px;                       \
  }                                         \
                                            \
  pre {                                     \
    margin: 16px 0;                         \
  }                                         \
                                            \
  .window-sidebar,                          \
  .js-current-list,                         \
  .js-card-detail-age {                     \
    opacity: 0.1;                           \
    transition: opacity 0.18s;              \
  }                                         \
                                            \
  .window-sidebar:hover,                    \
  .js-current-list:hover,                   \
  .js-card-detail-age:hover {               \
    opacity: 1.0;                           \
  }                                         \
                                            \
  p {                                       \
    margin: 0 0 16px;                       \
    line-height: 1.6;                       \
  }                                         \
                                            \
  .known-service-icon {                     \
    display: none;                          \
  }                                         \
                                            \
  .known-service-link {                     \
    background: none;                       \
    padding: 2px 0px;                       \
  }                                         \
                                            \
  .list-header .card-count {                \
    position: absolute;                     \
    right: 30px;                            \
    top: 8px;                               \
    color: #999;                            \
    font-size: 12px;                        \
  }                                         \
                                            \
  .list-card.active-card {                  \
    background-color: #ffffcc;              \
  }                                         \
                                            \
  .active-card .list-card-cover {           \
    opacity: 0.25;                          \
  }                                         \
                                            \
  .badge-state-due-soon,                    \
  .badge-state-due-now,                     \
  .badge-state-due-soon:hover,              \
  .badge-state-due-now:hover {              \
    color: #8c8c8c;                         \
    background-color: #fff;                 \
  }                                         \
                                            \
  .badge-state-due-soon .badge-icon,        \
  .badge-state-due-soon:hover .badge-icon,  \
  .badge-state-due-now .badge-icon,         \
  .badge-state-due-now:hover .badge-icon {  \
    color: #a6a6a6;                         \
  }                                         \
                                            \
  .markeddown ol, .markeddown ul {          \
    margin: 20px 0;                         \
  }                                         \
';

var style = $('<style></style>').html(css);
$('head').append(style);

(function() {
  // display the # of cards in each list's header
  // $('.list').each(function() {
  //   var header = $('.list-header', this);
  //   var extras   = $('.list-header-extras', header);
  //   var numCards = $('.list-card', this).length;
  //   var cardCount = header.find('.card-count');

  //   if (cardCount.length) {
  //     cardCount.html(numCards + ' cards');
  //   } else {
  //     extras.before(
  //       $('<span class="card-count">'+ numCards +' cards</span>')
  //     );
  //   }
  // })

  // always display the entire card description
  $('.is-hide-full').removeClass('is-hide-full');

  document.title = document.title.replace(' | Trello', '');

  $("h3:contains('Description') ~ a").remove();
  $("h3:contains('Description')").remove();
  $("h3:contains('Labels')").remove();
  $("h3:contains('Members')").remove();
  $("h3:contains('Activity')").parent('div').remove();
  $(".card-detail-item-header-edit").remove();

  setTimeout(arguments.callee, 500);
})();
