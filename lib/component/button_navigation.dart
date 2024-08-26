import 'package:flutter/material.dart';
import 'package:project_iconsen/navigation_page/history_page.dart';
import 'package:project_iconsen/navigation_page/dashboard_page.dart';
import 'package:project_iconsen/navigation_page/profil_page.dart';

class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({super.key});

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int _selectedIndex = 0;
  late List<Widget> tabs;
  void initState() {
    super.initState();
    tabs = [
      DashboardPage(),
      HistoryPage(),
      ProfilPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/image/home_icon.png",
              width: 30,
              height: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/image/history_absensi.png",
              width: 26,
              height: 26,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/image/profil_icon.png",
              width: 26,
              height: 26,
            ),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
