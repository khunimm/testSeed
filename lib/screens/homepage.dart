// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:seed/components/button_category.dart';
import 'package:seed/components/camp_format.dart';
import 'package:seed/components/class/events.dart';
import 'package:seed/components/class/news.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';
import 'package:seed/components/news_format.dart';
import 'package:shimmer/shimmer.dart';
import '../components/api/api_global.dart' as api_global;

class HomePage extends StatefulWidget {
  final ScrollController firstTabBarScrollController;

  HomePage({
    Key? key,
    required this.firstTabBarScrollController,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

@override
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  bool page = true;

  String url_news = api_global.url + '/news/mobile';
  String url_events = api_global.url + '/events/mobile';

  int count_url_news = 0;
  int limit_view_news = 2;

  int count_url_events = 0;
  int limit_view_events = 3;

  Future<List<News>> _getNews() async {
    final body = ({"total": limit_view_news});

    var dio = Dio();
    var data = await dio.get(url_news, queryParameters: body);
    var jsonData = data.data;
    // print(jsonData['result']);

    List<News> data_news = [];
    count_url_news = jsonData['result'].length;
    // print(count_url_news);

    for (var i in jsonData['result']) {
      News news_inLoop = News();

      news_inLoop.n_id = i['n_id'];
      news_inLoop.name = i['name'];
      news_inLoop.img = i['img'];
      news_inLoop.description = i['description'];

      data_news.add(news_inLoop);
    }

    return data_news;
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();

    if (page) {
      limit_view_news = 2;
    } else {
      limit_view_events = 3;
    }

    setState(() {});
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    if (mounted) {
      if (page) {
        setState(() {
          limit_view_news += 2;
        });
      } else {
        setState(() {
          limit_view_events += 3;
        });
      }
    }
    // ignore: curly_braces_in_flow_control_structures

    _refreshController.loadComplete();
  }

  Future<List<Events>> _getEvents() async {
    final body = ({"total": limit_view_events, "s_id": api_global.box.read("s_id")});

    var dio = Dio();
    var data = await dio.get(url_events, queryParameters: body);
    var jsonData = data.data;
    // print(jsonData['result']);

    List<Events> data_events = [];
    count_url_events = jsonData['result'].length;
    // print(count_url_events);
    // print(jsonData['result']);

    for (var i in jsonData['result']) {
      Events events_inLoop = Events();

      events_inLoop.e_id = i['e_id'];
      events_inLoop.name = i['name'];
      events_inLoop.img = i['img'];
      events_inLoop.point = i['point'];
      events_inLoop.start_recruit_date = api_global.formatter.format(DateTime.parse(i['start_recruit_date']));
      events_inLoop.end_recruit_date = api_global.formatter.format(DateTime.parse(i['end_recruit_date']));
      events_inLoop.member_limit = i['member_limit'];
      events_inLoop.start_date = api_global.formatter.format(DateTime.parse(i['start_date']));
      events_inLoop.end_date = api_global.formatter.format(DateTime.parse(i['end_date']));
      events_inLoop.description = i['description'];
      // events_inLoop.approve_status = i['approve_status'];

      // print(DateTime.parse("${events_inLoop.end_recruit_date}"));

      data_events.add(events_inLoop);
    }

    return data_events;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: whiteColor,
        shadowColor: bgGreyColor.withOpacity(0.5),
        title: FontFormat(
          text: 'SEED',
          weight: FontWeight.bold,
          size: 30.w,
          textColor: blackColor,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 18.w, 0, 18.w),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          page = true;
                        });
                      },
                      child: page == true
                          ? ButtonCategory(
                              bgColor: blueColor,
                              image: 'images/news.png',
                              imagesColor: whiteColor,
                              title: 'ข่าว SEED',
                              titleColor: whiteColor,
                            )
                          : ButtonCategory(
                              bgColor: whiteColor,
                              image: 'images/news.png',
                              imagesColor: blackColor,
                              title: 'ข่าว SEED',
                              titleColor: blackColor,
                            ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          page = false;
                        });
                      },
                      child: page == false
                          ? ButtonCategory(
                              bgColor: blueColor,
                              image: 'images/camp.png',
                              imagesColor: whiteColor,
                              title: 'กิจกรรม SEED',
                              titleColor: whiteColor,
                            )
                          : ButtonCategory(
                              bgColor: whiteColor,
                              image: 'images/camp.png',
                              imagesColor: blackColor,
                              title: 'กิจกรรม SEED',
                              titleColor: blackColor,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 15.w),
            if (page == true) ...[
              news(),
            ] else ...[
              camp(),
            ],
          ],
        ),
      ),
    );
  }

  Widget news() {
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
        child: ListView(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          controller: widget.firstTabBarScrollController,
          children: [
            FutureBuilder(
              future: _getNews(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'images/point_down.png',
                            width: 20.w,
                            height: 20.w,
                          ),
                          SizedBox(width: 20.w),
                          FontFormat(
                            text: 'ข่าวสาร',
                            weight: FontWeight.w600,
                            size: 20.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      for (var j = 0; j < count_url_news; j++) ...[
                        NewsFormat(
                          title: snapshot.data[j].name,
                          time: '5 days ago',
                          // period: '7 ธันวาคม 2565',
                          image: 'images/Screen Shot 2565-12-08 at 13.10-1.png',
                          detail: snapshot.data[j].description,
                        ),
                      ]
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget camp() {
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
        child: ListView(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          controller: widget.firstTabBarScrollController,
          children: [
            FutureBuilder(
              future: _getEvents(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'images/point_down.png',
                            width: 20.w,
                            height: 20.w,
                          ),
                          SizedBox(width: 20.w),
                          FontFormat(
                            text: 'กิจกรรม',
                            weight: FontWeight.w600,
                            size: 20.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      for (var j = 0; j < count_url_events; j++)
                        CampFormat(
                          e_id: snapshot.data[j].e_id,
                          title: snapshot.data[j].name,
                          time: '3 days ago',
                          exp: snapshot.data[j].end_recruit_date,
                          campPoint: snapshot.data[j].point.toString(),
                          seedCoin: snapshot.data[j].point.toString(),
                          image: 'images/317803664_1168069123837903_6794092330236793316_n.jpeg',
                          persons: snapshot.data[j].member_limit.toString(),
                          period: '${snapshot.data[j].start_date} - ${snapshot.data[j].end_date}',
                          location: snapshot.data[j].z_id.toString(),
                          require: 'ผู้ผ่านกิจกรรมสตาฟ SEED ',
                          detail: snapshot.data[j].description,
                        ),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
