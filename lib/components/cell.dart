import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    required this.number,
    required this.x,
    required this.y,
    required this.onTap,
    required this.inputNum,
    required this.isSelected,
    required this.isSameLine,
    required this.isBlock1,
    required this.isBlock2,
    required this.isBlock3,
    required this.isBlock4,
  });
  final int number;
  final int x;
  final int y;
  final Function() onTap;
  final bool inputNum;
  final bool isSelected;
  final bool isSameLine;
  final bool isBlock1;
  final bool isBlock2;
  final bool isBlock3;
  final bool isBlock4;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: (_screenSize.width)/10,
        height: (_screenSize.width)/10,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.blue[100]
                : isBlock1
                ? const Color(0xffffe4b5)
                : isBlock2
                ? const Color(0xffffe4b5)
                : isBlock3
                ? const Color(0xffffe4b5)
                : isBlock4
                ? const Color(0xffffe4b5)
                : isSameLine
                ? const Color(0xffffe4b5)
                : const Color(0xfffff8dc),
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
              style: TextStyle(
                color: inputNum ? Colors.blue[900] : Colors.black,
                fontSize: (_screenSize.width)*3/50
              ),
            ),
          ),
        ),
      ),
    );
  }
}
