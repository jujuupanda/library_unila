import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_unila/src/pages/bottom_navigation/home/home.dart';
import 'package:library_unila/src/pages/bottom_navigation/opac/opac.dart';
import 'package:library_unila/src/pages/bottom_navigation/profile/profile.dart';

import '../../utils/constants/constant.dart';

class BotNavHome extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  BotNavHome({Key? key, required this.navigationShell}) : super(key: key);

  @override
  State<BotNavHome> createState() => _BotNavHomeState();
}

class _BotNavHomeState extends State<BotNavHome> {
  int _currentIndex = 0;

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  final List<BottomNavigationBarItem> _bottomNavigationBarItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: textHome,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.book_rounded),
      label: textOpac,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_rounded),
      label: textProfile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: widget.navigationShell,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorPrimary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        iconSize: 26,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _goToBranch(_currentIndex);
        },
        items: _bottomNavigationBarItem,
      ),
    );
  }
}
