// ignore_for_file: prefer_const_constructors

import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class VerticalCouponCardFromat extends StatelessWidget {
  final String? image;
  final String? name;
  final String? lastName;
  final String? region;
  final String? phoneNumber;
  final String? email;
  final String? seedId;
  final String? education;
  final String? qrImage;

  const VerticalCouponCardFromat({
    Key? key,
    this.image,
    this.name,
    this.lastName,
    this.region,
    this.phoneNumber,
    this.email,
    this.seedId,
    this.education,
    this.qrImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return CouponCard(
          clockwise: true,
          height: 300.w,
          curvePosition: 150.h,
          curveRadius: 30,
          borderRadius: 10,
          firstChild: Container(
            decoration: BoxDecoration(
              color: blueColor,
            ),
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(270 / 360),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.w,
                    height: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage(qrImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  FontFormat(
                    text: seedId,
                    textColor: whiteColor,
                    size: 16.w,
                  ),
                  FontFormat(
                    text: education,
                    textColor: whiteColor,
                    size: 16.w,
                  ),
                ],
              ),
            ),
          ),
          secondChild: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border(
                top: BorderSide(color: whiteColor),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(270 / 360),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 90.w,
                          height: 90.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage(image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.w),
                        FontFormat(
                          text: name,
                          line: 1,
                          overflow: TextOverflow.ellipsis,
                          size: 24.w,
                          weight: FontWeight.w600,
                        ),
                        FontFormat(
                          text: lastName,
                          line: 1,
                          overflow: TextOverflow.ellipsis,
                          size: 24.w,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
                      child: Divider(color: greyColor, height: 1),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FontFormat(
                          text: 'ภาค : $region',
                          size: 16.w,
                        ),
                        FontFormat(
                          text: 'เบอร์โทร : $phoneNumber',
                          size: 16.w,
                        ),
                        FontFormat(
                          text: 'เมล : $email',
                          size: 16.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
