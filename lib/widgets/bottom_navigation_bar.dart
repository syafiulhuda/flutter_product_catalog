import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTabChange;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
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
          color: Colors.grey.shade500,
          iconSize: 30,
          textStyle: const TextStyle(
            color: Color.fromRGBO(31, 175, 176, 1),
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          tabBackgroundColor: Colors.grey.shade300,
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
