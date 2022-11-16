import 'package:flutter/material.dart';
import 'package:anumber/components/grid.dart';
import 'package:anumber/components/numbers.dart';

class Sudoku extends StatefulWidget {
  const Sudoku({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SudokuState createState() => _SudokuState();
}

class _SudokuState extends State<Sudoku> {
  List<List<int>> init = [
    [9, 0, 0, 5, 0, 4, 0, 7, 0],
    [0, 8, 5, 3, 6, 0, 4, 2, 9],
    [0, 0, 4, 0, 0, 9, 0, 0, 0],
    [0, 2, 7, 9, 0, 5, 0, 0, 0],
    [0, 4, 9, 0, 0, 0, 2, 0, 7],
    [0, 3, 0, 0, 0, 6, 9, 0, 0],
    [0, 0, 8, 0, 9, 0, 0, 0, 0],
    [4, 9, 0, 0, 0, 0, 0, 3, 2],
    [0, 0, 0, 0, 0, 0, 1, 9, 0]
  ];

  List<List<int>> data = [
    [9, 0, 0, 5, 0, 4, 0, 7, 0],
    [0, 8, 5, 3, 6, 0, 4, 2, 9],
    [0, 0, 4, 0, 0, 9, 0, 0, 0],
    [0, 2, 7, 9, 0, 5, 0, 0, 0],
    [0, 4, 9, 0, 0, 0, 2, 0, 7],
    [0, 3, 0, 0, 0, 6, 9, 0, 0],
    [0, 0, 8, 0, 9, 0, 0, 0, 0],
    [4, 9, 0, 0, 0, 0, 0, 3, 2],
    [0, 0, 0, 0, 0, 0, 1, 9, 0]
  ];

  Map<String, dynamic> _selected = {
    'x': 0,
    'y': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SudokuGrid(
          init: init,
          data: data,
          selectedX: _selected['x'],
          selectedY: _selected['y'],
          onTap: (int x, int y) {
            setState(() {
              _selected = {
                'x': x,
                'y': y,
              };
            });
          },
        ),
        Numbers(
          onTap: (int number) {
            if (init[_selected['y']][_selected['x']] == 0) {
              setState(() {
                data[_selected['y']][_selected['x']] = number;
              });
            }
          },
        ),
      ],
    );
  }
}
