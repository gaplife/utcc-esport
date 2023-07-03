import 'package:flutter/material.dart';


class OrgDetailComp extends StatefulWidget {
  final dynamic competitionData;

  const OrgDetailComp({super.key, required this.competitionData});

  @override
  State<OrgDetailComp> createState() => _OrgDetailCompState();
}

class _OrgDetailCompState extends State<OrgDetailComp> {
  int currentIndex = 0;
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
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _photocompetition(),
            _headcompetition(),
            _period(),
            _description(),
            _buttonconfirm(),
          ],
        ),
      ),
    );
  }

  Widget _photocompetition() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Widget _headcompetition() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              'FIFA Champion Club SS1',
              style: TextStyle(
                color: const Color.fromARGB(255, 12, 0, 0),
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  width: MediaQuery.of(context).size.width * 0.065,
                  height: MediaQuery.of(context).size.height * 0.03,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffffffff),
                  ),
                  child: Icon(
                    Icons
                        .sports_esports_rounded, // สามารถเปลี่ยนเป็น Icon อื่นๆ ได้ตามต้องการ
                    color: const Color(0xFFA31E21), // สีของ Icon
                    size: MediaQuery.of(context).size.width *
                        0.065, // ขนาดของ Icon
                  ),
                ),
                Text(
                  'FIFA Online 4',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis, // เพิ่ม Overflow ที่นี่
                  maxLines: 1,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Icon(
                    Icons.person,
                    size: MediaQuery.of(context).size.width * 0.065,
                    color: const Color(0xffa31e21),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'เดี่ยว',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w500,
                      //height: 1.1,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  width: MediaQuery.of(context).size.width * 0.07,
                  height: MediaQuery.of(context).size.height * 0.035,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffffffff),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/coin.png'),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    '500',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _period() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              'ระยะเวลารับสมัคร',
              style: TextStyle(
                color: const Color.fromARGB(255, 12, 0, 0),
                fontSize: MediaQuery.of(context).size.width * 0.046,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Text(
              '15 พ.ค. 66, 09:00 - 18 พ.ค. 66, 18:00',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis, // เพิ่ม Overflow ที่นี่
              maxLines: 1,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: double.infinity,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        'ระยะเวลาแข่งขัน',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 12, 0, 0),
                          fontSize: MediaQuery.of(context).size.width * 0.046,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        '20 พ.ค. 66, 09:00 - 22 พ.ค. 66',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w500,
                        ),
                        overflow:
                        TextOverflow.ellipsis, // เพิ่ม Overflow ที่นี่
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    color: const Color(0xffa31e21),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'จำนวนผู้สมัคร 2/8',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.037,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w800,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _description() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          20, MediaQuery.of(context).size.height * 0.015, 20, 0),
      width: double.infinity,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonPadding:
            const EdgeInsets.all(0), // กำหนดให้ปุ่มไม่มีช่องว่างรอบข้าง
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: currentIndex == 0
                          ? const Color(0xffa31e21)
                          : Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // กำหนดให้ปุ่มไม่มีพื้นที่ในปุ่ม
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.3, // กำหนดความกว้างของปุ่ม
                    alignment: Alignment.center,
                    child: Text(
                      'รายละเอียด',
                      style: TextStyle(
                        color: currentIndex == 0
                            ? const Color(0xffa31e21)
                            : Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: currentIndex == 1
                          ? const Color(0xffa31e21)
                          : Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    alignment: Alignment.center,
                    child: Text(
                      'กฏการแข่ง',
                      style: TextStyle(
                        color: currentIndex == 1
                            ? const Color(0xffa31e21)
                            : Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: currentIndex == 2
                          ? const Color(0xffa31e21)
                          : Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.298,
                    alignment: Alignment.center,
                    child: Text(
                      'รางวัล',
                      style: TextStyle(
                        color: currentIndex == 2
                            ? const Color(0xffa31e21)
                            : Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          IndexedStack(
            index: currentIndex,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 20, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '   เมื่อผู้เล่นทำการสมัครแข่ง ทางทีมงานจะส่งแพ็กนักเตะ คลาส Live +8 ให้เพื่อทำการแข่งขัน อันดับที่ 1 ของแต่ละคลับ จะได้รับสิทธิ์เป็นตัวแทนเพจเพื่อเข้าสู่ CLUB CHAMPION TOUNAMENT ชิง FC มูลค่ารวม 110,000 บาท',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.043,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 20, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '1. ห้ามมีการใช้การโกงทุกรูปแบบ\n2. ห้ามีการใช้คำพูดหยาบคาย ไม่สุภาพภาพในเกม\n3. ถ้าถึงเวลาแข่งขันแล้วไม่มาแสดงตัวภาพใน 5 นาทีจะถือว่าสละสิทธิ์การแข่งขัน',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.043,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 20, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'เงินรางวัล 60,000 บาท',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.043,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buttonconfirm() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.065,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffa31e21),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/listname');
          },
          child: Text(
            "ดูรายชื่อผู้สมัครแข่ง",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.055,
              fontFamily: 'Kanit',
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
