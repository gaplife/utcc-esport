import 'package:flutter/material.dart';
import 'package:utcc_esport/src/constants/asset.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        //centerTitle: const EdgeInsets.all(10),
        backgroundColor: const Color(0xFF0C1629),
        elevation: 0,
      ),
      body: ListView(children: [
        Center(
          child: Column(
            children: <Widget>[
              //_boxsearch(),
              _news(),
              _competition(context),
              _competition1(context),
            ],
          ),
        ),
      ]),
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
          contentPadding: const EdgeInsets.all(5),
          hintStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.02,
            fontFamily: 'Barlow',
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(13))),
        ),
        onChanged: (value) {},
      ),
    );
  }

  Widget _news() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Text(
                'ข่าวสาร',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 20, 0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'ดูทั้งหมด',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 253, 2, 2),
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://mpics.mgronline.com/pics/Images/565000007949201.JPEG',
              ),
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Text(
                      'ทีมไทย Vampire Esports คว้าแชมป์โลก PUBG MOBILE รับเงินรางวัล 18 ล้าน!',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontFamily: 'Barlow',
                        fontWeight: FontWeight.w800,
                      ),
                      overflow: TextOverflow.ellipsis, // เพิ่ม Overflow ที่นี่
                      maxLines: 2,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.035,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffa31e21),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {},
                        child: Text(
                          'อ่านเพิ่มเติม',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
                            fontFamily: 'Barlow',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
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
                  'รายการแข่งขัน',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontFamily: 'Barlow',
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
                      color: const Color.fromARGB(255, 253, 2, 2),
                      fontSize: MediaQuery.of(context).size.height * 0.023,
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.165,
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
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Image.network(
                  'https://mpics.mgronline.com/pics/Images/566000004575901.JPEG',
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        height: MediaQuery.of(context).size.height * 0.03,
                        child: Text(
                          'FIFA Champion Club SS1',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.037,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.w600,
                          ),
                          overflow:
                              TextOverflow.ellipsis, // เพิ่ม Overflow ที่นี่
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
                                      'https://scontent.fbkk22-2.fna.fbcdn.net/v/t1.6435-9/42195217_1155168591316184_8245855647996837888_n.png?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGJ0Gu6chQ4tG_lG0FLq-3YAAGwZ_E8HkYAAbBn8TweRgTNNkou7p7Xo5-GL1NGE5eNhKLRvLJUh-Du21dB0msY&_nc_ohc=ZQRStCOETRkAX8ebUrU&_nc_ht=scontent.fbkk22-2.fna&oh=00_AfCt6oonE4TuMBY8l0Ync0n_tendIjIIYnDG6M6lVjxOcw&oe=649D9725'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'FIFA Online 4',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.037,
                                    fontFamily: 'Barlow',
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
                                  'SPORT',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.037,
                                    fontFamily: 'Barlow',
                                    fontWeight: FontWeight.w800,
                                    height: 1,
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
                                '110,000 บาท',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.037,
                                  fontFamily: 'Barlow',
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
                                  fontFamily: 'Barlow',
                                  fontWeight: FontWeight.w600,
                                  //height: 1.1,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                              height: MediaQuery.of(context).size.height * 0.03,
                              child: Icon(
                                Icons
                                    .monetization_on_outlined, // เลือกไอคอนรูปถ้วยรางวัล
                                size: MediaQuery.of(context).size.width * 0.05,
                                color: const Color(0xffa31e21),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Text(
                                  '500',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.037,
                                    fontFamily: 'Barlow',
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
                                        MediaQuery.of(context).size.width * 0.034,
                                    fontFamily: 'Barlow',
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
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _competition1(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.165,
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
            child: SingleChildScrollView(
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
                                fontFamily: 'Barlow',
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
                                    MediaQuery.of(context).size.width * 0.037,
                                fontFamily: 'Barlow',
                                fontWeight: FontWeight.w800,
                                height: 1,
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
                              fontFamily: 'Barlow',
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
                            'ทีม',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.037,
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w600,
                              //height: 1.1,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: Icon(
                            Icons
                                .monetization_on_outlined, // เลือกไอคอนรูปถ้วยรางวัล
                            size: MediaQuery.of(context).size.width * 0.05,
                            color: const Color(0xffa31e21),
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
                                fontFamily: 'Barlow',
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
                                    MediaQuery.of(context).size.width * 0.034,
                                fontFamily: 'Barlow',
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
          ),
        ]),
      ),
    );
  }
}
