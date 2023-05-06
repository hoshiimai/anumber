/*
****************************************
機能：問題、解答、ヒント、指定マスの管理
----------------------------------------
履歴：
****************************************
*/

abstract class Infomation {
  
  static int id = 0;
  static bool sound = true;
  static int specifiedX = -1;
  static int specifiedY = -1;
  static int selectedX = 0;
  static int selectedY = 0;
  static int kotae = 0;
  static int answerX = 0;
  static int answerY = 0;
  static int correctCount = 0;
  static String level = "";

  static List<int> columnList = [];
  static List<int> lineList = [];
  static List<int> candidateColumnList = [];
  static List<int> candidateLineList = [];
  static List<int> numMap = [1,2,3,4,5,6,7,8,9];


  //遊び方用リスト
  static List<List<int>> help = [
    [2, 8, 4, 0, 0, 0, 7, 0, 0],
    [0, 0, 0, 0, 0, 3, 0, 9, 0],
    [0, 0, 6, 7, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 6, 0],
    [0, 0, 0, 4, 9, 0, 0, 0, 0],
    [0, 2, 8, 0, 1, 0, 3, 0, 0],
    [6, 0, 0, 0, 4, 0, 0, 0, 1],
    [0, 0, 0, 2, 0, 5, 0, 0, 9],
    [0, 4, 0, 0, 0, 0, 8, 0, 0],
  ];

  //最初のアニメーション用リスト
  static List<List<int>> animation = List.generate(9, (_) => List.filled(9, 0));

  //最初のアニメーションリスト初期化用
  static  List<List<int>> const_animation = List.generate(9, (_) => List.filled(9, 0));

  static List<List<int>> zero = List.generate(9, (_) => List.filled(9, 0));

  // static List<List<int>> const_zero = List.generate(9, (_) => List.filled(9, 0));

  //問題のリスト
  static List<List<int>> init = List.generate(9, (_) => List.filled(9, 0));

  //全解答用のリスト
  static List<List<int>> allAnswers = List.generate(9, (_) => List.filled(9, 0));

  //候補用リスト
  static List<List<int>> tmp = List.generate(27, (_) => List.filled(27, 0));

  //解説の候補用リスト(数字表示用)
  static List<List<int>> answerCandidate = List.generate(27, (_) => List.filled(27, 0));

  //解説の候補用リスト(アニメーション用)
  static List<List<int>> animation_candidate = List.generate(27, (_) => List.filled(27, 0));




//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//解説用
  static List<List<int>> data = List.generate(9, (_) => List.filled(9, 0));

  static List<List<int>> answer = List.generate(9, (_) => List.filled(9, 0));

  static List<List<List<int>>> dataList = [];
  static List<List<List<int>>> answerList = [];
  static List<List<List<int>>> candidateList = [];
  static List<List<List<int>>> animationCandidateList = [];
  static List<List<int>> xyList = [];
  static List<int> sortingList = [];
  static List<List<int>> endList = [];
  static int initX = -1;
  static int initX1 = -1;
  static int initX2 = -1;
  static int initX3 = -1;
  static int initX4 = -1;
  static int initY = -1;
  static int initY1 = -1;
  static int initY2 = -1;
  static int initY3 = -1;
  static int initY4 = -1;
  static int frameBorderX = -100;
  static int frameBorderY = -100;
  static List<int> borderListX = [-100];
  static List<int> borderListY = [-100];
  static List<List<List<int>>> borderXYList = [];

//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//履歴取得用
  static List<List<List<int>>> historyList = [];
  static List<List<List<int>>> tmp_historyList = [];
  static List<List<int>> selected_historyList = [];

  // static List<List<int>> historyData = List.generate(9, (_) => List.filled(9, 0));


  static List<List<int>> historyTmp = List.generate(27, (_) => List.filled(27, 0));

//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
}

