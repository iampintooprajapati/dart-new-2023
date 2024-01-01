import 'package:flutter/material.dart';
import 'dart:math';

class CircleProgress extends CustomPainter {
  final strokeCircle = 50.0;
  double circleProgress;
  CircleProgress(this.circleProgress);
  @override
  void paint(Canvas canvas, Size size) {
    // draw  circle
    Paint circle = Paint()
      ..strokeWidth = strokeCircle
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 120;
    canvas.drawCircle(center, radius, circle);

    // i will draw animation
    Paint animationArc = Paint()
      ..strokeWidth = strokeCircle
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (circleProgress / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2,
        angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
