// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ConditionWidget extends StatefulWidget {
  const ConditionWidget({Key? key}) : super(key: key);

  @override
  _ConditionWidgetState createState() => _ConditionWidgetState();
}

class _ConditionWidgetState extends State<ConditionWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showPopupcondition(context);
      },
      child: const Text(
        'ข้อกำหนดในการให้บริการ',
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Kanit',
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  void showPopupcondition(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('ข้อกำหนดการให้บริการ')),
          content: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: MediaQuery.of(context).size.width *
                0.9, // กำหนดความกว้างของ Popup
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 1,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(153, 0, 0, 0),
                  ),
                ),
                const Text(
                  '   ผู้ใช้บริการแอพพลิเคชั่น E-Sport ตกลงและยอมรับข้อตกลงรวมถึงเงื่อนไขการใช้บริการต่าง ๆ ดังนี้',
                ),
                const Text(
                    '   1. แอพพลิเคชั่น E-Sport เป็นแอพที่ออก แบบมาสำหรับการให้บริการ ที่เกี่ยวข้องกับการเป็นสื่อกลาง ในการจัดการแข่งขันเพื่อให้ผู้ที่ต้องการจัดแข่งขันรายการเล็ก มีโอกาสในการจัดแข่ง E-Sport และให้คนทั่วไปที่สนใจอยากลองเข้าแข่งขันได้มีโอกาศในการเข้าแข่งขัน และยังมีบริการข่าวสารที่เกี่ยวข้องกับ E-Sprot โดยเราจะให้ข้อมูลที่เป็นปัจจุบัน โดยมีผลการแข่งขัน ข่าวสารวงการเกมและอื่น ๆ'),
                const Text(
                    '   2. เรามีความตั้งใจที่จะให้ข้อมูลเป็นความจริงและเชื่อถือได้ให้แก่ผู้ใช้งาน โดยทีมงานของเราจะพยายามตรวจสอบและยืนยันข้อมูลที่เผยเพร่เพื่อให้มีความถูกต้อง'),
                const Text(
                    '   3. เรามีความมุ่งหวังในการที่จะพัฒนาและปรับปรุงแอพของเราอยู่เสมอเพื่อให้ผู้ใช้งานนั้นได้รับประสบการณืที่ดีที่สุด แล้วเราจะมีการอัพเดทและเพิ่มฟีเจอร์ใหม่ ๆ เข้ามาเรื่อย ๆ เพื่อตอบสนองความต้องการของผู้ใช้งาน'),
                const Text(
                    '   4. เราให้ความสำคัญกับความเป็นส่วนตัวของผู้ใช้งาน และจะดูแลปกป้องข้อมูลส่วนบุคคลตามนโยบายความเป็นส่วนตัวของเรา โดยเราจะไม่มีการเผยแพร่ข้อมูลส่วนบุคคลของผู้ใช้งานแก่บุคคลอื่นภายนอกโดยไม่ได้รับอนุญาติจากผู้ใช้งาน'),
                const Text(
                    '   5. เราขอสงวนลิขสิทธิ์ทุกอย่างเกี่ยวกับเนื้อหาในแอพของทางเรา ผู้ใช้งานไม่ได้รับสิทธิ์ในการเผยแพร่หรือใช้เนื้อหาแอพ เพื่อวัตถุประสงค์ทางการค้าหรือวัตถุประสงค์อื่น ๆ ที่ไม่ดี โดยไม่ได้รับอนุญาตจากเรา'),
                const Text(
                    '   6. เรายินดีที่จะรับฟังความคิดเห็นและข้อเสนอแนะจากผู้ใช้งานทุกคน เพื่อที่จะปรับปรุงแก้ไขและพัฒนาแอพของเราให้ดียิ่งขึ้น คุณสามารถติดต่อเราได้ผ่านทางช่องทางที่เราได้แจ้งไว้ในหน้าติดต่อ'),
              ],
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(
                      30, 10, 30, 10), // กำหนดระยะห่างในปุ่ม
                  backgroundColor:
                      const Color(0xFFA31E21), // กำหนดสีพื้นหลังของปุ่ม
                ),
                child: Text(
                  'ปิด',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white, // กำหนดสีตัวอักษร
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
