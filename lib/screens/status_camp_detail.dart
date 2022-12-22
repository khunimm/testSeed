// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class DetailCamp extends StatefulWidget {
  DetailCamp({Key? key, String? title}) : super(key: key);

  @override
  State<DetailCamp> createState() => _DetailCampState();
}

class _DetailCampState extends State<DetailCamp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(14.w, 55.w, 14.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: AssetImage('images/317938800_224922559874875_2050126747339262904_n.jpeg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.w),
                      Center(
                        child: FontFormat(
                          text: 'กสทช. X SEED THAILAND',
                          weight: FontWeight.w600,
                          textColor: blackColor,
                          size: 18.w,
                        ),
                      ),
                      Center(
                        child: FontFormat(
                          text: 'หมดเขต 6 มกราคม 2566',
                          textColor: declineRedColor,
                          size: 14.w,
                        ),
                      ),
                      SizedBox(height: 20.w),
                      Row(
                        children: [
                          Icon(
                            Iconsax.star,
                          ),
                          SizedBox(width: 10.w),
                          FontFormat(
                            text: 'คะแนนอันดับ : 10,000',
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
                            text: 'เหรียญรางวัล : 10,000',
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
                        text: 'โรงเรียนสุรศักดิ์มนตรี',
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
                            text: 'วันที่จัดค่าย',
                            weight: FontWeight.w600,
                            size: 12.w,
                            textColor: blueColor,
                          ),
                        ],
                      ),
                      FontFormat(
                        text: '28 มกราคม 2566 - 29 มกราคม 2566 ',
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
                        text: 'ผู้ผ่านค่าสตาฟ SEED ',
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
                        text: '300 คน',
                        size: 12.w,
                        textColor: blackColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                        child: Divider(
                          color: greyColor,
                          height: 2,
                        ),
                      ),
                      FontFormat(
                        text: 'รายละเอียด',
                        weight: FontWeight.w600,
                        size: 12.w,
                        textColor: blueColor,
                      ),
                      FontFormat(
                        height: 1.65.w,
                        text:
                            '“แตกหน่อพันธุ์ D ไม่มีที่สิ้นสุด น้องแพร ณิชา สมาชิก SEED จ.ลำพูน จากค่ายอุดมศึกษาภาคเหนือ รุ่นที่ 1 หลังจากได้เข้าศึกษาต่อที่คณะเทคโนโลยีทางทะเล มหาวิทยาลัยบูรพา น้องณิชายังคงเดินหน้าทำกิจกรรมเพื่อประเทศโดยเฉพาะด้านเทคโนโลยี และสิ่งแวดล้อม”ล่าสุดวันที่ 1 ธันวาคม 2565 ที่ผ่านมา น้องณิชาได้เข้าร่วมการประชุม กสทช.พบเครือข่ายผู้บริโภคกิจการกระจายเสียงและโทรทัศน์ ภาคตะวันออก ณ โรงแรมเดอะ เบย์วิว พัทยา จ.ชลบุรี เพื่อข้อเสนอแนะ วิธีการแก้ไขปัญหา  แนวทางการพัฒนาสื่อไทย ให้ก้าวไกลและตอบโจทย์กับคนทุกวัย 📱🤍',
                      ),
                      SizedBox(height: 80.w),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60.w,
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
                    padding: EdgeInsets.only(right: 20.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Iconsax.logout_14,
                            size: 18.w,
                          ),
                          SizedBox(width: 10.w),
                          FontFormat(
                            text: 'กลับสู่หน้าหลัก',
                            size: 14.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
