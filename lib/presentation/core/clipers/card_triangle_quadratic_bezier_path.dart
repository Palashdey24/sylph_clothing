import 'package:flutter/material.dart';

class CardTriangleQuadraticBezierPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    path.lineTo(0, 0);

    // ! This below 3 line for creating triangle shape in bottom card
    path.lineTo(0, size.height * 0.85);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height * 0.85);

    // ! Below lines for create bezier path
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width / 2, 100, 0, 0);
    // path.lineTo(size.width * 0.55, size.height * 0.6);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
