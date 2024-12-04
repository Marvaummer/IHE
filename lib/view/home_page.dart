import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ihe/commons/colors.dart';
import 'package:ihe/example/graph.dart';
import 'package:ihe/view/Drawer/My_Truck.dart';
import 'package:ihe/view/Drawer/Payment_History.dart';
import 'package:ihe/view/Drawer/Service_History.dart';
import 'package:ihe/view/Drawer/whereIsMyTruck.dart';
import 'package:ihe/view/Home/garage.dart';
import 'package:ihe/view/Home/outOfService.dart';
import 'package:ihe/view/Home/total_service.dart';
import 'package:ihe/view/Home/vehicle_ihe.dart';
import 'package:ihe/view/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: myRed,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/logo/ihe_logo.png'),
                    ),
                    SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hamdan',
                          style: GoogleFonts.galdeano(
                            fontStyle: FontStyle.italic,
                            textStyle: TextStyle(
                                fontSize: 22, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'hamdan@gmail.com',
                          style: GoogleFonts.galdeano(
                            fontStyle: FontStyle.italic,
                            textStyle: TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.directions_car, color: myRed),
                title: Text(
                  'My Truck',
                  style: GoogleFonts.brawler(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: myRed),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyTruck()));
                },
              ),
              ListTile(
                leading: Icon(Icons.history, color: myRed),
                title: Text(
                  'Payment History',
                  style: GoogleFonts.brawler(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: myRed),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PaymentHistory()));
                },
              ),
              ListTile(
                leading: Icon(Icons.miscellaneous_services, color: myRed),
                title: Text(
                  'Service History',
                  style: GoogleFonts.brawler(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: myRed),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ServiceHistory()));
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: myRed),
                title: Text(
                  'Where is My Truck',
                  style: GoogleFonts.brawler(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: myRed),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Whereismytruck()));
                },
              ),

              Image.asset('assets/images/line.jpg'),
              ListTile(
                title: Text(
                  'LogOut',
                  style: GoogleFonts.brawler(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: myRed),
                  ),
                ),
                onTap: ()  async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('isLoggedIn', false); // Clear login status
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  ); // Navigate back to LoginPage
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          leading: IconButton(
            icon: Image.asset(
              "assets/logo/Drawer.png",
              height: 45,
              width: 55,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          centerTitle: true,
          title: Image.asset(
            'assets/logo/ihe_logo.png',
            height: 80,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Stack(
                children: [
                  SizedBox(height: 40),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                      color: myRed,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Vehiclegarage()));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage('assets/logo/garage.png'),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Vehicle at Garage',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 40,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VehicleIhe()));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/logo/vehicle at ihe.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Vehicle at IHE',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 60,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VehicleListPage()));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/logo/total_service.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Total Service',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 40,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OutOfServiceVehiclesPage()));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/logo/out os service.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Out of Service',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 150,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        'Container 1',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 150,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        'Container 2',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 150,
              //   color: Colors.grey,
              //   child: Center(
              //     child: Text(
              //       'Full-width Container',
              //       style: TextStyle(color: Colors.white, fontSize: 18),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
