import 'package:flutter/material.dart';

import '../../constants/asset.dart';

class OrganizerWithdraw extends StatefulWidget {
  const OrganizerWithdraw({super.key});

  @override
  State<OrganizerWithdraw> createState() => _OrganizerWithdrawState();
}

class _OrganizerWithdrawState extends State<OrganizerWithdraw> {
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
                "ถอนเงิน",
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
            _balance(),
            _editcoin(),
            _iconexchange(),
            _money(),
            _rateexchange(),
            _buttonconfirm(),
          ],
        ),
      ),
    );
  }

  Widget _balance() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'เหรียญที่มี',
                  style: TextStyle(
                    //color: Color(0xffffffff),
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 2, 10, 0),
                  width: MediaQuery.of(context).size.width * 0.065,
                  height: MediaQuery.of(context).size.height * 0.038,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffffffff),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Asset.COIN_IMAGE),
                    ),
                  ),
                ),
                Text(
                  '50,000',
                  style: TextStyle(
                    //color: Color(0xffffffff),
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _editcoin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: Text(
            "จำนวนเหรียญ (ขั้นต่ำ 100 เหรียญ)",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            readOnly: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: '-',
              contentPadding: const EdgeInsets.all(15),
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  Widget _iconexchange() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Icon(
        Icons.currency_exchange,
        size: MediaQuery.of(context).size.width * 0.2,
        color: const Color(0xffa31e21),
      ),
    );
  }

  Widget _money() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Text(
            "จำนวนเงิน",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            readOnly: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: '-',
              contentPadding: const EdgeInsets.all(15),
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  Widget _rateexchange() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'อัตราการแลกเปลี่ยน',
              style: TextStyle(
                //color: Color(0xffffffff),
                fontSize: MediaQuery.of(context).size.height * 0.025,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            width: MediaQuery.of(context).size.width * 0.48,
            //height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                  width: MediaQuery.of(context).size.width * 0.065,
                  height: MediaQuery.of(context).size.height * 0.038,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffffffff),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Asset.COIN_IMAGE),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                  child: Text(
                    '100 = 50 บาท',
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buttonconfirm() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
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
            _registersuccess();
          },
          child: Text(
            "ยืนยัน",
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

  void _registersuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.05,
              0,
              MediaQuery.of(context).size.width * 0.05,
              0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Container(
            margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: MediaQuery.of(context).size.width * 0.15,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'ถอนเงินสำเร็จ !',
                      style: TextStyle(
                        //color: Color.fromARGB(0, 0, 0, 0),
                        fontSize: MediaQuery.of(context).size.width * 0.053,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffa31e21),
                    ),
                    onPressed: () {
                      Navigator.popUntil(
                          context, ModalRoute.withName('/orgwithdraw'));
                    },
                    child: Text(
                      'ยืนยัน',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: MediaQuery.of(context).size.width * 0.046,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
