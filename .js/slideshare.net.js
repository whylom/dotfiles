(function() {
  var lastSlide = currentSlide();

  setInterval(function() {
    var slide = currentSlide();
    if (slide != lastSlide) {
      updateNote(slide);
      lastSlide = slide;
    }
  }, 100);
})();

function currentSlide() {
  return $("input:text[name=goToSlide]").val();
}

function updateNote(index) {
  var note = $('.slide-notes').eq(index-1);
  aside.html(note.html());
}

var aside = $('aside');

aside.find('ul').remove();

aside.css({
  background: "white",
  minHeight: "512px",
  fontSize: "11pt",
  lineHeight: 1.4
});

$('.playerWrapper .actions, #slideview_likes').remove();

$('.assets.container').hide();

$('.description, .descToggleMore').hide();
$('.descriptionExpanded').show();
