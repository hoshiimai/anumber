import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    required this.number,
    required this.x,
    required this.y,
    required this.onTap,
    required this.inputNum,
    // required this.candidate,
    required this.isSelected,
    required this.isSameLine,
    required this.isBlock1,
    required this.isBlock2,
    required this.isBlock3,
    required this.isBlock4,
    required this.isSpecified,
    required this.isSpecified_right,
    required this.isSpecified_top,
    required this.isSpecified_bottom,
  });
  final int number;
  final int x;
  final int y;
  final Function() onTap;
  final bool inputNum;
  // final int candidate;
  final bool isSelected;
  final bool isSameLine;
  final bool isBlock1;
  final bool isBlock2;
  final bool isBlock3;
  final bool isBlock4;
  final bool isSpecified;
  final bool isSpecified_right;
  final bool isSpecified_top;
  final bool isSpecified_bottom;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: (screenSize.width)/10,
        height: (screenSize.width)/10,
        child: Container(
          decoration: BoxDecoration(
            color
                // :isSpecified
                // ? Colors.blue[900]
                : isSelected
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
                color: isSpecified ? Colors.red : Colors.black,
                width: (x % 3 == 0 || isSpecified) ? 2 : 0,
              ),
              right: BorderSide(
                color: isSpecified_right ? Colors.red : Colors.black,
                width: (x == 8 || isSpecified_right) ? 2 : 0,
              ),
              top: BorderSide(
                color: isSpecified_top ? Colors.red : Colors.black,
                width: (y % 3 == 0 || isSpecified_top) ? 2 : 0,
              ),
              bottom: BorderSide(
                color: isSpecified_bottom ? Colors.red : Colors.black,
                width: (y == 8 || isSpecified_bottom) ? 2 : 0,
              ),
            ),
          ),
          child: Center(
            child: Text(
              number == 0 ? '' : number.toString(),
              style: TextStyle(
                color: inputNum ? Colors.blue[900] : Colors.black,
                // fontWeight: FontWeight.bold,
                // fontSize: number == 9 ? (screenSize.width)*1/45 : (screenSize.width)*3/50
                fontSize: (screenSize.width)*3/45
              ),
            ),
          ),
        ),
      ),
    );
  }
}
