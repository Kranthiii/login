import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../cartcookies/bottom_bar/bottom_bar.dart';

class intro1 extends StatefulWidget {
  const intro1({Key? key}) : super(key: key);

  @override
  State<intro1> createState() => _intro1State();
}

class _intro1State extends State<intro1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                   child: Lottie.network(
            'https://assets7.lottiefiles.com/packages/lf20_eop7ymay.json'),
                ),
                // Container(
                //   margin: EdgeInsets.all(20),
                //   child: const Image(
                //     height: 100,
                //     image: NetworkImage('https://assets7.lottiefiles.com/packages/lf20_eop7ymay.json'),
                //   ),
                // ),
                Center(
                  child: Text( 'Delivery in 10 mins ',
                 style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily:'Valera',color: Color.fromARGB(255, 29, 96, 191)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                 Center(
                  child: Text( 'We make deliveries fast, so you can get back to other stuff faster 😉.......',
                 style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black,fontFamily: "Varela"),
                 

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
