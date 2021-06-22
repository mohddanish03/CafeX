import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Auth/Login.dart';
import 'package:project_1/Home/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.get('isLogged') ?? false;
  print(status);
  runApp(status == true ? MyApp() : HomePage());
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
