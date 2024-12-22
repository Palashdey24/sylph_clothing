import 'package:flutter/material.dart';

class ProductItemCliper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.5);
    // path.lineTo(size.width * 0.55, size.height * 0.6);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<dynamic> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
