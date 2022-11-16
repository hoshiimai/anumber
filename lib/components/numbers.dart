import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  ControlButton({
    super.key,
    required this.onTap,
  });
  final Function(int number) onTap;
  final List<int> numberTexts = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () => onTap(0),
          child: const Icon(Icons.undo),
        )
      ],
    );
  }
}


class Numbers extends StatelessWidget {
  Numbers({
    super.key,
    required this.onTap,
  });
  final Function(int number) onTap;
  final List<int> numberTexts = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (final int i in numberTexts) _number(i),
        GestureDetector(
          onTap: () => onTap(0),
          child: const Icon(Icons.restore),
        )
      ],
    );
  }

//数字入力ボタン
  Widget _number(int number) {
    return GestureDetector(
      onTap: () => onTap(number),
      child: Text(
        number.toString(),
        style: const TextStyle(
          color: Colors.blueGrey,
          fontSize: 35,
        ),
      ),
    );
  }

  //数字入力ボタン(候補用)
  Widget _candidate(int number) {
    return GestureDetector(
      onTap: () => onTap(number),
      child: Text(
        number.toString(),
        style: const TextStyle(
          color: Colors.blueGrey,
          fontSize: 35,
        ),
      ),
    );
  }
}


