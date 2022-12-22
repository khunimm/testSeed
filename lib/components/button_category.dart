// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class ButtonCategory extends StatelessWidget {
  final Color? bgColor;
  final String? image;
  final Color? imagesColor;
  final String? title;
  final Color? titleColor;

  const ButtonCategory({
    Key? key,
    this.bgColor,
    this.image,
    this.imagesColor,
    this.title,
    this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: shadow,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 12.w, bottom: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image!,
                  width: 20.w,
                  height: 20.w,
                  color: imagesColor,
                ),
                SizedBox(width: 10.w),
                FontFormat(
                  text: title,
                  textColor: titleColor,
                  size: 14.w,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
