import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../components/returnAppBar.dart';
import '../../../constants.dart';
import 'otp_body.dart';

//screen responsible for sending an otp to the user to confirm sign in attempt
class OtpScreen extends StatelessWidget {
  static String routeName = "/OtpScreen"; //route name for navigator
  
  OtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2BG,
      appBar: ReturnAppBar(
        key: null,
        pageTitle: "تأكيد رقم الهاتف",
        textColor: textWhite,
        appBarColor: purplePrimaryColor,
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
      body: OtpBody(), //body of the screen
    );
  }
}
