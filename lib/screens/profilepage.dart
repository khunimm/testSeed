// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, non_constant_identifier_names, sized_box_for_whitespace

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:seed/components/button_setting_format.dart';
import 'package:seed/components/class/user.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/coupon_card_format.dart';
import 'package:seed/components/font_format.dart';
import 'package:seed/components/vertical_coupon_card_fromat.dart';
import '../components/api/api_global.dart' as api_global;

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String url_getUser = api_global.url + '/seedmembers/mobile/findById/' + api_global.box.read("s_id");

  List<User> users = [];
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  Future<List<User>> _getUser() async {
    var dio = Dio();
    var data = await dio.get(url_getUser);
    var jsonData = data.data;
    var seed_code_test = '';

    User users2 = User();
    users2.first_name_th = jsonData["data"]["first_name_th"];
    users2.last_name_th = jsonData["data"]["last_name_th"];
    users2.zone = jsonData["data"]["zone"];
    users2.phone_number = jsonData["data"]["phone_number"];
    users2.email = jsonData["data"]["email"];
    users2.education = jsonData["data"]["education"];
    users2.seed_code = jsonData["data"]["seed_code"];
    users2.img_profile = jsonData["data"]["img_profile"];
    users2.score_rank = jsonData["data"]["score_rank"];

    //วิธีsplit codeseed 1
    var split_code_seed = users2.seed_code?.split('');
    split_code_seed![1] = split_code_seed[1] + "-";
    split_code_seed[2] = split_code_seed[2] + "-";
    split_code_seed[3] = split_code_seed[3] + "-";

    //วิธีsplit codeseed 2
    // for (var j = 0; j < split_code_seed!.length; j++) {
    //   if (j == 1 || j == 2 || j == 3) {
    //     seed_code_test += split_code_seed[j] + "-";
    //   } else {
    //     seed_code_test += split_code_seed[j];
    //   }
    // }
    users2.seed_code = split_code_seed.join("");
    users.add(users2);

    return users;
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    _getUser();
    setState(() {});
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
              text: 'โปรไฟล์',
              weight: FontWeight.w600,
              textColor: greyColor,
              size: 20.w,
            ),
          ),
          body: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            header: WaterDropMaterialHeader(
              backgroundColor: blueColor,
            ),
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: _getUser(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container();
                    } else {
                      return Column(
                        children: [
                          for (var i = 0; i < 1; i++) ...[
                            SizedBox(height: 16.w),
                            InkWell(
                              onTap: () {
                                _showMyDialog(
                                  snapshot.data[i].first_name_th,
                                  snapshot.data[i].last_name_th,
                                  snapshot.data[i].zone,
                                  snapshot.data[i].phone_number,
                                  snapshot.data[i].email,
                                  snapshot.data[i].education,
                                  snapshot.data[i].seed_code,
                                );
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
                                qrImage: 'images/Group 270.png',
                                qrImageSize: 80.w,
                                imageSize: 80.w,
                                name: snapshot.data[i].first_name_th,
                                nameSize: 16.w,
                                lastName: snapshot.data[i].last_name_th,
                                lastNameSize: 16.w,
                                region: snapshot.data[i].zone,
                                regionSize: 12.w,
                                phoneNumber: snapshot.data[i].phone_number,
                                phoneNumberSize: 12.w,
                                email: snapshot.data[i].email,
                                educationSize: 12.w,
                                colorCard: whiteColor,
                                color: blueColor,
                                textColor: blackColor,
                                education: snapshot.data[i].education,
                                seedId: snapshot.data[i].seed_code,
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
                                    Navigator.pushNamed(context, '/rank', arguments: {
                                      'first_name_th': snapshot.data[i].first_name_th,
                                    });
                                    // print(snapshot.data[i].first_name_th);
                                  },
                                  child: Container(
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
                                        Navigator.pushNamed(context, '/upgradeEducation', arguments: {
                                          'first_name_th': snapshot.data[i].first_name_th,
                                        });
                                      },
                                      icon: Iconsax.document_forward,
                                      header: 'ร้องขอการเลื่อนขั้นระดับการศึกษา',
                                    ),
                                    ButtonSettingFormat(
                                      function: () {
                                        Navigator.pushNamed(context, '/editProfile', arguments: {
                                          'phone_number': snapshot.data[i].phone_number,
                                          'email': snapshot.data[i].email,
                                        });
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
                              ),
                            )
                          ],
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showMyDialog(
    String first_name_th,
    String last_name_th,
    String zone,
    String phone_number,
    String email,
    String education,
    String seed_code,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 40.w, 20.w, 40.w),
          child: VerticalCouponCardFromat(
            image: 'images/messageImage_1667365186104 4.png',
            qrImage: 'images/Group 270.png',
            name: first_name_th,
            lastName: last_name_th,
            region: zone,
            phoneNumber: phone_number,
            email: email,
            education: education,
            seedId: seed_code,
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
                      // Navigator.pushNamed(context, '/loginPage');
                      api_global.box.remove('s_id');
                      Phoenix.rebirth(context);
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
