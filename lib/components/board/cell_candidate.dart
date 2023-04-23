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
        // width:(screenSize.width)/28.5,
        // height:(screenSize.width)/28.5,
        width: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9)/3 : ((screenSize.height) * 0.45 /9)/3,
        height:(screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9)/3 : ((screenSize.height) * 0.45 /9)/3,

        child: Center(
          child: Text(
            number == 0 ? '' : number.toString(),
            style: TextStyle(
                color: Colors.grey[600],
                fontFamily: "Nunito",
                fontSize: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? (((screenSize.width) * 0.97 / 9) *0.71)/2.5 : (((screenSize.height) * 0.45 / 9) *0.71)/2.5,
            ),
          ),
        ),
      ),
    );
  }
}
