import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/assets/app_asset.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';

class ProfileTopSection extends StatelessWidget {
  const ProfileTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(AppGap.largeGap),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Stack(
            children: [
              Image.asset(height: 120, width: 120, AppAssets.appLogo),
              Positioned(
                  bottom: 0,
                  right: AppGap.normalGap,
                  child: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.camera,
                        color: AppColor.kDarkColor,
                      )))
            ],
          ),
        ),
        const Gap(AppGap.normalGap),
        Text(
          "User Name",
          textAlign: TextAlign.center,
          style: AppFont.bodyLarge(context).copyWith(
            fontSize: 20,
          ),
        ),
        const Gap(5),
        Text(
          "example@gmail.com",
          textAlign: TextAlign.center,
          style: AppFont.bodySmall(context).copyWith(),
        ),
        const Gap(AppGap.largeGap),
        const Divider(
          thickness: 3,
        ),
      ],
    );
  }
}
