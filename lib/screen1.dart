import 'package:flutter/material.dart';
import 'package:flutter_application_1/introscreens/intro1.dart';
import 'package:flutter_application_1/introscreens/intro2.dart';
import 'package:flutter_application_1/introscreens/intro3.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import 'homepage.dart';

class screen1 extends StatefulWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              intro1(),
              intro2(),
              intro3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text('SKIP')),
                SmoothPageIndicator(controller: _controller, count:3 ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          },
                          ),
                          );
                        },
                        child: Text('DONE'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('NEXT'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
