import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'dart:math';
import 'package:twilio_flutter/twilio_flutter.dart';

import 'doctorOTPPage.dart';

final _firestore = Firestore.instance;

var name, mail, password, ph_num, license, category, image;

class signUpPage3 extends StatelessWidget {
  signUpPage3(
      nam, emai, passwor, number, licenseno, _selectedcategory, _image) {
    name = nam;
    mail = emai;
    password = passwor;
    ph_num = number;
    license = licenseno;
    category = _selectedcategory;
    image = _image;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup_p3(),
    );
  }
}

class Signup_p3 extends StatefulWidget {
  @override
  _Signup_p3State createState() => _Signup_p3State();
}

class _Signup_p3State extends State<Signup_p3> {
  final sotp = Random().nextInt(999999);

  List<String> _city = [
    'Ambur',
    'Chennai',
    'Coimbatore',
    'Cuddalore',
    'Dindigul',
    'Erode',
    'Gudiyatham',
    'Hosur',
    'Kancheepuram',
    'Karaikkudi',
    'Karur',
    'Kumarapalayam',
    'Kumbakonam',
    'Madurai',
    'Nagapattinam',
    'Nagercoil',
    'Neyveli',
    'Pollachi',
    'Pudukkottai',
    'Rajapalayam',
    'Ranipet',
    'Salem',
    'Sivakasi',
    'Thanjavur',
    'Thoothukkudi',
    'Tiruchirappalli',
    'Tirunelveli',
    'Tiruppur',
    'Tiruvannamalai',
    'Udhagamandalam',
    'Vaniyambadi',
    'Vellore'
  ];
  String _selectedCity;
  String addr = "",
      number = "",
      workinghr = "",
      patientpday = "",
      timeppatient = "",
      licenseno = "",
      about = "";

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
            ' is your OTP(One time pasword), Dont share it with others with regards Doctors point team.');
  }

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

  Widget _aboutYouRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        obscureText: false,
        onChanged: (value) {
          setState(() {
            about = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.timer,
            color: Colors.blue,
          ),
          labelText: 'About You',
        ),
      ),
    );
  }

  Widget _buildWorkinghoursRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        obscureText: false,
        onChanged: (value) {
          setState(() {
            workinghr = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.timer,
            color: Colors.blue,
          ),
          labelText: 'Working Hours',
        ),
      ),
    );
  }

  Widget _buildPatientsdayRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        obscureText: false,
        onChanged: (value) {
          setState(() {
            patientpday = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_balance_wallet,
            color: Colors.blue,
          ),
          labelText: 'No.of.Patients per day',
        ),
      ),
    );
  }

  Widget _buildAddressRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        onChanged: (value) {
          setState(() {
            addr = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.text_format,
              color: Colors.blue,
            ),
            labelText: 'Enter Your Complete Address'),
      ),
    );
  }

  Widget _buildCityRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.location_city,
            color: Colors.blue,
          ),
          SizedBox(
            width: 3,
          ),
          DropdownButton(
            hint: Text(
                'Please choose your Location'), // Not necessary for Option 1
            value: _selectedCity,
            onChanged: (Value) {
              setState(() {
                _selectedCity = Value;
              });
            },

            items: _city.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeperPatientRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        obscureText: false,
        onChanged: (value) {
          setState(() {
            timeppatient = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.golf_course,
            color: Colors.blue,
          ),
          labelText: 'Time Per Patient Treatment(in mins)',
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
            onPressed: () {
              if (workinghr != null &&
                  patientpday != null &&
                  timeppatient != null &&
                  _selectedCity != null &&
                  addr != null) {
                print(name);
                print(mail);
                print(password);
                print(ph_num);
                print(license);
                print(category);
                print(image);
                print(workinghr);
                print(patientpday);
                print(timeppatient);
                print(_selectedCity);
                print(addr);
                print(sotp);
                Otp_Doc otp = new Otp_Doc(
                    name,
                    mail,
                    password,
                    ph_num,
                    license,
                    category,
                    image,
                    workinghr,
                    patientpday,
                    timeppatient,
                    _selectedCity,
                    addr,
                    about,
                    sotp);
                sendSms();

                _firestore.collection('doctors').add({
                  'addr': addr,
                  'category': category,
                  'city': city,
                  'image': image,
                  'license': license,
                  'name': name,
                  'patientpday': patientpday,
                  'ph_num': ph_num,
                  'timeppatient': timeppatient,
                  'workinghr': workinghr,
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => otp),
                );
              } else {
                Toast.show("Kindly Fill all the fields\nIts Mandatory", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
              }
            },
            child: Text(
              "Submit",
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
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 60.0,
                      ),
                      Text(
                        "Signup Phase-3",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 30,
                        ),
                      ),
                    ],
                  ),
                  _aboutYouRow(),
                  _buildWorkinghoursRow(),
                  _buildPatientsdayRow(),
                  _buildTimeperPatientRow(),
                  _buildAddressRow(),
                  _buildCityRow(),
                  _buildSubmitButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfff2f3f7),
        body: SingleChildScrollView(
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
    ;
  }
}
