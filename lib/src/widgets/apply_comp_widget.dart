import 'package:flutter/material.dart';
import 'package:utcc_esport/src/widgets/apply_success_widget.dart';

class ApplyCompetition extends StatelessWidget {
  const ApplyCompetition({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        width: MediaQuery.of(context).size.width * 0.9,
        //height: MediaQuery.of(context).size.height * 0.37,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close), // ไอคอนของปุ่มปิด
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // ปิด AlertDialog เมื่อกดปุ่มปิด
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'ยืนยันการสมัครแข่ง',
                  style: TextStyle(
                    //color: Color.fromARGB(0, 0, 0, 0),
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'กรุณากรอกชื่อภายในเกม',
                    style: TextStyle(
                      //color: Color.fromARGB(0, 0, 0, 0),
                      fontSize: MediaQuery.of(context).size.width * 0.042,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0085),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'ชื่อภายในเกม',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'กรุณากรอก ID LINE สำหรับใช้ติดต่อ',
                    style: TextStyle(
                      //color: Color.fromARGB(0, 0, 0, 0),
                      fontSize: MediaQuery.of(context).size.width * 0.042,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0085),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'ID LINE',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                    ),
                  ),
                ],
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
                  showDialog(context: context,
                      builder: (BuildContext context){
                        return const ApplySuccess();
                      }
                  );
                },
                child: Text(
                  'ยืนยัน',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: MediaQuery.of(context).size.width * 0.045,
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
  }
}
