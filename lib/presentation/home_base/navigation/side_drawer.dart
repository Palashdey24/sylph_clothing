import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/data/local_data/category_data.dart';
import 'package:sylph_clothing/presentation/bucket_list/bucket_list_page.dart';
import 'package:sylph_clothing/presentation/config/assets/app_asset.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/config/utility/string/app_string.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/navigator/app_navigator.dart';
import 'package:sylph_clothing/presentation/order/orders_page.dart';
import 'package:sylph_clothing/presentation/user_account/account_page.dart';

final sideHorizontalTab = [
  {
    "tabTittle": "order",
    "tabIcon": FontAwesomeIcons.truckFast,
    "tabPage": const OrdersPage()
  },
  {
    "tabTittle": "Bucket List",
    "tabIcon": FontAwesomeIcons.bucket,
    "tabPage": const BucketListPage()
  },
  {
    "tabTittle": "Account",
    "tabIcon": FontAwesomeIcons.userSecret,
    "tabPage": const AccountPage()
  },
];

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final double phoneHeight = PhoneSize.deviceHeight(context);
    final double phoneWidth = PhoneSize.deviceWidth(context);

    return Container(
      margin: EdgeInsets.zero,
      width: phoneWidth * 0.5,
      height: phoneHeight,
      padding: const EdgeInsets.only(bottom: AppGap.largeGap * 2),
      decoration: const BoxDecoration(
          color: AppColor.kDarkColor, borderRadius: BorderRadius.zero),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 3,
            child: ListView(
              children: [
                const Gap(AppGap.largeGap),
                Text(
                  "  Categories",
                  textAlign: TextAlign.start,
                  style: AppFont.bodyMedium(context)
                      .copyWith(color: AppColor.kPrimaryColor),
                ),
                const Gap(AppGap.mediumGap),
                for (final genericCat in genericCategoryData)
                  ExpansionTile(
                    title: Text(
                      genericCat.genericName,
                      style: AppFont.bodyMedium(context)
                          .copyWith(color: AppColor.kLightColor),
                    ),
                    children: [
                      for (final categories in genericCat.category)
                        Column(
                          children: [
                            const Gap(AppGap.mediumGap),
                            Text(
                              categories,
                              style: AppFont.bodySmall(context)
                                  .copyWith(color: AppColor.kPrimaryColor),
                            ),
                          ],
                        ),
                      const Gap(AppGap.mediumGap),
                    ],
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppGap.mediumGap),
              height: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ListView(
                children: [
                  for (var sideTab in sideHorizontalTab)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ListTile(
                        onTap: () {
                          AppNavigator.navigatorPush(
                              context, sideTab["tabPage"] as Widget);
                        },
                        titleAlignment: ListTileTitleAlignment.threeLine,
                        title: Text(
                          sideTab['tabTittle'].toString(),
                          textAlign: TextAlign.left,
                          style: AppFont.bodyMedium(context)
                              .copyWith(color: AppColor.kPrimaryColor),
                        ),
                        leading: FaIcon(sideTab["tabIcon"] as IconData),
                      ),
                    ),
                  const Gap(AppGap.mediumGap),
                  const CircleAvatar(
                    backgroundImage: AssetImage(AppAssets.appLogo),
                    radius: 50,
                  ),
                  const Gap(AppGap.normalGap),
                  Text(
                    AppString.kAppName,
                    textAlign: TextAlign.center,
                    style: AppFont.bodySmall(context)
                        .copyWith(color: AppColor.kLightColor),
                  ),
                  Text(
                    "Version 1.0.1",
                    textAlign: TextAlign.center,
                    style: AppFont.bodySmall(context)
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
