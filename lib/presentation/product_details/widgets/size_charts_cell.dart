import 'package:flutter/material.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';

class SizeChartsCell extends StatelessWidget {
  const SizeChartsCell(
      {super.key, this.cellText, this.cellBoxColor, this.cellAngle});

  final String? cellText;
  final Color? cellBoxColor;
  final double? cellAngle;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: cellBoxColor ?? AppColor.kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppGap.mediumGap),
        child: Transform.rotate(
          angle: cellAngle ?? 0,
          child: Text(
            cellText ?? "N/A",
            textAlign: TextAlign.center,
            softWrap: true,
            style: AppFont.bodyMedium(context).copyWith(),
          ),
        ),
      ),
    );
  }
}
