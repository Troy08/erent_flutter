import 'package:flutter/material.dart';

class SearchPageScreen extends StatefulWidget {
  const SearchPageScreen({super.key});

  @override
  State<SearchPageScreen> createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {
  final TextEditingController _controller = TextEditingController();
  String query = "";

  final List<Map<String, dynamic>> items = List.generate(10, (i) {
    return {
      "name": "Pokemon Barraskewda ${i + 1}",
      "id": "#5638${i}",
      "price": (10.0 + i).toStringAsFixed(2),
      "img": "assets/cards/lease-card.png",
      "bought": "${10 + i}+ bought",
    };
  });

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map<String, dynamic> && args.containsKey('query')) {
      final passed = (args['query'] as String).trim();
      _controller.text = passed;
      setState(() {
        query = passed;
      });
    }
  }

  List<Map<String, dynamic>> get filteredItems {
    if (query.isEmpty) {
      return items;
    }
    return items.where((item) {
      final nameLower = (item['name'] as String).toLowerCase();
      return nameLower.contains(query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final listToShow = filteredItems;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFF1E0036),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.white70, size: 22),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          onChanged: (v) => setState(() {
                            query = v;
                          }),
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.white54),
                          ),
                          textInputAction: TextInputAction.search,
                          onSubmitted: (v) {
                            // Optional: pressing enter triggers filtering navigation if you want:
                            // Navigator.pushNamed(context, "/sublease", arguments: {"query": v});
                          },
                        ),
                      ),
                      if (query.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            _controller.clear();
                            setState(() {
                              query = "";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white24, width: 1),
                            ),
                            child: const Icon(Icons.close, color: Colors.white70, size: 18),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: listToShow.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.58,
                  ),
                  itemBuilder: (context, index) {
                    final item = listToShow[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/leaseDetail", arguments: {
                          "item": item
                        });
                      },
                      borderRadius: BorderRadius.circular(22),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF31104E),
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.35),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(14),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  item["img"],
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                              child: Text(
                                item["name"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                              child: Text(
                                item["id"],
                                style: const TextStyle(color: Colors.white54, fontSize: 14),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.monetization_on,
                                          color: Colors.purpleAccent, size: 18),
                                      const SizedBox(width: 4),
                                      Text(
                                        item["price"],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    item["bought"],
                                    style: const TextStyle(color: Colors.white54, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
