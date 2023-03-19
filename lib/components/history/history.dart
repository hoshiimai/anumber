import 'package:flutter/material.dart';

import '../../infomation.dart';

// 戻るボタン押下時に実行
void getHistory(StateSetter setState) {
  if (Infomation.historyList.length > 1  && 
    Infomation.tmp_historyList.length > 1 && 
    Infomation.selected_historyList.length > 1) {
    setState(() {
      Infomation.historyList.removeLast();
      Infomation.tmp_historyList.removeLast();
      Infomation.selected_historyList.removeLast();

      Infomation.zero = Infomation.historyList.last;
      Infomation.tmp = Infomation.tmp_historyList.last;
       Infomation.selectedX = Infomation.selected_historyList.last[0];
       Infomation.selectedY = Infomation.selected_historyList.last[1];
    });
  } else if(Infomation.historyList.length == 1 && 
          Infomation.tmp_historyList.length == 1 && 
          Infomation.selected_historyList.length == 1) {
    setState(() {
      Infomation.zero = Infomation.historyList.first;
      Infomation.tmp = Infomation.tmp_historyList.first;
       Infomation.selectedX = Infomation.selected_historyList.first[0];
       Infomation.selectedY = Infomation.selected_historyList.first[1];
    });
  }
}
