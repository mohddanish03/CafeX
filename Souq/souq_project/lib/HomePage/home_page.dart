import 'package:flutter/material.dart';

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
            ),
          ],
        ),
        //Categories ListView
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.red,
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: 50,
                  width: 80,
                  color: Colors.amber,
                ),
                Container(
                  height: 50,
                  width: 80,
                  color: Colors.green,
                ),
                Container(
                  height: 50,
                  width: 80,
                  color: Colors.amber,
                ),
                Container(
                  height: 50,
                  width: 80,
                  color: Colors.green,
                ),
                Container(
                  height: 50,
                  width: 80,
                  color: Colors.amber,
                ),
                Container(
                  height: 50,
                  width: 80,
                  color: Colors.green,
                ),
                Container(
                  height: 50,
                  width: 80,
                  color: Colors.amber,
                ),
                Container(
                  height: 50,
                  width: 80,
                  color: Colors.green,
                )
              ],
            ),
          ),
        ),
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
            color: Colors.red,
            height: 180,
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
                  color: Colors.green,
                ),
                Container(
                  height: 50,
                  width: 180,
                  color: Colors.blueAccent,
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
