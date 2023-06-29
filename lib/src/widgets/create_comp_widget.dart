import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utcc_esport/src/constants/asset.dart';
import 'package:utcc_esport/src/provider/competition_provider.dart';

class CreateCompetition extends StatefulWidget {
  const CreateCompetition({super.key});

  @override
  State<CreateCompetition> createState() => _CreateCompetitionState();
}

class _CreateCompetitionState extends State<CreateCompetition> {
  final _sizeBox = 2.0;
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
                onChanged: (String? value) {}),
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
                onChanged: (int? value) {}),
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
              onSaved: (String? gamename) {},
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
                onChanged: (String? value) {}),
            SizedBox(height: _sizeBox),
            const Text(
              "ค่าธรรมเนียม",
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
              onSaved: (String? fee) {},
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
                      );
                    },
                    child: Text("เริ่ม")),
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
                      );
                    },
                    child: Text("สิ้นสุด")),
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
                      );
                    },
                    child: Text("เริ่ม")),
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
                      );
                    },
                    child: Text("สิ้นสุด")),
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
              onSaved: (String? detail) {},
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
              onSaved: (String? rule) {},
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
              onSaved: (String? prize) {},
            ),
            SizedBox(height: _sizeBox),
            const Text(
              "อัพโหลดรูปภาพ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: _sizeBox),
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
