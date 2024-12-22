import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';

class BarIconItem extends StatelessWidget {
  const BarIconItem(
      {super.key,
      required this.curves,
      required this.navIcon,
      required this.navFn,
      required this.navIndex,
      required this.selIndex,
      required this.barString});

  final Curve curves;
  final int navIndex;
  final int selIndex;
  final IconData navIcon;
  final String barString;
  final void Function() navFn;

  @override
  Widget build(BuildContext context) {
    Color onNavSelCol = Colors.white;
    Color onNavUnSelCol = Colors.grey;
    return GestureDetector(
      onTap: navFn,
      child: AnimatedScale(
        duration: const Duration(seconds: 1),
        scale: navIndex == selIndex ? 1.15 : 1,
        curve: curves,
        child: Container(
          color: Colors.transparent,
          height: 60,
          width: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                navIcon,
                color: navIndex == selIndex ? onNavSelCol : onNavUnSelCol,
                size: 25,
              ),
              const Gap(5),
              Text(
                barString,
                style: AppFont.bodySmall(context)
                    .copyWith(color: AppColor.kSecondColor),
              ),
              const Gap(5),
            ],
          ),
        ),
      ),
    );
  }
}
