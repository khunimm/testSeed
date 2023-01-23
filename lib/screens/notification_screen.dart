// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:seed/components/color.dart';
import 'package:seed/components/font_format.dart';
import 'package:seed/components/notification_format.dart';

class NotificationScreen extends StatefulWidget {
  final ScrollController firstTabBarScrollController;

  NotificationScreen({
    Key? key,
    required this.firstTabBarScrollController,
  }) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

//รอ Backend ทำงานต่อ
class _NotificationScreenState extends State<NotificationScreen> with TickerProviderStateMixin {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    // _getPlayers();

    setState(() {});
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    // if(mounted)
    // setState(() {

    // });
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
            backgroundColor: whiteColor,
            automaticallyImplyLeading: false,
            shadowColor: bgGreyColor.withOpacity(0.5),
            title: FontFormat(
              text: 'แจ้งเตือน',
              weight: FontWeight.w600,
              textColor: greyColor,
              size: 20.w,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0.w, 16.w, 0),
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
                controller: widget.firstTabBarScrollController,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 18.w),
                      NotificationFormat(
                        status: 'ได้รับการอนุมัติ',
                        image: 'images/Screen Shot 2565-12-08 at 17.13.45.png',
                        title: 'เตรียมพบกันกิจกรรมหลังจากนี้จาก พี่ ๆ "SEED Train the trainer" พร้อมกันทั่วประเทศไทยเร็ว ๆ นี้',
                        detail:
                            "โอกาสนี้ เยาวชนเครือข่าย SEED Thailand ได้รายงานผลการดำเนินงานในท้องถิ่นต่อสมาชิกวุฒิสภา พร้อมเยี่ยมชมการประชุมวุฒิสภา ณ ห้องประชุมจันทรา อาคารรัฐสภา เเละเยี่ยมชมสัปปายะสภาสถาน พร้อมรับฟังการบรรยายสรุปจากเจ้าหน้าที่สำนักประชาสัมพันธ์ สำนักงานเลขาธิการวุฒิสภา ในวันที่ 7 ธันวาคมที่ผ่านมา สำหรับโครงการสัมมนาเชิงปฏิบัติการ SEED Train The Trainer รุ่นที่ 2 นั้นมีวัตถุประสงค์เพื่อพัฒนาศักยภาพเยาวชนระดับอุดมศึกษาให้เป็นวิทยากรรุ่นใหม่อย่างสร้างสรรค์ที่สามารถพัฒนาจนกลายเป็นต้นแบบที่ดีต่อเด็กและเยาวชนโดยทั่วไป และสนับสนุนให้สามารถเป็นวิทยากรในโครงการ Seed Project ระดับมัธยมศึกษาต่อไป รวมถึงเป็นการสร้างเครือข่ายเยาวชนคนรุ่นใหม่ให้มีจิตสำนึกรักและมีส่วนร่วมในการพัฒนาชุมชนหรือประเทศชาติอย่างสร้างสรรค์",
                        time: '5 days ago',
                        exp: '9 พฤศจิกายน 2565',
                        period: '7 ธันวาคม 2565',
                        seedCoin: '8,900',
                        campPoint: '25,900',
                        location: 'อาคาร ไอทาวเวอร์',
                        require: 'ผู้ผ่านค่ายSEED',
                        persons: '199',
                      ),
                      NotificationFormat(
                        title: '[SEED : เยาวชนไทยหัวใจอาสา ]',
                        time: '3 days ago',
                        exp: '10 ธันวาคม 2565',
                        campPoint: '10,000',
                        seedCoin: '10,000',
                        image: 'images/316670868_1161280734516742_7499660514032764876_n.jpeg',
                        persons: '20',
                        period: '23 พ.ย. 65',
                        location: 'โรงเรียน สุรศักดิ์ มนตรี',
                        require: 'ผู้ผ่านค่าสตาฟ SEED ',
                        detail:
                            'ในโครงการ SEED Digital Insight ภาคกลาง !! กลับมาแล้วกับโครงการ Digital Insight พี่สอนให้น้องรู่เท่าทันโลกออนไลน์ พบกับการบรรยายจากพี่ ๆ วิทยากรมืออาชีพจาก SEED ภาคกลาง ในหัวข้อมากมายทั้ง Digital Literacy, ภัยคุกคามบนโลกออนไลน์, Soft power of Thailand รวมถึงกิจกรรมละลายพฤติกรรมอื่น ๆ ที่สนุกสนานอย่างแน่นอน พบกันในวันที่ 23 พฤศจิกายน 2565 นี้ เวลา 08.30 - 16.30 น. ณ โรงเรียน สุรศักดิ์ มนตรี และ วันที่ 27 พฤศจิกายน 2565 ในรูปแบบออนไลน์ เตรียมพร้อมรับความสนุกกันได้เลย!',
                      ),
                      NotificationFormat(
                        status: 'ได้รับการอนุมัติ',
                        image: 'images/298513881_1086460778665405_7000550569760405541_n.png',
                        title: 'กลับมาอีกครั้งกับโครงการ SEED Project ปี 2 !!',
                        detail:
                            "📌 เปิดรับสมัครเยาวชนระดับอุดมศึกษาเข้าร่วมโครงการ SEED Project ปี2 ในหัวข้อ “การสร้างผู้นำยุคใหม่ กล้าที่จะเปลี่ยนแปลงท้องถิ่นอย่างสร้างสรรค์” พบกับกิจกรรมสุดพิเศษ ทั้งการบรรยายพิเศษจากผู้เชี่ยวชาญ กิจกรรม workshop พัฒนาท้องถิ่น และกิจกรรมอื่น ๆ ในโครงการอีกมากมาย 📅 กำหนดการ 🔹รุ่น 1 ภาคกลาง ตะวันออกและตะวันตก วันที่ 7-10 กรกฎาคม 2565 ณ กรุงเทพมหานคร 🔹รุ่น 2 ภาคตะวันออกเฉียงเหนือ วันที่ 17-20 กันยายน 2565 ณ ขอนแก่น 🔹รุ่น 3 ภาคใต้ วันที่ 8-11 กันยายน 2565 ณ สงขลา 🔹รุ่น 4 ภาคเหนือ วันที่ 29 กันยายน - 2 ตุลาคม 2565 ณ เชียงใหม่ ใครสนใจสามารถสมัครได้ที่ https://www.seed-thailand.com/register-camp โดยทางโครงการจะประกาศรายชื่อผู้ผ่านการคัดเลือกทั้ง 80 คน ของแต่ละภาค ทางเพจ SEED Thailand เท่านั้น อย่าช้า! โอกาสที่จะได้ร่วมเป็นเยาวชน SEED Thailand แตกหน่อพันธ์ุดี ไม่มีที่สิ้นสุด!",
                        time: '5 days ago',
                        exp: '14 มิถุนายน 2565',
                        period: 'ตามที่กำหนดในโครงการ',
                        seedCoin: '8,900',
                        campPoint: '25,900',
                        location: 'ตามที่กำหนดในโครงการ',
                        require: 'ผู้ผ่านค่ายSEED',
                        persons: '80',
                      ),
                      NotificationFormat(
                        title: 'กสทช. X SEED THAILAND',
                        time: '3 days ago',
                        exp: '10 ธันวาคม 2565',
                        campPoint: '10,000',
                        seedCoin: '10,000',
                        image: 'images/317803664_1168069123837903_6794092330236793316_n.jpeg',
                        persons: '20',
                        period: '8 ธ.ค. 65 - 10 ธ.ค. 65',
                        location: 'กรุงเทพมหานคร',
                        require: 'ผู้ผ่านค่าสตาฟ SEED ',
                        detail:
                            '📣ปลุกพลังคนรุ่นใหม่ สร้างสรรค์โลกดิจิทัล กับกิจกรรม DIGITAL YOUTH NETWORK THAILAND เยาวชนอาสาดิจิทัล ซึ่งเป็นส่วนหนึ่งในโครงการ HACKaTHAILAND 2023 : DIGITAL INFINITY . 📱กิจกรรมที่จะช่วยส่งต่อแนวคิด Digital Literacy เสริมสร้างเกราะป้องกันให้กับเยาวชน นักเรียน นักศึกษา พร้อมก้าวสู่การเป็นผู้นำเยาวชนในโลกดิจิทัล ในหลักสูตร DIGITAL YOUTH NETWORK THAILAND เยาวชนอาสาดิจิทัล . 💻โดยหลักสูตรในรอบ DIGITAL TRAINER มีวิทยากรที่มาร่วมถ่ายทอดองค์ความรู้ แชร์ประสบการณ์ พร้อมเสริมสร้างทักษะในการปรับตัวบนโลกดิจิทัล อาทิ Introduction to Digital Youth Network, Digital Skill and Knowledge, 21st-Century Opportunity, Youth Leader New Gen และอื่น ๆ อีกมายมาย . ✏️เปิดรับสมัคร วันนี้ – 10 ธันวาคม 2565 คลิกไปที่ https://forms.gle/g555mMnpTtRYXiic8 🌟ประกาศผลวันที่ 12 ธันวาคม 2565 (เพียง 50 คน เท่านั้น!) . โดยผู้ที่ผ่านการคัดเลือกจะต้องเข้ารับการอบรมเป็นเวลา 3 วัน 2 คืน ในพื้นที่กรุงเทพมหานคร ระหว่างวันที่ 22-24 ธันวาคม 2565 ติดต่อสอบถามเพิ่มเติมทีมงาน SEED Thailand 0958158305',
                      ),
                      NotificationFormat(
                        title: 'เรื่องเราบ้านเรา ของดีบ้านเรา ณ จังหวัดเชียงราย',
                        time: '5 days ago',
                        period: '7 ธันวาคม 2565',
                        image: 'images/Screen Shot 2565-12-08 at 13.10-1.png',
                        detail: "อธิบดีกรมการข้าวมีอะไรฝากถึงเยาวชนในเรื่องการใช้เทคโนโลยีประยุกต์ใช้กับการเกษตร เพื่อพัฒนาของดีในบ้านเกิดของเรา",
                      ),
                      NotificationFormat(
                        title: 'เรื่องเล่าบ้านเรา ของดีบ้านเรา ที่เชียงราย',
                        time: '5 days ago',
                        period: '7 ธันวาคม 2565',
                        image: 'images/Screen Shot 2565-12-08 at 13.10.png',
                        detail:
                            "SEED Thailand พาไปรู้จักพันธ์ข้าวเชียงราย หลายคนอาจไม่เคยทราบว่าเชียงรายมีพันธุ์ข้าวที่ปลูกได้ที่แค่จังหวัดเชียงรายเท่านั้น โดยจะเป็นพันธุ์ข้าวไหน ลักษณะพิเศษเป็นอย่างไร มาชมกันได้เลย",
                      ),
                      NotificationFormat(
                        title: 'SEED Thailand พาไปรู้จัก “ปลากุเลาเค็มตากใบ',
                        time: '5 days ago',
                        period: '7 ธันวาคม 2565',
                        image: 'images/Screen Shot 2565-12-08 at 13.16.png',
                        detail:
                            "SEED Thailand พาไปรู้จัก “ปลากุเลาเค็มตากใบ” เจ้าของฉายา “ราชาแห่งปลาเค็ม” กับ เชฟชุมพล คนไทยที่ยกระดับอาหารไทยโดยการนำเอาปลากุเลาเค็มตากใบ จังหวัด นราธิวาส มาเสริฟ์ให้ผู้นำ APEC 2022 ได้ลิ้มรส แล้วได้รับเสียงชื่นชมมากมายจนเกิดกระแสคนไทยช่วยอุดหนุนปลากุเลา โดยเชฟชุมพลนั้นได้กล่าวถึงปลากุเลาของนราธิวาสไว้ว่า “หากปลากุเลาเค็มของเรา มีการพัฒนา ทำแบรนด์ดีๆ เชื่อว่าสู้เอนโชวี่ของอิตาลีได้สบาย”",
                      ),
                      NotificationFormat(
                        title: 'SEED Thailand พาชมงาน  ไทยแลนด์ 4.0 ประเทศไทยไปไกลกว่าที่คิด',
                        time: '5 days ago',
                        period: '7 ธันวาคม 2565',
                        image: 'images/Screen Shot 2565-12-08 at 13.17.png',
                        detail:
                            "SEED Thailand พาชมงาน  ไทยแลนด์ 4.0 ประเทศไทยไปไกลกว่าที่คิด เยาวชนร่วมแข่ง Rov สุดมันส์ ชิงเงินรางวัลกว่า 200,000 บาท บรรยากาศภายในงานมีอะไรบ้าง งานนี้เยาวชนมาทำอะไรกันมาดูกันเลย",
                      ),
                      NotificationFormat(
                        title: 'SEED Thailand REPORTER กับ จิรายุส ทรัพย์ศรีโสภา',
                        time: '5 days ago',
                        period: '7 ธันวาคม 2565',
                        image: 'images/Screen Shot 2565-12-08 at 13.21 1.png',
                        detail:
                            "SEED Thailand REPORTER กับ จิรายุส ทรัพย์ศรีโสภา ประธานเจ้าหน้าที่บริหาร บริษัท บิทคับ แคปปิตอล กรุ๊ป โฮลดิ้งส์ จำกัด พี่ท็อป Bitkub ฝากถึงเยาวชน 'เก็บเงินสด เก็บเงิดสด เก็บเงินสด' พร้อมทั้งให้แนวทางการเตรียมตัวกับสถานการณ์โลกในอนาคต มีประเด็นไหนน่าสนใจบ้าง มารับชมกันได้เลย",
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
