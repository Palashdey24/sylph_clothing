import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:sylph_clothing/presentation/config/assets/app_asset.dart';
import 'package:sylph_clothing/presentation/config/theme/app_color.dart';
import 'package:sylph_clothing/presentation/config/theme/app_font.dart';
import 'package:sylph_clothing/presentation/config/utility/string/app_string.dart';
import 'package:sylph_clothing/presentation/core/dimensions/app_gap.dart';
import 'package:sylph_clothing/presentation/core/dimensions/phone_size.dart';
import 'package:sylph_clothing/presentation/core/widgets/button/back_custom_button_core.dart';

final socialNetwork = [
  FontAwesomeIcons.facebook,
  FontAwesomeIcons.twitter,
  FontAwesomeIcons.googlePlay
];

class ProductDetailsUpper extends StatelessWidget {
  const ProductDetailsUpper({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneWidth = PhoneSize.deviceWidth(context);
    final phoneHeight = PhoneSize.deviceHeight(context);
    return Stack(
      children: [
        // + This container show the product Image
        Container(
          margin: EdgeInsets.zero,
          height: phoneHeight / 2,
          width: phoneWidth,
          decoration: const BoxDecoration(
            color: AppColor.kLightColor,
            border: Border(bottom: BorderSide(color: AppColor.kLightColor)),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppGap.largeGap * 2.5),
            ),
          ),
          child: FractionallySizedBox(
            widthFactor: 0.7,
            child: CachedNetworkImage(
                fit: BoxFit.fitWidth,
                imageUrl:
                    "https://purepng.com/public/uploads/large/purepng.com-t-shirtt-shirtfabrict-shapegramnets-1421526429424bmxrh.png"),
          ),
        ),

        // + its is for Company Social account

        Positioned(
          bottom: AppGap.mediumGap,
          right: AppGap.normalGap,
          child: Row(
            children: [
              for (final social in socialNetwork)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FaIcon(
                    social,
                  ),
                ),
            ],
          ),
        ),

        // + its is for position text for company branding

        Positioned(
          top: AppGap.largeGap * 2,
          right: AppGap.normalGap,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(AppAssets.appLogo),
              ),
              const Gap(AppGap.normalGap),
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  AppString.kAppName,
                  style: AppFont.bodyMedium(context)
                      .copyWith(color: AppColor.kPrimaryColor),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          top: 0,
          left: AppGap.normalGap,
          child: RotatedBox(
            quarterTurns: 1,
            child: Text(
              "Premium Editions",
              textAlign: TextAlign.center,
              style: AppFont.bodyMedium(context)
                  .copyWith(color: AppColor.kSecondColor),
            ),
          ),
        ),

        // + it is for position btn for Back and wishlist

        Positioned(
          top: AppGap.normalGap,
          child: SizedBox(
            width: phoneWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackCustomButtonCore(
                  circleRadius: 20,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      size: 35,
                      FontAwesomeIcons.gratipay,
                      color: AppColor.kDarkColor,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
