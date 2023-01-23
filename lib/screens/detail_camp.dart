// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, prefer_interpolation_to_compose_strings, non_constant_identifier_names, unused_local_variable, use_build_context_synchronously, unused_import

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/bottom_navbar.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';
import 'package:seed/screens/camp_status.dart';
import '../components/api/api_global.dart' as api_global;

class DetailCamp extends StatefulWidget {
  DetailCamp({
    final Key? key,
  }) : super(key: key);

  @override
  State<DetailCamp> createState() => _DetailCampState();
}

class _DetailCampState extends State<DetailCamp> {
  String url_register_events = api_global.url + '/regisEvents/mobile/register/events';

  String url_check_register = api_global.url + '/regisEvents/mobile/register/check';

  String url_cancel_register = api_global.url + '/regisEvents/mobile/register/cancel';

  // ignore: prefer_typing_uninitialized_variables
  var args;

  int? e_id;

  String? title;
  String? time;
  String? statusComplete;
  String image = "";
  String? persons;
  String? period;
  String? location;
  String? detail;
  String? exp;
  String? campPoint;
  String? seedCoin;
  String? require;
  String? status;

  int check = 0;

  var check_button_submit = 0;

  Future regisEvents() async {
    final body = ({"e_id": e_id, "s_id": api_global.box.read('s_id'), "approve_status": 0, "approve_by": "test"});

    // print(body);

    var dio = Dio();
    var data = await dio.post(url_register_events, data: body);
    var jsonData = data.data;

    // print(jsonData['status']);
  }

  Future checkRegis() async {
    final body = ({"e_id": e_id, "s_id": api_global.box.read('s_id')});

    var dio = Dio();
    var data = await dio.get(url_check_register, queryParameters: body);
    var jsonData = data.data;

    // check_button_submit = jsonData['data']['approve_status'];
    // print(check_button_submit);

    // print(jsonData['data']['approve_status']);

    if (jsonData['data'] == null) {
      setState(() {
        if (status == "") {
          status = "";
        }
      });
    } else {
      setState(() {
        if (status == "0" || jsonData['data']['approve_status'] == 0) {
          status = 'รอการอนุมัติ';
        }
        if (status == "1" || jsonData['data']['approve_status'] == 1) {
          status = 'ได้รับการอนุมัติ';
        }
        if (status == "2" || jsonData['data']['approve_status'] == 2) {
          status = 'ไม่ได้รับการอนุมัติ';
        }
        if (status == "3" || jsonData['data']['approve_status'] == 3) {
          status = 'เข้าค่ายสำเร็จ';
        }
      });
    }
  }

  Future cancelRegis() async {
    final body = ({"e_id": e_id, "s_id": api_global.box.read('s_id')});

    // // print(body);

    var dio = Dio();
    var data = await dio.delete(url_cancel_register, data: body);
    var jsonData = data.data;

    print(jsonData['status']);
    if (jsonData['status'] == 'delete success') {
      Navigator.pop(context);
      setState(() {
        status = "";
      });
    }

    // check_button_submit = jsonData['data'];

    // if (check_button_submit == 1) {
    //   setState(() {
    //     status = 'รอการอนุมัติ';
    //   });
    // }
  }

  Future<void> setCheck() async {
    await regisEvents();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BottomNavbar(
          numPage: 1,
        ),
      ),
    );
    setState(() {
      check = 1;
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
        e_id = args['e_id'];
        title = args['title'];
        image = args['image'];
        time = args['time'];
        statusComplete = statusComplete;
        image = args['image'];
        persons = args['persons'];
        period = args['period'];
        location = args['location'];
        detail = args['detail'];
        exp = args['exp'];
        campPoint = args['campPoint'];
        seedCoin = args['seedCoin'];
        require = args['require'];
        status = args['status'];

        // status = 'รอการอนุมัติ';
      });
      checkRegis();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // var aaa;
    // setState(() {
    //   status = 'รอการอนุมัติ';
    //   // aaa = 'รอการอนุมัติ';
    // });
    // print(status);

    // print(check_button_submit);
    // print(check_button_submit);
    // if (check_button_submit == 1) {
    //   setState(() {
    //     status = 'รอการอนุมัติ';
    //   });
    //   print(status);
    // }

    // print(status);

    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 14.w, 16.w, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage(image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: status == 'รอการอนุมัติ'
                                      ? greyColor
                                      : status == 'ได้รับการอนุมัติ'
                                          ? approveGreenColor
                                          : status == 'ไม่ได้รับการอนุมัติ'
                                              ? declineRedColor
                                              : status == 'เข้าค่ายสำเร็จ'
                                                  ? blueColor
                                                  : null,
                                ),
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(10.w, 4.w, 10.w, 4.w),
                                    child: status != null
                                        ? FontFormat(
                                            text: status,
                                            textColor: whiteColor,
                                          )
                                        : null),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.w),
                        Center(
                          child: FontFormat(
                            text: title,
                            weight: FontWeight.w600,
                            textColor: blackColor,
                            size: 18.w,
                            align: TextAlign.center,
                          ),
                        ),
                        if (statusComplete != null) ...[
                          Center(
                            child: FontFormat(
                              text: statusComplete,
                              textColor: approveGreenColor,
                              size: 14.w,
                            ),
                          ),
                        ] else ...[
                          if (status != 'เข้าค่ายสำเร็จ') ...[
                            Center(
                              child: FontFormat(
                                text: 'หมดเขต $exp',
                                textColor: declineRedColor,
                                size: 14.w,
                              ),
                            ),
                          ]
                        ],
                        SizedBox(height: 20.w),
                        Row(
                          children: [
                            Icon(
                              Iconsax.star,
                            ),
                            SizedBox(width: 10.w),
                            FontFormat(
                              text: 'คะแนนอันดับ : $campPoint',
                              weight: FontWeight.w600,
                              size: 16.w,
                            ),
                          ],
                        ),
                        SizedBox(height: 5.w),
                        Row(
                          children: [
                            Icon(
                              Iconsax.copyright,
                            ),
                            SizedBox(width: 10.w),
                            FontFormat(
                              text: 'เหรียญรางวัล : $seedCoin',
                              weight: FontWeight.w600,
                              size: 16.w,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                          child: Divider(color: greyColor, height: 2),
                        ),
                        Row(
                          children: [
                            Icon(
                              Iconsax.location,
                              color: blueColor,
                            ),
                            SizedBox(width: 10.w),
                            FontFormat(
                              text: 'สถานที่',
                              weight: FontWeight.w600,
                              size: 12.w,
                              textColor: blueColor,
                            ),
                          ],
                        ),
                        FontFormat(
                          text: location,
                          size: 12.w,
                          textColor: blackColor,
                        ),
                        SizedBox(height: 15.w),
                        Row(
                          children: [
                            Icon(
                              Iconsax.calendar_2,
                              color: blueColor,
                            ),
                            SizedBox(width: 10.w),
                            FontFormat(
                              text: 'วันที่จัดกิจกรรม',
                              weight: FontWeight.w600,
                              size: 12.w,
                              textColor: blueColor,
                            ),
                          ],
                        ),
                        FontFormat(
                          text: period,
                          size: 12.w,
                          textColor: blackColor,
                        ),
                        SizedBox(height: 15.w),
                        Row(
                          children: [
                            Icon(
                              Iconsax.card_tick,
                              color: blueColor,
                            ),
                            SizedBox(width: 10.w),
                            FontFormat(
                              text: 'คุณสมบัติ',
                              weight: FontWeight.w600,
                              size: 12.w,
                              textColor: blueColor,
                            ),
                          ],
                        ),
                        FontFormat(
                          text: require,
                          size: 12.w,
                          textColor: blackColor,
                        ),
                        SizedBox(height: 15.w),
                        Row(
                          children: [
                            Icon(
                              Iconsax.profile_2user,
                              color: blueColor,
                            ),
                            SizedBox(width: 10.w),
                            FontFormat(
                              text: 'จำนวนที่รับ',
                              weight: FontWeight.w600,
                              size: 12.w,
                              textColor: blueColor,
                            ),
                          ],
                        ),
                        FontFormat(
                          text: persons,
                          size: 12.w,
                          textColor: blackColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                          child: Divider(color: greyColor, height: 2),
                        ),
                        FontFormat(
                          text: 'รายละเอียด',
                          weight: FontWeight.w600,
                          size: 12.w,
                          textColor: blueColor,
                        ),
                        FontFormat(
                          height: 1.65.w,
                          text: detail,
                        ),
                        SizedBox(height: 80.w),
                      ],
                    ),
                  ),
                ),
                status == 'ได้รับการอนุมัติ' || status == 'รอการอนุมัติ'
                    ? BottomMenu(
                        icon: Iconsax.close_circle,
                        title: 'ยกเลิกการสมัครกิจกรรม',
                        function: () => _showMyDialog(),
                      )
                    : campPoint != null && statusComplete != null && status != 'ไม่ได้รับการอนุมัติ' || status == ""
                        ? BottomMenu(
                            icon: Iconsax.book_14,
                            title: 'สมัครกิจกรรม',
                            function: () {
                              bookCamp();
                            })
                        : BottomMenu(titleCallBack: 'ย้อนกลับ'),
              ],
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
        return AlertDialog(
          title: Padding(
              padding: EdgeInsets.only(bottom: 15.w),
              child: FontFormat(
                text: 'คุณต้องการยกเลิกการสมัครกิจกรรมนี้หรือไม่?',
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
                      cancelRegis();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => BottomNavbar(
                      //       numPage: 1,
                      //     ),
                      //   ),
                      // );
                      // status = 'declined';
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

  Future<void> bookCamp() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
              padding: EdgeInsets.only(bottom: 15.w),
              child: FontFormat(
                text: 'คุณต้องการสมัครกิจกรรมนี้หรือไม่?',
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
                      check == 0 ? setCheck() : null;
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
