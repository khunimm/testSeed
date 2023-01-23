// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:seed/components/bottom_menu.dart';
import 'package:seed/components/class/user.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';
import 'package:shimmer/shimmer.dart';
import '../components/api/api_global.dart' as api_global;

class Rank extends StatefulWidget {
  Rank({Key? key}) : super(key: key);

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  String rank = 'อันดับภาค';

  int count = 0;

  String url_rank = api_global.url + '/seedmembers/mobile/myRank/';

  int tet = 0;

  String ranking = '';

  List<User> my_data_ranks = [];

  // List<User> dumpDataRank = [];

  Future<List<User>> _getMyData() async {
    final body = ({"s_id": api_global.box.read("s_id"), "z_id": api_global.box.read("z_id")});

    var dio = Dio();
    var data = await dio.get(url_rank, queryParameters: body);
    var jsonData = data.data;

    //section blue card
    User user_inLoop = User();

    user_inLoop.first_name_th = jsonData['myRank']['first_name_th'];
    user_inLoop.score_rank = jsonData['myRank']['score_rank'];

    my_data_ranks.add(user_inLoop);

    return my_data_ranks;
  }

  Future<List<User>> _getTopRegion() async {
    final body = ({"s_id": api_global.box.read("s_id"), "z_id": api_global.box.read("z_id")});

    var dio = Dio();
    var data = await dio.get(url_rank, queryParameters: body);
    var jsonData = data.data;

    List<User> data_ranks = [];

    if (rank == 'อันดับภาค') {
      count = jsonData['topTenZone'].length;
      // print(count_url_news);

      for (var i in jsonData['topTenZone']) {
        User ranks_inLoop = User();

        ranks_inLoop.first_name_th = i['first_name_th'];
        ranks_inLoop.score_rank = i['score_rank'];
        ranks_inLoop.s_id = i['s_id'];

        data_ranks.add(ranks_inLoop);
      }
    } else {
      count = jsonData['topTenRegion'].length;
      // print(count_url_news);

      for (var i in jsonData['topTenRegion']) {
        User ranks_inLoop = User();

        ranks_inLoop.first_name_th = i['first_name_th'];
        ranks_inLoop.score_rank = i['score_rank'];
        ranks_inLoop.s_id = i['s_id'];

        data_ranks.add(ranks_inLoop);
      }
    }

    ranking = _getRankZone(data_ranks);

    return data_ranks;
  }

  String _getRankZone(List<User> dump) {
    String in_loop = '';
    for (var i in dump) {
      if (api_global.box.read("s_id") == i.s_id.toString()) {
        in_loop = (dump.indexOf(i) + 1).toString();
        break;
      } else {
        in_loop = 'ไม่มี';
      }
    }
    return in_loop;
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    //dumpDataRank.clear();
    my_data_ranks.clear();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    //dumpDataRank.clear();
    my_data_ranks.clear();
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()

    //dumpDataRank.clear();
    my_data_ranks.clear();

    setState(() {});
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

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
              padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
              child: FutureBuilder(
                future: Future.wait([
                  _getMyData(), //Future that returns bool
                  _getTopRegion(), //Future that returns bool
                ]),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.data == null) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 115.w,
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
                          SizedBox(
                            height: 15.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 100.w,
                                height: 40.w,
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
                              SizedBox(
                                width: 100.w,
                                height: 40.w,
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
                            ],
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          for (var j = 0; j < 5; j++)
                            Padding(
                              padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 5.w),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 25.w,
                                    height: 25.w,
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
                                  SizedBox(width: 10.w),
                                  SizedBox(
                                    width: 50.w,
                                    height: 50.w,
                                    child: Shimmer.fromColors(
                                      baseColor: lightGreyColor,
                                      highlightColor: lightGreyColor.withOpacity(0.5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: lightGreyColor,
                                          borderRadius: BorderRadius.circular(50.w),
                                        ),
                                        width: 65.w,
                                        height: 60.w,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  SizedBox(
                                    width: 130.w,
                                    height: 25.w,
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
                                  Spacer(),
                                  SizedBox(
                                    width: 70.w,
                                    height: 25.w,
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
                                ],
                              ),
                            ),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        for (var j = 0; j < 1; j++) ...[
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
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        // width: 100.w,
                                        child: Column(
                                          children: [
                                            FontFormat(
                                              text: 'อันดับ',
                                              textColor: yellowColor,
                                            ),
                                            SizedBox(height: 5.w),
                                            FontFormat(
                                              text: ranking,
                                              weight: FontWeight.w600,
                                              textColor: whiteColor,
                                              size: 22.w,
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        // width: 80.w,
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
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        // width: 100.w,
                                        child: Column(
                                          children: [
                                            FontFormat(
                                              text: 'คะแนน',
                                              textColor: yellowColor,
                                            ),
                                            SizedBox(height: 5.w),
                                            FontFormat(
                                              text: my_data_ranks.isEmpty ? "" : snapshot.data[0][j].score_rank.toString(),
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
                                    text: my_data_ranks.isEmpty ? "" : snapshot.data[0][j].first_name_th,
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
                                    //dumpDataRank.clear();
                                    my_data_ranks.clear();
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
                                    //dumpDataRank.clear();
                                    my_data_ranks.clear();

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
                              height: MediaQuery.of(context).size.height,
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
                              child: rank == 'อันดับภาค' ? top50Rank(snapshot.data[1]) : top50Rank(snapshot.data[1]),
                            ),
                          ),
                          SizedBox(height: 70.w),
                        ],
                      ],
                    );
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomMenu(
                icon: Iconsax.gift,
                title: 'รับของรางวัล',
                function: () {
                  // print(dumpDataRank.length);
                  Navigator.pushNamed(context, '/reward');
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget top50Rank(List<User> result) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      header: WaterDropMaterialHeader(
        backgroundColor: blueColor,
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      // onLoading: _onLoading,
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              for (var j = 0; j < count; j++)
                Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 20.w),
                  child: Row(
                    children: [
                      if (j == 0) ...[
                        SizedBox(
                          width: 30.w,
                          child: Center(
                            child: Image.asset(
                              'images/Group 289.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ] else if (j == 1) ...[
                        SizedBox(
                          width: 30.w,
                          child: Center(
                            child: Image.asset(
                              'images/Group 290.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ] else if (j == 2) ...[
                        SizedBox(
                          width: 30.w,
                          child: Center(
                            child: Image.asset(
                              'images/Group 291.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ] else ...[
                        SizedBox(
                          width: 30.w,
                          child: Center(
                            child: FontFormat(
                              text: '${j + 1}',
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
                        text: result[j].first_name_th,
                        textColor: blueColor,
                        size: 14.w,
                      ),
                      Spacer(),
                      FontFormat(
                        text: result[j].score_rank.toString(),
                        textColor: blueColor,
                        size: 16.w,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
