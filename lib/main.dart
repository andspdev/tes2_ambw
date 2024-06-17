import 'package:flutter/material.dart';
import 'package:tes2_ambw/fragment/Beranda.dart';
import 'package:tes2_ambw/fragment/Profil.dart';
import 'package:tes2_ambw/fragment/baca_nanti.dart';
import 'package:tes2_ambw/fragment/kategori.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget 
{
  @override
  _MainApp createState() => _MainApp();
}

class _MainApp extends State<MainApp> 
{
  int _selectedTab = 0;
  String titleApp = 'Beranda';

  final List<Widget> _pages = [
    const Beranda(),
    const Kategori(),
    const BacaNanti(),
    const Profil()
  ];

  final List<String> _title = [
    'Beranda',
    'Kategori',
    'Baca Nanti',
    'Profil'
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
      titleApp = _title[index];
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '$titleApp | Test 2 AMBW',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
        body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          onTap: (index) => _changeTab(index),
          mouseCursor: SystemMouseCursors.grab,
          iconSize: 20,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color.fromARGB(255, 72, 72, 72),
          selectedIconTheme: const IconThemeData(color: Color.fromRGBO(6, 99, 220, 1)),
          selectedItemColor: const Color.fromRGBO(6, 99, 220, 1),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Beranda'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Kategori'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: 'Baca Nanti'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profil'
            ),
          ],
        ),
      ),
    );
  }
}