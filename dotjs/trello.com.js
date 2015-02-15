(function() {
  // wait until UI is populated with data
  if ($('.list-card').length == 0) {
    return setTimeout(arguments.callee, 10);
  }

  // display the # of cards in each list's header
  $('.list').each(function() {
    var header   = $('.list-header h2', this);
    var numCards = $('.list-card', this).length;
    var count    = $('<span>'+ numCards +'</span>');

    count.css({
      'position': 'absolute',
      'right': '21px',
      'top': '3px',
      'color': '#999',
      'font-size': '12px'
    });

    header.prepend(count);
  })
})();
