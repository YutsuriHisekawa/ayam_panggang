import 'package:flutter/material.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar(
      {super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return DotCurvedBottomNav(
      indicatorColor: const Color.fromARGB(255, 255, 196, 4),
      backgroundColor: const Color(0xFF6b1c1f),
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.ease,
      selectedIndex: selectedIndex,
      indicatorSize: 5,
      borderRadius: 25,
      height: 70,
      onTap: onTap,
      items: [
        Icon(
          Icons.home,
          color: selectedIndex == 0
              ? const Color.fromARGB(255, 255, 196, 4)
              : Colors.white,
        ),
        Icon(
          Icons.notification_add,
          color: selectedIndex == 1
              ? const Color.fromARGB(255, 255, 196, 4)
              : Colors.white,
        ),
        Icon(
          Icons.shopping_cart,
          color: selectedIndex == 2
              ? const Color.fromARGB(255, 255, 196, 4)
              : Colors.white,
        ),
        Icon(
          Icons.person,
          color: selectedIndex == 3
              ? const Color.fromARGB(255, 255, 196, 4)
              : Colors.white,
        ),
      ],
    );
  }
}
