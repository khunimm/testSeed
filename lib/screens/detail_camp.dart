// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/bottom_navbar.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';
import 'package:seed/screens/camp_status.dart';

class DetailCamp extends StatefulWidget {
  DetailCamp({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailCamp> createState() => _DetailCampState();
}

class _DetailCampState extends State<DetailCamp> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 14.w, 16.w, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage(args['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: args['status'] == 'รอการอนุมัติ'
                                      ? greyColor
                                      : args['status'] == 'ได้รับการอนุมัติ'
                                          ? approveGreenColor
                                          : args['status'] == 'ไม่ได้รับการอนุมัติ'
                                              ? declineRedColor
                                              : args['statusComplete'] != null
                                                  ? blueColor
                                                  : null,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10.w, 4.w, 10.w, 4.w),
                                  child: args['status'] != null
                                      ? FontFormat(
                                          text: args['status'],
                                          textColor: whiteColor,
                                        )
                                      : args['statusComplete'] == 'เข้าค่ายสำเร็จ'
                                          ? FontFormat(
                                              text: 'เสร็จสิ้น',
                                              textColor: whiteColor,
                                            )
                                          : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.w),
                        Center(
                          child: FontFormat(
                            text: args['title'],
                            weight: FontWeight.w600,
                            textColor: blackColor,
                            size: 18.w,
                            align: TextAlign.center,
                          ),
                        ),
                        if (args['statusComplete'] != null) ...[
                          Center(
                            child: FontFormat(
                              text: args["statusComplete"],
                              textColor: approveGreenColor,
                              size: 14.w,
                            ),
                          ),
                        ] else ...[
                          Center(
                            child: FontFormat(
                              text: 'หมดเขต ${args["exp"]}',
                              textColor: declineRedColor,
                              size: 14.w,
                            ),
                          ),
                        ],
                        SizedBox(height: 20.w),
                        Row(
                          children: [
                            Icon(
                              Iconsax.star,
                            ),
                            SizedBox(width: 10.w),
                            FontFormat(
                              text: 'คะแนนอันดับ : ${args["campPoint"]}',
                              weight: FontWeight.w600,
                              size: 16.w,
                            ),
                          ],
                        ),
                        SizedBox(height: 5.w),
                        Row(
                          children: [
                            Icon(
                              Iconsax.copyright,
                            ),
                            SizedBox(width: 10.w),
                            FontFormat(
                              text: 'เหรียญรางวัล : ${args["seedCoin"]}',
                              weight: FontWeight.w600,
                              size: 16.w,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                          child: Divider(color: greyColor, height: 2),
                        ),
                        Row(
                          children: [
                            Icon(
                              Iconsax.location,
                              color: blueColor,
                            ),
                            SizedBox(width: 10.w),
                            FontFormat(
                              text: 'สถานที่',
                              weight: FontWeight.w600,
                              size: 12.w,
                              textColor: blueColor,
                            ),
                          ],
                        ),
                        FontFormat(
                          text: args['location'],
                          size: 12.w,
                          textColor: blackColor,
                        ),
                        SizedBox(height: 15.w),
                        Row(
                          children: [
                            Icon(
                              Iconsax.calendar_2,
                              color: blueColor,
                            ),
                            SizedBox(width: 10.w),
                            FontFormat(
                              text: 'วันที่จัดกิจกรรม',
                              weight: FontWeight.w600,
                              size: 12.w,
                              textColor: blueColor,
                            ),
                          ],
                        ),
                        FontFormat(
                          text: args['period'],
                          size: 12.w,
                          textColor: blackColor,
                        ),
                        SizedBox(height: 15.w),
                        Row(
                          children: [
                            Icon(
                              Iconsax.card_tick,
                              color: blueColor,
                            ),
                            SizedBox(width: 10.w),
                            FontFormat(
                              text: 'คุณสมบัติ',
                              weight: FontWeight.w600,
                              size: 12.w,
                              textColor: blueColor,
                            ),
                          ],
                        ),
                        FontFormat(
                          text: args['require'],
                          size: 12.w,
                          textColor: blackColor,
                        ),
                        SizedBox(height: 15.w),
                        Row(
                          children: [
                            Icon(
                              Iconsax.profile_2user,
                              color: blueColor,
                            ),
                            SizedBox(width: 10.w),
                            FontFormat(
                              text: 'จำนวนที่รับ',
                              weight: FontWeight.w600,
                              size: 12.w,
                              textColor: blueColor,
                            ),
                          ],
                        ),
                        FontFormat(
                          text: args['persons'],
                          size: 12.w,
                          textColor: blackColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                          child: Divider(color: greyColor, height: 2),
                        ),
                        FontFormat(
                          text: 'รายละเอียด',
                          weight: FontWeight.w600,
                          size: 12.w,
                          textColor: blueColor,
                        ),
                        FontFormat(
                          height: 1.65.w,
                          text: args['detail'],
                        ),
                        SizedBox(height: 80.w),
                      ],
                    ),
                  ),
                ),
                args['status'] == 'ได้รับการอนุมัติ' || args['status'] == 'รอการอนุมัติ'
                    ? BottomMenu(
                        icon: Iconsax.close_circle,
                        title: 'ยกเลิกการสมัครกิจกรรม',
                        function: () => _showMyDialog(),
                      )
                    : args['campPoint'] != null && args['statusComplete'] == null && args['status'] != 'ไม่ได้รับการอนุมัติ'
                        ? BottomMenu(
                            icon: Iconsax.book_14,
                            title: 'สมัครกิจกรรม',
                            function: () {
                              bookCamp();
                            })
                        : BottomMenu(titleCallBack: 'ย้อนกลับ'),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
              padding: EdgeInsets.only(bottom: 15.w),
              child: FontFormat(
                text: 'คุณต้องการยกเลิกการสมัครกิจกรรมนี้หรือไม่?',
                size: 14.w,
              )),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffECECEC),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
                        child: Center(
                          child: FontFormat(
                            text: 'ไม่',
                            size: 14.w,
                            textColor: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavbar(
                            numPage: 1,
                          ),
                        ),
                      );
                      status = 'declined';
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
                        child: Center(
                          child: FontFormat(
                            text: 'ใช่',
                            size: 14.w,
                            textColor: Color(0xfffcfcfc),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Future<void> bookCamp() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
              padding: EdgeInsets.only(bottom: 15.w),
              child: FontFormat(
                text: 'คุณต้องการสมัครกิจกรรมนี้หรือไม่?',
                size: 14.w,
              )),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffECECEC),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
                        child: Center(
                          child: FontFormat(
                            text: 'ไม่',
                            size: 14.w,
                            textColor: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavbar(
                            numPage: 1,
                          ),
                        ),
                      );
                      status = 'pending';
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
                        child: Center(
                          child: FontFormat(
                            text: 'ใช่',
                            size: 14.w,
                            textColor: Color(0xfffcfcfc),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
