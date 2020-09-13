import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:toast/toast.dart';

final _firestore = Firestore.instance;

String name,
    mail,
    password,
    ph_num,
    license,
    category,
    workinghr,
    patientpday,
    timeppatient,
    city,
    about,
    addr;
var sotp, image;

class Otp_Doc extends StatelessWidget {
  Otp_Doc(nam, mai, passwor, ph_nu, licens, categor, imag, workingh, patientpda,
      timeppatien, cit, add, abt, sot) {
    name = nam;
    mail = mai;
    password = passwor;
    ph_num = ph_nu;
    license = licens;
    category = categor;
    image = imag;
    workinghr = workingh;
    patientpday = patientpda;
    timeppatient = timeppatien;
    city = cit;
    addr = add;
    about = abt;
    sotp = sot;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Doctor_Otp(),
    );
  }
}

class Doctor_Otp extends StatefulWidget {
  @override
  _Doctor_OtpState createState() => _Doctor_OtpState();
}

class _Doctor_OtpState extends State<Doctor_Otp> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  var rotp;

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
        toNumber: '+91' + ph_num.toString(),
        messageBody: sotp.toString() +
            ' is your Resended OTP(One time pasword), Dont share it with others with regards Doctors point team.');
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'ONE TIME PASSWORD',
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

  Widget _buildNumberRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        obscureText: false,
        initialValue: ph_num,
        onChanged: (value) {
          setState(() {
            ph_num = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.phone,
            color: Colors.blue,
          ),
          labelText: 'Edit Phone Number here',
        ),
      ),
    );
  }

  Widget _buildOtpRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        maxLength: 6,
        obscureText: false,
        onChanged: (value) {
          setState(() {
            rotp = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.confirmation_number,
            color: Colors.blue,
          ),
          labelText: 'OTP',
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
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
            onPressed: () async {
              print(sotp);

              _firestore.collection('doctors').add({
                'addr': addr,
                'category': category,
                'city': city,
                'image': 'image',
                'license': license,
                'name': name,
                'patientpday': patientpday,
                'ph_num': ph_num,
                'timeppatient': timeppatient,
                'workinghr': workinghr,
              });

              if (sotp.toString() == rotp) {
                setState(() {
                  showSpinner = true;
                });

                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: mail, password: password);
                  if (newUser != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }
                  setState(() {
                    showSpinner = false;
                  });
                } catch (e) {
                  print(e);
                }
              } else {
                Toast.show(
                    "Wrong OTP.\n Try Again or Click Resend button to receive new OTP.",
                    context,
                    duration: Toast.LENGTH_SHORT,
                    gravity: Toast.BOTTOM);
              }
            },
            child: Text(
              "Verify!",
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

  Widget _buildResendButton() {
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
              sotp = Random().nextInt(999999);
              sendSms();
            },
            child: Text(
              "Resend",
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
                      "Enter OTP",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ],
                ),
                _buildNumberRow(),
                _buildOtpRow(),
                _buildSubmitButton(),
                _buildResendButton(),
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
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Stack(
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
      ),
    );
  }
}
