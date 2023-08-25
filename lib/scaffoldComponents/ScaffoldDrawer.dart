import 'package:flutter/services.dart';
import 'package:maligali/BusinessLogic/Services/local_inventory_services/hive_services.dart';
import 'package:maligali/BusinessLogic/utils/globalSnackBar.dart';
import 'package:maligali/BusinessLogic/view_models/receipts_view_models/today_view_models/today_page_view_model.dart';
import 'package:maligali/components/buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../BusinessLogic/view_models/authentication_view_models/authentication_view_model.dart';
import '../BusinessLogic/view_models/receipts_view_models/today_view_models/start_day_provider.dart';
import '../BusinessLogic/view_models/subscriptions_view_model.dart';
import '../Screens/authentication/update_info/update_info_screen.dart';
import '../BusinessLogic/view_models/update_user_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Screens/contact_us/contact_us_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../Screens/subscription/subscription _bundles_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      decoration: BoxDecoration(
        color: purplePrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0.r),
          topLeft: Radius.circular(30.0.r),
        ).w,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Consumer<AuthenticationServices>(
                    builder: (context, authProviderInternal, child) {
                  return InkWell(
                    child: Transform.scale(
                      scale: -1.r,
                      child: IconButton(
                        iconSize: 28.w,
                        icon: const Icon(
                          Icons.logout_outlined,
                          color: textWhite,
                        ),
                        color: textWhite,
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                    backgroundColor: purpleContainerColor,
                                    actionsOverflowButtonSpacing: 15.h,
                                    actions: [
                                      Center(
                                        child: Text(' عايز تخرج من حسابك؟ ',
                                            style: TextStyle(
                                                fontSize: subFontSize.sp,
                                                color: white2BG)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0.h),
                                        child: Text(
                                            'اختيارك "نعم" هيخرجك برا البرنامج و هيمسح كل البيانات المؤقتة المخزنة علي جهازك.\n هيظل في نسخة احطياتية مخزنة في قاعدة البيانات',
                                            textAlign: TextAlign.right,
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontSize: tinyTextSize.sp,
                                                color: white2BG)),
                                      ),
                                      Center(
                                        child: DefaultButton(
                                            text: 'نعم',
                                            bgColor: lightGreyReceiptBG,
                                            fontColor: textBlack,
                                            fontSize: tinyTextSize,
                                            height: 40.h,
                                            width: 150.w,
                                            onPressed: (() async {
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: ((context) =>
                                                      const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      )));
                                              if (StartDayProvider.dayStarted ==
                                                  true) {
                                                await Provider.of<
                                                            TodayPageViewModel>(
                                                        context,
                                                        listen: false)
                                                    .endDay();
                                              }
                                              uploadInventoryData(context);

                                              await authProviderInternal
                                                  .logout();
                                              SystemNavigator.pop();
                                            })),
                                      ),
                                      Center(
                                        child: DefaultButton(
                                            text: 'لا',
                                            height: 40.h,
                                            width: 150.w,
                                            fontSize: tinyTextSize,
                                            onPressed: (() =>
                                                Navigator.of(context).pop())),
                                      )
                                    ],
                                  )));
                        },
                      ),
                    ),
                  );
                }),
              ],
            ),
            CircleAvatar(
              backgroundColor: redTextAlert,
              radius: 42.r,
              child: CircleAvatar(
                radius: 40.r,
                backgroundColor: textWhite,
                backgroundImage: const AssetImage('assets/images/userIcon.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1).r,
              child: Consumer<UpdateUserInfoViewModel>(
                  builder: (context, updateProviderInternal, child) {
                return Text(
                    updateProviderInternal.shopNameController.value.text,
                    style: TextStyle(
                        fontSize: mainFontSize.sp,
                        color: textWhite,
                        fontWeight: mainFontWeight));
              }),
            ),
            // SizedBox(
            //   height: 25.h,
            // ),
            buttons(
                text: "تجديد الاشتراك الشهري",
                icon:
                    const AssetImage("assets/images/drawer_subscribe_icon.png"),
                onPressed: () {
                  Navigator.pushNamed(
                      context, SubscriptionBundlesScreen.routeName);
                }),
            buttons(
              text: "تعديل بيانات المحل",
              icon: Icons.account_circle_rounded,
              onPressed: () {
                Navigator.pushNamed(context, UpdateInfoScreen.routeName);
              },
            ),
            buttons(
              text: "استرجاع مخزن المحل",
              icon: Icons.restore_page_rounded,
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Container(
                      color: Colors.grey,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: textWhite,
                        ),
                      ),
                    );
                  },
                );
                bool result =
                    await HiveDatabaseManager.restoreUserInventoryProducts();
                if (result) {
                  Navigator.of(context, rootNavigator: true).pop();
                  displaySnackBar(text: 'تم الاسترجاع بنجاح');
                } else {
                  Navigator.of(context).pop();
                  displaySnackBar(text: 'حصل مشكلة في الاسترجاع');
                }
              },
            ),
            buttons(
              text: "طريقة الإستخدام",
              icon: Icons.help_outline_rounded,
              onPressed: () async {
                String url = "https://youtu.be/r6zMgFQ0Dg4";
                final Uri uri = Uri.parse(url);

                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  showPopupDialog(context,
                      title: "خطأ في الوصول للفيديو",
                      text:
                          "لا يمكن الوصول لفيديو شرح الاستخدام\n ارجع لصفحة مالي جالي علي الفيسبوك");
                }
              },
            ),
            buttons(
              text: "تواصل معنا",
              icon: Icons.phone,
              onPressed: () {
                Navigator.pushNamed(context, ContactUsScreen.routeName);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65).r,
              child: Divider(
                color: textWhite,
                thickness: 1.w,
                height: 29.h,
              ),
            ),
            FutureBuilder<String>(
                future: SubscriptionsViewModel().getSubscriptionTextToDisplay(),
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data ?? "حالة الاشتراك: غير محدد",
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                        fontSize: tinyTextSize,
                        fontWeight: subFontWeight,
                        color: redLightButtonDarkBG),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

Widget buttons({required String text, required icon, required onPressed}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      InkWell(
        child: TextButton(
          child: Text(text,
              style: TextStyle(
                  fontSize: tinyTextSize.sp,
                  color: textWhite,
                  fontWeight: tinyTextWeight)),
          onPressed: onPressed,
        ),
      ),
      SizedBox(
        width: 4.w,
      ),
      icon.runtimeType == IconData
          ? Icon(
              icon,
              size: 35.w,
              color: Colors.cyanAccent.withOpacity(0.4.r),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 8.0).r,
              child: ImageIcon(
                icon,
                color: Colors.amberAccent,
                size: 20.w,
              ),
            ),
    ],
  );
}

void uploadInventoryData(BuildContext context, [bool mounted = true]) async {
  // show the loading dialog
  showDialog(
      // The user CANNOT close this dialog  by pressing outside it
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          // The background color
          backgroundColor: textWhite,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                    child: Icon(
                  Icons.error_outline_outlined,
                  color: darkRed,
                )),
                Center(
                  child: Text(
                    "جاري رفع بيانات المحل",
                    style: TextStyle(
                        fontWeight: subFontWeight,
                        fontSize: subFontSize.r,
                        color: darkRed),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                    ' برجاء عدم اغلاق التطبيق تجنبا لأي خطأ خلال الرفع و الحفاظ علي سلامة بياناتك',
                    style: TextStyle(
                        fontWeight: commonTextWeight,
                        fontSize: commonTextSize.r,
                        color: textBlack)),
                // The loading indicator
                SizedBox(
                  height: 15.h,
                ),
                const CircularProgressIndicator(),
                // Some text
              ],
            ),
          ),
        );
      });

  // Your asynchronous computation here (fetching data from an API, processing files, inserting something to the database, etc)
  await HiveDatabaseManager.backUpUserInventoryProducts();

  // Close the dialog programmatically
  // We use "mounted" variable to get rid of the "Do not use BuildContexts across async gaps" warning
  if (mounted == false) return;

  await Future.delayed(
      const Duration(seconds: 1)); // Add a delay for demonstration purposes
  Navigator.pop(context);
}
