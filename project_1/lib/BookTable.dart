import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

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
  int guestno = 1;

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
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Table Reservation',
                  style: TextStyle(
                      fontSize: 21,
                      color: Color(0xff442c2e),
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 10),
            //Date card-+
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
                      setState(() {});
                    }),
                  ),
                  SizedBox(height: 10)
                ],
              ),
            ),
            //Time card
            Card(
              color: Color(0xFFFDFBFB),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 170,
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
                          padding: const EdgeInsets.only(right: 18.0),
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
                                print("${selected}and ${_selectedIndex}");
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
                    Expanded(
                      child: Text(
                        'Number of Guests',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff442c2e),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Container(
                        height: 40,
                        width: 50,
                        color: Color(0xFFFEdBD0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (guestno <= 8) guestno++;
                                  });
                                },
                                icon: Icon(Icons.add)),
                            Container(
                              height: 40,
                              width: 50,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  '${guestno.toString()}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff442c2e),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (guestno >= 1) guestno--;
                                  });
                                },
                                icon: Icon(Icons.remove))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
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
