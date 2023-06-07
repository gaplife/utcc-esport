import 'package:flutter/material.dart';
import 'package:utcc_esport/src/constants/asset.dart';
import 'package:utcc_esport/src/pages/pages.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  image: const AssetImage(Asset.BG_IMAGE),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() => Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          height: MediaQuery.of(context).size.height * 0.925,
          child: Column(
            children: <Widget>[
              _logo(),
              const Expanded(
                child: Spacer(),
              ),
              Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _textWelcome(),
                  _buttonlogin(),
                  _buttonregis(),
                  _buttonorganizer(),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _logo() {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
      child: Column(
        children: [
          Image.asset(
            Asset.LOGO_IMAGE,
            scale: MediaQuery.of(context).size.width * 0.006,
          ),
          Text("E-SPORT",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.083,
                color: const Color(0xFFA31E21),
                fontFamily: 'Barlow',
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
              )),
        ],
      ),
    );
  }

  Widget _textWelcome() {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      child: Column(
        children: <Widget>[
          Text(
            "ยินดีต้อนรับ",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontFamily: 'Mitr',
                color: Colors.white),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          Text(
            "แหล่งรวบรวมข่าวสารและ",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontFamily: 'Mitr',
                color: Colors.white),
          ),
          Text(
            "บริหารจัดการแข่งขันกีฬา E-SPORT",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontFamily: 'Mitr',
                color: Colors.white),
          ),
          Text(
            "ครบจบในที่เดียว",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontFamily: 'Mitr',
                color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buttonlogin() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.023, left: 20, right: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.07,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Login();
            }));
          },
          icon: const Icon(
            Icons.login,
            size: 0,
            color: Color(0xFFA31E21),
          ),
          label: Text(
            "เข้าสู่ระบบ",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.055,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.bold,
              color: const Color(0xFFA31E21),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonregis() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02, left: 20, right: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.07,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA31E21),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Register();
            }));
          },
          icon: const Icon(
            Icons.login,
            size: 0,
            color: Color(0xFFA31E21),
          ),
          label: Text(
            "ลงทะเบียน",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.055,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonorganizer() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          left: 20,
          right: 20,
          bottom: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.07,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const OganizerLogin();
            }));
          },
          icon: const Icon(
            Icons.login,
            size: 0,
            color: Color(0xFFA31E21),
          ),
          label: Text(
            "สำหรับผู้จัดการแข่งขัน",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.055,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
