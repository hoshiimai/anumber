import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // ここでIntroductionScreenのライブラリーを呼び出している
        child: IntroductionScreen(
          scrollPhysics: const BouncingScrollPhysics(),
          pages: [
            PageViewModel(
              // \nは改行を意味しているよ！
              title: 'アプリ紹介のページへ\nようこそ!',
              body: '１ページ目だよ！',
              image: Image.asset('assets/images/43429.jpg'),
            ),
            PageViewModel(
              title: 'アプリの使い方を説明すると\nユーザーにとって親切だよ!',
              body:
                  '2ページ目だよ!',
              image: Image.asset('assets/images/43430.jpg'),
            ),
            PageViewModel(
              title: '紹介ページを設けることで\n簡単にアプリをリッチにできるよ!',
              body: '3ページ目だよ!',
              image: Image.asset('assets/images/43431.jpg'),
            ),
            PageViewModel(
              title: '紹介ページを設けることで\n簡単にアプリをリッチにできるよ!',
              body: '3ページ目だよ!',
              image: Image.asset('assets/images/43432.jpg'),
            ),
            PageViewModel(
              title: '紹介ページを設けることで\n簡単にアプリをリッチにできるよ!',
              body: '3ページ目だよ!',
              image: Image.asset('assets/images/43433.jpg'),
            ),
          ],
          onDone: () async => Navigator.pop(context),
          showBackButton: true,
          next: const Icon(Icons.arrow_forward_ios),
          back: const Icon(Icons.arrow_back_ios),
          done: const Text(
            'OK!',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            // ここの大きさを変更することで
            // 現在の位置を表しているマーカーのUIが変更するよ!
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.blue,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:anumber/components/answer/grid_answer.dart';
// import 'package:anumber/infomation.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: DemoPage(),
//     );
//   }
// }

// class DemoPage extends StatefulWidget {
//   const DemoPage({Key? key}) : super(key: key);

//   @override
//   State<DemoPage> createState() => _DemoPageState();
// }

// class _DemoPageState extends State<DemoPage> {
//   bool _isTappable = true;
//   bool _timeRunning = false;
//   bool _timer = true;
//   final fabKey = GlobalKey();
//   int count = 0;
//   int initX =  0;
//   int initY =  0;
//   int initX1 = 0;
//   int initY1 = 0;

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 247, 246, 246),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black,),
//           onPressed: () async {
//             // _database.insertDB(DateFormat.ms().format(Stopwatch.time), Infomation.init, Infomation.zero, Infomation.tmp);
//             setState(() {
//               Infomation.animation = List<List<int>>.from(Infomation.const_animation.map((e) => List<int>.from(e)));;
//             });
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
//           },
//         ),
//         title: Text(
//           'A Number',
//           style: TextStyle(
//             color: Colors.blue[900],
//           ),
//         ),
//         elevation: 1,
//       ),
//       body: Carousel(
//         indicatorColor: Colors.amber, // インジケーターの色
//         indicatorAlignment: const Alignment(0, 0.25), // インジケーターの位置
//         pages: [
//           // ここにスクロールさせたい Widget を複数並べる
//           Column(
//             children: [
//               SizedBox(
//                 height: (screenSize.height) / 20,
//               ),
//               AnswerGrid(
//                 init: Infomation.init,
//                 data: Infomation.data,
//                 anim: Infomation.answer,
//                 selectedX: Infomation.selectedX,
//                 selectedY: Infomation.selectedY,
//                 specifiedX: Infomation.specifiedX,
//                 specifiedY: Infomation.specifiedY,
//                 isAnswerRow: initX,
//                 isAnswerColumn: initY,
//                 initX: initX1,
//                 initY: initY1,
//                 timer: _timer,
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 height: (screenSize.height) / 15,
//               ),
//               AnswerGrid(
//                 init: Infomation.init,
//                 data: Infomation.data,
//                 anim: Infomation.answer,
//                 selectedX: Infomation.selectedX,
//                 selectedY: Infomation.selectedY,
//                 specifiedX: Infomation.specifiedX,
//                 specifiedY: Infomation.specifiedY,
//                 isAnswerRow: initX,
//                 isAnswerColumn: initY,
//                 initX: initX1,
//                 initY: initY1,
//                 timer: _timer,
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 height: (screenSize.height) / 15,
//               ),
//               AnswerGrid(
//                 init: Infomation.init,
//                 data: Infomation.data,
//                 anim: Infomation.answer,
//                 selectedX: Infomation.selectedX,
//                 selectedY: Infomation.selectedY,
//                 specifiedX: Infomation.specifiedX,
//                 specifiedY: Infomation.specifiedY,
//                 isAnswerRow: initX,
//                 isAnswerColumn: initY,
//                 initX: initX1,
//                 initY: initY1,
//                 timer: _timer,
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 height: (screenSize.height) / 15,
//               ),
//               AnswerGrid(
//                 init: Infomation.init,
//                 data: Infomation.data,
//                 anim: Infomation.answer,
//                 selectedX: Infomation.selectedX,
//                 selectedY: Infomation.selectedY,
//                 specifiedX: Infomation.specifiedX,
//                 specifiedY: Infomation.specifiedY,
//                 isAnswerRow: initX,
//                 isAnswerColumn: initY,
//                 initX: initX1,
//                 initY: initY1,
//                 timer: _timer,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Carousel extends StatefulWidget {
//   const Carousel({
//     Key? key,
//     required this.pages,
//     this.indicatorColor,
//     this.indicatorAlignment,
//   }) : super(key: key);
//   final List<Widget> pages;
//   final Color? indicatorColor;
//   final Alignment? indicatorAlignment;

//   @override
//   State<Carousel> createState() => _CarouselState();
// }

// class _CarouselState extends State<Carousel> {
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     final pages = widget.pages;
//     final pageLength = pages.length;
//     final color = widget.indicatorColor ?? Theme.of(context).colorScheme.primary;
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         PageView(
//           onPageChanged: (value) {
//             // ページが切り替わったときにそのindexがvalueに入ってくる。
//             // 現在表示中のページが何番目か知りたいのでcurrentIndexにvalueを渡す。
//             setState(() {
//               currentIndex = value;
//             });
//           },
//           children: widget.pages,
//         ),
//         Align(
//           alignment: widget.indicatorAlignment ?? const Alignment(0, .5), // 相対的な表示位置を決める。
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               pageLength,
//               (index) {
//                 return Container(
//                   margin: const EdgeInsets.all(4),
//                   width: 12,
//                   height: 12,
//                   decoration: BoxDecoration(
//                     color: index == currentIndex ? color : null,
//                     shape: BoxShape.circle,
//                     border: Border.all(color: color),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }