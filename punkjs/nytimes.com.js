function isFrontPage() {
  return document.location.pathname == '/';
}

if (!isFrontPage()) {
  $('#masthead, #ribbon, .newsletter-signup, .supplemental, .story-meta-footer-sharetools, .comments-button').remove()
  $('.navigation-edge').hide();
  $('main').css('borderTop', 'none');
}

(function() {
  $('.ribbon-page-navigation').remove();
  setTimeout(arguments.callee, 100);
})();
