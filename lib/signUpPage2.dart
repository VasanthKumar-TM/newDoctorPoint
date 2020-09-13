import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'signUpPage3.dart';
import 'package:toast/toast.dart';
import 'package:firebase_storage/firebase_storage.dart';

var name, mail, password;

class signUpPage2 extends StatelessWidget {
  signUpPage2(nam, emai, passwor) {
    name = nam;
    mail = emai;
    password = passwor;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup_p2(),
    );
  }
}

class Signup_p2 extends StatefulWidget {
  @override
  _Signup_p2State createState() => _Signup_p2State();
}

class _Signup_p2State extends State<Signup_p2> {
  List<String> _locations = [
    'Anesthesiologist',
    'Cardiologist',
    'Dermatologist',
    'Endocrinologist',
    'Family Physician',
    'Gastroenterologist',
    'Infectious Disease Physician',
    'Internal Medicine Physician',
    'Nephrologist',
    'Neurologist',
    'Obstetrician/Gynecologist',
    'Oncologist',
    'Ophthalmologist',
    'Otolaryngologist',
    'Pediatrician',
    'Physician Executive',
    'Psychiatrist',
    'Pulmonologist',
    'Radiologist',
    'Surgeon'
  ]; // Option 2
  String _selectedcategory;

  String addr = "",
      number = "",
      workinghr = "",
      patientpday = "",
      timeppatient = "",
      licenseno = "";

  File _image;
  String _uploadedFileURL;

  Future getImage(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
      context: context,
      source: source,
      cameraIcon: Icon(
        Icons.add,
        color: Colors.red,
      ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
    );
    setState(() {
      _image = image;
    });
  }

  // Future uploadFile() async {
  //   StorageReference storageReference = FirebaseStorage.instance
  //       .ref()
  //       .child('chats/${Path.basename(_image.path)}}');
  //   StorageUploadTask uploadTask = storageReference.putFile(_image);
  //   await uploadTask.onComplete;
  //   print('File Uploaded');
  //   storageReference.getDownloadURL().then((fileURL) {
  //     setState(() {
  //       _uploadedFileURL = fileURL;
  //     });
  //   });
  // }

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

  Widget _buildCategoryRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.assignment_turned_in,
            color: Colors.blue,
          ),
          DropdownButton(
            hint: Text(
                'Please choose Specification'), // Not necessary for Option 1
            value: _selectedcategory,
            onChanged: (Value) {
              setState(() {
                _selectedcategory = Value;
              });
            },

            items: _locations.map((location) {
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
            Icons.phone,
            color: Colors.blue,
          ),
          labelText: 'Phone Number',
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
              // uploadFile();
              if (number != null &&
                  licenseno != null &&
                  _selectedcategory != null) {
                if (_image != null) {
                  print(name);
                  print(mail);
                  print(password);
                  print(number);
                  print(licenseno);
                  print(_selectedcategory);
                  print(_image);
                  signUpPage3 sign3 = signUpPage3(name, mail, password, number,
                      licenseno, _selectedcategory, _image);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => sign3),
                  );
                } else {
                  Toast.show("Kindly uploaad your Profile picture", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
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
          labelText: 'Time Per Patient Treatment',
        ),
      ),
    );
  }

  Widget _buildLicensenoRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: false,
        onChanged: (value) {
          setState(() {
            licenseno = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.confirmation_number,
            color: Colors.blue,
          ),
          labelText: 'License Number',
        ),
      ),
    );
  }

  Widget _buildProfilepicRow() {
    String status = "Upload Profile Picture";
    return Column(
      children: <Widget>[
        Card(
          elevation: 3.0,
          color: Colors.white60,
          child: RaisedButton(
            onPressed: () => getImage(ImgSource.Both),
            color: Colors.white60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.photo_camera,
                  color: Colors.redAccent,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  status,
                  style: TextStyle(color: Colors.redAccent),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        _image != null ? Image.file(_image) : Container(),
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
              height: MediaQuery.of(context).size.height * 1.5,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Signup Phase-2",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildNumberRow(),
                  _buildLicensenoRow(),
                  _buildCategoryRow(),
                  _buildProfilepicRow(),
                  SizedBox(
                    height: 10,
                  ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
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
