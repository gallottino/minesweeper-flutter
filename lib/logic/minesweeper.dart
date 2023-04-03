const bomb = 88;
const empty = 0;

/*
[-1,-1], [-1, 0], [-1, 1],
[ 0,-1],          [ 0, 1],
[ 1,-1], [ 1, 0], [ 1, 1]
*/
const offset = [
  [-1, -1],
  [-1, 0],
  [-1, 1],
  [0, -1],
  [0, 1],
  [1, -1],
  [1, 0],
  [1, 1]
];

class Minesweeper {
  int width = 0;
  int height = 0;
  List<List<int>> game = [[]];
  List<List<int>> status = [[]];

  Minesweeper(this.width, this.height) {
    game = [];
    for (int i = 0; i < height; i++) {
      game[i] = [];
      for (int j = 0; j < width; j++) {
        game[i][j] = 0;
      }
    }
  }

  generateBombs() {}

  bool interact(int i, int j) {
    game[i][j] = status[i][j];

    switch (status[i][j]) {
      case empty:
        show(i, j);
        break;
      case bomb:
        return false;
    }

    return true;
  }

  void show(int i, int j) {
    game[i][j] = status[i][j];

    if (i < 0 && i >= height) return;
    if (j < 0 && j >= width) return;
    if (status[i][j] != 0) {
      return;
    }

    for (var off in offset) {
      show(i + off[0], j + off[1]);
    }
  }
}
