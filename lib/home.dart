import 'package:flutter/material.dart';
import 'package:flutter_consume_api/widgets/bottom_navigation_bar.dart';

import 'package:flutter_consume_api/pages/account_page.dart';
import 'package:flutter_consume_api/pages/feed_page.dart';
import 'package:flutter_consume_api/pages/home_page.dart';
import 'package:flutter_consume_api/pages/official_store_page.dart';
import 'package:flutter_consume_api/pages/transaksi_page.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomePage(),
    const FeedPage(),
    const OfficialStorePage(),
    const TransaksiPage(),
    const AccountPage(),
  ];

  void onBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _currentIndex,
        onTabChange: (index) {
          onBarTapped(index);
        },
      ),
    );
  }
}
