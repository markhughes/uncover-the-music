// this can be merged with countAdjacentDuplicates, maybe add as a "return on first" or something option idk
export function hasAdjacentDuplicates(grid: number[][]) {
  const rows = grid.length;
  const cols = grid[0].length;

  for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
      if (j < cols - 1 && grid[i][j] === grid[i][j + 1]) {
        return true; // check right
      }
      if (i < rows - 1 && grid[i][j] === grid[i + 1][j]) {
        return true; // check down
      }
    }
  }
  return false;
}
