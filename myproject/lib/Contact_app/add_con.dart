import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myproject/Contact_app/contact_screen.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController fname = TextEditingController();
    TextEditingController lname = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController address = TextEditingController();
// Create a CollectionReference called users that references the firestore collection
    CollectionReference users =
        FirebaseFirestore.instance.collection('contacts');

    Future<void> addContact() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'Firstname': fname.text,
            'Lastname': lname.text,
            'Phone': phone.text,
            'Email': email.text,
            'Address': address.text
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFee0290),
          centerTitle: false,
          title: const Text(
            "Add",
          )),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Stack(
            children: <Widget>[
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/men.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: fname,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'First Name',
                        ),
                      ),
                      TextFormField(
                        controller: lname,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Last Name',
                        ),
                      ),
                      TextFormField(
                        controller: phone,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.phone),
                          labelText: 'Phone',
                        ),
                      ),
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Email',
                        ),
                      ),
                      TextFormField(
                        controller: address,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.house),
                          labelText: 'Address',
                        ),
                      ),
                      Center(
                        child: Container(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: TextButton(
                              onPressed: () {
                                addContact().whenComplete(() => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ContactScreen()),
                                    ));
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF4A148C),
                                primary: Colors.white,
                              ),
                              child: const Text(
                                'Submit',
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
