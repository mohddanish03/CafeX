import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            child: Column(
              children: [
                Image.asset("assets/icons/resturant.png"),
                const Text(
                  "Resturant",
                  style: TextStyle(
                      fontFamily: 'PTSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Image.asset("assets/icons/electronics.png"),
                const Text(
                  "Electronics",
                  style: TextStyle(
                      fontFamily: 'PTSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Image.asset("assets/icons/fashion.png"),
                const Text(
                  "Fashion",
                  style: TextStyle(
                      fontFamily: 'PTSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Image.asset("assets/icons/grocery.png"),
                const Text(
                  "Grocery",
                  style: TextStyle(
                      fontFamily: 'PTSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Image.asset("assets/icons/beauty.png"),
                const Text(
                  "Beauty",
                  style: TextStyle(
                      fontFamily: 'PTSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Image.asset("assets/icons/arts.png"),
                const Text(
                  "Arts & Crafts",
                  style: TextStyle(
                      fontFamily: 'PTSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
