var fibonacci = function(n) {
  n = parseInt(n);
  if (n <= 0) return 'OOPS';
  if (n <= 2) return 1;
  let fibArr = [null, 1, 1];

  for (var i = 3; i <= n; i++) {
    fibArr[i] = fibArr[i-1] + fibArr[i-2]
  }

  return fibArr[n];
}

module.exports = fibonacci
