import 'dart:ui';

import 'package:flutter/material.dart';

class DottedTicketPainter extends CustomPainter {
  final ShapeBorder shape;
  final Color color;
  final double dotRadius;
  final double spacing;

  DottedTicketPainter({
    required this.shape,
    this.color = Colors.black12,
    this.dotRadius = 1.5,
    this.spacing = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = shape.getOuterPath(Offset.zero & size);
    final paint = Paint()
      ..color = color
      ..strokeWidth = dotRadius
      ..style = PaintingStyle.stroke;

    // Draw dotted effect using dash segments
    PathMetrics metrics = path.computeMetrics();
    for (final metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final pos = metric.getTangentForOffset(distance);
        if (pos != null) {
          canvas.drawCircle(pos.position, dotRadius, paint);
        }
        distance += spacing;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
