import 'package:flutter/material.dart';
import 'package:utcc_esport/src/widgets/competition_widget.dart';

class OrgAllComp extends StatefulWidget {
  const OrgAllComp({Key? key}) : super(key: key);

  @override
  State<OrgAllComp> createState() => _OrgAllCompState();
}

class _OrgAllCompState extends State<OrgAllComp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.sports_esports,
                      size: 35,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "การแข่งขันทั้งหมด",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          // actions: <Widget>[
          //   IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
          // ],
          //centerTitle: const EdgeInsets.all(10),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: const Center(
          child: Column(children: <Widget>[CompetitionWidget()]),
        ));
  }

// Widget _boxsearch() {
//   return Container(
//     padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//     width: MediaQuery.of(context).size.width * 0.99, // ปรับค่าตามต้องการ
//     height: MediaQuery.of(context).size.height * 0.09,
//     child: TextField(
//       decoration: InputDecoration(
//         suffixIcon: const Icon(Icons.search),
//         hintText: "ค้นหา",
//         contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
//         hintStyle: TextStyle(
//           fontSize: MediaQuery.of(context).size.height * 0.024,
//           fontFamily: 'Kanit',
//         ),
//         border: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//       ),
//       onChanged: (value) {},
//     ),
//   );
// }
}
