import 'package:flutter/material.dart';
import 'package:utcc_esport/src/config/route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Sport",
      initialRoute: '/welcome',
      routes: routes,
    );
  }
}
