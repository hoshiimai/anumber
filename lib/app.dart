import 'package:anumber/help.dart';
import 'package:anumber/home.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        fontFamily: 'Noto Sans JP',
      ),
      debugShowCheckedModeBanner: false, // debugモードのバナーを非表示にする
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static final _screens = [
    Home(),
    Help()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.blue[900],), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.help_outline, color: Colors.blue[900],), label: '遊び方'),
        ],
        type: BottomNavigationBarType.fixed,
      )
    );
  }
}