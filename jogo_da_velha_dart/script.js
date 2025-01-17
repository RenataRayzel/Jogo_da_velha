const board = document.getElementById('board');
const cells = document.querySelectorAll('.cell');
let currentPlayer = '🌙';

cells.forEach(cell => cell.addEventListener('click', handleCellClick));

function handleCellClick(event) {
  const cell = event.target;
  const index = cell.getAttribute('data-index');

  if (cell.textContent === '') {
    cell.textContent = currentPlayer;
    if (checkWin(currentPlayer)) {
      alert(`${currentPlayer} venceu!`);
      resetBoard();
    } else if (Array.from(cells).every(cell => cell.textContent !== '')) {
      alert('Empate!');
      resetBoard();
    } else {
      currentPlayer = currentPlayer === '🌙' ? '⭐' : '🌙';
    }
  }
}

function checkWin(player) {
  const winPatterns = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  return winPatterns.some(pattern => 
    pattern.every(index => cells[index].textContent === player)
  );
}

function resetBoard() {
  cells.forEach(cell => cell.textContent = '');
  currentPlayer = 'X';
}
