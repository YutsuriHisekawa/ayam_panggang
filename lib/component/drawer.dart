import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomDrawer({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF6b1c1f),
              ),
              child: Column(
                children: const [
                  Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.black),
              title: const Text('Home'),
              onTap: () => onTap(0),
              selected: selectedIndex == 0,
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.black),
              title: const Text('Notifications'),
              onTap: () => onTap(1),
              selected: selectedIndex == 1,
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.black),
              title: const Text('Cart'),
              onTap: () => onTap(2),
              selected: selectedIndex == 2,
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.black),
              title: const Text('Profile'),
              onTap: () => onTap(3),
              selected: selectedIndex == 3,
            ),
          ],
        ),
      ),
    );
  }
}
