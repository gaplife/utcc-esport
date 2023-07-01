import 'package:flutter/material.dart';

class UpdateMycompetition extends StatefulWidget {
  const UpdateMycompetition({super.key});

  @override
  State<UpdateMycompetition> createState() => _UpdateMycompetitionState();
}

class _UpdateMycompetitionState extends State<UpdateMycompetition> {
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
                "อัพเดทผลการแข่งขัน",
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
          children: <Widget>[],
        ),
      ),
    );
  }
}
