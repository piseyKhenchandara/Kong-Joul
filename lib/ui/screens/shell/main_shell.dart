import 'package:flutter/material.dart';

import '../map/map_screen.dart';
import '../profile/account_screen.dart';
import '../subscription/plans_screen.dart';
import '../../theme/app_colors.dart';

enum NavTab { map, plans, account }

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  NavTab _currentTab = NavTab.map;

  final List<Widget> _screens = const [
    MapScreen(),
    PlansScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentTab.index],
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: Icons.map_outlined,
                label: 'Map',
                tab: NavTab.map,
                currentTab: _currentTab,
                onTap: _onTap,
              ),
              _NavItem(
                icon: Icons.card_membership_outlined,
                label: 'Plans',
                tab: NavTab.plans,
                currentTab: _currentTab,
                onTap: _onTap,
              ),
              _NavItem(
                icon: Icons.person_outline,
                label: 'Account',
                tab: NavTab.account,
                currentTab: _currentTab,
                onTap: _onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(NavTab tab) => setState(() => _currentTab = tab);
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final NavTab tab;
  final NavTab currentTab;
  final void Function(NavTab) onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.tab,
    required this.currentTab,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = tab == currentTab;

    return GestureDetector(
      onTap: () => onTap(tab),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: Colors.black, size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
