// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, deprecated_member_use

import 'package:flutter/material.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "ลืมรหัสผ่าน",
          style:
          TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'Mitr'),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 249, 249, 249),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _top(),
            _boxmail(),
            _buttonconfirm(),
          ]),
        ],
      ),
    );
  }

  Widget _top() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "กรุณากรอกอีเมลเพื่อรีเซ็ทรหัสผ่าน",
            style: TextStyle(
                fontSize: 19, color: Colors.black87, fontFamily: 'Kanit'),
          ),
        ],
      ),
    );
  }

  Widget _boxmail() {
    final TextField _txtMail = TextField(
      decoration: InputDecoration(
        hintText: "อีเมล",
        contentPadding: EdgeInsets.all(19),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
    );

    return Padding(
        padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
        child: Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border.all(width: 1, color: Colors.black54),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: _txtMail,
          ),
        ]));
  }

  Widget _buttonconfirm() {
    return Padding(
      padding: const EdgeInsets.only(top: 523, left: 20, right: 20),
      child: SizedBox(
        width: 500,
        height: 60,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              primary: Color.fromARGB(255, 255, 17, 0)),
          onPressed: () {},
          icon: Icon(
            Icons.login,
            size: 0,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          label: Text(
            "ยืนยัน",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Kanit',
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}