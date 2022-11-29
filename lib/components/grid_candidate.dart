/*
****************************************
機能：候補のリストを左上から順番に処理する
IN：候補のリスト
OUT：候補の数字
----------------------------------------
履歴：
****************************************
*/
import 'package:flutter/material.dart';
import 'package:anumber/components/cell_candidate.dart';


class CandidateGrid extends StatelessWidget {
  const CandidateGrid({
    super.key,
    required this.candidate,
  });
  final List<List<int>> candidate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final MapEntry<int, List<int>> r in candidate.asMap().entries)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final MapEntry<int, int> c in r.value.asMap().entries)
                  Candidate(
                    number: c.value,
                  ),
            ],
          ),
      ],
    );
  }
}
