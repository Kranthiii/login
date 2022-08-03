// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class checkoutpage extends StatefulWidget {
//   const checkoutpage({Key? key}) : super(key: key);

//   @override
//   State<checkoutpage> createState() => _checkoutpageState();
// }

// class _checkoutpageState extends State<checkoutpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
//   }
// }
// import 'package:finalapp/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/cartcookies/default_button.dart';
import 'package:flutter_application_1/cartcookies/payment.dart';
import 'package:flutter_application_1/model/cart_checkout_model.dart';
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shop_app/components/default_button.dart';

// import '../../../../../shopapp/lib/components/default_button.dart';
// import '../../../constants.dart';
// import '../../../size_config.dart';

class CheckoutCard extends StatefulWidget {
  final List<CheckoutCartModel> checkoutList;
  final Map<String, int> numItems;
  const CheckoutCard({
    Key? key,
    required this.checkoutList,
    required this.numItems,
  }) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  double totalSum = 0;
  double calculteTotal() {
    double sum = 0;
    for (var element in widget.checkoutList) {
      var p = element.productid;
      if (widget.numItems[p] != null) {
        sum +=
            double.parse(element.price ?? "") * widget.numItems[p]!.toDouble();
      }
    }
    return sum;
  }

  @override
  void initState() {
    super.initState();
    totalSum = calculteTotal();
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
                //   height: ((MediaQuery.of(context).size.height) * (40 / 812.0)),
                //   width: ((MediaQuery.of(context).size.width) * (40 / 375.0)),
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
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "$totalSum Rs",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: ((MediaQuery.of(context).size.width) * (190 / 375.0)),
                  child: DefaultButton(
                    text: "Check Out",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => paymentscreen()));
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
