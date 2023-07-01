import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:utcc_esport/src/constants/asset.dart';
import 'package:utcc_esport/src/provider/competition_provider.dart';
import 'package:intl/intl.dart';

class CreateCompetition extends StatefulWidget {
  const CreateCompetition({super.key});

  @override
  State<CreateCompetition> createState() => _CreateCompetitionState();
}

class _CreateCompetitionState extends State<CreateCompetition> {
  final _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Uint8List? _image;
  final _sizeBox = 4.0;
  final List<String> _typeList = <String>[
    'เดี่ยว',
  ];
  final List<int> _amountList = <int>[
    8,
  ];
  final List<String> _typeGameList = <String>[
    'FPS',
    'MOBA',
    'MMORPG',
    'RPG',
    'BTR',
  ];

  _uploadCompImageToStorage(Uint8List? image) {
    _storage.ref().child('CompImage').child(_auth.currentUser!.uid);
  }

  pickCompImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print("No Image Selected");
    }
  }

  selectGalleryImage() async {
    Uint8List im = await pickCompImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  String formatedDate(date) {
    final outPutDateFormat = DateFormat('dd/MM/yyyy');
    final outPutDate = outPutDateFormat.format(date);
    return outPutDate;
  }

  @override
  Widget build(BuildContext context) {
    final CompetitionProvider _competitionProvider =
        Provider.of<CompetitionProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "ชื่อรายการแข่ง",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: _sizeBox),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "ชื่อรายการแข่ง",
                contentPadding: EdgeInsets.all(18),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              onChanged: (value) {
                _competitionProvider.getFromData(compName: value);
              },
            ),
            SizedBox(height: _sizeBox),
            const Text(
              "ประเภท",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: _sizeBox),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(18),
                  border: OutlineInputBorder(),
                ),
                hint: Text("เลือก"),
                items: _typeList.map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _competitionProvider.getFromData(compType: value);
                  });
                }),
            SizedBox(height: _sizeBox),
            const Text(
              "จำนวนผู้เข้าแข่งขัน",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: _sizeBox),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(18),
                  border: OutlineInputBorder(),
                ),
                hint: Text("เลือก"),
                items: _amountList.map<DropdownMenuItem<int>>((e) {
                  return DropdownMenuItem<int>(
                    value: e,
                    child: Text(e.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _competitionProvider.getFromData(
                        compAmount: int.parse(value.toString()));
                  });
                }),
            SizedBox(height: _sizeBox),
            const Text(
              "ชื่อเกม",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: _sizeBox),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "ชื่อเกม",
                contentPadding: EdgeInsets.all(18),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              onChanged: (value) {
                _competitionProvider.getFromData(gameName: value);
              },
            ),
            SizedBox(height: _sizeBox),
            const Text(
              "ประเภทเกม",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: _sizeBox),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(18),
                  border: OutlineInputBorder(),
                ),
                hint: Text("เลือก"),
                items: _typeGameList.map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _competitionProvider.getFromData(gameType: value);
                  });
                }),
            SizedBox(height: _sizeBox),
            const Text(
              "ค่าสมัคร",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: _sizeBox),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    Asset.LOGO_IMAGE,
                    scale: MediaQuery.of(context).size.width * 0.025,
                  ),
                ),
                hintText: "จำนวนเหรียญ",
                contentPadding: EdgeInsets.all(18),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              autocorrect: false,
              onChanged: (value) {
                _competitionProvider.getFromData(fee: int.parse(value));
              },
            ),
            SizedBox(height: _sizeBox),
            const Text(
              "ระยะเวลาที่รับสมัคร",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: _sizeBox),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((value) {
                      setState(() {
                        _competitionProvider.getFromData(applyStartDate: value);
                      });
                    });
                  },
                  child: const Text("เริ่ม"),
                ),
                if (_competitionProvider.competitionData['applyStartDate'] !=
                    null)
                  Text(
                    formatedDate(
                      _competitionProvider.competitionData['applyStartDate'],
                    ),
                  ),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      ).then((value) {
                        setState(() {
                          _competitionProvider.getFromData(applyEndDate: value);
                        });
                      });
                    },
                    child: Text("สิ้นสุด")),
                if (_competitionProvider.competitionData['applyEndDate'] !=
                    null)
                  Text(
                    formatedDate(
                      _competitionProvider.competitionData['applyEndDate'],
                    ),
                  ),
              ],
            ),
            SizedBox(height: _sizeBox),
            const Text(
              "ระยะเวลาการแข่งขัน",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: _sizeBox),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((value) {
                      setState(() {
                        _competitionProvider.getFromData(compStartDate: value);
                      });
                    });
                  },
                  child: Text("เริ่ม"),
                ),
                if (_competitionProvider.competitionData['compStartDate'] !=
                    null)
                  Text(
                    formatedDate(
                      _competitionProvider.competitionData['compStartDate'],
                    ),
                  ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((value) {
                      setState(() {
                        _competitionProvider.getFromData(compEndDate: value);
                      });
                    });
                  },
                  child: Text("สิ้นสุด"),
                ),
                if (_competitionProvider.competitionData['compEndDate'] != null)
                  Text(
                    formatedDate(
                      _competitionProvider.competitionData['compEndDate'],
                    ),
                  ),
              ],
            ),
            SizedBox(height: _sizeBox),
            const Text(
              "รายละเอียด",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: _sizeBox),
            TextFormField(
              maxLength: 200,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "รายละเอียด",
                contentPadding: EdgeInsets.all(18),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              onChanged: (value) {
                _competitionProvider.getFromData(compDetail: value);
              },
            ),
            SizedBox(height: _sizeBox),
            const Text(
              "กฏการแข่งขัน",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: _sizeBox),
            TextFormField(
              maxLength: 200,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "กฏการแข่งขัน",
                contentPadding: EdgeInsets.all(18),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              autocorrect: false,
              onChanged: (value) {
                _competitionProvider.getFromData(compRule: value);
              },
            ),
            SizedBox(height: _sizeBox),
            const Text(
              "รางวัล",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: _sizeBox),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "จำนวนเงิน(บาท)",
                contentPadding: EdgeInsets.all(18),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              autocorrect: false,
              onChanged: (value) {
                _competitionProvider.getFromData(prize: int.parse(value));
              },
            ),
            SizedBox(height: _sizeBox),
            const Text(
              "อัพโหลดรูปภาพ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: _image != null
                  ? Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: MemoryImage(_image!),
                        ),
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "ไม่มีรูปภาพ",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA31E21),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  onPressed: () {
                    selectGalleryImage();
                  },
                  label: const Text(
                    "เลือกรูปภาพ",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  icon: const Icon(Icons.camera_alt),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: const Color(0xFFA31E21),
                  ),
                  onPressed: () {
                    print(_competitionProvider.competitionData['compName']);
                    print(_competitionProvider.competitionData['compType']);
                    print(_competitionProvider.competitionData['compAmount']);
                    print(_competitionProvider.competitionData['gameName']);
                    print(_competitionProvider.competitionData['gameType']);
                    print(_competitionProvider.competitionData['fee']);
                    print(_competitionProvider.competitionData['compDetail']);
                    print(_competitionProvider.competitionData['compRule']);
                    print(_competitionProvider.competitionData['prize']);
                  },
                  child: const Text(
                    "ยืนยันการสร้างรายการแข่งขัน",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
