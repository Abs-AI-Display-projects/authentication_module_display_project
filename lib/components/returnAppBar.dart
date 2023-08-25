import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../scaffoldComponents/userIconButton.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class ReturnAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color appBarColor;
  final Color backGroundColor;
  final Color textColor;
  final String pageTitle;
  final void Function()? onPressed;
  late Widget? bottom;
  final Color iconColor;

  ReturnAppBar({
    required Key? key,
    this.appBarColor = textWhite,
    this.backGroundColor = textWhite,
    this.textColor = purplePrimaryColor,
    this.pageTitle = "",
    this.bottom,
    this.onPressed,
    required this.preferredSize,
    this.iconColor = lightGreyButtons2,
  }) : super(key: key);

  @override
  final Size preferredSize;

  @override
  _ReturnAppBarState createState() => _ReturnAppBarState();
}

class _ReturnAppBarState extends State<ReturnAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.appBarColor,
      leading: Container(),
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))
              .w),
      title: Center(
          child: Text(
        widget.pageTitle,
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontSize: commonTextSize.sp,
            color: widget.textColor,
            fontWeight: commonTextWeight),
      )),
      actions: [
        Transform.scale(
          scale: -1,
          child: IconButton(
            padding: EdgeInsets.only(left: 20.h),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 25.w,
              color: widget.iconColor,
            ),
            onPressed: widget.onPressed ??
                () {
                  Navigator.pop(context);
                },
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: (widget.bottom == null)
            ? SizedBox(height: 0.0.h, width: double.infinity.w)
            : widget.bottom!,
      ),
    );
  }
}
