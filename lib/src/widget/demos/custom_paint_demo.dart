import 'package:covid19/widget/map.dart';
import 'package:flutter/material.dart';

class CustomPaintDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        painter: _CustomPainter(),
      ),
    );
  }
}

/// What will be demo
/// 1. paint.color = Colors.red;
/// 2. ..strokeWidth = 10
/// 3. ClipRect
/// 4. https://fluttershapemaker.com/
/// 5. return MapDemo();
class _CustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    canvas.drawLine(Offset.zero, Offset(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(_CustomPainter oldDelegate) => true;
}

class MapDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MapDemoState();
}

class _MapDemoState extends State<MapDemo> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    );
    controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => MapProgressIndicator(value: controller.value),
    );
  }
}
