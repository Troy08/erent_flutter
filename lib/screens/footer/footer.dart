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
      ),
      _FooterItem(
        activeIcon: 'assets/icons/hammer-icon.png',
        inactiveIcon: 'assets/icons/hammer-icon.png',
        route: '/tools',
      ),
      _FooterItem(
        activeIcon: 'assets/icons/footer-scan.png',
        inactiveIcon: 'assets/icons/footer-scan.png',
        route: '/scan',
        isCenter: true,
      ),
      _FooterItem(
        activeIcon: 'assets/icons/bars-filled.png',
        inactiveIcon: 'assets/icons/bars-icon.png',
        route: '/lease-detail',
      ),
      _FooterItem(
        activeIcon: 'assets/icons/user-filled.png',
        inactiveIcon: 'assets/icons/user-icon.png',
        route: '/profile',
      ),
    ];

    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        /// Glassy background bar
        ClipRRect(
          // borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 20, sigmaY: 20), // blur value here is up to 20 only
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 118, 80, 158)
                    .withOpacity(0.1), // match Figma overlay (20%)
                // borderRadius:
                //     const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF292782)
                        .withOpacity(0.1), // Drop shadow color from Figma
                    offset: const Offset(0, -5), // X: 0, Y: -5
                    blurRadius: 30,
                    spreadRadius: 0,
                  ),
                ],
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
                    child: Image.asset(
                      isSelected ? item.activeIcon : item.inactiveIcon,
                      width: 42,
                      height: 42,
                      color: isSelected ? Colors.white : Colors.white70,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),

        /// Floating scan icon
        Positioned(
          top: -75, // half of 150
          child: GestureDetector(
            onTap: () => onItemSelected(2),
            child: Image.asset(
              currentRoute == '/scan'
                  ? items[2].activeIcon
                  : items[2].inactiveIcon,
              width: 150,
              height: 150,
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

  const _FooterItem({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.route,
    this.isCenter = false,
  });
}
