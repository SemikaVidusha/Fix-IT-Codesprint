// import 'package:codesprint_app/home.dart';
import 'package:codesprint_app/login_page.dart';
import 'package:flutter/material.dart';
// import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()), 
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 10, 41, 149),
      body: Center(
        child: Image.asset('assets/FixIt.png', height: 350, fit: BoxFit.contain),
      ),
    );
  }
}
