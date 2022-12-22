// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class CheckValue extends StatefulWidget {
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? address;
  final String? subDistrict;
  final String? district;
  final String? province;
  final String? postCode;

  CheckValue({
    Key? key,
    this.name,
    this.phoneNumber,
    this.email,
    this.address,
    this.subDistrict,
    this.district,
    this.province,
    this.postCode,
  }) : super(key: key);

  @override
  State<CheckValue> createState() => _CheckValueState();
}

class _CheckValueState extends State<CheckValue> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgGreyColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        shadowColor: bgGreyColor.withOpacity(0.5),
        automaticallyImplyLeading: false,
        title: FontFormat(
          text: 'รับของรางวัล',
          weight: FontWeight.w600,
          textColor: greyColor,
          size: 20.sp,
        ),
      ),
      body: ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 70.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.w),
                          Center(
                            child: FontFormat(
                              text: 'ยินดีด้วย! คุณได้รับของรางวัล',
                              textColor: blueColor,
                              size: 20.w,
                              weight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 16.w,
                              bottom: 16.w,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: shadow,
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                color: whiteColor,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 70.w,
                                      height: 70.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                          image: AssetImage('images/seed1.jpeg'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          FontFormat(
                                            text: 'เข็มกลัดประจำตำแหน่ง BRONZE III',
                                            weight: FontWeight.w600,
                                            size: 16.w,
                                          ),
                                          FontFormat(
                                            text: 'วันที่แลกของ 1 ธันวาคม 2565',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          FontFormat(
                            text: 'ข้อมูลผู้รับ',
                            size: 16.w,
                            weight: FontWeight.w600,
                          ),
                          SizedBox(height: 10.w),
                          FontFormat(
                            text: "ชื่อ: ${args['name']}",
                          ),
                          FontFormat(
                            text: "เบอร์โทรศัพท์: ${args['phoneNumber']}",
                          ),
                          FontFormat(
                            text: "อีเมล: ${args['email']}",
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                            child: Divider(
                              color: greyColor,
                              height: 2,
                            ),
                          ),
                          FontFormat(
                            text: 'ที่อยู่จัดส่ง',
                            size: 16.w,
                            weight: FontWeight.w600,
                          ),
                          SizedBox(height: 10.w),
                          FontFormat(
                            text: "ที่อยู่: ${args['address']}",
                          ),
                          FontFormat(
                            text: "แขวง/ตำบล: ${args['subDistrict']}",
                          ),
                          FontFormat(
                            text: "เขต/อำเภอ: ${args['district']}",
                          ),
                          FontFormat(
                            text: "จังหวัด: ${args['province']}",
                          ),
                          FontFormat(
                            text: "รหัสไปรษณีย์: ${args['postCode']}",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              BottomMenu(
                title: 'ยืนยันการแลกของรางวัล',
                icon: Iconsax.like,
                function: () => _showMyDialog(),
              )
            ],
          );
        },
      ),
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
                text: 'คุณยืนยันการแลกรับของรางวัลหรือไม่?',
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
                      Navigator.pushNamed(context, '/completeRedeemGift');
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
