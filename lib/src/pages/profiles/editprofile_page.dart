import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  DecorationImage? _profileImage;
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
        backgroundColor: const Color(0xFF0C1629),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _editphoto(),
            _editname(),
            _editlastname(),
            _editemail(),
            _buttonconfirm(),
          ],
        ),
      ),
    );
  }

  void _changeProfileImage() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  'เลือกรูปภาพ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('ถ่ายรูปจากกล้อง'),
                onTap: () {
                  Navigator.pop(context);
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('เลือกรูปจากเครื่อง'),
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
  }

  void _getImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        _profileImage = DecorationImage(
          fit: BoxFit.contain,
          image: FileImage(File(image.path)),
        );
      });
    }
  }

  Widget _editphoto() {
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: InkWell(
          onTap: () {
            // เรียกฟังก์ชันเปลี่ยนรูปภาพ
            _changeProfileImage();
          },
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: MediaQuery.of(context).size.width * 0.29,
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xff0c1629)),
                  image: const DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                        'https://scontent.fbkk22-7.fna.fbcdn.net/v/t1.18169-9/22449595_1515710551829373_1094037456389629918_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGQ1w1Na8tq52BliYudPx4TyC9jHWEQNNvIL2MdYRA028vwwrJQkRH5K9NUtVYsC-YG8LLdoh5lJVJcqi0Cp2q1&_nc_ohc=xyW49OH-h20AX_AeC_b&_nc_ht=scontent.fbkk22-7.fna&oh=00_AfBvLMW4xZmZstp0Zc7gF5NhXbrh_20_0FpY41EmNVHsYA&oe=649D70FC'),
                  ),
                ),
              ),
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
        ),
      ),
    );
  }

  Widget _editname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
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
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Assawin",
              contentPadding: EdgeInsets.all(20),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
          ),
        ),
      ],
    );
  }

  Widget _editlastname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Text(
            "นามสกุล",
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
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Namkort",
              contentPadding: EdgeInsets.all(20),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
          ),
        ),
      ],
    );
  }

  Widget _editemail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
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
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "mod1212@gmail.com",
              contentPadding: EdgeInsets.all(20),
              border: OutlineInputBorder(),
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
            _editprofilesuccess();
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
                          context, ModalRoute.withName('/editprofile'));
                    },
                    child: Text(
                      'ยืนยัน',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
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
