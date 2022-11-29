/*
****************************************
機能：候補の数字描画
IN：候補の数字
OUT：候補の数字(描画)
----------------------------------------
履歴：
****************************************
*/
import 'package:flutter/material.dart';

class Candidate extends StatelessWidget {
  const Candidate({
    super.key,
    required this.number,
  });
  final int number;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      child: SizedBox(
        width:(screenSize.width)/28.5,
        height:(screenSize.width)/28.5,

        child: Center(
          child: Text(
            number == 0 ? '' : number.toString(),
            style: TextStyle(
                color: Colors.grey[600],
                // fontWeight: FontWeight.bold,
                fontSize: (screenSize.width)*1.4/45),
          ),
        ),
      ),
      // ),
    );
  }
}
