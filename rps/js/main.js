var options = ['rock', 'paper', 'scissor'];
var notValid = true;

function validInput(userInput) {
  if (!(typeof userInput === "string")) {
    return new Error("You didn't provide a string");
  }

  if (!options.includes(userInput.toLowerCase())) {
    return new Error("Not a valid option. Try " + options);
  }
  notValid = false
}

function computerPlay() {
  return options[Math.floor(Math.random() * 3)]
}

function playRound(ps, cs) {
  ps = ps.toLowerCase();

  if (ps == cs) { return 'It is a draw' }

  switch (ps) {
    case 'paper':
      return (cs == 'scissor') ? 'YOU LOSE! Scissor beats Paper' : 'YOU WIN! Paper beats Rock';
    case 'rock':
      return (cs == 'paper')   ? 'YOU LOSE! Paper beats Rock'    : 'YOU WIN! Rock beats Scissor';
    default:
      return (cs == 'rock')    ? 'YOU LOSE! Rock beats Scissor'  : 'YOU WIN! Scissor beats Paper';
  }
}

function game() {
  var playerScore   = 0;
  var computerScore = 0;
  var count = 0

  while (count < 5) {
    var computerChoice = computerPlay();
    var playerChoice;

    while (notValid) {
      playerChoice = prompt('Choose: Rock, Paper, Scissor');
      validInput(playerChoice);
    }

    var result = playRound(playerChoice, computerChoice);
    console.log(result);

    if (/WIN/.test(result)) {
      playerScore += 1;
    } else if (/LOSE/.test(result)) {
      computerScore += 1;
    }

    count += 1;
    notValid = true;
  }

  console.log('===== GAME OVER =====');
  if (playerScore > computerScore) {
    var difference = playerScore - computerScore;
    console.log('YOU WIN by ' + difference + ' point(s)');
  } else if (playerScore < computerScore) {
    var difference = computerScore - playerScore;
    console.log('YOU LOSE by ' + difference + ' point(s)');
  } else {
    console.log('UNBELIEVABLE ITS A DRAW');
  }

  console.log('Player:\t', playerScore);
  console.log('CPU:\t', computerScore);
}
