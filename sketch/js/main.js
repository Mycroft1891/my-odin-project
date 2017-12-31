let container      = document.querySelector('#main');
let containerWidth = parseInt(window.getComputedStyle(container)['width']);

window.onload = () => {
  createGrid(15);
}

function createGrid(c) {
  let computedWidth = containerWidth / c;

  for (var i = 0; i < c; i++) {
    let row = document.createElement('div');
    row.classList.add('grid-row');

    for (var j = 0; j < c; j++) {
      let column = document.createElement('div');
      column.classList.add('grid-col');
      row.appendChild(column);
    }

    container.appendChild(row);
  }

  document.querySelectorAll('.grid-col').forEach(cell => {
  	cell.style.width = `${computedWidth}px`;
  	cell.style.height = `${computedWidth}px`;
    cell.addEventListener('mouseenter', hoveredCell);
  });
}

function createNewGrid() {
  let userChoice = prompt('How many Columns and Rows do you want ?');
  let parsedChoice = parseInt(userChoice);

  if (isNaN(parsedChoice)) {
    alert(`${userChoice} is not a valid number`);
    return
  }

  document.querySelectorAll('.grid-row').forEach(row => {
    container.removeChild(row);
  });

  createGrid(parsedChoice);
}

function hoveredCell() {
  this.classList.add('hovered');
}
