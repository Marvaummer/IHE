import 'package:flutter/material.dart';
import 'package:ihe/commons/colors.dart'; // Assuming myRed is defined here
import 'package:ihe/view/forgotpassword.dart';
import 'package:ihe/view/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    final String apiUrl = 'http://148.66.154.11/api/Account/Login';

    try {
      var response = await http.post(
        Uri.parse('$apiUrl?username=$username&password=$password'),
      );

      // Print the response status and body for debugging
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Here, we're checking if the response body is '1'
        if (response.body == '1') {
          // Login successful
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true); // Set login status to true

          // Navigate to HomePage
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          // Handle unexpected values from the response
          print('Unexpected response format: ${response.body}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed. Invalid credentials.')),
          );
        }
      } else {
        // Handle login error
        print('Login failed: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed. Please check your credentials.')),
        );
      }
    } catch (error) {
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error connecting to server.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                // Top-left half-circle
                Positioned(
                  top: 0,
                  left: 0,
                  child: ClipPath(
                    clipper: HalfCircleClipper(),
                    child: Container(
                      height: 180,
                      width: 180,
                      color: myRed, // Use your custom color here
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 160.0),
                        child: Center(
                          child: Container(
                              width: 160,
                              height: 160,
                              child: Image.asset('assets/logo/ihe_logo.png')),
                        ),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                            hintText: 'Enter your username',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter secure password',
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 75,
                        width: 360,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: ElevatedButton(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: myRed,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: _login, // Call login function here
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        child: Center(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 130),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordPage()),
                                    );
                                  },
                                  child: Text(
                                    'Forgot Your Password?',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Clipper for top-left half circle
class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.arcToPoint(Offset(size.width, 0),
        radius: Radius.circular(size.width));
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
