import 'package:flutter/material.dart';

class TriPath extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width * 0.55, size.height * 0.6);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<dynamic> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
