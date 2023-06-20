import 'package:flutter/material.dart';
import 'package:utcc_esport/src/config/route.dart';

String initialRoute = '/welcome';

class App extends StatelessWidget {
  const App({super.key});
  //final loginStatus = LoginStatus();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Sport",
      initialRoute: initialRoute,
      routes: routes,
    );
  }
}
