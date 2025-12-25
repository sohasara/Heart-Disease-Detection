import 'package:flutter/material.dart';
import 'package:heart_dis/screens/home_screen.dart';

class HeartPulse extends StatefulWidget {
  const HeartPulse({super.key});

  @override
  State<HeartPulse> createState() => _HeartPulseState();
}

class _HeartPulseState extends State<HeartPulse>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _pulseRing(0),
          _pulseRing(0.3),

          // Center heart
          Container(
            padding: const EdgeInsets.all(22),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF00A896),
            ),
            child: const Icon(Icons.favorite, size: 36, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _pulseRing(double delay) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = (_controller.value + delay) % 1.0;

        return Transform.scale(
          scale: 0.7 + progress,
          child: Opacity(
            opacity: (1 - progress).clamp(0.0, 1.0),
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF00A896).withOpacity(0.18),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class EcgLine extends StatelessWidget {
  const EcgLine({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(140, 30), painter: _EcgPainter());
  }
}

class _EcgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00A896)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width * 0.25, size.height / 2)
      ..lineTo(size.width * 0.35, size.height * 0.2)
      ..lineTo(size.width * 0.45, size.height * 0.8)
      ..lineTo(size.width * 0.55, size.height / 2)
      ..lineTo(size.width, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
////////////////////////////////////

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white, // ✅ WHITE BACKGROUND
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              HeartPulse(),

              SizedBox(height: 28),

              Text(
                "CardioCare AI",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF006D5B),
                ),
              ),

              SizedBox(height: 6),

              Text(
                "Early detection. Better heart health.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              SizedBox(height: 20),

              EcgLine(),

              SizedBox(height: 40),

              Text(
                "Tap anywhere to continue",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
