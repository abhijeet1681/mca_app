import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import the Splash Screen

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Start with SplashScreen
    );
  }
}

