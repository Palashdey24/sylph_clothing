import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';

class AccountInfoTabItems extends StatelessWidget {
  const AccountInfoTabItems(
      {super.key,
      required this.onTab,
      required this.itemTittle,
      required this.itemIcon});
  final void Function() onTab;
  final String itemTittle;
  final IconData itemIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Card(
        color: Colors.blueGrey.shade200,
        margin: const EdgeInsets.symmetric(
            vertical: AppGap.normalGap, horizontal: AppGap.largeGap),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(AppGap.normalGap),
              FaIcon(
                itemIcon,
                color: AppColor.kPrimaryColor,
              ),
              const Gap(AppGap.normalGap),
              Text(
                itemTittle,
                style: AppFont.bodyMedium(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
