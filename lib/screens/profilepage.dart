// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/button_setting_format.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/coupon_card_format.dart';
import 'package:seed/components/font_format.dart';
import 'package:seed/components/vertical_coupon_card_fromat.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: bgGreyColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: whiteColor,
            shadowColor: bgGreyColor.withOpacity(0.5),
            automaticallyImplyLeading: false,
            title: FontFormat(
              text: 'โปรไฟล์',
              weight: FontWeight.w600,
              textColor: greyColor,
              size: 20.w,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16.w),
                  InkWell(
                    onTap: () {
                      _showMyDialog();
                    },
                    child: CouponCardFormat(
                      padding: 10.w,
                      paddingSecond: 20.w,
                      widthCard: MediaQuery.of(context).size.width,
                      heightCard: 235.w,
                      curvePosition: 200.w,
                      curveRadius: 30.w,
                      borderRadius: 10.w,
                      image: 'images/messageImage_1667365186104 4.png',
                      qrImage: 'images/qr-code.png',
                      qrImageSize: 80.w,
                      imageSize: 80.w,
                      name: 'มณีจันทร์',
                      nameSize: 16.w,
                      lastName: 'จันทร์มณีกุล',
                      lastNameSize: 16.w,
                      region: 'ตะวันออกเฉียงเหนือ',
                      regionSize: 12.w,
                      phoneNumber: '0812345678',
                      phoneNumberSize: 12.w,
                      email: 'abc@hotmail.com',
                      educationSize: 12.w,
                      colorCard: whiteColor,
                      color: blueColor,
                      textColor: blackColor,
                      education: 'มัธยมศึกษา',
                      seedId: '12-3-4-56789',
                      seedIdSize: 12.w,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.w),
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.info_circle,
                          color: greyColor,
                        ),
                        SizedBox(width: 5.w),
                        Flexible(
                          child: FontFormat(
                            text: 'คุณสามารถร้องขอการเลื่อนระดับการศึกษาได้',
                            weight: FontWeight.w600,
                            textColor: greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
                    child: Divider(
                      color: greyColor,
                      height: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/campHistory');
                        },
                        child: SizedBox(
                          width: 90.w,
                          height: 82.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FontFormat(
                                text: '100',
                                weight: FontWeight.bold,
                                textColor: blackColor,
                                size: 24.w,
                              ),
                              FontFormat(
                                text: 'กิจกรรม',
                                textColor: greyColor,
                                size: 14.w,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/rank');
                        },
                        child: Container(
                          // color: declineRedColor,
                          width: 90.w,
                          height: 82.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 65.w,
                                height: 60.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: AssetImage('images/rank_gold copy 1.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              FontFormat(
                                text: 'BRONZE IV',
                                weight: FontWeight.w500,
                                textColor: blackColor,
                                size: 14.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/redeemCoin');
                        },
                        child: Container(
                          // color: declineRedColor,
                          width: 90.w,
                          height: 82.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FontFormat(
                                text: '100',
                                weight: FontWeight.bold,
                                textColor: blackColor,
                                size: 24.w,
                              ),
                              FontFormat(
                                text: 'เหรียญรางวัล',
                                textColor: greyColor,
                                size: 14.w,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: shadow,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            ButtonSettingFormat(
                              function: () {
                                Navigator.pushNamed(context, '/upgradeEducation');
                              },
                              icon: Iconsax.document_forward,
                              header: 'ร้องขอการเลื่อนขั้นระดับการศึกษา',
                            ),
                            ButtonSettingFormat(
                              function: () {
                                Navigator.pushNamed(context, '/editProfile');
                              },
                              icon: Iconsax.brush_4,
                              header: 'แก้ไขข้อมูลส่วนบุคคล',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              child: Divider(
                                color: greyColor,
                                height: 2,
                              ),
                            ),
                            ButtonSettingFormat(
                              function: () {
                                Navigator.pushNamed(context, '/rankPolicy');
                              },
                              icon: Iconsax.award,
                              header: 'นโยบายเกี่ยวกับการเลื่อนอันดับ',
                            ),
                            ButtonSettingFormat(
                              function: () {
                                Navigator.pushNamed(context, '/privacyPolicy');
                              },
                              icon: Iconsax.shield_tick,
                              header: 'นโยบายความเป็นส่วนตัว',
                            ),
                            ButtonSettingFormat(
                              icon: Iconsax.info_circle,
                              function: () {
                                Navigator.pushNamed(context, '/applicationDetail');
                              },
                              header: 'ข้อมูลเกี่ยวกับแอปพลิเคชัน',
                            ),
                            ButtonSettingFormat(
                              icon: Iconsax.call,
                              function: () {
                                Navigator.pushNamed(context, '/contactUs');
                              },
                              header: 'ติดต่อเรา',
                            ),
                            ButtonSettingFormat(
                              icon: Iconsax.logout,
                              function: () {
                                confirmLogout();
                              },
                              header: 'ออกจากระบบ',
                            ),
                          ],
                        ),
                      ))
                ],
              ),
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
        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 40.w, 20.w, 40.w),
          child: VerticalCouponCardFromat(
            image: 'images/messageImage_1667365186104 4.png',
            qrImage: 'images/qr-code.png',
            name: 'มณีจันทร์',
            lastName: 'จันทร์มณีกุล',
            region: 'ตะวันออกเฉียงเหนือ',
            phoneNumber: '0812345678',
            email: 'abc@gmail.com',
            education: 'มัธยมศึกษา',
            seedId: '12-3-4-56789',
          ),
        );
      },
    );
  }

  Future<void> confirmLogout() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
              padding: EdgeInsets.only(bottom: 15.w),
              child: Center(
                child: FontFormat(
                  text: 'คุณต้องการออกจากระบบหรือไม่?',
                  size: 14.w,
                ),
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
                      Navigator.pushNamed(context, '/loginPage');
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
                            text: 'ออกจากระบบ',
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
