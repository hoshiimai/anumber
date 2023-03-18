  // final List<int> line1=[0,1,2],line2=[3,4,5],line3=[6,7,8],
  //                 column1=[0,1,2],column2=[3,4,5],column3=[6,7,8];
  
  // line1.shuffle();
  // line2.shuffle();
  // line3.shuffle();
  // column1.shuffle();
  // column2.shuffle();
  // column3.shuffle();

  // List<List<int>> shuffle1 = [
  //   [9, 4, 0, 0, 0, 0, 0, 0, 7],
  //   [0, 0, 8, 0, 0, 5, 3, 0, 0],
  //   [0, 0, 0, 0, 0, 6, 0, 8, 0],
  //   [6, 0, 0, 0, 0, 0, 0, 0, 0],
  //   [0, 1, 5, 0, 0, 0, 7, 6, 0],
  //   [7, 0, 0, 0, 0, 0, 9, 0, 0],
  //   [0, 0, 0, 0, 0, 7, 0, 0, 0],
  //   [0, 0, 0, 9, 8, 0, 0, 7, 2],
  //   [2, 0, 0, 6, 0, 0, 5, 4, 0]
  // ];
  
  // List<List<int>> shuffle2 = List.generate(9, (_) => List.filled(9, 0));
  // List<List<int>> init = List.generate(9, (_) => List.filled(9, 0));

  // for (var i = 0; i < 9; i++) {
  //   for (var j = 0; j < 9; j++) {
  //     for (var l = 0; l < 9; l++) { 
  //       shuffle2[0][l] = number[shuffle1[line1[0]][l]];
  //       shuffle2[1][l] = number[shuffle1[line1[1]][l]];
  //       shuffle2[2][l] = number[shuffle1[line1[2]][l]];
  //       shuffle2[3][l] = number[shuffle1[line2[0]][l]];
  //       shuffle2[4][l] = number[shuffle1[line2[1]][l]];
  //       shuffle2[5][l] = number[shuffle1[line2[2]][l]];
  //       shuffle2[6][l] = number[shuffle1[line3[0]][l]];
  //       shuffle2[7][l] = number[shuffle1[line3[1]][l]];
  //       shuffle2[8][l] = number[shuffle1[line3[2]][l]];
  //     }
  //     for (var r = 0; r < 9; r++) {
  //       init[r][0] = number[shuffle2[r][column1[0]]];
  //       init[r][1] = number[shuffle2[r][column1[1]]];
  //       init[r][2] = number[shuffle2[r][column1[2]]];
  //       init[r][3] = number[shuffle2[r][column2[0]]];
  //       init[r][4] = number[shuffle2[r][column2[1]]];
  //       init[r][5] = number[shuffle2[r][column2[2]]];
  //       init[r][6] = number[shuffle2[r][column3[0]]];
  //       init[r][7] = number[shuffle2[r][column3[1]]];
  //       init[r][8] = number[shuffle2[r][column3[2]]];
  //     }
  //   }
  // }
  