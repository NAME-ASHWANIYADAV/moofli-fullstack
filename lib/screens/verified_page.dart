import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: VerifiedScreen(),
        ),
      ),
    );
  }
}

class VerifiedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your email id and phone number is now successfully verified.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          width: 184.0,
          height: 176.0,
          child: Icon(
            Icons.check_circle_rounded,
            size: 150.0,
            color: Colors.purple,
          ),
          // decoration: BoxDecoration(
          //   color: Colors.purple.withOpacity(0.1),
          //   shape: BoxShape.circle,
          // ),
        ),
      ],
    );
  }
}
