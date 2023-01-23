// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class StatusFormat extends StatelessWidget {
  final String? title;
  final String? detail;
  final String? time;
  final String? image;
  final String? status;
  final String? exp;
  final String? campPoint;
  final String? seedCoin;
  final String? require;
  final String? location;
  final String? persons;
  final String? period;
  final int? e_id;
  final String? statusComplete;

  const StatusFormat({
    Key? key,
    this.title,
    this.detail,
    this.time,
    this.image,
    this.status,
    this.exp,
    this.campPoint,
    this.seedCoin,
    this.require,
    this.location,
    this.persons,
    this.period,
    this.statusComplete,
    this.e_id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/detailCamp', arguments: {
              'e_id': e_id,
              'title': title,
              'detail': detail,
              'statusComplete': statusComplete,
              'exp': exp,
              'persons': persons,
              'location': location,
              'period': period,
              'require': require,
              'campPoint': campPoint,
              'seedCoin': seedCoin,
              'image': image,
              // ignore: equal_keys_in_map
              'status': status,
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 15,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: greyColor,
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FontFormat(
                            text: title,
                            size: 14.sp,
                            line: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5.w),
                          FontFormat(
                            text: detail,
                            line: 1,
                            overflow: TextOverflow.ellipsis,
                            textColor: greyColor,
                          ),
                          SizedBox(height: 5.w),
                          FontFormat(
                            text: time,
                            overflow: TextOverflow.ellipsis,
                            textColor: greyColor,
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                    // Icon(Iconsax.more_circle)
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
