// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class RedeemCoin extends StatefulWidget {
  RedeemCoin({Key? key}) : super(key: key);

  @override
  State<RedeemCoin> createState() => _RedeemCoinState();
}

class _RedeemCoinState extends State<RedeemCoin> {
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
              text: 'แลกของรางวัล',
              weight: FontWeight.w600,
              textColor: greyColor,
              size: 20.sp,
            ),
          ),
          body: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FontFormat(
                      text: 'โปรดติดตามเร็ว ๆ นี้!',
                      size: 20.w,
                      weight: FontWeight.w600,
                    ),
                    FontFormat(
                      text: 'อย่าลืมสะสมคะแนนเพื่อแลกรับรางวัลนะค่ะ',
                      align: TextAlign.center,
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
