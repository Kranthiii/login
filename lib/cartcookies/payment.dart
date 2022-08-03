import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/cartcookies/cart.dart';
import 'package:flutter_application_1/cartcookies/checkout/cart_screen.dart';
import 'package:flutter_application_1/cartcookies/confirmation.dart';
import 'package:flutter_application_1/cartcookies/default_button.dart';

class paymentscreen extends StatefulWidget {
  const paymentscreen({Key? key}) : super(key: key);

  @override
  State<paymentscreen> createState() => _paymentscreenState();
}

class _paymentscreenState extends State<paymentscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: proceedtofinal(),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Column(
      children: [
        Text(
          "Your Cart",
          style: TextStyle(color: Colors.black),
        ),
        // Text(
        //   " items",
        //   style: Theme.of(context).textTheme.caption,
        // ),
      ],
    ),
  );
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Center(
              child: Image.asset("img/qr.jpeg"),
            )));
  }
}

class proceedtofinal extends StatelessWidget {
  const proceedtofinal({
    Key? key,
  }) : super(key: key);

  Future<void> getreaddata() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db
        .collection("users")
        .doc(firebaseUser?.uid)
        .update({"cart": null}).then((_) {
      print("success!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ((MediaQuery.of(context).size.height) * (15 / 812.0)),
        horizontal: ((MediaQuery.of(context).size.width) * (20 / 375.0)),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Container(
                //   padding: EdgeInsets.all(10),
                //   height:  ((MediaQuery.of(context).size.height)*(40/ 812.0)),
                //   width: ((MediaQuery.of(context).size.width)*(40/375.0)),
                //   decoration: BoxDecoration(
                //     color: Color(0xFFF5F6F9),
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   // child: SvgPicture.asset("assets/icons/receipt.svg"),
                // ),
                Spacer(),
                // Text("Add voucher code"),
                // const SizedBox(width: 10),
                // Icon(
                //   Icons.arrow_forward_ios,
                //   size: 12,
                //   color: Color(0xFF757575),
                // )
              ],
            ),
            SizedBox(
                height: ((MediaQuery.of(context).size.height) * (20 / 812.0))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "",
                    children: [
                      TextSpan(
                        text: "",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: ((MediaQuery.of(context).size.width) * (190 / 375.0)),
                  child: DefaultButton(
                    text: "Confirm",
                    press: () async {
                      await getreaddata();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyHomePage()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
