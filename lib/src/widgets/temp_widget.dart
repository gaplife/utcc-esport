import 'package:flutter/material.dart';
import 'package:utcc_esport/src/constants/asset.dart';

class CompetitionWidget extends StatelessWidget {
  const CompetitionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/detailcomp');
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.168,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color.fromARGB(
                255, 0, 0, 0), // เปลี่ยนสีเส้นรอบกรอบที่นี่
            width: 1, // กำหนดความหนาของเส้นรอบกรอบ
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Image.network(
                'https://mpics.mgronline.com/pics/Images/566000004575901.JPEG',
                width: MediaQuery.of(context).size.width * 0.38,
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 6, 10),
              width: MediaQuery.of(context).size.width * 0.49,
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: const BoxDecoration(
                //border: Border.all(color: const Color(0x99000000)),
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Text(
                      'FIFA Champion Club SS1',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.037,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis, // เพิ่ม Overflow ที่นี่
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: MediaQuery.of(context).size.width * 0.48,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          width: MediaQuery.of(context).size.width * 0.046,
                          height: MediaQuery.of(context).size.height * 0.024,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffffffff),
                          ),
                          child: Icon(
                            Icons.sports_esports_rounded,
                            // สามารถเปลี่ยนเป็น Icon อื่นๆ ได้ตามต้องการ
                            color: const Color(0xFFA31E21), // สีของ Icon
                            size: MediaQuery.of(context).size.width *
                                0.05, // ขนาดของ Icon
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'FIFA Online 4',
                              style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * 0.037,
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // เพิ่ม Overflow ที่นี่
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.02,
                          decoration: BoxDecoration(
                            color: const Color(0xffa31e21),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'SPORT',
                              style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * 0.035,
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Row(
                      children: [
                        SizedBox(
                          child: Icon(
                            Icons.emoji_events, // เลือกไอคอนรูปถ้วยรางวัล
                            size: MediaQuery.of(context).size.width * 0.05,
                            color: const Color(0xffa31e21),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            '110,000',
                            style: TextStyle(
                              fontSize:
                              MediaQuery.of(context).size.width * 0.037,
                              fontWeight: FontWeight.w600,
                              //height: 1,
                            ),
                          ),
                        ),
                        Text(
                          ' บาท',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.037,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.03,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Icon(
                            Icons.person,
                            size: MediaQuery.of(context).size.width * 0.05,
                            color: const Color(0xffa31e21),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                          child: Text(
                            'เดี่ยว',
                            style: TextStyle(
                              fontSize:
                              MediaQuery.of(context).size.width * 0.037,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.w600,
                              //height: 1.1,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 2, 0, 0),
                          width: MediaQuery.of(context).size.width * 0.059,
                          height: MediaQuery.of(context).size.height * 0.03,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffffffff),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(Asset.COIN_IMAGE),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text(
                              '500',
                              style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * 0.037,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0,
                              0), // ปรับระยะห่างด้านซ้ายของปุ่ม "เติมเงิน"
                          width: MediaQuery.of(context).size.width * 0.14,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/detailcomp');
                            },
                            child: Text(
                              'ดูเพิ่มเติม',
                              style: TextStyle(
                                color: const Color(0xffa31e21),
                                fontSize:
                                MediaQuery.of(context).size.width * 0.032,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
