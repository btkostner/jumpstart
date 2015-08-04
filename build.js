//////////////////////////////
// install.js
//////////////////////////////

////////////////////
// requires
////////////////////

var fs = require("fs.extra"),
    path = require("path"),
    _ = require("underscore");

var theme = require("./theme.js");

////////////////////
// helper function
////////////////////

var lsdir = function(dir) {
  var paths = [];
  var list = fs.readdirSync(dir);
  for(var i = 0; i < list.length; i++) {
    var filename = path.join(dir, list[i]);
    var stat = fs.statSync(filename);

    if (stat.isDirectory()) {
      paths.push(lsdir(filename));
    } else {
      paths.push(filename);
    }
  };
  return _.flatten(paths);
};

var rmdir = function(dir) {
  var list = fs.readdirSync(dir);
  for(var i = 0; i < list.length; i++) {
    var filename = path.join(dir, list[i]);
    var stat = fs.statSync(filename);

    if (stat.isDirectory()) {
      rmdir(filename);
    } else {
      fs.unlinkSync(filename);
    }
  }
  fs.rmdirSync(dir);
};

var flattenObject = function(ob) {
    var toReturn = {};

    for (var i in ob) {
        if (!ob.hasOwnProperty(i)) continue;

        if ((typeof ob[i]) == 'object') {
            var flatObject = flattenObject(ob[i]);
            for (var x in flatObject) {
                if (!flatObject.hasOwnProperty(x)) continue;

                toReturn[i + '.' + x] = flatObject[x];
            }
        } else {
            toReturn[i] = ob[i];
        }
    }
    return toReturn;
};

////////////////////
// variable setup
////////////////////

var paths = lsdir("scaffolding");
var themevars = flattenObject(theme);

_.each(paths, function(i) {
  console.log("file " + i + " found");
});

////////////////////
// setup build dir
////////////////////

fs.rmrf("build", function(err) {
  if (err) {
    console.log("could not remove build directory");
  } else {
    console.log("removed build directory");
  }
});

_.each(paths, function(i) {
  var d = path.dirname(i.split("scaffolding").join("build"));

  fs.mkdirp(d, function(err) {
    if (err) {
      console.log("error creating " + d);
    } else {
      console.log(d + " created");
    }
  });
});

////////////////////
// generate files
////////////////////

_.each(paths, function(e, i, l) {
  var e = path.normalize(e);
  var d = path.normalize(e.split("scaffolding").join("build"));

  fs.readFile(e, 'utf8', function(err, data) {
    if (err) {
      console.log("error reading " + e);
    } else {
      console.log("reading " + e);
      var data = data;
      _.each(themevars, function(v, n) {
        data = data.split("$" + n).join(v);
      });
      fs.writeFile(d, data, function(err) {
        if (err) {
          console.log("error saving " + d + " file");
        } else {
          console.log("saved " + d);
        }
      });
    }
  });
});
