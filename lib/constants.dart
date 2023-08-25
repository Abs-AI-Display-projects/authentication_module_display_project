import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

const entitlementID = 'premium';
const purplePrimaryColor = Color(0xFF360A45);
const purpleAppbar = Color(0xFF502D5C);
const purpleContainerColor = Color(0xFF350455);

const redLightButtonDarkBG = Color(0xFFE94F5A);
const redLightButtonsLightBG = Color(0xFFFE4E5B);
const lightGreyButtons = Color(0xFFE9E9E8);
const lightGreyButtons2 = Color(0xFFC7C7C6);

const darkGreen = Color(0xFF395A64);
const darkBeige = Color(0xFFE7DFC6);
const smokeGray = Color(0xFFF8F8F8);
const lightGreyReceiptBG = Color(0xFFACB4CC);
const darkRed = Color(0xFFFE202F);

const darkBlue = Color(0xFF061C57);
const grayBG = Color(0xFFF2F2F2);

const redTextAlert = Color(0xFFFF0707);
const white2BG = Color(0xFFFEFEFF);
const textBlack = Color(0xFF000000);
const textWhite = Color(0xFFFFFFFF);
const textBabyPurple = Color(0xFFDD9BF7);
const textYellow = Color(0xFFFFEA2B);
const newYellow = Color(0xFFFDD023);
const darkYellow = Color(0xFFFFD700);
const grapyYellow = Color(0xFFF4D44C);

const textGreen = Color(0xFF14FF00);

const iconBlue1 = Color(0xFF005cb9);
const iconBlue2 = Color(0xFF0000ff);

Color welcomeGradient1 = const Color(0xFF1F0329).withOpacity(0.91); //91%
var welcomeGradient2 = const Color(0xFF2C073A).withOpacity(0.91); //91%
const welcomeGradient3 = Color(0xFF74308B); //100%
const welcomeGradient4 = Color(0xFF854D98); //100%

const authGradient1 = Color(0xFFFEFEFE);
var authGradient2 = const Color(0xFFFEFDFF).withOpacity(0.9);
const authGradient3 = Color(0xFF360A45);

Color freeTrailGradient1 = const Color(0xFF8A4D98).withOpacity(0.7);
var freeTrailGradient2 = const Color(0xFFFFFFFF).withOpacity(0.9);
const freeTrailGradient3 = Color(0xFFFFFFFF);
const gradbrown = Color(0xFF8A6B46);
const beige = Color(0xFFE4CFB6);

LinearGradient welcomeGradient = LinearGradient(
    colors: [
      welcomeGradient1,
      welcomeGradient2,
      welcomeGradient3,
      welcomeGradient4
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.20.w, 0.5.w, 0.95.w, 1.w]);

LinearGradient freeTrailGradient = LinearGradient(
    colors: [
      freeTrailGradient1,
      freeTrailGradient2,
      freeTrailGradient3,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.08.w, 0.30.w, 0.38.w]);

LinearGradient authGradient = LinearGradient(
    colors: [authGradient1, authGradient2, authGradient3],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.w, 0.50.w, 1.w]);

// Fonts Used --------------------------------------------------------------------------
var arFont = GoogleFonts.changa;
var enFont = GoogleFonts.lexendDeca;
var compFont = GoogleFonts.novaSlim;

// Titles and MainButtons
const mainFontSize = 25.0;
const FontWeight mainFontWeight = FontWeight.bold;

// subTitles and subButtons
const subFontSize = 21.0;
const FontWeight subFontWeight = FontWeight.bold;

// Common writing text
const commonTextSize = 18.0;
const FontWeight commonTextWeight =
    FontWeight.w700; // or regular font (no weights used)

// Tiny text (sub texts)
const tinyTextSize = 15.0;
const FontWeight tinyTextWeight =
    FontWeight.w700; // or regular font (no weights used)

const extraTinyTextSize = 12.0;
const FontWeight extraTinyTextWeight =
    FontWeight.w500; // or regular font (no weights used)

// Special cases - extra large text
const extraLargeTextSize = 30.0; // only used as regular font (no weights)

// Paddings Used -------------------------------------------------------------------------
const emptyScreensPadding = 25.0;
const emptyScreenSecondaryPadding = 20.0;
const regularPadding = 15.0;
const separationPadding = 12.0;

// Button Sizes Used ---------------------------------------------------------------------
const mainButtonsSize = 60.0;
const commonButtonSize = 50.0;
const mediumButtonSize = 45.0;
const tinyButtonsSize = 30.0;

// Errors and Alerts ----------------------------------------------------------------------
const String kPhoneNullError = "دخل رقم تليفون صحيح";
const String kInvalidPhoneNumberError = "رقم التليفون غلط";
const String kPhoneNotFoundError = "الرقم مش موجود سجل بياناتك الاول";
const String kInvalidOTPCodeError = "الكود غير صحيح";
const String kOTPCodeNullError = "دخل الكود من الرسالة";
const String kUserNameNullError = "دخل اسم مستخدم صحيح";
const String kShopNameNullError = "دخل اسم محل صحيح";
const String kAddressNullError = "دخل عنوان محلك";
const String kShopSizeNullError = "اختار حجم محلك";
const String kNameNullError = "ارفع ملفات بيانات المحل القديمة";

OutlineInputBorder outlineInputBorderDark() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15).w,
    borderSide: const BorderSide(color: purplePrimaryColor),
  );
}

OutlineInputBorder outlineInputBorderLight() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15).w,
    borderSide: const BorderSide(color: white2BG),
  );
}
