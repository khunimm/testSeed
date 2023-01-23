// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:seed/components/camp_format.dart';
import 'package:seed/components/class/events.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';
import 'package:seed/components/status_format.dart';
import 'package:shimmer/shimmer.dart';
import '../components/api/api_global.dart' as api_global;

class CampStatus extends StatefulWidget {
  CampStatus({Key? key}) : super(key: key);

  @override
  State<CampStatus> createState() => _CampStatusState();
}

class _CampStatusState extends State<CampStatus> {
  int status = 0;
  bool page = true;
  int? e_id = 0;
  int count = 0;
  int total_pending = 4;
  int total_approved = 4;
  int total_declined = 4;
  String url_register_events_checkPending = api_global.url + '/regisEvents/mobile/register/checkStatus';

  Future<List<Events>> _getEvents(int limit) async {
    final body = ({
      "s_id": api_global.box.read('s_id'),
      "approve_status": status,
      "e_id": e_id,
      "limit": limit,
    });

    var dio = Dio();
    var data = await dio.get(url_register_events_checkPending, queryParameters: body);
    var jsonData = data.data;
    // print(jsonData['result']);

    List<Events> data_events = [];
    count = jsonData['data'].length;
    print(count);
    // print(jsonData['data']);

    for (var i in jsonData['data']) {
      Events events_inLoop = Events();

      events_inLoop.e_id = i['e_id'];
      events_inLoop.approve_status = i['approve_status'];
      events_inLoop.name = i['event']['name'];
      events_inLoop.img = i['event']['img'];
      events_inLoop.description = i['event']['description'];
      events_inLoop.point = i['event']['point'];
      events_inLoop.start_recruit_date = i['event']['start_recruit_date'];
      events_inLoop.end_recruit_date = i['event']['end_recruit_date'];
      events_inLoop.member_limit = i['event']['member_limit'];
      events_inLoop.start_date = i['event']['start_date'];
      events_inLoop.end_date = i['event']['end_date'];

      data_events.add(events_inLoop);
    }

    return data_events;
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();

    if (status == 0) {
      total_pending = 4;
    }
    if (status == 1) {
      total_approved = 4;
    }
    if (status == 2) {
      total_declined = 4;
    }

    setState(() {});
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    if (mounted) {
      if (status == 0) {
        total_pending += 2;
      }
      if (status == 1) {
        total_approved += 2;
      }
      if (status == 2) {
        total_declined += 2;
      }
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: bgGreyColor,
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            shadowColor: bgGreyColor.withOpacity(0.5),
            title: FontFormat(
              text: 'สถานะกิจกรรม',
              weight: FontWeight.w600,
              textColor: Color(0xffC2C2C2),
              size: 20.w,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 18.w, 16.w, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          status = 0;
                        });
                        print("status $status");
                      },
                      child: status == 0
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
                                  text: 'รออนุมัติ',
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
                                  text: 'รออนุมัติ',
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
                          status = 1;
                        });
                        print("status $status");
                      },
                      child: status == 1
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
                                  text: 'อนุมัติ',
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
                                  text: 'อนุมัติ',
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
                          status = 2;
                        });
                        print("status $status");
                      },
                      child: status == 2
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
                                  text: 'ปฏิเสธ',
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
                                  text: 'ปฏิเสธ',
                                  size: 12.w,
                                  weight: FontWeight.w600,
                                  textColor: blackColor,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                SizedBox(height: 20.w),
                if (status == 0) ...[
                  pending(),
                ] else if (status == 1) ...[
                  approved(),
                ] else ...[
                  declined(),
                ],
                // if (count == 0) ...[
                //   empty()
                // ] else ...[
                //   if (status == 0) ...[
                //     pending(),
                //   ] else if (status == 1) ...[
                //     approved(),
                //   ] else ...[
                //     declined(),
                //   ],
                // ]
              ],
            ),
          ),
        );
      },
    );
  }

  Widget pending() {
    return Expanded(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropMaterialHeader(
          backgroundColor: blueColor,
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: FutureBuilder(
          future: _getEvents(total_pending),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // print(" mm ${snapshot.data}");
            if (snapshot.data == null) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 235.w,
                child: Shimmer.fromColors(
                  baseColor: lightGreyColor,
                  highlightColor: lightGreyColor.withOpacity(0.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightGreyColor,
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    width: 65.w,
                    height: 60.w,
                  ),
                ),
              );
            } else {
              if (count == 0) {
                return empty();
              }
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  for (var j = 0; j < count; j++)
                    StatusFormat(
                      e_id: snapshot.data[j].e_id,
                      status: snapshot.data[j].approve_status.toString(),
                      image: 'images/314892169_1151132685531547_2858263846283668721_n.jpeg',
                      title: snapshot.data[j].name,
                      detail: snapshot.data[j].description,
                      time: '5 days ago',
                      exp: snapshot.data[j].end_recruit_date,
                      period: '${snapshot.data[j].start_date} - ${snapshot.data[j].end_date}',
                      seedCoin: snapshot.data[j].point.toString(),
                      campPoint: snapshot.data[j].point.toString(),
                      location: snapshot.data[j].z_id.toString(),
                      require: 'ผู้ผ่านกิจกรรมสตาฟ SEED ',
                      persons: snapshot.data[j].member_limit.toString(),
                    ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget approved() {
    return Expanded(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropMaterialHeader(
          backgroundColor: blueColor,
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: FutureBuilder(
          future: _getEvents(total_approved),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // print(" mm ${snapshot.data}");
            if (snapshot.data == null) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 235.w,
                child: Shimmer.fromColors(
                  baseColor: lightGreyColor,
                  highlightColor: lightGreyColor.withOpacity(0.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightGreyColor,
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    width: 65.w,
                    height: 60.w,
                  ),
                ),
              );
            } else {
              if (count == 0) {
                return empty();
              }
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  for (var j = 0; j < count; j++)
                    StatusFormat(
                      e_id: snapshot.data[j].e_id,
                      status: snapshot.data[j].approve_status.toString(),
                      image: 'images/314892169_1151132685531547_2858263846283668721_n.jpeg',
                      title: snapshot.data[j].name,
                      detail: snapshot.data[j].description,
                      time: '5 days ago',
                      exp: snapshot.data[j].end_recruit_date,
                      period: '${snapshot.data[j].start_date} - ${snapshot.data[j].end_date}',
                      seedCoin: snapshot.data[j].point.toString(),
                      campPoint: snapshot.data[j].point.toString(),
                      location: snapshot.data[j].z_id.toString(),
                      require: 'ผู้ผ่านกิจกรรมสตาฟ SEED ',
                      persons: snapshot.data[j].member_limit.toString(),
                    ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget declined() {
    return Expanded(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropMaterialHeader(
          backgroundColor: blueColor,
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: FutureBuilder(
          future: _getEvents(total_declined),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // print(" mm ${snapshot.data}");
            if (snapshot.data == null) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 235.w,
                child: Shimmer.fromColors(
                  baseColor: lightGreyColor,
                  highlightColor: lightGreyColor.withOpacity(0.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightGreyColor,
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    width: 65.w,
                    height: 60.w,
                  ),
                ),
              );
            } else {
              if (count == 0) {
                return empty();
              }
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  for (var j = 0; j < count; j++) ...[
                    StatusFormat(
                      e_id: snapshot.data[j].e_id,
                      status: snapshot.data[j].approve_status.toString(),
                      image: 'images/314892169_1151132685531547_2858263846283668721_n.jpeg',
                      title: snapshot.data[j].name,
                      detail: snapshot.data[j].description,
                      time: '5 days ago',
                      exp: snapshot.data[j].end_recruit_date,
                      period: '${snapshot.data[j].start_date} - ${snapshot.data[j].end_date}',
                      seedCoin: snapshot.data[j].point.toString(),
                      campPoint: snapshot.data[j].point.toString(),
                      location: snapshot.data[j].z_id.toString(),
                      require: 'ผู้ผ่านกิจกรรมสตาฟ SEED ',
                      persons: snapshot.data[j].member_limit.toString(),
                    ),
                  ],
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget empty() {
    return Center(
      child: FontFormat(text: 'ไม่มีข้อมูล'),
    );
  }
}
