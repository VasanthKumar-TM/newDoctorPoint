import 'package:flutter/material.dart';
import 'doctors.dart';
import 'patientDetail.dart';
import 'successPage.dart';
import 'patientProfileSelection.dart';

int id;
var name, age, ph_number, mail;

class DoctorsInfo extends StatefulWidget {
  DoctorsInfo(ids, nam, ag, number, mai) {
    id = ids;
    name = nam;
    age = ag;
    ph_number = number;
    mail = mai;
  }
  @override
  _DoctorsInfoState createState() => _DoctorsInfoState();
}

class _DoctorsInfoState extends State<DoctorsInfo> {
  var doctor = Doctor.getData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(245, 246, 250, 1.0),
        appBar: AppBar(
          centerTitle: true,
          elevation: 20,
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.red, Colors.blue])),
          ),
          title: Text(
            'DOCTOR\'s POINT',
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
                    SizedBox(
                      height: 20.0,
                    ),
                    CircleAvatar(
                      radius: 80.0,
                      backgroundImage: AssetImage(doctor[id]['photo']),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      doctor[id]['name'],
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontFamily: 'Alata',
                      ),
                    ),
                    Text(
                      doctor[id]['category'],
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
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "About Doctor",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'RobotoBold',
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, left: 10.0),
                            child: Text(
                              "Hello I'm working for past 10 years in Ramachandra Hospital",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'RobotoLight',
                              ),
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
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
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
                                fontFamily: 'RobotoBold',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              doctor[id]['Address'],
                              style: TextStyle(
                                fontFamily: 'RobotoLight',
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
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
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
                                fontFamily: 'RobotoBold',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              doctor[id]['gmail'],
                              style: TextStyle(
                                fontFamily: 'RobotoLight',
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
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
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
                                fontFamily: 'RobotoBold',
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              doctor[id]['working'],
                              style: TextStyle(
                                fontFamily: 'RobotoLight',
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
                      color: Colors.white,
                      child: FlatButton.icon(
                        padding: EdgeInsets.all(10.0),
                        textColor: Colors.green,
                        onPressed: () {
                          PatientAccountSelection patient =
                              new PatientAccountSelection(
                                  id, name, age, ph_number, mail);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => patient),
                          );
                          // Respond to button press
                        },
                        icon: Icon(Icons.check_circle_outline, size: 25),
                        label: Text(
                          "Book Appointment",
                          style: TextStyle(
                            fontFamily: 'QuattrocentoSansB',
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
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

    var paint2 = new Paint();
    paint2.color = Color(0xffcef4e8);

    Path path1 = new Path();
    path1.moveTo(0, 0);
    path1.lineTo(size.width * 2.4, 6);
    path1.quadraticBezierTo(size.width * 3.5, size.height * 0.33,
        size.width * 0.5, size.height * 0.17);
    path1.quadraticBezierTo(
        size.width * 0.20, size.height * 0.32, 0, size.height * 0.29);

    path1.close();
    canvas.drawPath(path1, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
