import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

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
      appBar: AppBar(),
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
          height: 20,
        ),
        rowItemCard(context),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Most Popular',
            style: TextStyle(
                color: Color(0xFF442C2E),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}

Widget rowItemCard(BuildContext context) {
  return Row(
    children: <Widget>[
      Expanded(
        child: GestureDetector(
          onTap: () {},
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
