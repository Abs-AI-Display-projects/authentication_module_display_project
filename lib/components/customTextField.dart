import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';

class CustomTextField extends StatefulWidget {
  final Color borderColor;
  final double labelSize;
  final TextStyle hintStyle;
  final TextStyle fontStyle;
  final String labelText;
  final FontWeight labelWeight;
  final String hintText;
  final double topPadding;
  final double horizontalPadding;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final int maxLength;
  final MaxLengthEnforcement enforce;
  final Color initialColor;
  final Color focusColor;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? enabled;
  const CustomTextField({
    Key? key,
    this.onChanged,
    this.onEditingComplete,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.borderColor = lightGreyButtons2,
    this.labelSize = tinyTextSize,
    this.labelWeight = FontWeight.normal,
    this.hintStyle =
        const TextStyle(color: textWhite, fontSize: tinyTextSize),
    this.fontStyle = const TextStyle(
        color: textWhite, fontSize: tinyTextSize),
    this.labelText = '',
    this.hintText = "",
    required this.controller,
    this.topPadding = emptyScreenSecondaryPadding,
    this.horizontalPadding = 20,
    this.validator,
    this.maxLength = 50,
    this.enforce = MaxLengthEnforcement.none,
    this.initialColor = textWhite,
    this.focusColor = redLightButtonsLightBG,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.topPadding).r,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding.w),
          child: TextFormField(
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            enabled: widget.enabled,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            maxLengthEnforcement: widget.enforce,
            maxLength: widget.maxLength,

            style: widget.fontStyle,
            focusNode: _focusNode,
            onTap: _requestFocus,
            validator: widget.validator,
            decoration: InputDecoration(
              counterStyle: const TextStyle(color: textWhite),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor),
              ),
              labelText: widget.labelText,
              hintText: widget.hintText,
              labelStyle: TextStyle(
                  color: _focusNode.hasFocus
                      ? widget.focusColor
                      : widget.initialColor,
                  fontSize: widget.labelSize.sp,
                  fontWeight: widget.labelWeight),
              hintStyle: widget.hintStyle,
            ),
          ),
        ),
      ),
    );
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }
}
