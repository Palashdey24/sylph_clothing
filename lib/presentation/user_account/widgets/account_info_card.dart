import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/assets/app_asset.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';
import 'package:sylph_clothing/presentation/profile/profile_page.dart';

class AccountInfoCard extends StatelessWidget {
  const AccountInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      height: PhoneSize.deviceHeight(context) * 0.35,
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
      child: Padding(
        padding:
            const EdgeInsets.only(top: AppGap.normalGap, left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Image.asset(
                      AppAssets.appLogo,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "User Name",
                          textAlign: TextAlign.start,
                          style: AppFont.bodyLarge(context).copyWith(
                              fontSize: 20, color: AppColor.kPrimaryColor),
                        ),
                        const Gap(5),
                        Text(
                          "user@gmail.com",
                          textAlign: TextAlign.start,
                          style: AppFont.bodySmall(context)
                              .copyWith(color: AppColor.kLightColor),
                        ),
                        const Gap(5),
                        Text(
                          "৳ 0.0",
                          textAlign: TextAlign.start,
                          style: AppFont.bodyMedium(context)
                              .copyWith(color: AppColor.kSecondColor),
                        ),
                        const Gap(5),
                        Text(
                          "1 order",
                          textAlign: TextAlign.start,
                          style: AppFont.bodyMedium(context)
                              .copyWith(color: AppColor.kSecondColor),
                        ),
                        const Gap(AppGap.normalGap),
                      ],
                    ),
                  ),
                ]),
            GestureDetector(
              onTap: () =>
                  AppNavigator.navigatorPush(context, const ProfilePage()),
              child: Card(
                color: AppColor.kDarkColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppGap.normalGap)),
                margin:
                    const EdgeInsets.symmetric(horizontal: AppGap.largeGap * 3),
                elevation: AppGap.normalGap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5, vertical: AppGap.normalGap),
                  child: Text(
                    "Edit Profile",
                    textAlign: TextAlign.center,
                    style: AppFont.bodyMedium(context)
                        .copyWith(color: AppColor.kPrimaryColor, fontSize: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
