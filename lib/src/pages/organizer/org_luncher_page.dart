import 'package:flutter/material.dart';
import 'package:utcc_esport/src/pages/competition/allcompetition_page.dart';
import 'package:utcc_esport/src/pages/news/listnews/contentnews_page.dart';
import 'package:utcc_esport/src/pages/news/news_page.dart';
import 'package:utcc_esport/src/pages/organizer/org_home_page.dart';
import 'package:utcc_esport/src/pages/profiles/profile_page.dart';

class OrgLauncher extends StatefulWidget {
  const OrgLauncher({super.key});

  @override
  State<OrgLauncher> createState() => _OrgLauncherState();
}

class _OrgLauncherState extends State<OrgLauncher> {
  int _selectedIndex = 0;
  final List<Widget> _pageWidget = <Widget>[
    const OrgHomePage(),
    const News(),
    const Allcompetition(),
    const Profiles(),
    const Contentnews(),
  ];

  final List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: 35,
      ),
      label: "หน้าหลัก",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.assignment,
        size: 35,
      ),
      label: 'รายการแข่ง',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_esports,
          size: 35,
        ),
        label: 'การแข่งขัน'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          size: 35,
        ),
        label: 'โปรไฟล์'),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFA31E21),
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
