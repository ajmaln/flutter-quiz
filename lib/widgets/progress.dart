import 'dart:math';
import 'package:flutter/material.dart';


class Progress extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  Progress({
    this.lineColor,
    this.completeColor,
    this.completePercent,
    this.width,
  });

  final Gradient gradient = new LinearGradient(
    colors: <Color>[
      Colors.red,
      Colors.orange,
    ],
  );

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    final rect = new Rect.fromCircle(center: center, radius: radius);

    Paint line = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, convertRadiusToSigma(6))
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..shader = gradient.createShader(rect)
      ..strokeWidth = width;

    double arcAngle = 2 * pi * (completePercent / 100);
    canvas.drawArc(rect, -pi / 2, arcAngle, false, line);
    canvas.drawArc(rect, -pi / 2, arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}