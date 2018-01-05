var repeatString = function(string, number) {
  if (number < 0) return 'ERROR';
  let str = [];
  while (0 < number) {
    str.push(string);
    number -= 1;
  }

  return str.join('');
}

module.exports = repeatString
