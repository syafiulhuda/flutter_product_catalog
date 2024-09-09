import 'package:flutter/material.dart';
import 'package:flutter_consume_api/pages/account_page.dart';
import 'package:flutter_consume_api/pages/feed_page.dart';
import 'package:flutter_consume_api/pages/home_page.dart';
import 'package:flutter_consume_api/pages/official_store_page.dart';
import 'package:flutter_consume_api/pages/transaksi_page.dart';
import 'package:flutter_consume_api/widgets/bottom_navigation_bar.dart';

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
    FeedPage(),
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
    // Cek apakah berada di FeedPage
    bool isFeedPage = _currentIndex == 1;

    return Scaffold(
      body: _children[_currentIndex],
      backgroundColor: isFeedPage ? Colors.black : Colors.white,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _currentIndex,
        onTabChange: (index) {
          onBarTapped(index);
        },
        // Berikan warna berbeda jika di FeedPage
        tabBackgroundColor: isFeedPage ? Colors.white : Colors.grey.shade300,
        color: isFeedPage ? Colors.white : Colors.grey.shade500,
        backgroundColor: isFeedPage ? Colors.black : Colors.white,
      ),
    );
  }
}
