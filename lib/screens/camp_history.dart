// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_interpolation_to_compose_strings, curly_braces_in_flow_control_structures

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/camp_format.dart';
import 'package:seed/components/class/events.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';
import 'package:shimmer/shimmer.dart';
import '../components/api/api_global.dart' as api_global;

class CampHistory extends StatefulWidget {
  CampHistory({Key? key}) : super(key: key);

  @override
  State<CampHistory> createState() => _CampHistoryState();
}

class _CampHistoryState extends State<CampHistory> {
  bool page = true;
  int? e_id = 0;
  int count = 0;
  int total_success = 4;

  String url_register_events_checkPending = api_global.url + '/regisEvents/mobile/register/checkStatus';

  Future<List<Events>> _getEvents() async {
    final body = ({
      "s_id": api_global.box.read('s_id'),
      "approve_status": 3,
      "e_id": e_id,
      "limit": total_success,
    });

    var dio = Dio();
    var data = await dio.get(url_register_events_checkPending, queryParameters: body);
    var jsonData = data.data;
    // print(jsonData['result']);

    List<Events> data_events = [];
    count = jsonData['data'].length;
    // print(count);
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
    total_success = 4;

    // _getPlayers();

    setState(() {});
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    if (mounted)
      setState(() {
        total_success += 2;
      });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: bgGreyColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: whiteColor,
            shadowColor: bgGreyColor.withOpacity(0.5),
            title: FontFormat(
              text: 'ประวัติการเข้าร่วมกิจกรรม',
              weight: FontWeight.w600,
              textColor: greyColor,
              size: 20.w,
            ),
          ),
          body: Stack(
            children: [
              SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: WaterDropMaterialHeader(
                  backgroundColor: blueColor,
                ),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: FutureBuilder(
                  future: _getEvents(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data == null) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(16.w, 18.w, 16.w, 0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 135.w,
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
                            ),
                          );
                        },
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 18.w, 16.w, 0),
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            for (var j = 0; j < count; j++) ...[
                              CampFormat(
                                e_id: snapshot.data[j].e_id,
                                statusComplete: snapshot.data[j].approve_status.toString(),
                                title: snapshot.data[j].name,
                                image: 'images/Screen Shot 2565-12-08 at 17.13.45.png',
                                persons: snapshot.data[j].member_limit.toString(),
                                period: '${snapshot.data[j].start_date} - ${snapshot.data[j].end_date}',
                                location: snapshot.data[j].z_id.toString(),
                                campPoint: snapshot.data[j].point.toString(),
                                seedCoin: snapshot.data[j].point.toString(),
                                require: 'ผู้ผ่านกิจกรรมสตาฟ SEED ',
                                detail: snapshot.data[j].description,
                              ),
                            ],
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              BottomMenu(
                titleCallBack: 'ย้อนกลับ',
              ),
            ],
          ),
        );
      },
    );
  }
}
