import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'log_in_body.dart';

//this screen is responsible for allowing the user to enter a phone number and log in with it
class LogInScreen extends StatelessWidget {
  static const String routeName = "/Login"; //route name for navigator
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: authGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LogInBody(), //body of the screen
      ),
    );
  }
}
