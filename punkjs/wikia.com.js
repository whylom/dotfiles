function isSearchResultsPage() {
  return document.location.pathname == '/wiki/Special:Search';
}

function redirectToFirstCiv6Reesult() {
  var firstCiv6Result = $('.result h1 a:contains("Civ6"):first');
  document.location = firstCiv6Result.attr('href');
}

// Dramatis personae
var header = $('.wds-global-navigation-wrapper');
var subheader = $('header:first');
var search = $('#searchInput');

// Hide the ugly "FANDOM" header by default
header.hide();

// Show/hide the header when I click on the subheader
subheader.click(() => {
  if (header.is(':visible')) {
    header.hide();
  } else {
    header.show();
    search.focus();
  }
})

if (isSearchResultsPage()) {
  redirectToFirstCiv6Reesult();
}

// Hide grotesque geek culture clickbait
$('#WikiaRailWrapper').remove(); // sidebar
$('footer').remove(); // footer
$('#WikiaBar').remove(); // footer below the footer (jesus, Wikia...)
