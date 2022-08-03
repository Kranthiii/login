// import 'package:flutter/material.dart';

// class intro2 extends StatefulWidget {
//   const intro2({Key? key}) : super(key: key);

//   @override
//   State<intro2> createState() => _intro2State();
// }

// class _intro2State extends State<intro2> {
//   var Lottie;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('page 2'),
//         centerTitle: true,

//       ),
//      body: Center(
//       child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_zpjfsp1e.json'),
//      ),
      
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../cartcookies/bottom_bar/bottom_bar.dart';

class intro2 extends StatefulWidget {
  const intro2({Key? key}) : super(key: key);

  @override
  State<intro2> createState() => _intro2State();
}

class _intro2State extends State<intro2> {
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
                    'https://assets10.lottiefiles.com/packages/lf20_zpjfsp1e.json',
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
                    'We take the time to get to know you and answer questions you may have.',
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
      child: Icon(Icons.medication_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
