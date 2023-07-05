import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:utcc_esport/src/widgets/confirm_success_widget.dart';

class SelectWinner extends StatelessWidget {
  final dynamic competitionData;

  const SelectWinner({super.key, required this.competitionData});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Organizers');
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    var winner;

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
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: const Text(
                        "ผู้ชนะการแข่งขัน",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(18),
                              border: OutlineInputBorder(),
                            ),
                            hint: const Text("เลือก"),
                            items: competitionData['nameList']
                                .map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem<String>(
                                value: e,
                                child: Text(e.toString()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              winner = value;
                            }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 0, right: 0, bottom: 0),
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
                        onPressed: () async {
                          await _firestore
                              .collection('Competitions')
                              .doc(competitionData['compID'])
                              .update({
                            'winner': winner,
                          }).whenComplete(() {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const ConfirmSuccess();
                                });
                          });
                          ;
                        },
                        child: Text(
                          "ยืนยัน",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.055,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 0, right: 0, bottom: 0),
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
                        onPressed: () async {
                          await _firestore
                              .collection('Organizers')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .update({
                            'coin':
                                Userdata['coin'] + competitionData['poolFee'],
                          }).whenComplete(() async {
                            await _firestore
                                .collection('Competitions')
                                .doc(competitionData['compID'])
                                .delete()
                                .whenComplete(() {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const ConfirmSuccess();
                                  });
                            });
                          });
                        },
                        child: Text(
                          "ปิดการแข่งขัน",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.055,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
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
