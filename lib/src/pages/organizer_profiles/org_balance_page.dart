import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/asset.dart';

class OrganizerBalance extends StatefulWidget {
  const OrganizerBalance({super.key});

  @override
  State<OrganizerBalance> createState() => _OrganizerBalanceState();
}

class _OrganizerBalanceState extends State<OrganizerBalance> {
  final auth = FirebaseAuth.instance;
  String? userID;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final user = auth.currentUser;
    if (user != null) {
      setState(() {
        userID = user.uid;
        userEmail = user.email; // ใช้อีเมลของผู้ใช้งานเป็น userId แทน
      });
    }
  }

  Widget _getCoin(AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      final userDocument = snapshot.data!.docs.firstWhereOrNull(
            (doc) => doc["email"] == userEmail, // เปรียบเทียบกับอีเมลของผู้ใช้งาน
      );

      if (userDocument != null) {
        final coin = userDocument["coin"];
        return Text(
          coin.toString(),
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        );
      } else {
        return const Text('not found');
      }
    } else {
      return const CircularProgressIndicator();
    }
  }

  List<Map<String, String>> dataList = [
    {
      'title': 'Dream League',
      'reward': '(รางวัลที่ 1)',
      'amount': '-5000 บาท',
      'date': '05 มี.ค. - 13.40'
    },
    {
      'title': 'Dream League',
      'reward': '(รางวัลที่ 2)',
      'amount': '-3000 บาท',
      'date': '05 มี.ค. - 13.20'
    },
    {
      'title': 'Dream League',
      'reward': '(รางวัลที่ 3)',
      'amount': '-1000 บาท',
      'date': '05 มี.ค. - 13.00'
    },
    // สามารถเพิ่มข้อมูลเพิ่มเติมตามต้องการ
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: true,
        title: const Padding(
          padding: EdgeInsets.only(left: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "ยอดเงินคงเหลือ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _balance(),
            //_table(dataList),
          ],
        ),
      ),
    );
  }

  Widget _balance() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'บัญชีของฉัน',
                style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.25,
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            decoration: BoxDecoration(
                color: const Color(0xff0c1629),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        //width: MediaQuery.of(context).size.width * 0.8,
                        child: Text('คงเหลือ',
                            style: TextStyle(
                              fontFamily: 'Kanit',
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.028,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                      ),
                      Spacer(),
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //width: MediaQuery.of(context).size.width * 0.15,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("Organizers")
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> profileSnapshot) {
                              return _getProfileImage(profileSnapshot);
                            },
                          )),
                    ],
                  ),
                ),
                Container(
                  //margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  //height: MediaQuery.of(context).size.height * 0.09,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 2, 10, 0),
                        width: MediaQuery.of(context).size.width * 0.07,
                        height: MediaQuery.of(context).size.height * 0.04,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffffffff),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(Asset.COIN_IMAGE),
                          ),
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("Organizers")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          return _getCoin(snapshot);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.035,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffa31e21),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/orgwithdraw');
                    },
                    child: Text(
                      'ถอนเงิน',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.019,
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
    );
  }

  Widget _table(List<Map<String, String>> dataList) {
    double tableHeight =
        (dataList.length * MediaQuery.of(context).size.height * 0.08)
            .toDouble();
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'ประวัติการถอนเงิน',
                style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Table(
              columnWidths: {
                0: FractionColumnWidth(0.6),
                1: FractionColumnWidth(0.4),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: const Color(0xff0c1629),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  children: [
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text(
                          'รายการแข่ง',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'จำนวนเงิน',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: tableHeight, // กำหนดความสูงของตาราง
            decoration: BoxDecoration(
              color: Colors.grey.shade200, // สีพื้นหลังสำหรับตาราง
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Table(
              columnWidths: {
                0: FractionColumnWidth(0.6),
                1: FractionColumnWidth(0.4),
              },
              children: dataList.map((data) {
                return TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                data['title'] ?? '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.019,
                                  fontFamily: 'Kanit',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                              child: Text(
                                data['reward'] ?? '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.016,
                                  fontFamily: 'Kanit',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                data['amount'] ?? '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.019,
                                  fontFamily: 'Kanit',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                              child: Text(
                                data['date'] ?? '',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.016,
                                  fontFamily: 'Kanit',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProfileImage(AsyncSnapshot<QuerySnapshot> profileSnapshot) {
    if (profileSnapshot.hasData) {
      final userDocument = profileSnapshot.data!.docs.firstWhereOrNull(
        (doc) => doc["email"] == userEmail,
      );
      if (userDocument != null) {
        final profileImageUrl = userDocument["profileImageUrl"];
        if (profileImageUrl != null && profileImageUrl.isNotEmpty) {
          return Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: MediaQuery.of(context).size.width * 0.14,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xff0c1629)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(profileImageUrl),
              ),
            ),
          );
        } else {
          return Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: MediaQuery.of(context).size.width * 0.14,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xff0c1629)),
            ),
            child: const Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 48,
                  color: Colors.grey,
                ),
              ],
            ),
          );
        }
      } else {
        return const Text('Photo not found');
      }
    } else {
      return const CircularProgressIndicator();
    }
  }
}
