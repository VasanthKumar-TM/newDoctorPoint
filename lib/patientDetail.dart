import 'package:flutter/material.dart';
import 'mainScreen.dart';
import 'package:toast/toast.dart';

class PatientDetail extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Patient_Register(),
    );
  }
}

class Patient_Register extends StatefulWidget {
  @override
  _Patient_RegisterState createState() => _Patient_RegisterState();
}

class _Patient_RegisterState extends State<Patient_Register> {
  var age, email, name;
  var number;
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'REGISTRATION',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'QuattrocentoSans',
              letterSpacing: 1.5,
              color: Colors.white,
            ),
          ),
        )
      ],
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

  Widget _buildNameRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: false,
        onChanged: (value) {
          setState(() {
            name = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.supervised_user_circle,
            color: Colors.blue,
          ),
          labelText: 'Name',
        ),
      ),
    );
  }

  Widget _buildAgeRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        obscureText: false,
        onChanged: (value) {
          setState(() {
            age = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.info_outline,
            color: Colors.blue,
          ),
          labelText: 'Age',
        ),
      ),
    );
  }

  Widget _buildNumberRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        obscureText: false,
        onChanged: (value) {
          setState(() {
            number = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.confirmation_number,
            color: Colors.blue,
          ),
          labelText: 'Phone Number',
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
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
              if (name != null &&
                  email != null &&
                  age != null &&
                  number != null) {
                MainScreen main = new MainScreen(name, age, number, email);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => main),
                );
              } else {
                Toast.show("All the fields are mandatory!", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
              }
            },
            child: Text(
              "Submit",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontFamily: 'QuattrocentoSansB',
                fontSize: 25,
              ),
            ),
          ),
        ),
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
            height: MediaQuery.of(context).size.height * 0.6,
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
                      "DETAILS",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                        fontFamily: 'Alata',
                      ),
                    ),
                  ],
                ),
                _buildNameRow(),
                _buildAgeRow(),
                _buildNumberRow(),
                _buildEmailRow(),
                _buildSubmitButton(),
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
