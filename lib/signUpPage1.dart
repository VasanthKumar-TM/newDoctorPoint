// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'signUpPage2.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
//
// void main() => runApp(signUpPage1());
//
// final _firestore = Firestore.instance;
//
// class signUpPage1 extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Signup_p1(),
//     );
//   }
// }
//
// class Signup_p1 extends StatefulWidget {
//   @override
//   _Signup_p1State createState() => _Signup_p1State();
// }
//
// class _Signup_p1State extends State<Signup_p1> {
//   bool showSpinner = false;
//   final _auth = FirebaseAuth.instance;
//
//   String name = "", email, password, con_password = "";
//   Widget _buildLogo() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 70),
//           child: Text(
//             'DOCTOR\'s POINT',
//             style: TextStyle(
//               fontSize: MediaQuery.of(context).size.height / 25,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget _buildNameRow() {
//     return Padding(
//       padding: EdgeInsets.all(8),
//       child: TextFormField(
//         keyboardType: TextInputType.text,
//         onChanged: (value) {
//           setState(() {
//             name = value;
//           });
//         },
//         decoration: InputDecoration(
//             prefixIcon: Icon(
//               Icons.text_fields,
//               color: Colors.blue,
//             ),
//             labelText: 'Name'),
//       ),
//     );
//   }
//
//   Widget _buildEmailRow() {
//     return Padding(
//       padding: EdgeInsets.all(8),
//       child: TextFormField(
//         keyboardType: TextInputType.emailAddress,
//         onChanged: (value) {
//           setState(() {
//             email = value;
//           });
//         },
//         decoration: InputDecoration(
//             prefixIcon: Icon(
//               Icons.email,
//               color: Colors.blue,
//             ),
//             labelText: 'E-mail'),
//       ),
//     );
//   }
//
//   Widget _buildPasswordRow() {
//     return Padding(
//       padding: EdgeInsets.all(8),
//       child: TextFormField(
//         keyboardType: TextInputType.text,
//         obscureText: true,
//         onChanged: (value) {
//           setState(() {
//             password = value;
//           });
//         },
//         decoration: InputDecoration(
//           prefixIcon: Icon(
//             Icons.lock,
//             color: Colors.blue,
//           ),
//           labelText: 'Password',
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCon_PasswordRow() {
//     return Padding(
//       padding: EdgeInsets.all(8),
//       child: TextFormField(
//         keyboardType: TextInputType.text,
//         obscureText: true,
//         onChanged: (value) {
//           setState(() {
//             con_password = value;
//           });
//         },
//         decoration: InputDecoration(
//           prefixIcon: Icon(
//             Icons.lock_outline,
//             color: Colors.blue,
//           ),
//           labelText: 'Confirm Password',
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNextButton() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           height: 1.4 * (MediaQuery.of(context).size.height / 20),
//           width: 5 * (MediaQuery.of(context).size.width / 10),
//           margin: EdgeInsets.only(bottom: 20),
//           child: RaisedButton(
//             elevation: 5.0,
//             color: Colors.blue,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30.0),
//             ),
//             onPressed: () async {
//               setState(() {
//                 showSpinner = true;
//               });
//
//               _firestore.collection('doctors').add({
//                 'name': name,
//               });
//
//               try {
//                 final newUser = await _auth.createUserWithEmailAndPassword(
//                     email: email, password: password);
//                 if (newUser != null) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => signUpPage2()),
//                   );
//                 }
//                 setState(() {
//                   showSpinner = false;
//                 });
//               } catch (e) {
//                 print(e);
//               }
//             },
//             child: Text(
//               "Next",
//               style: TextStyle(
//                 color: Colors.white,
//                 letterSpacing: 1.5,
//                 fontSize: MediaQuery.of(context).size.height / 40,
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget _buildContainer() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         ClipRRect(
//           borderRadius: BorderRadius.all(
//             Radius.circular(20),
//           ),
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.7,
//             width: MediaQuery.of(context).size.width * 0.8,
//             decoration: BoxDecoration(
//               color: Colors.white,
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 15.0,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         "Signup Phase-1",
//                         style: TextStyle(
//                           fontSize: MediaQuery.of(context).size.height / 30,
//                         ),
//                       ),
//                     ],
//                   ),
//                   _buildNameRow(),
//                   _buildEmailRow(),
//                   _buildPasswordRow(),
//                   _buildCon_PasswordRow(),
//                   _buildNextButton(),
// //                _buildOrRow(),
// //                _buildSocialBtnRow(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomPadding: false,
//         backgroundColor: Color(0xfff2f3f7),
//         body: ModalProgressHUD(
//           inAsyncCall: showSpinner,
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.3,
//                 width: MediaQuery.of(context).size.width,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: const Radius.circular(70),
//                       bottomRight: const Radius.circular(70),
//                     ),
//                   ),
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   _buildLogo(),
//                   _buildContainer(),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'signUpPage2.dart';
import 'package:toast/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class signUpPage1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup_p1(),
    );
  }
}

class Signup_p1 extends StatefulWidget {
  @override
  _Signup_p1State createState() => _Signup_p1State();
}

class _Signup_p1State extends State<Signup_p1> {
  String name, email, password, con_password;
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'DOCTOR\'s POINT',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildNameRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            name = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.text_fields,
              color: Colors.blue,
            ),
            labelText: 'Name'),
      ),
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.blue,
            ),
            labelText: 'E-mail'),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.blue,
          ),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _buildCon_PasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            con_password = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.blue,
          ),
          labelText: 'Confirm Password',
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              _firestore.collection('patient').add({
                'name': name,
              });

              if (name != null && email != null && password != null) {
                if (password == con_password) {
                  print(name);
                  print(email);
                  print(password);
                  signUpPage2 sign2 = new signUpPage2(name, email, password);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => sign2),
                  );
                } else {
                  Toast.show(
                      "Password mismatch! \nkindly retype password once again.",
                      context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.BOTTOM);
                }
              } else {
                Toast.show("Kindly Fill all the fields\nIts Mandatory", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
              }
            },
            child: Text(
              "Next",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Signup Phase-1",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ],
                ),
                _buildNameRow(),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildCon_PasswordRow(),
                _buildNextButton(),
//                _buildOrRow(),
//                _buildSocialBtnRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLogo(),
                _buildContainer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
