class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  Map<String, dynamic>? cart;
  Map<String, int>? favorites;
  String? medicalhistory;
  String? phonenumber;

 UserModel({this.uid, this.email, this.firstName, this.secondName, this.cart, this.favorites, this.medicalhistory, this.phonenumber});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      cart: map['cart'],
      favorites: map['favorites'],
      medicalhistory: map['medical history'],
      phonenumber: map['phonenumber'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'cart': cart,
      'favorites': favorites,
      'medical history': medicalhistory,
      'phonenumber': phonenumber
    };
  }
}
