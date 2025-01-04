import 'package:flutter/material.dart';

class SignInTriPathRight extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.5, size.height * 0.5);
    // path.lineTo(size.width * 0.55, size.height * 0.6);
    path.lineTo(size.width * 0.7, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<dynamic> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
