// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_field, unused_element, avoid_print, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/color.dart';
import 'package:seed/screens/camp_status.dart';
import 'package:seed/screens/homepage.dart';
import 'package:seed/screens/notification_screen.dart';
import 'package:seed/screens/profilepage.dart';

class BottomNavbar extends StatefulWidget {
  int numPage;

  BottomNavbar({
    Key? key,
    required this.numPage,
  }) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

late ScrollController _scrollController;

void _scrollToTop() {
  _scrollController.animateTo(0, duration: const Duration(seconds: 3), curve: Curves.linear);
}

class _BottomNavbarState extends State<BottomNavbar> {
  final ScrollController _firstTabBarScrollController = ScrollController();

  List<Widget> _widgetOptions = <Widget>[];

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomePage(
        firstTabBarScrollController: _firstTabBarScrollController,
      ),
      CampStatus(),
      NotificationScreen(
        firstTabBarScrollController: _firstTabBarScrollController,
      ),
      ProfilePage(),
    ];
  }

  void _onItemTapped(int index) {
    // print(index);
    setState(
      () {
        widget.numPage = index;
        print('This is numpage ${widget.numPage}');
      },
    );
    if (index == 0 || index == 2 && _firstTabBarScrollController.hasClients) {
      print('test');
      _firstTabBarScrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[widget.numPage],
      bottomNavigationBar: ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: greyColor,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.w, 10.w, 15.w, 20.w),
              child: GNav(
                duration: const Duration(
                  milliseconds: 500,
                ),
                activeColor: whiteColor,
                tabBackgroundColor: blueColor,
                gap: 10,
                iconSize: 22.w,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.w,
                ),
                tabs: [
                  GButton(
                    borderRadius: BorderRadius.circular(10),
                    icon: Iconsax.home4,
                    iconSize: 22.w,
                    text: "หน้าหลัก",
                    textStyle: GoogleFonts.prompt(
                      color: whiteColor,
                    ),
                  ),
                  GButton(
                    borderRadius: BorderRadius.circular(10),
                    icon: Iconsax.book_14,
                    iconSize: 22.w,
                    text: "สถานะกิจกรรม",
                    textStyle: GoogleFonts.prompt(
                      color: whiteColor,
                    ),
                  ),
                  GButton(
                    borderRadius: BorderRadius.circular(10),
                    icon: Iconsax.notification,
                    iconSize: 22.w,
                    text: "แจ้งเตือน",
                    textStyle: GoogleFonts.prompt(
                      color: whiteColor,
                    ),
                  ),
                  GButton(
                    borderRadius: BorderRadius.circular(10),
                    icon: Iconsax.profile_2user,
                    iconSize: 22.w,
                    text: "โปรไฟล์",
                    textStyle: GoogleFonts.prompt(
                      color: whiteColor,
                    ),
                  ),
                ],
                onTabChange: _onItemTapped,
                selectedIndex: widget.numPage,
              ),
            ),
          );
        },
      ),
    );
    // },
    // );
  }
}
