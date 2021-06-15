import 'package:flutter/material.dart';
import 'package:project_1/MenuPage/Dessert.dart';
import 'package:project_1/MenuPage/Juice.dart';
import 'package:project_1/MenuPage/SeaFood.dart';
import 'package:project_1/MenuPage/Soup.dart';
import 'package:project_1/MenuPage/Starter.dart';

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
            StarterMenu(),
            SeaFoodMenu(),
            DessertMenu(),
            SoupMenu(),
            JuiceMenu()
          ],
        ),
      )),
    );
  }
}
