import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dental_news/Home/Dental_Care/Home_Care.dart';
import 'package:dental_news/Home/Home_Toothache/Home_Toothache.dart';
import 'package:dental_news/Model/Support.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'Home/Home_Clinic/Home_Clinic.dart';
import 'Home/Home_Sceen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeSceen(
      title: '',
    ),
    const Home_Toothache(),
    const Home_Care(),
    const Home_Clinic(),
    const ProfileForm(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        itemCornerRadius: 50,
        iconSize: 30,
        showElevation: true,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        //backgroundColor: Theme.of(context).primaryColor,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(LineIcons.home),
            title: Text(tr('app.Home')),
            activeColor: Theme.of(context).hoverColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(LineIcons.tooth),
            title: Text(tr('app.toothache')),
            activeColor: Theme.of(context).hoverColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(LineIcons.teeth),
            title: Text(tr('app.Care_teeth')),
            activeColor: Theme.of(context).hoverColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(LineIcons.medicalClinic),
            title: Text(tr('app.Clinic')),
            activeColor: Theme.of(context).hoverColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(LineIcons.userCircle),
            title: Text(tr('app.Support')),
            activeColor: Theme.of(context).hoverColor,
          ),
        ],
      ),
    );
  }
}
