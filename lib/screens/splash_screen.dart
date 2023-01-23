// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unnecessary_import, prefer_interpolation_to_compose_strings, non_constant_identifier_names, unused_local_variable

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seed/components/bottom_navbar.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';
import 'package:seed/screens/login_page.dart';
import '../components/api/api_global.dart' as api_global;

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String check_server = api_global.url + '/auth/mobile/check_server';
  String test = 'waiting';

  GetStorage box = GetStorage();

  late Timer _timer;
  int _start = 3;

  @override
  void initState() {
    super.initState();
    // api_global.box.read('s_id');
    // print(api_global.box.read('s_id'));
    startTimer();

    // init();
    // print(box.read('s_id'));
    // if (box.read('s_id') == null) {
    //   print('yes');
    //   Navigator.of(context).pushReplacement(
    //     CupertinoPageRoute(
    //       builder: (ctx) => LoginPage()
    //     ),
    //   );
    // } else {
    //   print('no');
    //   Navigator.of(context).pushReplacement(
    //     CupertinoPageRoute(
    //       builder: (ctx) => BottomNavbar(
    //         numPage: 0,
    //       ),
    //     ),
    //   );
    // }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future _check_server() async {
    print('server success');
    var dio = Dio();
    var data = await dio.get(check_server);
    var json = data.data['status'];
    print(json);

    setState(() {
      test = json;
    });

    if (json == "success") {
      _timer.cancel();
      init();
    } else {
      _timer.cancel();
      _unsuccess();
    }
  }

  Future<void> init() async {
    if (box.read('s_id') == null) {
      print('yes');
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (ctx) => LoginPage()),
      );
    } else {
      print('no');
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(
          builder: (ctx) => BottomNavbar(
            numPage: 0,
          ),
        ),
      );
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          _unsuccess();
          _timer.cancel();
          print("Time Finish.");
        } else {
          _check_server();
          // print(_start);
          setState(() {
            _start--;
          });
        }
      },
    );
  }

// test comment
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Stack(
          children: [
            Image(
              image: AssetImage('images/bg_login.png'),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.all(16.w),
                child: Stack(
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage('images/seed_splashScreen.png'),
                        width: 300,
                      ),
                    ),
                    // Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: FontFormat(
                            text: 'powered by \nAlpaca media and technology solutions\nv1.0.1',
                            align: TextAlign.center,
                            textColor: greyColor,
                            size: 12.w,
                          ),
                        ),
                        Center(
                          child: FontFormat(
                            text: test,
                            align: TextAlign.center,
                            textColor: greyColor,
                            size: 12.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _unsuccess() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
            padding: EdgeInsets.only(bottom: 15.w),
            child: FontFormat(
              text: 'ไม่สามารถเข้าแอปพลิเคชั่นได้ ณ ขณะนี้ เนื่องจากระบบขัดข้อง กรุณากลับมาอีกครั้งภายหลังหรือจนกว่าระบบจะได้รับการแก้ไข',
              size: 14.w,
              align: TextAlign.center,
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => exit(0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffECECEC),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
                        child: Center(
                          child: FontFormat(
                            text: 'ปิด',
                            size: 14.w,
                            textColor: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
