import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/login/login.dart';
import 'pages/page1/page1.dart';
import 'pages/page2/page2.dart';
import 'pages/page3/page3.dart';
import 'pages/page4.dart';
import 'component/botbar.dart';
import 'component/drawer.dart';

class Layarutama extends StatefulWidget {
  const Layarutama({super.key});

  @override
  State<Layarutama> createState() => _LayarutamaState();
}

class _LayarutamaState extends State<Layarutama> {
  bool isLoggedIn = false;
  bool isGuest = false;
  int _halaman = 0;
  String searchQuery = '';
  bool isSearchBarVisible = false;

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

  void _filterItems(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    List<Widget> pages = [
      Page1(searchQuery: searchQuery),
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
        iconTheme: const IconThemeData(color: Colors.white),
        actions: isMobile
            ? [
                IconButton(
                  icon: Icon(
                    isSearchBarVisible ? Icons.close : Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isSearchBarVisible = !isSearchBarVisible;
                    });
                  },
                ),
              ]
            : [],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              Expanded(child: pages[_halaman]),
            ],
          ),
          AnimatedOpacity(
            opacity: isSearchBarVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Visibility(
              visible: isSearchBarVisible,
              child: Positioned(
                top: AppBar().preferredSize.height + 10,
                left: 15,
                right: 15,
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    onChanged: _filterItems,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      endDrawer: !isMobile
          ? CustomDrawer(
              selectedIndex: _halaman,
              onTap: (index) {
                setState(() {
                  _halaman = index;
                });
              },
            )
          : null,
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
