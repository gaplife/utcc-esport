import 'package:flutter/material.dart';

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
              onSaved: (String? compname) {},
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
          ],
        ),
      ),
    );
  }
}
