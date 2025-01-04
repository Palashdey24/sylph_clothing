import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';

class BackCustomButtonCore extends StatelessWidget {
  const BackCustomButtonCore({super.key, this.circleRadius, this.onBack});

  final double? circleRadius;
  final void Function()? onBack;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBack ??
          () {
            Navigator.pop(context);
          },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
            radius: circleRadius ?? 15,
            backgroundColor: AppColor.kDarkColor,
            child: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: AppColor.kPrimaryColor,
              size: 15,
            )),
      ),
    );
  }
}
