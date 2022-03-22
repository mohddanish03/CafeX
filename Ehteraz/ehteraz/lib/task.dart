import 'dart:convert';

import 'package:ehteraz/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TaskFlutter extends StatefulWidget {
  const TaskFlutter({Key? key}) : super(key: key);

  @override
  State<TaskFlutter> createState() => _TaskFlutterState();
}

class _TaskFlutterState extends State<TaskFlutter> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/items.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'FRUITS',
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 440,
              child: Image.asset(
                "assets/sales.jpg",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10),
            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 4 / 5,
                      ),
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FoodDetailsPage(
                                      img: _items[index]["img"],
                                      name: _items[index]["p_name"],
                                    )));
                          },
                          //
                          child: Card(
                            child: Column(
                              children: [
                                Container(
                                  color: Color(0xFF636060),
                                  width: MediaQuery.of(context).size.width,
                                  height: 140,
                                  child: Image.asset(
                                    _items[index]['img'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      _items[index]['p_name'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(child: SizedBox(width: 40)),
                                    Text(
                                      "" + _items[index]['p_cost'].toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
