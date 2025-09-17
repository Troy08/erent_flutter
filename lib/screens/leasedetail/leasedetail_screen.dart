import 'package:erent_flutter/screens/footer/footer.dart';
import 'package:flutter/material.dart';

class LeasePageScreen extends StatefulWidget {
  const LeasePageScreen({super.key});

  @override
  State<LeasePageScreen> createState() => _LeasePageScreenState();
}

class _LeasePageScreenState extends State<LeasePageScreen> {
  String activeTab = "lease";

  final List<Map<String, dynamic>> leases = [
    {
      "name": "Eevee",
      "category": "Pokemon",
      "image": "assets/cards/lease-card.png",
      "price": "355.02",
      "change": 0
    },
    {
      "name": "Ethan's Ho-Oh",
      "category": "Pokemon",
      "image": "assets/cards/lease-card.png",
      "price": "20.82",
      "change": 20.22
    },
  ];

  void goToCollection() {
    // For now just switch tab
    setState(() => activeTab = "collection");
  }

  void goToLease() {
    setState(() => activeTab = "lease");
  }

  void goToLeaseDetail(Map<String, dynamic> item) {
    Navigator.pushNamed(context, "/leaseDetail", arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Total Contracts",
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 4),
                  const Text("10",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 20),

                  // Tabs
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C003F),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: goToCollection,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                gradient: activeTab == "collection"
                                    ? const LinearGradient(
                                        colors: [
                                          Color(0xFFA755FF),
                                          Color(0xFFFF5975)
                                        ],
                                      )
                                    : null,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "My Collection",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: activeTab == "collection"
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: goToLease,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                gradient: activeTab == "lease"
                                    ? const LinearGradient(
                                        colors: [
                                          Color(0xFFA755FF),
                                          Color(0xFFFF5975)
                                        ],
                                      )
                                    : null,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "My Lease",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: activeTab == "lease"
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // Lease list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                itemCount: leases.length,
                itemBuilder: (context, index) {
                  final item = leases[index];
                  return GestureDetector(
                    onTap: () => goToLeaseDetail(item),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.only(bottom: 12),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white24, width: 1),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text("${index + 1}",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white)),
                          const SizedBox(width: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(item["image"],
                                width: 60, height: 80, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item["name"],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                const SizedBox(height: 4),
                                Text(item["category"],
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/icons/dollar-icon.png",
                                      width: 16, height: 16),
                                  const SizedBox(width: 4),
                                  Text(item["price"],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              ),
                              if (item["change"] != 0)
                                Text(
                                  "${item["change"]}%",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: (item["change"] as num) > 0
                                        ? Colors.greenAccent
                                        : Colors.redAccent,
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Footer placeholder
            Container(
                height: 100,
                // color: Colors.black26,
                alignment: Alignment.center,
                child: const Footer())
          ],
        ),
      ),
    );
  }
}
