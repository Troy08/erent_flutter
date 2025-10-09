import 'package:erent_flutter/screens/leasedetail/leasebuyout/pricechart_screen.dart';
import 'package:erent_flutter/screens/leasedetail/propertygrid/propertygrid_screen.dart';
import 'package:flutter/material.dart';

class DetailPageScreen extends StatelessWidget {
  const DetailPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock card data (like your Vue script)
    final Map<String, dynamic> card = {
      "name": "Eevee",
      "id": 2815,
      "tokenId": "lsigladifbakfbndf",
      "image": "assets/cards/lease-card.png",
      "psa": 8,
      "pop": 4,
      "price": "30.32",
    };

    void goToBuyOutDetail(Map<String, dynamic> item) {
      Navigator.pushNamed(
        context,
        "/buyoutDetail",
        arguments: {
          "name": item["name"] as String,
          "price": item["price"].toString(),
          "category": item["category"] ?? "Number1",
        },
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true, // background flows behind AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
          // ensures vertical centering
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1), // subtle background
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero, // removes internal padding
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Card image
                Container(
                  height: 400,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Image.asset(
                    card["image"],
                    fit: BoxFit.contain,
                  ),
                ),

                // Card Info
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Title row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            card["name"],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "#${card["id"]}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "My Lease",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFCC99FF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Token ID: ${card["tokenId"]}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),

                      // Stats + Price Row
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Stats
                            Row(
                              children: [
                                _StatBox(
                                    label: "PSA",
                                    value: card["psa"].toString()),
                                const SizedBox(width: 30),
                                _StatBox(
                                    label: "POP",
                                    value: card["pop"].toString()),
                              ],
                            ),

                            // Price Box
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Price To Claim",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons/dollar-icon.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      card["price"],
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Buttons
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => goToBuyOutDetail({
                          "name": "Eevee",
                          "price": 30.45,
                          "category": "Number1",
                        }),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: const Color(0xFFA755FF),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          "Sub Lease",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => goToBuyOutDetail({
                          "name": "Eevee",
                          "price": 30.45,
                          "category": "Number1",
                        }),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF1A0033),
                        ),
                        child: const Text(
                          "Claim",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // PriceChart placeholder
                const PriceChart(),

                // PropertyGrid
                Center(
                  child: PropertyGrid(),
                ),
                // Footer placeholder
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: const Footer(),
    );
  }
}

// Reusable stat widget
class _StatBox extends StatelessWidget {
  final String label;
  final String value;
  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFFCC99FF),
          ),
        ),
      ],
    );
  }
}
