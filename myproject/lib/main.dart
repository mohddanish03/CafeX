import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:myproject/Contact_app/contact_screen.dart';
import 'package:myproject/task2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskTwo(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ImagePicker picker = ImagePicker();
  File? uploadimage;

  void sendData() async {
    if (uploadimage == null) return;
    String base64Image = base64Encode(uploadimage!.readAsBytesSync());
    String fileName = uploadimage!.path.split("/").last;
    print(fileName);
    var result = await http.post(
        Uri.parse("http://172.20.10.3/flutter_api/uploadimg.php"),
        body: {"image": base64Image, "filename": fileName});
    print("This is result body" + result.body);
    print(result.statusCode);
    var data = jsonEncode(result.body);
    print(data);
  }

  Future<void> chooseImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    //set source: ImageSource.camera to get image from camera
    final tempfile = File(image!.path);
    setState(() {
      uploadimage = tempfile;
      print(uploadimage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Data"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          uploadimage == null
              ? const Text("No image selected ")
              : Image.file(
                  uploadimage!,
                  height: 200,
                  fit: BoxFit.fill,
                ),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    chooseImage();
                    print("clicked");
                  },
                  child: const Text("Choose")),
              const SizedBox(width: 20),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    sendData();
                    print("uploaded");
                  },
                  child: const Text("Upload")),
            ],
          ))
        ],
      ),
    );
  }
}
