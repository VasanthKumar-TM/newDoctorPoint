import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorsProfile extends StatefulWidget {
  @override
  _DoctorsProfileState createState() => _DoctorsProfileState();
}

class _DoctorsProfileState extends State<DoctorsProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(245, 246, 250, 1.0),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'DOCTOR\'s POINT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'QuattrocentoSans',
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('images/Antony.jpg'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Antony Vishal Y S',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontFamily: 'Alata',
                  ),
                ),
                Text(
                  'Psychiatrist',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                    fontFamily: 'Raleway',
                    letterSpacing: 2.5,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.black12,
                    thickness: 1.0,
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "About",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                        child: Text(
                          "Hello I'm working for past 10 years in Ramachandra Hospital",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.white,
                  elevation: 15.0,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.place,
                      color: Colors.redAccent,
                      size: 28.0,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Address: ',
                          style: TextStyle(
                            fontFamily: 'SourceSerifPro',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Malar Hospital, Main Block, Chennai.',
                          style: TextStyle(
                            fontFamily: 'SourceSerifPro',
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0,
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
                      Icons.email,
                      color: Colors.redAccent,
                      size: 28.0,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Mail ID: ',
                          style: TextStyle(
                            fontFamily: 'SourceSerifPro',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'antonyvishal.ys@gmail.com',
                          style: TextStyle(
                            fontFamily: 'SourceSerifPro',
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0,
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
                      Icons.people_outline,
                      color: Colors.redAccent,
                      size: 28.0,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Number of Patients: ',
                          style: TextStyle(
                            fontFamily: 'SourceSerifPro',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '10',
                          style: TextStyle(
                            fontFamily: 'SourceSerifPro',
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0,
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
                      Icons.timer,
                      color: Colors.redAccent,
                      size: 28.0,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Time  taken to Check an Patient: ',
                          style: TextStyle(
                            fontFamily: 'SourceSerifPro',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '20 mins',
                          style: TextStyle(
                            fontFamily: 'SourceSerifPro',
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0,
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
                      size: 28.0,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Phone Number: ',
                          style: TextStyle(
                            fontFamily: 'SourceSerifPro',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '9962386857',
                          style: TextStyle(
                            fontFamily: 'SourceSerifPro',
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0,
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
                      Icons.access_time,
                      color: Colors.redAccent,
                      size: 28.0,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Working Hours: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SourceSerifPro',
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          'Mon-Wed 12:00PM - 3:00PM',
                          style: TextStyle(
                            fontFamily: 'SourceSerifPro',
                            fontWeight: FontWeight.w300,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.blue,
                  child: FlatButton.icon(
                    padding: EdgeInsets.all(10.0),
                    textColor: Colors.green,
                    onPressed: () {
                      // Respond to button press
                    },
                    icon: Icon(Icons.edit, color: Colors.white, size: 25),
                    label: Text(
                      "Edit",
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
