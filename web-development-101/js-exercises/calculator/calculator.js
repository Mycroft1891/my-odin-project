function add (a, b) {
	return a + b;
}

function subtract (a, b) {
	return a - b;
}

function sum (numbers) {
	if (numbers.length == 0) return 0;
 	return numbers.reduce((acc, curr) => acc + curr);
}

function multiply (numbers) {
	return numbers.reduce((acc, curr) => acc * curr);
}

function power(num, pow) {
	return Math.pow(num, pow);
}

function factorial(number) {
	if (number <= 2) return number;
	let num = [];
	while(number > 0) {
		num.push(number);
		number -= 1;
	}

	return num.reduce((acc, curr) => acc * curr)
}

module.exports = {
	add,
	subtract,
	sum,
	multiply,
    power,
	factorial
}
