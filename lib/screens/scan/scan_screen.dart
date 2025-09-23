import 'package:flutter/material.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  Future<void> _takePhoto(BuildContext context) async {
    // Stubbed function since image_picker is removed
    // For now, just navigate directly without picking an image
    Navigator.pushNamed(
      context,
      '/scanning',
      arguments: "dummy_photo_path.jpg", // placeholder
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // background flows behind AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
          // ensures vertical centering
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1), // subtle background
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero, // removes internal padding
              icon: const Icon(Icons.arrow_back_ios_new,
                  color: Colors.white, size: 18),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          // Background image + gradient
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/scan.png"),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(25, 1, 40, 0.6),
                  Color.fromRGBO(10, 1, 15, 0.9),
                ],
              ),
            ),
          ),

          // Centered content
          Column(
            children: [
              const SizedBox(height: 147),
              const Center(
                child: Text(
                  "Snap a Photo.\nGet a valuation in 24-hours.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),

          // Button fixed at bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 60, // margin from bottom
            child: Center(
              child: SizedBox(
                width: 315,
                height: 50,
                child: _TakePhotoButton(
                  onPressed: () => _takePhoto(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TakePhotoButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _TakePhotoButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero, // remove extra padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9C3FE4), Color(0xFFC65647)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity, // fill the SizedBox height
          child: const Text(
            "Take a Photo",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
