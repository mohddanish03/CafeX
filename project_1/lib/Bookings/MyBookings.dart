import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyBookings extends StatefulWidget {
  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  String _cancel = "Cancel Reservation";
  bool isClicked = false;

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
                Text('Are you sure ?'),
                Text('You want to cancel this booking'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('NO',
                  style: TextStyle(
                    color: Colors.green,
                  )),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  isClicked = false;
                });
              },
            ),
            TextButton(
              child: const Text('YES',
                  style: TextStyle(
                    color: Colors.red,
                  )),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  isClicked = true;
                  print(isClicked);
                });
              },
            ),
          ],
        );
      },
    );
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
          if (snapshot.hasData) {
            ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                              height: MediaQuery.of(context).size.height / 3.3,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 15.0, top: 5),
                                      child: Text(
                                        "Name : Mohammed Danish",
                                        style: TextStyle(
                                            color: Color(0xff442c2e),
                                            fontSize: 17),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 15.0),
                                      child: Text(
                                        "Date   : 03-06-1999 ",
                                        style: TextStyle(
                                            color: Color(0xff442c2e),
                                            fontSize: 17),
                                      )),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, bottom: 15.0),
                                          child: Text(
                                            "Time  : 03:30 pm",
                                            style: TextStyle(
                                                color: Color(0xff442c2e),
                                                fontSize: 17),
                                          )),
                                      SizedBox(width: 40),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, bottom: 15.0),
                                          child: Text(
                                            "Guest  : 6 peoples ",
                                            style: TextStyle(
                                                color: Color(0xff442c2e),
                                                fontSize: 17),
                                          )),
                                    ],
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 15.0),
                                      child: Text(
                                        "Booking Id : AUIO5767",
                                        style: TextStyle(
                                            color: Color(0xff442c2e),
                                            fontSize: 17),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 15.0),
                                    child: Center(
                                        child: ElevatedButton(
                                      onPressed: isClicked
                                          ? null
                                          : () {
                                              print('dailog');
                                              _showMyDialog(context);
                                              setState(() {
                                                isClicked = false;
                                                if (isClicked == true) {
                                                  _cancel = "Cancelled";
                                                }
                                              });
                                            },
                                      child: Text(
                                        _cancel,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xff442c2e),
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty
                                            .all<EdgeInsets>(EdgeInsets.only(
                                                left: 50,
                                                right: 50,
                                                top: 10,
                                                bottom: 10)),
                                        elevation: MaterialStateProperty.all(8),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                isClicked
                                                    ? Color(0xFFC7C5C5)
                                                    : Color(0xfffedbd0)),
                                      ),
                                    )),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}
