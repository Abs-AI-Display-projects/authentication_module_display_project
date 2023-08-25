import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../components/returnAppBar.dart';
import 'sign_up_body.dart';
import '../../../constants.dart';

/*Screen that allows a new user to sign up with their information to start using our application */
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static const String routeName =
      "/Signup"; //route name of this screen for navigator use

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: purplePrimaryColor,
      appBar: ReturnAppBar(
        key: null,
        pageTitle: "حساب جديد",
        textColor: textWhite,
        appBarColor: purpleAppbar,
        bottom: Container(
          decoration: BoxDecoration(
            color: textWhite,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))
                .w,
          ),
        ),
        preferredSize: Size.fromHeight(40.h),
      ),



      body: SignUpBody(), //body of the screen containing its core logic
    );
  }
}
