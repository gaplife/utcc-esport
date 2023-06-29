import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
            //height: MediaQuery.of(context).size.height * 0.25,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            decoration: BoxDecoration(
                color: const Color(0xffa31e21),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.035,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            //Navigator.pushNamed(context, '/topup');
                          },
                          child: Text(
                            'เติมเงิน',
                            style: TextStyle(
                              color: const Color(0xffa31e21),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.020,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  //height: MediaQuery.of(context).size.height * 0.09,
                  child: Text(
                    '50,000 บาท',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 15, 20, 20),
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //width: MediaQuery.of(context).size.width * 0.15,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("Users")
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> profileSnapshot) {
                              return _getProfileImage(profileSnapshot);
                            },
                          )),
                      Spacer(),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.035,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            //Navigator.pushNamed(context, '/topup');
                          },
                          child: Text(
                            'ถอนเงิน',
                            style: TextStyle(
                              color: const Color(0xffa31e21),
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
                ),
              ],
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
