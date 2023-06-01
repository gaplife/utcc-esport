// import 'package:e_sport/screens/competition.dart';
// import 'package:e_sport/screens/firstpage.dart';
// import 'package:e_sport/screens/forgetpass.dart';
// import 'package:e_sport/screens/launcher.dart';
// import 'package:e_sport/screens/login.dart';
// import 'package:e_sport/screens/news.dart';
// import 'package:e_sport/screens/pageprofile.dart';
// import 'package:e_sport/screens/register.dart';
// import 'package:e_sport/screens/welcome.dart';
import 'package:flutter/widgets.dart';
import 'package:utcc_esport/src/pages/pages.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/login': (context) => const Login(),
  '/welcome': (context) => const Welcome(),
  '/register': (context) => const Register(),
  '/forgetpass': (context) => const ForgetPass(),
  '/home': (context) => const HomePage(),
  '/news': (context) => const News(),
  '/competition': (context) => const Competition(),
  '/profile': (context) => const Profiles(),
  '/launcher': (context) => const Launcher(),
};
