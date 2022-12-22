// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/camp_format.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class CampHistory extends StatefulWidget {
  CampHistory({Key? key}) : super(key: key);

  @override
  State<CampHistory> createState() => _CampHistoryState();
}

class _CampHistoryState extends State<CampHistory> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: bgGreyColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: whiteColor,
            shadowColor: bgGreyColor.withOpacity(0.5),
            title: FontFormat(
              text: 'ประวัติการเข้าร่วมกิจกรรม',
              weight: FontWeight.w600,
              textColor: greyColor,
              size: 20.w,
            ),
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 18.w, 16.w, 0),
                child: ListView(
                  children: [
                    CampFormat(
                      statusComplete: 'เข้าค่ายสำเร็จ',
                      title: 'เยาวชนไทยหัวใจอาสา',
                      image: 'images/Screen Shot 2565-12-08 at 17.13.45.png',
                      persons: '20',
                      period: '8 ธ.ค. 65 - 10 ธ.ค. 65',
                      location: 'โรงเรียน สุรศักดิ์ มนตรี',
                      campPoint: '10,000',
                      seedCoin: '10,000',
                      require: 'ผู้ผ่านค่าย SEED',
                      detail:
                          "พูดคุยกับผู้สื่อข่าวไต้หวัน: เสียงสะท้อนความประทับใจ APEC 2022 ที่ไทยเป็นเจ้าภาพ พูดคุยกับ '���ลู่ ซินฮุ่ย' ผู้สื่อข่าวจากไต้หวัน ผู้สื่อข่าวจากไต้หวันในงานประชุม APEC 2022 ณ ศูนย์สื่อมวลชน ดำเนินรายการโดย... สรวง สิทธิสมาน SEED Thailand",
                    ),
                  ],
                ),
              ),
              BottomMenu(
                titleCallBack: 'ย้อนกลับ',
              ),
            ],
          ),
        );
      },
    );
  }
}
