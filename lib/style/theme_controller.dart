import 'package:flutter/material.dart';

abstract class AppColors {



  static int _colorState = 1;
  
  static int get colorState => _colorState;
  
  static set colorState(int value) {
    _colorState = value;
    switchTheme();
  }
  
  static Color get isBlock => _isBlock;
  static Color get isOther => _isOther;
  static Color get isSelect => _isSelect;
  static Color get isLine => _isLine;
  static Color get isText => _isText;
  static Color get isInput => _isInput;
  static Color get isConfirmButton => _isConfirmButton;
  static Color get isButtonLine => _isButtonLine;
  static Color get isButtonText => _isButtonText;
  


  static Color _isBlock = Color(0xFFE1E7ED);
  static Color _isOther = Color(0xFFFAFAFA);
  static Color _isSelect = Color(0xFFBBE1FB);
  static Color _isLine = Colors.black;
  static Color _isText = Colors.black;
  static Color _isInput = Colors.blue[900]!;
  static Color _isConfirmButton = Colors.white;
  static Color _isButtonLine = Colors.transparent;
  static Color _isButtonText = Colors.blue[900]!;


  static void switchTheme() {
    _isBlock  = _colorState == 1 ? Color.fromRGBO(225, 232, 237, 1)
              : _colorState == 2 ? const Color(0xFF202124)
                                :  const Color(0xFFFFE4B5);

    _isOther  = _colorState == 1 ? const Color(0xFFFAFAFA)
              : _colorState == 2 ? Color.fromARGB(255, 4, 4, 12)
                                :  const Color(0xFFFFF8DC);

    _isSelect = _colorState == 1 ? const Color(0xFFBBE1FB)
              : _colorState == 2 ? Colors.blueGrey
                                 : const Color(0xFFBBD8FA);

    _isLine   = _colorState == 1 ? Colors.black
              : _colorState == 2 ? Colors.white70
                                 : Colors.black;

    _isText   = _colorState == 1 ? Colors.black
              : _colorState == 2 ? Colors.white70
                                 : Colors.black;

    _isInput  = _colorState == 1 ? Colors.blue[900]!
              : _colorState == 2 ? Colors.blue[900]!
                                 : Colors.blue[900]!;

    _isConfirmButton  = _colorState == 1 ? Colors.white
                      : _colorState == 2 ? const Color(0xFF202124)
                                         : const Color(0xFFFFE4B5);

    _isButtonLine     = _colorState == 1 ? Colors.transparent
                      : _colorState == 2 ? const Color(0xFF202124)
                                         : Colors.transparent;

    _isButtonText     = _colorState == 1 ? Colors.blue[900]!
                      : _colorState == 2 ? Colors.white70
                                         : Colors.blue[900]!;
  }
}

// final appTheme = ThemeData(
//   fontFamily: 'Coolvetica',
//   primaryColor: AppColors.primary,
//   backgroundColor: AppColors.primary,
//   accentColor: AppColors.accent,
//   appBarTheme: const AppBarTheme(
//     textTheme: TextTheme(),
//     color: AppColors.accent,
//   ),
// );

// final appThemeDark = ThemeData(
//   fontFamily: 'Coolvetica',
//   primaryColor: AppColors.primaryDark,
//   backgroundColor: AppColors.primaryDark,
//   accentColor: AppColors.accentDark,
//   appBarTheme: const AppBarTheme(
//     textTheme: TextTheme(),
//     color: AppColors.grey,
//   ),
// );

// abstract class AppColors {

//   static int colorState = 3;

//   static Color isBlock1 = colorState == 1 ?Color(0xFFE1E7ED)
//                         : colorState == 2 ? Color(0xFF1F1F1F)
//                                           : Color(0xffffe4b5);


//   static const primary = Color(0xFFD6E4EE);
//   static const primaryDark = Color(0xFFC2C2C2);
//   static const accent = Color(0xFF668BA6);
//   static const accentDark = Color(0xFFF0F0F0);
//   static const black = Color(0xFF000000);
//   static const white = Color(0xFFFFFFFF);
//   static const grey = Color(0xFFC2C2C2);
//   static const red = Color(0xFFBA3939);
//   static const lightGrey = Color(0xFFF0F0F0);
//   static const darkGrey = Color(0xFF5A5B56);
//   static const green = Color(0xFF5AD3A9);
//   static const highlight = Color(0xFFD6DBDF);
//   static const highlightDark = Color(0xFFC9C7C7);
// }