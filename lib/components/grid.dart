import 'package:flutter/material.dart';
import 'package:anumber/components/cell.dart';

import '../sudoku.dart';

class SudokuGrid extends StatelessWidget {
  const SudokuGrid({
    super.key,
    required this.data,
    required this.init,
    required this.onTap,
    required this.selectedX,
    required this.selectedY,
  });
  final List<List<int>> data;
  final List<List<int>> init;
  final Function(int x, int y) onTap;
  final int selectedX;
  final int selectedY;
  static int blockX1 = 0;
  static int blockY1 = 0;
  static int blockX2 = 0;
  static int blockY2 = 0;
  static int blockX3 = 0;
  static int blockY3 = 0;
  static int blockX4 = 0;
  static int blockY4 = 0;



  @override
  Widget build(BuildContext context) {
    Map<int, dynamic> Block = findBlock();
    return Column(
      children: [
        for (final MapEntry<int, List<int>> r in data.asMap().entries)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final MapEntry<int, int> c in r.value.asMap().entries)
                Cell(
                  inputNum: init[r.key][c.key] == 0,
                  number: c.value,
                  isSelected: selectedX == c.key && selectedY == r.key,
                  isSameLine: selectedX == c.key || selectedY == r.key,
                  isBlock1: Block[blockX1] == c.key && Block[blockY1] == r.key,
                  isBlock2: Block[blockX2] == c.key && Block[blockY2] == r.key,
                  isBlock3: Block[blockX3] == c.key && Block[blockY3] == r.key,
                  isBlock4: Block[blockX4] == c.key && Block[blockY4] == r.key,
                  x: c.key,
                  y: r.key,
                  onTap: () => onTap(c.key, r.key),
                ),
            ],
          ),
      ],
    );
  }

  Map<int, dynamic> findBlock() {
    if ((selectedX == 0 || selectedX == 3 || selectedX == 6) &&
        (selectedY == 0 || selectedY == 3 || selectedY == 6)) { // A
      blockX1 = selectedX + 1;
      blockY1 = selectedY + 1;
      blockX2 = selectedX + 2;
      blockY2 = selectedY + 1;
      blockX3 = selectedX + 1;
      blockY3 = selectedY + 2;
      blockX4 = selectedX + 2;
      blockY4 = selectedY + 2;

    } else if ((selectedX == 1 || selectedX == 4 || selectedX == 7) &&
          (selectedY == 0 || selectedY == 3 || selectedY == 6)) { // B
      blockX1 = selectedX - 1;
      blockY1 = selectedY + 1;
      blockX2 = selectedX - 1;
      blockY2 = selectedY + 2;
      blockX3 = selectedX + 1;
      blockY3 = selectedY + 1;
      blockX4 = selectedX + 1;
      blockY4 = selectedY + 2;

    } else if ((selectedX == 2 || selectedX == 5 || selectedX == 8) &&
        (selectedY == 0 || selectedY == 3 || selectedY == 6)) { // C
      blockX1 = selectedX - 2;
      blockY1 = selectedY + 1;
      blockX2 = selectedX - 2;
      blockY2 = selectedY + 2;
      blockX3 = selectedX - 1;
      blockY3 = selectedY + 1;
      blockX4 = selectedX - 1;
      blockY4 = selectedY + 2;

    } else if ((selectedX == 0 || selectedX == 3 || selectedX == 6) &&
        (selectedY == 1 || selectedY == 4 || selectedY == 7)) { // D
      blockX1 = selectedX + 1;
      blockY1 = selectedY - 1;
      blockX2 = selectedX + 1;
      blockY2 = selectedY + 1;
      blockX3 = selectedX + 2;
      blockY3 = selectedY - 1;
      blockX4 = selectedX + 2;
      blockY4 = selectedY + 1;

    } else if ((selectedX == 1 || selectedX == 4 || selectedX == 7) &&
        (selectedY == 1 || selectedY == 4 || selectedY == 7)) { // E
      blockX1 = selectedX - 1;
      blockY1 = selectedY - 1;
      blockX2 = selectedX - 1;
      blockY2 = selectedY + 1;
      blockX3 = selectedX + 1;
      blockY3 = selectedY - 1;
      blockX4 = selectedX + 1;
      blockY4 = selectedY + 1;

    } else if ((selectedX == 2 || selectedX == 5 || selectedX == 8) &&
        (selectedY == 1 || selectedY == 4 || selectedY == 7)) { // F
      blockX1 = selectedX - 2;
      blockY1 = selectedY - 1;
      blockX2 = selectedX - 2;
      blockY2 = selectedY + 1;
      blockX3 = selectedX - 1;
      blockY3 = selectedY - 1;
      blockX4 = selectedX - 1;
      blockY4 = selectedY + 1;

    } else if ((selectedX == 0 || selectedX == 3 || selectedX == 6) &&
        (selectedY == 2 || selectedY == 5 || selectedY == 8)) { // G
      blockX1 = selectedX + 1;
      blockY1 = selectedY - 2;
      blockX2 = selectedX + 1;
      blockY2 = selectedY - 1;
      blockX3 = selectedX + 2;
      blockY3 = selectedY - 2;
      blockX4 = selectedX + 2;
      blockY4 = selectedY - 1;

    } else if ((selectedX == 1 || selectedX == 4 || selectedX == 7) &&
        (selectedY == 2 || selectedY == 5 || selectedY == 8)) { // H
      blockX1 = selectedX - 1;
      blockY1 = selectedY - 2;
      blockX2 = selectedX - 1;
      blockY2 = selectedY - 1;
      blockX3 = selectedX + 1;
      blockY3 = selectedY - 2;
      blockX4 = selectedX + 1;
      blockY4 = selectedY - 1;

    } else if ((selectedX == 2 || selectedX == 5 || selectedX == 8) &&
        (selectedY == 2 || selectedY == 5 || selectedY == 8)) {// I
      blockX1 = selectedX - 2;
      blockY1 = selectedY - 2;
      blockX2 = selectedX - 2;
      blockY2 = selectedY - 1;
      blockX3 = selectedX - 1;
      blockY3 = selectedY - 2;
      blockX4 = selectedX - 1;
      blockY4 = selectedY - 1;
    }
    
    return {
      blockX1: blockX1,
      blockY1: blockY1,
      blockX2: blockX2,
      blockY2: blockY2,
      blockX3: blockX3,
      blockY3: blockY3,
      blockX4: blockX4,
      blockY4: blockY4
    };
  }
}
