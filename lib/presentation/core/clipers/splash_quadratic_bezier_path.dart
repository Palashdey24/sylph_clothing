import 'package:flutter/material.dart';

class SplashQuadraticBezierPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    path.lineTo(0, 0);

    // ! This below 3 line for creating triangle shape in bottom card
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width, 250, size.width, 0);
    path.lineTo(0, 0);
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
