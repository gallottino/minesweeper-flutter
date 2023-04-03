import 'package:flutter/material.dart';
import 'package:minesweeper/widgets/cell.dart';
import 'package:minesweeper/logic/minesweeper.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  Minesweeper logic = Minesweeper(20, 20);

  @override
  void initState() {
    super.initState();
  }

  Column generateGrid() {
    List<Row> rows = [];
    for (int i = 0; i < logic.nRow; i++) {
      List<Widget> current = [];
      for (int j = 0; j < logic.nCol; j++) {
        current.add(Cell(
            number: logic.game[i][j],
            onClick: () {
              setState(() {
                logic.interact(i, j);
              });
            }));
      }
      rows.add(Row(
        children: current,
      ));
    }

    return Column(
      children: rows,
    );
  }

  @override
  Widget build(BuildContext context) {
    return generateGrid();
  }
}
