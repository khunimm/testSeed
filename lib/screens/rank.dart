// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';

class Rank extends StatefulWidget {
  Rank({Key? key}) : super(key: key);

  @override
  State<Rank> createState() => _RankState();
}

String rank = 'อันดับภาค';

class _RankState extends State<Rank> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return Scaffold(
        backgroundColor: bgGreyColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: whiteColor,
          shadowColor: bgGreyColor.withOpacity(0.5),
          automaticallyImplyLeading: false,
          title: FontFormat(
            text: 'อันดับ',
            weight: FontWeight.w600,
            textColor: greyColor,
            size: 20.sp,
          ),
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
                      borderRadius: BorderRadius.circular(5),
                      color: blueColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 80.w,
                                child: Column(
                                  children: [
                                    FontFormat(
                                      text: 'อันดับ',
                                      textColor: yellowColor,
                                    ),
                                    SizedBox(height: 5.w),
                                    FontFormat(
                                      text: '99,999',
                                      weight: FontWeight.w600,
                                      textColor: whiteColor,
                                      size: 22.w,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 80.w,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 70.w,
                                      height: 70.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        image: DecorationImage(
                                          image: AssetImage('images/messageImage_1667365186104 4.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.w),
                                    // FontFormat(
                                    //   text: 'มณีจันทร์',
                                    //   weight: FontWeight.w600,
                                    //   textColor: whiteColor,
                                    //   size: 15.w,
                                    // )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 80.w,
                                child: Column(
                                  children: [
                                    FontFormat(
                                      text: 'คะแนน',
                                      textColor: yellowColor,
                                    ),
                                    SizedBox(height: 5.w),
                                    FontFormat(
                                      text: '99,999',
                                      weight: FontWeight.w600,
                                      textColor: whiteColor,
                                      size: 22.w,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          FontFormat(
                            text: 'พระบาทสมเด็จพระบรมชนกาธิเบศร มหาภูมิพลอดุลยเดชมหาราช บรมนาถบพิตร',
                            weight: FontWeight.w600,
                            textColor: whiteColor,
                            size: 15.w,
                            align: TextAlign.center,
                            line: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.w,
                      bottom: 15.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              rank = 'อันดับภาค';
                            });
                          },
                          child: rank == 'อันดับภาค'
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: blueColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: FontFormat(
                                      text: 'อันดับภาค',
                                      size: 12.w,
                                      weight: FontWeight.w600,
                                      textColor: blackColor,
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: FontFormat(
                                      text: 'อันดับภาค',
                                      size: 12.w,
                                      weight: FontWeight.w600,
                                      textColor: blackColor,
                                    ),
                                  ),
                                ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              rank = 'อันดับระดับประเทศ';
                            });
                          },
                          child: rank == 'อันดับระดับประเทศ'
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: blueColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: FontFormat(
                                      text: 'อันดับระดับประเทศ',
                                      size: 12.w,
                                      weight: FontWeight.w600,
                                      textColor: blackColor,
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: FontFormat(
                                      text: 'อันดับระดับประเทศ',
                                      size: 12.w,
                                      weight: FontWeight.w600,
                                      textColor: blackColor,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
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
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: rank == 'อันดับภาค' ? sector() : country(),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomMenu(
                icon: Iconsax.gift,
                title: 'รับของรางวัล',
                function: () {
                  Navigator.pushNamed(context, '/reward');
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget sector() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.w,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 20.w),
              child: Row(
                children: [
                  if (index == 0) ...[
                    SizedBox(
                      width: 20.w,
                      child: Center(
                        child: Icon(Iconsax.star, size: 20.w),
                      ),
                    ),
                  ] else if (index == 1) ...[
                    SizedBox(
                      width: 20.w,
                      child: Center(
                        child: Icon(Iconsax.star, size: 20.w),
                      ),
                    ),
                  ] else if (index == 2) ...[
                    SizedBox(
                      width: 20.w,
                      child: Center(
                        child: Icon(Iconsax.star, size: 20.w),
                      ),
                    ),
                  ] else ...[
                    SizedBox(
                      width: 20.w,
                      child: Center(
                        child: FontFormat(
                          text: '${index + 1}',
                          size: 18.w,
                        ),
                      ),
                    )
                  ],
                  SizedBox(width: 10.w),
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage('images/Union.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  FontFormat(
                    text: 'ชื่อคนที่ ${index + 1}',
                    textColor: blueColor,
                    size: 14.w,
                  ),
                  Spacer(),
                  FontFormat(
                    text: '99,999',
                    textColor: blueColor,
                    size: 16.w,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget country() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.w,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 20.w),
              child: Row(
                children: [
                  if (index == 0) ...[
                    SizedBox(
                      width: 20.w,
                      child: Center(
                        child: Icon(Iconsax.star, size: 20.w),
                      ),
                    ),
                  ] else if (index == 1) ...[
                    SizedBox(
                      width: 20.w,
                      child: Center(
                        child: Icon(Iconsax.star, size: 20.w),
                      ),
                    ),
                  ] else if (index == 2) ...[
                    SizedBox(
                      width: 20.w,
                      child: Center(
                        child: Icon(Iconsax.star, size: 20.w),
                      ),
                    ),
                  ] else ...[
                    SizedBox(
                      width: 20.w,
                      child: Center(
                        child: FontFormat(
                          text: '${index + 1}',
                          size: 18.w,
                        ),
                      ),
                    )
                  ],
                  SizedBox(width: 10.w),
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage('images/Union.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  FontFormat(
                    text: 'ชื่อคนที่ ${index + 1}',
                    textColor: blueColor,
                    size: 14.w,
                  ),
                  Spacer(),
                  FontFormat(
                    text: '99,999',
                    textColor: blueColor,
                    size: 16.w,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
