import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';

class AppFont {
  static TextStyle bodyLarge(BuildContext context) {
    double height = PhoneSize.deviceHeight(context);
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontSize: height < 800 ? 20 : 25, fontWeight: FontWeight.bold);
  }

  static TextStyle bodyMedium(BuildContext context) {
    double height = PhoneSize.deviceHeight(context);
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: height < 800 ? 10 : 15, fontWeight: FontWeight.bold);
  }

  static TextStyle bodySmall(BuildContext context) {
    double height = PhoneSize.deviceHeight(context);
    return Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(fontSize: height < 800 ? 8 : 10, fontWeight: FontWeight.bold);
  }

  static const TextStyle exampleText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 10,
    color: Colors.white,
  );
}
