import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/login_screen/login_screen.dart';
import 'package:flash_chat/screens/registration_screen/registration_screen.dart';
import 'package:flash_chat/screens/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 1, milliseconds: 250),
      vsync: this,
    );
    _animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(
      _animationController,
    );

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: kHeroLogoTag,
                  child: Container(
                    child: Image.asset('assets/images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: [
                    'Flash Chat',
                  ],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              text: 'Log In',
              onTap: () {
                //Go to login screen.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              text: 'Register',
              onTap: () {
                //Go to registration screen.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}