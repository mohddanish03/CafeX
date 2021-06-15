import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_1/BookMark/BookMark.dart';
import 'package:project_1/Home/HomePage.dart';
import 'package:project_1/MenuPage/MenuPage.dart';
import 'package:project_1/Profile/Profile.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  List<Widget> childWidget = [HomePage(), MenuPage(), Bookmark(), Profile()];

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        HomePage();
        break;
      case 1:
        MenuPage();
        break;
      case 2:
        Bookmark();
        break;
      case 3:
        Profile();
        break;
    }
    return Scaffold(
      body: childWidget[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFEDBD0),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF442C2E),
        showUnselectedLabels: true,
        unselectedItemColor: Color(0xFF442C2E).withOpacity(.60),
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: "Bookmark"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Profile"),
        ],
      ),
    );
  }
}
