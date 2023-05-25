import 'package:flutter/material.dart';
import 'package:utcc_esport/src/pages/home/home_page.dart';

class Launcher extends StatefulWidget {
  const Launcher({super.key});

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  int _selectedIndex = 0;
  final List<Widget> _pageWidget = <Widget>[
    const HomePage(),
    //const News(),
    //const Competition(),
    //const Profile(),
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
        Icons.newspaper_sharp,
        size: 35,
      ),
      label: 'ข่าวสาร',
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
        backgroundColor: const Color(0xFF0C1629),
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFA31E21),
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}