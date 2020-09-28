function isSearchResultsPage() {
  return document.location.pathname == '/wiki/Special:Search';
}

function redirectToFirstCiv6Result() {
  var firstCiv6Result = $('.result h1 a:contains("Civ6"):first');
  document.location = firstCiv6Result.attr('href');
}

// Dramatis personae
var header = $('.wds-global-navigation-wrapper');
var subheader = $('header:first');
var searchToggleButton = $('.wds-global-navigation__search-toggle');
var searchField = $('input[type=search]');

// Hide the ugly "FANDOM" header by default
header.hide();

// Show/hide the header when I click on the subheader
subheader.click(() => {
  if (header.is(':visible')) {
    header.hide();
    searchField.val('');
  } else {
    header.show();
    searchToggleButton.click(); // simulate click to reveal search input
    searchField.focus();
  }
})

// This here code is what we in the biz call "self-documenting"
if (isSearchResultsPage()) {
  redirectToFirstCiv6Result();
}

document.title = document.title.replace(' (Civ6) | Civilization Wiki | Fandom', '');

function hideClickbait() {
  if (isSearchResultsPage()) return;

  $('#WikiaTopAds').remove(); // header ad
  $('[itemprop="video"]').remove();  // video
  $('#WikiaRailWrapper').remove(); // sidebar
  $('#WikiaNotifications').remove() // sidebar popup
  $('footer').remove(); // footer
  $('#WikiaBar').remove(); // footer below the footer (jesus, Wikia...)
}

setInterval(hideClickbait, 100);
