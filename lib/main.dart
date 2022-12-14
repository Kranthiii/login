// import 'package:email_password_login/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ambulancecalling/ambulancecalling.dart';
// import 'package:flutter_application_1/homepage/sidemenu.dart';
import 'package:flutter_application_1/screens/login_screen.dart';

import 'ambulancecalling/emergencymessaging.dart';
// import 'package:flutter_application_1/sidebar/sidebarmain.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
