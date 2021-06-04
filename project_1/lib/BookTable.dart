import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  //choice chips
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff442c2e),
            )),
        title: Text(
          "Book Table",
          style: TextStyle(color: Color(0xFF442c2e)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 10),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Table Reservation',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff442c2e),
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 10),
              //date card
              Card(
                color: Color(0xfffedbd0),
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
                      padding: EdgeInsets.all(8),
                      child: DatePicker(DateTime.now(),
                          width: 60,
                          height: 80,
                          initialSelectedDate: DateTime.now(),
                          selectionColor: Color(0xff442c2e),
                          selectedTextColor: Colors.white,
                          onDateChange: (date) {
                        // New date selected
                        setState(() {});
                      }),
                    )
                  ],
                ),
              ),
              //Time card
              Card(
                color: Color(0xfffedbd0),
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
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: List<Widget>.generate(
                            5,
                            (int index) {
                              return ChoiceChip(
                                label: Text('Item $index'),
                                selected: _value == index,
                                onSelected: (bool selected) {
                                  setState(() {
                                    _value = selected ? index : null;
                                  });
                                },
                              );
                            },
                          ).toList(),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
