import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/config/assets/app_asset.dart';

class CardLogoCore extends StatelessWidget {
  const CardLogoCore({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: ClipRect(
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
            width: 105, height: 105, fit: BoxFit.contain, AppAssets.appLogo),
      ),
    );
  }
}
