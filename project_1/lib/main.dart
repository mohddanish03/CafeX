import 'package:flutter/material.dart';
import 'package:project_1/Auth/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Color(0xFFFEEAE6),
          primaryColor: Color(0xFFFEDBD0),
          hintColor: Color(0xFF442C2E)),
      home: Login(),
    );
  }
}
