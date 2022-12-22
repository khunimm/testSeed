// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:seed/components/bottom_navbar.dart';
import 'package:seed/screens/application_detail.dart';
import 'package:seed/screens/camp_history.dart';
import 'package:seed/screens/camp_status.dart';
import 'package:seed/screens/check_value.dart';
import 'package:seed/screens/complete_redeem_gift.dart';
import 'package:seed/screens/complete_upgrade_education.dart';
import 'package:seed/screens/contact_us.dart';
import 'package:seed/screens/detail_camp.dart';
import 'package:seed/screens/detial_news.dart';
import 'package:seed/screens/edit_profile.dart';
import 'package:seed/screens/homepage.dart';
import 'package:seed/screens/login_page.dart';
import 'package:seed/screens/notification_screen.dart';
import 'package:seed/screens/privacy_policy.dart';
import 'package:seed/screens/profilepage.dart';
import 'package:seed/screens/rank.dart';
import 'package:seed/screens/rank_policy.dart';
import 'package:seed/screens/redeem_coin.dart';
import 'package:seed/screens/rewardpage.dart';
import 'package:seed/screens/splash_screen.dart';
import 'package:seed/screens/upgrade_education.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    Phoenix(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: Theme.of(context).copyWith(
      //   appBarTheme: Theme.of(context).appBarTheme.copyWith(systemOverlayStyle: SystemUiOverlayStyle.dark),
      // ),
      theme: ThemeData(fontFamily: 'Prompt'),
      title: 'SEED',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/bottomNavbar': (context) => BottomNavbar(
              numPage: 0,
            ),
        '/loginPage': (context) => LoginPage(),
        '/homepage': (context) => HomePage(),
        '/campStatus': (context) => CampStatus(),
        '/notification': (context) => NotificationScreen(),
        '/profile': (context) => ProfilePage(),
        '/detailNews': (context) => DetailNews(),
        '/detailCamp': (context) => DetailCamp(),
        '/rank': (context) => Rank(),
        '/reward': (context) => Rewardpage(),
        '/checkValue': (context) => CheckValue(),
        '/completeRedeemGift': (context) => CompleteRedeemGift(),
        '/campHistory': (context) => CampHistory(),
        '/redeemCoin': (context) => RedeemCoin(),
        '/upgradeEducation': (context) => UpgradeEducation(),
        '/completeUpgradeEducation': (context) => CompleteUpgradeEducation(),
        '/editProfile': (context) => EditProfile(),
        '/contactUs': (context) => ContactUs(),
        '/privacyPolicy': (context) => PrivacyPolicy(),
        '/rankPolicy': (context) => RankPolicy(),
        '/applicationDetail': (context) => ApplicationDetail(),
      },
    );
  }
}
