// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class ContactFormat extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final Function()? function;

  const ContactFormat({
    Key? key,
    this.icon,
    this.title,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Padding(
          padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
          child: InkWell(
            onTap: function,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: lightGreyColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Icon(icon),
                  ),
                ),
                SizedBox(width: 15.w),
                Flexible(
                  flex: 3,
                  child: FontFormat(
                    text: title,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
