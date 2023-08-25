import 'package:flutter/widgets.dart';
import 'package:maligali/Screens/authentication/free_trial/free_trail_Screen.dart';
import 'package:maligali/Screens/authentication/otp/otp_screen.dart';
import 'package:maligali/Screens/contact_us/contact_us_screen.dart';
import 'package:maligali/Screens/Receipts/common_sub_screens/receipts_during_hour/receipts_during_hour_screen.dart';
import 'package:maligali/Screens/inventory/existing_inventory/existing_inventory_screen.dart';
import 'package:maligali/Screens/notifications/notification_screen.dart';
import 'package:maligali/root.dart';
import 'Screens/Receipts/home_screen.dart';
import 'Screens/Receipts/today/sub_screens/new_receipt/newReceipt.dart';
import 'Screens/Receipts/today/sub_screens/new_receipt/sub_screens/search_by_barcode/searchByBarcode.dart';
import 'Screens/Receipts/today/sub_screens/new_receipt/sub_screens/search_by_name/searchByName.dart';
import 'Screens/Receipts/today/sub_screens/today_summary/todaySummary.dart';
import 'Screens/authentication/sign_up/sub_screens/terms_and_conditions_screen.dart';
import 'Screens/authentication/sign_up/sub_screens/privacy_policy_screen.dart';
import 'Screens/authentication/login_or_signup/login_or_signup_screen.dart';
import 'Screens/authentication/update_info/update_info_screen.dart';
import 'Screens/authentication/sign_up/sign_up_screen.dart';
import 'Screens/authentication/log_in/log_in_screen.dart';
import 'Screens/inventory/InventoryEntrencePage.dart';
import 'Screens/inventory/adding_to_inventory_grocery/adding_to_inventory_Screen.dart';
import 'Screens/inventory/adding_to_inventory_grocery/sub_screens/create_new_custom_product/add_custom_product_to_user_inventory_screen.dart';
import 'Screens/mhalatko_orders/order_detail_screen.dart';
import 'Screens/mhalatko_orders/orders_notification_screen.dart';
import 'Screens/subscription/subscription _bundles_screen.dart';

final Map<String, WidgetBuilder> routes = {
  Root.routeName: (context) => const Root(),
  LogInOrSignUpScreen.routeName: (context) => const LogInOrSignUpScreen(),
  LogInScreen.routeName: (context) => const LogInScreen(),
  OtpScreen.routeName: (context) =>  OtpScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  NewReceipt.routeName: (context) => const NewReceipt(),
  TodaySummary.routeName: (context) => const TodaySummary(),
  SearchByScanner.routeName: (context) => const SearchByScanner(),
  SearchByName.routeName: (context) => const SearchByName(),
  ReceiptsDuringHourScreen.routeName: (context) => ReceiptsDuringHourScreen(
      (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{})
          as Map),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
  ContactUsScreen.routeName: (context) => ContactUsScreen(),
  PrivacyAndPolicyScreen.routeName: (context) => const PrivacyAndPolicyScreen(),
  TermsAndConditionsScreen.routeName: (context) =>
      const TermsAndConditionsScreen(),
  UpdateInfoScreen.routeName: (context) => UpdateInfoScreen(),
  ExistingInventoryScreen.routeName: (context) =>
      const ExistingInventoryScreen(),
  AddingToInventoryScreen.routeName: (context) =>
      const AddingToInventoryScreen(),
  SubscriptionBundlesScreen.routeName: (context) =>
       SubscriptionBundlesScreen(),
  FreeTrailScreen.routeName: (context) => const FreeTrailScreen(),
  AddCustomProductToUserInventoryScreen.routeName: (context) =>
      AddCustomProductToUserInventoryScreen(),
  OrdersNotificationsScreen.routeName: (context) => const OrdersNotificationsScreen(),
  OrderDetailsScreen.routeName: (context) => const OrderDetailsScreen(),
  InventoryEntrancePage.routeName: (context) => const InventoryEntrancePage(),
  //MapScreen.routeName: (context) => MapScreen(),
};
