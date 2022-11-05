import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  const Square({
    required this.number,
    required this.onTap,
    required this.isSelected,
    required this.fill,
  });
  final int number;
  final Function() onTap;
  final bool isSelected;
  final bool fill;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 30,
        height: 30,
        child: Container(
          decoration: BoxDecoration(
            color: fill ? Colors.grey[300] : Colors.white,
            border: Border.all(
              color: isSelected ? Colors.red : Colors.blue,
            ),
          ),
          child: Center(
            child: Text(
              number == 0 ? '' : number.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
