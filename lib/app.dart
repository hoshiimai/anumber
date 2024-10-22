import 'package:anumber/help_home.dart';
import 'package:anumber/home.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  
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
    const Home(),
    const HelpHome()
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
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.grey[200],
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.blueGrey,), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.help_outline, color: Colors.blueGrey,), label: '遊び方'),
        ],
        type: BottomNavigationBarType.fixed,
      )
    );
  }
}