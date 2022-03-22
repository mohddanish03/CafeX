import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  Notifications({Key? key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
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
        centerTitle: true,
        title: Text(
          'Notification',
          style: TextStyle(
              color: Color(0xFF442C2E),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: Image.network(
                  "https://img.icons8.com/bubbles/2x/apple-mail.png",
                  fit: BoxFit.cover),
            ),
            Text(
              "No Notification",
              style: TextStyle(
                  fontSize: 17,
                  color: Color(0xff442c2e),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
