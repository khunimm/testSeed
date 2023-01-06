// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_this, non_constant_identifier_names, unused_element, unused_local_variable

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/bottom_navbar.dart';
import 'package:seed/components/class/user.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';
import 'package:seed/components/textfield_format.dart';
import '../components/api/api_global.dart' as api_global;

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

// TextEditingController _name = TextEditingController();
// TextEditingController _lastName = TextEditingController();
TextEditingController _phoneNumber = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _address = TextEditingController();
TextEditingController _subDistrict = TextEditingController();
TextEditingController _district = TextEditingController();
TextEditingController _province = TextEditingController();
TextEditingController _postCode = TextEditingController();

class _EditProfileState extends State<EditProfile> {
  // ignore: prefer_interpolation_to_compose_strings
  String url_getUser = api_global.url + '/seedmembers/mobile/findById/' + api_global.box.read("s_id");
  List<User> users = [];

  Future<List<User>> _getUser() async {
    var dio = Dio();
    var data = await dio.get(url_getUser);
    var jsonData = data.data;

    User users2 = User();
    // users2.first_name_th = jsonData["data"]["first_name_th"];
    // users2.last_name_th = jsonData["data"]["last_name_th"];
    users2.zone = jsonData["data"]["zone"];
    users2.phone_number = jsonData["data"]["phone_number"];
    users2.email = jsonData["data"]["email"];
    users2.education = jsonData["data"]["education"];
    users2.seed_code = jsonData["data"]["seed_code"];
    users2.img_profile = jsonData["data"]["img_profile"];
    users2.score_rank = jsonData["data"]["score_rank"];

    users.add(users2);

    // print("$seed_code_test");
    return users;
  }

  File? _image;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bgGreyColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        shadowColor: bgGreyColor.withOpacity(0.5),
        automaticallyImplyLeading: false,
        title: FontFormat(
          text: 'แก้ไขข้อมูลส่วนบุคคล',
          weight: FontWeight.w600,
          textColor: greyColor,
          size: 20.sp,
        ),
        centerTitle: true,
      ),
      body: ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              FutureBuilder(
                future: _getUser(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container();
                  } else {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 70.w),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 0; i < 1; i++) ...[
                              SizedBox(height: 16.w),
                              Center(
                                child: SizedBox(
                                  width: 180.w,
                                  height: 180.w,
                                  child: Stack(
                                    children: [
                                      _image != null
                                          ? Container(
                                              width: 180.w,
                                              height: 180.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(200),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: FileImage(
                                                    _image!,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              width: 180.w,
                                              height: 180.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(200),
                                                image: DecorationImage(
                                                  image: AssetImage('images/1a8435b262f70dc441a52bf15a9c620d.jpeg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: 5.w,
                                          bottom: 5.w,
                                        ),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: InkWell(
                                            onTap: _showMyDialog,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: blueColor,
                                                border: Border.all(
                                                  color: whiteColor,
                                                ),
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(5.w),
                                                child: Icon(
                                                  Iconsax.brush_4,
                                                  color: whiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              FontFormat(
                                text: 'ข้อมูลส่วนบุคคล',
                                size: 16.w,
                                weight: FontWeight.w600,
                              ),
                              SizedBox(height: 5.w),
                              // TextfieldFormat(
                              //   text: snapshot.data[i].first_name_th,
                              //   borderColor: Colors.transparent,
                              //   focusTextFieldColor: blueColor,
                              //   textFieldColor: whiteColor,
                              //   textColor: blackColor,
                              //   shadow: shadow,
                              //   hintColor: greyColor,
                              //   controller: _name,
                              //   keyboardType: TextInputType.text,
                              // ),
                              // TextfieldFormat(
                              //   text: snapshot.data[i].last_name_th,
                              //   hintColor: greyColor,
                              //   borderColor: Colors.transparent,
                              //   focusTextFieldColor: blueColor,
                              //   textFieldColor: whiteColor,
                              //   textColor: blackColor,
                              //   shadow: shadow,
                              //   controller: _lastName,
                              //   keyboardType: TextInputType.text,
                              // ),
                              TextfieldFormat(
                                text: args['phone_number'],
                                hintColor: greyColor,
                                borderColor: Colors.transparent,
                                focusTextFieldColor: blueColor,
                                textFieldColor: whiteColor,
                                textColor: blackColor,
                                shadow: shadow,
                                controller: _phoneNumber,
                                keyboardType: TextInputType.phone,
                              ),
                              TextfieldFormat(
                                text: args['email'],
                                hintColor: greyColor,
                                borderColor: Colors.transparent,
                                focusTextFieldColor: blueColor,
                                textFieldColor: whiteColor,
                                textColor: blackColor,
                                shadow: shadow,
                                controller: _email,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 10.w),
                              FontFormat(
                                text: 'ที่อยู่',
                                size: 16.w,
                                weight: FontWeight.w600,
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
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
              BottomMenu(
                function: () {
                  editProfile();
                },
                icon: Iconsax.location_tick,
                title: 'ยืนยันแก้ไขข้อมูล',
              ),
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
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      getImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffECECEC),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                width: 60.w,
                                height: 50.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/gallery.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.w),
                              FontFormat(
                                text: 'คลังภาพ',
                                size: 12.w,
                                textColor: blackColor,
                              ),
                            ],
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
                      getImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffECECEC),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                width: 60.w,
                                height: 50.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/camera.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.w),
                              FontFormat(
                                text: 'ถ่ายภาพ',
                                size: 12.w,
                                textColor: blackColor,
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

  Future<void> editProfile() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
            padding: EdgeInsets.only(bottom: 15.w),
            child: FontFormat(
              text: 'คุณต้องการบันทึกการเปลี่ยนแปลงข้อมูลส่วนบุคคลใช่หรือไม่?',
              size: 14.w,
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
                            numPage: 3,
                          ),
                        ),
                      );
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
