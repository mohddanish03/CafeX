import 'package:flutter/material.dart';

class MyBookings extends StatefulWidget {
  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  String _cancel = "Cancel Reservation";
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                  height: MediaQuery.of(context).size.height / 2,
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
                                color: Color(0xff442c2e), fontSize: 17),
                          )),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 20, bottom: 15.0),
                          child: Text(
                            "Date   : 03-06-1999 ",
                            style: TextStyle(
                                color: Color(0xff442c2e), fontSize: 17),
                          )),
                      Row(
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 15.0),
                              child: Text(
                                "Time  : 03:30 pm",
                                style: TextStyle(
                                    color: Color(0xff442c2e), fontSize: 17),
                              )),
                          SizedBox(width: 40),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 15.0),
                              child: Text(
                                "Guest  : 6 peoples ",
                                style: TextStyle(
                                    color: Color(0xff442c2e), fontSize: 17),
                              )),
                        ],
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 20, bottom: 15.0),
                          child: Text(
                            "Booking Id : AUIO5767",
                            style: TextStyle(
                                color: Color(0xff442c2e), fontSize: 17),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 15.0),
                        child: Center(
                            child: ElevatedButton(
                          onPressed: isClicked
                              ? null
                              : () {
                                  print("canceled");
                                  setState(() {
                                    _showMyDialog(context);
                                    _cancel = "Cancelled";
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
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.only(
                                    left: 50, right: 50, top: 10, bottom: 10)),
                            elevation: MaterialStateProperty.all(8),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                isClicked
                                    ? Color(0xFFC7C5C5)
                                    : Color(0xfffedbd0)),
                          ),
                        )),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            print('dailog');
                            var value = _showMyDialog(context);
                            print("This is $value");
                          },
                          child: Text('Dialog'))
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
  
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('NO'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: const Text('YES'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
