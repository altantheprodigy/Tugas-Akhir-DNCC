import 'package:flutter/material.dart';
import 'package:ta_dncc/features/home_page.dart';
import 'package:ta_dncc/features/notification_page.dart';
import 'package:ta_dncc/features/profile_page.dart';
import 'package:ta_dncc/features/search_page.dart';
import '../ui/colors.dart';




class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  // 🔹 Daftar halaman
  final List<Widget> _pages = [
    const HomePage(),
    SearchPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  // 🔹 Daftar item navigasi
  final List<Map<String, dynamic>> _navItems = [
    {
      'icon': 'assets/icons/Mask group.png',
      'inActiveIcon': 'assets/icons/home_outlined.png',
      'label': 'Home',
    },
    {
      'icon': 'assets/icons/search_rounded.png',
      'inActiveIcon': 'assets/icons/search_icon.png',
      'label': 'Search',
    },
    {
      'icon': 'assets/icons/notif_rounded.png',
      'inActiveIcon': 'assets/icons/notif_icon.png',
      'label': 'Notif',
    },
    {
      'icon': 'assets/icons/profile_rounded.png',
      'inActiveIcon': 'assets/icons/profile_outlined.png',
      'label': 'Profile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: background,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: dark,
        unselectedItemColor: dark,
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),

        // 🔹 Buat item navigasi secara dinamis
        items: List.generate(_navItems.length, (index) {
          bool isActive = _currentIndex == index;
          var item = _navItems[index];

          return BottomNavigationBarItem(
            icon: _buildNavIcon(
              imagePathActive: item['icon'],
              imagePathInActive: item['inActiveIcon'],
              isActive: isActive,
            ),
            label: item['label'],
          );
        }),
      ),
    );
  }

  /// 🔹 Widget reusable untuk ikon dengan efek aktif
  Widget _buildNavIcon({
    required String imagePathActive,
    required String imagePathInActive,
    required bool isActive,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? dark : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(
        isActive ? imagePathActive : imagePathInActive,
        height: 24,
        width: 24,
        color: isActive ? textWhite : dark,
      ),
    );
  }
}
