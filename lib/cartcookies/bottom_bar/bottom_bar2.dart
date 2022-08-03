import 'package:flutter/material.dart';
import 'package:flutter_application_1/ambulancecalling/ambulancecalling.dart';
import 'package:flutter_application_1/cartcookies/cart.dart';
import 'package:flutter_application_1/cartcookies/checkout/cart_screen.dart';
import 'package:flutter_application_1/introscreens/intro1.dart';

class BottomBar2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 2.0,
      color: Colors.transparent,
      elevation: 9.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0)
          ),
          color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width /2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Icon(Icons.medication_outlined, color: Color(0xFF676E79)),
                  IconButton(onPressed: (){
                    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyHomePage()));
                  }, 
                  icon: Icon(Icons.medication_outlined, color: Color(0xFF676E79)
                  ) 
                  ),
                  // Icon(Icons.home, color: Color(0xFF676E79)),
                  IconButton(onPressed: (){
                    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          intro1()));
                  }, 
                  icon: Icon(Icons.home, color: Color(0xFF676E79)
                  ) 
                  ),
                ],
              )
            ),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width /2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Icon(Icons.local_hospital_outlined, color: Color(0xFF676E79)),
                  IconButton(onPressed: (){
                    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ambulancecalling()));
                  }, 
                  icon: Icon(Icons.local_hospital_outlined, color: Color(0xFF676E79)
                  ) 
                  ),
                  // Icon(Icons.shopping_bag, color: Color(0xFF676E79))
                  IconButton(onPressed: (){
                    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CartScreen()));
                  }, 
                  icon: Icon(Icons.shopping_bag, color: Color(0xFF676E79)
                  ) 
                  ),
                ],
              )
            ),
          ]
        )
      )
    );
  }
}
