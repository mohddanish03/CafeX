import 'package:flutter/material.dart';
import 'package:pazaar/HomePage/category_view.dart';
import 'package:pazaar/HomePage/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Image.asset("assets/Path.png"),
              const Center(child: Text("Hello")),
              Column(
                children: [
                  Container(
                    height: 160,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.amber))),
                    ),
                  )
                ],
              ),
            ]),
            Container(
              color: Colors.lightBlueAccent,
              height: 200,
              child: const ImgSlider(),
            ),
          ],
        ),
        //Categories ListView
        const Padding(padding: EdgeInsets.all(10.0), child: CategoryView()),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Best Deals",
            style: TextStyle(
                fontFamily: 'PTSans',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        //Best Deals  ListView
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: Image.asset("assets/card.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: Image.asset("assets/card.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: Image.asset("assets/card.png"),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Shops",
            style: TextStyle(
                fontFamily: 'PTSans',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        //Shops ListView
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            color: Colors.red,
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: 100,
                  width: 180,
                  color: Colors.amber,
                ),
                Container(
                  height: 50,
                  width: 180,
                  color: Colors.blueAccent,
                ),
                Container(
                  height: 50,
                  width: 180,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Offers",
            style: TextStyle(
                fontFamily: 'PTSans',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        //Popular ListView
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.red,
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: 100,
                  width: 180,
                  color: Colors.amber,
                ),
                Container(
                  height: 50,
                  width: 180,
                  color: Colors.blueAccent,
                ),
                Container(
                  height: 50,
                  width: 180,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
