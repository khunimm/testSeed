// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, deprecated_member_use, prefer_interpolation_to_compose_strings, non_constant_identifier_names, unused_local_variable, use_build_context_synchronously, avoid_print, duplicate_ignore, unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/bottom_navbar.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';
import 'package:seed/components/textfield_format.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/api/api_global.dart' as api_global;

const phoneNumber = '0918049645';
const urlTel = 'tel:$phoneNumber';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String page = 'login';
bool isChecked = false;
bool checkUsername = true;
bool checkPassword = true;
final formKey = GlobalKey<FormState>(); //key for form

TextEditingController _username = TextEditingController();
TextEditingController _password = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  String url_login = api_global.url + '/auth/mobile/login';

  Future login() async {
    final body = ({"email": _username.text, "password": _password.text});

    var dio = Dio();
    var data = await dio.post(url_login, data: body);
    var jsonData = data.data;

    // // ignore: avoid_print
    // ignore: avoid_print
    print(jsonData['status']);
    if (jsonData['status'] == 'success') {
      setState(() {
        checkUsername = true;
        checkPassword = true;
      });

      print(jsonData['data']);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavbar(
            numPage: 0,
          ),
        ),
      );

      print('login success');

      api_global.box.write('s_id', jsonData['data'].toString());
      print(api_global.box.read('s_id'));
    } else if (jsonData['status'] == 'failed password') {
      setState(() {
        checkUsername = true;
        checkPassword = false;
      });
    } else {
      setState(() {
        checkUsername = false;
        checkPassword = false;
      });
      // _unsuccess();
    }
  }

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
                          controller: _username,
                          label: 'อีเมล',
                          text: 'example@xyz.com',
                          keyboardType: TextInputType.emailAddress,
                          textFieldColor: blueShadow,
                          borderColor: checkUsername ? blueShadow : declineRedColor,
                          labelColor: checkUsername ? whiteColor : declineRedColor,
                          helper: checkUsername ? null : 'อีเมลไม่ถูกต้อง',
                          helperColor: checkUsername ? Colors.transparent : declineRedColor,
                          focusTextFieldColor: checkUsername ? whiteColor : declineRedColor,
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
                          controller: _password,
                          keyboardType: TextInputType.visiblePassword,
                          textFieldColor: blueShadow,
                          borderColor: checkPassword ? blueShadow : Colors.red,
                          labelColor: checkPassword ? whiteColor : Colors.red,
                          helper: checkPassword ? null : 'รหัสผ่านไม่ถูกต้อง',
                          helperColor: checkPassword ? Colors.transparent : declineRedColor,
                          textColor: whiteColor,
                          shadow: Colors.transparent,
                          focusTextFieldColor: checkPassword ? whiteColor : Colors.red,
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
                                  if (_username.text != '' && _password.text != '') {
                                    login();
                                  } else {
                                    _unsuccess();
                                  }
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

  Future<void> _unsuccess() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
            padding: EdgeInsets.only(bottom: 15.w),
            child: FontFormat(
              text: 'กรุณากรอกข้อมูลให้ครบถ้วนเพื่อทำการเข้าสู่ระบบ',
              size: 14.w,
              align: TextAlign.center,
            ),
          ),
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
                            text: 'กรอกข้อมูล',
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
