import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Product.dart';

// import 'Product.dart';
// import 'Product.dart';

class Cart {
  final Product product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}
FirebaseFirestore db = FirebaseFirestore.instance;

// Demo data for our cart
// void getStarted_readData() async {
//     // [START get_started_read_data]
//     await db.collection("products").get().then((querySnapshot) {
//       querySnapshot.docs.forEach((product) {
//         var _product = product.data();
//          demoCarts.add(Cart( product: _product["name"],numOfItem: 1 ));
//        });
//     });
//     // [END get_started_read_data]
//   }

