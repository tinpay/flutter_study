import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool showsSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        color: Colors.black,
        inAsyncCall: showsSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: "logo",
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedTextField(
                hintText: "Enter your email",
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              RoundedTextField(
                hintText: "Enter your password",
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: "Log In",
                color: Colors.lightBlueAccent,
                onPress: () async {
                  try {
                    setState(() => showsSpinner = true);
//                  print("{$email}:{$password}");
                    final result = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (result.user != null) {
                      print("OK");
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() => showsSpinner = false);
                  } catch (e) {
                    setState(() => showsSpinner = false);
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
