import 'dart:ui';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final String currentRoute;
  final Function(int) onItemSelected;

  const Footer({
    super.key,
    required this.currentRoute,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _FooterItem(
        activeIcon: 'assets/icons/home-icon.png',
        inactiveIcon: 'assets/icons/home-outlined-icon.png',
        route: '/home',
        size: 28,
      ),
      _FooterItem(
        activeIcon: 'assets/icons/hammer-icon.png',
        inactiveIcon: 'assets/icons/hammer-icon.png',
        route: '/tools',
        size: 28,
      ),
      _FooterItem(
        activeIcon: 'assets/icons/footer-scan.png',
        inactiveIcon: 'assets/icons/footer-scan.png',
        route: '/scan',
        isCenter: true,
        size: 190, // bigger scan icon
      ),
      _FooterItem(
        activeIcon: 'assets/icons/bars-filled.png',
        inactiveIcon: 'assets/icons/bars-icon.png',
        route: '/lease-detail',
        size: 28,
      ),
      _FooterItem(
        activeIcon: 'assets/icons/user-filled.png',
        inactiveIcon: 'assets/icons/user-icon.png',
        route: '/profile',
        size: 28,
      ),
    ];

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        /// Solid background (fixes white corners)
        Container(
          height: 80,
          color: const Color(0xFF190028), // match your page background
        ),

        /// Background footer bar with rounded top & blur
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF2C0050).withOpacity(0.8),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final bool isSelected = currentRoute == item.route;

                  if (item.isCenter) {
                    return const SizedBox(width: 70); // space for scan
                  }

                  return GestureDetector(
                    onTap: () => onItemSelected(index),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        isSelected ? item.activeIcon : item.inactiveIcon,
                        color: isSelected ? Colors.white : Colors.white70,
                        width: item.size,
                        height: item.size,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),

        /// Floating scan icon
        Positioned(
          top: -100,
          child: GestureDetector(
            onTap: () => onItemSelected(2),
            child: Image.asset(
              currentRoute == '/scan'
                  ? items[2].activeIcon
                  : items[2].inactiveIcon,
              width: items[2].size,
              height: items[2].size,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}

class _FooterItem {
  final String activeIcon;
  final String inactiveIcon;
  final String route;
  final bool isCenter;
  final double size;

  const _FooterItem({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.route,
    required this.size,
    this.isCenter = false,
  });
}
