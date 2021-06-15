import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void check() {
    addToDataBase addItem = addToDataBase();
    setState(() {
      addItem.isSelected = !addItem.isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                'Discover',
                style: TextStyle(color: Color(0xFF442c2e)),
              ),
              pinned: true,
              floating: true,
              bottom: TabBar(
                labelColor: Color(0xFF442c2e),
                indicatorColor: Color(0xFF442C2E),
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text('Starter'),
                  ),
                  Tab(
                    child: Text('Sea Food'),
                  ),
                  Tab(
                    child: Text('Dessert'),
                  ),
                  Tab(
                    child: Text('Soup'),
                  ),
                  Tab(
                    child: Text('Juice'),
                  ),
                ],
              ),
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            starter(context),
            seaFood(context),
            dessert(context),
            soup(context),
            juice(context)
          ],
        ),
      )),
    );
  }
}

// Starter TAB-BAR
class Starter {
  final String img;
  final String name;
  final double rating;

  Starter({required this.img, required this.name, required this.rating});
}

Widget starter(BuildContext context) {
  List data = [
    Starter(
        img:
            'https://i.ndtvimg.com/i/2015-07/chilli-chicken-625_625x350_61436946996.jpg',
        name: ' Stir Fried Chilli Chicken',
        rating: 4.2),
    Starter(
        img:
            'https://i.ndtvimg.com/i/2015-07/paneer-tikka-625_625x350_81436947019.jpg',
        name: 'Paneer-tikkas',
        rating: 4.0),
    Starter(
        img:
            'https://i.ndtvimg.com/i/2015-07/cheese-balls-625_625x350_81436947081.jpg',
        name: 'Cheese Balls',
        rating: 4.6),
    Starter(
        img:
            'https://i.ndtvimg.com/i/2015-07/chicken-satay-625_625x350_41436947101.jpg',
        name: 'Chicken Satay',
        rating: 3.9),
    Starter(
        img:
            'https://i.ndtvimg.com/i/2015-07/lettuce-wrap-625_621x350_61436947152.jpg',
        name: 'Crumb-Fried Chicken',
        rating: 4.1),
    Starter(
        img:
            'https://i.ndtvimg.com/i/2015-07/chicken-wings-625_625x350_71436947129.jpg',
        name: 'Bhuna Chicken Wings',
        rating: 4.1)
  ];
  late String menuName;
  late String imgUrl;
  late double rating;
  addToDataBase addItem = addToDataBase();
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xFFFEEAE6),
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    data[index].img,
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(data[index].name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF442c2e))),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 100,
                      ),
                    ),
                    Text(data[index].rating.toString(),
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF442c2e))),
                    Icon(
                      Icons.star,
                      color: Color(0xfff50057),
                    ),
                    IconButton(
                        onPressed: () {
                          menuName = data[index].name;
                          imgUrl = data[index].img;
                          rating = data[index].rating;

                          addItem.addItemToDataBase(
                              menuName, imgUrl, rating.toInt());
                        },
                        icon: Icon(
                          Icons.bookmark_outline,
                          color: Color(0xFF442c2e),
                        ))
                  ],
                )
              ],
            ));
      });
}

// SeaFood TAB-BAR
class SeaFood {
  final String img;
  final String name;
  final double rating;

  SeaFood({required this.img, required this.name, required this.rating});
}

//widget of SeaFood
Widget seaFood(BuildContext context) {
  List data = [
    SeaFood(
        img:
            'https://i.ndtvimg.com/i/2016-03/prawn-sesame-toast-625_625x350_71457506372.jpg',
        name: 'Prawn Sesame Toast',
        rating: 4.1),
    SeaFood(
        img:
            'https://i.ndtvimg.com/i/2016-03/calamari-fried-625_625x350_71457506458.jpg',
        name: 'Calamari Fritters',
        rating: 4.1),
    SeaFood(
        img:
            'https://i.ndtvimg.com/i/2016-03/mussels-625_625x350_81457506568.jpg',
        name: 'Mussels with Lemongrass',
        rating: 4.1),
    SeaFood(
        img:
            'https://i.ndtvimg.com/i/2016-03/abhay-deol-seafood-spaghetti-625_625x350_81457506703.jpg',
        name: 'Seafood Spaghetti',
        rating: 4.1),
    SeaFood(
        img:
            'https://i.ndtvimg.com/i/2016-03/scallops-625-curry_625x350_71457506738.jpg',
        name: 'Curried Scallops',
        rating: 4.1),
    SeaFood(
        img:
            'https://i.ndtvimg.com/i/2016-03/goan-crab-curry-625_625x350_61457506533.jpg',
        name: 'Goan Crab Curry',
        rating: 4.1)
  ];
  late String menuName;
  late String imgUrl;
  late double rating;
  addToDataBase addItem = addToDataBase();
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xFFFEEAE6),
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    data[index].img,
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(data[index].name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF442c2e))),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 100,
                      ),
                    ),
                    Text(data[index].rating.toString(),
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF442c2e))),
                    Icon(
                      Icons.star,
                      color: Color(0xfff50057),
                    ),
                    IconButton(
                        onPressed: () {
                          menuName = data[index].name;
                          imgUrl = data[index].img;
                          rating = data[index].rating;
                          addItem.isSelected = !addItem.isSelected;
                          print(addItem.isSelected);
                          // if (addItem.isSelected == true) {
                          //   addItem.addItemToDataBase(
                          //       menuName, imgUrl, rating.toInt());
                          //}
                          if (addItem.isSelected == false) {
                            addItem.deleteRecord(addItem.docID);
                          }
                        },
                        icon: Icon(
                          Icons.bookmark_outline,
                          color: Color(0xFF442c2e),
                        ))
                  ],
                )
              ],
            ));
      });
}

// Dessert TAB-BAR
class Dessert {
  final String img;
  final String name;
  final double rating;

  Dessert({required this.img, required this.name, required this.rating});
}

//widget of Dessert
Widget dessert(BuildContext context) {
  List data = [
    Dessert(
        img:
            'https://i.ndtvimg.com/i/2015-09/apple-pie-ice-cream-625_625x350_81443595158.jpg',
        name: 'Apple Pie',
        rating: 4.1),
    Dessert(
        img:
            'https://i.ndtvimg.com/i/2015-09/almond-kulfi-625_625x350_61443596643.jpg',
        name: ' Almond Malai Kulfi',
        rating: 4.1),
    Dessert(
        img:
            'https://i.ndtvimg.com/i/2015-09/lemon-tart-625_625x350_61443595187.jpg',
        name: 'Lemon Tart',
        rating: 4.1),
    Dessert(
        img:
            'https://i.ndtvimg.com/i/2015-09/pistachio-phirni-625_625x350_81443596823.jpg',
        name: 'Pistachio Phirni',
        rating: 4.1),
    Dessert(
        img:
            'https://i.ndtvimg.com/i/2015-09/tiramisu-625_625x350_41443596307.jpg',
        name: ' Low Fat Tiramisu',
        rating: 4.1),
    Dessert(
        img:
            'https://i.ndtvimg.com/i/2015-09/chocolate-truffle-625_625x350_61443595923.jpg',
        name: ' Chocolate Truffle',
        rating: 4.1),
  ];

  late String menuName;
  late String imgUrl;
  late double rating;
  addToDataBase addItem = addToDataBase();
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xFFFEEAE6),
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    data[index].img,
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(data[index].name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF442c2e))),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 100,
                      ),
                    ),
                    Text(data[index].rating.toString(),
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF442c2e))),
                    Icon(
                      Icons.star,
                      color: Color(0xfff50057),
                    ),
                    IconButton(
                        onPressed: () {
                          menuName = data[index].name;
                          imgUrl = data[index].img;
                          rating = data[index].rating;
                          addItem.addItemToDataBase(
                              menuName, imgUrl, rating.toInt());
                        },
                        icon: Icon(
                          Icons.bookmark_outline,
                          color: Color(0xFF442c2e),
                        ))
                  ],
                )
              ],
            ));
      });
}

// Soup TAB-BAR
class Soup {
  final String img;
  final String name;
  final double rating;

  Soup({required this.img, required this.name, required this.rating});
}

//Widget Soup Tab-Bar
Widget soup(BuildContext context) {
  List data = [
    Soup(
        img: 'https://i.ndtvimg.com/i/2016-05/soup_625x350_61463041066.jpg',
        name: ' Ladakhi Chicken Soup ',
        rating: 4.0),
    Soup(
        img:
            'https://i.ndtvimg.com/i/2016-04/thai-noodle-soup-625_625x350_51460529187.jpg',
        name: 'Thai Noodle Soup',
        rating: 4.0),
    Soup(
        img: 'https://i.ndtvimg.com/i/2016-06/soup_625x350_71466063439.jpg',
        name: ' Chimney Soup',
        rating: 4.0),
    Soup(
        img:
            'https://c.ndtvimg.com/2018-11/1d4qohuo_chicken-soup_625x300_14_November_18.jpg',
        name: 'Spinach Soup',
        rating: 4.0),
    Soup(
        img: 'https://i.ndtvimg.com/i/2016-06/soup_625x350_61464866588.jpg',
        name: ' Tom Yum Soup ',
        rating: 4.0),
    Soup(
        img:
            'https://i.ndtvimg.com/i/2015-09/radish-soup-625_625x350_61443177772.jpg',
        name: ' Cantonese Chicken Soup ',
        rating: 4.0)
  ];
  late String menuName;
  late String imgUrl;
  late double rating;
  addToDataBase addItem = addToDataBase();
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xFFFEEAE6),
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    data[index].img,
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(data[index].name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF442c2e))),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 100,
                      ),
                    ),
                    Text(data[index].rating.toString(),
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF442c2e))),
                    Icon(
                      Icons.star,
                      color: Color(0xfff50057),
                    ),
                    IconButton(
                        onPressed: () {
                          menuName = data[index].name;
                          imgUrl = data[index].img;
                          rating = data[index].rating;
                          addItem.addItemToDataBase(
                              menuName, imgUrl, rating.toInt());
                        },
                        icon: Icon(
                          Icons.bookmark_outline,
                          color: Color(0xFF442c2e),
                        ))
                  ],
                )
              ],
            ));
      });
}

//Juice TAB-BAR
class Juice {
  final String img;
  final String name;
  final double rating;

  Juice({required this.img, required this.name, required this.rating});
}

//Widget JUICE Tab-Bar
Widget juice(BuildContext context) {
  List data = [
    Juice(
        img:
            'https://i.ndtvimg.com/i/2016-05/watermelon-juice_625x350_81464002799.jpg',
        name: 'Watermelon Lychee Granita',
        rating: 4.7),
    Juice(
        img:
            'https://i.ndtvimg.com/i/2016-05/kiwi-juice_625x350_71464002837.jpg',
        name: 'Cool Kiwi Juice',
        rating: 4.7),
    Juice(
        img: 'https://i.ndtvimg.com/i/2015-04/aam-ras_625x350_41429705345.jpg',
        name: 'Aam Ras',
        rating: 4.7),
    Juice(
        img:
            'https://i.ndtvimg.com/i/2016-05/grape-juice_625x350_61464003436.jpg',
        name: 'Grape Nectar',
        rating: 4.7),
    Juice(
        img:
            'https://i.ndtvimg.com/i/2017-12/plum-smoothie_620x330_81514276586.jpg',
        name: 'Plum-ness',
        rating: 4.7),
    Juice(
        img:
            'https://i.ndtvimg.com/i/2018-02/pomegranate-juice_620x350_51519042311.jpg',
        name: 'Pomegranate Juice',
        rating: 4.7),
  ];
  late String menuName;
  late String imgUrl;
  late double rating;
  addToDataBase addItem = addToDataBase();
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xFFFEEAE6),
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    data[index].img,
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(data[index].name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF442c2e))),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 100,
                      ),
                    ),
                    Text(data[index].rating.toString(),
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF442c2e))),
                    Icon(
                      Icons.star,
                      color: Color(0xfff50057),
                    ),
                    IconButton(
                        onPressed: () {
                          menuName = data[index].name;
                          imgUrl = data[index].img;
                          rating = data[index].rating;
                          addItem.addItemToDataBase(
                              menuName, imgUrl, rating.toInt());
                        },
                        icon: Icon(
                          Icons.bookmark_outline,
                          color: Color(0xFF442c2e),
                        ))
                  ],
                )
              ],
            ));
      });
}

class addToDataBase {
  bool isSelected = true;
  late String docID;

  Future<void> addItemToDataBase(String name, String imgUrl, int rating) async {
    await Firebase.initializeApp();
    CollectionReference ref = FirebaseFirestore.instance.collection("BookMark");

    ref.doc().set({"MenuName": name, "ImageUrl": imgUrl, "Rating": rating});
  }

  CollectionReference _bookMark =
      FirebaseFirestore.instance.collection('BookMark');

  Future<void> deleteRecord(String docId) {
    return _bookMark
        .doc(docId)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
