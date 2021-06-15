import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  var _menuData;

  CollectionReference _bookMark =
      FirebaseFirestore.instance.collection('BookMark');

  Future<void> deleteRecord(String docId) {
    return _bookMark
        .doc(docId)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Your Wish List",
          style: TextStyle(color: Color(0xFF442c2e)),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _bookMark.snapshots(),
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
            return GridView.builder(
                itemCount: snapshot.data?.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 3.0),
                itemBuilder: (context, index) {
                  _menuData = snapshot.data?.docs[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      height: 200,
                      width: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 160,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  _menuData.get("ImageUrl"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(_menuData.get("MenuName"),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF442c2e))),
                              ),
                              Text(_menuData.get("Rating").toString(),
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF442c2e))),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xfff50057),
                              ),
                              SizedBox(width: 10)
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
