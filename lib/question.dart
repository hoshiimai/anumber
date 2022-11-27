/*
****************************************
機能：問題、解答、ヒント、指定マスの管理
----------------------------------------
履歴：
****************************************
*/

abstract class Data {
  
  static var selectedX = 4;
  static var selectedY = 4;

  static List<List<int>> init = [
    [9, 4, 0, 0, 0, 0, 0, 0, 7],
    [0, 0, 8, 0, 0, 5, 3, 0, 0],
    [0, 0, 0, 0, 0, 6, 0, 8, 0],
    [6, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 5, 0, 0, 0, 7, 6, 0],
    [7, 0, 0, 0, 0, 0, 9, 0, 0],
    [0, 0, 0, 0, 0, 7, 0, 0, 0],
    [0, 0, 0, 9, 8, 0, 0, 7, 2],
    [2, 0, 0, 6, 0, 0, 5, 4, 0]
  ];

  static List<List<int>> data = [
    [9, 4, 0, 0, 0, 0, 0, 0, 7],
    [0, 0, 8, 0, 0, 5, 3, 0, 0],
    [0, 0, 0, 0, 0, 6, 0, 8, 0],
    [6, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 5, 0, 0, 0, 7, 6, 0],
    [7, 0, 0, 0, 0, 0, 9, 0, 0],
    [0, 0, 0, 0, 0, 7, 0, 0, 0],
    [0, 0, 0, 9, 8, 0, 0, 7, 2],
    [2, 0, 0, 6, 0, 0, 5, 4, 0]
  ];

  static List<List<int>> tmp = [
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
//---------------------------------------------------------------------------
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
//---------------------------------------------------------------------------
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
//---------------------------------------------------------------------------
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
//---------------------------------------------------------------------------
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
//---------------------------------------------------------------------------
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
//---------------------------------------------------------------------------
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
//---------------------------------------------------------------------------
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
//---------------------------------------------------------------------------
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
    [0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0,  0,0,0],
  ];
}

