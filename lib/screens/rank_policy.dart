// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class RankPolicy extends StatefulWidget {
  RankPolicy({Key? key}) : super(key: key);

  @override
  State<RankPolicy> createState() => _RankPolicyState();
}

class _RankPolicyState extends State<RankPolicy> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: bgGreyColor,
          appBar: AppBar(
            backgroundColor: whiteColor,
            shadowColor: bgGreyColor.withOpacity(0.5),
            automaticallyImplyLeading: false,
            title: FontFormat(
              text: 'นโยบายเกี่ยวกับการเลื่อนอันดับ',
              weight: FontWeight.w600,
              textColor: greyColor,
              size: 20.sp,
            ),
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 75.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.w),
                      FontFormat(
                        text: 'กฎการจัดอันดับ',
                        weight: FontWeight.w600,
                        size: 14.w,
                      ),
                      FontFormat(
                        text: '1. ช่วงเวลาการจัดอันดับ : อันดับของแต่ละรอบจะคงอยู่เป็นเวลา 1 ปี',
                      ),
                      FontFormat(
                        text:
                            '2. กฎการจัดอันดับ : กลุ่มอันดับมีทั้งหมด 4 กลุ่ม ได้แก่ Rookie, Bronze, Silver, Gold ในนี้จะมีการ จัดระดับย่อย เช่น Rookie I-V',
                      ),
                      FontFormat(
                        text: '3. กฎการได้รับคะแนน : เมื่อเข้าร่วมกิจกรรมและสามารถทําตามกฎของกิจกรรมได้ครบถ้วนจะได้รับคะแนนที่กิจกรรมกําหนดไหว',
                      ),
                      FontFormat(
                        text: '4. สําหรับการเพิ่มอันดับและลดอันดับ :',
                      ),
                      FontFormat(
                        text: 'เมื่อคะแนนถึงเกณฑ์ที่กําหนดจะทําให้อันดับเพิ่มขึ้นตามลําดับแต่หากมีการทําผิดกฎกิจกรรมจะทําให้คะแนนลดลงตามลําดับ ',
                      ),
                      FontFormat(
                        text: '4.1 เกณฑ์การขึ้นลําดับ',
                      ),
                      FontFormat(
                        text: '    Rookie I : 0 - 99 points',
                      ),
                      FontFormat(
                        text: '    Rookie II : 100 - 199 points',
                      ),
                      FontFormat(
                        text: '    Rookie III : 200 - 299 points',
                      ),
                      FontFormat(
                        text: '    Rookie IV : 300 - 399 points',
                      ),
                      FontFormat(
                        text: '    Rookie V : 400 - 499 points',
                      ),
                      FontFormat(
                        text: '    Bronze I : 500 - 649 points',
                      ),
                      FontFormat(
                        text: '    Bronze II : 650 - 799 points',
                      ),
                      FontFormat(
                        text: '    Bronze III : 800 - 949 points',
                      ),
                      FontFormat(
                        text: '    Bronze IV : 950 - 1099 points',
                      ),
                      FontFormat(
                        text: '    Bronze V : 1100 - 1299 points',
                      ),
                      FontFormat(
                        text: '    Silver I  : 1300 - 1499 points',
                      ),
                      FontFormat(
                        text: '    Silver II : 1500 - 1699 points',
                      ),
                      FontFormat(
                        text: '    Silver III : 1700 - 1899 points',
                      ),
                      FontFormat(
                        text: '    Silver IV : 1900 - 2099 points',
                      ),
                      FontFormat(
                        text: '    Silver V : 2100 - 2299 points',
                      ),
                      FontFormat(
                        text: '    Gold : 2300 points',
                      ),
                      FontFormat(
                        text: '5. เกณฑ์การแลกรับเข็มกลัด SEED Rank',
                      ),
                      FontFormat(
                        text: '    เข็มกลัด SEED Rookie : Rookie III',
                      ),
                      FontFormat(
                        text: '    เข็มกลัด SEED Bronze : Bronze I',
                      ),
                      FontFormat(
                        text: '    เข็มกลัด SEED Silver : Silver I',
                      ),
                      FontFormat(
                        text: '    เข็มกลัด SEED Gold : Gold',
                      ),
                      FontFormat(
                        text:
                            '6. ในกรณีสมัครชิกกระทําผิดกฎหรือกระทําผิดวินัยหรือขัดต่อหลักสามัญสํานึกซึ่งทางผู้จัดการพิจารณาแล้วว่าสามารถมีความเป็นได้ที่จะส่งผลต่อ ชื่อเสียง หรือ ความมั่นคงของระบบ ผู้จัดการสามารถยึดคืนเข็มกลัด SEED Rank หรือลดคะแนน หรือยกเลิกสมาชิก ได้ทันทีโดยไม่รับคําร้องหรือคําคัดค้านใดๆทั้งสิ้น',
                      ),
                      FontFormat(
                        text: '    6.1  กรณีทางผู้จัดการเรียกคืนเข็ม : สมาชิกจะต้องส่งมอบเข็มคืนภายใน 7 วัน หลังจากได้รับคําตัดสินจากผู้จัดการ',
                      ),
                    ],
                  ),
                ),
              ),
              BottomMenu(
                titleCallBack: 'ย้อนกลับ',
              )
            ],
          ),
        );
      },
    );
  }
}
