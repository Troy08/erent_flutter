import 'package:flutter/material.dart';

class PropertyGrid extends StatelessWidget {
  const PropertyGrid({super.key});

  final List<Map<String, String>> propsList = const [
    {"label": "Environment", "value": "Altostratus Clouds"},
    {"label": "Body", "value": "Nudity"},
    {"label": "Chin Elements", "value": "None"},
    {"label": "Costumes", "value": "Polo T-shirt"},
    {"label": "Eye", "value": "Red White Eye"},
    {"label": "Eyebrows", "value": "Thin"},
    {"label": "Middle Ground", "value": "None"},
    {"label": "Mouths", "value": "Smiley"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Properties",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: propsList
              .map(
                (item) => Container(
                  width: 150,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["label"]!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF9747FF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item["value"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
