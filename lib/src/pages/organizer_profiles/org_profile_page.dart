import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:utcc_esport/src/constants/asset.dart';
import 'package:collection/collection.dart';

class OrganizerProfile extends StatefulWidget {
  const OrganizerProfile({super.key});

  @override
  State<OrganizerProfile> createState() => _OrganizerProfileState();
}

class _OrganizerProfileState extends State<OrganizerProfile> {
  final auth = FirebaseAuth.instance;
  final profilefont = 'Kanit';
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
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.person,
                    size: 35,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              const SizedBox(
                width: 5,
              ),
              Text(
                "โปรไฟล์",
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                  fontFamily: profilefont,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        child: Form(
          child: ListView(
            shrinkWrap: true,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _headprofile(),
                    _buttonmycomp(),
                    _buttonbalance(),
                    _buttonsettingprofile(),
                    _buttonsetuppayment(),
                    _buttonsetuppassword(),
                    _buttoncontact(),
                    _buttonlogout(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headprofile() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.14,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("Organizers")
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot> profileSnapshot) {
                      return _getProfileImage(profileSnapshot);
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    width: MediaQuery.of(context).size.width * 0.64,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("Organizers")
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return _getUsername(snapshot);
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(1, 10, 0, 0),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            'เหรียญที่มี',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                              fontFamily: profilefont,
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          width: MediaQuery.of(context).size.height * 0.35,
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Image.asset(
                                  Asset.COIN_IMAGE,
                                  scale:
                                      MediaQuery.of(context).size.width * 0.09,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '999,999',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.022,
                                      fontFamily: profilefont,
                                      fontWeight: FontWeight.w600,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.035,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffa31e21),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/orgwithdraw');
                                  },
                                  child: Text(
                                    'ถอนเงิน',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.019,
                                      fontFamily: profilefont,
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
                  ) //รูปโปรไฟล์
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 1,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getUsername(AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      final userDocument = snapshot.data!.docs.firstWhereOrNull(
        (doc) => doc["email"] == userEmail, // เปรียบเทียบกับอีเมลของผู้ใช้งาน
      );

      if (userDocument != null) {
        final username = userDocument["username"];
        return Text(
          username,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontFamily: profilefont,
            fontWeight: FontWeight.w600,
          ),
        );
      } else {
        return const Text('User not found');
      }
    } else {
      return const CircularProgressIndicator();
    }
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
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.1,
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
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.1,
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

  Widget _buttonmycomp() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/mycomp');
        },
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'รายการแข่งที่สร้าง',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontFamily: profilefont,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: MediaQuery.of(context).size.height * 0.025,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonbalance() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/orgbalance');
        },
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ยอดเงินคงเหลือ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontFamily: profilefont,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: MediaQuery.of(context).size.height * 0.025,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonsettingprofile() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/orgeditprofile');
        },
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ตั้งค่าโปรไฟล์',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontFamily: profilefont,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: MediaQuery.of(context).size.height * 0.025,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonsetuppayment() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/setuppayment');
        },
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ตั้งค่าช่องทางการรับเงิน',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontFamily: profilefont,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: MediaQuery.of(context).size.height * 0.025,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonsetuppassword() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/orgeditpassword');
        },
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ตั้งค่ารหัสผ่าน',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontFamily: profilefont,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: MediaQuery.of(context).size.height * 0.025,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttoncontact() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/orgcontacme');
            },
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ติดต่อเรา',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontFamily: profilefont,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: MediaQuery.of(context).size.height * 0.025,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(25, 15, 25, 10),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 1,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buttonlogout() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
            auth.signOut().then((value) {
              Fluttertoast.showToast(
                  msg: "ออกจากระบบเรียบร้อย", gravity: ToastGravity.SNACKBAR);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/welcome',
                (route) => false,
              );
            });
          },
          child: Text(
            "ออกจากระบบ",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.03,
              fontFamily: profilefont,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
