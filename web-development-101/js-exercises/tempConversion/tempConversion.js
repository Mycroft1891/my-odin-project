var ftoc = function(temp) {
  const result = (temp - 32) / 1.8;

  return (result % 1 === 0) ? result : parseFloat(result.toFixed(1))
}

var ctof = function(temp) {
  const result = (temp * 1.8 + 32);

  return (result % 1 === 0) ? result : parseFloat(result.toFixed(1))
}

module.exports = {
  ftoc,
  ctof
}
