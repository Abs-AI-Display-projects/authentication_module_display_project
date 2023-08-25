import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../constants.dart';

/* screen that shows the terms and conditions document to the user if he presses on it */

class TermsAndConditionsScreen extends StatelessWidget {
  static String routeName = "/TermsAndConditions"; //route name for navigator

  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white2BG,
      appBar: AppBar(
        toolbarHeight: 65.h,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: white2BG),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "شروط الخدمات المقدمه",
          style: TextStyle(
              fontSize: mainFontSize.sp,
              color: white2BG,
              fontWeight: mainFontWeight),
        ),
        backgroundColor: purplePrimaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                .w),
      ),
      body: FutureBuilder(
          future: rootBundle.loadString(
              "assets/documents/terms_and_conditions.md"), //the privacy policy text is saved in an asset at this location
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Markdown(data: snapshot.data!);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
