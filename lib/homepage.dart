import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({ Key? key }) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('homepage'),
      ),
      
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/signup.dart';

// class Mylogin extends StatefulWidget {
//   const Mylogin({Key? key}) : super(key: key);

//   @override
//   State<Mylogin> createState() => _MyloginState();
// }

// class _MyloginState extends State<Mylogin> {
//   get child => null;

//   get mainAxisAlignment => null;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       height: double.infinity,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           // ignore: prefer_const_literals_to_create_immutables
//           colors: [
//             Color.fromARGB(255, 237, 226, 19),
//             Color.fromARGB(255, 39, 206, 27),
//             Color.fromARGB(255, 15, 97, 152),
//             Color.fromARGB(255, 197, 36, 151),
//           ],
//         ),
//       ),
//       child: Stack(
//         children: [
//           Container(
//             padding: const EdgeInsets.only(left: 35, top: 130),
//             child: const Text('Welcome\nBack',
//                 style: TextStyle(
//                     color: Color.fromARGB(255, 18, 17, 17), fontSize: 32)),
//           ),
//           SingleChildScrollView(
//               child: Container(
//             padding: EdgeInsets.only(
//               top: MediaQuery.of(context).size.height * 0.5,
//               right: 30,
//               left: 30,
//             ),
//             child: Column(
//               children: [
//                 const TextField(
//                   decoration: InputDecoration(
//                     fillColor: Color.fromARGB(255, 0, 0, 0),
//                     labelText: 'Email Address',
//                     prefixIcon: Icon(Icons.email),
//                     iconColor: Color.fromARGB(
//                       255,
//                       0,
//                       0,
//                       0,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 100.0,
//                   height: 30,
//                 ),
//                 const TextField(
//                   decoration: InputDecoration(
//                     fillColor: Color.fromARGB(255, 0, 0, 0),
//                     hintText: 'Password',
//                     prefixIcon: Icon(
//                       (Icons.lock),
//                       color: Color.fromARGB(255, 15, 18, 18),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 0,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text("Forgot Password",
//                           style: TextStyle(color: Colors.blueAccent[700]))
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   height: 50,
//                   width: 200,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: Color.fromARGB(255, 38, 95, 218),
//                       onPrimary: Colors.white,
//                       shadowColor: Colors.greenAccent,
//                       elevation: 3,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(32.0)),
//                       minimumSize: Size(100, 40), //////// HERE
//                     ),
//                     onPressed: () {},
//                     child: const Text('Login'),
//                   ),
//                 ),
//                 Row(
//                   children: <Widget>[
//                     const Text('Does not have account?'),
//                     TextButton(
//                       child: const Text(
//                         'Sign up',
//                         style: TextStyle(
//                             fontSize: 17,
//                             color: Color.fromARGB(255, 11, 16, 11)),
//                       ),
//                       onPressed: () {
//                         //signup screen
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (BuildContext context) => signup(),
//                             ));
//                       },
//                     )
//                   ],
//                   mainAxisAlignment: MainAxisAlignment.center,
//                 ),
//               ],
//             ),
//           ))
//         ],
//       ),
//     ));
//   }

//   signup() {}
// }
