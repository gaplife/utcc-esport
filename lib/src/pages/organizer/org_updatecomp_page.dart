import 'package:flutter/material.dart';

class UpdateComp extends StatefulWidget {
  final dynamic competitionData;

  const UpdateComp({super.key, required this.competitionData});

  @override
  State<UpdateComp> createState() => _UpdateCompState();
}

class _UpdateCompState extends State<UpdateComp> {
  get competitionData => widget.competitionData;
  final TextEditingController compNameController = TextEditingController();
  final TextEditingController compTypeController = TextEditingController();
  final TextEditingController compAmountController = TextEditingController();
  final TextEditingController gameNameController = TextEditingController();
  final _sizeBox = 4.0;


  @override
  void initState() {
    setState(() {
      compNameController.text = competitionData['compName'];
      compTypeController.text = competitionData['compType'];
      compAmountController.text = competitionData['compAmount'].toString();
      gameNameController.text = competitionData['gameName'];
    });
    super.initState();
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
                "แก้ไขข้อมูลรายการแข่ง",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "ชื่อรายการแข่ง",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: _sizeBox),
              TextFormField(
                controller: compNameController,
                decoration: const InputDecoration(
                  hintText: "ชื่อรายการแข่ง",
                  contentPadding: EdgeInsets.all(18),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                autocorrect: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "กรุณากรอกชื่อรายการแข่ง";
                  }
                  return null;
                },
                onChanged: (value) {
                  // _competitionProvider.getFromData(compName: value);
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
              TextFormField(
                enabled: false,
                controller: compTypeController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(18),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: _sizeBox),
              const Text(
                "จำนวนผู้เข้าแข่งขัน",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: _sizeBox),
              TextFormField(
                enabled: false,
                controller: compAmountController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(18),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: _sizeBox),
              const Text(
                "ชื่อเกม",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return "กรุณากรอกชื่อเกม";
                  }
                  return null;
                },
                controller: gameNameController,
                onChanged: (value) {
                  // _competitionProvider.getFromData(gameName: value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
