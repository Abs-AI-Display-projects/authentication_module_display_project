import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/buttons.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../sign_up/sign_up_screen.dart';
import '../log_in/log_in_screen.dart';

//this screen is responsible for giving the user the option between signing in and signing up , navigating the user to either
//LogInScreen if he chose to sign in
//SignUpScreen if he chose to sign up
class LogInOrSignUpBody extends StatelessWidget {
  const LogInOrSignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 50.h),
          Container(
              width: 310.w,
              height: 200.h,
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage("assets/images/loginOrSignupImage.png"),
                    fit: BoxFit.fill,
                  ))),
          SizedBox(
            height: 40.h,
            width: double.infinity.w,
          ),
          ///////////sign in button///////////////////
          DefaultButton(
            text: "تسجيل الدخول",
            onPressed: () async {
              Navigator.pushNamed(context, LogInScreen.routeName);
            },
          ),
          // SizedBox(
          //   height: 25.h,
          //   width: double.infinity.w,
          // ),
          /////////////////sign up button///////////////////////////
          Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: DefaultButton(
              fontColor: darkGreen,
              bgColor: lightGreyButtons,
              text: "حساب جديد",
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.routeName);
              },
            ),
          ),
          // SizedBox(
          //   height: 50.h,
          // ),
          // const Spacer(),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 40.h,top: 50.h),
              child: Text(
                "Powered by: ABS.Ai",
                style: compFont(
                  fontSize: subFontSize.sp,
                  color: textWhite,
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 10.h,
          // ),
        ]),
      ),
    );
  }
}
