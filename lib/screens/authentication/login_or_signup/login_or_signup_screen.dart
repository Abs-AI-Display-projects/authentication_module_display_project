import 'login_or_signup_body.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

//the first screen that is shown to the user when the app is launched , lets the user choose whether to log in or sign up
class LogInOrSignUpScreen extends StatelessWidget {
  const LogInOrSignUpScreen({Key? key}) : super(key: key);
  static String routeName = "/logInOrSignup"; //route name for navigator

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: authGradient),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: LogInOrSignUpBody(), //body of the screen
      ),
    );
  }
}
