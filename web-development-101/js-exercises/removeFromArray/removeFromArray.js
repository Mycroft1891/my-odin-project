/***************
** ES6 Syntax **
***************/

var removeFromArray = function(array, ...numbers) {
  return array.filter(num => ![...numbers].includes(num));
}

/******************
** No ES6 Syntax **
******************/

var removeFromArray2 = function(array) {
  var filter_array = [];

  for (var i = 1; i < arguments.length; i++) {
    filter_array.push(arguments[i]);
  }

  return array.filter(function(num) {
    return !filter_array.includes(num)
  });
}

module.exports = removeFromArray
