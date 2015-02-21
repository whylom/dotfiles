var style = $('<style></style>');
$('head').append('<style>            \
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
</style>');

$('a').css('color', '#00F');

if ($('.tree').length) {
  console.log(
    $('.tree .content').length
  );
}
