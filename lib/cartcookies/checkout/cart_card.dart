// import 'package:finalapp/models/Cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cart.dart';
import 'package:flutter_application_1/cartcookies/checkout_page.dart';
import 'package:flutter_application_1/model/cart_checkout_model.dart';
// import 'package:shop_app/models/Cart.dart';

// import '../../../../../shopapp/lib/models/Cart.dart';
// import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  final CheckoutCartModel checkoutCard;
  final int numItems;
  const CartCard({
    Key? key, required this.checkoutCard, required this.numItems,
  }) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     backgroundColor: Color(0xFFFCFAF8),
    //     body: FutureBuilder<List<CheckoutCartModel>>(
    //         future: getStarted_readData(),
    //         builder: ((context, snapshot) {
    //           if (snapshot.hasData) {
    //             List<CheckoutCartModel> checkoutList = snapshot.data ?? [];
    //             return ListView(
    //               children: <Widget>[
    //                 SizedBox(height: 20.0),
    //                 Container(
    //                   padding: EdgeInsets.only(right: 15.0),
    //                   width: MediaQuery.of(context).size.width - 30.0,
    //                   height: MediaQuery.of(context).size.height - 50.0,
    //                   child: GridView.builder(
    //                       gridDelegate:
    //                           const SliverGridDelegateWithFixedCrossAxisCount(
    //                         crossAxisCount: 1,
    //                         crossAxisSpacing: 10.0,
    //                         mainAxisSpacing: 15.0,
    //                         childAspectRatio: 0.8,
    //                       ),
    //                       itemCount: checkoutList.length,
    //                       itemBuilder: (BuildContext context, int index) {
    //                         return buildCheckout(
    //                             checkoutList[index].productid ?? "",
    //                             checkoutList[index].name ?? "",
    //                             checkoutList[index].price ?? "",
    //                             checkoutList[index].imgPath ?? "");
    //                       }),
    //                 ),
    //                 SizedBox(height: 15.0)
    //               ],
    //             );
    //           } else if (snapshot.connectionState == ConnectionState.waiting) {
    //             return const CircularProgressIndicator();
    //           } else if (snapshot.hasError) {
    //             return Container(
    //               child: Text(snapshot.hasError.toString()),
    //             );
    //           } else {
    //             return CircularProgressIndicator();
    //           }
    //         })));
    return buildCheckout(widget.checkoutCard, widget.numItems);
  }

  Widget buildCheckout(CheckoutCartModel checkoutCartModel, int numItems) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(
                  ((MediaQuery.of(context).size.width) * (20 / 375.0))),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(checkoutCartModel.imgPath ?? ""),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              checkoutCartModel.name ?? "",
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "${checkoutCartModel.price}   ",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0)),
                children: [
                  TextSpan(
                      text: "x $numItems",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
// querySnapshot.docs.forEach((product) {
      //   var _product = product.data();
      //   productidcheck = _product["productid"];
      //   //  checkoutList.add(CheckoutCartModel(productid: _product["productid"] ,name: _product["name"],price: _product["price"], imgPath: _product["imgpath"], description: _product["description"]));
      //  });

       // await db.collection("products").get().then((querySnapshot) {
    //   querySnapshot.docs.forEach((productp) {
    //     var _product = productp.data();
    //     if (productidcheck == productp["productid"]) {
    //       checkoutList.add(CheckoutCartModel(
    //           productid: _product["productid"],
    //           name: _product["name"],
    //           price: _product["price"],
    //           imgPath: _product["imgpath"],
    //           description: _product["description"]));
    //     }
    //   });
    // });