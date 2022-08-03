// // import 'package:user_profile_example/model/user.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter_application_1/model/user_model.dart';

// import '../model/user.dart';

// class UserPreferences extends StatefulWidget {
//   const UserPreferences({Key? key}) : super(key: key);

//   @override
//   State<UserPreferences> createState() => _UserPreferencesState();
// }

// class _UserPreferencesState extends State<UserPreferences> {
//   User? user = FirebaseAuth.instance.currentUser;
//   UserModel loggedInUser = UserModel();

//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(user!.uid)
//         .get()
//         .then((value) {
//       this.loggedInUser = UserModel.fromMap(value.data());
//       setState(() {});
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }








// // class UserPreferences {
// //    User? user = FirebaseAuth.instance.currentUser;
// //   UserModel loggedInUser = UserModel();

// //   @override
// //   void initState() {
// //     super.initState();
// //     FirebaseFirestore.instance
// //         .collection("users")
// //         .doc(user!.uid)
// //         .get()
// //         .then((value) {
// //       this.loggedInUser = UserModel.fromMap(value.data());
// //       setState(() {});
// //     });
// //   }
// //   static const myUser = User(
// //     imagePath:
// //        "",
// //     name: ,
// //     email: 'sarah.abs@gmail.com',
// //     about:
// //         'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
// //     isDarkMode: false,
// //   );
// // }
