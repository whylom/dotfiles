// Get the URL of the photo.
var url = $('.media-photo .img').css('backgroundImage').replace(/(url|\(|\))/g, '');

// Put the URL in a text input at the top of the page.
var input = $('<input type="text" value="'+ url +'">');
input.css({
  'position': 'absolute',
  'right': 0,
  'top': '-35px',
  'border': 'none'
});
input.appendTo('.media-info');
input.attr('size', url.length + 8);

// Give the input focus, for quick copying.
input.focus();
