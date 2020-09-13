import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mainScreen.dart';
import 'otpPage.dart';
import 'patientEditProfile.dart';
import 'dart:math';
import 'package:twilio_flutter/twilio_flutter.dart';

var id, name, age, ph_number, mail;
final sotp = Random().nextInt(999999);

class PatientAccountSelection extends StatefulWidget {
  PatientAccountSelection(ids, nam, ag, number, mai) {
    id = ids;
    name = nam;
    age = ag;
    ph_number = number;
    mail = mai;
  }

  @override
  _PatientAccountSelectionState createState() =>
      _PatientAccountSelectionState();
}

class _PatientAccountSelectionState extends State<PatientAccountSelection> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 246, 250, 1.0),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CustomPaint(
                  painter: pathPainter(),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Alata',
                      fontSize: 30.0,
                      color: Colors.green,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 15.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.redAccent,
                        size: 35.0,
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Name: ",
                            style: TextStyle(
                              fontFamily: 'RobotoBold',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'RobotoLight',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 15.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.card_giftcard,
                        color: Colors.redAccent,
                        size: 35.0,
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Age: ",
                            style: TextStyle(
                              fontFamily: 'RobotoBold',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            age,
                            style: TextStyle(
                              fontFamily: 'RobotoLight',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 15.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.redAccent,
                        size: 35.0,
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Phone Number: ",
                            style: TextStyle(
                              fontFamily: 'RobotoBold',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ph_number,
                            style: TextStyle(
                              fontFamily: 'RobotoLight',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 15.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.mail,
                        color: Colors.redAccent,
                        size: 35.0,
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Mail ID",
                            style: TextStyle(
                              fontFamily: 'RobotoBold',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            mail,
                            style: TextStyle(
                              fontFamily: 'RobotoLight',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                        OtpPage otp =
                            new OtpPage(id, name, age, ph_number, mail, sotp);
                        sendSms();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => otp),
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
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sendSms();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PatientDetail(id, name, age, ph_number, mail)),
          );
        },
        child: Icon(
          Icons.edit,
          size: 30,
        ),
      ),
    );
  }
}

class pathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xffE4E2FF);
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.40,
        size.width * 0.58, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.72, size.height * 0.8,
        size.width * 0.92, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.98, size.height * 0.8, size.width, size.height * 0.82);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
