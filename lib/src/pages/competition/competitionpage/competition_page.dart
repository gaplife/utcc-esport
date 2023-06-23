import 'package:flutter/material.dart';
import 'package:utcc_esport/src/constants/asset.dart';

class Competition extends StatefulWidget {
  const Competition({super.key});

  @override
  State<Competition> createState() => _CompetitionState();
}

class _CompetitionState extends State<Competition> {
  int currentIndex = 0;
  void _registercompetition() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.05,
              0,
              MediaQuery.of(context).size.width * 0.05,
              0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.265,
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'ยืนยันการสมัครแข่ง',
                      style: TextStyle(
                        //color: Color.fromARGB(0, 0, 0, 0),
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'กรุณากรอกชื่อภายในเกม',
                        style: TextStyle(
                          //color: Color.fromARGB(0, 0, 0, 0),
                          fontSize: MediaQuery.of(context).size.width * 0.042,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0085),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'ชื่อภายในเกม',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffa31e21),
                    ),
                    onPressed: () {
                      _registersuccess();
                      //Navigator.of(context).pop();
                    },
                    child: Text(
                      'ยืนยัน',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _registersuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.05,
              0,
              MediaQuery.of(context).size.width * 0.05,
              0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Container(
            margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: MediaQuery.of(context).size.width * 0.15,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'ลงสมัครสำเร็จ !',
                      style: TextStyle(
                        //color: Color.fromARGB(0, 0, 0, 0),
                        fontSize: MediaQuery.of(context).size.width * 0.053,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffa31e21),
                    ),
                    onPressed: () {
                      Navigator.popUntil(
                          context, ModalRoute.withName('/competition'));
                    },
                    child: Text(
                      'ยืนยัน',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: MediaQuery.of(context).size.width * 0.046,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
        backgroundColor: const Color(0xff0c1629),
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
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://mpics.mgronline.com/pics/Images/566000004575901.JPEG',
          ),
        ),
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
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                          'https://scontent.fbkk22-2.fna.fbcdn.net/v/t1.6435-9/42195217_1155168591316184_8245855647996837888_n.png?_nc_cat=105&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGJ0Gu6chQ4tG_lG0FLq-3YAAGwZ_E8HkYAAbBn8TweRgTNNkou7p7Xo5-GL1NGE5eNhKLRvLJUh-Du21dB0msY&_nc_ohc=ZQRStCOETRkAX8ebUrU&_nc_ht=scontent.fbkk22-2.fna&oh=00_AfCt6oonE4TuMBY8l0Ync0n_tendIjIIYnDG6M6lVjxOcw&oe=649D9725'),
                    ),
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
                      image: AssetImage(Asset.COIN_IMAGE),
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
                      'รายระเอียด',
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
                  'รางวัลอันดับ 1 เงินรางวัล 60,000 บาท\nรางวัลอันดับ 2 เงินรางวัล 40,000 บาท\nรางวัลอันดับ 3 เงินรางวัล 10,000 บาท',
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
            _registercompetition();
          },
          child: Text(
            "สมัครแข่งขัน",
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
