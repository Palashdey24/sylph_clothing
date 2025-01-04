import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/domain/model/status_bar_model.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';

class OrderStatusBarItem extends StatelessWidget {
  const OrderStatusBarItem(
      {super.key, required this.selectStatus, required this.statusBar});

  final String selectStatus;
  final StatusBarModel statusBar;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppGap.normalGap,
      margin: const EdgeInsets.all(10),
      color: selectStatus == statusBar.statusTittle
          ? Colors.limeAccent.shade200
          : Colors.black12,
      shadowColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppGap.mediumGap)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppGap.normalGap, horizontal: AppGap.largeGap),
        child: Row(
          children: [
            FaIcon(
              statusBar.statusIcon,
              size: AppGap.mediumGap,
            ),
            const Gap(AppGap.normalGap),
            Text(
              statusBar.statusTittle,
              style: AppFont.bodyMedium(context).copyWith(),
            )
          ],
        ),
      ),
    );
  }
}
