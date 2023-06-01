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
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
        //centerTitle: const EdgeInsets.all(10),
        backgroundColor: const Color(0xFF0C1629),
        elevation: 0,
      ),
      body: ListView(children: [
        Column(
          children: <Widget>[
            _boxsearch(),
            _news(),
            _competition(),
            _competition1(),
          ],
        ),
      ]),
    );
  }

  Widget _boxsearch() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: double.infinity, // ปรับค่าตามต้องการ
      height: 75,
      child: TextField(
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.search),
          hintText: "ค้นหา",
          border: OutlineInputBorder(
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
              margin: const EdgeInsets.fromLTRB(25, 0, 20, 0),
              child: const Text(
                'ข่าวสาร',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(width: 160),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'ดูทั้งหมด',
                  style: TextStyle(
                    color: Color.fromARGB(255, 253, 2, 2),
                    fontSize: 20,
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: 370,
          height: 220,
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
              const Positioned(
                left: 22.55,
                top: 120,
                child: Align(
                  child: SizedBox(
                    width: 300,
                    height: 125,
                    child: Text(
                      'ทีมไทย Vampire Esports คว้าแชมป์โลก PUBG MOBILE รับเงินรางวัล 18 ล้าน!',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15,
                        fontFamily: 'Barlow',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 168,
                child: Container(
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffa31e21),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'อ่านเพิ่มเติม',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Barlow',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _competition() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(25, 5, 30, 0),
              child: const Text(
                'รายการแข่งขัน',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(width: 75),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'ดูทั้งหมด',
                  style: TextStyle(
                    color: Color.fromARGB(255, 253, 2, 2),
                    fontSize: 20,
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            //color: const Color.fromARGB(255, 250, 250, 250),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromARGB(
                  255, 0, 0, 0), // เปลี่ยนสีเส้นรอบกรอบที่นี่
              width: 1, // กำหนดความหนาของเส้นรอบกรอบ
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Image.network(
                  'https://mpics.mgronline.com/pics/Images/566000004575901.JPEG',
                  width: 155,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: 214,
                height: 130,
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
                      margin: const EdgeInsets.fromLTRB(12, 10, 0, 8),
                      child: const Text(
                        'FIFA Champion Club',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                      width: 204,
                      height: 20,
                      child: Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffffffff),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      'https://scontent.fbkk22-2.fna.fbcdn.net/v/t1.6435-9/42195217_1155168591316184_8245855647996837888_n.png?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGJ0Gu6chQ4tG_lG0FLq-3YAAGwZ_E8HkYAAbBn8TweRgTNNkou7p7Xo5-GL1NGE5eNhKLRvLJUh-Du21dB0msY&_nc_ohc=ZQRStCOETRkAX8ebUrU&_nc_ht=scontent.fbkk22-2.fna&oh=00_AfCt6oonE4TuMBY8l0Ync0n_tendIjIIYnDG6M6lVjxOcw&oe=649D9725',
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'FIFA Online 4',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Barlow',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              width: 60,
                              height: 19,
                              decoration: BoxDecoration(
                                color: const Color(0xffa31e21),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  'SPORT',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Barlow',
                                    fontWeight: FontWeight.w800,
                                    height: 1,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 8),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            child: Icon(
                              Icons.emoji_events, // เลือกไอคอนรูปถ้วยรางวัล
                              size: 20,
                              color: Color(0xffa31e21),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: const Text(
                              '110,000 บาท',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Barlow',
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      width: double.infinity,
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: const Icon(
                              Icons.person,
                              size: 20,
                              color: Color(0xffa31e21),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: const Text(
                              'เดี่ยว',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Barlow',
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: const Icon(
                              Icons
                                  .monetization_on_outlined, // เลือกไอคอนรูปถ้วยรางวัล
                              size: 20,
                              color: Color(0xffa31e21),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: const Text(
                                  '500',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Barlow',
                                    fontWeight: FontWeight.w600,
                                    //height: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //const Spacer(),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0,
                                0), // ปรับระยะห่างด้านซ้ายของปุ่ม "เติมเงิน"
                            width: 60,
                            height: 20,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {},
                              child: const Text(
                                'ดูเพิ่มเติม',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 248, 0, 0),
                                  fontSize: 13,
                                  fontFamily: 'Barlow',
                                  fontWeight: FontWeight.w600,
                                  height: 1,
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
        )
      ],
    );
  }

  Widget _competition1() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        //color: const Color.fromARGB(255, 250, 250, 250),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color:
              const Color.fromARGB(255, 0, 0, 0), // เปลี่ยนสีเส้นรอบกรอบที่นี่
          width: 1, // กำหนดความหนาของเส้นรอบกรอบ
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Image.network(
              'https://mpics.mgronline.com/pics/Images/566000002053201.JPEG',
              width: 155,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: 214,
            height: 130,
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
                  margin: const EdgeInsets.fromLTRB(12, 10, 0, 8),
                  child: const Text(
                    'Valorant Championship S2',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  width: 204,
                  height: 20,
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffffffff),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://cdn3.vectorstock.com/i/1000x1000/37/87/valorant-game-logo-icon-eps-10-gaming-streamer-vector-33193787.jpg',
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Valorant',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          width: 60,
                          height: 18,
                          decoration: BoxDecoration(
                            color: const Color(0xffa31e21),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'FPS',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Barlow',
                                fontWeight: FontWeight.w800,
                                height: 1,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 8),
                  width: double.infinity,
                  child: Row(
                    children: [
                      const SizedBox(
                        child: Icon(
                          Icons.emoji_events, // เลือกไอคอนรูปถ้วยรางวัล
                          size: 20,
                          color: Color(0xffa31e21),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: const Text(
                          '100,000 บาท',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Barlow',
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  width: double.infinity,
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: const Icon(
                          Icons.person,
                          size: 20,
                          color: Color(0xffa31e21),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: const Text(
                          'ทีม',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Barlow',
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: const Icon(
                          Icons
                              .monetization_on_outlined, // เลือกไอคอนรูปถ้วยรางวัล
                          size: 20,
                          color: Color(0xffa31e21),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: const Text(
                              '900',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Barlow',
                                fontWeight: FontWeight.w600,
                                //height: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0,
                            0), // ปรับระยะห่างด้านซ้ายของปุ่ม "เติมเงิน"
                        width: 60,
                        height: 20,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'ดูเพิ่มเติม',
                            style: TextStyle(
                              color: Color.fromARGB(255, 248, 0, 0),
                              fontSize: 13,
                              fontFamily: 'Barlow',
                              fontWeight: FontWeight.w600,
                              height: 1,
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
    );
  }
}
