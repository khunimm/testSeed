// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/bottom_navbar.dart';
import 'package:seed/components/font_format.dart';

class DetailNews extends StatefulWidget {
  DetailNews({Key? key}) : super(key: key);

  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(14.w, 14.w, 14.w, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage(args['image']),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.w),
                        Center(
                          child: FontFormat(
                            text: args['title'],
                            align: TextAlign.center,
                            weight: FontWeight.w600,
                            textColor: Color(0xff262525),
                            size: 18.w,
                          ),
                        ),
                        Center(
                          child: FontFormat(
                            text: args['period'],
                            textColor: Color(0xffc2c2c2),
                            size: 14.w,
                          ),
                        ),
                        SizedBox(height: 20.w),
                        FontFormat(
                          height: 1.65.w,
                          text: args['detail'],
                        ),
                        SizedBox(height: 80.w),
                      ],
                    ),
                  ),
                ),
                if (args['status'] == null) ...[
                  BottomMenu(
                    callBack: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    titleCallBack: 'ย้อนกลับ',
                  ),
                ] else if (args['status'] == 'ไม่ได้รับการอนุมัติ') ...[
                  BottomMenu(
                    callBack: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavbar(
                            numPage: 1,
                          ),
                        ),
                      );
                    },
                    titleCallBack: 'กลับสู่หน้าสถานะการสมัครค่าย',
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
