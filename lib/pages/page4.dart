import 'package:flutter/material.dart';
import 'package:mbah_mo/pages/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  bool isGuest = false;

  @override
  void initState() {
    super.initState();
    _loadGuestStatus();
  }

  void _loadGuestStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isGuest = prefs.getBool('isGuest') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                child: isGuest
                    ? Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey[700],
                      )
                    : ClipOval(
                        child: Image.asset(
                          'images/icon-person.png',
                          fit: BoxFit.cover,
                          width: 120,
                          height: 120,
                        ),
                      ),
              ),
              const SizedBox(height: 16),
              if (isGuest) ...[
                const Text(
                  'Guest',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ] else ...[
                const Text(
                  'Nama Pengguna',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'email@example.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
              const SizedBox(height: 24),
              if (isGuest) ...[
                _buildProfileOption('Bantuan', Icons.help),
                _buildProfileOption('Keluar', Icons.logout, color: Colors.red,
                    onTap: () {
                  _logout(context);
                }),
              ] else ...[
                _buildProfileOption('Ubah Profil', Icons.edit),
                _buildProfileOption('Alamat', Icons.location_on),
                _buildProfileOption('Pengaturan', Icons.settings),
                _buildProfileOption('Keamanan', Icons.lock),
                _buildProfileOption('Bantuan', Icons.help),
                _buildProfileOption('Keluar', Icons.logout, color: Colors.red,
                    onTap: () {
                  _logout(context);
                }),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(String title, IconData icon,
      {Color color = Colors.black, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, color: color),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap ?? () {},
    );
  }

  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isGuest');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }
}
