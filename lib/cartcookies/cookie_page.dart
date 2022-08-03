import 'dart:ffi';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cartcookies/cookie_detail.dart';
import 'package:flutter_application_1/model/cookie_model.dart';
// import 'package:fluttercookie/cookie_detail.dart';

class CookiePage extends StatefulWidget {
  @override
  State<CookiePage> createState() => _CookiePageState();
}

class _CookiePageState extends State<CookiePage> {
  FirebaseFirestore db = FirebaseFirestore.instance;


  //  ignore: non_constant_identifier_names
   Future<List<CookieModel>> getStarted_readData() async {
    // [START get_started_read_data]
      List<CookieModel> cookieList = [];
    await db.collection("products").get().then((querySnapshot) {
      querySnapshot.docs.forEach((product) {
        var _product = product.data();
         cookieList.add(CookieModel(productid: _product["productid"] ,name: _product["name"],price: _product["price"], imgPath: _product["imgpath"], description: _product["description"]));
       });
    });
    return cookieList;
    // [END get_started_read_data]
  }

  @override
  void initState() {
    getStarted_readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: FutureBuilder<List<CookieModel>>(
        future: getStarted_readData(),
        builder: ((context, snapshot) {
        if(snapshot.hasData) {
          List<CookieModel> cookieList = snapshot.data ?? [];
          return ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                ),
                itemCount: cookieList.length,
                itemBuilder: (BuildContext context, int index) {
                  //getStarted_readData();
                  
                  return _buildCard(cookieList[index].productid ?? "", cookieList[index].name ?? "", cookieList[index].price ?? "", cookieList[index].imgPath ?? "", cookieList[index].description?? "", false, false, context);
                }),
          ),
          SizedBox(height: 15.0)
        ],
      );
    
        } else if(snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if(snapshot.hasError){
          return Container(
            child: Text(snapshot.hasError.toString()),
          );
        } else {
          return CircularProgressIndicator();
        }
      })));
  }

  Widget _buildCard(String productId, String name, String price, String imgPath, String description, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CookieDetail(
                      assetPath: imgPath,
                      cookieprice: price,
                      cookiename: name,
                      description: description)));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? Icon(Icons.favorite,
                                    color: Color.fromARGB(255, 179, 69, 6))
                                : Icon(Icons.favorite_border,
                                    color: Color.fromARGB(255, 179, 69, 6))
                          ])),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 69.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  Text(name,
                  textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                          Text("${price}Rs",
                      style: TextStyle(
                          color: Color.fromARGB(255, 157, 45, 4),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  TextButton(
                    onPressed: () async {
                      Map<String, int> _product = {};
                       var firebaseUser =  FirebaseAuth.instance.currentUser;
                           await db.collection("users").doc(firebaseUser?.uid).get().then((value){
                                 if(value.data()?["cart"]!=null) {
                                  value.data()?["cart"].forEach((k,v) => _product[k] = v);
                                 }
                                 print(value.data());
                             });
                             print("product========>${_product}");
                             print(_product[productId].runtimeType);
                             _product[productId] ??= 0;
                             _product[productId] = _product[productId]! + 1;
                             print(_product[productId]);
                          await db.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).update(
                        {
                          "cart" : _product,
                        }
                      );
                    },
                    child: Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (!added) ...[
                                Icon(Icons.shopping_basket,
                                    color: Color.fromARGB(255, 181, 45, 4),
                                    size: 12.0),
                                Text('Add to cart',
                                    style: TextStyle(
                                        fontFamily: 'Varela',
                                        color: Color.fromARGB(255, 1, 6, 246),
                                        fontSize: 12.0))
                              ],
                              if (added) ...[
                                Icon(Icons.remove_circle_outline,
                                    color: Color.fromARGB(255, 166, 50, 4),
                                    size: 12.0),
                                Text('3',
                                    style: TextStyle(
                                        fontFamily: 'Varela',
                                        color: Color.fromARGB(255, 164, 70, 7),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0)),
                                Icon(Icons.add_circle_outline,
                                    color: Color.fromARGB(255, 166, 47, 4),
                                    size: 12.0),
                              ]
                            ])),
                  )
                ]))));
  }
}
