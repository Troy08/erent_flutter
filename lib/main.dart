import 'package:erent_flutter/screens/home/home_screen.dart';
import 'package:erent_flutter/screens/login/login_screen.dart';
import 'package:erent_flutter/screens/scan/scan_screen.dart';
import 'package:erent_flutter/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Erent Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // choose your start screen here:
      initialRoute: '/home', // or '/home', '/signup', etc.
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/scan-card': (context) => const ScanScreen(),
      },
    );
  }
}
