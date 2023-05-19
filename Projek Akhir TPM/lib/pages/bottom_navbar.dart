import 'package:flutter/material.dart';
import 'profile.dart';
import 'package:covid_19/homepage.dart';
import 'kp.dart';
import 'conversi_waktu.dart';
import 'conversi_money.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  final _screenList = [
    const HomePage(),
    const ProfileScreen(
      username: 'FAQI HIMMAKA MUSHOFFA',
    ),
    KPScreen(),
    const TimeConversion(),
    const conversiMoney()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profil',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: 'Kesan&Pesan',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.time_to_leave),
              label: 'Time',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.money_off_sharp),
              label: 'Money',
              backgroundColor: Colors.blue)
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
