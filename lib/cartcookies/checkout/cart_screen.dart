// import 'package:finalapp/models/Cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cart.dart';
import 'package:flutter_application_1/cartcookies/checkout/body.dart';
import 'package:flutter_application_1/cartcookies/checkout/cart_card.dart';
// import 'package:flutter_application_1/body.dart';
// import 'package:flutter_application_1/cart_card.dart';
import 'package:flutter_application_1/cartcookies/checkout_page.dart';
import 'package:flutter_application_1/model/cart_checkout_model.dart';
// import 'package:shop_app/models/Cart.dart';

// import '../../../../shopapp/lib/models/Cart.dart';
// import 'components/body.dart';
// import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<Map<String, dynamic>> getStarted_readData() async {
    // [START get_started_read_data]
    List<CheckoutCartModel> checkoutList = [];
    Map<String, int> productidcheck = {};
    var firebaseUser = FirebaseAuth.instance.currentUser;
    await db
        .collection("users")
        .doc(firebaseUser?.uid)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.data()?["cart"] != null) {
        querySnapshot.data()?["cart"].forEach((k, v) => productidcheck[k] = v);
      }
    });
    await Future.forEach(productidcheck.keys, (key) async {
      await db.collection("products").doc(key.toString()).get().then((value) {
        Map<String, dynamic> productData = value.data() ?? {};
        checkoutList.add(CheckoutCartModel(
            imgPath: productData["imgpath"],
            name: productData["name"],
            productid: productData["productid"],
            price: productData["price"]));
        print("=====================${checkoutList[0]}");
      });
    });
    Map<String, dynamic> res = {
      "checkoutList": checkoutList,
      "numItems": productidcheck
    };
    return res;
    // [END get_started_read_data]
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: getStarted_readData(), // async work
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> mapData = snapshot.data ?? {};
            return Scaffold(
              appBar: buildAppBar(context, mapData["checkoutList"].length),
              body: Body(
                checkoutList: mapData["checkoutList"],
                numItems: mapData["numItems"],
              ),
              bottomNavigationBar: CheckoutCard(
                checkoutList: mapData["checkoutList"],
                numItems: mapData["numItems"],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text(snapshot.error.toString())),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  AppBar buildAppBar(BuildContext context, int totalNumItems) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "$totalNumItems  items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
