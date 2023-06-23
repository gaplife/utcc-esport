import 'package:flutter/material.dart';

class Contentnews extends StatefulWidget {
  const Contentnews({super.key});

  @override
  State<Contentnews> createState() => _ContentnewsState();
}

class _ContentnewsState extends State<Contentnews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: true,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[],
          ),
        ),
        backgroundColor: const Color(0xFF0C1629),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          _photonews(),
          _headnews(),
          _content(),
        ]),
      ),
    );
  }

  Widget _photonews() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
    );
  }

  Widget _headnews() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              'ทีมไทย Vampire Esports คว้าแชมป์โลก PUBG MOBILE รับเงินรางวัล 18 ล้าน!',
              style: TextStyle(
                color: const Color.fromARGB(255, 12, 0, 0),
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              'เผยแพร่: 16 ส.ค. 2565 15:11',
              style: TextStyle(
                color: const Color.fromARGB(255, 12, 0, 0),
                fontSize: MediaQuery.of(context).size.width * 0.042,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              width: double.infinity,
              height: 1.5,
              decoration: const BoxDecoration(
                color: Color.fromARGB(153, 0, 0, 0),
              )),
        ],
      ),
    );
  }

  Widget _content() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              '   ทีมไทย Vampire Esports คว้าแชมป์ PUBG MOBILE World Invitational รับเงินรางวัลกว่า 18 ล้านบาท เตรียมลุยต่อในศึก Afterparty Showdown วันที่ 18 - 20 สิงหาคมนี้',
              style: TextStyle(
                color: const Color.fromARGB(255, 12, 0, 0),
                fontSize: MediaQuery.of(context).size.width * 0.042,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              '   การแข่งขัน PMWI จะจัดขึ้นทั้งหมด 2 สัปดาห์ ณ เมือง รียาด ประเทศซาอุดีอาระเบีย โดยในสัปดาห์แรก ตั้งแต่วันที่ 11 - 13 สิงหาคม ทีมเชิญทั้ง 18 ทีมจะได้มาประจันหน้ากันในการแข่งขันหลัก เพื่อชิงเงินรางวัลรวมกว่า 2 ล้านเหรียญดอลล่าห์สหรัฐ โดยในสัปดาห์แรกทีม Vampire Esports จากประเทศไทยก็ได้สร้างชื่อและผลงานบนหน้าประวัติศาสตร์อย่างยิ่งใหญ่อีกครั้ง ด้วยการคว้าอันดับ 1 ด้วยคะแนน 220 รับเงินรางวัล 525,000 เหรียญสหรัฐฯ หรือกว่า 18 ล้านบาท',
              style: TextStyle(
                color: const Color.fromARGB(255, 12, 0, 0),
                fontSize: MediaQuery.of(context).size.width * 0.042,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
