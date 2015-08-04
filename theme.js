//////////////////////////////
// theme.js
//////////////////////////////

////////////////////
// colors
////////////////////

var color = {
  0:  "#252525",
  8:  "#454545",

  1:  "#ff9f95",
  9:  "#ff8d80",

  2:  "#a6e22e",
  10: "#b6e354",

  3:  "#fd971f",
  4:  "#435e87",

  5:  "#789ec6",
  13: "#46a4ff",

  6:  "#5e7175",
  14: "#a3babf",

  7:  "#dbdcdc",
  15: "#fdfdfd"
};

var element = {
  "background": color[0],
  "foreground":  color[7]
};

////////////////////
// layout
////////////////////

var layout = {
  "gaps": 15
};

////////////////////
// exports
////////////////////

exports.color = color;
exports.element = element;
exports.layout = layout;
