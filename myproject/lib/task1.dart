import 'package:flutter/material.dart';

class TaskOne extends StatefulWidget {
  const TaskOne({Key? key}) : super(key: key);

  @override
  _TaskOneState createState() => _TaskOneState();
}

class _TaskOneState extends State<TaskOne> {
  @override
  Widget build(BuildContext context) {
    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        width: 300.0,
        height: 300.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 10.0, top: 20),
              child: Text(
                'Job Name',
                style: TextStyle(color: const Color(0xFFee0290), fontSize: 18),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    border: OutlineInputBorder(),
                  ),
                )),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 10.0, top: 20),
              child: Text(
                'Loaction',
                style: TextStyle(color: Color(0xFFee0290), fontSize: 18),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.location_pin),
                    border: OutlineInputBorder(),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10, bottom: 10),
                  backgroundColor: const Color(0xFF4A148C),
                  primary: Colors.white,
                ),
                child: const Text(
                  'submit',
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFee0290),
        centerTitle: false,
        title: const Text(
          "Search for jobs",
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => errorDialog);
                },
                child: const Icon(Icons.filter_alt_rounded),
              )),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
              leading: Image.asset(
                "assets/men.png",
                fit: BoxFit.fill,
              ),
              title: const Text(
                "Doctor",
                style: TextStyle(
                    color: Color(0xFFee0290),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("I am Doctor"),
              trailing: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF4A148C),
                  primary: Colors.white,
                ),
                child: const Text(
                  'Apply',
                ),
              )),
          ListTile(
              leading: Image.asset(
                "assets/men.png",
                fit: BoxFit.fill,
              ),
              title: const Text(
                "Doctor",
                style: TextStyle(
                    color: Color(0xFFee0290),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("I am Doctor"),
              trailing: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF4A148C),
                  primary: Colors.white,
                ),
                child: const Text(
                  'Apply',
                ),
              )),
          ListTile(
              leading: Image.asset(
                "assets/men.png",
                fit: BoxFit.fill,
              ),
              title: const Text(
                "Doctor",
                style: TextStyle(
                    color: Color(0xFFee0290),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("I am Doctor"),
              trailing: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF4A148C),
                  primary: Colors.white,
                ),
                child: const Text(
                  'Apply',
                ),
              )),
          ListTile(
              leading: Image.asset(
                "assets/men.png",
                fit: BoxFit.fill,
              ),
              title: const Text(
                "Doctor",
                style: TextStyle(
                    color: Color(0xFFee0290),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("I am Doctor"),
              trailing: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF4A148C),
                  primary: Colors.white,
                ),
                child: const Text(
                  'Apply',
                ),
              )),
          ListTile(
              leading: Image.asset(
                "assets/men.png",
                fit: BoxFit.fill,
              ),
              title: const Text(
                "Doctor",
                style: TextStyle(
                    color: Color(0xFFee0290),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("I am Doctor"),
              trailing: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF4A148C),
                  primary: Colors.white,
                ),
                child: const Text(
                  'Apply',
                ),
              )),
        ],
      ),
    );
  }
}
