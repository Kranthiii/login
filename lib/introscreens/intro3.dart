import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../cartcookies/bottom_bar/bottom_bar.dart';

class intro3 extends StatefulWidget {
  const intro3({Key? key}) : super(key: key);

  @override
  State<intro3> createState() => _intro3State();
}

class _intro3State extends State<intro3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Lottie.network(
                    'https://assets7.lottiefiles.com/packages/lf20_7smeegra.json',
                  ),
                ),

                ColoredBox(
                    color: Colors.black.withOpacity(0.5) // 0: Light, 1: Dark
                    ),
                //   Container(
                //   margin: EdgeInsets.all(20),
                //   child: const Image(
                //     height: 100,
                //     image: NetworkImage('https://assets7.lottiefiles.com/packages/lf20_7smeegra.json'),
                //   ),
                // ),
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(
                    'Order Medicine Online ',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Varela',
                        color: Color.fromARGB(255, 29, 96, 191)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Exactly what you need.Exactly where you are. An APP for all  your needs. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Varela',
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
       floatingActionButton: FloatingActionButton(onPressed: () {},
      backgroundColor: Color.fromARGB(255, 23, 8, 244),
      child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
