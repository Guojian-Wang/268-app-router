// widgets/bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({Key? key, required this.currentIndex}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/byAuthor'); // Navigate to "By Author" screen
        break;
      case 1:
        context.go('/byTitle'); // Navigate to "By Title" screen
        break;
      case 2:
        context.go('/profile'); // Navigate to "Profile" screen
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'By Author',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.title),
          label: 'By Title',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
    );
  }
}
