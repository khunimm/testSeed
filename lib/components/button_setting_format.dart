// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class ButtonSettingFormat extends StatelessWidget {
  final IconData? icon;
  final String? header;
  final Function()? function;

  const ButtonSettingFormat({
    Key? key,
    this.icon,
    this.header,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return InkWell(
          onTap: function!,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: lightGreyColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      icon,
                      size: 22.w,
                    ),
                  ),
                ),
                SizedBox(width: 15.w),
                FontFormat(
                  text: header,
                  size: 14.w,
                ),
                Spacer(),
                Icon(Iconsax.arrow_right_3)
              ],
            ),
          ),
        );
      },
    );
  }
}
