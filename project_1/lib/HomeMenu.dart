import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return menuModel(context);
  }
}

//Model-Home-Page-Menu

class PostModel {
  final String img;
  final String name;
  final String des;

  PostModel({required this.img, required this.name, required this.des});
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        img: json['image'] as String,
        name: json['name'] as String,
        des: json['description'] as String);
  }
}

//Handling-HTTP-Request
Future<PostModel> getPost() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/MostPopular'));
  if (response.statusCode == 200) {
    var body = PostModel.fromJson(jsonDecode(response.body));
    return body;
  } else {
    throw Exception('Failed to load album');
  }
}

// Display-Model
Widget menuModel(BuildContext context) {
  return FutureBuilder(
    future: getPost(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        List<PostModel> posts = snapshot.data;
        return ListView(
          children: posts
              .map(
                (PostModel post) => ListTile(
                  title: Text(post.name),
                  subtitle: Text(post.des),
                ),
              )
              .toList(),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}
