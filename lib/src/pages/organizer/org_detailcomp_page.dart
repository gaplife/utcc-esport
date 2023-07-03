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
            //picture
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image.network(
                  widget.competitionData['compImageURL'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //name
            Container(
              margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      widget.competitionData['compName'],
                      style: TextStyle(
                        color: const Color.fromARGB(255, 12, 0, 0),
                        fontSize: MediaQuery.of(context).size.width * 0.05,
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
                            Icons.sports_esports_rounded,
                            // สามารถเปลี่ยนเป็น Icon อื่นๆ ได้ตามต้องการ
                            color: const Color(0xFFA31E21), // สีของ Icon
                            size: MediaQuery.of(context).size.width *
                                0.065, // ขนาดของ Icon
                          ),
                        ),
                        Text(
                          widget.competitionData['gameName'],
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          // เพิ่ม Overflow ที่นี่
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
                            widget.competitionData['compType'],
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
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
                            widget.competitionData['fee'].toString(),
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
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
            ),
            // _period
            Container(
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
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      // แก้ตรงนี้
                      widget.competitionData['applyStartDate'].toString() +
                          ' - ' +
                          widget.competitionData['applyEndDate'].toString(),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
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
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.046,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                '20 พ.ค. 66, 09:00 - 22 พ.ค. 66',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontFamily: 'Kanit',
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // เพิ่ม Overflow ที่นี่
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
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.037,
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
            ),
            // _description
            Container(
              margin: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.015, 20, 0),
              width: double.infinity,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonPadding: const EdgeInsets.all(
                        0), // กำหนดให้ปุ่มไม่มีช่องว่างรอบข้าง
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
                            padding: EdgeInsets
                                .zero, // กำหนดให้ปุ่มไม่มีพื้นที่ในปุ่ม
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
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
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
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
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
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.045,
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
                          widget.competitionData['compDetail'],
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.043,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 15, 20, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.competitionData['compRule'],
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
                          'เงินรางวัล '+widget.competitionData['prize'].toString()+' บาท',
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
            ),
            // _buttonconfirm(),
          ],
        ),
      ),
    );
  }
}
