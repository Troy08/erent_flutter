import 'dart:ui';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F003D),
      body: Stack(
        children: [
          // Scrollable Content
          Padding(
            padding: EdgeInsets.only(
              top: 150,
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Featured Collections
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: const [
                          Icon(Icons.favorite, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Featured Collections',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 260,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildCard(context, 'assets/cards/pokemon-card.png', 'Pokemon Card'),
                          _buildCard(context, 'assets/cards/nba-card.png', 'NBA Sports Card'),
                          _buildCard(context, 'assets/cards/pokemon-card.png', 'Pokemon Card'),
                          _buildCard(context, 'assets/cards/nba-card.png', 'NBA Sports Card'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Market Trends
                    Row(
                      children: const [
                        Icon(Icons.trending_up, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Market Trends',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          TrendCard(title: 'Pokemon', percent: '33.79%', isGreen: true),
                          TrendCard(title: 'Basketball', percent: '5.79%', isGreen: false),
                          TrendCard(title: 'Pokemon', percent: '33.79%', isGreen: true),
                          TrendCard(title: 'Basketball', percent: '5.79%', isGreen: false),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Hot Cards
                    Row(
                      children: const [
                        Icon(Icons.local_fire_department, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Hot Cards',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Column(
                      children: [
                        _buildHotCard(context, 'assets/cards/hot-card.png', 'Eevee', 355.02),
                        _buildHotCard(context, 'assets/cards/hot-card.png', 'Eevee', 355.02),
                        _buildHotCard(context, 'assets/cards/hot-card.png', 'Eevee', 355.02),
                        _buildHotCard(context, 'assets/cards/hot-card.png', 'Eevee', 355.02),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Fixed Top Search Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
              color: const Color(0xFF1A0033),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: const Color(0xFF2A0044),
                        borderRadius: BorderRadius.circular(24)),
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Search cards...',
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildFilter('Nearby'),
                        _buildFilter('Popular'),
                        _buildFilter('Eco-Friendly'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Featured Card Builder
  static Widget _buildCard(BuildContext context, String image, String title) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/leaseDetail");
      },
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3))
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(image, fit: BoxFit.cover, width: 200, height: 260),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(title,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hot Card Builder
  static Widget _buildHotCard(BuildContext context, String image, String name, double price) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        Navigator.pushNamed(context, "/leaseDetail");
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white24, borderRadius: BorderRadius.circular(24)),
        child: Row(
          children: [
            Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                       Image.asset(
                                      "assets/icons/dollar-icon.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                      SizedBox(width: 5),
                      Flexible(
                        child: Text(price.toStringAsFixed(2),
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Filter Builder
  static Widget _buildFilter(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.purple, width: 2),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}

// Market Trend Card Widget
class TrendCard extends StatelessWidget {
  final String title;
  final String percent;
  final bool isGreen;

  const TrendCard({
    super.key,
    required this.title,
    required this.percent,
    required this.isGreen,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        // Navigate to details screen, you can pass title as argument
        Navigator.pushNamed(context, '/leaseDetail');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 160,
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Text(percent,
                          style: TextStyle(
                              color:
                                  isGreen ? Colors.greenAccent : Colors.redAccent,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(width: 8),
                    Icon(isGreen ? Icons.trending_up : Icons.trending_down,
                        color: isGreen ? Colors.greenAccent : Colors.redAccent),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

