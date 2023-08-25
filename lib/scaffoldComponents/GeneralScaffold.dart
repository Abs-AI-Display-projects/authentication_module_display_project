import 'package:badges/badges.dart';
import 'package:maligali/Screens/notifications/notification_screen.dart';
import '../BusinessLogic/view_models/mhalatko_orders_view_models/orders_view_model.dart';
import '../BusinessLogic/view_models/notifications_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Screens/Receipts/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge_lib;
import '../../../constants.dart';
import '../Screens/inventory/InventoryEntrencePage.dart';
import '../Screens/mhalatko_orders/orders_notification_screen.dart';
import 'ScaffoldDrawer.dart';

class GeneralScaffold extends StatefulWidget {
  final Color backGroundColor;
  final Widget body;
  final PreferredSizeWidget appBar;
  final String curentPage;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const GeneralScaffold({
    Key? key,
    this.backGroundColor = textWhite,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    required this.appBar,
    required this.body,
    required this.curentPage,
  }) : super(key: key);

  @override
  _GeneralScaffoldState createState() => _GeneralScaffoldState();
}

class _GeneralScaffoldState extends State<GeneralScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backGroundColor,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      drawerEnableOpenDragGesture: false,
      endDrawer: const CustomDrawer(),
      appBar: widget.appBar,
      bottomNavigationBar: NavigationBar(
        height: 40.h,
        backgroundColor: lightGreyButtons,
        destinations: [
          Consumer<NotificationsViewModel>(
              builder: (context, notificationsVM, child) {
            return badge_lib.Badge(
              position: BadgePosition(start: 65.h,top: 3.h),
              padding: const EdgeInsets.all(5),
              showBadge: notificationsVM.badgeNotifier(),
              child: CircleAvatar(
                radius: 40.h,
                backgroundColor:
                    (widget.curentPage == NotificationScreen.routeName)
                        ? Colors.grey.shade400
                        : Colors.transparent,
                child: IconButton(
                    splashRadius: 29.h,
                    icon: Image.asset("assets/images/notifications_bell.png"),
                    iconSize: 30.w,
                    onPressed: () {
                      if (widget.curentPage != NotificationScreen.routeName) {
                        Navigator.pushNamed(
                            context, NotificationScreen.routeName);
                      }
                    }),
              ),
            );
          }),
          CircleAvatar(
            radius: 40.h,
            backgroundColor: (widget.curentPage == HomeScreen.routeName)
                ? Colors.grey.shade400
                : Colors.transparent,
            child: IconButton(
                splashRadius: 29.h,
                icon: Image.asset("assets/images/bill.png"),
                iconSize: 30.w,
                onPressed: () {
                  if (widget.curentPage != HomeScreen.routeName) {
                    Navigator.pushNamedAndRemoveUntil(context,
                        HomeScreen.routeName, (Route<dynamic> route) => false);
                  }
                }),
          ),
          CircleAvatar(
            radius: 40.h,
            backgroundColor:
                (widget.curentPage == InventoryEntrancePage.routeName)
                    ? Colors.grey.shade400
                    : Colors.transparent,
            child: IconButton(
                splashRadius: 29.h,
                icon: Image.asset("assets/images/inventory.png",),
                iconSize: 30.w,
                onPressed: () {
                  if (widget.curentPage != InventoryEntrancePage.routeName) {
                    Navigator.pushNamed(
                        context, InventoryEntrancePage.routeName);
                  }
                }),
          ),
          Consumer<OrdersViewModel>(
              builder: (context, ordersVM, child) {
                return CircleAvatar(
                  radius: 100.h,
                  backgroundColor:
                  (widget.curentPage == NotificationScreen.routeName)
                      ? Colors.grey.shade400
                      : ordersVM.badgeNotifier()==true ?
                  redTextAlert.withOpacity(0.8)
                      :Colors.transparent,
                  child: IconButton(
                      splashRadius: 29.h,
                      icon: Image.asset("assets/images/ataba_orders_icon.png",),
                      iconSize: 30.w,
                      onPressed: () {
                        if (widget.curentPage != NotificationScreen.routeName) {
                          Navigator.pushNamed(
                              context, OrdersNotificationsScreen.routeName);
                        }
                      }),
                );
              }),
        ],
      ),
      body: widget.body,
    );
  }
}
