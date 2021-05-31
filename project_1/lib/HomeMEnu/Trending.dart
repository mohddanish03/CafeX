import 'package:flutter/material.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  List data = [
    ModelData(
        title: "Chestnut ice-cream ",
        des: "A good Food",
        image: "assets/ice-cream.png"),
    ModelData(
        title: "Chicken Herb Roast",
        des: "A good Food",
        image: "assets/Chicken1.png"),
    ModelData(
        title: "Garlic Chicken",
        des: "A good Food",
        image: "assets/RoastedChicken.png"),
    ModelData(
        title: "Pepperoni Pizza",
        des: "A good Food",
        image: "assets/Pizza.png"),
    ModelData(
        title: "Choco-Split",
        des: "A good Food",
        image: "assets/ice-cream.png"),
    ModelData(
        title: "Fudge Desser", des: "A good Food", image: "assets/dessert.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(right: 10.0, bottom: 10),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
            child: Container(
              color: Color(0xFFFEDBD0),
              height: 130,
              width: 140,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      height: 130,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(19.00),
                      ),
                      child: ClipRRect(
                        child: Image.asset(
                          data[index].image,
                          fit: BoxFit.cover,
                        ),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    data[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Comic Sans MS",
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xfff50057),
                    ),
                  ),
                  Text(
                    data[index].des,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Comic Sans MS",
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xff442c2e),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ModelData {
  final String title;
  final String des;
  final String image;

  ModelData({required this.title, required this.des, required this.image});
}
