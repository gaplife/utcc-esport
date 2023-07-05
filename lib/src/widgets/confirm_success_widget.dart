import 'package:flutter/material.dart';
import 'package:utcc_esport/src/pages/pages.dart';

class ConfirmSuccess extends StatelessWidget {
  const ConfirmSuccess({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'อัพเดทสำเร็จ !',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const OrgLauncher();
                  }));
                },
                child: Text(
                  'ยืนยัน',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: MediaQuery.of(context).size.width * 0.046,
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
