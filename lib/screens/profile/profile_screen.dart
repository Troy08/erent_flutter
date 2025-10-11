import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _navigate(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  void _logout(BuildContext context) {
    // Replace with your logout logic

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Logged Out")),
    );
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: null
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [
              Color(0xFF3A0066),
              Color(0xFF1F003D),
              Color(0xFF1A0033),
              Color(0xFF0F0020),
            ],
            stops: [0.0, 0.4, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Profile Header
              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: const DecorationImage(
                            image: AssetImage("assets/images/avatar.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 31,
                        height: 31,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/edit-icon.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Serafina Yu",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Silver Membership since 2025",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Card List
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _buildCardItem(
                      context,
                      title: "Wallet",
                      icon: Icons.account_balance_wallet_outlined,
                    ),
                    _buildCardItem(
                      context,
                      title: "Shipping Address",
                      icon: Icons.location_on_outlined,
                      route: "/shippingAddress",
                    ),
                    _buildCardItem(
                      context,
                      title: "Vault History",
                      icon: Icons.history,
                      route: "/vaultHistory",
                    ),
                  ],
                ),
              ),

              // Logout button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => _logout(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9747FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // Footer
              // const Footer(currentRoute: '/profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    String? route,
  }) {
    return InkWell(
      onTap: route != null ? () => _navigate(context, route) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFF2C005E), width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white, size: 22),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            const Icon(Icons.chevron_right, color: Colors.grey, size: 22),
          ],
        ),
      ),
    );
  }
}
