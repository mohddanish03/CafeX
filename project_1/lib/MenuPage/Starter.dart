import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StarterMenu extends StatefulWidget {
  StarterMenu({Key? key}) : super(key: key);

  @override
  _StarterStateMenu createState() => _StarterStateMenu();
}

class _StarterStateMenu extends State<StarterMenu> {
  bool isClicked = false;

  CollectionReference<Map<String, dynamic>> _starter =
      FirebaseFirestore.instance.collection('Starter');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _starter.orderBy("Rating", descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            // var id = document.id;
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;

            return new Card(
                elevation: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Color(0xFFFEEAE6),
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        data['ImageUrl'],
                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(data['MenuName'],
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
                        Text(data['Rating'].toString(),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF442c2e))),
                        Icon(
                          Icons.star,
                          color: Color(0xfff50057),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {});
                              isClicked = !isClicked;
                              print(isClicked);
                              // print(data['Rating']);
                              // print(data['MenuName']);
                              // print(id);
                            },
                            icon: isClicked
                                ? Icon(
                                    Icons.bookmark,
                                    color: Color(0xFF442c2e),
                                  )
                                : Icon(
                                    Icons.bookmark_outline,
                                    color: Color(0xFF442c2e),
                                  ))
                      ],
                    )
                  ],
                ));
          }).toList(),
        );
      },
    );
  }
}
