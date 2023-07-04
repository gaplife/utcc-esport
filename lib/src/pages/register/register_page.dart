import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:utcc_esport/src/models/profile.dart';
import 'package:utcc_esport/src/widgets/condition.dart';
import 'package:utcc_esport/src/widgets/privacypolicy.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final _textSize = 18.0;

  Profile profile = Profile();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");

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
                "สมัครสมาชิก",
                style: TextStyle(
                    color: Colors.black, fontSize: 22, fontFamily: 'Mitr'),
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
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      width: MediaQuery.of(context).size.width * 0.9,
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
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      width: MediaQuery.of(context).size.width * 0.9,
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
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      width: MediaQuery.of(context).size.width * 0.9,
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
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      width: MediaQuery.of(context).size.width * 0.9,
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
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: const Color(0xFFA31E21)),
        onPressed: () async {
          if (isChecked) {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();

              try {
                await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                  email: profile.email!,
                  password: profile.password!,
                )
                    .then((userCredential) {
                  final String userID = FirebaseAuth.instance.currentUser!.uid;

                  userCollection.doc(userID).set({
                    "userID": userID,
                    "username": profile.username,
                    "email": profile.email,
                    "password": profile.password,
                    "userType": "Player",
                    "profileImageUrl": profile.profileImageUrl,
                    "coin": 1000,
                  });

                  formKey.currentState!.reset();
                  _registersuccess();
                });
              } on FirebaseAuthException catch (e) {
                String? messageemailerror;
                if (e.code == 'email-already-in-use') {
                  messageemailerror =
                      "มีอีเมลนี้ในระบบแล้ว โปรดใช้อีเมลอื่นแทน";
                } else if (e.code == 'weak-password') {
                  messageemailerror = "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
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
            fontWeight: FontWeight.w800,
            color: Colors.white,
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
                    const ConditionWidget()
                        .createState()
                        .showPopupcondition(context);
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
                    const PrivacyPolicyWidgets()
                        .createState()
                        .showPopuppolicy(context);
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

  void _registersuccess() {
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
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.27,
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
                      'ลงทะเบียนสำเร็จ !',
                      style: TextStyle(
                        //color: Color.fromARGB(0, 0, 0, 0),
                        fontSize: MediaQuery.of(context).size.width * 0.052,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'กรุณาตรวจสอบอีเมลเพื่อยืนยัน',
                      style: TextStyle(
                        //color: Color.fromARGB(0, 0, 0, 0),
                        fontSize: MediaQuery.of(context).size.width * 0.052,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
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
                      'ปิด',
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
