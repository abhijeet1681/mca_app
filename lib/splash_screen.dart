import 'package:flutter/material.dart';
import 'home.dart'; // Import HomePage

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation controller for scaling effect
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4), // Animation duration
    );

    // Zoom-out to zoom-in effect
    _animation = Tween<double>(begin: 1.0, end: 4.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut, // Smooth transition
      ),
    );

    // Start the animation
    _animationController.forward();

    // Navigate to Home Screen after animation completes
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Navigate to HomePage
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value, // Apply scaling effect
              child: Image.asset('assets/images/logo3.0.png', width: 150, height: 150), // Your logo
            );
          },
        ),
      ),
    );
  }
}
