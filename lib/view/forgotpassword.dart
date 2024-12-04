// Create a new ForgotPasswordPage

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ihe/commons/colors.dart';
import 'package:ihe/view/home_page.dart';
import 'package:ihe/view/login_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
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
          // Bottom-right half-circle
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 105.0),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 40,),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 36,color: myRed,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 120),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter your email'),
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 90,
                  width: 360,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        child: Text(
                          'Forgot Password ',
                          style: TextStyle(
                              color: myRed,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          String email = _emailController.text;
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                      'A password reset link has been sent to $email'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close dialog
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              });
                        }),
                  ),

                  )),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                    },
                    child:TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                      child: Text('Login',
                      style: TextStyle(fontSize: 18, color: Colors.blue,fontWeight: FontWeight.bold),
                    ),)

                  ),
                )
              ],
            ),
          ),
        ],
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

