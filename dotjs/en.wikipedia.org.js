document.title = document.title.replace('- Wikipedia, the free encyclopedia', '(Wikipedia)');

$('#siteNotice, #siteSub, #mw-head-base, #mw-page-base, #mw-head, #mw-panel, #toctitle, .mw-editsection, .mbox-image, .magnify').remove();

setTimeout(function() {
  $('#mw-articlefeedback').remove();
}, 1000)

$('a.new').css({
  'opacity': 0.4
});

var superscripts = $('sup.reference');
superscripts.find('span').remove();
superscripts.find('a').css({
  'margin-right': '3px',
  'color': 'gray'
});

// citation needed
$('.Template-Fact').css('color', 'gray').find('a').css('color', 'gray');

$('table.infobox').css({
  'border': 'none'
});

$('table.infobox th').css('background', 'none');

$('.thumbinner').css({
  'border': 'none',
  'background': 'none'
});

$('#content').css({
  'width': '850px',
  'background': '#fff'
});

$('table.metadata').css({
  'border': 'none',
  'margin': 0,
  'opacity': 0.3,
  'font-size': '8pt'
}).hover(function() {
  $(this).css('opacity', 1);
}, function() {
  $(this).css('opacity', 0.3);
});

$('.dablink').css({
  'color': '#666',
  'margin': '16px 0'
});

$('table.ambox-content').find('b,a').css({
  'font-weight': 'normal',
  'color': 'black'
});

$('table.ambox-content').find('b,a').css({
  'font-weight': 'normal',
  'color': 'black'
});

// table of contents
var toc = $('table.toc').css({
  'background-color': '#f6f6f6',
  'border': 'none'
});

var container = $('<div></div>')
container.insertAfter(toc).append(toc).css({
  'position': 'fixed',
  'left': '1080px',
  'top': '0px',
  'height': '100%',
  'overflow': 'hidden'
});

container.hover(function() {
  if (toc.height() > container.height()) {
    container.css('overflow-y', 'scroll');
  }
}, function() {
  container.css('overflow-y', 'hidden');
});

$('<img src="http://upload.wikimedia.org/wikipedia/commons/8/84/W_logo_for_Mobile_Frontend.gif">')
.css({
  'float': 'right',
  'margin-top': '4px'
})
.appendTo('h1');

