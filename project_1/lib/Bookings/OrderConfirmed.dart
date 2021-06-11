import 'package:flutter/material.dart';

class Confirmed extends StatefulWidget {
  @override
  _ConfirmedState createState() => _ConfirmedState();
}

class _ConfirmedState extends State<Confirmed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: Image.network(
                  "https://img.icons8.com/bubbles/2x/checkmark.png"),
            ),
            Text(
              "Thank you for Reservation",
              style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff442c2e),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Your booking has been confirmed",
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff442c2e),
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {},
                child: Text("View Order Summary",
                    style: TextStyle(fontSize: 16, color: Color(0xfff50057))))
          ],
        ),
      ),
    );
  }
}
