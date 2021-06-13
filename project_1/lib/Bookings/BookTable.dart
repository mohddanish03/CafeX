import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Bookings/OrderConfirmed.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final List<String> _timings = [
    '2:00',
    '3:00',
    '4:00',
    '4:30',
    '5:00',
    '5:30',
    '6:00',
    '6:30',
    '7:00',
    '8:00'
  ];
  List<Widget> chips = [];
  int _selectedIndex = 0;
  int guest = 1;
  late String _date;
  late String _time;

  Future<void> addToDatabase() async {
    await Firebase.initializeApp();
    CollectionReference ref =
        FirebaseFirestore.instance.collection("BookTable");
    ref.doc().set({"Date": _date, "Time": _time, "Guests": guest});
  }

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
          "Reserve your Table",
          style: TextStyle(color: Color(0xFF442c2e)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 15),
            Text(
              'Cafeteria',
              style: TextStyle(
                  fontSize: 21,
                  color: Color(0xff442c2e),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            //Date card
            Card(
              color: Color(0xFFFCFBFA),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: Text(
                      'Date',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff442c2e),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: DatePicker(DateTime.now(),
                        width: 65,
                        height: 100,
                        initialSelectedDate: DateTime.now(),
                        selectionColor: Color(0xfffedbd0),
                        selectedTextColor: Color(0xff442c2e),
                        onDateChange: (date) {
                      // New date selected
                      setState(() {
                        String dates = date.toString();
                        String excDate = dates.substring(0, 11);
                        _date = excDate.toString();
                      });
                    }),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
            SizedBox(height: 10),
            //Time card
            Card(
              color: Color(0xFFFDFBFB),
              child: Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 10, bottom: 10),
                      child: Text(
                        'Time',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff442c2e),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //Timings
                    Wrap(
                      children: _timings.asMap().entries.map((entry) {
                        int index = entry.key;
                        String txt = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: ChoiceChip(
                            label: Text(
                              txt,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff442c2e),
                                  fontWeight: FontWeight.bold),
                            ),
                            selectedColor: Color(0xFFFEDBD0),
                            backgroundColor: Color(0xFFFEEAE6).withOpacity(.60),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color(0xff442c2e), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            selected: _selectedIndex == index,
                            onSelected: (selected) {
                              setState(() {
                                _selectedIndex = selected ? index : 0;
                                _time = txt;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            //Guest Card
            Card(
              color: Color(0xFFFDFBFB),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'Number of Guests',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff442c2e),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 60),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            color: Color(0xFFfedbd0),
                            child: IconButton(
                                iconSize: 18,
                                onPressed: () {
                                  setState(() {
                                    if (guest < 8)
                                      guest++;
                                    else if (guest == 8) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('Maximum 8 guests'),
                                      ));
                                    }
                                  });
                                },
                                icon: Icon(Icons.add)),
                          ),
                          Container(
                            height: 35,
                            width: 35,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                '${guest.toString()}',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff442c2e),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 35,
                            color: Color(0xFFfedbd0),
                            child: IconButton(
                                iconSize: 18,
                                onPressed: () {
                                  setState(() {
                                    if (guest > 1)
                                      guest--;
                                    else if (guest == 1) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('Minimum 1 guest'),
                                      ));
                                    }
                                  });
                                },
                                icon: Icon(Icons.remove)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addToDatabase().whenComplete(() => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Confirmed())));
              },
              child: Text(
                'Book Now',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff442c2e),
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.only(
                          left: 120, right: 120, top: 15, bottom: 15)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFFEDBD0)),
                  shape: MaterialStateProperty.all<StadiumBorder>(
                      StadiumBorder())),
            )
          ],
        ),
      ),
    );
  }
}
