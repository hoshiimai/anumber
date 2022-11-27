/*
****************************************
機能：候補の数字描画
IN：候補の数字
OUI：候補の数字(描画)
----------------------------------------
履歴：
****************************************
*/
import 'package:flutter/material.dart';

class Candidate extends StatelessWidget {
  const Candidate({
    super.key,
    required this.number,
    required this.isEdit,

  });
  final int number;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      child: SizedBox(
        width:(screenSize.width) / 30,
        height:(screenSize.width) / 30,

        child: Center(
          child: Text(
            number == 0 ? '' : number.toString(),
            style: TextStyle(
                color: Colors.black,
                fontSize: (screenSize.width) * 1 / 45),
          ),
        ),
      ),
      // ),
    );
  }
}
