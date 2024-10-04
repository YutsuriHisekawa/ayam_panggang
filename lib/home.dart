import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/login/login.dart';
import 'pages/page1/page1.dart';
import 'pages/page2/page2.dart';
import 'pages/page3/page3.dart';
import 'pages/page4.dart';
import 'component/botbar.dart';

class Layarutama extends StatefulWidget {
  const Layarutama({super.key});

  @override
  State<Layarutama> createState() => _LayarutamaState();
}

class _LayarutamaState extends State<Layarutama> {
  bool isLoggedIn = false;
  bool isGuest = false;
  int _halaman = 0;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isGuest = prefs.getBool('isGuest') ?? false;
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (!isLoggedIn && !isGuest) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isGuest');
    await prefs.remove('isLoggedIn');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    List<Widget> pages = [
      const Page1(),
      const Page2(),
      const Page3(),
      const Page4(),
    ];

    List<String> pageTitles = [
      'HOME',
      'NOTIFIKASI',
      'KERANJANG',
      'PROFIL',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitles[_halaman],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF6b1c1f),
        actions: isMobile
            ? []
            : [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextButton(
                    onPressed: () => setState(() => _halaman = 0),
                    child: const Text('Home',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextButton(
                    onPressed: () => setState(() => _halaman = 1),
                    child: const Text('Notifikasi',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextButton(
                    onPressed: () => setState(() => _halaman = 2),
                    child: const Text('Keranjang',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextButton(
                    onPressed: () => setState(() => _halaman = 3),
                    child: const Text('Profil',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
      ),
      body: pages[_halaman],
      bottomNavigationBar: isMobile
          ? CustomBottomNavBar(
              selectedIndex: _halaman,
              onTap: (index) {
                setState(() => _halaman = index);
              },
            )
          : null,
    );
  }
}
