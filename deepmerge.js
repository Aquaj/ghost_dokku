var merge = require('deepmerge');
var fs = require('fs');


var jsonFiles = process.argv.slice(2,-1);
var outputFile = process.argv.slice(-1)[0];

var result = {};
var fileContent;
for (var i = 0; i < jsonFiles.length; i++) {
  var file = jsonFiles[i];
  fileContent = require(file);
  result = merge(result, fileContent);
}

fs.writeFile(outputFile, JSON.stringify(result, null, 2), function(err) {
  if(err) {
    console.log(err);
  } else {
    console.log("JSON saved to " + outputFile);
  }
});
