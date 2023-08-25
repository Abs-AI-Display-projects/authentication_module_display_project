import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maligali/Screens/Receipts/home_screen.dart';
import '../../../BusinessLogic/view_models/subscriptions_view_model.dart';
import '../../../components/buttons.dart';
import '../../../constants.dart';

/* this screen (it doesn't have a scaffold but that is to product a specific appearance, but it is still a screen) is
responsible for greeting the user when he first signs up and letting him know he has a set amount of free receipts to create without needing a subscription */
class FreeTrailScreen extends StatefulWidget {
  //route name for navigator
  static String routeName = "/FreeTrail";
  const FreeTrailScreen({Key? key}) : super(key: key);

  @override
  State<FreeTrailScreen> createState() => _FreeTrailScreenState();
}

class _FreeTrailScreenState extends State<FreeTrailScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<int?>(
          future: SubscriptionsViewModel().getFreeTrailDataFromFirebase(),
          builder: (context, freeTrailDataSnapshot) {
            if (freeTrailDataSnapshot.connectionState == ConnectionState.done) {
              if (freeTrailDataSnapshot.hasError) {
                if (kDebugMode) {
                  print(freeTrailDataSnapshot.error);
                }
                return Center(
                  child: Text(
                    "حصل مشكلة في تحميل الصفحة \n عيد فتح البرنامج",
                    style: TextStyle(
                        fontSize: commonTextSize.sp,
                        fontWeight: commonTextWeight),
                  ),
                );
              }
              else if (freeTrailDataSnapshot.hasData) {
                String numberOfFreeReceipts =
                    freeTrailDataSnapshot.data.toString();
                return Container(
                  decoration: BoxDecoration(gradient: freeTrailGradient),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80).r,
                        child: Text(
                          "اهلا بيك معانا",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: purplePrimaryColor,
                              fontSize: mainFontSize.sp,
                              fontWeight: mainFontWeight),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30).r,
                        child: Column(
                          textDirection: TextDirection.rtl,
                          children: [
                            RichText(
                              textDirection: TextDirection.rtl,
                              text: TextSpan(
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: authGradient3,
                                      fontSize: subFontSize.sp,
                                      fontWeight: subFontWeight),
                                  children: [
                                    const TextSpan(text: "ترحيبا بيك بنقدملك "),
                                    TextSpan(
                                      text: "$numberOfFreeReceipts ",
                                      style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: darkYellow,
                                          fontSize: subFontSize.sp,
                                          fontWeight: subFontWeight),
                                    ),
                                    const TextSpan(text: "فاتورة هدية"),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15).r,
                              child: Text(
                                "جرب التطبيق براحتك و لو حسيت بفايدته تقدر تكمل\nمعانا من خلال الباقات الشهرية و الكوبونات\nالمجانية",
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: purplePrimaryColor,
                                  fontSize: tinyTextSize.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0).r,
                        child: Image.asset('assets/images/man waving.png'),
                      ),
                      ///////////////confirm button///////////////////
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 20).r,
                        child: DefaultButton(
                          width: 280.w,
                          text: 'دخول',
                          bgColor: darkRed,
                          onPressed: () async {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                //when the user reads the message and confirms, by default we send him back to todayReceiptPage
                                HomeScreen.routeName,
                                (Route<dynamic> route) => false);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
