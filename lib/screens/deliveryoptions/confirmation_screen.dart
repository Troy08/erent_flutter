import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
          child: Container(
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
        ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "We’ve got your request!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Subtitle
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Lorem Ipsum Dolor Sit Amet Consectetur. Lorem Nec Ullamcorper Aliquam Id Dolor Id Volutpat Mollis.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Timeline Steps
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    buildTimelineTile(
                      isActive: true,
                      title: "Card is delivered.",
                      date: "Sun. May 16, 2024, 12:06 PM",
                      gradient: const LinearGradient(
                        colors: [Color(0xFFae4ef1), Color(0xFFfa7171)],
                      ),
                    ),
                    buildTimelineTile(
                      isActive: false,
                      title: "Shipping Label Created",
                      date: "Sun. May 16, 2024, 12:06 PM",
                    ),
                    buildTimelineTile(
                      isActive: false,
                      title: "Request Submitted",
                      date: "Sun. May 16, 2024, 12:06 PM",
                      isLast: true,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Got it button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // go back to previous
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
                        "Got it!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimelineTile({
    required bool isActive,
    required String title,
    required String date,
    LinearGradient? gradient,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        Column(
          children: [
            // Dot
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: isActive ? gradient : null,
                color: isActive ? null : Colors.grey,
              ),
            ),

            // Connector line (only if not last)
            if (!isLast)
              Container(
                width: 2,
                height: 60,
                color: Colors.grey.withOpacity(0.6),
              ),
          ],
        ),

        const SizedBox(width: 12),

        // Text
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.white70,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
