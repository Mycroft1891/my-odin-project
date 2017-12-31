var palindromes = function(string) {
  var str = string.replace(/[^A-Za-z0-9]/g, '').toLowerCase();
  var reverse = str.split("").reverse().join("");
  return (str == reverse) ? true : false;
}

module.exports = palindromes
