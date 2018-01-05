function echo(input) {
	return input;
}

function shout(input) {
	return input.toUpperCase();
}

function repeat(string, number=2) {
	let str = [];
	while (number > 0) {
		str.push(string);
		number -= 1;
	}
	return str.join(" ")
}

function pieceOfWord(string, number) {
	return string.slice(0, number);
}

function firstWord(string) {
	return string.split(' ')[0];
}

function capitalize(word) {
	return word.charAt(0).toUpperCase() + word.slice(1);
	// This function just capitalizes the word given to it, use in conjunction with titleCreator
}

function titleCreator(string) {
	let shortW = ['the', 'and', 'over'];
	let str = string.split(' ');

	str.forEach((val, i) => {
		if (i == 0 && val == 'the') return str[i] = capitalize(val);
		if (shortW.includes(val)) 	return str[i] = val;
																return str[i] = capitalize(val);
	});

	return str.join(' ');
}

module.exports = {
	echo,
	shout,
	repeat,
	pieceOfWord,
	firstWord,
	titleCreator
}
