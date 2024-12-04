import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ihe/view/home_page.dart';
import 'package:ihe/view/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder<bool>(
          future: _isLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator()); // Loading indicator
            } else if (snapshot.hasData && snapshot.data!) {
              return HomePage(); // User is logged in
            } else {
              return LoginPage(); // User is not logged in
            }
          },
        ),
        '/home': (context) => HomePage(),
      },
    );
  }

  Future<bool> _isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false; // Check login status
  }
}
