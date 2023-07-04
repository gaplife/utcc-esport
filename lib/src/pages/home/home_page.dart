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
        backgroundColor: const Color(0xFF0C1629),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _headnews(),
            _slidenews(),
            _competition(context),
            const UserCompetitionWidget(hg: 245),
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
              // Container(
              //   margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              //   child: TextButton(
              //     onPressed: () {
              //       Navigator.push(context, MaterialPageRoute(builder: (context) {
              //         return const Allcompetition();
              //       }));
              //     },
              //     child: Text(
              //       'ดูทั้งหมด',
              //       style: TextStyle(
              //         color: const Color(0xFFA31E21),
              //         fontSize: MediaQuery.of(context).size.height * 0.020,
              //         fontFamily: 'Kanit',
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ],
    );
  }
}
