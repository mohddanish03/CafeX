import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  AddToBookMark bookmark = AddToBookMark();

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
        stream: FirebaseFirestore.instance.collection('BookMark').snapshots(),
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
                  DocumentSnapshot products = snapshot.data!.docs[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      height: 200,
                      width: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Container(
                              height: 160,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    products['ImgUrl'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      bookmark.deleteRecord(products.id);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete_forever_rounded,
                                    color: Colors.red,
                                  )),
                            )
                          ]),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(products['MenuName'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF442c2e))),
                              ),
                              Text(products['Rating'].toString(),
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

class AddToBookMark {
  Future<void> addToDatabase(
      String name, String url, int rating, String docID) async {
    await Firebase.initializeApp();
    CollectionReference ref = FirebaseFirestore.instance.collection("BookMark");
    ref.doc(docID).set({"MenuName": name, "ImgUrl": url, "Rating": rating});
  }

  CollectionReference _bookMark =
      FirebaseFirestore.instance.collection('BookMark');

  Future<void> deleteRecord(String docId) {
    return _bookMark
        .doc(docId)
        .delete()
        .then((value) => print("Item Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
