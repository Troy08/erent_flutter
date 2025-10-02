import 'package:flutter/material.dart';

class RedeemScreen extends StatelessWidget {
  const RedeemScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              color: Colors.white.withOpacity(0.1), // round gray bg
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: Colors.white, size: 18),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF1A0033),
      body: Stack(
        children: [
          // Purple Glow Background (right side)
          Align(
            alignment: Alignment.centerRight,
            child: Transform.translate(
              offset: const Offset(10, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF9B40FF).withOpacity(0.2),
                      Colors.transparent,
                    ],
                    radius: 0.9,
                  ),
                  borderRadius: BorderRadius.circular(200),
                ),
              ),
            ),
          ),

          // Form
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60), // leave space for appBar button

                  // Title
                  const Text(
                    "Redeem My Card",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Input Fields
                  _buildTextField("Receiver Name"),
                  _buildTextField("Phone Number"),
                  _buildTextField("Street Address"),
                  _buildTextField("Street Address (Optional)"),
                  _buildTextField("City"),

                  Row(
                    children: [
                      Expanded(child: _buildTextField("State")),
                      const SizedBox(width: 12),
                      Expanded(child: _buildTextField("Zip Code")),
                    ],
                  ),
                  const SizedBox(height: 15),

                  _buildDropdown("Country"),

                  const SizedBox(height: 30),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF9B40FF), Color(0xFFFF4D5F)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // TODO: Add action
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
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

  // Custom TextField
  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white.withOpacity(0.07),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Custom Dropdown
  Widget _buildDropdown(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField<String>(
        dropdownColor: const Color(0xFF1A0033),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
        items: const [
          DropdownMenuItem(value: "USA", child: Text("USA")),
          DropdownMenuItem(value: "India", child: Text("India")),
          DropdownMenuItem(value: "Canada", child: Text("Canada")),
        ],
        onChanged: (value) {},
      ),
    );
  }
}
