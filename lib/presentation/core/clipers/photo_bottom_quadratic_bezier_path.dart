import 'package:flutter/material.dart';

class PhotoBottomQuadraticBezierPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    path.lineTo(0, 0);

    // ! Below lines for create bezier path
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width * 0.5, 200, size.width, size.height - 200);
    path.addArc(
        Rect.fromCircle(center: Offset(size.width, size.height), radius: 23),
        0,
        0);
    path.lineTo(size.width, 0);
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
