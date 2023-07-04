import 'dart:async';

import 'package:flutter/material.dart';
import 'package:utcc_esport/src/Components/newstitle.dart';
import 'package:utcc_esport/src/constants/asset.dart';
import 'package:utcc_esport/src/widgets/user_competition_widget.dart';

import '../../models/article_model.dart';
import '../../services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  late Timer _timer;
  ApiService client = ApiService();
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPageIndex < 5) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                Asset.LOGO_IMAGE,
                scale: 7.2,
                alignment: Alignment.centerRight,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "E-SPORT",
                style: TextStyle(
                  color: Color(0xFFA31E21),
                  fontSize: 36,
                  fontFamily: 'Barlow',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          )
        ],
        backgroundColor: const Color(0xFF0C1629),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //_boxsearch(),
            _headnews(),
            _slidenews(),
            _competition(context),
            const UserCompetitionWidget(),
          ],
        ),
      ),
    );
  }

  Widget _slidenews() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.31,
      decoration: BoxDecoration(
        //color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.12), // สีของเงา (ในตัวอย่างใช้สีดำโปร่งๆ)
            blurRadius: 20, // รัศมีของเงา
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: FutureBuilder<List<Article>>(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            // แสดงรายการข่าวใน Slide หรือ PageView
            return PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              scrollDirection: Axis.horizontal,
              itemCount: articles?.length ?? 0,
              itemBuilder: (context, index) =>
                  Newtitle(articles![index], context),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  // Widget _boxsearch() {
  //   return Container(
  //     padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
  //     width: MediaQuery.of(context).size.width * 0.99, // ปรับค่าตามต้องการ
  //     height: MediaQuery.of(context).size.height * 0.09,
  //     child: TextField(
  //       decoration: InputDecoration(
  //         suffixIcon: const Icon(Icons.search),
  //         hintText: "ค้นหา",
  //         contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
  //         hintStyle: TextStyle(
  //           fontSize: MediaQuery.of(context).size.height * 0.024,
  //           fontFamily: 'Kanit',
  //         ),
  //         border: const OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(10))),
  //       ),
  //       onChanged: (value) {},
  //     ),
  //   );
  // }

  Widget _headnews() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Text(
            'ข่าวสาร',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.03,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 20, 0),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/news');
            },
            child: Text(
              'ดูทั้งหมด',
              style: TextStyle(
                color: const Color(0xFFA31E21),
                fontSize: MediaQuery.of(context).size.height * 0.020,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _competition(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  'รายการแข่งขัน',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'ดูทั้งหมด',
                    style: TextStyle(
                      color: const Color(0xFFA31E21),
                      fontSize: MediaQuery.of(context).size.height * 0.020,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _competition1(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.168,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color.fromARGB(
                255, 0, 0, 0), // เปลี่ยนสีเส้นรอบกรอบที่นี่
            width: 1, // กำหนดความหนาของเส้นรอบกรอบ
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Image.network(
                'https://mpics.mgronline.com/pics/Images/566000002053201.JPEG',
                width: MediaQuery.of(context).size.width * 0.38,
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 6, 10),
              width: MediaQuery.of(context).size.width * 0.49,
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: const BoxDecoration(
                //border: Border.all(color: const Color(0x99000000)),
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Text(
                      'Valorant Championship S2',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.037,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis, // เพิ่ม Overflow ที่นี่
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: MediaQuery.of(context).size.width * 0.48,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          width: MediaQuery.of(context).size.width * 0.046,
                          height: MediaQuery.of(context).size.height * 0.024,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffffffff),
                          ),
                          child: Icon(
                            Icons
                                .sports_esports_rounded, // สามารถเปลี่ยนเป็น Icon อื่นๆ ได้ตามต้องการ
                            color: const Color(0xFFA31E21), // สีของ Icon
                            size: MediaQuery.of(context).size.width *
                                0.05, // ขนาดของ Icon
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Valorant',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.037,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // เพิ่ม Overflow ที่นี่
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.02,
                          decoration: BoxDecoration(
                            color: const Color(0xffa31e21),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'FPS',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Row(
                      children: [
                        SizedBox(
                          child: Icon(
                            Icons.emoji_events, // เลือกไอคอนรูปถ้วยรางวัล
                            size: MediaQuery.of(context).size.width * 0.05,
                            color: const Color(0xffa31e21),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            '100,000 บาท',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.037,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w600,
                              //height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Icon(
                            Icons.person,
                            size: MediaQuery.of(context).size.width * 0.05,
                            color: const Color(0xffa31e21),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                          child: Text(
                            'เดี่ยว',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.037,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w600,
                              //height: 1.1,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 2, 0, 0),
                          width: MediaQuery.of(context).size.width * 0.059,
                          height: MediaQuery.of(context).size.height * 0.03,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffffffff),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(Asset.COIN_IMAGE),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              '900',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.037,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0,
                              0), // ปรับระยะห่างด้านซ้ายของปุ่ม "เติมเงิน"
                          width: MediaQuery.of(context).size.width * 0.14,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {},
                            child: Text(
                              'ดูเพิ่มเติม',
                              style: TextStyle(
                                color: const Color(0xFFA31E21),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.032,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
