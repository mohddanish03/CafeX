import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_1/BookMark/BookMark.dart';

class SoupMenu extends StatefulWidget {
  SoupMenu({Key? key}) : super(key: key);

  @override
  _SoupStateMenu createState() => _SoupStateMenu();
}

class _SoupStateMenu extends State<SoupMenu> {
  int indx = -1;
  bool isSelected = false;

  AddToBookMark bookMark = AddToBookMark();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Soup').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(child: Text("No Bookings"));
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Something went wrong !"),
          );
        }
        if (snapshot.hasData ||
            snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot products = snapshot.data!.docs[index];
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
                            products['ImageUrl'],
                            fit: BoxFit.fill,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(products['MenuName'],
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
                            Text(products['Rating'].toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF442c2e))),
                            Icon(
                              Icons.star,
                              color: Color(0xfff50057),
                            ),
                            IconButton(
                                onPressed: () {
                                  indx = index;
                                  isSelected = !isSelected;
                                  if (isSelected == true) {
                                    bookMark
                                        .addToDatabase(
                                            products['MenuName'],
                                            products['ImageUrl'],
                                            products['Rating'],
                                            products.id)
                                        .whenComplete(() =>
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        Bookmark())));
                                  } else if (isSelected == false) {
                                    bookMark.deleteRecord(products.id);
                                  }
                                },
                                icon: indx == index && isSelected
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
              });
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
