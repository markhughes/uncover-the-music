export function createGrid(array: number[], rows: number, cols: number) {
  const grid = [];
  for (let i = 0; i < rows; i++) {
    const row = array.slice(i * cols, i * cols + cols);
    grid.push(row);
  }
  return grid;
}
