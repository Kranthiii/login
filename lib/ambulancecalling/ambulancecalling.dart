import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/cartcookies/bottom_bar/bottom_bar3.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class ambulancecalling extends StatefulWidget {
  const ambulancecalling({Key? key}) : super(key: key);

  @override
  State<ambulancecalling> createState() => _ambulancecallingState();
}

class _ambulancecallingState extends State<ambulancecalling> {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
    title:Text('Emergency Plus'),
    centerTitle:true,
    ),
    body: Center(
      child: Column(
        children:<Widget>[
        buildButton(),
        buildButton1(),
        buildButton2(),
        buildButton3(),
        buildButton4(),
        buildButton5()
        ], 
    )
    ),
     floatingActionButton: FloatingActionButton(onPressed: () {},
      backgroundColor: Color.fromARGB(255, 51, 46, 204),
      child: Icon(Icons.medication_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomBar3() ,
    );
  }
}
Widget buildButton()
{
  final number = '+918143957028';
  return ListTile(
    title: Text('Tender Palm Hospital'),
    subtitle: Text(number),
    leading:CircleAvatar(
      backgroundImage: NetworkImage(
        ""
      ),
      ),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('Call'),
        onPressed: () async{
      launch('tel://$number');
      await FlutterPhoneDirectCaller.callNumber(number);
    }
      ),
  );
}
Widget buildButton1()
{
  final number = '05224021010';
  return ListTile(
    title: Text('SKD Hospital'),
    subtitle: Text(number),
    leading:CircleAvatar(
      backgroundImage: NetworkImage(
        ""
      ),),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('Call'),
        onPressed: () async{
      launch('tel://$number');
      await FlutterPhoneDirectCaller.callNumber(number);
    }
      ),
  );
}
Widget buildButton2()
{
  final number = '05222616064';
  return ListTile(
    title: Text('Krishna Medical Centre'),
    subtitle: Text(number),
    leading:CircleAvatar(
      backgroundImage: NetworkImage(
        ""
      ),),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('Call'),
        onPressed: () async{
      launch('tel://$number');
      await FlutterPhoneDirectCaller.callNumber(number);
    }
      ),
  );
}
Widget buildButton3()
{
  final number = '0522405611';
  return ListTile(
    title: Text('Tender Palm Hospital'),
    subtitle: Text(number),
    leading:CircleAvatar(
      backgroundImage: NetworkImage(
        ""
      ),),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('Call'),
        onPressed: () async{
      launch('tel://$number');
      await FlutterPhoneDirectCaller.callNumber(number);
    }
      ),
  );
}
Widget buildButton4()
{
  final number = '18008891200';
  return ListTile(
    title: Text('Wellsun Medicity Hospital'),
    subtitle: Text(number),
    leading:CircleAvatar(
      backgroundImage: NetworkImage(
        ""
      ),),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('Call'),
        onPressed: () async{
      launch('tel://$number');
      await FlutterPhoneDirectCaller.callNumber(number);
    }
      ),
  );
}
Widget buildButton5()
{
  final number = '05222721992';
  return ListTile(
    title: Text('Divine Heart & Multiseciality Hospital'),
    subtitle: Text(number),
    leading:CircleAvatar(
      backgroundImage: NetworkImage(
        ""
      ),),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue),
          ),
        ),
        child: Text('Call'),
        onPressed: () async{
      launch('tel://$number');
      await FlutterPhoneDirectCaller.callNumber(number);
    }
      ),
  );
}