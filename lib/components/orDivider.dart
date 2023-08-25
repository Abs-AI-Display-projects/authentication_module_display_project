import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class OrDivider extends StatelessWidget {
  final String text;
  const OrDivider({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            child: Center(
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: white2BG,
                        fontSize: subFontSize.sp,
                        fontWeight: subFontWeight))),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        thickness: 1.5.w,
        color: white2BG,
        height: 0.5.h,
      ),
    );
  }
}
