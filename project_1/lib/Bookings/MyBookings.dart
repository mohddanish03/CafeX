import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyBookings extends StatefulWidget {
  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  bool isClicked = false;
  var _userData;
  late String docID;

  //showDialog
  Future<void> _showMyDialog(BuildContext context) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFAEFED),
          title: const Text('Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'Are you sure ?',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 6),
                Text(
                  'You want to delete this booking',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel',
                  style: TextStyle(
                    color: Colors.green,
                  )),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  isClicked = false;
                  print(isClicked);
                });
              },
            ),
            TextButton(
              child: const Text('Delete',
                  style: TextStyle(
                    color: Colors.red,
                  )),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  isClicked = true;
                  if (isClicked == true) {
                    deleteRecord(docID);
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }

//Delete resevation on cancel
  CollectionReference _bookTable =
      FirebaseFirestore.instance.collection('BookTable');
  Future<void> deleteRecord(String docId) {
    return _bookTable
        .doc(docId)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference _bookinData =
        FirebaseFirestore.instance.collection("BookTable");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff442c2e),
            )),
        title: Text(
          "Reservations",
          style: TextStyle(color: Color(0xff442c2e)),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _bookinData.snapshots(),
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
                  _userData = snapshot.data?.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Booked on :",
                                        style: TextStyle(
                                            color: Color(0xff442c2e),
                                            fontSize: 17),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    IconButton(
                                        onPressed: () {
                                          print('dailog');
                                          _showMyDialog(context);
                                          docID = _userData.id;
                                        },
                                        icon: Icon(Icons.delete_forever_rounded,
                                            color: Colors.red))
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 10.0),
                                  child: Text(
                                    "Time  :${_userData?.get("Time")} pm",
                                    style: TextStyle(
                                        color: Color(0xff442c2e), fontSize: 17),
                                  )),
                              SizedBox(width: 40),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 10.0),
                                  child: Text(
                                    "Guest  : ${_userData?.get("Guests")} members ",
                                    style: TextStyle(
                                        color: Color(0xff442c2e), fontSize: 17),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 10.0),
                                  child: Text(
                                    "Reserved on : ${_userData?.get("Date")} ",
                                    style: TextStyle(
                                        color: Color(0xff442c2e), fontSize: 17),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 10.0),
                                  child: Text(
                                    "Booking Id :${_userData?.id} ",
                                    style: TextStyle(
                                        color: Color(0xff442c2e), fontSize: 17),
                                  )),
                            ],
                          )),
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
