function isFrontPage() {
  return document.location.pathname == '/';
}

function isSectionPage() {
  return document.location.pathname.indexOf('/section') == 0;
}

if (!isFrontPage() && !isSectionPage()) {
  $('#masthead, #ribbon, .newsletter-signup, .supplemental, .story-meta-footer-sharetools, .comments-button').remove()
  $('.navigation-edge').hide();
  $('main').css('borderTop', 'none');
  $('.interactive-embedded').remove();
}

(function() {
  $('.ribbon-page-navigation').remove();
  setTimeout(arguments.callee, 100);
})();