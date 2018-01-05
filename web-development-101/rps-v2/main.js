const options = ['rock', 'paper', 'scissor'];

document.querySelector('a[data-key="rock"]').onclick    = game;
document.querySelector('a[data-key="paper"]').onclick   = game;
document.querySelector('a[data-key="scissor"]').onclick = game;

let player   = document.querySelector('#player');
let computer = document.querySelector('#computer');
let prompt   = document.querySelector('#game-prompt');


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
  var playerChoice   = this.dataset.key;
  var computerChoice = computerPlay();

  if(validInput(playerChoice)) return;

  player.textContent   = `Player: ${playerChoice.toUpperCase()}`;
  computer.textContent = `Computer: ${computerChoice.toUpperCase()}`
  prompt.textContent   = playRound(playerChoice, computerChoice);
}

function validInput(userInput) {
  if (!(typeof userInput === "string") || !options.includes(userInput.toLowerCase())) {
    return false;
  }
}
