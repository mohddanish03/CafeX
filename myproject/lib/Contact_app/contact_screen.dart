import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myproject/Contact_app/add_con.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFee0290),
          centerTitle: false,
          title: const Text(
            "Contacts",
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
                  onTap: () {},
                  child: const Icon(Icons.filter_alt_rounded),
                )),
          ],
        ),
        //FAB
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddContact()),
            );
          },
          label: const Text("Add"),
          icon: const Icon(Icons.add_circle),
          backgroundColor: const Color(0xFFee0290),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: db.collection('contacts').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Center(
                    child: Text("No contacts"),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          snapshot.data!.docs[index]['Firstname'],
                        ),
                        subtitle: Text(snapshot.data!.docs[index]['Lastname']),
                      );
                    });
              }
            }));
  }
}
