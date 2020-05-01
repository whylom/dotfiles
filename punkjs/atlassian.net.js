(function() {
  $('[data-testid="Navigation"]').css({
    top: '34px'
  });

  $('[data-testid="atlassian-navigation--header"]').css({
    height: '34px'
  });

  $('#page-body > #content').css({
    borderTopWidth: '28px'
  });

  $('#ghx-header').empty().css({
    padding: 'none',
    margin: 'none'
  });

  $('#ghx-quick-filters').css({
    marginBottom: '8px'
  });

  setTimeout(arguments.callee, 500);
})();
