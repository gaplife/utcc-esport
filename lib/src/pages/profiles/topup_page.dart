import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:utcc_esport/src/constants/asset.dart';

class Topup extends StatefulWidget {
  const Topup({super.key});

  @override
  State<Topup> createState() => _TopupState();
}

class _TopupState extends State<Topup> {
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
            fontSize: MediaQuery.of(context).size.width * 0.065,
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
                "เติมเงิน",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xffa31e21),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _nameapp(),
            _amount(),
            _amounttopup(),
            _amounttopup2(),
            _amounttopup3(),
          ],
        ),
      ),
    );
  }

  Widget _nameapp() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            Asset.LOGO_IMAGE,
            scale: MediaQuery.of(context).size.height * 0.0086,
            //alignment: Alignment.centerRight,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "E-SPORT",
            style: TextStyle(
              color: const Color(0xFFA31E21),
              fontSize: MediaQuery.of(context).size.height * 0.05,
              fontFamily: 'Barlow',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _amount() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.15,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
            color: const Color(0xffa31e21),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 15, 0, 10),
              child: const Text(
                'เหรียญที่มี',
                style: TextStyle(
                    fontFamily: 'Kanit',
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      Asset.COIN_IMAGE,
                      scale: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Users")
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    return _getCoin(snapshot);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _amounttopup() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'เลือกจำนวนที่ต้องการเติมเงิน',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.027,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  _topupsuccess();
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  width: MediaQuery.of(context).size.width * 0.42,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffa31e21),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  Asset.COIN_IMAGE,
                                  scale:
                                      MediaQuery.of(context).size.width * 0.055,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Text(
                                '50',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025,
                                  fontFamily: 'Kanit',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  //height: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 1,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                          child: Text(
                            '35 บาท',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontFamily: 'Kanit',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              //height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.055,
              ),
              InkWell(
                onTap: () {
                  _topupsuccess();
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  width: MediaQuery.of(context).size.width * 0.42,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffa31e21),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  Asset.COIN_IMAGE,
                                  scale:
                                      MediaQuery.of(context).size.width * 0.055,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Text(
                                '100',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025,
                                  fontFamily: 'Kanit',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  //height: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 1,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                          child: Text(
                            '60 บาท',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontFamily: 'Kanit',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              //height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _amounttopup2() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _topupsuccess();
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: MediaQuery.of(context).size.width * 0.42,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffa31e21),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              Asset.COIN_IMAGE,
                              scale: MediaQuery.of(context).size.width * 0.055,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Text(
                            '200',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontFamily: 'Kanit',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              //height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 1,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: Text(
                        '100 บาท',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontFamily: 'Kanit',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          //height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.055,
          ),
          InkWell(
            onTap: () {
              _topupsuccess();
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: MediaQuery.of(context).size.width * 0.42,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffa31e21),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              Asset.COIN_IMAGE,
                              scale: MediaQuery.of(context).size.width * 0.055,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Text(
                            '300',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontFamily: 'Kanit',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              //height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 1,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: Text(
                        '150 บาท',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontFamily: 'Kanit',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          //height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _amounttopup3() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _topupsuccess();
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: MediaQuery.of(context).size.width * 0.42,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffa31e21),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              Asset.COIN_IMAGE,
                              scale: MediaQuery.of(context).size.width * 0.055,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Text(
                            '500',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontFamily: 'Kanit',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              //height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 1,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: Text(
                        '240 บาท',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontFamily: 'Kanit',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          //height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.055,
          ),
          InkWell(
            onTap: () {
              _topupsuccess();
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: MediaQuery.of(context).size.width * 0.42,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffa31e21),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              Asset.COIN_IMAGE,
                              scale: MediaQuery.of(context).size.width * 0.055,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Text(
                            '1,000',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontFamily: 'Kanit',
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              //height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 1,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: Text(
                        '450 บาท',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontFamily: 'Kanit',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          //height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _topupsuccess() {
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
                      'เติมเงินสำเร็จ !',
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
                          context, ModalRoute.withName('/topup'));
                    },
                    child: Text(
                      'ปิด',
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
}
