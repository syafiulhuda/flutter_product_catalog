// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTabChange;
  final Color color;
  final Color tabBackgroundColor;
  final Color backgroundColor;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
    this.color = const Color.fromRGBO(31, 175, 176, 1),
    this.tabBackgroundColor = Colors.grey,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: GNav(
          selectedIndex: selectedIndex,
          onTabChange: onTabChange,
          haptic: true,
          rippleColor: Colors.pinkAccent,
          activeColor: const Color.fromRGBO(31, 175, 176, 1),
          color: color,
          backgroundColor: backgroundColor,
          tabBackgroundColor: tabBackgroundColor,
          iconSize: 30,
          textStyle: const TextStyle(
            color: Color.fromRGBO(31, 175, 176, 1),
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          padding: const EdgeInsets.all(10),
          gap: 5,
          tabs: const [
            GButton(
              icon: FontAwesomeIcons.cameraRotate,
              iconSize: 25,
              text: 'Home',
            ),
            GButton(
              icon: Icons.feed,
              text: 'Feed',
            ),
            GButton(
              icon: Icons.store,
              text: 'Official Store',
            ),
            GButton(
              icon: FontAwesomeIcons.solidNoteSticky,
              iconSize: 25,
              text: 'Transaksi',
            ),
            GButton(
              icon: Icons.person,
              text: 'Akun',
            ),
          ],
        ),
      ),
    );
  }
}
