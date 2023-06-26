import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:utcc_esport/src/app.dart';

Future<String?> getUserTypeFromFirestore(String uid) async {
  DocumentSnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('Users').doc(uid).get();
  if (snapshot.exists) {
    Map<String, dynamic> data = snapshot.data()!;
    String? userType = data['userType'];
    return userType;
  }
  return null;
}

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        String? userType = await getUserTypeFromFirestore(user.uid);
        if (userType == 'Player') {
          initialRoute = '/launcher';
          runApp(const App());
        } else if (userType == 'Organizer') {
          initialRoute = '/orglauncher';
          runApp(const App());
        } else {
          runApp(const App());
        }
      } else {
        runApp(const App());
      }
    });
  });
}
