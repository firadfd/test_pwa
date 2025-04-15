import 'package:flutter/material.dart';

class TicketShapeBorder extends ShapeBorder {
  final BorderRadius borderRadius;
  final double notchRadius;

  const TicketShapeBorder({
    this.borderRadius = BorderRadius.zero,
    this.notchRadius = 10,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();

    final notchX = rect.left + (rect.width * 0.75); // 3/4 horizontal position

    // Start from top-left
    path.moveTo(rect.left + borderRadius.topLeft.x, rect.top);

    // Top-left corner
    path.arcToPoint(
      Offset(rect.left, rect.top + borderRadius.topLeft.y),
      radius: borderRadius.topLeft,
      clockwise: false,
    );

    // Left side
    path.lineTo(rect.left, rect.bottom - borderRadius.bottomLeft.y);

    // Bottom-left corner
    path.arcToPoint(
      Offset(rect.left + borderRadius.bottomLeft.x, rect.bottom),
      radius: borderRadius.bottomLeft,
      clockwise: false,
    );

    // Bottom side until notch
    path.lineTo(notchX - notchRadius, rect.bottom);
    path.arcToPoint(
      Offset(notchX + notchRadius, rect.bottom),
      radius: Radius.circular(notchRadius),
      clockwise: true,
    );

    // Continue to bottom-right
    path.lineTo(rect.right - borderRadius.bottomRight.x, rect.bottom);

    // Bottom-right corner
    path.arcToPoint(
      Offset(rect.right, rect.bottom - borderRadius.bottomRight.y),
      radius: borderRadius.bottomRight,
      clockwise: false,
    );

    // Right side up
    path.lineTo(rect.right, rect.top + borderRadius.topRight.y);

    // Top-right corner
    path.arcToPoint(
      Offset(rect.right - borderRadius.topRight.x, rect.top),
      radius: borderRadius.topRight,
      clockwise: false,
    );

    // Top edge until notch
    path.lineTo(notchX + notchRadius, rect.top);
    path.arcToPoint(
      Offset(notchX - notchRadius, rect.top),
      radius: Radius.circular(notchRadius),
      clockwise: true,
    );

    // Finish back to start
    path.lineTo(rect.left + borderRadius.topLeft.x, rect.top);

    return path..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      Path()..addRect(rect);
}
