import 'package:flutter/material.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen/chat_screen.dart';
import 'package:flash_chat/screens/custom_text_field.dart';
import 'package:flash_chat/screens/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool loading;

  @override
  void initState() {
    super.initState();
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: loading,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: kHeroLogoTag,
                    child: Container(
                      height: 200.0,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Enter your email',
                  borderColor: Colors.lightBlueAccent,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                CustomTextField(
                  obscureText: true,
                  hintText: 'Enter your password',
                  borderColor: Colors.lightBlueAccent,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  color: Colors.lightBlueAccent,
                  text: 'Log In',
                  onTap: () async {
                    setState(() {
                      loading = true;
                    });
                    try {
                      final authResult =
                          await firebaseAuthInstance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (authResult != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(),
                          ),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      loading = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
