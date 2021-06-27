import 'package:flutter/material.dart';
import 'package:project_1/Auth/Login.dart';
import 'package:project_1/Auth/validation.dart';
import 'package:project_1/Profile/MyBookings.dart';
import 'package:project_1/Profile/Notification.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            SizedBox(height: 30),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: circleRadius / 2.0),
                  child: Card(
                    child: Container(
                      //replace this Container with your Card
                      color: Color(0xffFEDBD0),
                      height: 140,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Column(
                        children: [
                          SizedBox(height: 70),
                          Text(
                            'Mohd Danish',
                            style: TextStyle(
                                color: Color(0xFF442c2e),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text('mohd.dany03@gmail.com')
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: circleRadius,
                  height: circleRadius,
                  decoration: ShapeDecoration(
                      shape: CircleBorder(), color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(circleBorderWidth),
                    child: DecoratedBox(
                      decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://avatars.githubusercontent.com/u/48878118?v=4',
                              ))),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyBookings()));
                        },
                        title: Text('My Reservatrions'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        )),
                    Divider(height: 5),
                    ListTile(
                      title: Text('Notification'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 18),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Notifications()));
                      },
                    ),
                    Divider(height: 5),
                    ListTile(
                        title: Text('Our Branches'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 18)),
                    Divider(height: 5),
                    ListTile(
                        title: Text('Supports'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 18)),
                    Divider(height: 5),
                    ListTile(
                        title: Text('About'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 18)),
                    Divider(height: 5),
                    ListTile(
                        onTap: () async {
                          validationModel _model = validationModel();
                          _model.signOut().whenComplete(() =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login())));
                        },
                        title: Text('Log Out'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 18)),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
