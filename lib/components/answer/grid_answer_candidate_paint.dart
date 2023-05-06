/*
****************************************
機能：候補のリストを左上から順番に処理する
IN：候補のリスト
OUT：候補の数字
----------------------------------------
履歴：
****************************************
*/
import 'package:anumber/components/answer/cell_answer_candidate_paint.dart';
import 'package:flutter/material.dart';


class AnswerCandidateGridPaint extends StatelessWidget {
  const AnswerCandidateGridPaint({
    super.key,
    required this.paintCandidate,
  });
  final List<List<int>> paintCandidate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final MapEntry<int, List<int>> r in paintCandidate.asMap().entries)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final MapEntry<int, int> c in r.value.asMap().entries)
                AnswerCandidatePaint(
                  x: c.key,
                  y: r.key,
                ),
            ],
          ),
      ],
    );
  }
}
