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
        child: Column(
          children: <Widget>[
            _logo(),
            _textWelcome(),
            _buttonlogin(),
            _buttonregis(),
            _buttonorganizer(),
          ],
        ),
      );

  Widget _logo() {
    return Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(children: [
          Image.asset(
            Asset.LOGO_IMAGE,
            scale: 2.5,
          ),
          const Text("E-SPORT",
              style: TextStyle(
                fontSize: 34,
                color: Color(0xFFA31E21),
                fontFamily: 'Barlow',
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
              ))
        ]));
  }

  Widget _textWelcome() {
    return Padding(
      padding: const EdgeInsets.only(top: 130),
      child: Column(
        children: const <Widget>[
          Text(
            "ยินดีต้อนรับ",
            style: TextStyle(
                fontSize: 20, fontFamily: 'Mitr', color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "แหล่งรวบรวมข่าวสารและ",
            style: TextStyle(fontSize: 16, fontFamily: 'Mitr', color: Colors.white),
          ),
          Text(
            "บริหารจัดการแข่งขันกีฬา E-SPORT",
            style: TextStyle(fontSize: 16, fontFamily: 'Mitr', color: Colors.white),
          ),
          Text(
            "ครบจบในที่เดียว",
            style: TextStyle(fontSize: 16, fontFamily: 'Mitr', color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buttonlogin() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SizedBox(
        width: 500,
        height: 60,
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
          label: const Text(
            "เข้าสู่ระบบ",
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.bold,
              color: Color(0xFFA31E21),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonregis() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SizedBox(
        width: 500,
        height: 60,
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
          label: const Text(
            "ลงทะเบียน",
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonorganizer() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      child: SizedBox(
        width: 500,
        height: 60,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
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
          label: const Text(
            "สำหรับผู้จัดการแข่งขัน",
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
