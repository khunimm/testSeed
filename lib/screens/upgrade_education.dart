// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/button_category.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/coupon_card_format.dart';
import 'package:seed/components/font_format.dart';

class UpgradeEducation extends StatefulWidget {
  UpgradeEducation({Key? key}) : super(key: key);

  @override
  State<UpgradeEducation> createState() => _UpgradeEducationState();
}

class _UpgradeEducationState extends State<UpgradeEducation> {
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
              text: 'ร้องขอการเลื่อนขั้นระดับการศึกษา',
              weight: FontWeight.w600,
              textColor: greyColor,
              size: 20.sp,
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 100.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.w),
                          child: Row(
                            children: [
                              Icon(
                                Iconsax.info_circle,
                                color: blueColor,
                              ),
                              SizedBox(width: 5.w),
                              FontFormat(
                                text: 'คุณสามารถเลื่อนขั้นระดับการศึกษาได้',
                                weight: FontWeight.w600,
                                textColor: blueColor,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            CouponCardFormat(
                              padding: 5.w,
                              paddingSecond: 18.w,
                              widthCard: 75.w,
                              heightCard: 62.h,
                              curvePosition: 55.w,
                              curveRadius: 10.w,
                              borderRadius: 5.w,
                              image: 'images/messageImage_1667365186104 4.png',
                              qrImage: 'images/qr-code.png',
                              qrImageSize: 15.w,
                              imageSize: 15.w,
                              name: 'มณีจันทร์',
                              nameSize: 2.w,
                              lastName: 'จันทร์มณีกุล',
                              lastNameSize: 2.w,
                              region: 'ตะวันออกเฉียงเหนือ',
                              regionSize: 2.w,
                              phoneNumber: '0812325678',
                              phoneNumberSize: 2.w,
                              email: 'abc@hotmail.com',
                              educationSize: 2.w,
                              colorCard: whiteColor,
                              color: greyColor,
                              textColor: greyColor,
                              education: 'มัธยมศึกษา',
                              seedId: '12-3-4-56789',
                              seedIdSize: 4.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 3.w, right: 3.w),
                              child: Icon(Iconsax.arrow_right_3),
                            ),
                            CouponCardFormat(
                              padding: 8.w,
                              paddingSecond: 18.w,
                              widthCard: 223.w,
                              heightCard: 206.h,
                              curvePosition: 143.w,
                              curveRadius: 15.w,
                              borderRadius: 5.w,
                              image: 'images/messageImage_1667365186104 4.png',
                              qrImage: 'images/qr-code.png',
                              qrImageSize: 45.w,
                              imageSize: 45.w,
                              name: 'มณีจันทร์',
                              nameSize: 12.w,
                              lastName: 'จันทร์มณีกุล',
                              lastNameSize: 12.w,
                              region: 'ตะวันออกเฉียงเหนือ',
                              regionSize: 10.w,
                              phoneNumber: '0812345678',
                              phoneNumberSize: 10.w,
                              email: 'abc@hotmail.com',
                              educationSize: 10.w,
                              colorCard: whiteColor,
                              color: blueColor,
                              textColor: blackColor,
                              education: 'อุดมศึกษา',
                              seedId: '12-3-4-56789',
                              seedIdSize: 10.w,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                          child: FontFormat(
                            text: '* กรุณาแนบหลักฐานในระดับอุดมศึกษา เช่น บัตรนักศึกษา, หลักฐานทางการศึกษา, ... โดยคุณสามารถแนบหลักฐานได้เพียง 1 ภาพเท่านั้น',
                            weight: FontWeight.w600,
                            textColor: blueColor,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => getImage(ImageSource.gallery),
                                child: ButtonCategory(
                                  bgColor: whiteColor,
                                  image: 'images/gallery.png',
                                  title: 'คลังภาพ',
                                  titleColor: blackColor,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: InkWell(
                                onTap: () => getImage(ImageSource.camera),
                                child: ButtonCategory(
                                  bgColor: whiteColor,
                                  image: 'images/camera.png',
                                  title: 'ถ่ายภาพ',
                                  titleColor: blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        _image != null
                            ? Padding(
                                padding: EdgeInsets.only(top: 20.w),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(
                                        _image!,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
              BottomMenu(
                icon: Iconsax.document_forward,
                title: 'ยืนยันการร้องขอ',
                function: _showMyDialog,
              )
            ],
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
                text: 'คุณต้องการร้องขอการเลื่อนขั้นระดับการศึกษาหรือไม่?',
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
                      Navigator.pushNamed(context, '/completeUpgradeEducation');
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
