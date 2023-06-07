import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
//import 'package:intl/intl.dart';
import 'package:utcc_esport/src/models/profile.dart';

class OrganizerRegister extends StatefulWidget {
  const OrganizerRegister({super.key});

  @override
  State<OrganizerRegister> createState() => _OrganizerRegisterState();
}

class _OrganizerRegisterState extends State<OrganizerRegister> {
  final formKey = GlobalKey<FormState>();
  final _textSize = 18.0;

  Profile profile = Profile();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  CollectionReference userCollection =
  FirebaseFirestore.instance.collection("User Table");

  final _passwordController = TextEditingController();
  //final _date = TextEditingController();
  bool isChecked = false;

  // void dispise() {
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: const Text(
                "ลงทะเบียนผู้จัดแข่ง",
                style: TextStyle(
                    color: Color(0xFFA31E21), fontSize: 22, fontFamily: 'Kanit',fontWeight: FontWeight.w800),
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 249, 249, 249),
              elevation: 0,
            ),
            body: SizedBox(
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _boxusername(),
                          _boxemail(),
                          _boxepass(),
                          _boxeconfirmpass(),
                          _buttonaccept(),
                          _buttonconfirm(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    //
  }

  Widget _boxusername() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "ชื่อผู้ใช้",
              style: TextStyle(
                fontSize: _textSize,
                fontFamily: 'Kanit',
              ),
            ),
            const SizedBox(height: 2),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "ชื่อผู้ใช้",
                contentPadding: EdgeInsets.all(18),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              onSaved: (String? username) {
                profile.username = username;
              },
              validator: RequiredValidator(errorText: "กรุณากรอกชื่อผู้ใช้"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxemail() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "อีเมล",
              style: TextStyle(
                fontSize: _textSize,
                fontFamily: 'Kanit',
              ),
            ),
            const SizedBox(height: 2),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "อีเมล",
                contentPadding: EdgeInsets.all(18),
                border: OutlineInputBorder(),
              ),
              validator: MultiValidator([
                RequiredValidator(errorText: "กรุณากรอกอีเมล"),
                EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
              ]),
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              onSaved: (String? email) {
                profile.email = email;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxepass() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "รหัสผ่าน",
              style: TextStyle(
                fontSize: _textSize,
                fontFamily: 'Kanit',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "รหัสผ่าน",
                contentPadding: EdgeInsets.all(18),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              onSaved: (String? password) {
                profile.password = password;
              },
              validator: RequiredValidator(errorText: "กรุณากรอกรหัสผ่าน"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxeconfirmpass() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "ยืนยันรหัสผ่าน",
              style: TextStyle(
                fontSize: _textSize,
                fontFamily: 'Kanit',
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "ยืนยันรหัสผ่าน",
                contentPadding: EdgeInsets.all(18),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณายืนรหัสผ่าน';
                } else if (value != _passwordController.text) {
                  return 'รหัสผ่านไม่ตรงกัน';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }


  Widget _buttonconfirm() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
      child: SizedBox(
        width: 500,
        height: 60,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              backgroundColor: const Color(0xFFA31E21)),
          onPressed: () async {
            if (isChecked) {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                userCollection.add({
                  "username": profile.username,
                  "email": profile.email,
                  "password": profile.password,
                  "userType" : "Organizer",

                });
                try {
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: profile.email!,
                    password: profile.password!,
                  )
                      .then((value) {
                    formKey.currentState!.reset();
                    Fluttertoast.showToast(
                        msg: "ลงทะเบียนสำเร็จ",
                        gravity: ToastGravity.SNACKBAR);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/organizer_register',
                          (route) => false,
                    );
                  });
                } on FirebaseAuthException catch (e) {
                  String? messageemailerror;
                  if (e.code == 'email-already-in-use') {
                    messageemailerror =
                    "มีอีเมลนี้ในระบบแล้ว โปรดใช้อีเมลอื่นแทน";
                  } else if (e.code == 'weak-password') {
                    messageemailerror =
                    "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
                  } else {
                    messageemailerror = e.message;
                  }
                  Fluttertoast.showToast(
                    msg: '$messageemailerror',
                    gravity: ToastGravity.SNACKBAR,
                  );
                }
              }
            } else {
              Fluttertoast.showToast(
                msg: 'กรุณากดยอมรับเงื่อนไข',
                gravity: ToastGravity.SNACKBAR,
              );
            }
          },
          icon: const Icon(
            Icons.login,
            size: 0,
            color: Colors.white,
          ),
          label: const Text(
            "ลงทะเบียน",
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Kanit',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonaccept() {
    //TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 10, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? newValue) {
                      if (newValue != null) {
                        setState(() {
                          isChecked = newValue;
                        });
                      }
                    },
                  ),
                  const Text(
                    'ยอมรับเงื่อนไขการใช้บริการ',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    // โค้ดสำหรับแสดงหน้าข้อกำหนดการให้บริการ
                  },
                  child: const Text(
                    'ข้อกำหนดในการให้บริการ',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Kanit',
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const Text(
                  'และ',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Kanit',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // โค้ดสำหรับแสดงหน้าข้อกำหนดการให้บริการ
                  },
                  child: const Text(
                    'นโยบายความเป็นส่วนตัว*',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Kanit',
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            if (!isChecked)
              const Padding(
                padding: EdgeInsets.only(top: 1, left: 10),
                child: Text(
                  'กรุณากดยอมรับ',
                  style: TextStyle(
                    color: Color(0xFFA31E21),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}