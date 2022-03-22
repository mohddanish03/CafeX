import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyBookings extends StatefulWidget {
  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  bool isClicked = false;
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
                  'You want to cancel this booking',
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFEDBD0),
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
        stream: FirebaseFirestore.instance.collection('BookTable').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
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
                  DocumentSnapshot _orders = snapshot.data!.docs[index];

                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: MediaQuery.of(context).size.height / 4.4,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 15),
                                  child: Text(
                                    "Booking Id : ${_orders.id}",
                                    style: TextStyle(
                                        color: Color(0xff442c2e),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Chip(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        backgroundColor: Color(0xfffedbd0),
                                        label: Text(
                                          "Date : ${_orders['Date']}",
                                          style: TextStyle(
                                              color: Color(0xff442c2e),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Chip(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        backgroundColor: Color(0xfffedbd0),
                                        label: Text(
                                          "Time : ${_orders['Time']} pm",
                                          style: TextStyle(
                                              color: Color(0xff442c2e),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 12),
                                    Chip(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      avatar: Icon(
                                        Icons.location_on,
                                        color: Colors.green,
                                      ),
                                      backgroundColor: Color(0xfffedbd0),
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      label: Text(
                                        _orders['location'],
                                        style: TextStyle(
                                            color: Color(0xff442c2e),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Chip(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        backgroundColor: Color(0xfffedbd0),
                                        label: Text(
                                          "Guest  : ${_orders['Guests']} members",
                                          style: TextStyle(
                                              color: Color(0xff442c2e),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 12),
                                    OutlinedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Call',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff442c2e),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.only(
                                            left: 30, right: 30),
                                        side: BorderSide(
                                            width: 3.0,
                                            color: Color(0xff442c2e)),
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          docID = _orders.id;
                                          _showMyDialog(context);
                                        },
                                        child: Text(
                                          'Cancel Booking',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFFCF5F5),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.red),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)))),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ],
                            )),
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
