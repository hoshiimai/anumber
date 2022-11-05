import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    required this.number,
    required this.x,
    required this.y,
    required this.onTap,
    required this.isSelected,
    required this.isSameLine,
  });
  final int number;
  final int x;
  final int y;
  final Function() onTap;
  final bool isSelected;
  final bool isSameLine;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 30,
        height: 30,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.yellow[300]
                : isSameLine
                    ? Colors.blue[100]
                    : Colors.white,
            border: Border(
              left: BorderSide(
                color: Colors.black,
                width: (x % 3 == 0) ? 2 : 0,
              ),
              right: BorderSide(
                color: Colors.black,
                width: (x == 8) ? 2 : 0,
              ),
              top: BorderSide(
                color: Colors.black,
                width: (y % 3 == 0) ? 2 : 0,
              ),
              bottom: BorderSide(
                color: Colors.black,
                width: (y == 8) ? 2 : 0,
              ),
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
