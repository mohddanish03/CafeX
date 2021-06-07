import 'package:flutter/material.dart';
import 'package:project_1/HomeMEnu/BottomNav.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Welcome Back !',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF442c2e)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sign In to continue.. ',
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
                height: MediaQuery.of(context).size.height / 2.3,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(height: 25),
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
                      SizedBox(height: 25),
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
                      SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BottomNavigation()));
                        },
                        child: Text(
                          'Sign In',
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
          )
        ],
      ),
    );
  }
}
