import 'package:flutter/material.dart';
import 'package:utcc_esport/src/constants/asset.dart';

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
      body: Center(
        child: Column(
          children: <Widget>[
            _contactfacebook(),
            // _contactmail(),
            // _contacttell(),
          ],
        ),
      ),
    );
  }

  Widget _contactfacebook() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
          color: Color(0xFF0C1629),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Icon(
              Icons.facebook,
              size: MediaQuery.of(context).size.width * 0.15,
              color: Colors.white,
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'E-Sport',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _contactmail() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 1, 5, 36),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Icon(
              Icons.mail,
              size: MediaQuery.of(context).size.width * 0.15,
              color: Colors.white,
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'esport_contact@gmail.com',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _contacttell() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 1, 5, 36),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Icon(
              Icons.phone,
              size: MediaQuery.of(context).size.width * 0.15,
              color: Colors.white,
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '02-345-6789',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
