import 'package:flutter/material.dart';
import 'package:mbah_mo/boarding/content.dart';
import 'package:mbah_mo/colors/color.dart';
import 'package:mbah_mo/pages/login/login.dart';
import 'package:mbah_mo/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _checkIfBoardingSeen();
  }

  Future<void> _checkIfBoardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seen = prefs.getBool('boarding_seen');
    if (seen == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Layarutama()),
      );
    }
  }

  Future<void> _setBoardingSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boarding_seen', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            children:
                boardingPages.map((page) => _buildPageContent(page)).toList(),
          ),
          _buildDotIndicator(),
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildPageContent(BoardingData page) {
    return Container(
      color: mainColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            height: 250,
            child: Image.asset(page.imagePath),
          ),
          const SizedBox(height: 10),
          Text(
            page.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              page.description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildDotIndicator() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 170,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(boardingPages.length, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == index ? Colors.white : Colors.grey,
            ),
          );
        }),
      ),
    );
  }

  Positioned _buildBottomButtons() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 30,
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: fristColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
            ),
            onPressed: () {
              if (_currentPage == 2) {
                _setBoardingSeen(); // Set the flag
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            child: Text(
              _currentPage == 2 ? 'Finish' : 'Next',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            onPressed: () {
              _setBoardingSeen(); // Set the flag
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text('SKIP', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
