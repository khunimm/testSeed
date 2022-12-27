// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/contact_format.dart';
import 'package:seed/components/font_format.dart';
import 'package:url_launcher/url_launcher.dart';

const phoneNumber = '0918049645';
const urlTel = 'tel:$phoneNumber';

const urlFacebook = 'https://th-th.facebook.com/seedprojectthailand/';

const toEmail = 'seedprojectthailand@gmail.com';
const urlEmail = 'mailto:$toEmail';

const urlWeb = 'https://seed-thailand.com/';

class ContactUs extends StatefulWidget {
  ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        shadowColor: bgGreyColor.withOpacity(0.5),
        automaticallyImplyLeading: false,
        title: FontFormat(
          text: 'ติดต่อเรา',
          weight: FontWeight.w600,
          textColor: greyColor,
          size: 20.sp,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 55.w),
            child: Column(
              children: [
                Container(
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
                    borderRadius: BorderRadius.circular(5),
                    color: whiteColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: ContactFormat(
                      icon: Iconsax.location,
                      title: 'อาคารไอทาวเวอร์ ชั้น 15 888 ถ.วิภาวดีรังสิต แขวงจตุจักร เขตจตุจักร กรุงเทพมหานคร 10900 ประเทศไทย',
                    ),
                  ),
                ),
                SizedBox(height: 20.w),
                Container(
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
                    borderRadius: BorderRadius.circular(5),
                    color: whiteColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      children: [
                        ContactFormat(
                          function: () async {
                            if (await canLaunch(urlFacebook)) {
                              await launch(
                                urlFacebook,
                                // forceSafariVC: true,
                                // forceWebView: true,
                                // enableJavaScript: true,
                              );
                            }
                          },
                          icon: Icons.facebook,
                          title: 'SEED THAILAND',
                        ),
                        ContactFormat(
                          function: () async {
                            if (await canLaunch(urlWeb)) {
                              await launch(
                                urlWeb,
                              );
                            }
                          },
                          icon: Iconsax.global,
                          title: 'https://www.seed-thailand.com',
                        ),
                        ContactFormat(
                          function: () async {
                            if (await canLaunch(urlTel)) {
                              await launch(
                                urlTel,
                              );
                            }
                          },
                          icon: Iconsax.call,
                          title: '091 804 9645',
                        ),
                        ContactFormat(
                          function: () async {
                            if (await canLaunch(urlEmail)) {
                              await launch(
                                urlEmail,
                              );
                            }
                          },
                          icon: Iconsax.sms,
                          title: 'seedprojectthailand@gmail.com',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomMenu(
            titleCallBack: 'ย้อนกลับ',
          )
        ],
      ),
    );
  }
}
