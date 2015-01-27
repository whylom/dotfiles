
var alert = $('td.description pre');

alert.html(
  alert.html().toLowerCase().replace(/\* ([a-z])/g, function(match, letter) {
    return '* ' + letter.toUpperCase();
  })
);

var instructions = $('td.description:last');
instructions.html(instructions.html().toLowerCase());
