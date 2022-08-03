import 'package:flutter_application_1/Cart.dart';

class CheckoutCartModel {
  String? productid;
  String? name;
  String? price;
  String? imgPath;

  CheckoutCartModel({this.productid, this.name, this.price, this.imgPath});

  // receiving data from server
  factory CheckoutCartModel.fromMap(map) {
    return CheckoutCartModel(
      productid: map['productid'],
      name: map['name'],
      price: map['price'],
      imgPath: map['imgpath'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': productid,
      'name': name,
      'price': price,
      'imgpath': imgPath,
    };
  }
}