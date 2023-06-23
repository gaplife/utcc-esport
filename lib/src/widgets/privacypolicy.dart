import 'package:flutter/material.dart';

class PrivacyPolicyWidgets extends StatefulWidget {
  const PrivacyPolicyWidgets({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyWidgetsState createState() => _PrivacyPolicyWidgetsState();
}

class _PrivacyPolicyWidgetsState extends State<PrivacyPolicyWidgets> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showPopuppolicy(context);
      },
      child: const Text(
        'นโยบายความเป็นส่วนตัว',
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Kanit',
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  void showPopuppolicy(BuildContext context) {
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
                  '   ผู้ใช้บริการแอพพลิเคชั่น E-Sport ตกลงและยอมรับนโยบายส่วนตัวรวมถึงเงื่อนไขการใช้บริการต่าง ๆ ดังนี้',
                ),
                const Text(
                    '   1. แอพพลิเคชั่น E-Sport จะมีการเก็บข้อมูลส่วนบุคคลซึ่งเราเข้าใจความสำคัญของความเป็นส่วนตัวของผู้ใช้งาน ดังนั้นเราจะเก็บข้อมูลส่วนบุคคลของคุณเฉพาะตามที่จำเป็นในการให้บริการของเราเท่านั้น ไม่มีข้อมูลส่วนบุคคลของคุณที่จะถูกเผยแพร่หรือใช้เพื่อวัตถุประสงค์อื่น ๆ โดยไม่ได้รับอนุญาตจากคุณ'),
                const Text(
                    '   2. ทางเราจะใช้ข้อมูลของคุณเพื่อให้บริการและปรับปรุงการบริการของคุณในการใช้แอพของเรา โดยเราจะไม่นำข้อมูลส่วนบุคคลของคุณมาขายหรือให้กับบุคคลภายนอกเพื่อวัตถุ ประสงค์ทางการตลาดหรือวัตถุประสงค์ที่ไม่เกี่ยวข้องกับการให้บริการของเรา'),
                const Text(
                    '   3. คุณสามารถขอแก้ไขหรืออัพเดตข้อมูลส่วนบุคคลที่เกี่ยวข้องกับแอพของเราได้ตลอดเวฃส และเราจะให้ความสำคัญและปฏิบัติตามข้อกำหนดที่เกี่ยวข้องกับการแก้ไขหรือลบข้อมูลส่วนบุคคลของคุณ'),
                const Text(
                    '   4. เราใส่ใจความปลอดภัยของข้อมูลส่วนบุคคล โดยเราใช้มาตราการทางเทคนิคอละเทคโนโลยีที่เหมาะสมเพื่อปกป้องข้อมูลของคุณจากการเข้าถึงที่ไม่ได้รับอนุญาต อย่างไรก็ตามถ้าคุณนำข้อมูลส่วนบุคคลของคุณออกไปใช้ข้างนอกที่ไม่เกี่ยวกับทางแอพ เราจะไม่มีการรับประกันข้อมูลที่ไม่ได้ใช้งานเกี่ยวกับแอพของเราทุกกรณี'),
                const Text(
                    '   5. เราอาจใช้คุกกี้และเทคโนโลยีติดตามอื่น ๆ เพื่อเก็บข้อมูลเพิ่มเติมเกี่ยวกับการใช้แอพของเราเพื่อเอาไว้ใช้ในการปรับปรุงการใช้งานให้ดียิ่งขึ้น คุณสามารถเลือกปฏิเสธการใช้คุกกี้หรือเปิดใช้งานการติมตามอื่น ๆ ผ่านการตั้งค่าบนอุปกรณ์ของคุณได้อย่างไรก็ตาม การปฏิเสธการใช้งานคุกกี้หรือไม่เปิดใช้งานบางฟีเจอร์อาจส่งผลให้คุณไม่สามารถใช้งานบางส่วนของแอพเราได้'),
                const Text(
                    '   6. แอพของเราอาจมีการเชื่อมต่อกับบริการภายนอก เช่นเว็บไซท์หรือแพลตฟอร์มสื่อสังคม เพื่อให้คุณสามารถแชร์เนื้อหาหรือเข้าถึงข้อมูลเพิ่มเติมได้ โปรดทราบว่าการเชื่อมต่อกับบริการภายนอกอาจมีนโยบายความเป็นส่วนตัวและข้อกำหนดการใช้งานที่แตกต่างกันไป และคุณจะต้องยอมรับและปฏิบัติตามนโยบายเหล่านี้เมื่อคุณเข้าถึงบริการภายนอกดังกล่าว'),
                const Text(
                  '   หากคุณมีคำถามหรือข้อสงสัยอะไรเกี่ยวกับนโยบายความเป็นส่วนตัวของเรา โปรดติดต่อเราทางช่องทางการติดต่อที่แจ้งเอาไว้ในแอพ',
                ),
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
