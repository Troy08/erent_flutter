import 'package:flutter/material.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void _editAddress(BuildContext context) {
    Navigator.pushNamed(context, '/editShippingAddress');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => _goBack(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              Color(0xFF3A0066), // lighter center
              Color(0xFF1F003D),
              Color(0xFF1A0033),
              Color(0xFF0F0020), // darker edges
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            // Title + Edit button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Shipping Address",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () => _editAddress(context),
                  child: Image.asset(
                    'assets/icons/editOutlined.png',
                    width: 28,
                    height: 28,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Address Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _Field(label: "Street Address", value: "7500 Gateway Blvd"),
                  _Field(label: "City", value: "Newark"),
                  _Field(label: "State", value: "CA"),
                  _Field(label: "Zip Code", value: "94560"),
                  _Field(label: "Country", value: "United States"),
                ],
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "Your updated address will be applied to your next order.\n"
              "If you want to change address for current order, please contact customer service:",
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Color(0xFFBBBBBB),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "helloerent@gmail.com",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF8AB4F8),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final String value;
  const _Field({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFFBBBBBB),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
