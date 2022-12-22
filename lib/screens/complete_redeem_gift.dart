// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/bottom_navbar.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class CompleteRedeemGift extends StatefulWidget {
  CompleteRedeemGift({Key? key}) : super(key: key);

  @override
  State<CompleteRedeemGift> createState() => _CompleteRedeemGiftState();
}

class _CompleteRedeemGiftState extends State<CompleteRedeemGift> {
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
              text: 'ยินดีด้วย',
              weight: FontWeight.w600,
              textColor: greyColor,
              size: 20.sp,
            ),
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FontFormat(
                        text: 'แลกของสำเร็จ!',
                        textColor: blueColor,
                        size: 20.w,
                        weight: FontWeight.w600,
                      ),
                      FontFormat(
                        text: 'อดใจรออีกนิด ทีมงานจะจัดส่งของให้คุณเร็วที่สุด\nหากมีข้อสงสัย โปรดติดต่อแอดมินผ่านเพจ SEED THAILAND',
                        align: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70.w,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.black.withOpacity(.1),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      bottom: 10.w,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavbar(
                              numPage: 3,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.profile_2user,
                            size: 18.w,
                          ),
                          SizedBox(width: 10.w),
                          FontFormat(
                            text: 'กลับสู่หน้าโปรไฟล์',
                            size: 14.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
