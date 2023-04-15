import 'package:anumber/home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // ここでIntroductionScreenのライブラリーを呼び出している
        child: IntroductionScreen(
          // ...省略...
          pages: [
            PageViewModel(
              title: '',
              body: '',
              decoration: const PageDecoration(
                boxDecoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/43429.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            PageViewModel(
              title: '',
              body: '',
              decoration: const PageDecoration(
                boxDecoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/43430.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            PageViewModel(
              title: '',
              body: '',
              decoration: const PageDecoration(
                boxDecoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/43431.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            PageViewModel(
              title: '',
              body: '',
              decoration: const PageDecoration(
                boxDecoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/43432.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            PageViewModel(
              title: '',
              body: '',
              decoration: const PageDecoration(
                boxDecoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/43433.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
          onDone: () async => Navigator.push(context,MaterialPageRoute(builder: (context) => const Home())),
          showBackButton: true,
          next: const Icon(Icons.arrow_forward_ios),
          back: const Icon(Icons.arrow_back_ios),
          done: const Text(
            'OK',
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