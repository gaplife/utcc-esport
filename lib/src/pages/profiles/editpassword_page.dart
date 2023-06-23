import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:utcc_esport/src/pages/pages.dart';

class Editpassword extends StatefulWidget {
  const Editpassword({super.key});

  @override
  State<Editpassword> createState() => _EditpasswordState();
}

class _EditpasswordState extends State<Editpassword> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  bool isDataValidated = false;
  bool _passwordVisible = false;
  String newPass = "";
  String? userEmail;
  String? userID;
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final User? user = auth.currentUser;
    if (user != null) {
      setState(() {
        userID = user.uid;
        userEmail = user.email;
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
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          height: MediaQuery.of(context).size.height * 0.84,
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _boxoldpass(),
                _boxnewpass(),
                _boxconfirmpass(),
                const Spacer(),
                _buttonconfirm(),
              ],
            ),
          ),
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
          margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
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
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(userID)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.exists) {
                //final userDocument =
                //snapshot.data!.data() as Map<String, dynamic>;
                //final username = userDocument['username'] as String?;
                //final name = username ?? 'username';
                return TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    hintText: "รหัสผ่านเดิม",
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  validator: (value) {
                    if (snapshot.hasData && snapshot.data!.exists) {
                      final userDocument =
                          snapshot.data!.data() as Map<String, dynamic>;
                      final password = userDocument['password'] as String?;
                      if (value != password) {
                        return 'รหัสผ่านไม่ถูกต้อง';
                      }
                    }
                    return null;
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
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
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              hintText: "รหัสผ่านใหม่",
              contentPadding: const EdgeInsets.all(18),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            onChanged: (value) {
              setState(() {
                newPass = value;
              });
            },
            validator: RequiredValidator(errorText: "กรุณากรอกรหัสผ่าน"),
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
          margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
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
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              hintText: "ยืนยันรหัสผ่าน",
              contentPadding: const EdgeInsets.all(18),
              border: const OutlineInputBorder(),
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'กรุณายืนรหัสผ่าน';
              } else if (value != newPass) {
                return 'รหัสผ่านไม่ตรงกัน';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  void _updatePassword() async {
    try {
      if (userID != null) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userID)
            .update({
          'password': newPass,
        });
        if (auth.currentUser != null) {
          await auth.currentUser!.updatePassword(newPass);
        }
      }
    } catch (error) {
      // ignore: avoid_print
      print('เกิดข้อผิดพลาดในการอัปเดตรหัสผ่าน: $error');
    }
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
            if (formKey.currentState!.validate()) {
              _updatePassword();
              _editpasswordsuccess();
            }
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
