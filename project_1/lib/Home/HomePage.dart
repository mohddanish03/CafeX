import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:project_1/Auth/Login.dart';
import 'package:project_1/Auth/Registration.dart';
import 'package:project_1/Bookings/BookTable.dart';
import 'package:project_1/Home/MostPop.dart';
import 'package:project_1/Home/Trending.dart';
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Caferteria',
          style: TextStyle(
              color: Color(0xFF442C2E),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
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
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                'Most Popular',
                style: TextStyle(
                    color: Color(0xFF442C2E),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              )
            ],
          ),
        ),
        Container(height: 210, child: MostPopular()),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                'Trending',
                style: TextStyle(
                    color: Color(0xFF442C2E),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              )
            ],
          ),
        ),
        Container(height: 210, child: Trending()),
      ]),
    );
  }
}

Widget rowItemCard(BuildContext context) {
  return Row(
    children: <Widget>[
      Expanded(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Booking()));
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
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Registration()));
          },
          child: Container(
            padding: EdgeInsets.all(2.0),
            height: 90,
            width: 90,
            child: Image.asset('assets/extra.png'),
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Login()));
          },
          child: Container(
            padding: EdgeInsets.all(2.0),
            height: 90,
            width: 90,
            child: Image.asset('assets/gallery.png'),
          ),
        ),
      ),
    ],
  );
}
