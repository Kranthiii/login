import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_sms/flutter_sms.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
var user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

   @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

List<String> recipents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emergency Plus"),),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text("Send SMS",
              style: Theme.of(context).accentTextTheme.button),
              onPressed: () {
                recipents.add('${loggedInUser.phonenumber}');
                _sendSMS('I am in danger please help me. I need medical help.', recipents);
              },
            ),) ),
      ),
    );
  }
}
void _sendSMS(String message,List<String>recipients) async
{
  String _result = await sendSMS(message: message, recipients: recipients).catchError((onError)
  {
    print(onError);

  });
  print(_result);
}