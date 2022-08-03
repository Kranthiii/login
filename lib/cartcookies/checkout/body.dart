import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/cart_checkout_model.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:shop_app/models/Cart.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  final List<CheckoutCartModel> checkoutList;
  final Map<String, int> numItems;
  const Body({Key? key, required this.checkoutList, required this.numItems}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseFirestore db = FirebaseFirestore.instance;
    
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: ((MediaQuery.of(context).size.width)*(20/375.0))),
      child: ListView.builder(
        itemCount: widget.checkoutList.length ,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(widget.checkoutList[index].productid.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                widget.checkoutList.removeAt(index);
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(checkoutCard: widget.checkoutList[index], numItems: widget.numItems[widget.checkoutList[index].productid] ?? 0,),
          ),
        ),
      ),
    );
  }
}
