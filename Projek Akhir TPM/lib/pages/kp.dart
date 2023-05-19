import 'package:flutter/material.dart';

class KPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
                'KESAN DAN PESAN DALAM PEMBELAJARAN TEKNOLOGI PEMROGRAMAN MOBILE'),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('1. KESAN'),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
                'Saya sangat beruntung bisa belajar dengan bapak bagus pada pembelajaran ini karena dapat ilmu yang sangat berguna untuk kedepannya'),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('2. PESAN'),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
                'Semoga bapak Bagus diberikan istiqomah dalam memberikan ilmu kepada mahasiswa UPN VETERAN YOGYAKARTA'),
          ),
        ],
      ),
    );
  }
}
