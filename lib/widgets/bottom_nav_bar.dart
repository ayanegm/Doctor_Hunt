import 'package:doctor_hunt/core/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: BottomNavigationBar(
        iconSize: 20.0,
        selectedFontSize: 9.0,
        unselectedFontSize: 9.0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Books',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat_sharp), label: 'Chat'),
        ],
        currentIndex: navigationShell.currentIndex,
        selectedItemColor: AppColor.green,

        unselectedItemColor: AppColor.grey,
        type: BottomNavigationBarType.fixed, // Recommended if you have 4+ items
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
