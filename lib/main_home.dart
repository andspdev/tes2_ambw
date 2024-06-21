import 'package:flutter/material.dart';
import 'package:tes2_ambw/fragment/pencarian.dart';
import 'package:tes2_ambw/includes/functions.dart';
import './includes/variables.dart';

import './fragment/Beranda.dart';
import 'fragment/profil.dart';
import './fragment/baca_nanti.dart';
import './fragment/kategori.dart';

class MainHome extends StatefulWidget {
  final int initialIndex;

  MainHome({Key? key, this.initialIndex = 2}) : super(key: key);

  @override
  _MainHome createState() => _MainHome();
}

class _MainHome extends State<MainHome> {
  late int _selectedTab;
  late String titleApp;

  final List<Widget> _pages = [
    const Kategori(),
    const Pencarian(),
    const Beranda(),
    const BacaNanti(),
    const Profil()
  ];

  final List<String> _title = [
    'Kategori',
    'Pencarian',
    'Beranda',
    'Tersimpan',
    'Profil'
  ];

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialIndex;
    titleApp = _title[_selectedTab];
  }

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
      theme: ThemeData(scaffoldBackgroundColor: COLOR_WHITE),
      home: Scaffold(
        body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          backgroundColor: COLOR_WHITE,
          onTap: (index) => _changeTab(index),
          mouseCursor: SystemMouseCursors.grab,
          iconSize: 20,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: COLOR_BLACK,
          selectedIconTheme: const IconThemeData(color: COLOR_PRIMARY),
          selectedItemColor: COLOR_PRIMARY,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          // unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.menu), label: _title[0]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.search), label: _title[1]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined), label: _title[2]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.bookmark_border), label: _title[3]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline), label: _title[4]),
          ],
        ),
      ),
    );
  }
}
