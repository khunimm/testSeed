// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class NewsFormat extends StatelessWidget {
  final String? title;
  final String? time;
  final String? detail;
  final String? image;
  final String? period;

  const NewsFormat({
    Key? key,
    this.title,
    this.time,
    this.detail,
    this.image,
    this.period,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/detailNews', arguments: {
              'title': title,
              'detail': detail,
              'image': image,
              // 'period': period,
            });
          },
          child: Padding(
            padding: EdgeInsets.only(
              top: 5.w,
              bottom: 5.w,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
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
                padding: EdgeInsets.all(15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontFormat(
                      text: '$title+ • ',
                      size: 14.w,
                      weight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FontFormat(
                      text: time,
                      textColor: greyColor,
                    ),
                    SizedBox(height: 10.w),
                    Row(
                      children: [
                        Container(
                          width: 65.w,
                          height: 65.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage(image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          flex: 3,
                          child: FontFormat(
                            text: detail,
                            textColor: greyColor,
                            line: 3,
                            height: 1.55.w,
                            overflow: TextOverflow.ellipsis,
                          ),
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
