import 'dart:async';

import 'package:flutter/material.dart';
import '.././main.dart' show MyHomePage;
import 'package:google_fonts/google_fonts.dart';

class HoldPage extends StatefulWidget {
  @override
  _HoldPageState createState() => _HoldPageState();
}

class _HoldPageState extends State<HoldPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) => LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.cyan,
                ],
              ).createShader(bounds),
              child: Text(
                'KEEP QUOTE',
                style: GoogleFonts.alice(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
