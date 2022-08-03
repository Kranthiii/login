import 'package:flutter/material.dart';
import 'package:flutter_application_1/cartcookies/bottom_bar/bottom_bar1.dart';
// import 'package:flutter_application_1/cartcookies/bottom_bar.dart';
// import 'package:flutter_application_1/cartcookies/bottom_bar1.dart';
import 'package:flutter_application_1/cartcookies/cookie_page.dart';
// import 'package:flutter_application_1/cartcookies/cookie_pages/cookie_page1.dart';
// import 'package:flutter_application_1/cartcookies/cookie_pages/cookie_page2.dart';
// import 'package:flutter_application_1/cartcookies/cookie_pages/cookie_page3.dart';
// import 'package:flutter_application_1/cartcookies/cookie_pages/cookie_page4.dart';
// import 'package:flutter_application_1/cartcookies/cookie_pages/cookie_page5.dart';
// import 'package:flutter_application_1/cartcookies/cookie_pages/cookie_page6.dart';
// import 'package:flutter_application_1/cartcookies/cookie_pages/cookie_page1.dart';
// import 'package:fluttercookie/bottom_bar.dart';
// import 'package:fluttercookie/cookie_page.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
      //     onPressed: () {
      //       Navig
      //     },
      //   ),
      //   title: Text('Pickup',
      //       style: TextStyle(
      //           fontFamily: 'Varela',
      //           fontSize: 20.0,
      //           color: Color(0xFF545D68))),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.info_outline_rounded, color: Color(0xFF545D68)),
      //       onPressed: () {},
      //     ),
      //   ],
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 15.0),
          Text('Medicines',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 15.0),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color(0xFFC88D67),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text('',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )
                      ),
                ),
                // Tab(
                //   child: Text('Mind Care',
                //       style: TextStyle(
                //         fontFamily: 'Varela',
                //         fontSize: 21.0,
                //       )),
                // ),
                // Tab(
                //   child: Text('Cardiac',
                //       style: TextStyle(
                //         fontFamily: 'Varela',
                //         fontSize: 21.0,
                //       )),
                // ),
                // Tab(
                //   child: Text('Oral Care',
                //       style: TextStyle(
                //         fontFamily: 'Varela',
                //         fontSize: 21.0,
                //       )
                //       ),
                // ),
                // Tab(
                //   child: Text('Pain Relief',
                //       style: TextStyle(
                //         fontFamily: 'Varela',
                //         fontSize: 21.0,
                //       )
                //       ),
                // ),
                // Tab(
                //   child: Text('Cold & Immunity',
                //       style: TextStyle(
                //         fontFamily: 'Varela',
                //         fontSize: 21.0,
                //       )
                //       ),
                // ),
                // Tab(
                //   child: Text('Stomach Care',
                //       style: TextStyle(
                //         fontFamily: 'Varela',
                //         fontSize: 21.0,
                //       )
                //       ),
                // )
              ]),
              Container(
                height: MediaQuery.of(context).size.height - 50.0,
                width: double.infinity,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    CookiePage(),
                    // CookiePage(),
                    // CookiePage(),
                    // CookiePage(),
                    // CookiePage(),
                    // CookiePage(),
                    // CookiePage(),
                  ]
                )
              )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
      backgroundColor: Color.fromARGB(255, 51, 46, 204),
      child: Icon(Icons.medication_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar1(),
    );
  }
}
AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Pick Up",
            style: TextStyle(color: Colors.black),
          ),
          // Center:IconButton(
          //   icon: Icon(Icons.info_outline_rounded, color: Color(0xFF545D68)),
          //   onPressed: () {
              
          //   },
          // ),
          // Text(
            // " items",
          //   style: Theme.of(context).textTheme.caption,
          // ),
        ],
      ),
    );
  }