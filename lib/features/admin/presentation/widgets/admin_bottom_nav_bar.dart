import 'package:doctor_hunt/core/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminBottomNavBar extends StatelessWidget {
  const AdminBottomNavBar({super.key, required this.navigationShell});
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
          BottomNavigationBarItem(
            icon: Icon(Icons.dangerous),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
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
