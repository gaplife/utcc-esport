import 'package:flutter/material.dart';

class ListName extends StatefulWidget {
  const ListName({super.key});

  @override
  State<ListName> createState() => _ListNameState();
}

class _ListNameState extends State<ListName> {
  List<Map<String, String>> dataList = [
    {
      'name': 'ManowDenzo',
      'idline': 'mamanaow12',
    },
    {
      'name': 'TheMasw',
      'idline': 'themod11',
    },
    {
      'name': 'GGEZ',
      'idline': 'ezez55',
    },
    {
      'name': 'VaiDemon',
      'idline': 'demonlo',
    },
    {
      'name': 'Parking',
      'idline': 'theparking',
    },
    // สามารถเพิ่มข้อมูลเพิ่มเติมตามต้องการ
  ];
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
                "รายชื่อผู้เข้าแข่งขัน",
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _photocompetition(),
            _table(dataList),
            _buttonconfirm(),
          ],
        ),
      ),
    );
  }

  Widget _photocompetition() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://mpics.mgronline.com/pics/Images/566000004575901.JPEG',
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'FIFA Champion Club SS1',
              style: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _table(List<Map<String, String>> dataList) {
    //double tableHeight = (dataList.length * 55).toDouble();
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Table(
        columnWidths: {
          0: FractionColumnWidth(0.6), // กำหนดความกว้างคอลัมน์แรกเป็น 60%
          1: FractionColumnWidth(0.4), // กำหนดความกว้างคอลัมน์ที่สองเป็น 40%
        },
        children: [
          // สร้างแถวหัวตาราง
          TableRow(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            children: [
              TableCell(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text(
                    'รายชื่อผู้สมัคร',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.019,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'ID Line',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.019,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // สร้างแถวข้อมูลในตารางโดยใช้ ListView.builder()
          ...dataList.map((data) {
            return TableRow(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(0)),
              children: [
                TableCell(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: Text(
                      data['name'] ?? '',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        //color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.019,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      data['idline'] ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.019,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
          // สามารถเพิ่มแถวข้อมูลเพิ่มเติมตามต้องการ
        ],
      ),
    );
  }

  Widget _buttonconfirm() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.065,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffa31e21),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/listname');
          },
          child: Text(
            "อัพเดทผลการแข่งขัน",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.055,
              fontFamily: 'Kanit',
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
