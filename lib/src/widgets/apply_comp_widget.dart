import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:utcc_esport/src/widgets/widgets.dart';
import 'package:uuid/uuid.dart';

class ApplyCompetition extends StatelessWidget {
  final dynamic competitionData;

  const ApplyCompetition({super.key, required this.competitionData});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    var inGameName;
    var lineID;
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> Userdata =
              snapshot.data!.data() as Map<String, dynamic>;
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              width: MediaQuery.of(context).size.width * 0.9,
              //height: MediaQuery.of(context).size.height * 0.37,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close), // ไอคอนของปุ่มปิด
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // ปิด AlertDialog เมื่อกดปุ่มปิด
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'ยืนยันการสมัครแข่ง',
                        style: TextStyle(
                          //color: Color.fromARGB(0, 0, 0, 0),
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'กรุณากรอกชื่อภายในเกม',
                          style: TextStyle(
                            //color: Color.fromARGB(0, 0, 0, 0),
                            fontSize: MediaQuery.of(context).size.width * 0.042,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.0085),
                        TextFormField(
                          onChanged: (value) {
                            inGameName = value;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'ชื่อภายในเกม',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'กรุณากรอก ID LINE สำหรับใช้ติดต่อ',
                          style: TextStyle(
                            //color: Color.fromARGB(0, 0, 0, 0),
                            fontSize: MediaQuery.of(context).size.width * 0.042,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.0085),
                        TextFormField(
                          onChanged: (value) {
                            lineID = value;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'ID LINE',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    alignment: Alignment.center,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xffa31e21),
                      ),
                      onPressed: () async {
                        EasyLoading.show(status: 'กำลังดำเนินการ');
                        if (competitionData['playerAmount'] >=
                            competitionData['compAmount']) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const ShowLimitPlayer();
                              });
                        } else {
                          await _firestore
                              .collection('Competitions')
                              .doc(competitionData['compID'])
                              .update(
                            {
                              'playerAmount':
                                  competitionData['playerAmount'] + 1,
                              'poolFee': competitionData['poolFee'] +
                                  competitionData['fee'],
                            },
                          ).whenComplete(() async {
                            await _firestore
                                .collection('Users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update(
                              {
                                'coin':
                                    Userdata['coin'] - competitionData['fee'],
                              },
                            ).whenComplete(() async {
                              final applyID = Uuid().v4();
                              await _firestore
                                  .collection('Apply')
                                  .doc(applyID)
                                  .set(
                                {
                                  'applyID': applyID,
                                  'compID': competitionData['compID'],
                                  'userID': Userdata['userID'],
                                  'organizerID': competitionData['organizerID'],
                                  'compName': competitionData['compName'],
                                  'compImageURL':
                                      competitionData['compImageURL'],
                                  'inGameName': inGameName,
                                  'lineID': lineID,
                                },
                              ).whenComplete(() {
                                EasyLoading.dismiss();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const ApplySuccess();
                                    });
                              });
                            });
                          });
                        }
                      },
                      child: Text(
                        'ยืนยัน',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: MediaQuery.of(context).size.width * 0.045,
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
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
