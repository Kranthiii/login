class CookieModel {
  String? productid;
  String? name;
  String? price;
  String? imgPath;
  String? description;

  CookieModel({this.productid, this.name, this.price, this.imgPath, this.description});

  // receiving data from server
  factory CookieModel.fromMap(map) {
    return CookieModel(
      productid: map['productid'],
      name: map['name'],
      price: map['price'],
      imgPath: map['imgpath'],
      description: map['description'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': productid,
      'name': name,
      'price': price,
      'imgpath': imgPath,
      'description': description,
    };
  }
}
