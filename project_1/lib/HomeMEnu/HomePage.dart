import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:project_1/HomeMEnu/BottomNav.dart';
import 'package:project_1/HomeMEnu/MostPop.dart';
import 'package:project_1/HomeMEnu/Trending.dart';
import 'package:project_1/MenuPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> imgList = [
    Image.asset(
      'assets/image2.jpg',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/image2.jpg',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/image2.jpg',
      fit: BoxFit.fill,
    ),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey(); //scaffold key

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(Icons.menu, color: Color(0xFF442C2E))),
      ),
      body: ListView(children: [
        Container(
          height: size.height / 3.5,
          child: ImageSlideshow(
              width: double.infinity,
              autoPlayInterval: 3000,
              initialPage: 0,
              children: imgList),
        ),
        SizedBox(
          height: 30,
        ),
        rowItemCard(context),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Most Popular',
            style: TextStyle(
                color: Color(0xFF442C2E),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(height: 210, child: MostPopular()),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Trending',
            style: TextStyle(
                color: Color(0xFF442C2E),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(height: 210, child: Trending()),
      ]),
    );
  }
}

//Navigation drawer
Widget drawer(BuildContext context) {
  return ListView(
    children: [
      UserAccountsDrawerHeader(
        accountName: Text(
          "Mohd Danish",
          style: TextStyle(color: Color(0xFF442C2E)),
        ),
        accountEmail: Text(
          'm4mohd032gmail.com',
          style: TextStyle(color: Color(0xFF442C2E)),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Color(0xFFDB9AC2),
        ),
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('Item'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('Item'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('Item'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('Item'),
        onTap: () {},
      )
    ],
  );
}

Widget rowItemCard(BuildContext context) {
  return Row(
    children: <Widget>[
      Expanded(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MenuPage()));
          },
          child: Container(
            padding: EdgeInsets.all(2.0),
            height: 90,
            width: 90,
            child: Image.asset('assets/table-logo.png'),
          ),
        ),
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.all(2.0),
          height: 90,
          width: 90,
          child: Image.asset('assets/extra.png'),
        ),
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.all(2.0),
          height: 90,
          width: 90,
          child: Image.asset('assets/gallery.png'),
        ),
      ),
    ],
  );
}
