import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
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
            starter(context),
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
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
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                    color: Color(0xFFFEEAE6),
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      data[index].img,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFe0f2f1)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.bookmark_border_outlined))))
                ]),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(data[index].name,
                          style: TextStyle(
                              fontSize: 18,
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
                            TextStyle(fontSize: 16, color: Color(0xFF442c2e))),
                    Icon(
                      Icons.star,
                      color: Color(0xfff50057),
                    )
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
  List data = [];
  return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Card(
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                    color: Color(0xFFFEEAE6),
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      data[index].img,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFe0f2f1)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.bookmark_border_outlined))))
                ]),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(data[index].name,
                          style: TextStyle(
                              fontSize: 18,
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
                            TextStyle(fontSize: 16, color: Color(0xFF442c2e))),
                    Icon(
                      Icons.star,
                      color: Color(0xfff50057),
                    )
                  ],
                )
              ],
            ));
      });
}
