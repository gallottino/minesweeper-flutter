import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:minesweeper/logic/minesweeper.dart';

void main() {
  test("Game", () {
    Minesweeper game = Minesweeper(10, 10);
    game.printGame();
  });
}
