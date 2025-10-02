import 'package:flutter/material.dart';

class DeliveryOptionsScreen extends StatelessWidget {
  const DeliveryOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
          child: Column(
            children: [
              // Back Button (AppBar replacement)
              Row(
                children: [
                  const SizedBox(width: 12, height: 60),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 18),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),

              // Content
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Delivery Options",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "To protect your card’s safety, a full insurance is "
                        "automatically applied for the label. The insurance "
                        "fee is determined by your card’s value.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 30),

                      _buildRow("Estimate Shipping", "3 - 5 Business Days"),
                      const Divider(color: Colors.white24, thickness: 1),
                      _buildRow("Carrier", "Fedex"),
                      const Divider(color: Colors.white24, thickness: 1),
                      _buildRowWithIcon("Delivery Fee", "24"),
                      const Divider(color: Colors.white24, thickness: 1),
                      _buildRowWithIcon("Insurance", "20"),

                      const Spacer(),

                      // Confirm Button
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/confirmation");
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: const LinearGradient(
                              colors: [Color(0xFFae4ef1), Color(0xFFfa7171)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowWithIcon(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
          Row(
            children: [
              const Icon(Icons.monetization_on,
                  color: Colors.purpleAccent, size: 18),
              const SizedBox(width: 6),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
