/*
****************************************
機能：候補のリストを左上から順番に処理する
IN：候補のリスト
OUT：候補の数字
----------------------------------------
履歴：
****************************************
*/
import 'package:anumber/components/answer/cell_answer_candidate.dart';
import 'package:anumber/infomation.dart';
import 'package:flutter/material.dart';


class AnswerCandidateGrid extends StatelessWidget {
  const AnswerCandidateGrid({
    super.key,
    required this.candidate,
    required this.candianim,
  });
  final List<List<int>> candidate;
  final List<List<int>> candianim;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final MapEntry<int, List<int>> r in candidate.asMap().entries)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final MapEntry<int, int> c in r.value.asMap().entries)
                AnswerCandidat(
                  number: c.value,
                  isNum: candianim[r.key][c.key] == 888,
                  isCell: candianim[r.key][c.key] == 999,
                  isVertical: candianim[r.key][c.key] == 444,
                  isHorizontal: candianim[r.key][c.key] == 555,
                  isFalse: candianim[r.key][c.key] == 444,
                  isStart: candianim[r.key][c.key] == 111,
                  // endPoint: Infomation.endList,
                  x: c.key,
                  y: r.key,
                ),
            ],
          ),
      ],
    );
  }
}
