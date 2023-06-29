import 'package:flutter/material.dart';
import 'package:utcc_esport/src/widgets/create_comp_widget.dart';

class CreateComp extends StatefulWidget {
  const CreateComp({super.key});

  @override
  State<CreateComp> createState() => _CreateCompState();
}

class _CreateCompState extends State<CreateComp> {
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
                "สร้างรายการแข่ง",
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
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CreateCompetition(),
          ],
        ),
      ),
    );
  }
}
