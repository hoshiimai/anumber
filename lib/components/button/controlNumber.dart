import 'package:flutter/material.dart';

import '../../infomation.dart';

// 数字削除ボタン押下時に実行
void deleteNumber(StateSetter setState, int number) {
  if (Infomation.init[ Infomation.selectedY][ Infomation.selectedX] == 0) {
    setState(() {
      Infomation.zero[ Infomation.selectedY][ Infomation.selectedX] = number;
      Infomation.tmp[3 * Infomation.selectedY][3 * Infomation.selectedX] = 0;
      Infomation.tmp[3 * Infomation.selectedY][3 * Infomation.selectedX + 1] = 0;
      Infomation.tmp[3 * Infomation.selectedY][3 * Infomation.selectedX + 2] = 0;
      Infomation.tmp[3 * Infomation.selectedY + 1][3 * Infomation.selectedX] = 0;
      Infomation.tmp[3 * Infomation.selectedY + 1][3 * Infomation.selectedX + 1] =0;
      Infomation.tmp[3 * Infomation.selectedY + 1][3 * Infomation.selectedX + 2] =0;
      Infomation.tmp[3 * Infomation.selectedY + 2][3 * Infomation.selectedX] = 0;
      Infomation.tmp[3 * Infomation.selectedY + 2][3 * Infomation.selectedX + 1] =0;
      Infomation.tmp[3 * Infomation.selectedY + 2][3 * Infomation.selectedX + 2] =0;

      addHistory();
    });
  }
}

// 数字入力ボタン押下時に実行
void controlNumber(StateSetter setState, bool isEdit, int number) {
  if (Infomation.init[ Infomation.selectedY][ Infomation.selectedX] == 0) {
    if (isEdit == true && Infomation.zero[ Infomation.selectedY][ Infomation.selectedX] == 0) {
      if (number == 1) {
        setState(() {
          Infomation.tmp[3 * Infomation.selectedY][3 * Infomation.selectedX] =
          Infomation.tmp[3 * Infomation.selectedY][3 * Infomation.selectedX] == number ? 0 : number;
        });

        addHistory();
      } else if (number == 2) {
        setState(() {
          Infomation.tmp[3 * Infomation.selectedY][3 * Infomation.selectedX + 1] =
          Infomation.tmp[3 * Infomation.selectedY][3 * Infomation.selectedX + 1] == number ? 0 : number;
        });

        addHistory();
      } else if (number == 3) {
        setState(() {
          Infomation.tmp[3 * Infomation.selectedY][3 * Infomation.selectedX + 2] = 
          Infomation.tmp[3 * Infomation.selectedY][3 * Infomation.selectedX + 2] == number ? 0 : number;
        });

        addHistory();
      } else if (number == 4) {
        setState(() {
          Infomation.tmp[3 * Infomation.selectedY + 1][3 * Infomation.selectedX] =
          Infomation.tmp[3 * Infomation.selectedY + 1][3 * Infomation.selectedX] == number ? 0 : number;
        });

        addHistory();
      } else if (number == 5) {
        setState(() {
          Infomation.tmp[3 * Infomation.selectedY + 1][3 * Infomation.selectedX + 1] =
          Infomation.tmp[3 * Infomation.selectedY + 1][3 * Infomation.selectedX + 1] == number ? 0 : number;
        });

        addHistory();
      } else if (number == 6) {
        setState(() {
          Infomation.tmp[3 * Infomation.selectedY + 1][3 * Infomation.selectedX + 2] =
          Infomation.tmp[3 * Infomation.selectedY + 1][3 * Infomation.selectedX + 2] == number ? 0 : number;
        });

        addHistory();
      } else if (number == 7) {
        setState(() {
          Infomation.tmp[3 * Infomation.selectedY + 2][3 * Infomation.selectedX] =
          Infomation.tmp[3 * Infomation.selectedY + 2][3 * Infomation.selectedX] == number ? 0 : number;
        });

        addHistory();
      } else if (number == 8) {
        setState(() {
          Infomation.tmp[3 * Infomation.selectedY + 2][3 * Infomation.selectedX + 1] =
          Infomation.tmp[3 * Infomation.selectedY + 2][3 * Infomation.selectedX + 1] == number ? 0 : number;
        });

        addHistory();
      } else if (number == 9) {
        setState(() {
          Infomation.tmp[3 * Infomation.selectedY + 2][3 * Infomation.selectedX + 2] =
          Infomation.tmp[3 * Infomation.selectedY + 2][3 * Infomation.selectedX + 2] == number ? 0 : number;
        });

        addHistory();
      }
    } else if (isEdit == false) {
      setState(() {
        Infomation.zero[Infomation.selectedY][Infomation.selectedX] = number;
        Infomation.tmp[3 * Infomation.selectedY][3 * Infomation.selectedX] = 0;
        Infomation.tmp[3 * Infomation.selectedY][3 * Infomation.selectedX + 1] = 0;
        Infomation.tmp[3 * Infomation.selectedY][3 * Infomation.selectedX + 2] = 0;
        Infomation.tmp[3 * Infomation.selectedY + 1][3 * Infomation.selectedX] = 0;
        Infomation.tmp[3 * Infomation.selectedY + 1][3 * Infomation.selectedX + 1] = 0;
        Infomation.tmp[3 * Infomation.selectedY + 1][3 * Infomation.selectedX + 2] = 0;
        Infomation.tmp[3 * Infomation.selectedY + 2][3 * Infomation.selectedX] = 0;
        Infomation.tmp[3 * Infomation.selectedY + 2][3 * Infomation.selectedX + 1] = 0;
        Infomation.tmp[3 * Infomation.selectedY + 2][3 * Infomation.selectedX + 2] = 0;
      });

      addHistory();
    }
  }
}

Future<void> addHistory() async {
  await Future.delayed(Duration.zero); // 非同期処理を実行するためのdelay
  if(Infomation.historyList.length == 1 && Infomation.tmp_historyList.length == 1) {
    Infomation.historyList.removeLast();
    Infomation.tmp_historyList.removeLast();

    Infomation.historyList.add(List.from(
     Infomation.init.map((row) => List<int>.from(row))
    ));
    Infomation.tmp_historyList.add(List.from(
      Infomation.tmp.map((row) => List<int>.from(row))
    ));
  }

  Infomation.historyList.add(List.from(
    Infomation.zero.map((row) => List<int>.from(row))
  ));
  Infomation.tmp_historyList.add(List.from(
    Infomation.tmp.map((row) => List<int>.from(row))
  ));
  Infomation.selected_historyList.add([Infomation.selectedX, Infomation.selectedY]);
}
