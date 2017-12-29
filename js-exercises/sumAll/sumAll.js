var sumAll = function(...numbers) {
  var num = [...numbers];

  const negativeNumber = num[0] < 0 || num[1] < 0
  const notANumber     = typeof num[0] !== 'number' || typeof num[1] !== 'number';

  if (negativeNumber || notANumber) {
    return 'ERROR'
  }

  var largerNumber  = num[0] > num[1] ? num[0] : num[1];
  var smallerNumber = num[0] < num[1] ? num[0] : num[1];

  num = [];

  for (var i = smallerNumber; i <= largerNumber; i++) {
    num.push(i);
  }

  return num.reduce((acc, curr) => acc + curr );
}

module.exports = sumAll
