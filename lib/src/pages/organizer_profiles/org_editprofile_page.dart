import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class OrganizerEditProfile extends StatefulWidget {
  const OrganizerEditProfile({super.key});

  @override
  State<OrganizerEditProfile> createState() => _OrganizerEditProfileState();
}

class _OrganizerEditProfileState extends State<OrganizerEditProfile> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? userEmail;
  String? userID;
  String? _profileImageUrl;
  String? newUserName;
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
                "ตั้งค่าโปรไฟล์",
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
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          height: MediaQuery.of(context).size.height * 0.82,
          child: Column(
            children: <Widget>[
              _editphoto(),
              _editname(),
              _editemail(),
              const Spacer(),
              _buttonconfirm(),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> _changeProfileImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'เลือกรูปภาพ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('ถ่ายรูปจากกล้อง'),
                onTap: () {
                  Navigator.pop(context);
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('เลือกรูปจากเครื่อง'),
                onTap: () {
                  Navigator.pop(context);
                  _getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
    return null;
  }

  void _getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('users_photo')
          .child(userEmail!) // ใช้ userEmail ในการกำหนดเป็นชื่อไฟล์
          .child('profile.jpg'); // เลือกชื่อไฟล์ที่ต้องการ

      final task = storageRef.putFile(File(image.path));

      try {
        final snapshot = await task.whenComplete(() {});
        final imageUrl = await snapshot.ref.getDownloadURL();
        print('URL : $imageUrl');

        setState(() {
          _profileImageUrl = imageUrl; // เก็บ URL รูปภาพลงในตัวแปร
        });
      } catch (error) {
        print('Error: $error');
      }
    }
  }

  Widget _editphoto() {
    String? currentImageUrl;
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: InkWell(
          onTap: () async {
            String? imageUrl = await _changeProfileImage();
            setState(() {
              currentImageUrl = imageUrl;
            });
          },
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(userID)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.exists) {
                return _getPhoto(snapshot,
                    currentImageUrl); // เรียกใช้ _getPhoto และส่งพารามิเตอร์ snapshot และ currentImageUrl
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _getPhoto(
      AsyncSnapshot<DocumentSnapshot> snapshot, String? currentImageUrl) {
    if (snapshot.hasData) {
      final userDocument = snapshot.data!.data() as Map<String, dynamic>;
      final profileImageUrl = userDocument['profileImageUrl'] as String?;
      final imageUrl = profileImageUrl;
      if (imageUrl != null && imageUrl.isNotEmpty) {
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: MediaQuery.of(context).size.width * 0.29,
          height: MediaQuery.of(context).size.height * 0.18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xff0c1629)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.black.withOpacity(1),
                  size: MediaQuery.of(context).size.height * 0.025,
                ),
              ),
            ],
          ),
        );
      } else {
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: MediaQuery.of(context).size.width * 0.29,
          height: MediaQuery.of(context).size.height * 0.18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xff0c1629)),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 48,
                color: Colors.grey,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.black.withOpacity(1),
                  size: MediaQuery.of(context).size.height * 0.03,
                ),
              ),
            ],
          ),
        );
      }
    } else {
      return const CircularProgressIndicator();
    }
  }

  Widget _editname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Text(
            "ชื่อ",
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
                final userDocument =
                    snapshot.data!.data() as Map<String, dynamic>;
                final username = userDocument['username'] as String?;
                final name = username ?? 'username';
                return TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: name,
                    contentPadding: const EdgeInsets.all(20),
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onChanged: (value) {
                    setState(() {
                      newUserName = value; // เก็บค่าชื่อใหม่ที่แก้ไข
                    });
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }

  void _updateUsername() async {
    try {
      if (userID != null) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userID)
            .update({
          'username': newUserName,
        });
      } else {
        print('ไม่สามารถอัปเดตข้อมูลได้: userID ไม่ได้ระบุ');
      }
    } catch (error) {
      print('เกิดข้อผิดพลาดในการอัปเดตชื่อ: $error');
    }
  }

  Widget _editemail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Text(
            "อีเมล",
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
                final userDocument =
                    snapshot.data!.data() as Map<String, dynamic>;
                final email = userDocument['email'] as String?;
                final useremail = email ?? 'email';
                return TextFormField(
                  readOnly: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: useremail,
                    contentPadding: const EdgeInsets.all(20),
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onChanged: (value) {
                    setState(() {
                      newUserName = value;
                    });
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
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
          onPressed: () async {
            if (newUserName != null) {
              _updateUsername();
            }
            _editprofilesuccess();

            if (_profileImageUrl != null) {
              if (userID != null) {
                await FirebaseFirestore.instance
                    .collection('Users')
                    .doc(userID)
                    .update({
                  'profileImageUrl': _profileImageUrl,
                });
              } else {
                print('ไม่สามารถอัปเดตข้อมูลได้: userID ไม่ได้ระบุ');
              }
            }
          },
          child: Text(
            "ยืนยันการเปลี่ยนแปลง",
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

  void _editprofilesuccess() {
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
                      'เปลี่ยนแปลงสำเร็จ !',
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
                      Navigator.popUntil(
                          context, ModalRoute.withName('/orgeditprofile'));
                      Navigator.pushReplacementNamed(
                          context, '/orgeditprofile');
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
