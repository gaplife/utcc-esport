import 'package:flutter/material.dart';
import 'package:utcc_esport/src/pages/pages.dart';

class Editpassword extends StatefulWidget {
  const Editpassword({super.key});

  @override
  State<Editpassword> createState() => _EditpasswordState();
}

class _EditpasswordState extends State<Editpassword> {
  bool _passwordVisible = false;
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
                "เปลี่ยนรหัสผ่าน",
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
        backgroundColor: const Color(0xFF0C1629),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _boxoldpass(),
            _boxnewpass(),
            _boxconfirmpass(),
            _buttonconfirm(),
          ],
        ),
      ),
    );
  }

  Widget _boxoldpass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'กรุณากรอกรหัสผ่าน',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.055,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Text(
            "รหัสผ่านเดิม",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              hintText: "รหัสผ่านเดิม",
              contentPadding: EdgeInsets.all(18),
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible =
                          !_passwordVisible; // เปลี่ยนค่า _passwordVisible เมื่อกดปุ่ม
                    });
                  }),
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ForgetPass();
              }));
            },
            child: Text(
              "ลืมรหัสผ่าน ?",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _boxnewpass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Text(
            "รหัสผ่านใหม่",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              hintText: "รหัสผ่านใหม่",
              contentPadding: EdgeInsets.all(18),
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible =
                          !_passwordVisible; // เปลี่ยนค่า _passwordVisible เมื่อกดปุ่ม
                    });
                  }),
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
          ),
        ),
      ],
    );
  }

  Widget _boxconfirmpass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Text(
            "ยืนยันรหัสผ่าน",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              hintText: "ยืนยันรหัสผ่าน",
              contentPadding: EdgeInsets.all(18),
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible =
                          !_passwordVisible; // เปลี่ยนค่า _passwordVisible เมื่อกดปุ่ม
                    });
                  }),
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
          ),
        ),
      ],
    );
  }

  Widget _buttonconfirm() {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 0, right: 0, bottom: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.068,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffa31e21),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            _editpasswordsuccess();
          },
          child: Text(
            "ยืนยันการเปลี่ยนรหัสผ่าน",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.055,
              fontFamily: 'Kanit',
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }

  void _editpasswordsuccess() {
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
                      'เปลี่ยนแปลงรหัสผ่านสำเร็จ !',
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
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/welcome',
                        (route) => false,
                      );
                    },
                    child: Text(
                      'ยืนยัน',
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
