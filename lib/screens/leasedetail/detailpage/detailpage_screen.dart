import 'package:erent_flutter/screens/leasedetail/leasebuyout/pricechart_screen.dart';
import 'package:erent_flutter/screens/leasedetail/propertygrid/propertygrid_screen.dart';
import 'package:flutter/material.dart';

class DetailPageScreen extends StatelessWidget {
  const DetailPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock card data
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 18,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.4),
            radius: 1.25,
            colors: [
              Color(0xFF4B008D),
              Color(0xFF2A0053),
              Color(0xFF16002E),
            ],
            stops: [0.0, 0.55, 1.0],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Card Image + Glow
                Center(
                  child: Container(
                    height: 380,
                    margin: const EdgeInsets.only(bottom: 30, top: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purpleAccent.withOpacity(0.35),
                          blurRadius: 60,
                          spreadRadius: 10,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      card["image"],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Title row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        card["name"],
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "#${card["id"]}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 6),

                // Subtitle
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    "Pokemon Collection",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFB387FF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    "Token ID: ${card["tokenId"]}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                    ),
                  ),
                ),

                const SizedBox(height: 26),

                // Stats + Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _StatBox(label: "PSA", value: card["psa"].toString()),
                        const SizedBox(width: 36),
                        _StatBox(label: "POP", value: card["pop"].toString()),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Price To Claim",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 4),
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
                                fontSize: 26,
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

                const SizedBox(height: 34),

                // Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, "/sublease"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: const Color(0xFFA755FF),
                      foregroundColor: Colors.white,
                      elevation: 0,
                    ),
                    child: const Text(
                      "Sub Lease",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
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
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1A0033),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Claim",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // Price Chart
                const PriceChart(),

                const SizedBox(height: 30),

                // Properties grid widget
                Center(child: PropertyGrid()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Reusable Stat Box
class _StatBox extends StatelessWidget {
  final String label;
  final String value;
  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 15, color: Colors.white60),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xFFCC99FF),
          ),
        ),
      ],
    );
  }
}
