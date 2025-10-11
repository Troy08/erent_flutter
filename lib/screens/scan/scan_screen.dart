import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  Future<void> _takePhoto(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    try {
      // Open the camera
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);

      if (photo != null) {
        // Navigate to scanning screen with the photo path
        Navigator.pushNamed(
          context,
          '/scanning',
          arguments: photo.path,
        );
      } else {
        // User cancelled
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No photo captured')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: null,
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
            bottom: 60,
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
        padding: EdgeInsets.zero,
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
          height: double.infinity,
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
