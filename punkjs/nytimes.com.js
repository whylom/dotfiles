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
  $('[data-test-id="RecommendedNewsletter"]').remove();
}

for (var i = 0; i < 10; i++) {
  $('#story-ad-'+ i +'-wrapper').remove();
}

(function() {
  $('.ribbon-page-navigation, nav[data-testid="ribbon"], aside, .expanded-dock').remove();
  $(':contains("Allow ads")').parents('button').parent().remove();

  setTimeout(arguments.callee, 100);
})();
