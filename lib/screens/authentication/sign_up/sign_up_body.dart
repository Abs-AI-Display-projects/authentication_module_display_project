import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:maligali/Screens/authentication/sign_up/sub_screens/terms_and_conditions_screen.dart';
import 'package:maligali/Screens/authentication/sign_up/sub_screens/privacy_policy_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../BusinessLogic/Models/auth_owner_model.dart';
import '../../../BusinessLogic/utils/dropdownLists/subscriptionDropDownItems.dart';
import '../../../BusinessLogic/view_models/authentication_view_models/authentication_view_model.dart';
import '../../../BusinessLogic/utils/globalSnackBar.dart';
import '../../../components/customTextField.dart';
import '../../../components/dropDownBox.dart';
import '../../../components/orDivider.dart';
import '../../../components/buttons.dart';

import '../log_in/log_in_screen.dart';
import 'sub_screens/select_location_on_map_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'dart:ui' as ui;

/*core body of the Screen that allows a new user to sign up with their information to start using our application 
the screen is responsilbe for :
1- taking the users name
2- his phone number
3- refer promocode if it exists
4- store name
5- number of delivery workers
6- allowing the user to determine his store size
7- allowing the user to determine his store type
8- allowing the user to determine his legal statement*********

this screen also navigates the user to : 
1-terms and conditions screen
2- map screen to select store location
3- privacy and policy screen

*/
class SignUpBody extends StatelessWidget {
  SignUpBody({Key? key}) : super(key: key);

  String _countryCode =
      "+20"; // default country code used with the entered phone number

  final _formKey = GlobalKey<FormState>(); //key to validate entered values

  //necessary controllers for storing the text based entered information
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _promocodeController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _shopDeliveryCount = TextEditingController();

//these three dopBoxes gives the user the ability to pick a selection for shop type , size , and his legal statement
//stored as attributes for ease of access to their selected values
//options refer to premade lists in dropdownlists that contain available selections
  DropdownBox shopTypeDropdownBox = DropdownBox(
    options: shopTypeList,
    titleImageUrl: "assets/images/store.png",
    title: "نوع المحل",
  );
  DropdownBox shopSizeDropdownBox = DropdownBox(
    options: shopSizeList,
    titleImageUrl: "assets/images/food-stand.png",
    title: "حجم المحل",
  );
  DropdownBox legalStatementDropdownBox = DropdownBox(
    options: legalStatementSelectionList,
    titleImageUrl: "assets/images/alert.png",
    title: "عندك سجل تجاري و\n بطاقة ضريبية ؟",
    height: 80,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              ///////////////////taking the user name//////////////////////////////
              const OrDivider(text: "بيانات\nالمستخدم"),
              CustomTextField(
                validator: (value) {
                  //validation of field
                  if (value == null || value.isEmpty || value.length > 25) {
                    //make sure a value has been entered
                    displaySnackBar(text: "خانة الاسم فيها مشكلة");
                    return "empty";
                  }
                  return null;
                },
                labelText: 'اسم المستخدم',
                hintText: 'الاسم الاول     الاسم الثاني',
                topPadding: 5.h,
                maxLength: 25,
                controller: _nameController,
              ),
              //////////////////////////////////////taking the users phone number//////////////////////////////
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(
                    width: 270.w,
                    child: CustomTextField(
                      validator: (value) {
                        //validation of field
                        if (value!.isEmpty) {
                          //make sure a value has been entered
                          displaySnackBar(
                              text: "دخل رقم التليفون عشان تعرف تسجل");
                          return "empty";
                        }
                        return null;
                      },
                      labelText: 'رقم المستخدم',
                      hintText: '0000 000 0100',
                      topPadding: 5.h,
                      controller: _numberController,
                      keyboardType: TextInputType
                          .number, //number only keyboard appears when this field is clicked
                      enforce: MaxLengthEnforcement
                          .enforced, //only 11 numbers can be entered
                      maxLength: 11,
                    ),
                  ),
                  ////allow user to pick a country code with his phone number , defaults to egypts country code
                  Padding(
                    padding: const EdgeInsets.only(top: 20).r,
                    child: StatefulBuilder(
                      builder: (context, setInnerState) {
                        return GestureDetector(
                          onTap: () async {
                            ///if country code  box is clicked
                            final code = await const FlCountryCodePicker(
                                    //show country code picker
                                    showSearchBar: true)
                                .showPicker(context: context);
                            if (code != null) {
                              //if a code is selected then set it as the country code
                              setInnerState(() {
                                _countryCode = code.dialCode;
                              });
                            }
                          },
                          child: Container(
                            width: 70.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(width: 2.w),
                                color: textWhite,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5.0))
                                        .w),
                            child: Text(_countryCode,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: commonTextSize.sp,
                                    fontWeight: commonTextWeight,
                                    color: textBlack)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              //////////////taking refer promocode if it exists///////////////////

              CustomTextField(
                //can be left empty since no validation happens
                labelText: "كود المندوب",
                topPadding: 10.h,
                maxLength: 20,
                controller: _promocodeController,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 5).r,
                child: const Text(
                  "يمكنك التسجيل بدون كتابة كود المندوب في حالة عدم وجود مندوب",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: redTextAlert),
                ),
              ),
              SizedBox(height: 20.h, width: double.infinity.w),

              const OrDivider(text: "معلومات\nالمحل"),

              //////////////////// the stores name /////////////////////////
              CustomTextField(
                validator: (value) {
                  //validation of field
                  if (value!.isEmpty || value.length > 30) {
                    //make sure a value has been entered
                    displaySnackBar(text: "خانة اسم المحل فيها مشكلة");
                    return "empty";
                  }
                  return null;
                },
                maxLength: 30,
                labelText: 'اسم المحل',
                hintText: 'مثال :  محلات الامل',
                topPadding: 5.h,
                controller: _shopNameController,
              ),
              ////////////////taking number of delivery workers////////////////////
              CustomTextField(
                labelText: 'عدد عمال توصيل الطلبات (الدليفري)',
                hintText: '0',
                topPadding: 12.h,
                maxLength: 2,
                keyboardType: TextInputType.number,
                validator: (value) {
                  //validation of field
                  if (value!.isEmpty || value.length > 2) {
                    //make sure a value has been entered
                    displaySnackBar(
                        text: "خانة عدد عمال توصيل الطلبات فيها مشكلة");
                    return "empty";
                  }
                  return null;
                },
                controller: _shopDeliveryCount,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 5).r,
                child: const Text(
                  "يجب اختيار حجم المحل, نوع المحل و الحالة القانونية للمحل",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: redTextAlert),
                ),
              ),
              /////////////////////selecting shop size//////////////////////////
              SizedBox(
                  height: emptyScreenSecondaryPadding.h,
                  width: double.infinity.w),
              shopSizeDropdownBox, //has a defualt value of nothing is selected
              /////////////////////selecting shop type//////////////////////////

              SizedBox(
                  height: emptyScreenSecondaryPadding.h,
                  width: double.infinity.w),
              shopTypeDropdownBox, //has a defualt value of nothing is selected
              /////////////////////selecting legal statement//////////////////////////
              SizedBox(
                  height: emptyScreenSecondaryPadding.h,
                  width: double.infinity.w),
              legalStatementDropdownBox, //a value must be selected
            ],
          ),
        ),
        SizedBox(height: 30.h, width: double.infinity.w),

        ///////////////////////////////create account button///////////////////////////
        DefaultButton(
          width: 250.w,
          text: "انشاء الحساب  ",
          onPressed: () async {
            var provider =
                Provider.of<AuthenticationServices>(context, listen: false);
            await provider
                .checkUserPhoneNumberExistence('+2${_numberController.text}')
                .then((existance) {
              if (!existance) {
                provider.authUserModel = AuthUserModel(
                    uid: '',
                    storeName: _shopNameController.text,
                    shopGPSLocation: '',
                    storeType: shopTypeDropdownBox.controllerKeyWordGetter(),
                    storeSize: shopTypeDropdownBox.controllerKeyWordGetter(),
                    storeOwnerName: _nameController.text,
                    storeOwnerNumber: '+2${_numberController.text}',
                    deliveryManCount: _shopDeliveryCount.text,
                    legalStatement:
                        legalStatementDropdownBox.controllerKeyWordGetter() ==
                                'ايوا'
                            ? true
                            : false);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return SelectLocationOnMapScreen();
                  }),
                );
              }
            });
          },
        ),
        SizedBox(height: 5.h, width: double.infinity.w),
        SizedBox(
          width: 330.w,
          child: RichText(
            textDirection: ui.TextDirection.rtl,
            text: TextSpan(
              style: TextStyle(
                  fontSize: commonTextSize.sp, color: lightGreyReceiptBG),
              children: <TextSpan>[
                /////////terms and conditions///////////////
                const TextSpan(
                    text:
                        ' بالضغط علي انشاء الحساب, فتعتبر هذه موافقه منك علي '),
                TextSpan(
                    text: ' شروط الخدمات المقدمه ',
                    style: const TextStyle(color: darkRed),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //navigate to terms and conditions screen if user presses on the words
                        Navigator.pushNamed(
                            context, TermsAndConditionsScreen.routeName);
                      }),
                ///////privacy policy//////////
                const TextSpan(text: ' واقرار بقراءة '),
                TextSpan(
                    text: ' سياسه الخصوصيه ',
                    style: const TextStyle(color: darkRed),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //navigate to privacy policy screen if user presses on the words
                        Navigator.pushNamed(
                            context, PrivacyAndPolicyScreen.routeName);
                      }),
              ],
            ),
          ),
        ),
        SizedBox(height: 5.h, width: double.infinity.w),
      ])),
    );
  }
}
