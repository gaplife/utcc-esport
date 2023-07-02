// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ResultcompWidget extends StatefulWidget {
  const ResultcompWidget({Key? key}) : super(key: key);

  @override
  _ResultcompWidgetState createState() => _ResultcompWidgetState();
}

class _ResultcompWidgetState extends State<ResultcompWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showPopupcondition(context);
      },
      child: const Text(
        'ผลการแข่งขัน',
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Center(
            child: Text(
              'ผลการแข่งขัน',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.025,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          content: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: MediaQuery.of(context).size.width *
                0.9, // กำหนดความกว้างของ Popup
            //height: MediaQuery.of(context).size.height * 0.5
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Icon(
                    Icons.emoji_events,
                    size: MediaQuery.of(context).size.width * 0.2,
                    color: const Color(0xffD4AF37),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ผู้ชนะ',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'รางวัล',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Masw',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '5,000 บาท',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
            ),
          ],
        );
      },
    );
  }
}
