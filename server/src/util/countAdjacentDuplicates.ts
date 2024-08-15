export function countAdjacentDuplicates(grid: number[][]) {
  const rows = grid.length;
  const cols = grid[0].length;
  let count = 0;

  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (j < cols - 1 && grid[i][j] === grid[i][j + 1]) {
        count++; // check right
      }
      if (i < rows - 1 && grid[i][j] === grid[i + 1][j]) {
        count++; // check down
      }
    }
  }

  return count;
}
