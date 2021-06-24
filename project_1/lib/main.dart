import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Auth/Login.dart';
import 'package:project_1/Home/BottomNav.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getBool('IsLogged') ?? false;
  print(status);

  runApp(
    Expanded(
      child: DevicePreview(
        enabled: true,
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: Color(0xFFFEEAE6),
              primaryColor: Color(0xFFFEDBD0),
              hintColor: Color(0xFF442C2E)),
          locale: DevicePreview.locale(context), // Add the locale here
          builder: DevicePreview.appBuilder,
          home: status == true ? BottomNavigation() : Login(),
        ),
      ),
    ),
  );
}
