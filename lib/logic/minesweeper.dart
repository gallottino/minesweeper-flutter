import 'dart:math';
import 'dart:io';

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
  int nCol = 0;
  int nRow = 0;
  List<List<int>> game = [[]];
  List<List<int>> status = [[]];

  Minesweeper(this.nCol, this.nRow) {
    initGame();
  }

  initGame() {
    status = game = [];
    for (int i = 0; i < nRow; i++) {
      game.add(<int>[]);
      status.add(<int>[]);
      for (int j = 0; j < nCol; j++) {
        status[i].add(empty);
        game[i].add(empty);
      }
    }
    generateBombs(20);
    countBombs();
  }

  generateBombs(int nBombs) {
    for (int i = 0; i < nBombs; i++) {
      int row = Random().nextInt(nRow);
      int col = Random().nextInt(nCol);
      status[row][col] = bomb;
    }
  }

  countBombs() {
    for (int i = 0; i < nRow; i++) {
      for (int j = 0; j < nCol; j++) {
        if (status[i][j] != bomb) {
          for (var off in offset) {
            if (checkOffset(i + off[0], j + off[1]) == false) continue;
            if (status[i + off[0]][j + off[1]] == bomb) {
              status[i][j] += 1;
            }
          }
        }
      }
    }
  }

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

    if (checkOffset(i, j)) return;
    if (status[i][j] != 0) {
      return;
    }

    for (var off in offset) {
      show(i + off[0], j + off[1]);
    }
  }

  bool checkOffset(int i, int j) {
    if (i < 0 || i >= nRow) return false;
    if (j < 0 || j >= nCol) return false;

    return true;
  }

  void printGame() {
    for (int i = 0; i < nRow; i++) {
      for (int j = 0; j < nCol; j++) {
        switch (status[i][j]) {
          case bomb:
            stdout.write("X");
            break;
          default:
            stdout.write(status[i][j]);
        }
        stdout.write("\t");
      }
      stdout.write("\n");
    }
  }
}
