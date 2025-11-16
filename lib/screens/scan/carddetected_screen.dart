import 'package:flutter/material.dart';

class CardsDetectedScreen extends StatefulWidget {
  const CardsDetectedScreen({super.key});

  @override
  State<CardsDetectedScreen> createState() => _CardsDetectedScreenState();
}

class _CardsDetectedScreenState extends State<CardsDetectedScreen> {
  // Mock data
  final List<Map<String, dynamic>> items = [
    {
      "name": "Eevee",
      "subtitle": "Pokemon",
      "img": "assets/cards/pokemon-eevee.png",
      "value": 355.02,
      "selected": true,
    },
    {
      "name": "Ethan’s Ho-Oh",
      "subtitle": "Pokemon",
      "img": "assets/cards/pokemon-hooh.png",
      "value": 20.82,
      "selected": false,
    },
    {
      "name": "Captain Pikachu",
      "subtitle": "Pokemon",
      "img": "assets/cards/pokemon-pikachu-captain.png",
      "value": 20987.77,
      "selected": false,
    },
    // … add others
  ];

  double get totalValue {
    return items
        .where((it) => it["selected"] == true)
        .fold(0.0, (sum, it) => sum + (it["value"] as double));
  }

  void _toggleSelected(int index) {
    setState(() {
      items[index]["selected"] = !(items[index]["selected"] as bool);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E0036),
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
  title: const Text(
    "Cards Detected",
    style: TextStyle(
      color: Colors.white,     // <--- make title white
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
),

      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Attached are the cards we detected, with up-to-date value available.",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final it = items[index];
                final selected = it["selected"] as bool;
                return InkWell(
                  onTap: () => _toggleSelected(index),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF31104E),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      children: [
                        // Checkbox/Circle indicator
                        Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white38, width: 2),
                            color: selected ? Colors.purpleAccent : Colors.transparent,
                          ),
                          child: selected
                              ? const Icon(Icons.check, color: Colors.white, size: 16)
                              : null,
                        ),
                        const SizedBox(width: 8),
                        // Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            it["img"],
                            width: 48,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Name + subtitle
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                it["name"] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                it["subtitle"] as String,
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Value
                        Text(
                          "\$${(it["value"] as double).toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Fixed bottom bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1A0033),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Value",
                        style: TextStyle(color: Colors.white54, fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$${totalValue.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // handle next button press
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    backgroundColor: Colors.purpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
