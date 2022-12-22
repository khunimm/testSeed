// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class CampFormat extends StatelessWidget {
  final String? title;
  final String? time;
  final String? statusComplete;
  final String? image;
  final String? persons;
  final String? period;
  final String? location;
  final String? detail;
  final String? exp;
  final String? campPoint;
  final String? seedCoin;
  final String? require;
  final String? status;

  const CampFormat({
    Key? key,
    this.title,
    this.time,
    this.image,
    this.persons,
    this.period,
    this.location,
    this.detail,
    this.exp,
    this.require,
    this.campPoint,
    this.seedCoin,
    this.statusComplete,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/detailCamp', arguments: {
              'title': title,
              'detail': detail,
              'statusComplete': statusComplete,
              'exp': exp,
              'status': status,
              'persons': persons,
              'location': location,
              'period': period,
              'require': require,
              'campPoint': campPoint,
              'seedCoin': seedCoin,
              'image': image,
            });
          },
          child: Padding(
            padding: EdgeInsets.only(
              top: 5.w,
              bottom: 5.w,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontFormat(
                      text: '$title+ • ',
                      size: 14.w,
                      weight: FontWeight.w500,
                      line: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (statusComplete == null) ...[
                      FontFormat(
                        text: 'รับสมัครถึงวันที่ ${exp}',
                        textColor: declineRedColor,
                      ),
                    ] else ...[
                      FontFormat(
                        text: statusComplete,
                        textColor: greyColor,
                      ),
                    ],
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FontFormat(
                              text: 'จำนวนคนที่รับสมัคร',
                              textColor: greyColor,
                              size: 12.w,
                            ),
                            SizedBox(height: 5.w),
                            FontFormat(
                              text: 'ช่วงเวลากิจกรรม',
                              textColor: greyColor,
                              size: 12.w,
                            ),
                            SizedBox(height: 5.w),
                            FontFormat(
                              text: 'สถานที่จัดกิจกรรม',
                              textColor: greyColor,
                              size: 12.w,
                            ),
                          ],
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FontFormat(
                                text: persons,
                                size: 12.w,
                                textColor: blackColor,
                              ),
                              SizedBox(height: 5.w),
                              FontFormat(
                                text: period,
                                size: 12.w,
                                textColor: blackColor,
                              ),
                              SizedBox(height: 5.w),
                              FontFormat(
                                text: location,
                                size: 12.w,
                                line: 1,
                                overflow: TextOverflow.ellipsis,
                                textColor: blackColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (statusComplete == null) ...[
                      SizedBox(height: 10.w),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: blueColor,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                          child: Center(
                            child: FontFormat(
                              text: 'สมัครกิจกรรม',
                              size: 12.w,
                              textColor: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
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
