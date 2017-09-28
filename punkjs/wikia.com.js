// Dramatis personae
var header = $('.wds-global-navigation-wrapper');
var subheader = $('header');
var search = $('#searchInput');

// Hide the ugly "FANDOM" header by default
header.hide();

// Reveal the header & focus the search field when I click on the subheader
subheader.click(function() {
  header.show();
  search.focus();
})

// Hide the header again when I click on the subheader.
header.click(function(event) {
  // Ignore clicks in the search field
  var clicked = $(event.target);
  if (clicked.is(search)) return;

  header.hide();
})

// If this is a search results page, just go to the first "Civ6" result.
if (document.location.pathname == '/wiki/Special:Search') {
  var firstCiv6result = $('.result h1 a:contains("Civ6"):first');
  document.location = firstCiv6result.attr('href');
}

// Hide grotesque geek culture clickbait
$('#WikiaRailWrapper').remove(); // sidebar
$('footer').remove();
