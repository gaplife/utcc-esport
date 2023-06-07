import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:utcc_esport/src/constants/asset.dart';

class Profiles extends StatefulWidget {
  const Profiles({super.key});

  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  final auth = FirebaseAuth.instance;
  final profilefont = 'Kanit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 10),
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
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                  fontFamily: profilefont,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xff0c1629),
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
                    _buttonregistercom(),
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
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.16,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(1, 0, 0, 0),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xff0c1629)),
                      image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            'https://scontent.fbkk22-7.fna.fbcdn.net/v/t1.18169-9/22449595_1515710551829373_1094037456389629918_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGQ1w1Na8tq52BliYudPx4TyC9jHWEQNNvIL2MdYRA028vwwrJQkRH5K9NUtVYsC-YG8LLdoh5lJVJcqi0Cp2q1&_nc_ohc=xyW49OH-h20AX_AeC_b&_nc_ht=scontent.fbkk22-7.fna&oh=00_AfBvLMW4xZmZstp0Zc7gF5NhXbrh_20_0FpY41EmNVHsYA&oe=649D70FC'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    width: MediaQuery.of(context).size.width * 0.64,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            'Assawin Namkort',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.05,
                              fontFamily: profilefont,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            'เหรียญที่มี',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontFamily: profilefont,
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                          width: MediaQuery.of(context).size.height * 0.5,
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                // width: 10,
                                // height: 20,
                                child: Image.asset(
                                  Asset.COIN_IMAGE,
                                  scale: MediaQuery.of(context).size.width * 0.1,
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
                                              0.02,
                                      fontFamily: profilefont,
                                      fontWeight: FontWeight.w600,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 0,
                                    0), // ปรับระยะห่างด้านซ้ายของปุ่ม "เติมเงิน"
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
                                  onPressed: () {},
                                  child: Text(
                                    'เติมเงิน',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018,
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
              margin: const EdgeInsets.fromLTRB(5, 18, 5, 0),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 2,
              decoration: const BoxDecoration(
                color: Color.fromARGB(153, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonregistercom() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
      width: MediaQuery.of(context).size.width * 1,
      child: TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'การแข่งขันที่ลงทะเบียน',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontFamily: profilefont,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: const Color.fromARGB(255, 0, 0, 0),
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
      width: MediaQuery.of(context).size.width * 1,
      child: TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ตั้งค่าโปรไฟล์',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontFamily: profilefont,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: const Color.fromARGB(255, 0, 0, 0),
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
      width: MediaQuery.of(context).size.width * 1,
      child: TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ตั้งค่าช่องทางการรับเงิน',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontFamily: profilefont,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: const Color.fromARGB(255, 0, 0, 0),
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
      width: MediaQuery.of(context).size.width * 1,
      child: TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ตั้งค่ารหัสผ่าน',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontFamily: profilefont,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: const Color.fromARGB(255, 0, 0, 0),
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
          width: MediaQuery.of(context).size.width * 1,
          child: TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ติดต่อเรา',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontFamily: profilefont,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  size: MediaQuery.of(context).size.height * 0.025,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(25, 70, 25, 10),
          width: MediaQuery.of(context).size.width * 1,
          height: 2,
          decoration: const BoxDecoration(
            color: Color.fromARGB(153, 0, 0, 0),
          ),
        ),
      ],
    );
  }

  Widget _buttonlogout() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
