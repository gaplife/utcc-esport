import 'package:flutter/material.dart';
import 'package:utcc_esport/src/constants/asset.dart';
import '../../widgets/widgets.dart';

class OrgHomePage extends StatefulWidget {
  const OrgHomePage({super.key});

  @override
  State<OrgHomePage> createState() => _OrgHomePageState();
}

class _OrgHomePageState extends State<OrgHomePage> {
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
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _boxsearch(),
            _competition(context),
            const CompetitionWidget(),
            _competition1(context),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/createcomp');
        },
        backgroundColor: const Color(0xFFA31E21),
        label: Text(
          "สร้างรายการแข่ง",
          style: TextStyle(
              fontFamily: 'Kanit',
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.w800),
        ),
        icon: Icon(
          Icons.sports_esports,
          size: MediaQuery.of(context).size.width * 0.08,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _boxsearch() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: MediaQuery.of(context).size.width * 0.99, // ปรับค่าตามต้องการ
      height: MediaQuery.of(context).size.height * 0.09,
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.search),
          hintText: "ค้นหา",
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          hintStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.024,
            fontFamily: 'Kanit',
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        onChanged: (value) {},
      ),
    );
  }
}

Widget _competition(BuildContext context) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                'รายการแข่งขันของฉัน',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
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
      margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.168,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color:
              const Color.fromARGB(255, 0, 0, 0), // เปลี่ยนสีเส้นรอบกรอบที่นี่
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
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(
                                'https://cdn3.vectorstock.com/i/1000x1000/37/87/valorant-game-logo-icon-eps-10-gaming-streamer-vector-33193787.jpg'),
                          ),
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
                            overflow:
                                TextOverflow.ellipsis, // เพิ่ม Overflow ที่นี่
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
                            fontSize: MediaQuery.of(context).size.width * 0.037,
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
                            fontSize: MediaQuery.of(context).size.width * 0.037,
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
                              color: const Color.fromARGB(255, 248, 0, 0),
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
