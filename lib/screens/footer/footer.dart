import 'dart:ui';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 90,
          padding: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _footerButton(context, icon: Icons.home, route: '/home'),
              _footerButton(context, icon: Icons.build, route: '/tools'),
              _footerButton(context,
                  icon: Icons.qr_code_scanner, route: '/scan-card'),
              _footerButton(context,
                  icon: Icons.bar_chart, route: '/lease-detail'),
              _footerButton(context, icon: Icons.person, route: '/login'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerButton(BuildContext context,
      {required IconData icon, required String route}) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      onPressed: () => Navigator.pushNamed(context, route),
    );
  }
}
