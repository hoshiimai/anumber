import 'package:anumber/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

class HelpHome extends StatelessWidget {
  const HelpHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFAFAFA),
      statusBarIconBrightness: Brightness.dark
    ));
    return Scaffold(
      body: SafeArea(
        // ここでIntroductionScreenのライブラリーを呼び出し
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: '',
              body: '',
              decoration: const PageDecoration(
                boxDecoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/help1.jpg'),
                    fit: BoxFit.contain,
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
                    image: AssetImage('assets/images/help2.jpg'),
                    fit: BoxFit.contain,
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
                    image: AssetImage('assets/images/help3.jpg'),
                    fit: BoxFit.contain,
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
                    image: AssetImage('assets/images/help4.jpg'),
                    fit: BoxFit.contain,
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
                    image: AssetImage('assets/images/help5.jpg'),
                    fit: BoxFit.contain,
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
                    image: AssetImage('assets/images/help6.jpg'),
                    fit: BoxFit.contain,
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
                    image: AssetImage('assets/images/help7.jpg'),
                    fit: BoxFit.contain,
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
                    image: AssetImage('assets/images/help8.jpg'),
                    fit: BoxFit.contain,
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
                    image: AssetImage('assets/images/help9.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
          onDone: () async => Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp())),
          showBackButton: true,
          next: Icon(Icons.arrow_forward_ios, color: Colors.blue[900]),
          back: Icon(Icons.arrow_back_ios, color: Colors.blue[900]),
          done: Text(
            'OK',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue[900]),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(5.0),
            // ここの大きさを変更することで
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.blue[900],
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
