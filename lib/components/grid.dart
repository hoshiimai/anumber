import 'package:flutter/material.dart';
import 'package:anumber/components/cell.dart';

class SudokuGrid extends StatelessWidget {
  const SudokuGrid({
    super.key,
    required this.data,
    required this.onTap,
    required this.selectedX,
    required this.selectedY,
  });
  final List<List<int>> data;
  final Function(int x, int y) onTap;
  final int selectedX;
  final int selectedY;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final MapEntry<int, List<int>> r in data.asMap().entries)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final MapEntry<int, int> c in r.value.asMap().entries)
                Cell(
                  number: c.value,
                  isSelected: selectedX == c.key && selectedY == r.key,
                  isSameLine: selectedX == c.key || selectedY == r.key,
                  x: c.key,
                  y: r.key,
                  onTap: () => onTap(c.key, r.key),
                ),
            ],
          ),
      ],
    );
  }
}
