import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class UserIconButton extends StatelessWidget {
  const UserIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7,right: 7).w,
      child: CircleAvatar(
        backgroundColor: textBlack,
        radius: 25.r,
        child: CircleAvatar(
          radius: 21.r,
          backgroundColor: textWhite,
          backgroundImage:
          const AssetImage('assets/images/userIcon.png'),
        ),
      ),
    );
  }
}
