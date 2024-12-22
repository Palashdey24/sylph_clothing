import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/assets/app_asset.dart';

import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';
import 'package:sylph_clothing/presentation/user_account/account_page.dart';

class TopBarWidgets extends StatelessWidget {
  const TopBarWidgets({super.key, required this.iconWidgets});
  final Widget iconWidgets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppGap.normalGap,
          right: AppGap.normalGap,
          top: AppGap.normalGap),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          iconWidgets,
          Image.asset(
            AppAssets.appFlash,
            color: AppColor.kDarkColor,
            width: 60,
            height: 60,
          ),
          GestureDetector(
            onTap: () =>
                AppNavigator.navigatorPush(context, const AccountPage()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hi, Guest",
                  textAlign: TextAlign.center,
                  style: AppFont.bodySmall(context),
                ),
                const Gap(AppGap.normalGap),
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColor.kLightColor,
                  child: FaIcon(
                    FontAwesomeIcons.userLarge,
                    size: 15,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
