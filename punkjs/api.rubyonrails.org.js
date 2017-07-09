/*
  Define custom CSS to restyle the official Ruby on Rails API docs:
    * text size & line height increased
    * red & tan theme replaced with default SDoc blue & gray
    * code styled to imitate GitHub markdown
*/
var css = '\
  body {                               \
    font-size: 0.92em;                 \
  }                                    \
                                       \
  #content {                           \
    line-height: 1.45em;               \
  }                                    \
                                       \
  .banner {                            \
    color: #000;                       \
    background: #EDF3FE;               \
    border: none;                      \
    border-bottom: 1px solid #ccc;     \
    padding: 1em 2em 0.5em 2em;        \
  }                                    \
                                       \
  .banner h1 .type,                    \
  .banner h1 .parent,                  \
  .banner .github_url {                \
    color: #666;                       \
  }                                    \
                                       \
  .panel .tree ul li.current,          \
  .panel .result ul li.current {       \
    background: #3875D7;               \
  }                                    \
                                       \
  .panel .tree ul li:hover,            \
  .panel .tree ul li.selected,         \
  .panel .result ul li:hover,          \
  .panel .result ul li.selected {      \
    background: #d0d0d0;               \
  }                                    \
                                       \
  .panel .tree ul li.current:hover,    \
  .panel .result ul li.current:hover { \
    background: #2965C0;               \
  }                                    \
                                       \
  .description pre {                   \
    font-size: 90%;                    \
    background-color: #f7f7f7;         \
    padding: 16px;                     \
  }                                    \
                                       \
  code {                               \
    font-family: Consolas, monospace;  \
  }                                    \
';

// Inject custom CSS into a new <style> tag.
// Sadly, the best way I could find to load custom CSS with dotjs.
var style = $('<style></style>').html(css);
$('head').append(style);

// Brute-force all links to blue with JS.
$('a').css('color', '#00F');
