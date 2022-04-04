import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaskTwo extends StatefulWidget {
  const TaskTwo({Key? key}) : super(key: key);

  @override
  _TaskTwoState createState() => _TaskTwoState();
}

class _TaskTwoState extends State<TaskTwo> {
  @override
  Widget build(BuildContext context) {
    String errormsg;
    bool error, showprogress;
    String username, password;
    TextEditingController _username = TextEditingController();

    void sendData() async {
      String apiurl = "http://172.20.10.3/flutter_api/user.php";
      var response = await http.post(Uri.parse(apiurl), body: {
        'username': _username.text, //get the username text
      });
      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body);
        var data = jsondata["event"];
        print(data);
        if (jsondata["error"]) {
          setState(() {
            showprogress = false; //don't show progress indicator
            error = true;
            errormsg = jsondata["message"];
          });
        } else {
          if (jsondata["success"]) {
            setState(() {
              error = false;
              showprogress = false;
            });
            //save the data returned from server
            //and navigate to home page
            String uid = jsondata["uid"];
            String fullname = jsondata["fullname"];
            String address = jsondata["address"];
            print(fullname);
            //user shared preference to save data
          } else {
            showprogress = false; //don't show progress indicator
            error = true;
            errormsg = "Something went wrong.";
          }
        }
      } else {
        setState(() {
          showprogress = false; //don't show progress indicator
          error = true;
          errormsg = "Error during connecting to server.";
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFee0290),
          centerTitle: false,
          title: const Text(
            "User Exists",
          )),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
              child: TextFormField(
                controller: _username,
              )),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                sendData();
                print("uploaded");
              },
              child: const Text("Check")),
        ],
      ),
    );
  }
}
