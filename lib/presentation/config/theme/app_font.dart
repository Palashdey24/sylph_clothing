import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';

class AppFont {
  static TextStyle bodyLarge(BuildContext context) {
    double width = PhoneSize.deviceWidth(context);
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontSize: width < 800 ? 20 : (width < 1000 ? 25 : 30),
        fontWeight: FontWeight.bold);
  }

  static TextStyle bodyMedium(BuildContext context) {
    double width = PhoneSize.deviceWidth(context);
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: width < 800 ? 10 : (width < 1000 ? 15 : 20),
        fontWeight: FontWeight.bold);
  }

  static TextStyle bodySmall(BuildContext context) {
    double width = PhoneSize.deviceWidth(context);
    return Theme.of(context).textTheme.bodySmall!.copyWith(
        fontSize: width < 800 ? 8 : (width < 1000 ? 10 : 15),
        fontWeight: FontWeight.bold);
  }

  static const TextStyle exampleText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 10,
    color: Colors.white,
  );
}
