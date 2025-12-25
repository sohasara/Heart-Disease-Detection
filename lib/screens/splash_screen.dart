import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      ),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.teal.withOpacity(0.15),
                ),
                child: const Icon(
                  Icons.favorite,
                  size: 64,
                  color: Color(0xFF00A896),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "CardioCare AI",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Early detection. Better heart health.",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 32),
              const Icon(Icons.monitor_heart, color: Colors.teal),
              const SizedBox(height: 40),
              const Text(
                "Tap anywhere to continue",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
