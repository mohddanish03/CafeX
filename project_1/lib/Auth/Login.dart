import 'package:flutter/material.dart';
import 'package:project_1/Auth/Registration.dart';
import 'package:project_1/Auth/validation.dart';
import 'package:project_1/Home/BottomNav.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();

  validationModel validate = validationModel();

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  clearTextfield() {
    _emailCtrl.clear();
    _passCtrl.clear();
  }

  checkValidation() {
    final form = formkey.currentState;
    if (form!.validate()) {
      form.save();
      //move to next screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _emailCtrl,
                            validator: (value) =>
                                validate.validateEmail(value!),
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
                                labelStyle:
                                    TextStyle(color: Color(0xFF442c2e))),
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _passCtrl,
                            obscureText: true,
                            validator: (val) {
                              if (val!.isEmpty)
                                return 'Please Input Password';
                              else if (val.length < 8)
                                return 'Atleast 8 character';
                              return null;
                            },
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
                                labelStyle:
                                    TextStyle(color: Color(0xFF442c2e))),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            checkValidation();
                            validate
                                .handleSignInEmail(
                                    _emailCtrl.text, _passCtrl.text)
                                .whenComplete(() => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BottomNavigation())));

                            clearTextfield();
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
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dont have an account ?',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff442c2e)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => Registration()));
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff442c2e),
                                    fontWeight: FontWeight.bold,
                                    decorationStyle: TextDecorationStyle.wavy,
                                    color: Color(0xff442c2e)),
                              ),
                            ),
                          ],
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
