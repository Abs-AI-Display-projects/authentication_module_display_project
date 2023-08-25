import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize;
  final Color fontColor;
  final Color bgColor;
  final Color shadowColor;
  final FontWeight fontWeight;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontColor = white2BG,
    this.bgColor = redLightButtonsLightBG,
    this.shadowColor = purpleAppbar,
    this.width = 200.0,
    this.height = commonButtonSize,
    this.fontSize = subFontSize,
    this.fontWeight = subFontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
                offset: const Offset(1.5, 2.5),
                blurRadius: 5.0,
                //blurStyle: BlurStyle.normal
            )
          ]
      ),
      width: width.w,
      height: height.h,
      child: TextButton(
        style: ButtonStyle(
            //alignment: Alignment.topCenter,
            shadowColor: MaterialStateProperty.all<Color>(shadowColor),
            backgroundColor: MaterialStateProperty.all<Color>(bgColor),
            alignment: Alignment.center, // <-- had to set alignment
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.zero, // <-- had to set padding to zero
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30).w))),
        onPressed: onPressed,
        child: //SizedBox(
          //width: 250.w,
          //child:
        Text(
            text,
            style: TextStyle(
              fontSize: fontSize.sp,
              color: fontColor,
              fontWeight: fontWeight,
            ),
            textAlign: TextAlign.center,
          //),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  //TODO : remove secondary button - only use defaultButton
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize;

  const SecondaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 200.0,
    this.height = mainButtonsSize,
    this.fontSize = mainFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextButton(
        style: ButtonStyle(
            shadowColor: MaterialStateProperty.all<Color>(lightGreyButtons),
            backgroundColor: MaterialStateProperty.all<Color>(lightGreyButtons),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30).w))),
        onPressed: onPressed,
        child: SizedBox(
          width: 250.w,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize.sp,
              fontWeight: mainFontWeight,
              color: darkGreen,
            ),
          ),
        ),
      ),
    );
  }
}
