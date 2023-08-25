import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/buttons.dart';
import '../../constants.dart';

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();

void displaySnackBar({required String text, int? snackbarDuration}) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: 4000),
    ),
  );
}

void showPopupDialog(BuildContext context,
    {String title = "تنبيه",
      required String text,
      String buttonText = "تم",
      bool exitApp = false,
      Function()? function,
    }) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5.0.w),
                child: Text(
                  title,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(fontWeight: mainFontWeight),
                ),
              ),
              const Icon(
                Icons.warning_amber_rounded,
                color: redLightButtonsLightBG,
              ),
            ],
          ),
          content: Text(
            text,
            textDirection: TextDirection.rtl,
          ),
          //buttons?
          actions: <Widget>[
            DefaultButton(
                text: buttonText,
                width: 80,
                height: 30,
                fontSize: tinyTextSize,
                onPressed: function?? (){
                  if(exitApp == true){
                    SystemNavigator.pop();
                  }
                  else{
                    Navigator.of(context).pop();
                  }
                })
          ],
        );
      });
}