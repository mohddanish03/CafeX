import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/originals/19/33/d3/1933d323f8a5d1e804bb643a3a2c0a40.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF442c2e)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sign up to get started ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF442c2e).withOpacity(.70)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height / 1.7,
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Color(0xffFEEAE6),
                              filled: true,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF442c2e))),
                              border: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF442c2e),
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xFF442c2e),
                              ),
                              labelText: 'Full Name',
                              labelStyle: TextStyle(color: Color(0xFF442c2e))),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Color(0xffFEEAE6),
                              filled: true,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF442c2e))),
                              border: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF442c2e),
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xFF442c2e),
                              ),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Color(0xFF442c2e))),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Color(0xffFEEAE6),
                              filled: true,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF442c2e))),
                              border: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF442c2e),
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xFF442c2e),
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Color(0xFF442c2e))),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                              fillColor: Color(0xffFEEAE6),
                              filled: true,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF442c2e))),
                              border: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF442c2e),
                                ),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xFF442c2e),
                              ),
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(color: Color(0xFF442c2e))),
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff442c2e),
                                fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.only(
                                      left: 120,
                                      right: 120,
                                      top: 15,
                                      bottom: 15)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFFEDBD0)),
                              shape: MaterialStateProperty.all<StadiumBorder>(
                                  StadiumBorder())),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Dont have an account ? Sign Up',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff442c2e)),
                        ),
                      ],
                    ),
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
