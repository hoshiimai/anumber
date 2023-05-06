  // @override
  // Widget build(BuildContext context) {
  //   var screenSize = MediaQuery.of(context).size;

  //   return Container(
  //     width: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 3 : ((screenSize.height) * 0.45 / 9) / 3,
  //     height: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 3 : ((screenSize.height) * 0.45 / 9) / 3,
  //     child: Center(
  //       child: Stack(
  //         children: [
  //           Center(
  //             child: Text(
  //               number == 0 ? '' : number.toString(),
  //               style: TextStyle(
  //                 color:  isCell ? Colors.red 
  //                                : isNum || isFalse
  //                                ?Colors.white
  //                                : Colors.grey[600],
  //                 fontFamily: "Nunito",
  //                 fontWeight: isCell ? FontWeight.bold : null, 
  //                 fontSize: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? (((screenSize.width) * 0.97 / 9) *0.71)/2.5 : (((screenSize.height) * 0.45 / 9) *0.71)/2.5,
  //               ),
  //             ),
  //           ),
  //         ],
  //       )
  //     )
  //   );
  // }