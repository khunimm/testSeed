// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class BottomMenu extends StatelessWidget {
  final String? title;
  final String? titleCallBack;

  final IconData? icon;
  final Function()? function;
  final Function()? callBack;

  BottomMenu({
    Key? key,
    this.title,
    this.icon,
    this.function,
    this.callBack,
    this.titleCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Align(
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
              child: title != null && titleCallBack == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: FontFormat(
                            text: 'ย้อนกลับ',
                            size: 14.w,
                            textColor: greyColor,
                          ),
                        ),
                        InkWell(
                          onTap: function,
                          child: Container(
                            decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Row(
                                children: [
                                  Icon(
                                    icon,
                                    color: whiteColor,
                                    size: 18.w,
                                  ),
                                  SizedBox(width: 5.w),
                                  FontFormat(
                                    text: title,
                                    size: 14.w,
                                    textColor: whiteColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : InkWell(
                      onTap: callBack != null
                          ? callBack
                          : () {
                              Navigator.pop(context);
                            },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RotationTransition(
                            turns: AlwaysStoppedAnimation(180 / 360),
                            child: Icon(
                              Iconsax.logout_14,
                              size: 18.w,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          FontFormat(
                            text: titleCallBack,
                            size: 14.w,
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
