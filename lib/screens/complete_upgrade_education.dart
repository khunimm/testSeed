// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/bottom_navbar.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/coupon_card_format.dart';
import 'package:seed/components/font_format.dart';

class CompleteUpgradeEducation extends StatefulWidget {
  CompleteUpgradeEducation({Key? key}) : super(key: key);

  @override
  State<CompleteUpgradeEducation> createState() => _CompleteUpgradeEducationState();
}

class _CompleteUpgradeEducationState extends State<CompleteUpgradeEducation> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: bgGreyColor,
          appBar: AppBar(
            backgroundColor: whiteColor,
            shadowColor: bgGreyColor.withOpacity(0.5),
            automaticallyImplyLeading: false,
            title: FontFormat(
              text: 'ร้องขอการเลื่อนขั้นระดับการศึกษา',
              weight: FontWeight.w600,
              textColor: greyColor,
              size: 20.sp,
            ),
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 16.w, bottom: 15.w),
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.info_circle,
                              color: greyColor,
                            ),
                            SizedBox(width: 5.w),
                            Flexible(
                              child: FontFormat(
                                text: 'กรุณารอการดำเนินการเลื่อนขั้นระดับการศึกษาประมาณ 1 สัปดาห์โดยประมาณ',
                                weight: FontWeight.w600,
                                textColor: greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CouponCardFormat(
                        padding: 10.w,
                        paddingSecond: 20.w,
                        widthCard: MediaQuery.of(context).size.width,
                        heightCard: 235.w,
                        curvePosition: 200.w,
                        curveRadius: 30.w,
                        borderRadius: 10.w,
                        image: 'images/1a8435b262f70dc441a52bf15a9c620d.jpeg',
                        qrImage: 'images/qr-code.png',
                        qrImageSize: 80.w,
                        imageSize: 80.w,
                        name: 'พัธทนันท์',
                        nameSize: 16.w,
                        lastName: 'หวังสมบูรณ์ศิริ',
                        lastNameSize: 16.w,
                        region: 'ตะวันออกเฉียงเหนือ',
                        regionSize: 12.w,
                        phoneNumber: '0812345678',
                        phoneNumberSize: 12.w,
                        email: 'abc@hotmail.com',
                        educationSize: 12.w,
                        colorCard: whiteColor,
                        color: greyColor,
                        textColor: greyColor,
                        education: 'มัธยมศึกษา',
                        seedId: '12-3-4-56789',
                        seedIdSize: 12.w,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Icon(Iconsax.arrow_down),
                      ),
                      CouponCardFormat(
                        padding: 10.w,
                        paddingSecond: 20.w,
                        widthCard: MediaQuery.of(context).size.width,
                        heightCard: 235.w,
                        curvePosition: 200.w,
                        curveRadius: 30.w,
                        borderRadius: 10.w,
                        image: 'images/1a8435b262f70dc441a52bf15a9c620d.jpeg',
                        qrImage: 'images/qr-code.png',
                        qrImageSize: 80.w,
                        imageSize: 80.w,
                        name: 'พัธทนันท์',
                        nameSize: 16.w,
                        lastName: 'หวังสมบูรณ์ศิริ',
                        lastNameSize: 16.w,
                        region: 'ตะวันออกเฉียงเหนือ',
                        regionSize: 12.w,
                        phoneNumber: '0812345678',
                        phoneNumberSize: 12.w,
                        email: 'abc@hotmail.com',
                        educationSize: 12.w,
                        colorCard: whiteColor,
                        color: blueColor,
                        textColor: blackColor,
                        education: 'อุดมศึกษา',
                        seedId: '12-3-4-56789',
                        seedIdSize: 12.w,
                      ),
                      SizedBox(height: 75.w),
                    ],
                  ),
                ),
              ),
              BottomMenu(
                titleCallBack: 'ย้อนกลับ',
                callBack: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavbar(
                        numPage: 3,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
