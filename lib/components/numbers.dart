import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  ControlButton({
    super.key,
    required this.onTap,
  });
  final Function(int number) onTap;
  final List<int> numberTexts = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  static bool editPressing = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => onTap(0),
          child: const Icon(Icons.undo),
        ),
        const Icon(
          Icons.auto_fix_high_outlined,
          size: 30.0,
        ),
        IconButton(
          icon: const Icon(Icons.mode_edit, size: 30.0,),
          onPressed: () {
            editPressing = true;
          },
        ),
        const Icon(
          Icons.tips_and_updates_outlined,
          size: 30.0,
        ),
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
  static bool editPressing = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (final int i in numberTexts) _number(i),
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
          // color: editPressing ? Colors.blueGrey : Colors.blue[900],
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
