import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/cartcookies/bottom_bar.dart';
import 'package:flutter_application_1/cartcookies/bottom_bar/bottom_bar.dart';
import 'package:flutter_application_1/cartcookies/bottom_bar/bottom_bar1.dart';
// import 'package:fluttercookie/bottom_bar.dart';

class CookieDetail extends StatefulWidget {
  final assetPath, cookieprice, cookiename,description, productId;


  CookieDetail({this.productId,this.assetPath, this.cookieprice, this.cookiename, this.description});

  @override
  State<CookieDetail> createState() => _CookieDetailState();
}

class _CookieDetailState extends State<CookieDetail> {
FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Pickup',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68)
                )
                ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'COVID CARE',
              style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 6, 34, 241)
                      )
            ),
          ),
            SizedBox(height: 15.0),
            Hero(
              tag: widget.assetPath,
              child: Image.network(widget.assetPath,
              height: 150.0,
              width: 100.0,
              fit: BoxFit.contain
              )
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(widget.cookieprice,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 27, 3, 248)
                      )
                      ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(widget.cookiename,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 24.0,
                      // alignment: Alignment.topRight
                      )
                      ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                      color: Color(0xFFB4B8B9)
                      )
                ),
              ),
            ),
            // SizedBox(height: 20.0),
            // Center(
            //   child: Container(
            //     width: MediaQuery.of(context).size.width - 50.0,
            //     height: 50.0,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(25.0),
            //       color: Color.fromARGB(255, 4, 8, 247)
            //     ),
                // child: TextButton(
                //   onPressed: () async {
                //     Map<String, int> _product = {};
                //        var firebaseUser =  FirebaseAuth.instance.currentUser;
                //            await db.collection("users").doc(firebaseUser?.uid).get().then((value){
                //                  if(value.data()?["cart"]!=null) {
                //                   value.data()?["cart"].forEach((k,v) => _product[k] = v);
                //                  }
                //                  print(value.data());
                //              });
                //              print("product========>${_product}");
                //              print(_product[widget.productId].runtimeType);
                //              _product[widget.productId] ??= 0;
                //              _product[widget.productId] = _product[widget.productId] ?? 0 + 1;
                //              print(_product[widget.productId]);
                //           await db.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update(
                //         {
                //           "cart" : _product,
                //         }
                //       );
                //   },
                //   child: Center(
                //     child: Text('Add to cart',
                //       style: TextStyle(
                //         fontFamily: 'Varela',
                //         fontSize: 14.0,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white
                //   ),
                //     )
                //   ),
                // )
              // )
            // )
        ]
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {},
      backgroundColor: Color.fromARGB(255, 23, 8, 244),
      child: Icon(Icons.medication_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar1(),
    );
  }
}
