import 'package:flutter/material.dart';

class Registercomp extends StatefulWidget {
  const Registercomp({super.key});

  @override
  State<Registercomp> createState() => _RegistercompState();
}

class _RegistercompState extends State<Registercomp> {
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
                "การแข่งขันที่ลงทะเบียน",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xff0c1629),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _registercomp(),
          ],
        ),
      ),
    );
  }

  Widget _registercomp() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color:
              const Color.fromARGB(255, 0, 0, 0), // เปลี่ยนสีเส้นรอบกรอบที่นี่
          width: 0.8,
          // กำหนดความหนาของเส้นรอบกรอบ
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(15, 15, 0, 15),
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(
                //     // color: const Color.fromARGB(
                //     //     255, 0, 0, 0), // เปลี่ยนสีเส้นรอบกรอบที่นี่
                //     // width: 1, // กำหนดความหนาของเส้นรอบกรอบ
                //     ),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://mpics.mgronline.com/pics/Images/566000004575901.JPEG'))),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: Text(
                    'FIFA Champion Club SS1',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis, // เพิ่ม Overflow ที่นี่
                    maxLines: 1,
                  ),
                ),
                Text(
                  'เริ่มแข่ง',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.037,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '20 พ.ค. 66, 09:00 - 22 พ.ค. 66',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.037,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          //Spacer(),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: const Color.fromARGB(255, 0, 0, 0),
              size: MediaQuery.of(context).size.height * 0.025,
            ),
          )
        ],
      ),
    );
  }
}
