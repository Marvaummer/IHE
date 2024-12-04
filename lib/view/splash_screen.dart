import 'package:flutter/material.dart';
import 'package:ihe/view/home_page.dart';
import 'package:ihe/view/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // Simulate a delay for splash screen
    await Future.delayed(Duration(seconds: 2));

    // Retrieve the login status from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false; // Default to false if not set

    // Navigate based on login status
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/home'); // Navigate to HomePage
    } else {
      Navigator.pushReplacementNamed(context, '/login'); // Navigate to LoginPage
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Image.asset('assets/images/splashscreen.jpeg'),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
