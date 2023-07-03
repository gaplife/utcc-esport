import 'package:flutter/material.dart';
import 'package:utcc_esport/src/constants/asset.dart';
import '../../widgets/widgets.dart';

class OrgHomePage extends StatefulWidget {
  const OrgHomePage({super.key});

  @override
  State<OrgHomePage> createState() => _OrgHomePageState();
}

class _OrgHomePageState extends State<OrgHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                Asset.LOGO_IMAGE,
                scale: 7.2,
                alignment: Alignment.centerRight,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "E-SPORT",
                style: TextStyle(
                  color: Color(0xFFA31E21),
                  fontSize: 36,
                  fontFamily: 'Barlow',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          )
        ],
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _competition(context),
            const CompetitionWidget(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/createcomp');
        },
        backgroundColor: const Color(0xFFA31E21),
        label: Text(
          "สร้างรายการแข่ง",
          style: TextStyle(
              fontFamily: 'Kanit',
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.w800),
        ),
        icon: Icon(
          Icons.sports_esports,
          size: MediaQuery.of(context).size.width * 0.08,
          color: Colors.white,
        ),
      ),
    );
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
//             borderRadius: BorderRadius.all(Radius.circular(10))),
//       ),
//       onChanged: (value) {},
//     ),
//   );
// }
}

Widget _competition(BuildContext context) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                'รายการแข่งขันของฉัน',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'ดูทั้งหมด',
                  style: TextStyle(
                    color: const Color(0xFFA31E21),
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
