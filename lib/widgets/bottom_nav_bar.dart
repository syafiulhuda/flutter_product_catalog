import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: GNav(
          selectedIndex: 0,
          onTabChange: (index) {},
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
              icon: Icons.thumb_up,
              text: 'Buat Kamu',
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
              icon: Icons.favorite,
              text: 'Wishlist',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Transaksi',
            ),
          ],
        ),
      ),
    );
  }
}
