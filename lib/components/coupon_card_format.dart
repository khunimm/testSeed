// ignore_for_file: prefer_const_constructors

import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class CouponCardFormat extends StatelessWidget {
  final double? widthCard;
  final double? heightCard;
  final String? image;
  final double? imageSize;
  final String? name;
  final double? nameSize;
  final String? lastName;
  final double? lastNameSize;
  final String? region;
  final double? regionSize;
  final Color? textColor;
  final Color? color;
  final String? phoneNumber;
  final double? phoneNumberSize;
  final String? email;
  final double? emailSize;
  final String? seedId;
  final double? seedIdSize;
  final String? education;
  final double? educationSize;
  final Color? colorCard;
  final String? qrImage;
  final double? qrImageSize;
  final double? curvePosition;
  final double? curveRadius;
  final double? borderRadius;
  final double? padding;
  final double? paddingSecond;

  const CouponCardFormat({
    Key? key,
    this.name,
    this.lastName,
    this.region,
    this.phoneNumber,
    this.email,
    this.seedId,
    this.education,
    this.colorCard,
    this.image,
    this.qrImage,
    this.textColor,
    this.color,
    this.nameSize,
    this.imageSize,
    this.lastNameSize,
    this.regionSize,
    this.phoneNumberSize,
    this.emailSize,
    this.seedIdSize,
    this.educationSize,
    this.qrImageSize,
    this.widthCard,
    this.heightCard,
    this.curvePosition,
    this.curveRadius,
    this.borderRadius,
    this.padding,
    this.paddingSecond,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return CouponCard(
          width: widthCard!,
          height: heightCard!,
          backgroundColor: color,
          clockwise: true,
          curvePosition: curvePosition!,
          curveRadius: curveRadius!,
          curveAxis: Axis.vertical,
          borderRadius: borderRadius!,
          firstChild: Container(
            decoration: BoxDecoration(
              color: colorCard,
            ),
            child: Padding(
              padding: EdgeInsets.all(padding!),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (color == greyColor) ...[
                        Container(
                          width: imageSize,
                          height: imageSize,
                          foregroundDecoration: BoxDecoration(
                            color: greyColor,
                            backgroundBlendMode: BlendMode.saturation,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage(image!),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ] else ...[
                        Container(
                          width: imageSize,
                          height: imageSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage(image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                      SizedBox(height: 5.w),
                      FontFormat(
                        text: name,
                        line: 1,
                        textColor: textColor,
                        overflow: TextOverflow.ellipsis,
                        size: nameSize,
                        weight: FontWeight.w600,
                      ),
                      FontFormat(
                        text: lastName,
                        textColor: textColor,
                        line: 1,
                        size: lastNameSize,
                        overflow: TextOverflow.ellipsis,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Divider(color: greyColor, height: 1),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FontFormat(
                        text: 'ภาค : $region',
                        size: regionSize,
                        textColor: textColor,
                      ),
                      FontFormat(
                        text: 'เบอร์โทรศัพท์  : $phoneNumber',
                        textColor: textColor,
                        size: phoneNumberSize,
                      ),
                      FontFormat(
                        text: 'อีเมล : $email',
                        textColor: textColor,
                        size: educationSize,
                        line: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          secondChild: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (color == greyColor) ...[
                  Container(
                    width: qrImageSize,
                    height: qrImageSize,
                    foregroundDecoration: BoxDecoration(
                      backgroundBlendMode: BlendMode.saturation,
                      color: greyColor,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage(qrImage!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ] else ...[
                  Container(
                    width: qrImageSize,
                    height: qrImageSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage(qrImage!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
                SizedBox(height: 5.w),
                FontFormat(
                  text: seedId,
                  textColor: whiteColor,
                  size: seedIdSize,
                ),
                FontFormat(
                  text: education,
                  textColor: whiteColor,
                  size: educationSize,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
