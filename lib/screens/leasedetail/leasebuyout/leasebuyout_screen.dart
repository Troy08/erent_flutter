import 'package:flutter/material.dart';

class BuyoutScreen extends StatelessWidget {
  const BuyoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> card = {
      "name": "Eevee",
      "id": 2815,
      "tokenId": "lsigladifbakfbndf",
      "image": "assets/cards/lease-card.png",
      "psa": 8,
      "pop": 4,
      "priceToClaim": "30.32",
      "price": "36.37",
      "marketPrice": "30.32",
      "taxes": "6.05",
    };

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [Color(0xFF3A0066), Color(0xFF1F003D), Color(0xFF0F0020)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                const Center(
                  child: Text(
                    "Claim",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Card Image
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      card["image"].toString(),
                      width: 226,
                      height: 314,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Card Info
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & ID Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            card["name"].toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "#${card["id"].toString()}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Token ID: ${card["tokenId"].toString()}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Stats & Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _StatBox(
                                  label: "PSA", value: card["psa"].toString()),
                              const SizedBox(width: 30),
                              _StatBox(
                                  label: "POP", value: card["pop"].toString()),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "Price To Claim",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/dollar-icon.png",
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    card["priceToClaim"].toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
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
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Price Section
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(25, 12, 38, 0.4),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Price row + Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Price ",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/dollar-icon.png",
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    card["price"].toString(),
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Image.asset(
                                    "assets/icons/up-arrow.png",
                                    width: 18,
                                    height: 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Ink(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFA755FF),
                                    Color(0xFFFF5975)
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Container(
                                height: 36,
                                alignment: Alignment.center,
                                child: const Text(
                                  "Continue",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Market Price
                      _PriceRow(
                        title: "Market Price",
                        value: card["marketPrice"].toString(),
                      ),
                      const Divider(color: Colors.grey),
                      _PriceRow(
                        title: "Taxes",
                        value: card["taxes"].toString(),
                      ),
                      const SizedBox(height: 10),

                      // Disclaimer
                      const Text(
                        "By selecting “Continue”, you agree to buy out the card with market price.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFCC99FF),
          ),
        ),
      ],
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String title;
  final String value;
  const _PriceRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        Row(
          children: [
            Image.asset(
              "assets/icons/dollar-icon.png",
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 6),
            Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
