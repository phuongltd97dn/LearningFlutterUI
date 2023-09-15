import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Example: Size is width 100, height 100
    // Draw a line from (0,0) to (0, 80)
    path.lineTo(0, 4 * size.height / 5);

    // From (0,80) -> Draw a curve based on 3 points (0,80), (25, 100) and (50, 80)
    Offset curvePoint1 = Offset(size.width / 4, size.height);
    Offset centerPoint1 = Offset(size.width / 2, 4 * size.height / 5);
    path.quadraticBezierTo(
      curvePoint1.dx,
      curvePoint1.dy,
      centerPoint1.dx,
      centerPoint1.dy,
    );

    // From (50,80) -> Draw a curve based on 3 points (50,80), (75, 60) and (100, 80)
    Offset curvePoint2 = Offset(size.width / 4 * 3, size.height / 5 * 3);
    Offset endPoint = Offset(size.width, size.height / 5 * 4);
    path.quadraticBezierTo(
      curvePoint2.dx,
      curvePoint2.dy,
      endPoint.dx,
      endPoint.dy,
    );

    // From (100,80) -> Draw a line from (100,80) to (100,0)
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
