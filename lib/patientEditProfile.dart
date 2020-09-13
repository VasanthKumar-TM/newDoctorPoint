import 'package:flutter/material.dart';
import 'otpPage.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'dart:math';

var id, name, age, ph_number, mail;
final sotp = Random().nextInt(999999);

class PatientDetail extends StatelessWidget {
  PatientDetail(ids, nam, ag, number, mai) {
    id = ids;
    name = nam;
    age = ag;
    ph_number = number;
    mail = mai;
  }
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
  TwilioFlutter twilioFlutter;

  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'ACf178cf1d4ef0b993e78693a5050127dc',
        authToken: '981178d2a367f5952074334faf7ab0da',
        twilioNumber: '+12075315891');

    super.initState();
  }

  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: '+91' + ph_number.toString(),
        messageBody: sotp.toString() +
            ' is your OTP(One time pasword), Dont share it with others with regards Doctors point team.');
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Text(
            'Edit',
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
        initialValue: mail,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            mail = value;
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
        initialValue: name,
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
        initialValue: age,
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
        initialValue: ph_number,
        keyboardType: TextInputType.number,
        obscureText: false,
        onChanged: (value) {
          setState(() {
            ph_number = value;
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
              sendSms();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        OtpPage(id, name, age, ph_number, mail, sotp)),
              );
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
