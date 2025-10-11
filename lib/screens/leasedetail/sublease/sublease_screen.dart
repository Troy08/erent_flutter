import 'package:flutter/material.dart';

class SubLeaseScreen extends StatefulWidget {
  const SubLeaseScreen({super.key});

  @override
  State<SubLeaseScreen> createState() => _SubLeaseScreenState();
}

class _SubLeaseScreenState extends State<SubLeaseScreen> {
  int? _selectedValue;

  final List<Map<String, dynamic>> leaseOptions = [
    {"price": 18, "duration": "24 hours"},
    {"price": 20, "duration": "7 days"},
    {"price": 24, "duration": "14 days"},
    {"price": 36, "duration": "30 days"},
  ];

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
              // Back Button + Title Row
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    // Back button
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
                    const Spacer(),
                    // Title
                    const Text(
                      "Sub Lease",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 2), // keeps it centered
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Description (centered)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Select from the lease terms below to unlock the price of your Lease.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Current Card Price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/dollar-icon.png", // put your asset image here
                      width: 22,
                      height: 22,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "230.01",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Options
              Expanded(
                child: ListView.separated(
                  itemCount: leaseOptions.length,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  separatorBuilder: (_, __) => const Divider(
                    color: Colors.white24,
                    thickness: 1,
                  ),
                  itemBuilder: (context, index) {
                    final option = leaseOptions[index];
                    return ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/icons/dollar-icon.png", // put your asset image here
                            width: 22,
                            height: 22,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            option["price"].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        option["duration"],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Radio<int>(
                        value: index,
                        groupValue: _selectedValue,
                        activeColor: Colors.purpleAccent,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              // Bottom Bar with Price + Rent Button
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF0F0020),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/dollar-icon.png", // put your asset image here
                          width: 22,
                          height: 22,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _selectedValue != null
                              ? leaseOptions[_selectedValue!]["price"]
                                  .toString()
                              : "---",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: _selectedValue != null
                          ? () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Leased for ${leaseOptions[_selectedValue!]["duration"]}",
                                  ),
                                ),
                              );
                              Navigator.pushNamed(context, "/orderConfirmation");
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF3C0067), // rent button color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Rent",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
