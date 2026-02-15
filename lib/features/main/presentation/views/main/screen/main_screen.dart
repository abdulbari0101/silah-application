import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onItemTapped(int index) {
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final items = <_TabItem>[
      const _TabItem(icon: Icons.home_outlined, label: 'Home'),
      const _TabItem(icon: Icons.chat_bubble_outline, label: 'Chats'),
      const _TabItem(icon: Icons.assignment_outlined, label: 'Requests'),
      const _TabItem(icon: Icons.description_outlined, label: 'Specs'),
      const _TabItem(icon: Icons.support_agent_outlined, label: 'Support'),
      const _TabItem(icon: Icons.settings_outlined, label: 'Settings'),
    ];

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onItemTapped,
        destinations: [
          for (final item in items)
            NavigationDestination(icon: Icon(item.icon), label: item.label),
        ],
      ),
    );
  }
}

class _TabItem {
  const _TabItem({required this.icon, required this.label});
  final IconData icon;
  final String label;
}
