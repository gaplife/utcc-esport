import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utcc_esport/src/app.dart';
import 'package:utcc_esport/src/provider/competition_provider.dart';

Future<String?> getUserTypeFromFirestore(String uid) async {
  DocumentSnapshot<Map<String, dynamic>> userSnapshot =
      await FirebaseFirestore.instance.collection('Users').doc(uid).get();

  if (userSnapshot.exists) {
    Map<String, dynamic> userData = userSnapshot.data()!;
    String? userType = userData['userType'];
    if (userType != null) {
      return userType;
    }
  }
  // ถ้าไม่เจอข้อมูลใน Collection 'Users' หรือไม่มี 'userType' ในข้อมูล ให้ตรวจสอบใน Collection 'Organizers'
  DocumentSnapshot<Map<String, dynamic>> organizerSnapshot =
      await FirebaseFirestore.instance.collection('Organizers').doc(uid).get();

  if (organizerSnapshot.exists) {
    // หากเจอ Organizer ใน Collection 'Organizers' ก็ให้ส่งค่า 'Organizer' กลับไป
    return 'Organizer';
  }

  // ถ้าไม่เจอข้อมูลในทุก Collection ให้ส่งค่า null กลับไป
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
          runApp(MultiProvider(providers: [
            ChangeNotifierProvider(
              create: (_) {
                return CompetitionProvider();
              },
            ),
          ], child: const App()));
        } else if (userType == 'Organizer') {
          initialRoute = '/orglauncher';
          runApp(MultiProvider(providers: [
            ChangeNotifierProvider(
              create: (_) {
                return CompetitionProvider();
              },
            ),
          ], child: const App()));
        } else {
          runApp(MultiProvider(providers: [
            ChangeNotifierProvider(
              create: (_) {
                return CompetitionProvider();
              },
            ),
          ], child: const App()));
        }
      } else {
        runApp(MultiProvider(providers: [
          ChangeNotifierProvider(
            create: (_) {
              return CompetitionProvider();
            },
          ),
        ], child: const App()));
      }
    });
  });
}
