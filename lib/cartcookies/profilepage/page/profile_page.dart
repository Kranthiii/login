import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cartcookies/bottom_bar/bottom_bar1.dart';
import 'package:flutter_application_1/cartcookies/bottom_bar/bottom_bar2.dart';
import 'package:flutter_application_1/cartcookies/bottom_bar/bottom_bar3.dart';
import 'package:flutter_application_1/cartcookies/bottom_bar/bottom_bar4.dart';
import 'package:flutter_application_1/model/user_model.dart';

import '../../bottom_bar/bottom_bar.dart';
import '../model/user.dart';
import '../utils/user_preferences.dart';
import '../widget/appbar_widget.dart';
import '../widget/button_widget.dart';
import '../widget/numbers_widget.dart';
import '../widget/profile_widget.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:user_profile_example/model/user.dart';
// import 'package:user_profile_example/utils/user_preferences.dart';
// import 'package:user_profile_example/widget/appbar_widget.dart';
// import 'package:user_profile_example/widget/button_widget.dart';
// import 'package:user_profile_example/widget/numbers_widget.dart';
// import 'package:user_profile_example/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var user = FirebaseAuth.instance;
  UserModel loggedInUser = UserModel();

  Future<UserModel> getUserData() async {
    UserModel temp =  UserModel();
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.currentUser?.uid)
        .get()
        .then((value) {
          Map<String, dynamic> userData = value.data() ?? {};
            temp= UserModel(
              firstName: userData['firstName'],
              secondName: userData['secondName'],
              medicalhistory: userData['medical history'],
              phonenumber: userData['phonenumber'],
              email: userData['email'],
              uid: userData['uid'],
              // favorites:  userData['favourites'],
              // cart: userData['cart']
            );
    });
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    // final user = UserPreferences.myUser;

    return FutureBuilder<UserModel>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            loggedInUser = snapshot.data ?? UserModel();
            return Scaffold(
              appBar: buildAppBar(context),
              body: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    imagePath: "https://imgs.search.brave.com/OjkTtLp0hUC_x5BxSrrNCijqF60Qs_4T01T62vetgc4/rs:fit:1200:1200:1/g:ce/aHR0cDovL3d3dy5m/cmVlaWNvbnNwbmcu/Y29tL3VwbG9hZHMv/cGVyc29uLWljb24t/NS5wbmc",
                    onClicked: () async {
                      final ImagePicker _picker = ImagePicker();
                    },
                  ),
                  const SizedBox(height: 24),
                  buildName(),
                  const SizedBox(height: 24),
                  buildPhoneNumber(),
                  const SizedBox(height: 48),
                  // Center(child: buildUpgradeButton()),
                  // const SizedBox(height: 24),
                  // NumbersWidget(),
                  // const SizedBox(height: 48),
                  buildAbout(),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Color.fromARGB(255, 51, 46, 204),
                child: Icon(Icons.person_outline),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomBar2(),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text(snapshot.error.toString())),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  Widget buildName() => Column(
        children: [
          Text(
            "${loggedInUser.firstName} ${loggedInUser.secondName}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            "${loggedInUser.email}",
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
  Widget buildPhoneNumber() => Column(
        children: [
          // Text(
          //   "${loggedInUser.firstName} ${loggedInUser.secondName}",
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          // ),
          const SizedBox(height: 4),
          Text(
            "${loggedInUser.phonenumber}",
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  // Widget buildUpgradeButton() => ButtonWidget(
  //       text: '',
  //       onClicked: () {},
  //     );

  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "${loggedInUser.medicalhistory}",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
