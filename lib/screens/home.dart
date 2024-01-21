import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:app_sign/screens/page2.dart';
import 'package:app_sign/screens/page1.dart';

import 'package:app_sign/screens/page3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0;
  final pages = [
    Page1(),
    Page2(),
    Page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xFF9ECB3A),
        items: [
          CurvedNavigationBarItem(
            child: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            label: 'Home',
            labelStyle: TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: 'Search',
            labelStyle: TextStyle(color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.diamond,
              color: Colors.white,
            ),
            label: 'Tresor',
            labelStyle: TextStyle(color: Colors.white),
          ),
        ],
        onTap: (index) {
          // Handle button tap
          setState(() {
            _page = index;
          });
          print(index);
        },
      ),
      body: pages[_page],
    );
  }
}
