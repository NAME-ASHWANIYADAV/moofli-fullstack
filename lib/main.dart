import 'package:flutter/material.dart';
import 'package:moofli_fullstack/screens/login_page.dart';
import 'package:moofli_fullstack/screens/signup1.dart';
import 'package:moofli_fullstack/screens/signup3.dart';
import 'package:moofli_fullstack/screens/signup2.dart';
import 'package:moofli_fullstack/screens/verification_auth_page.dart';
import 'package:moofli_fullstack/screens/verified_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerificationAuthPage(),

    );
  }
}
