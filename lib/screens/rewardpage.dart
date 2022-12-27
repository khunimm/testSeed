// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';
import 'package:seed/components/textfield_format.dart';

class Rewardpage extends StatefulWidget {
  Rewardpage({Key? key}) : super(key: key);

  @override
  State<Rewardpage> createState() => _RewardpageState();
}

bool isChecked = false;
TextEditingController _name = TextEditingController();
TextEditingController _lastName = TextEditingController();
TextEditingController _phoneNumber = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _address = TextEditingController();
TextEditingController _subDistrict = TextEditingController();
TextEditingController _district = TextEditingController();
TextEditingController _province = TextEditingController();
TextEditingController _postCode = TextEditingController();

class _RewardpageState extends State<Rewardpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        shadowColor: bgGreyColor.withOpacity(0.5),
        automaticallyImplyLeading: false,
        title: FontFormat(
          text: 'แลกของรางวัลประจำแรงค์',
          weight: FontWeight.w600,
          textColor: greyColor,
          size: 20.sp,
        ),
      ),
      body: ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 70.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 20.w),
                      // Center(
                      //   child: FontFormat(
                      //     text: 'ยินดีด้วย! กรุณากรอกชื่อที่อยู่เพื่อจัดส่ง',
                      //     textColor: blueColor,
                      //     size: 20.w,
                      //     weight: FontWeight.w600,
                      //   ),
                      // ),
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
                                        text: '*ภาพของรางวัลจะเปลี่ยนไปตามระดับของผู้ใช้',
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
                      SizedBox(height: 5.w),
                      TextfieldFormat(
                        text: 'ชื่อ',
                        borderColor: Colors.transparent,
                        focusTextFieldColor: blueColor,
                        textFieldColor: whiteColor,
                        textColor: blackColor,
                        shadow: shadow,
                        hintColor: greyColor,
                        controller: _name,
                        keyboardType: TextInputType.text,
                      ),
                      TextfieldFormat(
                        text: 'นามสกุล',
                        borderColor: Colors.transparent,
                        focusTextFieldColor: blueColor,
                        hintColor: greyColor,
                        textFieldColor: whiteColor,
                        textColor: blackColor,
                        shadow: shadow,
                        controller: _lastName,
                        keyboardType: TextInputType.text,
                      ),
                      TextfieldFormat(
                        text: 'เบอร์โทรศัพท์',
                        borderColor: Colors.transparent,
                        focusTextFieldColor: blueColor,
                        hintColor: greyColor,
                        textFieldColor: whiteColor,
                        textColor: blackColor,
                        shadow: shadow,
                        controller: _phoneNumber,
                        keyboardType: TextInputType.phone,
                      ),
                      TextfieldFormat(
                        text: 'อีเมล',
                        borderColor: Colors.transparent,
                        focusTextFieldColor: blueColor,
                        hintColor: greyColor,
                        textFieldColor: whiteColor,
                        textColor: blackColor,
                        shadow: shadow,
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10.w),
                      FontFormat(
                        text: 'ที่อยู่จัดส่ง',
                        size: 16.w,
                        weight: FontWeight.w600,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.w),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                              height: 20.w,
                              child: Transform.scale(
                                scale: 1.w,
                                child: Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  side: BorderSide(
                                    color: blueColor,
                                    width: 2,
                                  ),
                                  checkColor: whiteColor,
                                  activeColor: blueColor,
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            FontFormat(
                              text: 'ใช้ที่อยู่ตามที่สมัครไว้ในโปรไฟล์',
                              textColor: blackColor,
                              size: 14.w,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.w),
                      TextfieldFormat(
                        text: 'ที่อยู่',
                        borderColor: Colors.transparent,
                        focusTextFieldColor: blueColor,
                        hintColor: greyColor,
                        textFieldColor: whiteColor,
                        textColor: blackColor,
                        shadow: shadow,
                        controller: _address,
                        keyboardType: TextInputType.text,
                      ),
                      TextfieldFormat(
                        text: 'แขวง/ตำบล',
                        borderColor: Colors.transparent,
                        focusTextFieldColor: blueColor,
                        hintColor: greyColor,
                        textFieldColor: whiteColor,
                        textColor: blackColor,
                        shadow: shadow,
                        controller: _subDistrict,
                        keyboardType: TextInputType.text,
                      ),
                      TextfieldFormat(
                        text: 'เขต/อำเภอ',
                        borderColor: Colors.transparent,
                        focusTextFieldColor: blueColor,
                        hintColor: greyColor,
                        textFieldColor: whiteColor,
                        textColor: blackColor,
                        shadow: shadow,
                        controller: _district,
                        keyboardType: TextInputType.text,
                      ),
                      TextfieldFormat(
                        text: 'จังหวัด',
                        borderColor: Colors.transparent,
                        focusTextFieldColor: blueColor,
                        hintColor: greyColor,
                        textFieldColor: whiteColor,
                        textColor: blackColor,
                        shadow: shadow,
                        controller: _province,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextfieldFormat(
                          text: 'รหัสไปรษณีย์',
                          borderColor: Colors.transparent,
                          focusTextFieldColor: blueColor,
                          hintColor: greyColor,
                          textFieldColor: whiteColor,
                          textColor: blackColor,
                          shadow: shadow,
                          controller: _postCode,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomMenu(
                function: () {
                  Navigator.pushNamed(context, '/checkValue', arguments: {
                    'name': _name.text,
                    'phoneNumber': _phoneNumber.text,
                    'email': _email.text,
                    'address': _address.text,
                    'subDistrict': _subDistrict.text,
                    'district': _district.text,
                    'province': _province.text,
                    'postCode': _postCode.text,
                  });
                },
                icon: Iconsax.location_tick,
                title: 'ยืนยันข้อมูลที่อยู่',
              ),
            ],
          );
        },
      ),
    );
  }
}
