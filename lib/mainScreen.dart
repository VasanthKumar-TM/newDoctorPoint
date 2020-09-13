import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'doctors.dart';
import 'doctorInfo.dart';
import 'loginPage.dart';
import 'patientAccount.dart';

var name, age, ph_number, mail;

class MainScreen extends StatefulWidget {
  MainScreen(nam, ag, number, mai) {
    name = nam;
    age = ag;
    ph_number = number;
    mail = mai;
  }

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var doctor = Doctor.getData;
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.20;
    return Scaffold(
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
        leading: GestureDetector(
          onTap: () {
            PatientAccount patient =
                new PatientAccount(name, age, ph_number, mail);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => patient),
            );
          },
          child: Icon(
            Icons.account_circle,
            size: 30,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list,
            ),
            onPressed: () {},
          ),
        ],
        title: Text(
          'DOCTOR\'s POINT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'QuattrocentoSans',
          ),
        ),
      ),
      body: Container(
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
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "COVID'19 Specialists",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'QuattrocentoSansB',
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: closeTopContainer ? 0 : 1,
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: size.width,
                          alignment: Alignment.topCenter,
                          height: closeTopContainer ? 0 : categoryHeight,
                          child: categoriesScroller),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: doctor.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: GestureDetector(
                            onTap: () {
                              DoctorsInfo doctorsInfo = new DoctorsInfo(
                                  doctor[index]['id'],
                                  name,
                                  age,
                                  ph_number,
                                  mail);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => doctorsInfo),
                              );
                            },
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage:
                                          AssetImage(doctor[index]['photo']),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            doctor[index]['name'],
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Alata',
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            doctor[index]['category'],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Raleway',
                                                color: Colors.grey.shade600),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.stars,
                                                color: Colors.redAccent,
                                                size: 20,
                                              ),
                                              Text(
                                                doctor[index]['score'],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                        'QuattrocentoSans',
                                                    fontWeight: FontWeight.w200,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                ' (' +
                                                    doctor[index]
                                                        ['reviewCount'] +
                                                    ' Reviews)',
                                                style: TextStyle(
                                                    fontFamily:
                                                        'QuattrocentoSans',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w200,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              margin: EdgeInsets.all(10),
                              elevation:
                                  2.0, // this field changes the shadow of the card 1.0 is default
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.notifications,
          size: 30,
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 90;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('images/pooja.jpg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Dr. Pooja P",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Alata',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.stars,
                            color: Colors.redAccent,
                            size: 20,
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'QuattrocentoSans',
                                fontWeight: FontWeight.w200,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('images/swetha.jpg'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Dr. Swetha L",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Alata',
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.stars,
                              color: Colors.redAccent,
                              size: 20,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'QuattrocentoSans',
                                  fontWeight: FontWeight.w200,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('images/steve.jpeg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Dr. Steve T",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Alata',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.stars,
                            color: Colors.redAccent,
                            size: 20,
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'QuattrocentoSans',
                                fontWeight: FontWeight.w200,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
