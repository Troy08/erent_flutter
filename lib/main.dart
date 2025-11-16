import 'package:erent_flutter/screens/deliveryoptions/confirmation_screen.dart';
import 'package:erent_flutter/screens/deliveryoptions/deliveryOptions_screen.dart';
import 'package:erent_flutter/screens/footer/footer.dart';
import 'package:erent_flutter/screens/leasedetail/sublease/sublease_screen.dart';
import 'package:erent_flutter/screens/redeemform/redeemForm_screen.dart';
import 'package:erent_flutter/screens/shippingAddress/editAddress_screen.dart';
import 'package:erent_flutter/screens/shippingAddress/shippingAddress_screen.dart';
import 'package:flutter/material.dart';
import 'package:erent_flutter/screens/home/home_screen.dart';
import 'package:erent_flutter/screens/profile/profile_screen.dart';
import 'package:erent_flutter/screens/scan/scan_screen.dart';
import 'package:erent_flutter/screens/login/login_screen.dart';
import 'package:erent_flutter/screens/signup/signup_screen.dart';
import 'package:erent_flutter/screens/leasedetail/leasedetail_screen.dart';
import 'package:erent_flutter/screens/leasedetail/detailpage/detailpage_screen.dart';
import 'package:erent_flutter/screens/leasedetail/leasebuyout/leasebuyout_screen.dart';
import 'package:erent_flutter/screens/deliveryoptions/confirmation_screen.dart';
import 'package:erent_flutter/screens/searchScreen/searchPage_Screen.dart';
import 'package:erent_flutter/screens/scan/carddetected_screen.dart';
import 'package:erent_flutter/screens/leasedetail/leasebuyout/leaseplaced_screen.dart';


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
      home: const MainScreen(), // 👈 central screen with footer
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/leaseDetail': (context) => const DetailPageScreen(),
        '/shippingAddress': (context) => const ShippingAddressScreen(),
        '/editShippingAddress': (context) => const EditShippingAddressScreen(),
        '/redeemForm': (context) => const RedeemScreen(),
        '/confirmation': (context) => const ConfirmationScreen(),
        '/sublease': (context) => const SubLeaseScreen(),
        '/buyoutDetail': (context) => const BuyoutScreen(),
        '/orderConfirmation': (context) => const ConfirmationScreen(),
        '/searchPage': (context) => const SearchPageScreen(),
        '/cardsDetected': (context) => const CardsDetectedScreen(),
        '/leasePlaced': (context) => const LeasePlacedScreen(),
      },
    );
  }
}

/// Central screen with footer + tabs
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    Placeholder(color: Colors.orange), // Tools screen placeholder
    ScanScreen(),
    LeasePageScreen(), // Market screen placeholder
    ProfileScreen(),
  ];

  final List<String> _routes = [
    '/home',
    '/tools',
    '/scan',
    '/lease-detail',
    '/profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      body: IndexedStack(
        // keeps state alive
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Footer(
        currentRoute: _routes[_currentIndex],
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
