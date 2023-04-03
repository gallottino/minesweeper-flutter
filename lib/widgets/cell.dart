import 'package:flutter/material.dart';

const tiles = {
  0: AssetImage("asset/tile0.png"),
  1: AssetImage("asset/tile1.png"),
  2: AssetImage("asset/tile2.png"),
  3: AssetImage("asset/tile3.png"),
  4: AssetImage("asset/tile4.png"),
  5: AssetImage("asset/tile5.png"),
  6: AssetImage("asset/tile6.png"),
  7: AssetImage("asset/tile7.png"),
  8: AssetImage("asset/tile8.png"),
  88: AssetImage("asset/tile88.png"),
  -1: AssetImage("asset/tile-1.png"),
};

class Cell extends StatelessWidget {
  final int number;
  final void Function()? onClick;
  const Cell({Key? key, required this.number, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              image: DecorationImage(image: tiles[number]!, fit: BoxFit.fill))),
    );
  }
}
