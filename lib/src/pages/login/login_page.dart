import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:utcc_esport/src/constants/asset.dart';
import 'package:utcc_esport/src/models/profile.dart';
import 'package:utcc_esport/src/config/theme.dart' as custom_theme;
import 'package:utcc_esport/src/pages/pages.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  bool _passwordVisible = false;
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

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
              title: Text(
                "เข้าสู่ระบบ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.053,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w800),
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
                          _welcome(),
                          _boxemail(),
                          _boxpass(),
                          _buttonconfirm(),
                          _text(),
                          _buttonloginfacebook(),
                          _buttonlogingoogle(),
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

  Widget _welcome() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.048, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "ยินดีต้อนรับ",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontFamily: 'Mitr',
                color: Colors.black),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.002,
          ),
          Text(
            "กรุณากรอกอีเมลและรหัสผ่านเพื่อเข้าสู่ระบบ",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: Colors.black54,
                fontFamily: 'Kanit'),
          ),
        ],
      ),
    );
  }

  Widget _boxemail() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.012, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              hintText: "อีเมล",
              contentPadding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.045),
              border: const OutlineInputBorder(),
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
    );
  }

  Widget _boxpass() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.012, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              hintText: "รหัสผ่าน",
              contentPadding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.045),
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
            onSaved: (String? password) {
              profile.password = password;
            },
            validator: RequiredValidator(errorText: "กรุณากรอกรหัสผ่าน"),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 0, left: MediaQuery.of(context).size.width * 0.62),
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
      ),
    );
  }

  Widget _buttonconfirm() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.095, left: 20, right: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.07,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              backgroundColor: (custom_theme.Theme.baseColor)),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              try {
                await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: profile.email!,
                  password: profile.password!,
                )
                    .then((value) {
                  formKey.currentState!.reset();
                  Fluttertoast.showToast(
                      msg: "เข้าสู่ระบบสำเร็จ", gravity: ToastGravity.CENTER);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/launcher',
                    (route) => false,
                  );
                });
              } on FirebaseAuthException {
                Fluttertoast.showToast(
                  msg: 'อีเมล หรือ รหัสผ่านไม่ถูกต้อง',
                  gravity: ToastGravity.SNACKBAR,
                );
              }
            }
          },
          icon: const Icon(
            Icons.login,
            size: 0,
            color: Colors.white,
          ),
          label: Text(
            "เข้าสู่ระบบ",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.055,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _text() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.022,
            left: 25,
            right: 25),
        child: Text(
          "- - - - - -  หรือเชื่อมต่อกับบัญชีอื่นของคุณ - - - - - -",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontFamily: 'Kanit',
              color: Colors.black54),
        ),
      ),
    );
  }

  Widget _buttonloginfacebook() {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02, left: 20, right: 20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: const Color(0xFF325BA9)),
        onPressed: () {},
        icon: Icon(
          Icons.facebook,
          size: MediaQuery.of(context).size.width * 0.06,
          color: Colors.white,
        ),
        label: Text(
          "เชื่อมต่อกับ Facebook",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.055,
            fontFamily: 'Kanit',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buttonlogingoogle() {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02, left: 20, right: 20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Colors.black54)),
            backgroundColor: const Color(0xffffffff)),
        onPressed: () {},
        icon: Image.asset(
          Asset.GOOGLE_IMAGE,
          height: MediaQuery.of(context).size.height * 0.025,
          width: MediaQuery.of(context).size.width * 0.055,
        ),
        label: Text(
          "เชื่อมต่อกับ Google",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.055,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.bold,
              color: Colors.black54),
        ),
      ),
    );
  }
}
