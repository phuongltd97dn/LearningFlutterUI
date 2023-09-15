import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    /** My practice */
    /*
    path.lineTo(0, size.height / 5 * 3.5);

    Offset curvePoint1 = Offset(size.width / 8, size.height / 5 * 3.75);
    Offset centerPoint = Offset(size.width / 2, size.height / 5 * 4);
    path.quadraticBezierTo(
      curvePoint1.dx,
      curvePoint1.dy,
      centerPoint.dx,
      centerPoint.dy,
    );

    Offset curvePoint2 = Offset(size.width / 8 * 7, size.height / 5 * 3.75);
    Offset endPoint = Offset(size.width, size.height / 5 * 3.5);
    path.quadraticBezierTo(
      curvePoint2.dx,
      curvePoint2.dy,
      endPoint.dx,
      endPoint.dy,
    );

    path.lineTo(size.width, 0);
    */

    path.lineTo(0, size.height / 5 * 4);

    Offset curvePoint = Offset(size.width / 2, size.height);
    Offset endPoint = Offset(size.width, size.height / 5 * 4);
    path.quadraticBezierTo(
      curvePoint.dx,
      curvePoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
