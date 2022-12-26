// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/bottom_navbar.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';
import 'package:seed/components/textfield_format.dart';
import 'package:url_launcher/url_launcher.dart';

const phoneNumber = '+0918049645';
const urlTel = 'tel:$phoneNumber';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String page = 'login';
bool isChecked = false;
final formKey = GlobalKey<FormState>(); //key for form

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(
            'images/bg_login.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          ScreenUtilInit(
            builder: (BuildContext context, Widget? child) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Image.asset('images/seed.png', width: 200.w),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.w, bottom: 15.w),
                          child: FontFormat(
                            text: "ยินดีต้อนรับกลับเข้าสู่แอปพลิเคชัน SEED!",
                            textColor: whiteColor,
                            size: 14.w,
                          ),
                        ),
                        TextfieldFormat(
                          label: 'อีเมล',
                          text: 'example@xyz.com',
                          keyboardType: TextInputType.emailAddress,
                          textFieldColor: blueShadow,
                          borderColor: blueShadow,
                          focusTextFieldColor: whiteColor,
                          textColor: whiteColor,
                          shadow: Colors.transparent,
                          hintColor: Color(0xffA0A5C9),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        TextfieldFormat(
                          label: 'รหัสผ่าน',
                          text: 'รหัสผ่าน',
                          keyboardType: TextInputType.visiblePassword,
                          textFieldColor: blueShadow,
                          borderColor: blueShadow,
                          textColor: whiteColor,
                          shadow: Colors.transparent,
                          focusTextFieldColor: whiteColor,
                          hintColor: Color(0xffA0A5C9),
                          defaultIcon: Iconsax.eye_slash,
                          icon: Iconsax.eye,
                          iconColor: Color(0xffA0A5C9),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                forgetPassword();
                              },
                              child: FontFormat(
                                text: 'ลืมรหัสผ่าน?',
                                textColor: whiteColor,
                                size: 12.w,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.w),
                        InkWell(
                          onTap: isChecked == true
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BottomNavbar(
                                        numPage: 0,
                                      ),
                                    ),
                                  );
                                }
                              : () {
                                  acceptPrivacy();
                                },
                          child: Container(
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: FontFormat(
                                  text: 'เข้าสู่ระบบ',
                                  weight: FontWeight.w600,
                                  textColor: blueColor,
                                  size: 14.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.w),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                    color: whiteColor,
                                    width: 2,
                                  ),
                                  checkColor: blueColor,
                                  activeColor: whiteColor,
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
                              text: 'ฉันอ่านและยอมรับเงื่อนไข ',
                              textColor: whiteColor,
                              size: 12.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/privacyPolicy');
                              },
                              child: FontFormat(
                                text: 'นโยบายส่วนบุคคล',
                                decoration: TextDecoration.underline,
                                textColor: whiteColor,
                                size: 12.w,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> forgetPassword() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
              padding: EdgeInsets.only(bottom: 15.w),
              child: Center(
                child: FontFormat(
                  align: TextAlign.center,
                  text: 'หากคุณลืมรหัสผ่าน กรุณาติดต่อเจ้าหน้าที่เบอร์ 0918049645 เพื่อทำการขอเปลี่ยนรหัสผ่าน',
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
                            text: 'ปิด',
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
                  flex: 2,
                  child: InkWell(
                    onTap: () async {
                      if (await canLaunch(urlTel)) {
                        await launch(
                          urlTel,
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Iconsax.call, color: whiteColor, size: 20.w),
                              SizedBox(width: 10.w),
                              FontFormat(
                                text: 'โทร',
                                size: 14.w,
                                textColor: whiteColor,
                              ),
                            ],
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

  Future<void> acceptPrivacy() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
              padding: EdgeInsets.only(bottom: 15.w),
              child: Center(
                child: FontFormat(
                  align: TextAlign.center,
                  text: 'กรุณาอ่านและยอมรับนโยบายความเป็นส่วนตัวเพื่อเข้าสู่ระบบ',
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
                            text: 'ปิด',
                            size: 14.w,
                            textColor: blackColor,
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
