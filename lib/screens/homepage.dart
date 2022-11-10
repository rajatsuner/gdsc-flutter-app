import 'package:flutter/material.dart';
import 'package:gdsc_ipsa/constants.dart';
import 'package:gdsc_ipsa/screens/about_us_page.dart';
import 'package:gdsc_ipsa/screens/gdsc_page.dart';
import 'package:gdsc_ipsa/screens/team_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  List<Widget> _tabList = [AboutUsPage(), GdscPage(), TeamDetails()];

  void _changeTabIndex(int index) {
    setState(() {
      _currentIndex = index;
      print("index ${_currentIndex}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Themer.selectedNavItemColor,
          unselectedItemColor: Themer.unselectedNavItemColor,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          currentIndex: _currentIndex,
          onTap: (value) {
            _changeTabIndex(value);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.info), label: "About Us"),
            BottomNavigationBarItem(
                icon: Icon(Icons.code_outlined), label: "GDSC"),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: "Team"),
          ]),
    );
  }
}
