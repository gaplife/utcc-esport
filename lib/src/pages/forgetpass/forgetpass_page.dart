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
          style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.061,
              fontFamily: 'Mitr'),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 249, 249, 249),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _boxmail(),
          ],
        ),
      ),
    );
  }

  Widget _boxmail() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          20, MediaQuery.of(context).size.height * 0.035, 20, 20),
      height: MediaQuery.of(context).size.height * 0.78,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "กรุณากรอกอีเมลเพื่อรีเซ็ทรหัสผ่าน",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.046,
                color: Colors.black87,
                fontFamily: 'Kanit'),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "อีเมล",
              contentPadding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.045),
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.59), // เพิ่มช่องว่างระหว่าง TextFormField กับปุ่มยืนยัน
          _buttonconfirm()
        ],
      ),
    );
  }

  Widget _buttonconfirm() {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.07,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            primary: const Color(0xFFA31E21),
          ),
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
